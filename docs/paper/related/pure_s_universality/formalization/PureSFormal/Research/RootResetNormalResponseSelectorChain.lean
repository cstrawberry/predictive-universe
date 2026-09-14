import PureSFormal.Research.RootResetFrameFirstSelectorProof
import PureSFormal.Research.RootResetFrameSecondSelectorProof

/-!
# Normal-response selector chains

This module packages the root-reset selector equations for the exact FRAME
prefix.  Each invocation receives only the current bare term.  The two
equations below cover the complete prefix from `R₁` through `R₂` to the fresh
Local response shell, uniformly in every opaque carrier and continuation.
-/

namespace PureSFormal.Research.RootResetNormalResponseSelectorChain

open PureSFormal.PureS
open PureSFormal.PureS.SchedulerResponseInvariant

/-! ## Root-level FRAME prefix -/

/-- The first sampled FRAME residual selects the exact second residual. -/
theorem selectStep?_frameFirstRoot
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (frameFirstRoot (compileActions program dispatcher.tree) bits
          continuation carrier) =
      some (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) := by
  exact RootResetFrameFirstSelectorProof.selectStep?_frameFirstRoot_structured
    program dispatcher bits continuation carrier

/-- The second sampled FRAME residual selects the exact fresh Local shell. -/
theorem selectStep?_frameSecondRoot
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (frameSecondRoot (compileActions program dispatcher.tree) bits
          continuation carrier) =
      some (freshLocal (compileActions program dispatcher.tree) bits
        continuation carrier) := by
  exact RootResetFrameSecondSelectorProof.selectStep?_frameSecondRoot
    program dispatcher bits continuation carrier

end PureSFormal.Research.RootResetNormalResponseSelectorChain
