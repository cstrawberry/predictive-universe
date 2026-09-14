import PureSFormal.Research.RootResetReplayProbe

/-! Finite priority between root-certified selection passes. Rejection of
the first pass triggers explicit root ascent before the second pass starts. -/
namespace PureSFormal.Research.RootResetPriorityReplay
open PureSFormal.PureS
open FiniteController RootResetProbeSequence RootResetReadonlySelector

def firstWorker (first : ProbeSpec α) : Worker := ⟨α, first.machine, first.start, first.answer⟩
def worker (first : ProbeSpec α) (second : ProbeSpec β) : Worker :=
  RootResetProbeSequence.worker (firstWorker first) (RootResetReplayProbe.worker second)

theorem first_terminal (first : ProbeSpec α) : (firstWorker first).Terminal := by
  intro state ready answered origin ticks
  change first.answer state = some ready at answered
  exact probe_absorbs first ⟨some state, origin⟩ (by change (first.answer state).isSome = true; rw [answered]; rfl) ticks

def coefficient (first : ProbeSpec α) (second : ProbeSpec β) : Nat :=
  first.coefficient + RootResetReplayProbe.coefficient second + 2

theorem combined_bound (first : ProbeSpec α) (second : ProbeSpec β) (source : Term) (a b h : Nat)
    (firstBound : a ≤ first.coefficient * (source.size + 1))
    (secondBound : b ≤ RootResetReplayProbe.coefficient second * (source.size + 1)) (handoffs : h ≤ 2) :
    a + b + h ≤ coefficient first second * (source.size + 1) := by
  have constants : h ≤ 2 * (source.size + 1) := Nat.le_trans handoffs
    (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left 2 (Nat.succ_le_succ (Nat.zero_le source.size)))
  simpa only [coefficient, Nat.add_mul] using Nat.add_le_add (Nat.add_le_add firstBound secondBound) constants

theorem all_input (first : ProbeSpec α) (second : ProbeSpec β) (source : Term) :
    ∃ ticks state endpoint, ticks ≤ coefficient first second * (source.size + 1) ∧
      run (worker first second).machine ticks ((worker first second).initial (Cursor.atRoot source)) = ⟨some state, endpoint⟩ ∧
      ((worker first second).answer? state).isSome = true ∧ endpoint.erase = source ∧
      ((worker first second).answer? state = some true → endpoint.rdx?.isSome = true) := by
  obtain ⟨ticks, state, middle, bounded, actual, terminal, preserved, sound⟩ := first.all_input source
  cases answered : first.answer state with
  | none => rw [answered] at terminal; cases terminal
  | some ready =>
      obtain ⟨used, usedBound, execution⟩ := RootResetProbeSequence.first_runs (firstWorker first) (RootResetReplayProbe.worker second)
        (first_terminal first) (Cursor.atRoot source) middle ticks state ready actual answered
      have paid := Nat.le_trans usedBound bounded
      cases ready with
      | true =>
          refine ⟨used + 1, .done true, middle, ?_, execution, rfl, preserved, fun _ => sound answered⟩
          simpa only [Nat.add_zero] using combined_bound first second source used 0 1 paid (Nat.zero_le _) (by decide)
      | false =>
          obtain ⟨replayTicks, replayState, endpoint, replayBound, replayRun, replayTerminal, replayPreserved, replaySound⟩ :=
            RootResetReplayProbe.all_input second middle
          cases replayAnswer : (RootResetReplayProbe.worker second).answer? replayState with
          | none => rw [replayAnswer] at replayTerminal; cases replayTerminal
          | some result =>
              obtain ⟨replayUsed, replayUsedBound, replayActual⟩ := RootResetProbeSequence.second_runs
                (firstWorker first) (RootResetReplayProbe.worker second) (RootResetReplayProbe.terminal second)
                middle endpoint replayTicks replayState result replayRun replayAnswer
              have replayPaid := Nat.le_trans replayUsedBound replayBound
              rw [preserved] at replayPaid
              refine ⟨used + 1 + (replayUsed + 1), .done result, endpoint, ?_, ?_, rfl,
                replayPreserved.trans preserved, ?_⟩
              · simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined_bound first second source used replayUsed 2 paid replayPaid (Nat.le_refl _)
              · change run (RootResetProbeSequence.machine _ _) _ (RootResetProbeSequence.initial _ _ _) = _
                rw [run_add, execution]
                exact replayActual
              · intro accepted
                have equal : result = true := Option.some.inj accepted
                subst result
                exact replaySound replayAnswer

