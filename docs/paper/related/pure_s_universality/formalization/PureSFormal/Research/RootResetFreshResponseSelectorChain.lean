import PureSFormal.Research.RootResetFreshFuelSelectorChain
import PureSFormal.Research.RootResetFirstResponseSelectorChain
import PureSFormal.Research.RootResetNormalResponseContextChain

/-!
# Response propagation through completed histories

Parsed generated Base and post-C4 boundaries retain selector priority in every
certified mixed completed history. Inside a fresh completed continuation,
the exact pending response context is recovered and historical priorities are
excluded for every unfinished shell. This includes every dispatcher edge.
-/

namespace PureSFormal.Research.RootResetFreshResponseSelectorChain

open PureSFormal.PureS
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetPersistentFuelCarrier
open RootResetPersistentRouteAFuelSchedulerBridge
open RootResetEmptyResponseSelectorChain

/-- A parsed fuel endpoint has the same exact successor in every certified
completed continuation context, including mixed fresh and marked histories. -/
theorem selectStep?_rebuild_of_fuelParsed_of_selected
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat} {endpoint target : Term} {view : View}
    (traversable : RootResetTraversableCompletedParents.TraversableParents
      program dispatcher parents layers)
    (parsed : parse? (compileActions program dispatcher.tree) endpoint = some view)
    (selected : RootResetPersistentResponseSelector.selectStep? program dispatcher endpoint = some target) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (Cursor.rebuild parents endpoint) = some (Cursor.rebuild parents target) := by
  have lifted := selectStep?_rebuild_of_fuelParsed traversable parsed
  have localSelected := selectStep?_rebuild_of_fuelParsed
    (RootResetTraversableCompletedParents.TraversableParents.root
      (program := program) (dispatcher := dispatcher)) parsed
  have targetEq := Option.some.inj (localSelected.symm.trans selected)
  dsimp only [Cursor.rebuild] at targetEq
  rw [targetEq] at lifted
  exact lifted

