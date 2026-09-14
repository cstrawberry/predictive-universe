import PureSFormal.Research.RootResetMixedResponseContext

/-! Clock, fuel, and FRAME selection through arbitrary completed histories. -/
namespace PureSFormal.Research.RootResetMixedClockFuelSelectorChain

open PureSFormal.PureS
open RootResetPersistentResponseSelector RootResetReachableStageGrammar
open RootResetResponseClockFuelAgreement RootResetFreshClockSelectorChain
open RootResetFreshResponseSelectorChain RootResetMixedResponseContext
open RootResetWrappedFrameSelectorProof RootResetPendingResponseContext
open RootResetClockFuelStages RootResetClockFuelCanonicalGrammar
open RootResetPersistentClockFuelAgreement RootResetActivatedRouteExclusion
open RootResetCompositeStageRegistry RootResetMarkedFrameSelectorProof
open SchedulerInvariant RootResetEmptyHandoffContext RootResetEmptyPostMarkerHandoff
open RootResetEmptyContinuationSelector

/-- A recovered active row retains its exact selected contraction beneath
any generated mixture of fresh and marked completed continuations. -/
theorem selectStep?_mixed_of_recovered
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    {whole endpoint : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole endpoint context roles history)
    (inner : RootResetPersistentRouteA.ActiveContext program) (count : Nat)
    (activeRoot : RootResetPersistentRouteA.activeContext program dispatcher endpoint = inner)
    (fuelRoot : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher endpoint = inner)
    (responseRoot : responseOuter program dispatcher endpoint = inner)
    (rolesEq : inner.roles = List.replicate count .pendingFrameChild)
    (stopped : RootResetPersistentRouteA.next? program dispatcher inner.active = none)
    (fuelNone : RootResetPersistentFuelCarrier.parse?
      (compileActions program dispatcher.tree) inner.active = none)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree inner.active = none)
    (notSix : inner.active.headArity ≠ 6) (notTwo : inner.active.headArity ≠ 2)
    (target : Term) (address : Address)
    (selected : RouteA.Selects program dispatcher inner.active target address) :
    selectStep? program dispatcher whole = some (context.plug (inner.context.plug target)) := by
  let outer := prepend context roles history inner
  have activeEq : RootResetPersistentRouteA.activeContext program dispatcher whole = outer := by
    rw [shape.contexts.1, activeRoot]
  have fuelEq : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher whole = outer := by
    rw [shape.contexts.2.1, fuelRoot]
  have outerEq : responseOuter program dispatcher whole = outer := by
    rw [shape.contexts.2.2, responseRoot]
  have noBaseFinal : ∀ view : RootResetWholeAppenderStages.View program,
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).route.endpoint =
        some (.registered (.appender view)) → view.stage ≠ .secondFinal := by
    intro view parsed
    rw [RootResetPersistentRouteAFuel.classifyHandoff, fuelEq] at parsed
    dsimp only [outer, prepend] at parsed
    rw [fuelNone] at parsed
    change (RootResetPersistentRouteA.classify program dispatcher whole).endpoint = _ at parsed
    rw [RootResetPersistentRouteA.classify, activeEq] at parsed
    exact registeredAppender_not_final_of_local_none localNone parsed
  have historical := shape.historical_priorities count
    (by rw [activeRoot]; exact rolesEq)
    (by rw [outerEq]; exact localNone) noBaseFinal
  have noPending : addressBeforePendingMarked? outer.roles = none := by
    change addressBeforePendingMarked? (roles ++ inner.roles) = none
    rw [rolesEq]
    exact shape.noPendingMarked count
  have clear := prioritiesClear_of_recoveredOuter program dispatcher whole outer
    outerEq activeEq localNone notSix notTwo
    historical.1 historical.2.1 historical.2.2.1 noPending
  rw [selectStep?_eq_persistent_of_prioritiesClear clear]
  have recovered := RootResetPersistentRouteA.activeContext_sound program dispatcher whole
  rw [activeEq] at recovered
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    outer.context address selected.2
  change (outer.context.plug outer.active).contractAt?
    (RootResetSelectorContract.contextAddress outer.context ++ address) =
      some (outer.context.plug target) at lifted
  rw [recovered.source_eq, recovered.contextAddress_eq] at lifted
  unfold RootResetPersistentSelector.selectStep? RootResetPersistentSelector.selection?
    RootResetPersistentRouteAFuel.classifyHandoff
  rw [fuelEq]
  dsimp only [outer, prepend]
  rw [fuelNone]
  dsimp only
  rw [routeAddress_of_recoveredOuter program dispatcher whole outer activeEq
    stopped address selected.1]
  unfold RootResetPersistentRouteAFuel.checkedSelection?
  dsimp only
  rw [lifted]
  rw [show outer.context = context.comp inner.context from rfl, Context.plug_comp]
  rfl

