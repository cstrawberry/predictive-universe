import PureSFormal.Research.RootResetFiniteBitConsJob
import PureSFormal.Research.RootResetFiniteInitialPrelude
import PureSFormal.Research.RootResetFiniteJobHandoff
import PureSFormal.Research.RootResetParametricNonemptyTraceAgreement

/-! The concrete finite selector satisfies every local law of stage assembly. -/
namespace PureSFormal.Research.RootResetFiniteStageLaws
open PureSFormal.PureS

theorem laws : RootResetStageSelectionLaws.Laws RootResetFinitePrioritySelector.selectStep? where
  prelude := RootResetFiniteInitialPrelude.initialPrelude_selectorChain
  phase := fun program layout bits registers parents {_} clean fuel =>
    (RootResetFiniteStagePhaseSelectorChain.positiveStage_finite_exact_selectorChain
      program layout bits registers parents clean fuel).2
  handoff := RootResetFiniteJobHandoff.handoffFuel_selectorChain
  job := RootResetFiniteBitConsJob.completeJob_selectorChain

theorem bitcons_selectsEveryContractionRun
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (index : Nat) :
    let bits := bit :: suffix
    let system := SchedulerInvariant.SampledGood.productiveSystem program layout bits
      (SchedulerBound.bound program layout) (SchedulerControl.initialConfiguration program layout bits)
      (SchedulerRecurrence.initialGood program layout bits)
    RootResetFinitePrioritySelector.selectStep? program layout (system.contractionRun index).cursor.erase =
      some (system.contractionRun (index + 1)).cursor.erase :=
  RootResetParametricNonemptyTraceAgreement.bitcons_selectsEveryContractionRun laws program layout bit suffix index

end PureSFormal.Research.RootResetFiniteStageLaws
