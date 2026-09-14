import PureSFormal.Research.RootResetPendingParentProbe
import PureSFormal.Research.RootResetProbeBranch

/-!
Finite entry validation for carrier probes. Root and left occurrences enter
the nonpending worker. A right occurrence enters the pending worker only
after the fixed restoring parent test succeeds. Other right parents reject.
-/
namespace PureSFormal.Research.RootResetScopedCarrierWorker
open PureSFormal.PureS
open FiniteController RootResetCarrierNonemptyProbe RootResetProbeSequence

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker) where
  | start
  | pending (pc : RootResetPendingParentProbe.Control program tree)
  | nonpending (pc : no.Control)
  | admitted (pc : yes.Control)
  | done (ready : Bool)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker) :
    List (Control program tree no yes) := [.start, .done false, .done true] ++
      (RootResetPendingParentProbe.machine program tree).states.map .pending ++ no.machine.states.map .nonpending ++ yes.machine.states.map .admitted

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (state : Control program tree no yes) : state ∈ cover program tree no yes := by
  simp only [cover, List.mem_append]
  cases state with
  | start => exact Or.inl (Or.inl (Or.inl (List.Mem.head _)))
  | done ready =>
      apply Or.inl; apply Or.inl; apply Or.inl
      cases ready
      · exact List.Mem.tail _ (List.Mem.head _)
      · exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))
  | pending pc => exact Or.inl (Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ ((RootResetPendingParentProbe.machine program tree).covers pc))))
  | nonpending pc => exact Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ (no.machine.covers pc)))
  | admitted pc => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ (yes.machine.covers pc))

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (state : Control program tree no yes) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree no yes) :=
  match state with
  | .start => match incoming with
    | .root | .left => .stay (.nonpending no.start)
    | .right => .stay (.pending .start)
  | .pending (.done false) => .stay (.done false)
  | .pending (.done true) => .stay (.admitted yes.start)
  | .pending pc => mapCommand .pending ((RootResetPendingParentProbe.machine program tree).transition pc node incoming)
  | .nonpending pc => match no.answer? pc with
    | some ready => .stay (.done ready)
    | none => mapCommand .nonpending (no.machine.transition pc node incoming)
  | .admitted pc => match yes.answer? pc with
    | some ready => .stay (.done ready)
    | none => mapCommand .admitted (yes.machine.transition pc node incoming)
  | .done ready => .stay (.done ready)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker) :
    Machine (Control program tree no yes) := ⟨fun _ => cover program tree no yes, covers program tree no yes, transition program tree no yes⟩
def answer? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} {no yes : Worker} :
    Control program tree no yes → Option Bool
  | .done ready => some ready
  | _ => none
def worker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker) : Worker :=
  ⟨Control program tree no yes, machine program tree no yes, .start, answer?⟩

theorem pending_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (configuration : Configuration (RootResetPendingParentProbe.Control program tree))
    (running : RootResetPendingParentProbe.done? configuration = false) :
    step (machine program tree no yes) (liftConfiguration Control.pending configuration) =
      liftConfiguration Control.pending (step (RootResetPendingParentProbe.machine program tree) configuration) := by
  apply step_lift
  intro state present
  rcases configuration with ⟨runtime, origin⟩
  have equal : runtime = some state := present
  subst runtime
  cases state with
  | done _ => cases running
  | start | probing _ => rfl

theorem nonpending_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (configuration : Configuration no.Control) (running : ended? no configuration = false) :
    step (machine program tree no yes) (liftConfiguration Control.nonpending configuration) =
      liftConfiguration Control.nonpending (step no.machine configuration) := by
  apply step_lift
  intro state present
  rcases configuration with ⟨runtime, origin⟩
  have equal : runtime = some state := present
  subst runtime
  cases result : no.answer? state with
  | none => simp only [machine, transition, result]
  | some _ => simp only [ended?, result, Option.isSome_some] at running; cases running

