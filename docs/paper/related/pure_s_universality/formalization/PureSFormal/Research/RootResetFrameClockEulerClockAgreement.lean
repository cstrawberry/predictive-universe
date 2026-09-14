import PureSFormal.Research.RootResetFrameClockEulerAgreement

/-!
# Clock equations preserved by the FRAME preprobe

Literal encoded environments make the FRAME preprobe miss. Consequently,
positive growth, zero-residual growth, and launch in the displayed whole-root
clock families keep their prior intended contractions in the 194-control
selector at its fixed linear stopping time. These results use literal
encoded environments and do not assert the same behavior below pending or
completed scheduler parents.
-/
namespace PureSFormal.Research.RootResetFrameClockEulerClockAgreement

open PureSFormal.PureS
open FiniteController
open SchedulerInvariant
open RootResetFrameClockEulerSelector

theorem environment_misses (actions : Term) (bits : List Bool) (parents : List ParentFrame) :
    ∃ ticks, run Frame.machine ticks ⟨some .down0, ⟨environmentCode actions bits, parents⟩⟩ =
      ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents (environmentCode actions bits))⟩ := by
  have prefixRun : run Frame.machine 2 ⟨some .down0, ⟨environmentCode actions bits, parents⟩⟩ =
      ⟨some .abort, ⟨.s, .left (dispatcherCode actions bits) :: parents⟩⟩ := rfl
  exact RootResetFrameSpineProbe.abort_complete _ 2 (congrArg Configuration.control prefixRun)

theorem clock_shape_misses (field continuation actions : Term) (bits : List Bool) :
    ∃ ticks, run Frame.machine ticks
      (Frame.initial (.app (.app (.app .s field) continuation) (environmentCode actions bits))) =
      ⟨some .miss, Cursor.atRoot
        (.app (.app (.app .s field) continuation) (environmentCode actions bits))⟩ := by
  exact RootResetFrameSpineProbeCarriers.wrapped_misses [(field, continuation)]
    (environmentCode actions bits) (environment_misses actions bits)

theorem clock_final_of_terminal_run (source : Term) (ticks : Nat)
    (configuration : Configuration Clock.Control)
    (execution : run Clock.machine ticks (RootResetClockEulerSelector.initial source) = configuration)
    (terminal : configuration.control = some (.euler .doneNF) ∨
      configuration.control = some (.euler .doneRedex)) : clockFinal source = configuration := by
  have commute := congrArg
    (fun count => run Clock.machine count (RootResetClockEulerSelector.initial source))
    (Nat.add_comm (clockTime source) ticks)
  rw [run_add Clock.machine (clockTime source) ticks] at commute
  change run Clock.machine ticks (clockFinal source) = _ at commute
  rw [RootResetClockEulerBound.Composed.terminal_run ticks _
      (RootResetClockEulerBound.Composed.final_terminal source),
    run_add Clock.machine ticks (clockTime source), execution,
    RootResetClockEulerBound.Composed.terminal_run (clockTime source) _ terminal] at commute
  exact commute

theorem generated_positive_growth (stage wrappers residual : Nat) (actions : Term) (bits : List Bool) :
    final (.app (clockGrowthCore stage (wrappers + 1) (residual + 1)) (environmentCode actions bits)) =
      ⟨some (.clock (.euler .doneRedex)),
        ⟨Term.contractum .s (C residual) (C stage),
          RootResetClockGrowthWalker.clockParents stage (wrappers + 1)
            [.left (environmentCode actions bits)]⟩⟩ := by
  rw [miss_inherits_clock (.app (clockGrowthCore stage (wrappers + 1) (residual + 1)) (environmentCode actions bits)) (clock_shape_misses (C stage) (clockGrowthCore stage wrappers (residual + 1)) actions bits)]
  obtain ⟨ticks, execution, _⟩ := RootResetClockEulerSelector.generated_positive_growth
    stage wrappers residual (environmentCode actions bits)
  rw [clock_final_of_terminal_run _ ticks _ execution (Or.inr rfl)]
  rfl

theorem generated_zero_growth (stage wrappers : Nat) (actions : Term) (bits : List Bool) :
    final (.app (clockGrowthCore stage (wrappers + 1) 0) (environmentCode actions bits)) =
      ⟨some (.clock (.euler .doneRedex)),
        ⟨Term.contractum (.app .s .s) b (C stage),
          RootResetClockGrowthWalker.clockParents stage (wrappers + 1)
            [.left (environmentCode actions bits)]⟩⟩ := by
  rw [miss_inherits_clock (.app (clockGrowthCore stage (wrappers + 1) 0) (environmentCode actions bits)) (clock_shape_misses (C stage) (clockGrowthCore stage wrappers 0) actions bits)]
  obtain ⟨ticks, execution, _⟩ := RootResetClockEulerSelector.generated_zero_growth
    stage wrappers (environmentCode actions bits)
  rw [clock_final_of_terminal_run _ ticks _ execution (Or.inr rfl)]
  rfl

theorem generated_launch (stage wrappers : Nat) (actions : Term) (bits : List Bool) :
    final (.app (clockWrappers stage (wrappers + 1)) (environmentCode actions bits)) =
      ⟨some (.clock (.euler .doneRedex)), Cursor.atRoot
        (.app (.app (C stage) (environmentCode actions bits))
          (.app (clockWrappers stage wrappers) (environmentCode actions bits)))⟩ := by
  rw [miss_inherits_clock (.app (clockWrappers stage (wrappers + 1)) (environmentCode actions bits)) (clock_shape_misses (C stage) (clockWrappers stage wrappers) actions bits)]
  obtain ⟨ticks, execution, _⟩ := RootResetClockEulerSelector.generated_launch
    stage wrappers (environmentCode actions bits)
  rw [clock_final_of_terminal_run _ ticks _ execution (Or.inr rfl)]
  rfl


end PureSFormal.Research.RootResetFrameClockEulerClockAgreement
