import PureSFormal.Research.FiniteReadonlyTreeAutomaton

/-! Constructive reindexing of a controller with decidable control equality.
Repeated entries in its cover are allowed. A self-transition retains its
current index, so stationarity is preserved even at duplicate indices. -/
namespace PureSFormal.Research.FiniteControllerReindexing
open PureSFormal.PureS FiniteController

def locate {Q : Type} [DecidableEq Q] (values : List Q) (q : Q) (member : q ∈ values) :
    Fin values.length :=
  match values with
  | [] => False.elim (List.not_mem_nil member)
  | head :: tail =>
      if equal : q = head then ⟨0, Nat.zero_lt_succ _⟩
      else (locate tail q (by
        cases member with
        | head => exact False.elim (equal rfl)
        | tail _ rest => exact rest)).succ

theorem get_locate {Q : Type} [DecidableEq Q] (values : List Q) (q : Q) (member : q ∈ values) :
    values.get (locate values q member) = q := by
  induction values with
  | nil => exact False.elim (List.not_mem_nil member)
  | cons head tail ih =>
    unfold locate
    split
    · next equal => exact equal.symm
    · exact ih _

def decode (machine : Machine Q) (index : Fin machine.states.length) : Q := machine.states.get index

def encode [DecidableEq Q] (machine : Machine Q) (q : Q) : Fin machine.states.length :=
  locate machine.states q (machine.covers q)

theorem decode_encode [DecidableEq Q] (machine : Machine Q) (q : Q) :
    decode machine (encode machine q) = q := get_locate _ _ _

def nextIndex [DecidableEq Q] (machine : Machine Q) (index : Fin machine.states.length) (q : Q) :
    Fin machine.states.length := if q = decode machine index then index else encode machine q

theorem decode_nextIndex [DecidableEq Q] (machine : Machine Q)
    (index : Fin machine.states.length) (q : Q) : decode machine (nextIndex machine index q) = q := by
  unfold nextIndex
  split
  · next equal => exact equal.symm
  · exact decode_encode machine q

theorem nextIndex_self [DecidableEq Q] (machine : Machine Q) (index : Fin machine.states.length) :
    nextIndex machine index (decode machine index) = index := by
  simp only [nextIndex, ↓reduceIte]

def translate [DecidableEq Q] (machine : Machine Q) (index : Fin machine.states.length) :
    Command Q → Command (Fin machine.states.length)
  | .stay q => .stay (nextIndex machine index q)
  | .exec primitive q => .exec primitive (nextIndex machine index q)
  | .reject => .reject

def reindex [DecidableEq Q] (machine : Machine Q) : Machine (Fin machine.states.length) where
  stateCover _ := List.finRange machine.states.length
  covers index := List.mem_ofFn.mpr ⟨index, rfl⟩
  transition index node incoming := translate machine index (machine.transition (decode machine index) node incoming)

def project (machine : Machine Q) (configuration : Configuration (Fin machine.states.length)) :
    Configuration Q := ⟨configuration.control.map (decode machine), configuration.cursor⟩

theorem project_step [DecidableEq Q] (machine : Machine Q)
    (configuration : Configuration (Fin machine.states.length)) :
    project machine (step (reindex machine) configuration) = step machine (project machine configuration) := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some index =>
    generalize command : machine.transition (decode machine index)
      (Probe.observeNode cursor) (Probe.observeIncoming cursor) = instruction
    cases instruction with
    | reject => simp only [step, reindex, project, Option.map, command, translate, Option.map_none]
    | stay q => simp only [step, reindex, project, Option.map, command, translate, decode_nextIndex]
    | exec primitive q =>
      cases move : primitive.exec cursor with
      | none => simp only [step, reindex, project, Option.map, command, translate, move, Option.map_none]
      | some after => simp only [step, reindex, project, Option.map, command, translate, move, decode_nextIndex]

theorem project_run [DecidableEq Q] (machine : Machine Q)
    (configuration : Configuration (Fin machine.states.length)) (ticks : Nat) :
    project machine (run (reindex machine) ticks configuration) = run machine ticks (project machine configuration) := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [run_succ, ih, project_step, run_succ]

theorem reindex_mutation [DecidableEq Q] (machine : Machine Q)
    (configuration : Configuration (Fin machine.states.length)) :
    mutationCount (reindex machine) configuration = mutationCount machine (project machine configuration) := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some index =>
    generalize command : machine.transition (decode machine index)
      (Probe.observeNode cursor) (Probe.observeIncoming cursor) = instruction
    cases instruction with
    | reject => simp only [mutationCount, reindex, project, Option.map, command, translate]
    | stay q => simp only [mutationCount, reindex, project, Option.map, command, translate]
    | exec primitive q => cases primitive <;>
        simp only [mutationCount, reindex, project, Option.map, command, translate]

theorem reindex_fixed [DecidableEq Q] (machine : Machine Q)
    (configuration : Configuration (Fin machine.states.length))
    (fixed : step machine (project machine configuration) = project machine configuration) :
    step (reindex machine) configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some index =>
    generalize command : machine.transition (decode machine index)
      (Probe.observeNode cursor) (Probe.observeIncoming cursor) = instruction
    cases instruction with
    | reject =>
      have impossible := congrArg Configuration.control fixed
      simp only [step, project, Option.map, command] at impossible
      cases impossible
    | stay q =>
      have stateEq := congrArg Configuration.control fixed
      simp only [step, project, Option.map, command] at stateEq
      have equal : q = decode machine index := Option.some.inj stateEq
      simp only [step, reindex, command, translate, equal, nextIndex_self]
    | exec primitive q =>
      cases move : primitive.exec cursor with
      | none =>
        have impossible := congrArg Configuration.control fixed
        simp only [step, project, Option.map, command, move] at impossible
        cases impossible
      | some after =>
        have stateEq := congrArg Configuration.control fixed
        have cursorEq := congrArg Configuration.cursor fixed
        simp only [step, project, Option.map, command, move] at stateEq cursorEq
        have equal : q = decode machine index := Option.some.inj stateEq
        simp only [step, reindex, command, translate, move, equal, nextIndex_self, cursorEq]

end PureSFormal.Research.FiniteControllerReindexing
