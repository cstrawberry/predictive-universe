import PureSFormal.Research.RootResetActiveMarkedFrontend
import PureSFormal.Research.RootResetScopedResponseProbes
import PureSFormal.Research.RootResetReadonlySelector

/-!
The concrete active-context and endpoint pass used after response-priority
queries have declined. It is also a complete read-only finite selection pass
on arbitrary root terms. Its standalone contract does not assert complete
CTS trajectory agreement: completed-response priority precedes this pass.
-/
namespace PureSFormal.Research.RootResetActiveEndpointProbe
set_option maxRecDepth 10000
open PureSFormal.PureS
open FiniteController RootResetProbeSequence

namespace Endpoint
abbrev worker := RootResetScopedResponseProbes.endpoint
abbrev coefficient := RootResetScopedResponseProbes.endpointCoefficient
abbrev readOnly := RootResetScopedResponseProbes.endpoint_readOnly
abbrev all_input := RootResetScopedResponseProbes.endpoint_restoring
abbrev terminal := RootResetScopedResponseProbes.endpoint_terminal
abbrev erase_run := RootResetScopedResponseProbes.endpoint_erase
end Endpoint

def frontendAnswer? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} :
    RootResetActiveMarkedFrontend.Control program tree → Option Bool
  | .done ready => some ready
  | _ => none

def frontend (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  ⟨RootResetActiveMarkedFrontend.Control program tree, RootResetActiveMarkedFrontend.machine program tree,
    .marked ⟨RootResetActiveMarkedFrontend.markedClassifier program tree, ProbeCompiler.Control.self_mem_nodes _⟩,
    frontendAnswer?⟩

theorem frontend_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (frontend program tree).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | done result => exact RootResetActiveMarkedFrontend.done_absorbs program tree result origin ticks
  | marked _ | enterRight | enterLeft | frame _ | segment _ => cases answered

def worker (program : CTS.Program) (layout : ActionDispatcher program) : Worker :=
  RootResetProbeSequence.worker (frontend program layout.tree) (Endpoint.worker program layout)

def coefficient (program : CTS.Program) (layout : ActionDispatcher program) : Nat :=
  RootResetActiveMarkedFrontend.coefficient program layout.tree + Endpoint.coefficient program layout + 2

theorem terminal (program : CTS.Program) (layout : ActionDispatcher program) : (worker program layout).Terminal :=
  RootResetProbeSequence.terminal _ _

theorem terminal_stay (program : CTS.Program) (layout : ActionDispatcher program)
    (state : (worker program layout).Control) (node : Probe.NodeKind) (incoming : Probe.Incoming)
    (ended : ((worker program layout).answer? state).isSome = true) :
    (worker program layout).machine.transition state node incoming = .stay state :=
  RootResetProbeSequence.terminal_stay _ _ state ended node incoming

theorem readOnly (program : CTS.Program) (layout : ActionDispatcher program) : (worker program layout).ReadOnly :=
  RootResetProbeSequence.readOnly _ _ (RootResetActiveMarkedFrontend.mutationCount_zero program layout.tree)
    (Endpoint.readOnly program layout)

theorem all_input_atRoot (program : CTS.Program) (layout : ActionDispatcher program) (source : Term) :
    ∃ ticks ready endpoint state, ticks ≤ coefficient program layout * source.size ∧
      run (worker program layout).machine ticks ((worker program layout).initial (Cursor.atRoot source)) = ⟨some state, endpoint⟩ ∧
      (worker program layout).answer? state = some ready ∧ endpoint.erase = source ∧
      (if ready then endpoint.rdx?.isSome = true else True) := by
  obtain ⟨ticks, ready, middle, bounded, execution, _, facts, preserved⟩ :=
    RootResetActiveMarkedFrontend.all_input_atRoot program layout.tree source
  obtain ⟨used, usedBound, actual⟩ := first_runs (frontend program layout.tree) (Endpoint.worker program layout)
    (frontend_terminal program layout.tree) (Cursor.atRoot source) middle ticks (.done ready) ready execution rfl
  have paid := Nat.le_trans usedBound bounded
  cases ready with
  | true =>
      refine ⟨used + 1, true, middle, .done true, ?_, actual, rfl, preserved, facts⟩
      simpa only [Nat.add_zero] using! combined_bound (Cursor.atRoot source)
        (RootResetActiveMarkedFrontend.coefficient program layout.tree) (Endpoint.coefficient program layout)
        used 0 1 paid (Nat.zero_le _) (by decide)
  | false =>
      obtain ⟨endpointTicks, ready, endpoint, state, endpointBound, endpointRun, answered, facts⟩ :=
        Endpoint.all_input program layout middle
      obtain ⟨endpointUsed, endpointUsedBound, endpointActual⟩ := second_runs
        (frontend program layout.tree) (Endpoint.worker program layout)
        (Endpoint.terminal program layout) middle endpoint endpointTicks state ready endpointRun answered
      have endpointPaid := Nat.le_trans endpointUsedBound endpointBound
      rw [preserved] at endpointPaid
      refine ⟨used + 1 + (endpointUsed + 1), ready, endpoint, .done ready, ?_, ?_, rfl, ?_, ?_⟩
      · simpa only [coefficient, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Cursor.atRoot, Cursor.erase, Cursor.rebuild]
          using combined_bound (Cursor.atRoot source)
          (RootResetActiveMarkedFrontend.coefficient program layout.tree) (Endpoint.coefficient program layout)
          used endpointUsed 2 paid endpointPaid (Nat.le_refl _)
      · change run (RootResetProbeSequence.machine _ _) _ (RootResetProbeSequence.initial _ _ _) = _
        rw [run_add, actual]
        exact endpointActual
      · have unchanged := Endpoint.erase_run program layout endpointTicks
          ((Endpoint.worker program layout).initial middle)
        rw [endpointRun] at unchanged
        exact unchanged.trans preserved
      · cases ready with
        | true => exact facts
        | false => trivial

def probeSpec (program : CTS.Program) (layout : ActionDispatcher program) :
    RootResetReadonlySelector.ProbeSpec (worker program layout).Control where
  machine := (worker program layout).machine
  start := (worker program layout).start
  answer := (worker program layout).answer?
  terminal_stay := terminal_stay program layout
  mutation_zero := readOnly program layout
  coefficient := coefficient program layout
  all_input := by
    intro source
    obtain ⟨ticks, ready, endpoint, state, bounded, execution, answered, preserved, facts⟩ := all_input_atRoot program layout source
    refine ⟨ticks, state, endpoint, Nat.le_trans bounded (Nat.mul_le_mul_left _ (Nat.le_succ _)), execution,
      by rw [answered]; rfl, preserved, ?_⟩
    intro successful
    rw [answered] at successful
    have equal : ready = true := Option.some.inj successful
    subst ready
    exact facts

def fallbackContract (program : CTS.Program) (layout : ActionDispatcher program) : RootResetSelectorContract.Contract :=
  RootResetReadonlySelector.selectorContract (probeSpec program layout)

end PureSFormal.Research.RootResetActiveEndpointProbe