theorem readOnly (first : ProbeSpec α) (second : ProbeSpec β) : (worker first second).ReadOnly :=
  RootResetProbeSequence.readOnly _ _ first.mutation_zero (RootResetReplayProbe.readOnly second)

theorem terminal_stay (first : ProbeSpec α) (second : ProbeSpec β) (state : (worker first second).Control)
    (node : Probe.NodeKind) (incoming : Probe.Incoming) (ended : ((worker first second).answer? state).isSome = true) :
    (worker first second).machine.transition state node incoming = .stay state :=
  RootResetProbeSequence.terminal_stay _ _ state ended node incoming

def probeSpec (first : ProbeSpec α) (second : ProbeSpec β) : ProbeSpec (worker first second).Control where
  machine := (worker first second).machine
  start := (worker first second).start
  answer := (worker first second).answer?
  terminal_stay := terminal_stay first second
  mutation_zero := readOnly first second
  coefficient := coefficient first second
  all_input := all_input first second

theorem first_selected (first : ProbeSpec α) (second : ProbeSpec β) (source : Term) (ticks : Nat) (state : α) (endpoint : Cursor)
    (actual : run first.machine ticks ⟨some first.start, Cursor.atRoot source⟩ = ⟨some state, endpoint⟩)
    (answered : first.answer state = some true) :
    ∃ used, used ≤ ticks + 1 ∧ run (worker first second).machine used ((worker first second).initial (Cursor.atRoot source)) =
      ⟨some (.done true), endpoint⟩ :=
  RootResetProbeSequence.first_selected (firstWorker first) (RootResetReplayProbe.worker second) (first_terminal first)
    (Cursor.atRoot source) endpoint ticks state actual answered

theorem second_selected (first : ProbeSpec α) (second : ProbeSpec β) (source : Term)
    (firstTicks secondTicks : Nat) (firstState : α) (secondState : β) (middle endpoint : Cursor)
    (firstRun : run first.machine firstTicks ⟨some first.start, Cursor.atRoot source⟩ = ⟨some firstState, middle⟩)
    (firstAnswer : first.answer firstState = some false)
    (secondRun : run second.machine secondTicks ⟨some second.start, Cursor.atRoot source⟩ = ⟨some secondState, endpoint⟩)
    (secondAnswer : second.answer secondState = some true) :
    ∃ used, run (worker first second).machine used ((worker first second).initial (Cursor.atRoot source)) =
      ⟨some (.done true), endpoint⟩ := by
  have preserved := (firstWorker first).erase_run first.mutation_zero firstTicks ((firstWorker first).initial (Cursor.atRoot source))
  change (run first.machine firstTicks ⟨some first.start, Cursor.atRoot source⟩).cursor.erase = source at preserved
  rw [firstRun] at preserved
  change middle.erase = source at preserved
  have replayRun := RootResetReplayProbe.generated second middle secondTicks secondState endpoint (by rw [preserved]; exact secondRun)
  obtain ⟨used, _, execution⟩ := RootResetProbeSequence.first_runs (firstWorker first) (RootResetReplayProbe.worker second)
    (first_terminal first) (Cursor.atRoot source) middle firstTicks firstState false firstRun firstAnswer
  obtain ⟨replayUsed, _, replayActual⟩ := RootResetProbeSequence.second_runs (firstWorker first) (RootResetReplayProbe.worker second)
    (RootResetReplayProbe.terminal second) middle endpoint (middle.parents.length + 1 + secondTicks) (.work secondState) true replayRun secondAnswer
  refine ⟨used + 1 + (replayUsed + 1), ?_⟩
  change run (RootResetProbeSequence.machine _ _) _ (RootResetProbeSequence.initial _ _ _) = _
  rw [run_add, execution]
  exact replayActual

end PureSFormal.Research.RootResetPriorityReplay