theorem admitted_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (configuration : Configuration yes.Control) (running : ended? yes configuration = false) :
    step (machine program tree no yes) (liftConfiguration Control.admitted configuration) =
      liftConfiguration Control.admitted (step yes.machine configuration) := by
  apply step_lift
  intro state present
  rcases configuration with ⟨runtime, origin⟩
  have equal : runtime = some state := present
  subst runtime
  cases result : yes.answer? state with
  | none => simp only [machine, transition, result]
  | some _ => simp only [ended?, result, Option.isSome_some] at running; cases running

theorem pending_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (origin : Cursor) : ∃ used, used ≤ RootResetPendingParentProbe.coefficient program tree ∧
      run (machine program tree no yes) (used + 1)
        (liftConfiguration Control.pending (RootResetPendingParentProbe.initial program tree origin)) =
      if RootResetPendingParentProbe.value program tree origin then
        liftConfiguration Control.admitted (yes.initial origin) else ⟨some (.done false), origin⟩ := by
  obtain ⟨ticks, bounded, actual⟩ := RootResetPendingParentProbe.all_input program tree origin
  obtain ⟨used, usedBound, lifted⟩ := run_to_boundary (RootResetPendingParentProbe.machine program tree)
    (machine program tree no yes) Control.pending RootResetPendingParentProbe.done?
    (RootResetPendingParentProbe.terminal_absorbs program tree) (pending_step program tree no yes) ticks
    (RootResetPendingParentProbe.initial program tree origin) (by rw [actual]; rfl)
  rw [actual] at lifted
  refine ⟨used, Nat.le_trans usedBound bounded, ?_⟩
  rw [run_add, lifted]
  cases RootResetPendingParentProbe.value program tree origin <;> rfl

theorem nonpending_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (terminal : no.Terminal) (origin endpoint : Cursor) (ticks : Nat) (state : no.Control) (ready : Bool)
    (actual : run no.machine ticks (no.initial origin) = ⟨some state, endpoint⟩) (answered : no.answer? state = some ready) :
    ∃ used, used ≤ ticks ∧ run (machine program tree no yes) (used + 1) (liftConfiguration Control.nonpending (no.initial origin)) =
      ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary no.machine (machine program tree no yes) Control.nonpending (ended? no)
    (terminal_absorbs no terminal) (nonpending_step program tree no yes) ticks (no.initial origin)
    (by rw [actual]; exact congrArg Option.isSome answered)
  rw [actual] at lifted
  refine ⟨used, bounded, ?_⟩
  rw [run_add, lifted]
  change run (machine program tree no yes) 1 ⟨some (.nonpending state), endpoint⟩ = _
  simp only [run, step, machine, transition, answered]

theorem admitted_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (terminal : yes.Terminal) (origin endpoint : Cursor) (ticks : Nat) (state : yes.Control) (ready : Bool)
    (actual : run yes.machine ticks (yes.initial origin) = ⟨some state, endpoint⟩) (answered : yes.answer? state = some ready) :
    ∃ used, used ≤ ticks ∧ run (machine program tree no yes) (used + 1) (liftConfiguration Control.admitted (yes.initial origin)) =
      ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary yes.machine (machine program tree no yes) Control.admitted (ended? yes)
    (terminal_absorbs yes terminal) (admitted_step program tree no yes) ticks (yes.initial origin)
    (by rw [actual]; exact congrArg Option.isSome answered)
  rw [actual] at lifted
  refine ⟨used, bounded, ?_⟩
  rw [run_add, lifted]
  change run (machine program tree no yes) 1 ⟨some (.admitted state), endpoint⟩ = _
  simp only [run, step, machine, transition, answered]

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (noCoefficient yesCoefficient : Nat) : Nat :=
  RootResetPendingParentProbe.coefficient program tree + noCoefficient + yesCoefficient + 3

