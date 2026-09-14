import PureSFormal.Research.FiniteWorkerTreeAutomaton
import PureSFormal.Research.RootResetMarkerObserverDecidableEq
import PureSFormal.Research.RootResetMarkerObserverSoundness

/-! An explicit finite bottom-up tree automaton for the actual, decoder-free
root marker observer on every pure-S tree. The trajectory statement then
uses the independently proved occurrence-preserving soundness/completeness. -/
namespace PureSFormal.Research.RootResetMarkerTreeAutomaton
set_option maxRecDepth 10000
set_option maxHeartbeats 1000000
open PureSFormal.PureS FiniteController RootResetFiniteMarkerObserver

def automaton (program : CTS.Program) (layout : ActionDispatcher program) :=
  FiniteWorkerTreeAutomaton.automaton (observer program layout)

theorem observer_bound_fixed (program : CTS.Program) (layout : ActionDispatcher program) (source : Term) :
    step (observer program layout).machine
      (run (observer program layout).machine (bound program layout source)
        ((observer program layout).initial (Cursor.atRoot source))) =
      run (observer program layout).machine (bound program layout source)
        ((observer program layout).initial (Cursor.atRoot source)) := by
  obtain ⟨ticks, ready, endpoint, bounded, actual, _, _⟩ := observer_all_input program layout source
  have split : ticks + (bound program layout source - ticks) = bound program layout source :=
    Nat.add_sub_of_le bounded
  rw [← split, run_add, actual]
  change step (RootResetProbeBranch.machine _ _ _)
      (run (RootResetProbeBranch.machine _ _ _) _ ⟨some (.done ready), endpoint⟩) =
      run (RootResetProbeBranch.machine _ _ _) _ ⟨some (.done ready), endpoint⟩
  rw [RootResetProbeBranch.done_absorbs]
  rfl

theorem automaton_accepts_eq_observer (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) : (automaton program layout).accepts source = accepts? program layout source :=
  FiniteWorkerTreeAutomaton.automaton_agrees (observer program layout)
    (observer_terminal program layout) (observer_readOnly program layout)
    source (bound program layout source) (observer_bound_fixed program layout source)

theorem automaton_cover_complete (program : CTS.Program) (layout : ActionDispatcher program)
    (state : FiniteTreeAutomatonPowerset.Bits
      (ClosedSetTreeAutomaton.Boundary.cover (observer program layout).machine.states.length).length) :
    state ∈ (automaton program layout).cover := (automaton program layout).covers state

theorem automaton_root_trajectory_iff (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) :
    (∃ index, (automaton program layout).accepts
      (RootResetTermOnlyTransfer.run (RootResetFinitePrioritySelector.selectStep? program layout) index
        (SchedulerControl.initialConfiguration program layout bits).cursor.erase) = true) ↔
      ∃ horizon, (CTS.iterate program horizon (CTS.initial program bits)).data = [] := by
  constructor
  · rintro ⟨index, accepted⟩
    rw [automaton_accepts_eq_observer] at accepted
    exact RootResetMarkerObserverSoundness.accepted_root_implies_eventuallyEmpty program layout bits index accepted
  · intro empties
    obtain ⟨index, accepted⟩ := (RootResetMarkerObserverSoundness.root_observed_iff_eventuallyEmpty
      program layout bits).mpr empties
    exact ⟨index, (automaton_accepts_eq_observer program layout _).trans accepted⟩

end PureSFormal.Research.RootResetMarkerTreeAutomaton