theorem positiveStageFifth_selectStep_eq_firstC4_under_parents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    (clockRegisters : SchedulerControl.Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : SchedulerInvariant.RegistersCoherent clockRegisters
      phase scanned emptyMode)
    (sampleIndex fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {descentTicks ascentTicks : Nat}
    {parents : List ParentFrame} {layers : Nat}
    (traversable : RootResetTraversableCompletedParents.TraversableParents
      program dispatcher parents layers)
    (trace : SchedulerCycle.PositiveStageFirstResponseTrace program dispatcher
      bit suffix clockRegisters phase scanned emptyMode clockCoherent sampleIndex
      fuel outerContext fullContext innerContext targetContext descentTicks
      ascentTicks) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let pendingParents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    let fifth := SchedulerInvariant.fuelZeroFifthMutationConfiguration
      program dispatcher (SchedulerControl.Registers.newJob program)
      environment continuation pendingParents
    let firstC4 := SchedulerCycle.firstC4Configuration program dispatcher bit
      suffix fuel outerContext innerContext
    RootResetPersistentResponseSelector.selectStep? program dispatcher
      (Cursor.rebuild parents fifth.cursor.erase) = some (Cursor.rebuild parents firstC4.cursor.erase) := by
  dsimp only
  obtain ⟨_bound, view, _found, parsed, _contracted⟩ :=
    positiveStageFifth_selects_exact_firstC4 program dispatcher bit suffix
      clockRegisters phase scanned emptyMode clockCoherent sampleIndex fuel trace
  exact selectStep?_rebuild_of_fuelParsed_of_selected traversable parsed
    (RootResetFirstResponseSelectorChain.positiveStageFifth_selectStep_eq_firstC4
      program dispatcher bit suffix clockRegisters phase scanned emptyMode
      clockCoherent sampleIndex fuel trace)

theorem firstC4_selectStep_eq_firstFrameRoot_under_parents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    {parents : List ParentFrame} {layers : Nat}
    (traversable : RootResetTraversableCompletedParents.TraversableParents
      program dispatcher parents layers)
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let firstC4 := SchedulerCycle.firstC4Configuration program dispatcher bit
      suffix fuel outerContext innerContext
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (Cursor.rebuild parents firstC4.cursor.erase) =
      some (Cursor.rebuild parents
        (Cursor.rebuild
          (PrimitiveFuel.pendingParents environment continuation fuel [])
          (SchedulerResponseInvariant.frameFirstRoot actions bits continuation
            (SchedulerCycle.deletedCarrier bit outerContext innerContext)))) := by
  dsimp only
  obtain ⟨_seed, view, _seedParsed, parsed, _stageEq, _addressEq,
      _persistentAddress, _erasedEq, _contracted⟩ :=
    firstC4Configuration_parse_postC4_selects_firstFrameRoot program dispatcher
      bit suffix fuel trace
  exact selectStep?_rebuild_of_fuelParsed_of_selected traversable parsed
    (RootResetFirstResponseSelectorChain.firstC4_selectStep_eq_firstFrameRoot
      program dispatcher bit suffix fuel trace)




open PureSFormal.PureS
open RootResetWholeAppenderStages
open RootResetAppenderStages


theorem actionParser_final_row_some
    (program : CTS.Program) (label : ActionLabel program)
    (position : Nat) (bit : Bool) (accumulator currentHistory : Term) (histories : List Term)
    (valid : (Row.secondFinal position bit accumulator currentHistory histories).Valid
      (PrimitiveLocalResponse.emitted program label)) :
    ActionParser.parse program label
      (Row.secondFinal position bit accumulator currentHistory histories).term =
      some ⟨accumulator, currentHistory :: histories⟩ := by
  have count : ActionParser.historyCount program label =
      (PrimitiveLocalResponse.emitted program label).length := by
    rcases label with ⟨phase, chosen⟩
    cases chosen <;> rfl
  have enough : position ≤ (PrimitiveLocalResponse.emitted program label).length := by
    by_cases le : (PrimitiveLocalResponse.emitted program label).length ≤ position
    · have empty := List.drop_eq_nil_iff.mpr le
      rw [valid.1] at empty
      cases empty
    · exact Nat.le_of_lt (Nat.lt_of_not_ge le)
  have lengthEq := congrArg List.length valid.1
  rw [List.length_drop] at lengthEq
  apply ActionParser.parse_complete
  constructor
  · rw [List.length_cons, valid.2, count]
    exact (Nat.add_comm position 1).trans
      ((congrArg (fun n => n + position) lengthEq).symm.trans (Nat.sub_add_cancel enough))
  · rfl

theorem local_some_of_finalAppender
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ActiveView program}
    (shape : ActiveShape program tree view term)
    (finalRow : view.row.stage = .secondFinal) :
    ∃ localView, CheckpointDecoder.parseLocal? program tree term = some localView := by
  rcases shape with ⟨haltField, dispatcher, seedAudit, continuationAudit,
    halt, route, valid, sourceEq⟩
  rw [sourceEq]
  cases rowEq : view.row with
  | first position bit rest accumulator duplicate histories =>
      simp [rowEq, Row.stage] at finalRow
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      simp [rowEq, Row.stage] at finalRow
  | secondFinal position bit accumulator currentHistory histories =>
      rw [rowEq] at route valid
      have detailed := DispatchParser.parseRouteDetailed_complete route
      have action := actionParser_final_row_some program view.label position bit accumulator currentHistory histories valid
      have dispatch : DispatchParser.parse program tree dispatcher =
          some ⟨view.route, view.label, accumulator⟩ := by
        rw [DispatchParser.parse, detailed]
        dsimp only
        rw [action]
      refine ⟨⟨.fresh, view.route, view.label, accumulator, word view.bits, view.continuation⟩,
        CheckpointDecoder.parseLocal?_complete ?_⟩
      exact ⟨haltField, dispatcher, seedAudit, continuationAudit, halt,
        DispatchParser.parse_sound dispatch, rfl⟩

theorem registeredAppender_not_final_of_local_none
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {term : Term} {view : RootResetWholeAppenderStages.View program}
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree term = none)
    (registered : RootResetTwentySevenStageRegistry.parse? program dispatcher term =
      some (.registered (.appender view))) :
    view.stage ≠ .secondFinal := by
  intro finalRow
  have shape := RootResetTwentySevenStageRegistry.parse?_sound registered
  cases shape with
  | registered shape =>
      cases shape with
      | appender _ shape =>
          have markedNone : RootResetReachableStageGrammar.parseMarkedLocal? program dispatcher.tree term = none := by
            rw [RootResetReachableStageGrammar.parseMarkedLocal?, localNone]
          have activeEq := (RootResetReachableStageGrammar.markedPrefix_deterministic
            shape.markedPrefix (.here markedNone)).1
          obtain ⟨found, localSome⟩ := local_some_of_finalAppender shape.activeShape finalRow
          rw [activeEq, localNone] at localSome
          cases localSome

