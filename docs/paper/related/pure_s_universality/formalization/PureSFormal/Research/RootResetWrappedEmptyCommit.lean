import PureSFormal.Research.RootResetWrappedEmptyRouteSelectorChain

/-!
# EMPTY COMMIT beneath outer contexts

An initially empty sweep contains no deleted cells.  This invariant selects
COMMIT below pending frames, including the case where a different completed
response would instead expose the pending-frame handoff.
-/

namespace PureSFormal.Research.RootResetWrappedEmptyCommit

open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetReachableStageGrammar
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetPendingResponseContext
open RootResetEmptyRouteSelectorChain
open RootResetWrappedEmptyRouteSelectorChain
open RootResetClockFuelStages

theorem emptyBase_tombstoneCount
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) :
    carrierTombstoneCount? program dispatcher.tree
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation) = some 0 := by
  have parsed : CheckpointDecoder.parseBase? (compileActions program dispatcher.tree)
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation) =
      some ⟨word [], continuation, word [],
        baseBeta (environmentCode (compileActions program dispatcher.tree) []) continuation⟩ :=
    CheckpointDecoder.parseBase?_open ..
  rw [carrierTombstoneCount?, parsed]
  change spineTombstoneCount? omega = some 0
  rw [spineTombstoneCount?]
  rfl

theorem markedEmpty_tombstoneCount
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (bits : List Bool) (continuation carrier : Term) :
    carrierTombstoneCount? program dispatcher.tree
      (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers false carrier)) =
      carrierTombstoneCount? program dispatcher.tree carrier := by
  have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program
    dispatcher registers false carrier
  have notBase := CheckpointRun.parseBase?_none_of_localShape
    (CheckpointDecoder.localShape_markedCompleted (continuation := continuation) bits dispatch)
  have parsed := CheckpointDecoder.parseLocal?_markedCompleted
    (continuation := continuation) bits dispatch
  rw [carrierTombstoneCount?, notBase]
  dsimp only
  rw [parsed]
  rfl

theorem emptySweepCarrier_tombstoneCount
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (count : Nat)
    (registers : SchedulerControl.Registers program) (carrier : Term) :
    carrierTombstoneCount? program dispatcher.tree
      (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count registers carrier) =
      carrierTombstoneCount? program dispatcher.tree carrier := by
  induction count generalizing registers carrier with
  | zero => rfl
  | succ count ih =>
      rw [SchedulerCycle.emptySweepCarrier, ih, markedEmpty_tombstoneCount]

theorem generatedEmptySweep_tombstoneCount
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (count : Nat) :
    carrierTombstoneCount? program dispatcher.tree
      (SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count
        (SchedulerNestedEmpty.initialEmptyRegisters program)
        (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation)) = some 0 := by
  rw [emptySweepCarrier_tombstoneCount, emptyBase_tombstoneCount]

theorem withResponse_chosen
    {Label : Type} (encode : Label → Term)
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (carrier response : Term) :
    ∃ payload, PrimitiveRoute.withResponse encode tree route carrier response =
      chosen carrier payload := by
  cases path <;> exact ⟨_, rfl⟩

theorem completedRoute_chosen
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (carrier : Term) :
    ∃ payload, SchedulerResponse.completedRoute program dispatcher registers bit carrier =
      chosen carrier payload := by
  exact withResponse_chosen (selectedAction program)
    (dispatcher.route_valid (registers.phase, bit)) carrier
    (actionResult program (registers.phase, bit) carrier)

