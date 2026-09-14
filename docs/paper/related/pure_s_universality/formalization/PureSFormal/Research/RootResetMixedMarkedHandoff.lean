import PureSFormal.Research.RootResetMixedEmptyResponseChain
import PureSFormal.Research.RootResetMixedCompletedFrontHandoff

/-! Marked EMPTY handoff beneath mixed completed histories. -/
namespace PureSFormal.Research.RootResetMixedMarkedHandoff

open PureSFormal.PureS
open RootResetPersistentResponseSelector RootResetReachableStageGrammar
open RootResetWrappedFrameSelectorProof RootResetMarkedFrameSelectorProof
open RootResetPendingResponseContext RootResetEmptyHandoffContext
open RootResetEmptyPostMarkerHandoff RootResetClockFuelStages
open RootResetMixedResponseContext

theorem noPending_pending_marked (count : Nat) :
    pendingBeforeFresh? (List.replicate count .pendingFrameChild ++ [.markedContinuation]) = none := by
  induction count with
  | zero => rfl
  | succ count ih =>
      rw [List.replicate_succ, List.cons_append, pendingBeforeFresh?, ih]
      rfl

theorem pendingMarked_address_under
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole endpoint context roles history)
    {suffix : List RootResetPersistentRouteA.Role} {address : Address}
    (found : addressBeforePendingMarked? suffix = some address) :
    addressBeforePendingMarked? (roles ++ suffix) =
      some (RootResetSelectorContract.contextAddress context ++ address) := by
  induction shape with
  | here term => exact found
  | fresh parsed status nonempty clean inner ih =>
      rw [List.cons_append, addressBeforePendingMarked?, ih]
      simp only [RootResetSelectorContract.contextAddress_comp,
        RootResetPersistentRouteA.localContinuationContext_address_of_parseLocal? parsed,
        List.append_assoc, Option.map]
  | marked parsed status inner ih =>
      rw [List.cons_append, addressBeforePendingMarked?, ih]
      simp only [RootResetSelectorContract.contextAddress_comp,
        RootResetPersistentRouteA.localContinuationContext_address_of_parseLocal? parsed,
        List.append_assoc, Option.map]

theorem fresh_witness_tail
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole endpoint context roles history) (suffix : List RootResetPersistentRouteA.Role)
    (noFresh : addressBeforeFresh? suffix = none)
    (noPending : pendingBeforeFresh? suffix = none) :
    (addressBeforeFresh? (roles ++ suffix) = none ∧
      pendingBeforeFresh? (roles ++ suffix) = none) ∨
    ∃ (address : Address) (term : Term) (view : CheckpointDecoder.LocalView program),
      addressBeforeFresh? (roles ++ suffix) = some address ∧
      pendingBeforeFresh? (roles ++ suffix) = some 0 ∧
      whole.subterm? address = some term ∧
      CheckpointDecoder.parseLocal? program dispatcher.tree term = some view ∧
      view.status = .fresh ∧
      RootResetAccumulatorClassifier.classify? view.accumulator = none ∧
      ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some (first :: rest) := by
  induction shape with
  | here term =>
      exact .inl ⟨noFresh, noPending⟩
  | @fresh term endpoint context roles history view parsed status nonempty clean inner ih =>
      rcases ih with ⟨addressNone, countNone⟩ | ⟨address, target, foundView, addressEq, countEq, found, localParsed, fresh, classifier, decoded⟩
      · exact .inr ⟨[], term, view, by simp only [List.cons_append, addressBeforeFresh?, addressNone],
          by simp only [List.cons_append, pendingBeforeFresh?, countNone], by simp only [Term.subterm?], parsed, status, clean, nonempty⟩
      · refine .inr ⟨[.right, .left] ++ address, target, foundView, ?_, ?_, ?_, localParsed, fresh, classifier, decoded⟩
        · simp only [List.cons_append, addressBeforeFresh?, addressEq]
        · simp only [List.cons_append, pendingBeforeFresh?, countEq]
        · rw [CarrierDecoder.subterm?_append, continuation_found parsed]
          exact found
  | @marked term endpoint context roles history view parsed status inner ih =>
      rcases ih with ⟨addressNone, countNone⟩ | ⟨address, target, foundView, addressEq, countEq, found, localParsed, fresh, classifier, decoded⟩
      · exact .inl ⟨by simp only [List.cons_append, addressBeforeFresh?, addressNone, Option.map],
          by simp only [List.cons_append, pendingBeforeFresh?, countNone]⟩
      · refine .inr ⟨[.right, .left] ++ address, target, foundView, ?_, ?_, ?_, localParsed, fresh, classifier, decoded⟩
        · simp only [List.cons_append, addressBeforeFresh?, addressEq, Option.map]
        · simp only [List.cons_append, pendingBeforeFresh?, countEq]
        · rw [CarrierDecoder.subterm?_append, continuation_found parsed]
          exact found