open RootResetFreshClockSelectorChain
open RootResetFreshFuelSelectorChain
open RootResetPendingResponseContext
open RootResetWrappedFrameSelectorProof
open RootResetPersistentResponseSelector
open RootResetReachableStageGrammar
open RootResetClockFuelStages
open RootResetResponseClockFuelAgreement

theorem fresh_pending_shell_contexts
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (oldBit : Bool)
    (oldBits : List Bool) (oldCarrier : Term)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, oldBit) oldCarrier) = some (first :: rest))
    (classifierNone : RootResetAccumulatorClassifier.classify?
      (actionAccumulator program (registers.phase, oldBit) oldCarrier) = none)
    (outerBits bits : List Bool) (outerContinuation continuation carrier dispatcherTerm : Term)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree
      (RootResetEmptyRouteSelectorChain.shell bits continuation carrier dispatcherTerm) = none)
    (count : Nat) :
    let endpoint := pending (compileActions program dispatcher.tree) outerBits outerContinuation count
      (RootResetEmptyRouteSelectorChain.shell bits continuation carrier dispatcherTerm)
    let whole := freshTerm program dispatcher registers oldBit oldBits oldCarrier endpoint
    responseOuter program dispatcher whole =
        prependFresh program dispatcher registers oldBit oldBits oldCarrier endpoint
          (pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation
            (RootResetEmptyRouteSelectorChain.shell bits continuation carrier dispatcherTerm) count) ∧
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).fuel = none ∧
      responseAppenderSelection? program dispatcher whole = none ∧
      responseCarrierSelection? program dispatcher whole = none ∧
      responseBoundarySelection? program dispatcher whole = none ∧
      markedHandoffSelection? program dispatcher whole = none := by
  dsimp only
  let endpoint := pending (compileActions program dispatcher.tree) outerBits outerContinuation count
    (RootResetEmptyRouteSelectorChain.shell bits continuation carrier dispatcherTerm)
  let whole := freshTerm program dispatcher registers oldBit oldBits oldCarrier endpoint
  have freshNone : RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
      (RootResetEmptyRouteSelectorChain.shell bits continuation carrier dispatcherTerm) = none := by
    rw [RootResetPersistentRouteA.parseFreshNonempty?, localNone]
  obtain ⟨stopped, descent⟩ := shell_stops program dispatcher bits continuation carrier dispatcherTerm freshNone
  obtain ⟨remaining, crossed, activeEq, rolesEq, fuelEq⟩ := pending_traversal program dispatcher
    outerBits bits outerContinuation continuation carrier dispatcherTerm stopped count
  have contexts := freshTerm_contexts_general program dispatcher registers oldBit oldBits oldCarrier endpoint nonempty
  have outerEq := contexts.2.2
  rw [responseOuter_pending_shell program dispatcher outerBits bits outerContinuation
    continuation carrier dispatcherTerm stopped descent count] at outerEq
  have noFuel : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, contexts.2.1]
    dsimp only [prependFresh, RootResetPersistentRouteA.wrapOuter]
    rw [fuelEq, activeEq, pending_shell_fuel_none]
  have freshRoot : freshResponseRoot? program dispatcher whole = some ([], whole) := by
    rw [freshResponseRoot?, contexts.1]
    dsimp only [prependFresh, RootResetPersistentRouteA.wrapOuter, RootResetPersistentRouteA.freshStep]
    rw [rolesEq, addressBeforeFresh?, addressBeforeFresh?_replicate_pendingFrameChild]
    rfl
  have zeroPending : pendingBeforeFresh? (RootResetPersistentRouteA.activeContext program dispatcher whole).roles = some 0 := by
    rw [contexts.1]
    dsimp only [prependFresh, RootResetPersistentRouteA.wrapOuter, RootResetPersistentRouteA.freshStep]
    rw [rolesEq, pendingBeforeFresh?, pendingBeforeFresh?_replicate_pending_none]
  have noBaseFinal : ∀ view : RootResetWholeAppenderStages.View program,
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).route.endpoint =
        some (.registered (.appender view)) → view.stage ≠ .secondFinal := by
    intro view parsed
    rw [RootResetPersistentRouteAFuel.classifyHandoff, contexts.2.1] at parsed
    dsimp only [prependFresh, RootResetPersistentRouteA.wrapOuter] at parsed
    rw [fuelEq, activeEq, pending_shell_fuel_none] at parsed
    change (RootResetPersistentRouteA.classify program dispatcher whole).endpoint = _ at parsed
    rw [RootResetPersistentRouteA.classify, contexts.1] at parsed
    dsimp only [prependFresh, RootResetPersistentRouteA.wrapOuter] at parsed
    rw [activeEq] at parsed
    apply registeredAppender_not_final_of_local_none (registered := parsed)
    cases remaining with
    | zero => exact localNone
    | succ remaining => exact frame_local_none program dispatcher outerBits outerContinuation _
  have appenderNone := RootResetCompletedAppenderPriority.responseAppenderSelection_none_of_completed_noPending
    program dispatcher whole whole [] freshRoot rfl
    (freshView program dispatcher registers oldBit oldBits oldCarrier endpoint)
    (freshTerm_parsed program dispatcher registers oldBit oldBits oldCarrier endpoint) zeroPending noBaseFinal
  refine ⟨outerEq, noFuel, appenderNone, ?_, ?_, ?_⟩
  · rw [responseCarrierSelection?, responseCarrierAddress?, freshRoot]
    dsimp only [Option.bind]
    rw [zeroPending]
  · rw [responseBoundarySelection?, responseBoundaryAddress?,
      RootResetResponseClockFuelAgreement.completedResponseAddress?_none_of_outer_parseLocal_none
        outerEq localNone, freshRoot]
    dsimp only [Option.bind]
    rw [RootResetResponseBoundaryStages.parseActive?, freshTerm_parsed]
    dsimp only [freshView, CheckpointDecoder.completedView]
    rw [if_pos rfl, classifierNone]
  · rw [markedHandoffSelection?, contexts.1]
    dsimp only [prependFresh, RootResetPersistentRouteA.wrapOuter, RootResetPersistentRouteA.freshStep]
    rw [rolesEq, addressBeforePendingMarked?,
      addressBeforePendingMarked?_replicate_pendingFrameChild]
    rfl