/-- The zero-tombstone invariant rules out the competing handoff on every
pending depth.  All other selector priority premises follow from the shell. -/
theorem selectStep?_marked_pending_empty_commit
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (empty : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some [])
    (tombstones : carrierTombstoneCount? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some 0)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (LocalResponse.completed bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit carrier))) context history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (LocalResponse.markedCompleted bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit carrier)))) := by
  let route := SchedulerResponse.completedRoute program dispatcher registers bit carrier
  let source := shell bits continuation carrier route
  let target := LocalResponse.markedCompleted bits continuation carrier route
  let view := CheckpointDecoder.completedView program
    (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
    (actionAccumulator program (registers.phase, bit) carrier) bits continuation
  have parsed : CheckpointDecoder.parseLocal? program dispatcher.tree source = some view :=
    CheckpointDecoder.parseLocal?_completed bits
      (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher registers bit carrier)
  have freshNone := RootResetPersistentRouteA.parseFreshNonempty?_none_of_empty parsed (by rfl) empty
  obtain ⟨outerEq, noFuel, freshRootNone, markedNone⟩ := marked_pending_shell_contexts
    program dispatcher outerBits bits outerContinuation continuation carrier route freshNone count shape
  let addressBase := RootResetSelectorContract.contextAddress context ++ rights count
  have completedAddress : completedResponseAddress? program dispatcher whole =
      some (addressBase ++ [.left, .left, .left]) := by
    rw [completedResponseAddress?, outerEq]
    dsimp (config := { instances := true }) only [prependMarked, pendingOuter]
    rw [RootResetWholeStageClassifier.classifyActive_commit_of_parse _ parsed]
    dsimp only
    rw [parsed]
    dsimp only [Bind.bind, Option.bind, view, CheckpointDecoder.completedView]
    rw [empty]
    simp only [↓reduceIte]
    split
    · rw [tombstones]
      cases carrierLocalCount? program dispatcher.tree
          (actionAccumulator program (registers.phase, bit) carrier) with
      | none => rfl
      | some localCount =>
          change (if 0 = localCount + 2 then _ else _) = _
          have unequal : (0 : Nat) ≠ localCount + 2 := by
            intro equal
            exact Nat.noConfusion equal
          rw [if_neg unequal]
    · rfl
  obtain ⟨payload, routeEq⟩ := completedRoute_chosen program dispatcher registers bit carrier
  have freshCallNone : parseFreshDispatcherCall? program dispatcher.tree source = false := by
    change parseFreshDispatcherCall? program dispatcher.tree
      (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier)) = false
    rw [routeEq]
    simp [parseFreshDispatcherCall?, LocalResponse.completed, Carrier.activeShell,
      Carrier.shell, chosen, seedCode, RootResetEmptyRouteSelectorChain.compileActions_ne_s_app]
  have freshDispatcherNone : freshDispatcherSelection? program dispatcher whole = none := by
    simp only [freshDispatcherSelection?, outerEq, prependMarked, pendingOuter]
    rw [freshCallNone]
    rfl
  have appenderNone : responseAppenderSelection? program dispatcher whole = none := by
    rw [responseAppenderSelection?, responseAppenderAddress?, freshRootNone]
    rfl
  have carrierNone : responseCarrierSelection? program dispatcher whole = none := by
    rw [responseCarrierSelection?, responseCarrierAddress?, freshRootNone]
    rfl
  have rootContracts : source.contractAt? [.left, .left, .left] = some target := rfl
  have contracts := marked_pending_contract outerBits outerContinuation count shape rootContracts
  have boundary : responseBoundarySelection? program dispatcher whole =
      some ⟨addressBase ++ [.left, .left, .left],
        context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count target)⟩ := by
    rw [responseBoundarySelection?, responseBoundaryAddress?, completedAddress]
    change checkedAt? whole (addressBase ++ [.left, .left, .left]) = _
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  change (classify program dispatcher whole).selected?.map (·.target) = _
  rw [classify, noFuel]
  simp only [classifyAfterFuel, freshDispatcherNone, appenderNone, carrierNone, boundary]
  rfl

