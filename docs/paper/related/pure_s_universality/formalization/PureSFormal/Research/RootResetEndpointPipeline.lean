import PureSFormal.Research.RootResetProbeSequence
import PureSFormal.Research.RootResetLocalDispatcherProbe
import PureSFormal.Research.RootResetSelectedActionRows
import PureSFormal.Research.RootResetNestedClockProbe

/-!
# Finite endpoint selection pipeline

Dispatcher selection precedes selected-action/Push rows, followed by the
supplied finite tail. The concrete tail is the unconditional nested CLOCK
probe. FRAME priority belongs to the outer frontend. A completed-response
worker can be inserted before CLOCK by supplying their finite sequence as
the tail. Every rejection restores the exact endpoint invocation cursor.
-/
namespace PureSFormal.Research.RootResetEndpointPipeline
open PureSFormal.PureS
open FiniteController
open RootResetProbeSequence

def dispatcherAnswer? {program : CTS.Program} {layout : ActionDispatcher program} :
    RootResetLocalDispatcherProbe.Control program layout → Option Bool
  | .done ready => some ready
  | _ => none

def dispatcherWorker (program : CTS.Program) (layout : ActionDispatcher program) : Worker :=
  ⟨RootResetLocalDispatcherProbe.Control program layout, RootResetLocalDispatcherProbe.machine program layout,
    .entry ⟨RootResetEdgeFragment.familyCode RootResetLocalDispatcherProbe.entryRows, ProbeCompiler.Control.self_mem_nodes _⟩,
    dispatcherAnswer?⟩

theorem dispatcher_terminal (program : CTS.Program) (layout : ActionDispatcher program) :
    (dispatcherWorker program layout).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | done result => exact RootResetLocalDispatcherProbe.done_absorbs program layout result origin ticks
  | entry pc => cases answered
  | phase pc => cases answered
  | front phase pc => cases answered
  | returnThree label => cases answered
  | returnTwo label => cases answered
  | returnOne label => cases answered
  | dispatch label pc => cases answered

theorem dispatcher_readOnly (program : CTS.Program) (layout : ActionDispatcher program) :
    (dispatcherWorker program layout).ReadOnly :=
  RootResetLocalDispatcherProbe.mutationCount_zero program layout

theorem dispatcher_restoring (program : CTS.Program) (layout : ActionDispatcher program) :
    (dispatcherWorker program layout).Restoring (RootResetLocalDispatcherProbe.coefficient program layout) := by
  intro origin
  obtain ⟨ticks, ready, endpoint, bounded, execution, result⟩ := RootResetLocalDispatcherProbe.all_input program layout origin
  exact ⟨ticks, ready, endpoint, .done ready, bounded, execution, rfl, result⟩

def actionAnswer? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (state : RootResetEdgeFragment.Control (RootResetSelectedActionRows.rows program tree)) : Option Bool :=
  match state.val with | .answer ready => some ready | _ => none

def actionWorker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  ⟨RootResetEdgeFragment.Control (RootResetSelectedActionRows.rows program tree),
    RootResetEdgeFragment.machine (RootResetSelectedActionRows.rows program tree),
    ⟨RootResetEdgeFragment.familyCode (RootResetSelectedActionRows.rows program tree), ProbeCompiler.Control.self_mem_nodes _⟩,
    actionAnswer?⟩

theorem action_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (actionWorker program tree).Terminal := by
  intro state ready answered origin ticks
  rcases state with ⟨code, member⟩
  cases code with
  | answer result => exact RootResetPatternFragment.answer_absorbing _ result member origin ticks
  | observeNode onS onApp => cases answered
  | observeIncoming onRoot onLeft onRight => cases answered
  | move operation next => cases answered

theorem action_readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (actionWorker program tree).ReadOnly :=
  RootResetPatternFragment.mutationCount_zero _ (RootResetEdgeFragment.family_readOnly _)

def actionCoefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetEdgeFragment.bound (RootResetSelectedActionRows.rows program tree)

