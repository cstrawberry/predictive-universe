import PureSFormal.Research.RootResetMixedResponseContext
import PureSFormal.Research.RootResetCleanParentPrefix
import PureSFormal.Research.RootResetPendingCompletedResponse

/-! Empty-response COMMIT under the same generated mixed parent invariant. -/
namespace PureSFormal.Research.RootResetMixedEmptyCommit
open PureSFormal.PureS
open RootResetPersistentResponseSelector RootResetReachableStageGrammar
open RootResetMixedResponseContext RootResetPendingResponseContext
open RootResetWrappedFrameSelectorProof RootResetMarkedFrameSelectorProof
open RootResetEmptyRouteSelectorChain RootResetWrappedEmptyCommit
open RootResetFreshResponseSelectorChain RootResetPendingCompletedResponse
open RootResetClockFuelStages

theorem registeredAppender_impossible_of_emptyAppendant
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {term : Term} {localView : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some localView)
    (fresh : localView.status = .fresh)
    (emitted : PrimitiveLocalResponse.emitted program localView.label = [])
    {view : RootResetWholeAppenderStages.View program}
    (registered : RootResetTwentySevenStageRegistry.parse? program dispatcher term =
      some (.registered (.appender view))) : False := by
  have shape := RootResetTwentySevenStageRegistry.parse?_sound registered
  cases shape with
  | registered shape =>
      cases shape with
      | appender _ shape =>
          have markedNone : parseMarkedLocal? program dispatcher.tree term = none := by
            rw [parseMarkedLocal?, parsed]
            simp only [fresh]
            rfl
          have activeEq := (markedPrefix_deterministic shape.markedPrefix (.here markedNone)).1
          have accepted := RootResetWholeAppenderStages.parseActive?_complete shape.activeShape
          rw [activeEq, appender_none_of_completed_emptyAppendant parsed emitted] at accepted
          contradiction