/-- The unfinished registered response rows, including both FRAME residuals,
retain their contraction under arbitrary pending depth and mixed history. -/
theorem selectStep?_mixed_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term target : Term) (address : Address)
    (stopped : RootResetPersistentRouteA.next? program dispatcher term = none)
    (registered : ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
      term = some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true)
    (canonicalNone : parseCanonicalFuelActive? (compileActions program dispatcher.tree) term = none)
    (descent : responseDescentContext program dispatcher term = ⟨term, .hole, [], [], []⟩)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree term = none)
    (notSix : term.headArity ≠ 6) (notTwo : term.headArity ≠ 2)
    (selected : (RootResetPersistentRouteA.classify program dispatcher term).selectedAddress? = some address)
    (contracts : term.contractAt? address = some target)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) bits continuation count term)
      context roles history) :
    selectStep? program dispatcher whole = some (context.plug
      (pending (compileActions program dispatcher.tree) bits continuation count target)) := by
  have fuelNone : RootResetPersistentFuelCarrier.parse?
      (compileActions program dispatcher.tree) term = none := by
    rw [RootResetPersistentFuelCarrier.parse?, canonicalNone]
  have result := selectStep?_mixed_of_recovered program dispatcher shape
    (pendingOuter program (compileActions program dispatcher.tree) bits continuation term count)
    count
    (activeContext_pending program dispatcher bits continuation term stopped registered count)
    (fuelActiveContext_pending program dispatcher bits continuation term stopped registered canonicalNone count)
    (responseOuter_pending program dispatcher bits continuation term stopped registered canonicalNone descent count)
    rfl stopped fuelNone localNone notSix notTwo target address ⟨selected, contracts⟩
  simpa only [pendingOuter, pendingContext_plug] using result

theorem selectStep?_mixed_pendingFuelRow
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program dispatcher.tree) layers)
    (row : FuelRow) (canonical : CanonicalFuelRow (compileActions program dispatcher.tree) row)
    {whole : Term} {context : Context} {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pendingFuelRowTerm (compileActions program dispatcher.tree) layers row) context roles history) :
    selectStep? program dispatcher whole =
      some (context.plug ((pendingContext layers).plug row.target)) := by
  have notSix : row.term.headArity ≠ 6 := by
    intro equal
    have bound := row.term_headArity_le_four
    rw [equal] at bound
    exact (by decide : ¬ 6 ≤ 4) bound
  exact selectStep?_mixed_of_recovered program dispatcher shape
    (pendingFuelRowActiveContext program layers row) layers.length
    (activeContext_pendingFuelRow program dispatcher route row canonical)
    (fuelActiveContext_pendingFuelRow program dispatcher route row canonical)
    (responseOuter_pendingFuelRow program dispatcher route row canonical) rfl
    (next?_canonicalFuelRow_none program dispatcher row canonical)
    (parseFuelHandoff?_canonicalPendingFuelRow_none program dispatcher [] row trivial canonical)
    (parseLocal?_canonicalFuelRow_none program dispatcher row canonical)
    notSix (RootResetMarkedFuelSelectorChain.fuelRow_headArity_ne_two row)
    row.target row.localAddress (canonicalFuelRow_selects program dispatcher row canonical)

theorem selectStep?_mixed_exit
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) (bound : remaining ≤ horizon)
    {whole : Term} {context : Context} {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (exitTerm program dispatcher horizon remaining bits)
      context roles history) :
    selectStep? program dispatcher whole = some (context.plug
      (RootResetEmptyContinuationSelector.exitTarget program dispatcher horizon bits remaining)) := by
  have roots := exit_contexts program dispatcher horizon remaining bits bound
  exact selectStep?_mixed_of_recovered program dispatcher shape _ 0
    roots.1 roots.2.1 roots.2.2 rfl
    (exit_next_none program dispatcher horizon remaining bits)
    (exit_fuel_none program dispatcher horizon remaining bits bound)
    (exit_local_none program dispatcher horizon remaining bits)
    (exit_not_six program dispatcher horizon remaining bits)
    (RootResetEmptyContinuationSelector.exit_not_two program dispatcher horizon remaining bits)
    _ (RootResetEmptyContinuationSelector.exitAddress remaining)
    (RootResetEmptyContinuationSelector.exit_route_selects program dispatcher horizon remaining bits bound)

theorem selectStep?_mixed_clockPostPositive
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage)
    {whole target : Term} {context : Context} {address : Address}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (clockPostPositiveTerm program dispatcher stage wrappers remaining bits) context roles history)
    (selected : RouteA.Selects program dispatcher
      (clockPostPositiveTerm program dispatcher stage wrappers remaining bits) target address) :
    selectStep? program dispatcher whole = some (context.plug target) := by
  exact selectStep?_mixed_of_recovered program dispatcher shape _ 0
    (activeContext_clockPostPositive program dispatcher stage wrappers remaining bits)
    (fuelActiveContext_clockPostPositive program dispatcher stage wrappers remaining bits balance)
    (responseOuter_clockPostPositive program dispatcher stage wrappers remaining bits balance) rfl
    (next?_clockPostPositive_none program dispatcher stage wrappers remaining bits)
    (parseFuelHandoff?_canonicalClock_none (by cases remaining <;> rfl)
      (clockPostPositive_canonical program dispatcher stage wrappers remaining bits balance))
    (parseLocal?_clockPostPositive_none program dispatcher stage wrappers remaining bits)
    (by simp [clockPostPositiveTerm, clockGrowthCore, clockWrap])
    (clockPostPositiveTerm_headArity_ne_two program dispatcher stage wrappers remaining bits)
    target address selected

end PureSFormal.Research.RootResetMixedClockFuelSelectorChain
