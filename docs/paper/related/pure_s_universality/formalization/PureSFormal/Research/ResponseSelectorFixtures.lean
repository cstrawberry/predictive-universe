import PureSFormal.Research.RootResetPersistentResponseSelector
import PureSFormal.PureS.BalancedActionTree

namespace PureSFormal.Research.ResponseSelectorFixtures

open PureSFormal.PureS
open PureSFormal.PureS.SchedulerResponseInvariant

def toy : CTS.Program :=
  { period := 1
    period_pos := by decide
    appendant := fun _ => [] }

def layout : ActionDispatcher toy := BalancedActionTree.dispatcher toy

def terms : Nat → List Term
  | 0 => [.s]
  | n + 1 =>
      let prior := terms n
      prior ++ prior.flatMap fun left => prior.map fun right => .app left right

def agrees (continuation carrier : Term) : Bool :=
  RootResetPersistentResponseSelector.selectStep? toy layout
      (frameFirstRoot (compileActions toy layout.tree) [] continuation carrier) ==
    some (frameSecondRoot (compileActions toy layout.tree) [] continuation carrier)

def actions : Term := compileActions toy layout.tree

/-- Makes the whole frame-first term match the raw open-Base grammar. -/
def maliciousCarrier (queue seed inner : Term) : Term :=
  .app
    (.app (CheckpointDecoder.openEnvironment actions queue)
      (.app b (CheckpointDecoder.openEnvironment actions seed)))
    inner

def maliciousFrame (continuation queue seed inner : Term) : Term :=
  frameFirstRoot actions [] continuation (maliciousCarrier queue seed inner)

#eval RootResetClockFuelStages.parseOpenBase? actions
  (maliciousFrame .s .s .s .s)
#eval RootResetClockFuelStages.parseFuelActive? actions
  (maliciousFrame .s .s .s .s)
#eval RootResetCompositeStageRegistry.parseCanonicalFuelActive? actions
  (maliciousFrame .s .s .s .s)
#eval (RootResetPersistentFuelCarrier.parse? actions
  (maliciousFrame .s .s .s .s)).isSome
#eval RootResetPersistentResponseSelector.selectStep? toy layout
  (maliciousFrame .s .s .s .s)
#eval agrees .s (maliciousCarrier .s .s .s)

#eval (terms 3).length
#eval ((terms 3).flatMap fun k => (terms 3).map fun c => agrees k c).count false

end PureSFormal.Research.ResponseSelectorFixtures