theorem selectStep?_mixed_pending_exit
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation carrier : Term)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1)
        (markedExitTerm program dispatcher registers bit bits carrier horizon remaining)) context roles history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree)
          outerBits outerContinuation
          (markedExitTerm program dispatcher registers bit bits carrier horizon remaining)))) := by
  have parsed := markedExit_parsed program dispatcher registers bit bits carrier horizon remaining
  have registered := markedExit_registry program dispatcher registers bit bits carrier horizon remaining bound
  change ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
      (markedExitTerm program dispatcher registers bit bits carrier horizon remaining) = some view ∧
      RootResetPersistentRouteA.nestedEligible view.stage = true at registered
  have fuelNone := pending_local_fuel_none dispatcher outerBits outerContinuation
    (CheckpointDecoder.parseLocal?_sound parsed)
  have inner := markedExit_contexts program dispatcher registers bit bits carrier horizon remaining bound
  have recovered := shape.contexts
  rw [activeContext_pending_lift program dispatcher outerBits outerContinuation _ registered (count + 1), inner.1,
    fuelActiveContext_pending_lift program dispatcher outerBits outerContinuation _ registered fuelNone (count + 1), inner.2.1,
    responseOuter_pending_lift program dispatcher outerBits outerContinuation _ registered fuelNone (count + 1), inner.2.2] at recovered
  have noFuel : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, recovered.2.1]
    dsimp only [prepend, composeActiveContexts, pendingOuter, markedExitOuter]
    rw [exit_fuel_none program dispatcher horizon remaining bits bound]
  have rolesEq : (RootResetPersistentRouteA.activeContext program dispatcher whole).roles =
      roles ++ (List.replicate (count + 1) .pendingFrameChild ++ [.markedContinuation]) := by
    rw [recovered.1]
    rfl
  have noBaseFinal : ∀ view : RootResetWholeAppenderStages.View program,
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).route.endpoint =
        some (.registered (.appender view)) → view.stage ≠ .secondFinal := by
    intro view endpoint
    rw [RootResetPersistentRouteAFuel.classifyHandoff, recovered.2.1] at endpoint
    dsimp only [prepend, composeActiveContexts, pendingOuter, markedExitOuter] at endpoint
    rw [exit_fuel_none program dispatcher horizon remaining bits bound] at endpoint
    change (RootResetPersistentRouteA.classify program dispatcher whole).endpoint = _ at endpoint
    rw [RootResetPersistentRouteA.classify, recovered.1] at endpoint
    exact RootResetFreshResponseSelectorChain.registeredAppender_not_final_of_local_none
      (exit_local_none program dispatcher horizon remaining bits) endpoint
  have historical : responseAppenderSelection? program dispatcher whole = none ∧
      responseCarrierSelection? program dispatcher whole = none ∧
      responseBoundarySelection? program dispatcher whole = none := by
    have completedNone := RootResetResponseClockFuelAgreement.completedResponseAddress?_none_of_outer_parseLocal_none
      recovered.2.2 (exit_local_none program dispatcher horizon remaining bits)
    rcases fresh_witness_tail shape _ (noFresh_pending_marked (count + 1))
      (noPending_pending_marked (count + 1)) with ⟨addressNone, countNone⟩ |
      ⟨address, term, view, addressEq, countEq, found, oldParsed, status, clean, nonempty⟩
    · have rootNone : freshResponseRoot? program dispatcher whole = none := by
        rw [freshResponseRoot?, rolesEq, addressNone]
        rfl
      constructor
      · rw [responseAppenderSelection?, responseAppenderAddress?, rootNone]
        rfl
      constructor
      · rw [responseCarrierSelection?, responseCarrierAddress?, rootNone]
        rfl
      · rw [responseBoundarySelection?, responseBoundaryAddress?, completedNone, rootNone]
        rfl
    · have rootSome : freshResponseRoot? program dispatcher whole = some (address, term) := by
        rw [freshResponseRoot?, rolesEq, addressEq]
        dsimp only [Option.bind]
        rw [found]
        rfl
      have pendingZero : pendingBeforeFresh?
          (RootResetPersistentRouteA.activeContext program dispatcher whole).roles = some 0 := by
        rw [rolesEq, countEq]
      refine ⟨RootResetCompletedAppenderPriority.responseAppenderSelection_none_of_completed_noPending
        program dispatcher whole term address rootSome found view oldParsed pendingZero noBaseFinal, ?_, ?_⟩
      · rw [responseCarrierSelection?, responseCarrierAddress?, rootSome]
        dsimp only [Option.bind]
        rw [pendingZero]
      · rw [responseBoundarySelection?, responseBoundaryAddress?, completedNone, rootSome]
        dsimp only [Option.bind]
        rw [RootResetResponseBoundaryStages.parseActive?, oldParsed]
        dsimp only
        rw [if_pos status, clean]
  have freshDispatcherNone : freshDispatcherSelection? program dispatcher whole = none := by
    rw [freshDispatcherSelection?, recovered.2.2]
    dsimp (config := { instances := true }) only [prepend, composeActiveContexts, pendingOuter, markedExitOuter]
    rw [exit_freshCall_false]
    rfl
  let address := RootResetSelectorContract.contextAddress context ++ rights count
  let target := context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
    (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation
      (markedExitTerm program dispatcher registers bit bits carrier horizon remaining)))
  have innerShape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (frame (environmentCode (compileActions program dispatcher.tree) outerBits) outerContinuation
          (markedExitTerm program dispatcher registers bit bits carrier horizon remaining))) context roles history := by
    rw [← pending_succ_innermost]
    exact shape
  have rootContracts : (frame (environmentCode (compileActions program dispatcher.tree) outerBits)
      outerContinuation (markedExitTerm program dispatcher registers bit bits carrier horizon remaining)).contractAt? [] =
      some (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree)
        outerBits outerContinuation (markedExitTerm program dispatcher registers bit bits carrier horizon remaining)) := rfl
  have contracts := innerShape.pending_contract outerBits outerContinuation count rootContracts
  simp only [List.append_nil] at contracts
  have handoff : markedHandoffSelection? program dispatcher whole = some ⟨address, target⟩ := by
    rw [markedHandoffSelection?, recovered.1]
    dsimp only [prepend, composeActiveContexts, pendingOuter, markedExitOuter]
    rw [pendingMarked_address_under shape (pendingMarked_address count)]
    change checkedAt? whole address = _
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  change (classify program dispatcher whole).selected?.map (·.target) = some target
  rw [classify, noFuel]
  simp only [classifyAfterFuel, freshDispatcherNone, historical.1, historical.2.1, historical.2.2, handoff]
  rfl

end PureSFormal.Research.RootResetMixedMarkedHandoff
