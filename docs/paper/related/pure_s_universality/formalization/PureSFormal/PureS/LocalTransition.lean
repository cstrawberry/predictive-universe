import PureSFormal.PureS.CanonicalTraversal
import PureSFormal.PureS.CarrierActionDecode

/-!
# Complete local cyclic-tag transitions

This module joins the canonical carrier scan with the already counted frame,
route, and action reductions.  The nonempty theorem includes the unique front
cell contraction; the empty theorem performs no deletion and marks the
registered halt field.  Both conclusions concern bare pure-`S` terms and the
executable carrier decoder.
-/

namespace PureSFormal.PureS

namespace LocalTransition

open CanonicalTraversal

/-! ## Agreement of exact traversal with the executable decoder -/

/-- Wrapping a successfully decoded endpoint in an exact queue context appends
its live labels in front-to-rear order. -/
theorem QueueContext.decode_plug
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {context : Context} {appended : List Bool}
    (queue : QueueContext context appended)
    {endpoint : Term} {decoded : List Bool}
    (hdecode : CarrierDecoder.decode? program tree bits continuation
      hadmissible endpoint = some decoded) :
    CarrierDecoder.decode? program tree bits continuation hadmissible
        (context.plug endpoint) =
      some (decoded ++ appended) := by
  induction queue with
  | hole => simpa
  | @live innerContext innerDecoded bit inner ih =>
      change CarrierDecoder.decode? program tree bits continuation hadmissible
          (.app (PureSFormal.PureS.live bit) (innerContext.plug endpoint)) =
        some (decoded ++ (innerDecoded ++ [bit]))
      rw [CarrierDecoder.decode?_live]
      rw [ih]
      simp [List.append_assoc]
  | @tombstone innerContext innerDecoded bit audit inner ih =>
      change CarrierDecoder.decode? program tree bits continuation hadmissible
          (Carrier.tombstone bit (innerContext.plug endpoint) audit) =
        some (decoded ++ innerDecoded)
      rw [CarrierDecoder.decode?_tombstone]
      exact ih

/-- Every exact canonical descent computes to its indexed logical word. -/
theorem Descent.decode_eq
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {source : Term} {decoded : List Bool} {context : Context}
    (descent : Descent program tree bits continuation source decoded context) :
    CarrierDecoder.decode? program tree bits continuation hadmissible source =
      some decoded := by
  induction descent with
  | base queue =>
      exact CarrierDecoder.decode?_mutableBase_of_decodes program tree bits
        continuation hadmissible _ queue.decodes
  | @«local» snapshot currentContext segmentContext routeContext currentWord
      appended status route label snapshotInv current segment selectedRoute ih =>
      let accumulator := segmentContext.plug (currentContext.plug omega)
      let dispatcher := routeContext.plug
        (ReachableAudit.actionResponse program label snapshot accumulator)
      have currentDecode :
          CarrierDecoder.decode? program tree bits continuation hadmissible
              (currentContext.plug omega) = some currentWord := by
        simpa using ih
      have accumulatorDecode :
          CarrierDecoder.decode? program tree bits continuation hadmissible
              accumulator = some (currentWord ++ appended) := by
        exact LocalTransition.QueueContext.decode_plug program tree bits
          continuation hadmissible segment
          currentDecode
      have dispatch : DispatchParser.dispatchesTo program tree dispatcher
          accumulator := by
        exact (selectedRoute.snapshotDispatchAt accumulator).toDispatchesTo
      have shell : Carrier.LocalShell bits continuation dispatcher
          ((localContext program bits continuation snapshot status label
            routeContext segmentContext currentContext).plug omega) := by
        cases status with
        | fresh =>
            simpa [dispatcher, accumulator] using
              (Carrier.LocalShell.fresh dispatcher snapshot snapshot snapshot :
                Carrier.LocalShell bits continuation dispatcher
                  (Carrier.activeShell bits continuation
                    (freshHField snapshot) dispatcher snapshot snapshot))
        | marked =>
            simpa [dispatcher, accumulator] using
              (Carrier.LocalShell.marked dispatcher snapshot snapshot snapshot
                snapshot : Carrier.LocalShell bits continuation dispatcher
                  (Carrier.activeShell bits continuation
                    (Carrier.markedHField snapshot snapshot) dispatcher snapshot
                    snapshot))
      rw [CarrierDecoder.decode?_local program tree bits continuation
        hadmissible dispatch shell]
      exact accumulatorDecode

/-- The executable decoder and canonical traversal agree on every
reachable-audit carrier. -/
theorem decode_of_holds
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {source : Term}
    (holds : ReachableAudit.Holds program tree bits continuation source) :
    ∃ decoded context,
      Descent program tree bits continuation source decoded context ∧
      CarrierDecoder.decode? program tree bits continuation hadmissible source =
        some decoded := by
  obtain ⟨decoded, context, descent⟩ := Descent.ofHolds holds
  exact ⟨decoded, context, descent,
    LocalTransition.Descent.decode_eq program tree bits continuation
      hadmissible descent⟩

