import PureSFormal.Research.RootResetNormalResponseSelectorChain

namespace PureSFormal.Research.ResponseSelectorExamples
open PureSFormal PureSFormal.PureS
open PureSFormal.PureS.SchedulerResponseInvariant
open RootResetFrameFirstSelectorProof

example
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    (Research.RootResetPersistentRouteAFuel.classifyHandoff program dispatcher
      (frameFirstRoot (compileActions program dispatcher.tree) bits continuation
        carrier)).fuel = none := by
  unfold Research.RootResetPersistentRouteAFuel.classifyHandoff
  rw [first_fuelActiveContext program dispatcher bits continuation carrier]
  dsimp only
  rw [first_fuel_none program dispatcher bits continuation carrier]

example
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    (Research.RootResetPersistentRouteAFuel.classifyHandoff program dispatcher
      (frameFirstRoot (compileActions program dispatcher.tree) bits continuation
        carrier)).selected? = some
      ⟨[.left], frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier⟩ := by
  exact first_base_selected program dispatcher bits continuation carrier

example
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    Research.RootResetPersistentResponseSelector.selectStep? program dispatcher
        (frameFirstRoot (compileActions program dispatcher.tree) bits
          continuation carrier) =
      some (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) := by
  exact Research.RootResetNormalResponseSelectorChain.selectStep?_frameFirstRoot
    program dispatcher bits continuation carrier

end PureSFormal.Research.ResponseSelectorExamples
