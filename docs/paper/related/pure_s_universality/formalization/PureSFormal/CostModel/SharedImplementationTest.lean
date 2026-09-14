import PureSFormal.CostModel.DAGLocalObserver

/-! Executable smoke tests for failed finite-arena navigation and the
short-circuiting one-record observer. -/

namespace PureSFormal.CostModel.SharedImplementationTest

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieTableauExactCost
open PureSFormal.CostModel.DAGLocalObserver

def allS : Arena Unit where
  root := ()
  cell := fun _ => .s
  rank := fun _ => 0
  rank_decreases := by
    intro node fn arg impossible
    cases impossible

def allSStore : FiniteArena Unit where
  arena := allS
  retained := [()]
  retained_nodup := by simp
  retained_complete := by intro node; cases node; simp

example : (allSStore.navigate [.left]).value = none := rfl
example : (allSStore.navigate [.left]).ticks = 1 := rfl
example : allSStore.retainedCard = 1 := rfl
example : allSStore.liveCard = 1 := rfl

example (source : Instance) (history payload : BitWord) :
    (runTerminalCertificate allSStore source history payload).value = false :=
  rfl

example (source : Instance) (history payload : BitWord) :
    (runTerminalCertificate allSStore source history payload).ticks = 3 :=
  rfl

#eval (allSStore.navigate [.left]).ticks
#eval (parseHeaderNodesM? allS allS.root).ticks

end PureSFormal.CostModel.SharedImplementationTest