theorem action_restoring (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (actionWorker program tree).Restoring (actionCoefficient program tree) := by
  intro origin
  obtain ⟨ready, endpoint, member, execution, result, bounded⟩ := RootResetSelectedActionRows.all_input program tree origin
  have constant : actionCoefficient program tree ≤ actionCoefficient program tree * origin.erase.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left (actionCoefficient program tree) (Term.size_pos origin.erase)
  exact ⟨_, ready, endpoint, ⟨.answer ready, member⟩, Nat.le_trans bounded constant, execution, rfl, result⟩

def clockAnswer? : RootResetNestedClockProbe.Control → Option Bool
  | .done ready => some ready
  | _ => none

def clockWorker : Worker :=
  ⟨RootResetNestedClockProbe.Control, RootResetNestedClockProbe.machine,
    .first (.reading ⟨RootResetEdgeFragment.familyCode RootResetNestedClockFirstPass.rows,
      ProbeCompiler.Control.self_mem_nodes _⟩), clockAnswer?⟩

theorem clock_terminal : clockWorker.Terminal := by
  intro state ready answered origin ticks
  cases state with
  | done result => exact RootResetNestedClockProbe.done_absorbs result origin ticks
  | first pc => cases answered
  | second pc => cases answered
  | growth pc => cases answered

theorem clock_readOnly : clockWorker.ReadOnly := RootResetNestedClockProbe.mutationCount_zero

theorem clock_restoring : clockWorker.Restoring RootResetNestedClockProbe.coefficient := by
  intro origin
  obtain ⟨ticks, ready, endpoint, bounded, execution, result⟩ := RootResetNestedClockProbe.all_input origin
  have sizeBound : origin.focus.size ≤ origin.erase.size :=
    Nat.le_trans (Nat.le_add_left _ _) (RootResetProgressTotality.depth_add_focus_size_le_erase_size origin.focus origin.parents)
  exact ⟨ticks, ready, endpoint, .done ready,
    Nat.le_trans bounded (Nat.mul_le_mul_left _ sizeBound), execution, rfl, result⟩

def withTail (program : CTS.Program) (layout : ActionDispatcher program) (tail : Worker) : Worker :=
  RootResetProbeSequence.worker (dispatcherWorker program layout)
    (RootResetProbeSequence.worker (actionWorker program layout.tree) tail)

def withTailCoefficient (program : CTS.Program) (layout : ActionDispatcher program) (tailCoefficient : Nat) : Nat :=
  RootResetLocalDispatcherProbe.coefficient program layout +
    (actionCoefficient program layout.tree + tailCoefficient + 2) + 2

theorem withTail_restoring (program : CTS.Program) (layout : ActionDispatcher program) (tail : Worker)
    (tailCoefficient : Nat) (tailTerminal : tail.Terminal) (tailRestores : tail.Restoring tailCoefficient) :
    (withTail program layout tail).Restoring (withTailCoefficient program layout tailCoefficient) :=
  RootResetProbeSequence.restoring _ _ _ _ (dispatcher_terminal program layout) (RootResetProbeSequence.terminal _ _)
    (dispatcher_restoring program layout)
    (RootResetProbeSequence.restoring _ _ _ _ (action_terminal program layout.tree) tailTerminal
      (action_restoring program layout.tree) tailRestores)

theorem withTail_terminal (program : CTS.Program) (layout : ActionDispatcher program) (tail : Worker) :
    (withTail program layout tail).Terminal := RootResetProbeSequence.terminal _ _

theorem withTail_terminal_stay (program : CTS.Program) (layout : ActionDispatcher program) (tail : Worker)
    (state : (withTail program layout tail).Control) (ended : ((withTail program layout tail).answer? state).isSome = true)
    (node : Probe.NodeKind) (incoming : Probe.Incoming) :
    (withTail program layout tail).machine.transition state node incoming = .stay state :=
  RootResetProbeSequence.terminal_stay _ _ state ended node incoming

theorem withTail_readOnly (program : CTS.Program) (layout : ActionDispatcher program) (tail : Worker)
    (tailSafe : tail.ReadOnly) : (withTail program layout tail).ReadOnly :=
  RootResetProbeSequence.readOnly _ _ (dispatcher_readOnly program layout)
    (RootResetProbeSequence.readOnly _ _ (action_readOnly program layout.tree) tailSafe)

def worker (program : CTS.Program) (layout : ActionDispatcher program) : Worker := withTail program layout clockWorker

def coefficient (program : CTS.Program) (layout : ActionDispatcher program) : Nat :=
  withTailCoefficient program layout RootResetNestedClockProbe.coefficient

theorem all_input (program : CTS.Program) (layout : ActionDispatcher program) :
    (worker program layout).Restoring (coefficient program layout) :=
  withTail_restoring program layout clockWorker _ clock_terminal clock_restoring

theorem terminal (program : CTS.Program) (layout : ActionDispatcher program) :
    (worker program layout).Terminal := withTail_terminal program layout clockWorker

theorem terminal_stay (program : CTS.Program) (layout : ActionDispatcher program)
    (state : (worker program layout).Control) (ended : ((worker program layout).answer? state).isSome = true)
    (node : Probe.NodeKind) (incoming : Probe.Incoming) :
    (worker program layout).machine.transition state node incoming = .stay state :=
  withTail_terminal_stay program layout clockWorker state ended node incoming

theorem readOnly (program : CTS.Program) (layout : ActionDispatcher program) :
    (worker program layout).ReadOnly := withTail_readOnly program layout clockWorker clock_readOnly

theorem runMutationCount_zero (program : CTS.Program) (layout : ActionDispatcher program)
    (ticks : Nat) (configuration : Configuration (worker program layout).Control) :
    runMutationCount (worker program layout).machine ticks configuration = 0 :=
  (worker program layout).runMutationCount_zero (readOnly program layout) ticks configuration

theorem erase_run (program : CTS.Program) (layout : ActionDispatcher program)
    (ticks : Nat) (configuration : Configuration (worker program layout).Control) :
    (run (worker program layout).machine ticks configuration).cursor.erase = configuration.cursor.erase :=
  (worker program layout).erase_run (readOnly program layout) ticks configuration

theorem dispatcher_selected (program : CTS.Program) (layout : ActionDispatcher program) (tail : Worker)
    (origin endpoint : Cursor) (ticks : Nat)
    (execution : run (RootResetLocalDispatcherProbe.machine program layout) ticks
      (RootResetLocalDispatcherProbe.initial program layout origin) = ⟨some (.done true), endpoint⟩) :
    ∃ used, used ≤ ticks + 1 ∧ run (withTail program layout tail).machine used
      ((withTail program layout tail).initial origin) = ⟨some (.done true), endpoint⟩ :=
  RootResetProbeSequence.first_selected _ _ (dispatcher_terminal program layout) origin endpoint ticks (.done true) execution rfl

theorem action_selected (program : CTS.Program) (layout : ActionDispatcher program) (tail : Worker)
    (origin endpoint : Cursor) (dispatcherTicks actionTicks : Nat)
    (dispatcherExecution : run (RootResetLocalDispatcherProbe.machine program layout) dispatcherTicks
      (RootResetLocalDispatcherProbe.initial program layout origin) = ⟨some (.done false), origin⟩)
    (actionState : (actionWorker program layout.tree).Control)
    (actionExecution : run (actionWorker program layout.tree).machine actionTicks
      ((actionWorker program layout.tree).initial origin) = ⟨some actionState, endpoint⟩)
    (actionAnswer : (actionWorker program layout.tree).answer? actionState = some true) :
    ∃ used, used ≤ dispatcherTicks + actionTicks + 3 ∧ run (withTail program layout tail).machine used
      ((withTail program layout tail).initial origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨actionUsed, actionBound, actionActual⟩ := RootResetProbeSequence.first_selected (actionWorker program layout.tree) tail
    (action_terminal program layout.tree) origin endpoint actionTicks actionState actionExecution actionAnswer
  obtain ⟨used, bounded, actual⟩ := RootResetProbeSequence.second_selected (dispatcherWorker program layout)
    (RootResetProbeSequence.worker (actionWorker program layout.tree) tail) (dispatcher_terminal program layout)
    (RootResetProbeSequence.terminal _ _) origin endpoint dispatcherTicks actionUsed (.done false) (.done true)
    dispatcherExecution rfl actionActual rfl
  refine ⟨used, ?_, actual⟩
  have bound := Nat.le_trans bounded (Nat.add_le_add_right (Nat.add_le_add_left actionBound dispatcherTicks) 2)
  simpa only [Nat.add_assoc] using bound

theorem tail_selected (program : CTS.Program) (layout : ActionDispatcher program) (tail : Worker)
    (tailTerminal : tail.Terminal) (origin endpoint : Cursor) (dispatcherTicks actionTicks tailTicks : Nat)
    (dispatcherExecution : run (RootResetLocalDispatcherProbe.machine program layout) dispatcherTicks
      (RootResetLocalDispatcherProbe.initial program layout origin) = ⟨some (.done false), origin⟩)
    (actionState : (actionWorker program layout.tree).Control)
    (actionExecution : run (actionWorker program layout.tree).machine actionTicks
      ((actionWorker program layout.tree).initial origin) = ⟨some actionState, origin⟩)
    (actionAnswer : (actionWorker program layout.tree).answer? actionState = some false)
    (tailState : tail.Control) (tailExecution : run tail.machine tailTicks (tail.initial origin) = ⟨some tailState, endpoint⟩)
    (tailAnswer : tail.answer? tailState = some true) :
    ∃ used, used ≤ dispatcherTicks + actionTicks + tailTicks + 4 ∧ run (withTail program layout tail).machine used
      ((withTail program layout tail).initial origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨tailUsed, tailBound, tailActual⟩ := RootResetProbeSequence.second_selected (actionWorker program layout.tree) tail
    (action_terminal program layout.tree) tailTerminal origin endpoint actionTicks tailTicks actionState tailState
    actionExecution actionAnswer tailExecution tailAnswer
  obtain ⟨used, bounded, actual⟩ := RootResetProbeSequence.second_selected (dispatcherWorker program layout)
    (RootResetProbeSequence.worker (actionWorker program layout.tree) tail) (dispatcher_terminal program layout)
    (RootResetProbeSequence.terminal _ _) origin endpoint dispatcherTicks tailUsed (.done false) (.done true)
    dispatcherExecution rfl tailActual rfl
  refine ⟨used, ?_, actual⟩
  have bound := Nat.le_trans bounded (Nat.add_le_add_right (Nat.add_le_add_left tailBound dispatcherTicks) 2)
  simpa only [Nat.add_assoc] using bound

end PureSFormal.Research.RootResetEndpointPipeline
