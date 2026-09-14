import PureSFormal.Research.RootResetFiniteStageLaws
import PureSFormal.Research.RootResetFiniteInitialEmptyStages
import PureSFormal.Research.RootResetAllInputsTraceAgreement

/-! The actual finite root-restarted controller selects every contraction
sample for every CTS program and input. The transferred path retains exact
checkpoints, rejection of every other sample, and productivity. -/
namespace PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement
open PureSFormal.PureS

theorem selectsEveryContractionRun
    (program : CTS.Program) (layout : ActionDispatcher program) (bits : List Bool) (index : Nat) :
    let system := SchedulerInvariant.SampledGood.productiveSystem program layout bits
      (SchedulerBound.bound program layout) (SchedulerControl.initialConfiguration program layout bits)
      (SchedulerRecurrence.initialGood program layout bits)
    RootResetFinitePrioritySelector.selectStep? program layout (system.contractionRun index).cursor.erase =
      some (system.contractionRun (index + 1)).cursor.erase := by
  cases bits with
  | nil => exact RootResetFiniteInitialEmptyStages.emptyInput_selectsEveryContractionRun program layout index
  | cons bit suffix => exact RootResetFiniteStageLaws.bitcons_selectsEveryContractionRun program layout bit suffix index

theorem agreesWithStructuralSelector
    (program : CTS.Program) (layout : ActionDispatcher program) (bits : List Bool) (index : Nat) :
    let system := SchedulerInvariant.SampledGood.productiveSystem program layout bits
      (SchedulerBound.bound program layout) (SchedulerControl.initialConfiguration program layout bits)
      (SchedulerRecurrence.initialGood program layout bits)
    RootResetFinitePrioritySelector.selectStep? program layout (system.contractionRun index).cursor.erase =
      RootResetPersistentResponseSelector.selectStep? program layout (system.contractionRun index).cursor.erase :=
  (selectsEveryContractionRun program layout bits index).trans
    (RootResetAllInputsTraceAgreement.selectsEveryContractionRun program layout bits index).symm

def selector (program : CTS.Program) : Term → Option Term :=
  RootResetFinitePrioritySelector.selectStep? program (WeakPathUniversality.canonicalDispatcher program)

theorem agreesOnEverySample (program : CTS.Program) (bits : List Bool) (index : Nat) :
    selector program (((WeakPathUniversality.finiteCTSWeakPathUniversality program).path bits).term index) =
      some (((WeakPathUniversality.finiteCTSWeakPathUniversality program).path bits).term (index + 1)) := by
  have selected := selectsEveryContractionRun program (WeakPathUniversality.canonicalDispatcher program) bits index
  simpa only [selector, WeakPathUniversality.finiteCTSWeakPathUniversality,
    WeakPathUniversality.finiteCTSUniformCertificate, ControllerProjection.UniformCertificate.uniformRealizes,
    ControllerProjection.Certificate.realizes, SchedulerInvariant.SampledGood.uniformCertificate] using! selected

def finiteCTSUniversality (program : CTS.Program) :
    WeakPath.UniformRealizes program (RootResetTermOnlyTransfer.Projects (selector program)) (selector program)
      (PublicDecoder.decode program (WeakPathUniversality.canonicalDispatcher program).tree) :=
  RootResetTermOnlyTransfer.transferUniform (WeakPathUniversality.finiteCTSWeakPathUniversality program)
    (selector program) (agreesOnEverySample program)

theorem transferred_path_eq (program : CTS.Program) (bits : List Bool) :
    (finiteCTSUniversality program).path bits =
      (WeakPathUniversality.finiteCTSWeakPathUniversality program).path bits := rfl

theorem termOnlyPath_eq_persistentPath (program : CTS.Program) (bits : List Bool) (index : Nat) :
    RootResetTermOnlyTransfer.run (selector program) index
      ((WeakPathUniversality.finiteCTSWeakPathUniversality program).encode bits) =
      ((WeakPathUniversality.finiteCTSWeakPathUniversality program).path bits).term index :=
  RootResetTermOnlyTransfer.transferUniform_run_eq (WeakPathUniversality.finiteCTSWeakPathUniversality program)
    (selector program) (agreesOnEverySample program) bits index

end PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement
