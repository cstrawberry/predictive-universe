import PureSFormal.Research.FiniteControllerReindexing
import PureSFormal.Research.RootResetProbeSequence

/-! The constructive compiler specialized to the repository's actual finite
worker interface. Control equality is an explicit computational parameter. -/
namespace PureSFormal.Research.FiniteWorkerTreeAutomaton
open PureSFormal.PureS FiniteController RootResetProbeSequence FiniteControllerReindexing

def accept (worker : Worker) (index : Fin worker.machine.states.length) : Bool :=
  (worker.answer? (decode worker.machine index)).getD false

def automaton (worker : Worker) [DecidableEq worker.Control] :
    FiniteTreeAutomatonPowerset.Deterministic (FiniteTreeAutomatonPowerset.Bits
      (ClosedSetTreeAutomaton.Boundary.cover worker.machine.states.length).length) :=
  ClosedSetTreeAutomaton.compiled (reindex worker.machine) (accept worker) (encode worker.machine worker.start)

theorem accept_fixed (worker : Worker) [DecidableEq worker.Control] (terminal : worker.Terminal)
    (index : Fin worker.machine.states.length) (accepted : accept worker index = true) (cursor : Cursor) :
    step (reindex worker.machine) ⟨some index, cursor⟩ = ⟨some index, cursor⟩ := by
  apply reindex_fixed
  have answered : worker.answer? (decode worker.machine index) = some true := by
    cases answer : worker.answer? (decode worker.machine index) with
    | none => simp only [accept, answer, Option.getD_none] at accepted; cases accepted
    | some ready =>
      simp only [accept, answer, Option.getD_some] at accepted
      have equal : ready = true := accepted
      exact congrArg some equal
  exact terminal _ true answered cursor 1

theorem initial_projection (worker : Worker) [DecidableEq worker.Control] (source : Term) :
    project worker.machine ⟨some (encode worker.machine worker.start), Cursor.atRoot source⟩ =
      worker.initial (Cursor.atRoot source) := by
  simp only [project, Option.map, decode_encode, Worker.initial]

theorem run_projection (worker : Worker) [DecidableEq worker.Control] (source : Term) (ticks : Nat) :
    project worker.machine
      (run (reindex worker.machine) ticks ⟨some (encode worker.machine worker.start), Cursor.atRoot source⟩) =
      run worker.machine ticks (worker.initial (Cursor.atRoot source)) := by
  rw [project_run, initial_projection]

theorem observed_projection (worker : Worker) [DecidableEq worker.Control]
    (configuration : Configuration (Fin worker.machine.states.length)) :
    FiniteReadonlyTreeAutomaton.observed (accept worker) configuration =
      ((project worker.machine configuration).control.bind worker.answer?).getD false := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime <;> rfl

theorem automaton_agrees (worker : Worker) [DecidableEq worker.Control]
    (terminal : worker.Terminal) (readOnly : worker.ReadOnly)
    (source : Term) (ticks : Nat)
    (fixed : step worker.machine (run worker.machine ticks (worker.initial (Cursor.atRoot source))) =
      run worker.machine ticks (worker.initial (Cursor.atRoot source))) :
    (automaton worker).accepts source =
      ((run worker.machine ticks (worker.initial (Cursor.atRoot source))).control.bind worker.answer?).getD false := by
  have stable : step (reindex worker.machine)
      (run (reindex worker.machine) ticks ⟨some (encode worker.machine worker.start), Cursor.atRoot source⟩) =
      run (reindex worker.machine) ticks ⟨some (encode worker.machine worker.start), Cursor.atRoot source⟩ := by
    apply reindex_fixed
    rw [run_projection]
    exact fixed
  have result := FiniteReadonlyTreeAutomaton.compiled_agrees_bool (reindex worker.machine) (accept worker)
    (fun configuration => (reindex_mutation worker.machine configuration).trans (readOnly _))
    (accept_fixed worker terminal) (encode worker.machine worker.start) source ticks stable
  rw [observed_projection, run_projection] at result
  exact result

end PureSFormal.Research.FiniteWorkerTreeAutomaton
