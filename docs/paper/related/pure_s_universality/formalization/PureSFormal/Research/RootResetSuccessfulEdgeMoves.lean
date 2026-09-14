import PureSFormal.Research.RootResetProgressEulerContract

/-!
# Successful edge-traversal bounds for the root-reset selectors

The shared selector contract distinguishes issued movement instructions from
successful one-edge cursor traversals.  This module specializes the latter
metric to the complete coefficient-28 Euler walker and the coefficient-51
guarded progress/Euler controller.
-/

namespace PureSFormal.Research

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open RootResetSelectorContract

namespace RootResetEulerWalker

/--
The coefficient-28 Euler selector successfully traverses at most
`28 * (|T| + 1)` occurrence-tree edges on every finite input.
-/
theorem selector_successfulEdgeMoves_linear (term : Term) :
    runSuccessfulEdgeMoveCount machine (rootExecution term).ticks
        (initial term) ≤
      28 * (term.size + 1) := by
  simpa [selectorContract, RootResetSelectorContract.Contract.initial] using!
    RootResetSelectorContract.Contract.successfulEdgeMoves_le
      selectorContract term

end RootResetEulerWalker

namespace RootResetProgressEulerContract

/--
The coefficient-51 guarded progress/Euler selector successfully traverses at
most `51 * (|T| + 1)` occurrence-tree edges on every finite input.
-/
theorem selector_successfulEdgeMoves_linear (term : Term) :
    runSuccessfulEdgeMoveCount selectorContract.machine
        (selectorContract.stoppingTime term) (selectorContract.initial term) ≤
      51 * (term.size + 1) :=
  selectorContract.successfulEdgeMoves_le term

end RootResetProgressEulerContract

end PureSFormal.Research
