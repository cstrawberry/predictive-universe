import PureSFormal.Research.RootResetActiveEndpointProbe
import PureSFormal.Research.RootResetFreshAncestorProbe

/-!
Locate the current completed response before deciding between response work
and the active endpoint. Both FRAME and ordinary frontend terminals enter
the same upward search; no tentative selection survives in a runtime cursor.
-/
namespace PureSFormal.Research.RootResetResponseCandidateProbe
open PureSFormal.PureS
open FiniteController RootResetProbeSequence

def searchFrontend (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  { RootResetActiveEndpointProbe.frontend program tree with
    answer? := fun state => (RootResetActiveEndpointProbe.frontendAnswer? state).map (fun _ => false) }

theorem search_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (searchFrontend program tree).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | done result => exact RootResetActiveMarkedFrontend.done_absorbs program tree result origin ticks
  | marked _ | enterRight | enterLeft | frame _ | segment _ => cases answered

def ancestorAnswer? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} :
    RootResetFreshAncestorProbe.Control program tree → Option Bool
  | .done found => some found
  | _ => none

def ancestor (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  ⟨RootResetFreshAncestorProbe.Control program tree, RootResetFreshAncestorProbe.machine program tree,
    .probing ⟨RootResetFreshAncestorProbe.classifier program tree, ProbeCompiler.Control.self_mem_nodes _⟩,
    ancestorAnswer?⟩

theorem ancestor_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (ancestor program tree).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | done result => exact RootResetFreshAncestorProbe.done_absorbs program tree result origin ticks
  | probing _ | ascend => cases answered

def worker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetProbeSequence.worker (searchFrontend program tree) (ancestor program tree)

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetActiveMarkedFrontend.coefficient program tree + RootResetFreshAncestorProbe.coefficient program tree + 2

theorem terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (worker program tree).Terminal := RootResetProbeSequence.terminal _ _

theorem terminal_stay (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : (worker program tree).Control) (node : Probe.NodeKind) (incoming : Probe.Incoming)
    (ended : ((worker program tree).answer? state).isSome = true) :
    (worker program tree).machine.transition state node incoming = .stay state :=
  RootResetProbeSequence.terminal_stay _ _ state ended node incoming

theorem readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (worker program tree).ReadOnly :=
  RootResetProbeSequence.readOnly _ _ (RootResetActiveMarkedFrontend.mutationCount_zero program tree)
    (RootResetFreshAncestorProbe.mutationCount_zero program tree)

structure Result (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (found : Bool) (candidate : Cursor) : Prop where
  active : ∃ ready endpoint, RootResetActiveMarkedFrontend.Trace program tree (Cursor.atRoot source) ready endpoint ∧
    RootResetFreshAncestorProbe.First program tree endpoint found candidate
  preserved : candidate.erase = source

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) :
    ∃ ticks found candidate, ticks ≤ coefficient program tree * source.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial (Cursor.atRoot source)) =
        ⟨some (.done found), candidate⟩ ∧ Result program tree source found candidate := by
  obtain ⟨frontTicks, ready, endpoint, frontBound, frontRun, trace, _, preserved⟩ :=
    RootResetActiveMarkedFrontend.all_input_atRoot program tree source
  obtain ⟨frontUsed, frontUsedBound, frontActual⟩ := first_runs (searchFrontend program tree) (ancestor program tree)
    (search_terminal program tree) (Cursor.atRoot source) endpoint frontTicks (.done ready) false frontRun rfl
  obtain ⟨searchTicks, found, candidate, searchBound, searchRun, first⟩ := RootResetFreshAncestorProbe.all_input program tree endpoint
  obtain ⟨searchUsed, searchUsedBound, searchActual⟩ := second_runs (searchFrontend program tree) (ancestor program tree)
    (ancestor_terminal program tree) endpoint candidate searchTicks (.done found) found searchRun rfl
  have frontPaid := Nat.le_trans frontUsedBound frontBound
  have searchPaid := Nat.le_trans searchUsedBound searchBound
  rw [preserved] at searchPaid
  refine ⟨frontUsed + 1 + (searchUsed + 1), found, candidate, ?_, ?_, ⟨⟨ready, endpoint, trace, first⟩, ?_⟩⟩
  · simpa only [coefficient, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Cursor.atRoot, Cursor.erase, Cursor.rebuild]
      using combined_bound (Cursor.atRoot source) (RootResetActiveMarkedFrontend.coefficient program tree)
        (RootResetFreshAncestorProbe.coefficient program tree) frontUsed searchUsed 2 frontPaid searchPaid (Nat.le_refl _)
  · change run (RootResetProbeSequence.machine _ _) _ (RootResetProbeSequence.initial _ _ _) = _
    rw [run_add, frontActual]
    exact searchActual
  · have unchanged := RootResetFreshAncestorProbe.erase_run program tree searchTicks (RootResetFreshAncestorProbe.initial program tree endpoint)
    rw [searchRun] at unchanged
    exact unchanged.trans preserved

/-- Forward any exact generated frontend and nearest-ancestor traces through
the same actual finite candidate pass. -/
theorem generated (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (frontTicks searchTicks : Nat) (ready found : Bool) (endpoint candidate : Cursor)
    (frontRun : run (RootResetActiveMarkedFrontend.machine program tree) frontTicks
      (RootResetActiveMarkedFrontend.initial program tree (Cursor.atRoot source)) = ⟨some (.done ready), endpoint⟩)
    (searchRun : run (RootResetFreshAncestorProbe.machine program tree) searchTicks
      (RootResetFreshAncestorProbe.initial program tree endpoint) = ⟨some (.done found), candidate⟩) :
    ∃ used, used ≤ frontTicks + searchTicks + 2 ∧
      run (worker program tree).machine used ((worker program tree).initial (Cursor.atRoot source)) =
        ⟨some (.done found), candidate⟩ := by
  obtain ⟨frontUsed, frontBound, frontActual⟩ := first_runs (searchFrontend program tree) (ancestor program tree)
    (search_terminal program tree) (Cursor.atRoot source) endpoint frontTicks (.done ready) false frontRun rfl
  obtain ⟨searchUsed, searchBound, searchActual⟩ := second_runs (searchFrontend program tree) (ancestor program tree)
    (ancestor_terminal program tree) endpoint candidate searchTicks (.done found) found searchRun rfl
  refine ⟨frontUsed + 1 + (searchUsed + 1), ?_, ?_⟩
  · simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add_right (Nat.add_le_add frontBound searchBound) 2
  · change run (RootResetProbeSequence.machine _ _) _ (RootResetProbeSequence.initial _ _ _) = _
    rw [run_add, frontActual]
    exact searchActual

end PureSFormal.Research.RootResetResponseCandidateProbe