/-- The actual EMPTY response includes its marker contraction under the
same pending stack and marked parent frames. -/
theorem emptyResponse_marked_through_marker_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some false)
    (empty : CheckpointDecoder.decodeCarrier? program dispatcher.tree carrier = some [])
    (tombstones : carrierTombstoneCount? program dispatcher.tree carrier = some 0)
    (count : Nat) (parents : List ParentFrame)
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree
      (Cursor.rebuild parents
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (SchedulerResponseInvariant.frameFirstRoot
            (compileActions program dispatcher.tree) bits continuation carrier)))
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot
          (compileActions program dispatcher.tree) bits continuation carrier))
      (SchedulerInvariant.contextOfParents parents) history) :
    let actions := compileActions program dispatcher.tree
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions outerBits)
      outerContinuation count parents
    ∃ first rest,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers bits continuation carrier allParents)
        (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier allParents)
        (first :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) first rest := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  let allParents := PrimitiveFuel.pendingParents (environmentCode actions outerBits)
    outerContinuation count parents
  let route := SchedulerResponse.completedRoute program dispatcher registers false carrier
  let completed := LocalResponse.completed bits continuation carrier route
  let marker := SchedulerRootContinuation.emptyMarkerMutationConfiguration program dispatcher
    registers bits continuation carrier allParents
  obtain ⟨first, second, third, rest, responseChain, selected⟩ :=
    emptyResponse_marked_dispatcher_selectorChain program dispatcher registers
      outerBits bits outerContinuation continuation carrier carrierNot3 phaseEq bitEq count parents shape
  have freshStop := pending_parseMarked_none program dispatcher outerBits outerContinuation completed
    (RootResetWholeDispatcherSelectedHandoff.parseMarkedLocal?_fresh_openShell_none
      program dispatcher.tree carrier route (word bits) carrier continuation carrier) count
  obtain ⟨commitHistory, commitShape⟩ := markedPrefix_replace shape freshStop
  have markerStep := selectStep?_marked_pending_empty_commit program dispatcher registers false
    outerBits bits outerContinuation continuation carrier empty tombstones count commitShape
  have markerSelected : RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
      (SchedulerEmpty.markStartConfiguration program dispatcher registers bits continuation carrier allParents)
      [marker] := by
    refine .next ?_ (.done _)
    rw [SchedulerRootContinuation.emptyMarkerMutation_erase]
    change selectStep? program dispatcher (Cursor.rebuild allParents completed) =
      some (Cursor.rebuild allParents (LocalResponse.markedCompleted bits continuation carrier route))
    simpa only [allParents, actions, pending_rebuild_under_parents] using markerStep
  have markerChain : SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers bits continuation carrier allParents)
      (SchedulerEmpty.markStartConfiguration program dispatcher registers bits continuation carrier allParents)
      [marker] :=
    .next 4 (SchedulerRootContinuation.emptyMarkStart_seekMutation ..)
      (.done 4 (SchedulerRootContinuation.emptyMarkerSuffix_zeroRun ..))
  obtain ⟨ticks, searched, tailExact⟩ := RootResetResponseSampleParserBridge.exactMutationChain_cons responseChain
  refine ⟨first, (second :: third :: rest) ++ [marker], ?_, ?_⟩
  · exact SchedulerRecurrence.ExactMutationChain.append responseChain markerChain
  · exact RootResetExactTraceAgreement.SelectorChain.append tailExact selected markerSelected

/-- An initially empty sweep supplies every carrier premise.  Its completed
response, including COMMIT, agrees for any response number and pending depth. -/
theorem generatedEmptyResponse_marked_through_marker_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (completedCount : Nat) (outerBits : List Bool) (outerContinuation : Term)
    (pendingCount : Nat) (parents : List ParentFrame)
    {history : List (CheckpointDecoder.LocalView program)} :
    let actions := compileActions program dispatcher.tree
    let initial := SchedulerNestedEmpty.initialEmptyRegisters program
    let registers := SchedulerCycle.emptySweepRegisters program completedCount initial
    let carrier := SchedulerCycle.emptySweepCarrier program dispatcher [] continuation completedCount initial
      (baseCarrier (environmentCode actions []) continuation)
    let active := pending actions outerBits outerContinuation pendingCount
      (SchedulerResponseInvariant.frameFirstRoot actions [] continuation carrier)
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions outerBits)
      outerContinuation pendingCount parents
    MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history →
    ∃ first rest,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers [] continuation carrier allParents)
        (SchedulerEmpty.responseStartConfiguration program dispatcher registers [] continuation carrier allParents)
        (first :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) first rest := by
  dsimp only
  intro shape
  have labels := RootResetEmptyResponseSelectorChain.generatedEmptySweep_label
    program dispatcher continuation completedCount
  apply emptyResponse_marked_through_marker_selectorChain program dispatcher _ outerBits []
    outerContinuation continuation _ ?_ labels.1 labels.2 ?_ ?_ pendingCount parents shape
  · apply emptySweepCarrier_not_three
    rcases Carrier.baseCarrier_headArity
      (environmentCode (compileActions program dispatcher.tree) []) admissible with five | six
    · rw [five]
      decide
    · rw [six]
      decide
  · exact CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree [] continuation
      admissible (SchedulerNestedEmpty.emptySweepCarrier_decode program dispatcher
        continuation admissible completedCount (SchedulerNestedEmpty.initialEmptyRegisters program))
  · exact generatedEmptySweep_tombstoneCount program dispatcher continuation completedCount

end PureSFormal.Research.RootResetWrappedEmptyCommit
