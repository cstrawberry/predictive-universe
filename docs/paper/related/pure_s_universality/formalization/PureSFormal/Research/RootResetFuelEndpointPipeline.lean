import PureSFormal.Research.RootResetFuelClockExclusion
import PureSFormal.Research.RootResetEndpointGeneratedMisses

/-! The concrete endpoint pipeline includes all fuel rows before CLOCK. -/
namespace PureSFormal.Research.RootResetFuelEndpointPipeline
open PureSFormal.PureS
open FiniteController SchedulerInvariant
open RootResetProbeSequence

def fuelAnswer? {actions : Term} (state : RootResetEdgeFragment.Control (RootResetFuelFiniteRows.rows actions)) : Option Bool :=
  match state.val with | .answer ready => some ready | _ => none

def fuelWorker (actions : Term) : Worker :=
  ⟨RootResetEdgeFragment.Control (RootResetFuelFiniteRows.rows actions), RootResetFuelFiniteRows.machine actions,
    ⟨RootResetEdgeFragment.familyCode (RootResetFuelFiniteRows.rows actions), ProbeCompiler.Control.self_mem_nodes _⟩,
    fuelAnswer?⟩

theorem fuel_terminal (actions : Term) : (fuelWorker actions).Terminal := by
  intro state ready answered origin ticks
  rcases state with ⟨code, member⟩
  cases code with
  | answer result => exact RootResetPatternFragment.answer_absorbing _ result member origin ticks
  | observeNode | observeIncoming | move => cases answered

theorem fuel_readOnly (actions : Term) : (fuelWorker actions).ReadOnly :=
  RootResetPatternFragment.mutationCount_zero _ (RootResetEdgeFragment.family_readOnly _)

theorem fuel_restoring (actions : Term) : (fuelWorker actions).Restoring (RootResetFuelFiniteRows.bound actions) := by
  intro origin
  obtain ⟨ready, endpoint, member, execution, facts, bounded⟩ := RootResetFuelFiniteRows.all_input actions origin
  have constant : RootResetFuelFiniteRows.bound actions ≤ RootResetFuelFiniteRows.bound actions * origin.erase.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left (RootResetFuelFiniteRows.bound actions) (Term.size_pos origin.erase)
  exact ⟨_, ready, endpoint, ⟨.answer ready, member⟩, Nat.le_trans bounded constant, execution, rfl, facts⟩

def tail (actions : Term) : Worker := RootResetProbeSequence.worker (fuelWorker actions) RootResetEndpointPipeline.clockWorker

def tailCoefficient (actions : Term) : Nat := RootResetFuelFiniteRows.bound actions + RootResetNestedClockProbe.coefficient + 2

theorem tail_terminal (actions : Term) : (tail actions).Terminal := RootResetProbeSequence.terminal _ _

theorem tail_restoring (actions : Term) : (tail actions).Restoring (tailCoefficient actions) :=
  RootResetProbeSequence.restoring _ _ _ _ (fuel_terminal actions) RootResetEndpointPipeline.clock_terminal
    (fuel_restoring actions) RootResetEndpointPipeline.clock_restoring

theorem tail_readOnly (actions : Term) : (tail actions).ReadOnly :=
  RootResetProbeSequence.readOnly _ _ (fuel_readOnly actions) RootResetEndpointPipeline.clock_readOnly

def worker (program : CTS.Program) (layout : ActionDispatcher program) : Worker :=
  RootResetEndpointPipeline.withTail program layout (tail (compileActions program layout.tree))

def coefficient (program : CTS.Program) (layout : ActionDispatcher program) : Nat :=
  RootResetEndpointPipeline.withTailCoefficient program layout (tailCoefficient (compileActions program layout.tree))

theorem all_input (program : CTS.Program) (layout : ActionDispatcher program) :
    (worker program layout).Restoring (coefficient program layout) :=
  RootResetEndpointPipeline.withTail_restoring program layout _ _ (tail_terminal _) (tail_restoring _)

theorem terminal (program : CTS.Program) (layout : ActionDispatcher program) : (worker program layout).Terminal :=
  RootResetEndpointPipeline.withTail_terminal program layout _

theorem terminal_stay (program : CTS.Program) (layout : ActionDispatcher program)
    (state : (worker program layout).Control) (ended : ((worker program layout).answer? state).isSome = true)
    (node : Probe.NodeKind) (incoming : Probe.Incoming) :
    (worker program layout).machine.transition state node incoming = .stay state :=
  RootResetEndpointPipeline.withTail_terminal_stay program layout _ state ended node incoming

theorem readOnly (program : CTS.Program) (layout : ActionDispatcher program) : (worker program layout).ReadOnly :=
  RootResetEndpointPipeline.withTail_readOnly program layout _ (tail_readOnly _)