/-- COMMIT remains selected after earlier nonempty jobs have installed fresh
historical Locals. The explicit count inequality distinguishes a completed
empty response from the later post-deletion FRAME handoff. -/
theorem selectStep?_mixed_pending_empty_commit
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (empty : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some [])
    (emitted : PrimitiveLocalResponse.emitted program (registers.phase, bit) = [])
    (notDeleted : ∀ localCount tombstoneCount,
      carrierLocalCount? program dispatcher.tree
        (actionAccumulator program (registers.phase, bit) carrier) = some localCount →
      carrierTombstoneCount? program dispatcher.tree
        (actionAccumulator program (registers.phase, bit) carrier) = some tombstoneCount →
      tombstoneCount ≠ localCount + 2)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (LocalResponse.completed bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit carrier))) context roles history) :
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
  change Prefix program dispatcher whole
    (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
      (shell bits continuation carrier route)) context roles history at shape
  have parsed : CheckpointDecoder.parseLocal? program dispatcher.tree source = some view :=
    CheckpointDecoder.parseLocal?_completed bits
      (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher registers bit carrier)
  have freshNone := RootResetPersistentRouteA.parseFreshNonempty?_none_of_empty parsed (by rfl) empty
  obtain ⟨stopped, descent⟩ := shell_stops program dispatcher bits continuation carrier route freshNone
  obtain ⟨remaining, crossed, activeInner, rolesInner, fuelInner⟩ := pending_traversal program dispatcher
    outerBits bits outerContinuation continuation carrier route stopped count
  have outerEq := shape.contexts.2.2
  rw [responseOuter_pending_shell program dispatcher outerBits bits outerContinuation
    continuation carrier route stopped descent count] at outerEq
  have noFuel : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, shape.contexts.2.1]
    dsimp only [prepend]
    rw [fuelInner, activeInner, pending_shell_fuel_none]
  have noBaseFinal : ∀ appView : RootResetWholeAppenderStages.View program,
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).route.endpoint =
        some (.registered (.appender appView)) → appView.stage ≠ .secondFinal := by
    intro appView registered
    rw [RootResetPersistentRouteAFuel.classifyHandoff, shape.contexts.2.1] at registered
    dsimp only [prepend] at registered
    rw [fuelInner, activeInner, pending_shell_fuel_none] at registered
    change (RootResetPersistentRouteA.classify program dispatcher whole).endpoint = _ at registered
    rw [RootResetPersistentRouteA.classify, shape.contexts.1] at registered
    dsimp only [prepend] at registered
    rw [activeInner] at registered
    cases remaining with
    | zero => exact False.elim (registeredAppender_impossible_of_emptyAppendant parsed rfl emitted registered)
    | succ remaining =>
        exact registeredAppender_not_final_of_local_none
          (frame_local_none program dispatcher outerBits outerContinuation _) registered
  have rolesEq : (RootResetPersistentRouteA.activeContext program dispatcher whole).roles =
      roles ++ List.replicate crossed .pendingFrameChild := by
    rw [shape.contexts.1]
    exact congrArg (fun suffix => roles ++ suffix) rolesInner
  have historical : responseAppenderSelection? program dispatcher whole = none ∧
      responseCarrierSelection? program dispatcher whole = none := by
    rcases shape.fresh_witness crossed with ⟨addressNone, countNone⟩ |
      ⟨address, term, oldView, addressEq, countEq, found, localParsed, status, clean, nonempty⟩
    · have rootNone : freshResponseRoot? program dispatcher whole = none := by
        rw [freshResponseRoot?, rolesEq, addressNone]
        rfl
      constructor
      · rw [responseAppenderSelection?, responseAppenderAddress?, rootNone]; rfl
      · rw [responseCarrierSelection?, responseCarrierAddress?, rootNone]; rfl
    · have rootSome : freshResponseRoot? program dispatcher whole = some (address, term) := by
        rw [freshResponseRoot?, rolesEq, addressEq]
        dsimp only [Option.bind]
        rw [found]
        rfl
      have pendingZero : pendingBeforeFresh?
          (RootResetPersistentRouteA.activeContext program dispatcher whole).roles = some 0 := by
        rw [rolesEq, countEq]
      refine ⟨RootResetCompletedAppenderPriority.responseAppenderSelection_none_of_completed_noPending
        program dispatcher whole term address rootSome found oldView localParsed pendingZero noBaseFinal, ?_⟩
      rw [responseCarrierSelection?, responseCarrierAddress?, rootSome]
      dsimp only [Option.bind]
      rw [pendingZero]
  let addressBase := RootResetSelectorContract.contextAddress context ++ rights count
  have completedAddress : completedResponseAddress? program dispatcher whole =
      some (addressBase ++ [.left, .left, .left]) := by
    rw [completedResponseAddress?, outerEq]
    dsimp (config := { instances := true }) only [prepend, pendingOuter]
    rw [RootResetWholeStageClassifier.classifyActive_commit_of_parse _ parsed]
    dsimp only
    rw [parsed]
    dsimp only [Bind.bind, Option.bind, view, CheckpointDecoder.completedView]
    rw [empty]
    simp only [↓reduceIte]
    split
    · cases localsEq : carrierLocalCount? program dispatcher.tree
          (actionAccumulator program (registers.phase, bit) carrier) with
      | none =>
          cases carrierTombstoneCount? program dispatcher.tree
            (actionAccumulator program (registers.phase, bit) carrier) <;> rfl
      | some locals =>
          cases tombsEq : carrierTombstoneCount? program dispatcher.tree
              (actionAccumulator program (registers.phase, bit) carrier) with
          | none => rfl
          | some tombs =>
              dsimp only
              rw [if_neg (notDeleted locals tombs localsEq tombsEq)]
    · rfl
  obtain ⟨payload, routeEq⟩ := completedRoute_chosen program dispatcher registers bit carrier
  have freshCallNone : parseFreshDispatcherCall? program dispatcher.tree source = false := by
    change parseFreshDispatcherCall? program dispatcher.tree
      (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier)) = false
    rw [routeEq]
    simp [parseFreshDispatcherCall?, LocalResponse.completed, Carrier.activeShell,
      Carrier.shell, chosen, seedCode, compileActions_ne_s_app]
  have freshDispatcherNone : freshDispatcherSelection? program dispatcher whole = none := by
    rw [freshDispatcherSelection?, outerEq]
    dsimp (config := { instances := true }) only [prepend, pendingOuter]
    rw [freshCallNone]
    rfl
  have rootContracts : source.contractAt? [.left, .left, .left] = some target := rfl
  have contracts := shape.pending_contract outerBits outerContinuation count rootContracts
  have boundary : responseBoundarySelection? program dispatcher whole =
      some ⟨addressBase ++ [.left, .left, .left],
        context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count target)⟩ := by
    rw [responseBoundarySelection?, responseBoundaryAddress?, completedAddress]
    change checkedAt? whole (addressBase ++ [.left, .left, .left]) = _
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  change (classify program dispatcher whole).selected?.map (·.target) = _
  rw [classify, noFuel]
  simp only [classifyAfterFuel, freshDispatcherNone, historical.1, historical.2, boundary]
  rfl

