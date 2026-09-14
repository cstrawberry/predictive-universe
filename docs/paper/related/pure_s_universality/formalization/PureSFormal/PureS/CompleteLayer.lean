import PureSFormal.PureS.ActionTree
import PureSFormal.PureS.ReachableAudit

/-!
# Complete route selection for Local layers

The lower response theorem is parameterized by a route witness.  A compiled
finite scheduler carries a complete dispatcher, so the requested phase/bit
action always has such a route.  This module packages that finite selection
with exact snapshot provenance and the recursive carrier audit.
-/

namespace PureSFormal.PureS

namespace CompleteLayer

/--
Every phase/bit selection executes a complete fresh Local layer.  The route
is exposed existentially; no global choice function is introduced.
-/
theorem executeSelected
    (program : CTS.Program) (actions : ActionDispatcher program)
    (label : ActionLabel program)
    (bits : List Bool) (continuation snapshot : Term)
    (snapshotInv : ReachableAudit.Holds program actions.tree bits continuation
      snapshot) :
    ∃ completedRoute,
      Dispatcher.HasRoute actions.tree (actions.route label) label ∧
      StepsN (LocalResponse.completedCost program (actions.route label) label)
        (frame
          (environmentCode (compileActions program actions.tree) bits)
          continuation snapshot)
        (LocalResponse.completed bits continuation snapshot completedRoute) ∧
      ReachableAudit.Holds program actions.tree bits continuation
        (LocalResponse.completed bits continuation snapshot completedRoute) ∧
      ReachableAudit.SnapshotDispatchAt program actions.tree snapshot
        (actions.route label)
        label (actionAccumulator program label snapshot) completedRoute := by
  let route := actions.route label
  have path := actions.selectedRoute label
  obtain ⟨completedRoute, steps, resultInv, dispatchInv⟩ :=
    snapshotInv.executeLayer program path bits continuation snapshot
  exact ⟨completedRoute, path, steps, resultInv, dispatchInv⟩

/--
The absorbing-empty response chooses the zero action and marks only the fresh
registered halt field.  It preserves the strong audit invariant and retains
the continuation literally at address `RL`.
-/
theorem executeZeroMarked
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program)
    (bits : List Bool) (continuation snapshot : Term)
    (snapshotInv : ReachableAudit.Holds program actions.tree bits continuation
      snapshot) :
    ∃ completedRoute,
      Dispatcher.HasRoute actions.tree (actions.route (phase, false))
        (phase, false) ∧
      StepsN (5 + 2 * (actions.route (phase, false)).length)
        (frame
          (environmentCode (compileActions program actions.tree) bits)
          continuation snapshot)
        (LocalResponse.markedCompleted bits continuation snapshot
          completedRoute) ∧
      ReachableAudit.Holds program actions.tree bits continuation
        (LocalResponse.markedCompleted bits continuation snapshot
          completedRoute) ∧
      ReachableAudit.SnapshotDispatchAt program actions.tree snapshot
        (actions.route (phase, false))
        (phase, false) snapshot completedRoute ∧
      Term.subterm?
        (LocalResponse.markedCompleted bits continuation snapshot completedRoute)
        LocalResponse.continuationAddress = some continuation := by
  let route := actions.route (phase, false)
  have path := actions.selectedRoute (phase, false)
  obtain ⟨completedRoute, responseSteps, resultInv, dispatchInv⟩ :=
    snapshotInv.executeLayer program path bits continuation snapshot
  have freshLayer :
      ReachableAudit.Layer program actions.tree bits continuation snapshot
        snapshot
        (LocalResponse.completed bits continuation snapshot completedRoute)
        .fresh route (phase, false) completedRoute := by
    refine
      { dispatch := ?_
        result_eq := rfl }
    simpa using dispatchInv
  obtain ⟨markStep, markedInv⟩ :=
    ReachableAudit.Holds.markLayer snapshotInv snapshotInv
      (.endpoint : Carrier.QueueSegment snapshot snapshot) freshLayer
  have combined := StepsN.trans responseSteps markStep
  have count :
      LocalResponse.completedCost program route (phase, false) + 1 =
        5 + 2 * route.length := by
    simp only [LocalResponse.completedCost, actionCost_zero, Nat.add_zero]
    rw [← Nat.add_assoc 3 (2 * route.length) 1]
    rw [Nat.add_comm 3 (2 * route.length)]
    rw [Nat.add_comm 5 (2 * route.length)]
  rw [count] at combined
  refine ⟨completedRoute, path, combined, markedInv, ?_, ?_⟩
  · simpa using dispatchInv
  · exact LocalResponse.markedCompleted_continuation
      bits continuation snapshot completedRoute

end CompleteLayer

end PureSFormal.PureS
