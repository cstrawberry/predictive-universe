import PureSFormal.Research.RootResetFiniteStagePhaseSelectorChain

/-! The actual encoded generator's first contraction is selected by the
same complete finite selector used by every later stage. -/
namespace PureSFormal.Research.RootResetFiniteInitialPrelude
open PureSFormal.PureS

theorem selectStep?_initial (program : CTS.Program) (layout : ActionDispatcher program) (bits : List Bool) :
    RootResetFinitePrioritySelector.selectStep? program layout (generator (compileActions program layout.tree) bits) =
      some (SchedulerInvariant.firstMutationConfiguration program layout bits).cursor.erase :=
  RootResetFiniteClockFuelSelection.growth (program := program) (layout := layout) .root bits 0 0 0 _ rfl

theorem initialPrelude_selectorChain (program : CTS.Program) (layout : ActionDispatcher program) (bits : List Bool) :
    RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program layout)
      (SchedulerControl.initialConfiguration program layout bits)
      (SchedulerRecurrence.initialPreludeConfigurations program layout bits) :=
  .next (selectStep?_initial program layout bits) (.done (SchedulerInvariant.firstMutationConfiguration program layout bits))

end PureSFormal.Research.RootResetFiniteInitialPrelude