theorem notDeleted_of_zero_tombstones
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {carrier : Term}
    (zero : carrierTombstoneCount? program tree carrier = some 0) :
    ∀ locals tombs, carrierLocalCount? program tree carrier = some locals →
      carrierTombstoneCount? program tree carrier = some tombs → tombs ≠ locals + 2 := by
  intro locals tombs _ observed
  have equal := Option.some.inj (zero.symm.trans observed)
  subst tombs
  intro impossible
  exact Nat.noConfusion impossible

theorem notDeleted_of_completed_counts
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {carrier : Term} (count : Nat)
    (localCount : carrierLocalCount? program tree carrier = some count)
    (tombCount : carrierTombstoneCount? program tree carrier = some (count + 1)) :
    ∀ locals tombs, carrierLocalCount? program tree carrier = some locals →
      carrierTombstoneCount? program tree carrier = some tombs → tombs ≠ locals + 2 := by
  intro locals tombs observedLocal observedTomb
  have localEq := Option.some.inj (localCount.symm.trans observedLocal)
  have tombEq := Option.some.inj (tombCount.symm.trans observedTomb)
  subst locals
  subst tombs
  intro impossible
  have equal := Nat.add_left_cancel impossible
  cases equal

theorem selectStep?_cleanParents_pending_empty_commit
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (empty : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some [])
    (emitted : PrimitiveLocalResponse.emitted program (registers.phase, bit) = [])
    (notDeleted : ∀ localCount tombstoneCount,
      carrierLocalCount? program dispatcher.tree
        (actionAccumulator program (registers.phase, bit) carrier) = some localCount →
      carrierTombstoneCount? program dispatcher.tree
        (actionAccumulator program (registers.phase, bit) carrier) = some tombstoneCount →
      tombstoneCount ≠ localCount + 2)
    (count : Nat) (parents : List ParentFrame) {layers : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program dispatcher parents layers) :
    selectStep? program dispatcher
      (Cursor.rebuild parents
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (LocalResponse.completed bits continuation carrier
            (SchedulerResponse.completedRoute program dispatcher registers bit carrier)))) =
      some (Cursor.rebuild parents
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (LocalResponse.markedCompleted bits continuation carrier
            (SchedulerResponse.completedRoute program dispatcher registers bit carrier)))) := by
  obtain ⟨roles, history, placed⟩ := RootResetCleanParentPrefix.toPrefix outer
    (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
      (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier)))
  have selected := selectStep?_mixed_pending_empty_commit program dispatcher registers bit
    outerBits bits outerContinuation continuation carrier empty emitted notDeleted count placed
  rw [SchedulerInvariant.contextOfParents_plug] at selected
  exact selected

end PureSFormal.Research.RootResetMixedEmptyCommit
