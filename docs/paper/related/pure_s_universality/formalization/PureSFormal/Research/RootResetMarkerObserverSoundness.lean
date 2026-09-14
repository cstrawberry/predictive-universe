import PureSFormal.PureS.PhysicalMarkerGlobalSoundness

/-! Decoder-free soundness of the finite root-marker observer, on every encoded
input and every horizon. The proof uses actual cursor positions throughout the
nonempty exclusion argument; equality of erased response roots is not substituted
for literal-focus information. -/
namespace PureSFormal.Research.RootResetMarkerObserverSoundness
open PureSFormal.PureS
open FiniteController SchedulerControl SchedulerInvariant
open RootResetFiniteMarkerObserver RootResetMarkerTrajectoryCompleteness

theorem accepted_sample_implies_eventuallyEmpty
    (program : CTS.Program) (layout : ActionDispatcher program) (bits : List Bool) (index : Nat)
    (accepted : accepts? program layout
      ((SampledGood.productiveSystem program layout bits
        (SchedulerBound.bound program layout) (initialConfiguration program layout bits)
        (SchedulerRecurrence.initialGood program layout bits)).contractionRun index).cursor.erase = true) :
    ∃ horizon, (CTS.iterate program horizon (CTS.initial program bits)).data = [] := by
  exact PhysicalMarkerExclusion.physicalEvent_implies_eventuallyEmpty program layout bits
    (RootResetMarkerPhysicalSoundness.accepted_sample_native_fresh_focus program layout bits index accepted)

theorem sampled_observed_iff_eventuallyEmpty
    (program : CTS.Program) (layout : ActionDispatcher program) (bits : List Bool) :
    (∃ index, accepts? program layout
      ((SampledGood.productiveSystem program layout bits
        (SchedulerBound.bound program layout) (initialConfiguration program layout bits)
        (SchedulerRecurrence.initialGood program layout bits)).contractionRun index).cursor.erase = true) ↔
    ∃ horizon, (CTS.iterate program horizon (CTS.initial program bits)).data = [] := by
  constructor
  · rintro ⟨index, accepted⟩
    exact accepted_sample_implies_eventuallyEmpty program layout bits index accepted
  · exact eventuallyEmpty_implies_observed_sample program layout bits

theorem raw_observed_iff_eventuallyEmpty
    (program : CTS.Program) (layout : ActionDispatcher program) (bits : List Bool) :
    EventuallyObserved program layout (initialConfiguration program layout bits) ↔
      ∃ horizon, (CTS.iterate program horizon (CTS.initial program bits)).data = [] := by
  let system := SampledGood.productiveSystem program layout bits
    (SchedulerBound.bound program layout) (initialConfiguration program layout bits)
    (SchedulerRecurrence.initialGood program layout bits)
  exact (ProductiveSystem.eventually_raw_iff_sampled system (accepts? program layout)).trans
    (sampled_observed_iff_eventuallyEmpty program layout bits)

theorem accepted_root_implies_eventuallyEmpty
    (program : CTS.Program) (layout : ActionDispatcher program) (bits : List Bool) (index : Nat)
    (accepted : accepts? program layout
      (RootResetTermOnlyTransfer.run (RootResetFinitePrioritySelector.selectStep? program layout) index
        (initialConfiguration program layout bits).cursor.erase) = true) :
    ∃ horizon, (CTS.iterate program horizon (CTS.initial program bits)).data = [] := by
  rw [rootRun_eq_sample] at accepted
  exact accepted_sample_implies_eventuallyEmpty program layout bits index accepted

/-- The current finite term observer, restarted at the root at each contraction,
accepts somewhere along the actual root-reset run exactly when the CTS empties. -/
theorem root_observed_iff_eventuallyEmpty
    (program : CTS.Program) (layout : ActionDispatcher program) (bits : List Bool) :
    (∃ index, accepts? program layout
      (RootResetTermOnlyTransfer.run (RootResetFinitePrioritySelector.selectStep? program layout) index
        (initialConfiguration program layout bits).cursor.erase) = true) ↔
    ∃ horizon, (CTS.iterate program horizon (CTS.initial program bits)).data = [] := by
  constructor
  · rintro ⟨index, accepted⟩
    exact accepted_root_implies_eventuallyEmpty program layout bits index accepted
  · exact eventuallyEmpty_implies_root_observed program layout bits

end PureSFormal.Research.RootResetMarkerObserverSoundness