/-! ## The two complete local responses -/

/--
One nonempty CTS step, including the single canonical C4 deletion.  The exact
cost is one deletion plus the frame/route/action cost, and the endpoint
decodes to the absorbing CTS successor.
-/
theorem executeNonempty
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (bit : Bool) (suffix seedBits : List Bool)
    (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (sourceInv : ReachableAudit.Holds program actions.tree seedBits continuation
      source)
    (sourceDecode : CarrierDecoder.decode? program actions.tree seedBits
      continuation hadmissible source = some (bit :: suffix)) :
    ∃ predecessor completedRoute,
      StepsN (1 + LocalResponse.completedCost program
        (actions.route (phase, bit)) (phase, bit))
        (frame
          (environmentCode (compileActions program actions.tree) seedBits)
          continuation source)
        (LocalResponse.completed seedBits continuation predecessor
          completedRoute) ∧
      ReachableAudit.Holds program actions.tree seedBits continuation
        (LocalResponse.completed seedBits continuation predecessor
          completedRoute) ∧
      CarrierDecoder.decode? program actions.tree seedBits continuation
          hadmissible
          (LocalResponse.completed seedBits continuation predecessor
            completedRoute) =
        some ((CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data) ∧
      Term.subterm?
          (LocalResponse.completed seedBits continuation predecessor
            completedRoute)
          LocalResponse.continuationAddress = some continuation := by
  obtain ⟨decoded, context, descent, descentDecode⟩ :=
    decode_of_holds program actions.tree seedBits continuation hadmissible
      sourceInv
  have decodedEq : decoded = bit :: suffix := by
    have : (some decoded : Option (List Bool)) = some (bit :: suffix) :=
      descentDecode.symm.trans sourceDecode
    exact Option.some.inj this
  subst decoded
  obtain ⟨predecessor, targetContext, deletedCellPredecessor, outerContext,
      predecessorDescent, predecessorInv, certificate, deletion,
      selected, replaced, later⟩ := descent.deleteFront
  have predecessorDecode :
      CarrierDecoder.decode? program actions.tree seedBits continuation
          hadmissible predecessor = some suffix :=
    LocalTransition.Descent.decode_eq program actions.tree seedBits continuation
      hadmissible predecessorDescent
  obtain ⟨completedRoute, path, response, resultInv, resultDecode,
      continuationLiteral⟩ :=
    CarrierActionDecode.executeSelectedDecoded program actions phase bit seedBits
      continuation predecessor hadmissible predecessorInv predecessorDecode
  have deletionInFrame : StepsN 1
      (frame
        (environmentCode (compileActions program actions.tree) seedBits)
        continuation source)
      (frame
        (environmentCode (compileActions program actions.tree) seedBits)
        continuation predecessor) := by
    exact StepsN.appRight
      (.app
        (environmentCode (compileActions program actions.tree) seedBits)
        continuation)
      deletion
  exact ⟨predecessor, completedRoute,
    StepsN.trans deletionInFrame response, resultInv, resultDecode,
    continuationLiteral⟩

/--
The absorbing-empty branch selects the zero action, marks exactly the fresh
halt field, preserves the empty decoding, and keeps the continuation at the
literal `RL` occurrence.
-/
theorem executeEmpty
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (seedBits : List Bool)
    (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (sourceInv : ReachableAudit.Holds program actions.tree seedBits continuation
      source)
    (sourceDecode : CarrierDecoder.decode? program actions.tree seedBits
      continuation hadmissible source = some []) :
    ∃ completedRoute,
      StepsN (5 + 2 * (actions.route (phase, false)).length)
        (frame
          (environmentCode (compileActions program actions.tree) seedBits)
          continuation source)
        (LocalResponse.markedCompleted seedBits continuation source
          completedRoute) ∧
      ReachableAudit.Holds program actions.tree seedBits continuation
        (LocalResponse.markedCompleted seedBits continuation source
          completedRoute) ∧
      CarrierDecoder.decode? program actions.tree seedBits continuation
          hadmissible
          (LocalResponse.markedCompleted seedBits continuation source
            completedRoute) = some [] ∧
      Term.subterm?
          (LocalResponse.markedCompleted seedBits continuation source
            completedRoute)
          LocalResponse.continuationAddress = some continuation := by
  obtain ⟨completedRoute, path, response, resultInv, dispatchInv,
      continuationLiteral⟩ :=
    CompleteLayer.executeZeroMarked program actions phase seedBits continuation
      source sourceInv
  have resultDecode :
      CarrierDecoder.decode? program actions.tree seedBits continuation
          hadmissible
          (LocalResponse.markedCompleted seedBits continuation source
            completedRoute) = some [] := by
    rw [CarrierDecoder.decode?_local program actions.tree seedBits continuation
      hadmissible dispatchInv.toDispatchesTo
      (LocalResponse.markedCompleted_localShell seedBits continuation source
        completedRoute)]
    exact sourceDecode
  exact ⟨completedRoute, response, resultInv, resultDecode,
    continuationLiteral⟩

end LocalTransition

end PureSFormal.PureS
