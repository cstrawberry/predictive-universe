import PureSFormal.PureS.CarrierDecoder
import PureSFormal.PureS.CompleteLayer
import PureSFormal.PureS.ActionDecode

/-!
# Selected-action semantics for recursively decoded carriers

`ActionDecode` establishes appender order for a flat cell spine.  A reachable
job may already contain nested Local roots, so its active accumulator is a
recursive carrier path.  The same literal live wrappers append in the same
order under the total carrier decoder.
-/

namespace PureSFormal.PureS

namespace CarrierActionDecode

/-- Live wrappers produced by an appender append their bits in source order. -/
theorem decode_appenderAccumulator
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (seedBits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (appendant : List Bool) {initial : Term} {decoded : List Bool}
    (hdecode : CarrierDecoder.decode? program tree seedBits continuation
      hadmissible initial = some decoded) :
    CarrierDecoder.decode? program tree seedBits continuation hadmissible
        (appenderAccumulator appendant initial) =
      some (decoded ++ appendant) := by
  induction appendant generalizing initial decoded with
  | nil => simpa using hdecode
  | cons bit appendant ih =>
      rw [appenderAccumulator_cons]
      have extended :
          CarrierDecoder.decode? program tree seedBits continuation hadmissible
              (extendAccumulator bit initial) =
            some (decoded ++ [bit]) := by
        rw [extendAccumulator, CarrierDecoder.decode?_live, hdecode]
        rfl
      have rest := ih extended
      simpa [List.append_assoc] using rest

/-- A selected action performs the exact recursive-carrier data update. -/
theorem decode_actionAccumulator
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (seedBits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (label : ActionLabel program) {initial : Term} {decoded : List Bool}
    (hdecode : CarrierDecoder.decode? program tree seedBits continuation
      hadmissible initial = some decoded) :
    CarrierDecoder.decode? program tree seedBits continuation hadmissible
        (actionAccumulator program label initial) =
      some (ActionDecode.outputData program label decoded) := by
  rcases label with ⟨phase, bit⟩
  cases bit with
  | false => exact hdecode
  | true =>
      exact decode_appenderAccumulator program tree seedBits continuation
        hadmissible (program.appendant phase) hdecode

/-- The recursive action result agrees with the nonempty CTS successor data. -/
theorem decode_actionAccumulator_eq_CTS
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (seedBits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (phase : CTS.Phase program) (bit : Bool)
    {initial : Term} {tail : List Bool}
    (hdecode : CarrierDecoder.decode? program tree seedBits continuation
      hadmissible initial = some tail) :
    CarrierDecoder.decode? program tree seedBits continuation hadmissible
        (actionAccumulator program (phase, bit) initial) =
      some ((CTS.absorbingStep program ⟨phase, bit :: tail⟩).data) := by
  rw [← ActionDecode.outputData_eq_ordinaryStep_data]
  exact decode_actionAccumulator program tree seedBits continuation hadmissible
    (phase, bit) hdecode

/-- An exact-provenance completed Local layer inherits the action decode. -/
theorem decode_completed
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (seedBits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {snapshot completedRoute : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {decoded : List Bool}
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label (actionAccumulator program label snapshot) completedRoute)
    (hdecode : CarrierDecoder.decode? program tree seedBits continuation
      hadmissible snapshot = some decoded) :
    CarrierDecoder.decode? program tree seedBits continuation hadmissible
        (LocalResponse.completed seedBits continuation snapshot completedRoute) =
      some (ActionDecode.outputData program label decoded) := by
  rw [CarrierDecoder.decode?_local program tree seedBits continuation
    hadmissible dispatch.toDispatchesTo
    (LocalResponse.completed_localShell seedBits continuation snapshot
      completedRoute)]
  exact decode_actionAccumulator program tree seedBits continuation hadmissible
    label hdecode

/--
Complete finite route selection, exact contraction count, audit preservation,
literal continuation recovery, and recursive output decoding in one theorem.
-/
theorem executeSelectedDecoded
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (bit : Bool)
    (seedBits : List Bool) (continuation snapshot : Term)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program actions.tree seedBits
      continuation snapshot)
    {tail : List Bool}
    (hdecode : CarrierDecoder.decode? program actions.tree seedBits continuation
      hadmissible snapshot = some tail) :
    ∃ completedRoute,
      Dispatcher.HasRoute actions.tree (actions.route (phase, bit))
        (phase, bit) ∧
      StepsN (LocalResponse.completedCost program (actions.route (phase, bit))
        (phase, bit))
        (frame
          (environmentCode (compileActions program actions.tree) seedBits)
          continuation snapshot)
        (LocalResponse.completed seedBits continuation snapshot completedRoute) ∧
      ReachableAudit.Holds program actions.tree seedBits continuation
        (LocalResponse.completed seedBits continuation snapshot completedRoute) ∧
      CarrierDecoder.decode? program actions.tree seedBits continuation
          hadmissible
          (LocalResponse.completed seedBits continuation snapshot completedRoute) =
        some ((CTS.absorbingStep program ⟨phase, bit :: tail⟩).data) ∧
      Term.subterm?
          (LocalResponse.completed seedBits continuation snapshot completedRoute)
          LocalResponse.continuationAddress = some continuation := by
  obtain ⟨completedRoute, path, steps, resultInv, dispatchInv⟩ :=
    CompleteLayer.executeSelected program actions (phase, bit) seedBits
      continuation snapshot snapshotInv
  refine ⟨completedRoute, path, steps, resultInv, ?_, ?_⟩
  · rw [CarrierDecoder.decode?_local program actions.tree seedBits
      continuation hadmissible dispatchInv.toDispatchesTo
      (LocalResponse.completed_localShell seedBits continuation snapshot
        completedRoute)]
    exact decode_actionAccumulator_eq_CTS program actions.tree seedBits
      continuation hadmissible phase bit hdecode
  · exact LocalResponse.completed_continuation seedBits continuation snapshot
      completedRoute

end CarrierActionDecode

end PureSFormal.PureS