theorem runMutationCount_zero (program : CTS.Program) (layout : ActionDispatcher program)
    (ticks : Nat) (configuration : Configuration (worker program layout).Control) :
    runMutationCount (worker program layout).machine ticks configuration = 0 :=
  (worker program layout).runMutationCount_zero (readOnly program layout) ticks configuration

theorem erase_run (program : CTS.Program) (layout : ActionDispatcher program)
    (ticks : Nat) (configuration : Configuration (worker program layout).Control) :
    (run (worker program layout).machine ticks configuration).cursor.erase = configuration.cursor.erase :=
  (worker program layout).erase_run (readOnly program layout) ticks configuration

def generatedCoefficient (program : CTS.Program) (layout : ActionDispatcher program) : Nat :=
  RootResetEdgeFragment.bound RootResetLocalDispatcherProbe.entryRows + 1 +
    RootResetEndpointPipeline.actionCoefficient program layout.tree + tailCoefficient (compileActions program layout.tree) + 4

theorem selected_tail (program : CTS.Program) (layout : ActionDispatcher program)
    (origin endpoint : Cursor) (arity : origin.focus.headArity ≠ 6) (tailTicks : Nat)
    (tailBound : tailTicks ≤ tailCoefficient (compileActions program layout.tree) * origin.erase.size)
    (tailRun : run (tail (compileActions program layout.tree)).machine tailTicks
      ((tail (compileActions program layout.tree)).initial origin) = ⟨some (.done true), endpoint⟩) :
    ∃ ticks, ticks ≤ generatedCoefficient program layout * origin.erase.size ∧
      run (worker program layout).machine ticks ((worker program layout).initial origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨dispatcherTicks, actionTicks, actionState, dispatcherBound, actionBound, dispatcherRun, actionRun, actionAnswer⟩ :=
    RootResetEndpointGeneratedMisses.clock_preceding_misses program layout origin arity
  obtain ⟨ticks, bounded, actual⟩ := RootResetEndpointPipeline.tail_selected program layout
    (tail (compileActions program layout.tree)) (tail_terminal _) origin endpoint
    dispatcherTicks actionTicks tailTicks dispatcherRun actionState actionRun actionAnswer (.done true) tailRun rfl
  refine ⟨ticks, Nat.le_trans bounded ?_, actual⟩
  have constant (value : Nat) : value ≤ value * origin.erase.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Term.size_pos origin.erase)
  have total := Nat.add_le_add (Nat.add_le_add (Nat.add_le_add
    (Nat.le_trans dispatcherBound (constant _)) (Nat.le_trans actionBound (constant _))) tailBound) (constant 4)
  simpa only [generatedCoefficient, Nat.add_mul] using total

theorem generated_fuel (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : RootResetClockFuelStages.FuelRow)
    (canonical : RootResetClockFuelCanonicalGrammar.CanonicalFuelRow (compileActions program layout.tree) fuel)
    (parents : List ParentFrame) :
    ∃ ticks endpoint, ticks ≤ generatedCoefficient program layout * (Cursor.mk fuel.term parents).erase.size ∧
      run (worker program layout).machine ticks ((worker program layout).initial ⟨fuel.term, parents⟩) =
        ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow fuel.localAddress ⟨fuel.term, parents⟩ = some endpoint ∧
      endpoint.focus = fuel.focus ∧ endpoint.rdx? = some ⟨fuel.replacement, endpoint.parents⟩ := by
  let actions := compileActions program layout.tree
  let origin : Cursor := ⟨fuel.term, parents⟩
  obtain ⟨endpoint, member, followed, actual, focusEq, redex⟩ := RootResetFuelFiniteRows.generated_runs actions fuel canonical parents
  obtain ⟨tailTicks, tailBound, tailRun⟩ := RootResetProbeSequence.first_selected (fuelWorker actions)
    RootResetEndpointPipeline.clockWorker (fuel_terminal actions) origin endpoint _ ⟨.answer true, member⟩ actual rfl
  have fuelBound : RootResetEdgeFragment.ticks (RootResetFuelFiniteRows.rows actions) fuel.term ≤
      RootResetFuelFiniteRows.bound actions * origin.erase.size :=
    Nat.le_trans (RootResetEdgeFragment.ticks_bound _ _) (by
      simpa only [Nat.mul_one] using! Nat.mul_le_mul_left (RootResetFuelFiniteRows.bound actions) (Term.size_pos origin.erase))
  have paid : tailTicks ≤ tailCoefficient actions * origin.erase.size := Nat.le_trans tailBound (by
    simpa only [Nat.add_zero] using! RootResetProbeSequence.combined_bound origin (RootResetFuelFiniteRows.bound actions)
      RootResetNestedClockProbe.coefficient _ 0 1 fuelBound (Nat.zero_le _) (by decide))
  have arity : origin.focus.headArity ≠ 6 := by
    intro equal
    have bounded := fuel.term_headArity_le_four
    change fuel.term.headArity = 6 at equal
    rw [equal] at bounded
    exact (by decide : ¬ (6 : Nat) ≤ 4) bounded
  obtain ⟨ticks, bounded, execution⟩ := selected_tail program layout origin endpoint arity tailTicks paid tailRun
  exact ⟨ticks, endpoint, bounded, execution, followed, focusEq, redex⟩

