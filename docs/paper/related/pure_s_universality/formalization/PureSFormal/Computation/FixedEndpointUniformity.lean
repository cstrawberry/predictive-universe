import PureSFormal.PureS.ControllerStateCount
import PureSFormal.Computation.DeterministicTapePureS
import PureSFormal.DefinitionAgreement

/-!
# Fixedness witnesses for the period-912 endpoint

Every declaration below specializes the program, dispatcher, controller,
decoder interface, and initial control to closed constants before a source
instance is supplied.  The final equation displays the only input-dependent
map: the structural encoder from the source instance.
-/

namespace PureSFormal.Computation.FixedEndpointUniformity

open PureSFormal.PureS

abbrev FixedDispatcher : ActionDispatcher Cook.rogozhinCookProgram :=
  BalancedActionTree.dispatcher Cook.rogozhinCookProgram

abbrev FixedControl :=
  SchedulerControl.Control Cook.rogozhinCookProgram FixedDispatcher

/-- Closed controller constant at the universal endpoint. -/
abbrev fixedController : FiniteController.Machine FixedControl :=
  SchedulerControl.machine Cook.rogozhinCookProgram FixedDispatcher

/-- Closed initial-control constant at the universal endpoint. -/
abbrev fixedInitialControl : FixedControl :=
  SchedulerControl.initialControl Cook.rogozhinCookProgram FixedDispatcher

/-- Closed total bare-term decoder at the universal endpoint. -/
abbrev fixedDecoder : WeakPath.BareTermDecoder Cook.rogozhinCookProgram :=
  PublicDecoder.decode Cook.rogozhinCookProgram FixedDispatcher.tree

/-- Closed total Boolean detector at the universal endpoint. -/
abbrev fixedDetector : Term -> Bool :=
  TermEvent.observesMarkedCheckpoint? Cook.rogozhinCookProgram
    FixedDispatcher.tree

/-- The sole source-indexed component of the otherwise closed endpoint. -/
abbrev fixedEncoder : DeterministicTapePureS.SourceInstance -> Term :=
  DeterministicTapePureS.encodeTerm

/-- The endpoint program has exactly 912 phases. -/
theorem fixedProgram_period : Cook.rogozhinCookProgram.period = 912 :=
  Cook.rogozhinCookProgram_period

/-- The fixed controller's published ordinary-state enumeration is duplicate-free. -/
theorem fixedController_states_nodup :
    fixedController.states.Nodup :=
  SchedulerControl.machine_states_nodup Cook.rogozhinCookProgram
    FixedDispatcher

/-- Every fixed-endpoint control value occurs in its finite state cover. -/
theorem fixedController_covers (control : FixedControl) :
    control ∈ fixedController.states :=
  SchedulerControl.machine_covers Cook.rogozhinCookProgram
    FixedDispatcher control

/--
Round-tripping the fixed endpoint controller through the independently
presented textbook finite tree-walker preserves every transition-table cell.
-/
theorem fixedController_textbookAgreement
    (control : FixedControl) (node : Probe.NodeKind)
    (incoming : Probe.Incoming) :
    ((FiniteController.machineEquivTextbook FixedControl).backward
        ((FiniteController.machineEquivTextbook FixedControl).forward
          fixedController)).transition control node incoming =
      fixedController.transition control node incoming :=
  (FiniteController.machineEquivTextbook FixedControl).backwardForwardTransition
    fixedController control node incoming

/--
The raw fixed-endpoint counts distinguish register tuples, dispatcher
subtrees, control templates, ordinary cover entries, and the added sink.
-/
theorem fixedEndpoint_rawCoverCounts :
    (SchedulerControl.registerStates Cook.rogozhinCookProgram).length =
        21888 /\
    (SchedulerControl.codeNodeStates FixedDispatcher).length = 3647 /\
    SchedulerControl.controlTemplateCount Cook.rogozhinCookProgram
        FixedDispatcher = 3457625 /\
    (SchedulerControl.controlStates Cook.rogozhinCookProgram
        FixedDispatcher).length = 75680496000 /\
    (SchedulerControl.controlStates Cook.rogozhinCookProgram
        FixedDispatcher).length + 1 = 75680496001 := by
  let counts : ActionDispatcher Cook.rogozhinCookProgram → Prop := fun dispatcher =>
    (SchedulerControl.registerStates Cook.rogozhinCookProgram).length =
        21888 /\
    (SchedulerControl.codeNodeStates dispatcher).length = 3647 /\
    SchedulerControl.controlTemplateCount Cook.rogozhinCookProgram
        dispatcher = 3457625 /\
    (SchedulerControl.controlStates Cook.rogozhinCookProgram
        dispatcher).length = 75680496000 /\
    (SchedulerControl.controlStates Cook.rogozhinCookProgram
        dispatcher).length + 1 = 75680496001
  have known : counts (BalancedActionTree.dispatcher Cook.rogozhinCookProgram) := by
    exact ⟨SchedulerControl.cook_registerCoverEntryCount,
      SchedulerControl.cook_codeNodeCoverEntryCount,
      SchedulerControl.cook_controlTemplateCount,
      SchedulerControl.cook_controlCoverEntryCount,
      SchedulerControl.cook_runtimeCoverEntryCount⟩
  exact Eq.mpr (congrArg counts
    (show FixedDispatcher = BalancedActionTree.dispatcher Cook.rogozhinCookProgram from rfl)) known

/-- The only source argument occurs in the structural input encoder. -/
theorem fixedEncoder_eq_generator
    (source : DeterministicTapePureS.SourceInstance) :
    fixedEncoder source =
      generator
        (compileActions Cook.rogozhinCookProgram FixedDispatcher.tree)
        (DeterministicTapeCook.encodeBits source) :=
  rfl

end PureSFormal.Computation.FixedEndpointUniformity