open RootResetEmptyRouteSelectorChain
open RootResetWrappedEmptyRouteSelectorChain

theorem fresh_pending_contract
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (oldBit : Bool)
    (oldBits : List Bool) (oldCarrier : Term)
    (bits : List Bool) (continuation : Term) (count : Nat)
    {source target : Term} {address : Address}
    (contracts : source.contractAt? address = some target) :
    (freshTerm program dispatcher registers oldBit oldBits oldCarrier
      (pending (compileActions program dispatcher.tree) bits continuation count source)).contractAt?
        (([.right, .left] ++ rights count) ++ address) =
      some (freshTerm program dispatcher registers oldBit oldBits oldCarrier
        (pending (compileActions program dispatcher.tree) bits continuation count target)) := by
  exact RootResetWholeStageClassifier.contractAt?_plug_append
    (localContinuationContext (freshTerm program dispatcher registers oldBit oldBits oldCarrier .s)) _
    (pending_contractAt (compileActions program dispatcher.tree) bits continuation contracts count)

theorem DispatcherEdge.selectStep?_fresh_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (registers : SchedulerControl.Registers program) (oldBit : Bool)
    (oldBits : List Bool) (oldCarrier : Term)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, oldBit) oldCarrier) = some (first :: rest))
    (classifierNone : RootResetAccumulatorClassifier.classify?
      (actionAccumulator program (registers.phase, oldBit) oldCarrier) = none)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (phase : CTS.Phase program) (bit : Bool)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit)
    {source target : Term}
    (edge : DispatcherEdge (selectedAction program) carrier dispatcher.tree
      (dispatcher.route (phase, bit)) (phase, bit) source target)
    (count : Nat) :
    selectStep? program dispatcher
      (freshTerm program dispatcher registers oldBit oldBits oldCarrier
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (shell bits continuation carrier source))) =
      some (freshTerm program dispatcher registers oldBit oldBits oldCarrier
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (shell bits continuation carrier target))) := by
  let endpoint := pending (compileActions program dispatcher.tree) outerBits outerContinuation count
    (shell bits continuation carrier source)
  let whole := freshTerm program dispatcher registers oldBit oldBits oldCarrier endpoint
  have localNone := DispatcherEdge.shell_local_none bits continuation carrier carrierNot3 edge
  obtain ⟨outerEq, noFuel, appenderNone, carrierNone, boundaryNone, markedNone⟩ :=
    fresh_pending_shell_contexts program dispatcher registers oldBit oldBits oldCarrier nonempty classifierNone
      outerBits bits outerContinuation continuation carrier source localNone count
  let addressBase : Address := [.right, .left] ++ rights count
  cases edge with
  | initial path =>
      have fresh : parseFreshDispatcherCall? program dispatcher.tree
          (shell bits continuation carrier
            (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier)) = true :=
        parseFreshDispatcherCall?_freshLocal program dispatcher.tree bits continuation carrier
      have callContracts : (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier).contractAt? [] =
          some (RootResetDispatcherNodeStages.firstActivation (selectedAction program) dispatcher.tree carrier) := by
        cases dispatcher.tree <;> rfl
      have contracts := fresh_pending_contract program dispatcher registers oldBit oldBits oldCarrier
        outerBits outerContinuation count (shell_contractAt bits continuation carrier callContracts)
      simp only [List.append_nil] at contracts
      let finalTerm := freshTerm program dispatcher registers oldBit oldBits oldCarrier
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (shell bits continuation carrier
            (RootResetDispatcherNodeStages.firstActivation (selectedAction program) dispatcher.tree carrier)))
      have selected : freshDispatcherSelection? program dispatcher whole =
          some ⟨addressBase ++ RootResetWholeDispatcherStages.shellDispatcherAddress, finalTerm⟩ := by
        rw [freshDispatcherSelection?, outerEq]
        dsimp (config := { instances := true }) only [prependFresh, RootResetPersistentRouteA.wrapOuter, RootResetPersistentRouteA.freshStep, pendingOuter]
        rw [fresh]
        change checkedAt? whole (addressBase ++ RootResetWholeDispatcherStages.shellDispatcherAddress) = _
        rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
      change (classify program dispatcher whole).selected?.map (·.target) = some finalTerm
      rw [classify, noFuel]
      simp only [classifyAfterFuel, selected]
      rfl
  | row progress view routeShape contracts =>
      have freshSelectionNone : freshDispatcherSelection? program dispatcher whole = none := by
        rw [freshDispatcherSelection?, outerEq]
        dsimp (config := { instances := true }) only [prependFresh, RootResetPersistentRouteA.wrapOuter, pendingOuter]
        rw [shell_route_freshCall_false bits continuation carrier progress]
        rfl
      let address := addressBase ++ (RootResetWholeDispatcherStages.shellDispatcherAddress ++
        (RootResetSelectorContract.contextAddress view.context ++ view.localRedexAddress))
      have selectedAddress : currentCarrierDispatcherAddress? program dispatcher whole = some address := by
        rw [currentCarrierDispatcherAddress?, outerEq]
        dsimp only [prependFresh, RootResetPersistentRouteA.wrapOuter, RootResetPersistentRouteA.freshStep,
          pendingOuter, shell, Carrier.activeShell, Carrier.shell, seedCode]
        rw [RootResetWholeDispatcherStages.parseFreshHalt?_fresh]
        dsimp only
        rw [phaseEq, bitEq]
        dsimp only
        rw [RootResetWholeDispatcherStages.parseRouteNode?_complete routeShape]
        rfl
      have wholeContracts := fresh_pending_contract program dispatcher registers oldBit oldBits oldCarrier
        outerBits outerContinuation count (shell_contractAt bits continuation carrier contracts)
      let finalTerm := freshTerm program dispatcher registers oldBit oldBits oldCarrier
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (shell bits continuation carrier target))
      have selected : dispatcherSelection? program dispatcher whole = some ⟨address, finalTerm⟩ := by
        rw [dispatcherSelection?, selectedAddress]
        change checkedAt? whole address = _
        rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, wholeContracts]
      have priority := (classify_dispatcher_priority freshSelectionNone boundaryNone appenderNone
        carrierNone markedNone noFuel selected).2
      rw [selectStep?, priority]
      rfl



end PureSFormal.Research.RootResetFreshResponseSelectorChain