theorem selected_clock (program : CTS.Program) (layout : ActionDispatcher program)
    (origin endpoint : Cursor) (arity : origin.focus.headArity ≠ 6)
    (fuelMiss : RootResetEdgeFragment.select (RootResetFuelFiniteRows.rows (compileActions program layout.tree)) origin.focus = none)
    (clockTicks : Nat) (clockBound : clockTicks ≤ RootResetNestedClockProbe.coefficient * origin.focus.size)
    (clockRun : run RootResetNestedClockProbe.machine clockTicks (RootResetNestedClockProbe.initial origin) =
      ⟨some (.done true), endpoint⟩) :
    ∃ ticks, ticks ≤ generatedCoefficient program layout * origin.erase.size ∧
      run (worker program layout).machine ticks ((worker program layout).initial origin) = ⟨some (.done true), endpoint⟩ := by
  let actions := compileActions program layout.tree
  obtain ⟨member, missed⟩ := RootResetEdgeFragment.missed_runs _ origin fuelMiss
  obtain ⟨tailTicks, tailBound, tailRun⟩ := RootResetProbeSequence.second_selected (fuelWorker actions)
    RootResetEndpointPipeline.clockWorker (fuel_terminal actions) RootResetEndpointPipeline.clock_terminal origin endpoint
    _ clockTicks ⟨.answer false, member⟩ (.done true) missed rfl clockRun rfl
  have fuelBound : RootResetEdgeFragment.ticks (RootResetFuelFiniteRows.rows actions) origin.focus ≤
      RootResetFuelFiniteRows.bound actions * origin.erase.size :=
    Nat.le_trans (RootResetEdgeFragment.ticks_bound _ _) (by
      simpa only [Nat.mul_one] using! Nat.mul_le_mul_left (RootResetFuelFiniteRows.bound actions) (Term.size_pos origin.erase))
  have sizeBound : origin.focus.size ≤ origin.erase.size :=
    Nat.le_trans (Nat.le_add_left _ _) (RootResetProgressTotality.depth_add_focus_size_le_erase_size origin.focus origin.parents)
  have paid := Nat.le_trans tailBound (RootResetProbeSequence.combined_bound origin (RootResetFuelFiniteRows.bound actions)
    RootResetNestedClockProbe.coefficient _ clockTicks 2 fuelBound (Nat.le_trans clockBound (Nat.mul_le_mul_left _ sizeBound)) (Nat.le_refl _))
  exact selected_tail program layout origin endpoint arity tailTicks paid tailRun

theorem generated_clock_growth (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers residual : Nat) (environment : Term) (parents : List ParentFrame) :
    let source := Term.app (clockGrowthCore stage wrappers residual) environment
    ∃ ticks, ticks ≤ generatedCoefficient program layout * (Cursor.mk source parents).erase.size ∧
      run (worker program layout).machine ticks ((worker program layout).initial ⟨source, parents⟩) =
        ⟨some (.done true), ⟨.app (C residual) (C stage),
          RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)⟩⟩ := by
  obtain ⟨ticks, bounded, actual⟩ := RootResetNestedClockProbeAgreement.generated_growth stage wrappers residual environment parents
  exact selected_clock program layout _ _ (RootResetEndpointGeneratedMisses.growth_not_six stage wrappers residual environment)
    (RootResetFuelClockExclusion.growth_missed _ stage wrappers residual environment) ticks bounded actual

theorem generated_clock_launch (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers : Nat) (environment : Term) (parents : List ParentFrame) :
    let source := Term.app (clockWrappers stage (wrappers + 1)) environment
    ∃ ticks, ticks ≤ generatedCoefficient program layout * (Cursor.mk source parents).erase.size ∧
      run (worker program layout).machine ticks ((worker program layout).initial ⟨source, parents⟩) =
        ⟨some (.done true), ⟨source, parents⟩⟩ := by
  obtain ⟨ticks, bounded, actual⟩ := RootResetNestedClockProbeAgreement.generated_launch stage wrappers environment parents
  exact selected_clock program layout _ _ (RootResetEndpointGeneratedMisses.launch_not_six stage wrappers environment)
    (RootResetFuelClockExclusion.launch_missed _ stage wrappers environment) ticks bounded actual

end PureSFormal.Research.RootResetFuelEndpointPipeline