theorem combined_bound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor)
    (noCoefficient yesCoefficient pending noTicks yesTicks handoffs : Nat)
    (pendingBound : pending ≤ RootResetPendingParentProbe.coefficient program tree * origin.erase.size)
    (noBound : noTicks ≤ noCoefficient * origin.erase.size) (yesBound : yesTicks ≤ yesCoefficient * origin.erase.size)
    (handoffBound : handoffs ≤ 3) :
    pending + noTicks + yesTicks + handoffs ≤ coefficient program tree noCoefficient yesCoefficient * origin.erase.size := by
  have constants : handoffs ≤ 3 * origin.erase.size := Nat.le_trans handoffBound
    (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left 3 (Term.size_pos origin.erase))
  simpa only [coefficient, Nat.add_mul] using Nat.add_le_add (Nat.add_le_add (Nat.add_le_add pendingBound noBound) yesBound) constants

theorem nonpending_at (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (noCoefficient yesCoefficient : Nat) (terminal : no.Terminal) (origin : Cursor)
    (incoming : Probe.observeIncoming origin ≠ .right)
    (restores : RootResetProbeBranch.RestoringAt no noCoefficient origin) :
    RootResetProbeBranch.RestoringAt (worker program tree no yes) (coefficient program tree noCoefficient yesCoefficient) origin := by
  obtain ⟨ticks, ready, endpoint, state, bounded, actual, answered, facts⟩ := restores
  obtain ⟨used, usedBound, execution⟩ := nonpending_runs program tree no yes terminal origin endpoint ticks state ready actual answered
  have first : run (machine program tree no yes) 1 ((worker program tree no yes).initial origin) =
      liftConfiguration Control.nonpending (no.initial origin) := by
    change step (machine program tree no yes) ⟨some .start, origin⟩ = _
    cases observed : Probe.observeIncoming origin with
    | root | left => simp only [step, machine, transition, observed]; rfl
    | right => exact False.elim (incoming observed)
  refine ⟨1 + (used + 1), ready, endpoint, .done ready, ?_, ?_, rfl, facts⟩
  · simpa only [Nat.zero_add, Nat.add_zero, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
      combined_bound program tree origin noCoefficient yesCoefficient 0 used 0 2
        (Nat.zero_le _) (Nat.le_trans usedBound bounded) (Nat.zero_le _) (by decide)
  · exact (run_add (machine program tree no yes) 1 (used + 1) _).trans
      ((congrArg (run (machine program tree no yes) (used + 1)) first).trans execution)

theorem restoring (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (noCoefficient yesCoefficient : Nat) (noTerminal : no.Terminal) (yesTerminal : yes.Terminal)
    (noRestores : ∀ origin, RootResetCompleteCarrierRows.Boundary origin → RootResetProbeBranch.RestoringAt no noCoefficient origin)
    (yesRestores : ∀ origin, RootResetCompleteCarrierRows.Boundary origin → RootResetProbeBranch.RestoringAt yes yesCoefficient origin) :
    (worker program tree no yes).Restoring (coefficient program tree noCoefficient yesCoefficient) := by
  intro origin
  rcases origin with ⟨source, parents⟩
  cases parents with
  | nil =>
      exact nonpending_at program tree no yes noCoefficient yesCoefficient noTerminal (Cursor.atRoot source) (by intro h; cases h)
        (noRestores _ (RootResetCompleteCarrierRows.root_boundary source))
  | cons frame parents => cases frame with
    | left audit =>
        exact nonpending_at program tree no yes noCoefficient yesCoefficient noTerminal ⟨source, .left audit :: parents⟩ (by intro h; cases h)
          (noRestores _ (RootResetCompleteCarrierRows.left_boundary source audit parents))
    | right sibling =>
        let origin : Cursor := ⟨source, .right sibling :: parents⟩
        obtain ⟨pendingUsed, pendingBound, pendingRun⟩ := pending_runs program tree no yes origin
        have pendingPaid : pendingUsed ≤ RootResetPendingParentProbe.coefficient program tree * origin.erase.size :=
          Nat.le_trans pendingBound (by simpa only [Nat.mul_one] using (Nat.mul_le_mul_left (RootResetPendingParentProbe.coefficient program tree) (Term.size_pos origin.erase)))
        have first : run (machine program tree no yes) 1 ((worker program tree no yes).initial origin) =
            liftConfiguration Control.pending (RootResetPendingParentProbe.initial program tree origin) := rfl
        cases found : RootResetPendingParentProbe.value program tree origin with
        | false =>
            rw [found] at pendingRun
            refine ⟨1 + (pendingUsed + 1), false, origin, .done false, ?_, ?_, rfl, rfl⟩
            · simpa only [Nat.zero_add, Nat.add_zero, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
                combined_bound program tree origin noCoefficient yesCoefficient pendingUsed 0 0 2 pendingPaid (Nat.zero_le _) (Nat.zero_le _) (by decide)
            · exact (run_add (machine program tree no yes) 1 (pendingUsed + 1) _).trans
                ((congrArg (run (machine program tree no yes) (pendingUsed + 1)) first).trans pendingRun)
        | true =>
            rw [found] at pendingRun
            have boundary := RootResetPendingParentProbe.true_boundary found
            obtain ⟨ticks, ready, endpoint, state, bounded, actual, answered, facts⟩ := yesRestores origin boundary
            obtain ⟨used, usedBound, execution⟩ := admitted_runs program tree no yes yesTerminal origin endpoint ticks state ready actual answered
            refine ⟨1 + (pendingUsed + 1) + (used + 1), ready, endpoint, .done ready, ?_, ?_, rfl, facts⟩
            · simpa only [Nat.zero_add, Nat.add_zero, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
                combined_bound program tree origin noCoefficient yesCoefficient pendingUsed 0 used 3 pendingPaid
                  (Nat.zero_le _) (Nat.le_trans usedBound bounded) (Nat.le_refl _)
            · have enters : run (machine program tree no yes) (1 + (pendingUsed + 1)) ((worker program tree no yes).initial origin) =
                  liftConfiguration Control.admitted (yes.initial origin) := by
                exact (run_add (machine program tree no yes) 1 (pendingUsed + 1) _).trans
                  ((congrArg (run (machine program tree no yes) (pendingUsed + 1)) first).trans pendingRun)
              exact (run_add (machine program tree no yes) (1 + (pendingUsed + 1)) (used + 1) _).trans
                ((congrArg (run (machine program tree no yes) (used + 1)) enters).trans execution)

theorem readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (noSafe : no.ReadOnly) (yesSafe : yes.ReadOnly) : (worker program tree no yes).ReadOnly := by
  intro configuration
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | start => cases Probe.observeIncoming cursor <;> rfl
      | done ready => rfl
      | pending pc =>
          have zero := RootResetPendingParentProbe.mutationCount_zero program tree ⟨some pc, cursor⟩
          cases pc with
          | done ready => cases ready <;> rfl
          | start | probing _ =>
              simp only [worker, machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero
      | nonpending pc =>
          have zero := noSafe ⟨some pc, cursor⟩
          cases answered : no.answer? pc with
          | some ready => simp only [worker, machine, transition, answered]; rfl
          | none =>
              simp only [worker, machine, transition, answered, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero
      | admitted pc =>
          have zero := yesSafe ⟨some pc, cursor⟩
          cases answered : yes.answer? pc with
          | some ready => simp only [worker, machine, transition, answered]; rfl
          | none =>
              simp only [worker, machine, transition, answered, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero

theorem done_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (ready : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine program tree no yes) ticks ⟨some (.done ready), origin⟩ = ⟨some (.done ready), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

theorem terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker) :
    (worker program tree no yes).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | done result => exact done_absorbs program tree no yes result origin ticks
  | start | pending _ | nonpending _ | admitted _ => cases answered

theorem terminal_stay (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (no yes : Worker)
    (state : (worker program tree no yes).Control) (node : Probe.NodeKind) (incoming : Probe.Incoming)
    (ended : ((worker program tree no yes).answer? state).isSome = true) :
    (worker program tree no yes).machine.transition state node incoming = .stay state := by
  cases state with
  | done ready => rfl
  | start | pending _ | nonpending _ | admitted _ => cases ended

end PureSFormal.Research.RootResetScopedCarrierWorker
