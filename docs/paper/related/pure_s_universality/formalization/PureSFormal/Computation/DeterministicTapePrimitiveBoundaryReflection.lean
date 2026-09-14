import PureSFormal.Computation.DeterministicTapeTrajectoryDecoder

/-!
# Operational boundary reflection for the primitive tape compiler

The loop-prefix proofs rule out literal tape-boundary decoding inside the
compiler's stack-manipulation phases. Their clocks are the clocks of the
existing executable compiler.
-/

namespace PureSFormal.Computation.DeterministicTapePrimitiveBoundaryReflection

open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeCounterCompiler DeterministicTapeThreeCounterCompiler
open Layout Compiler Execution

theorem run_succ_front (program : ThreeCounter.Program) (fuel : Nat)
    (initial : ThreeCounter.State) :
    ThreeCounter.run program (fuel + 1) initial =
      ThreeCounter.run program fuel (ThreeCounter.step program initial) := by
  induction fuel with
  | zero => rfl
  | succ fuel ih => exact congrArg (ThreeCounter.step program) ih

def PrefixRejected (program : ThreeCounter.Program) (duration : Nat)
    (initial : ThreeCounter.State) : Prop :=
  ∀ fuel, fuel < duration →
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? (ThreeCounter.run program fuel initial) = none

theorem prefixRejected_zero (program : ThreeCounter.Program) (initial : ThreeCounter.State) :
    PrefixRejected program 0 initial :=
  fun fuel less => False.elim (Nat.not_lt_zero fuel less)

theorem prefixRejected_prepend (program : ThreeCounter.Program) (duration : Nat)
    (initial next : ThreeCounter.State)
    (rejected : DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? initial = none)
    (stepped : ThreeCounter.step program initial = next)
    (later : PrefixRejected program duration next) :
    PrefixRejected program (duration + 1) initial := by
  intro fuel less
  cases fuel with
  | zero => exact rejected
  | succ fuel =>
      rw [run_succ_front, stepped]
      exact later fuel (Nat.lt_of_succ_lt_succ less)

theorem prefixRejected_append (program : ThreeCounter.Program) (first second : Nat)
    (initial middle : ThreeCounter.State)
    (firstRun : ThreeCounter.run program first initial = middle)
    (firstSafe : PrefixRejected program first initial)
    (secondSafe : PrefixRejected program second middle) :
    PrefixRejected program (first + second) initial := by
  intro fuel less
  by_cases before : fuel < first
  · exact firstSafe fuel before
  · have firstLe := Nat.le_of_not_gt before
    have remainderLt : fuel - first < second := Nat.sub_lt_left_of_lt_add firstLe less
    have splitFuel : fuel = first + (fuel - first) := (Nat.add_sub_of_le firstLe).symm
    rw [splitFuel, run_add, firstRun]
    exact secondSafe _ remainderLt

theorem decodeTapeBoundary?_mod_ne (candidate : ThreeCounter.State)
    (nonzero : candidate.control % phaseCount ≠ 0) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate = none := by
  unfold DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
  split
  · split
    · exact if_neg nonzero
    · rfl
  · rfl

theorem phase_rejected (state : Nat) (phase : Phase) (left right scratch : Nat)
    (nonzero : encodePhase phase ≠ 0) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (runningState (address state phase) left right scratch) = none := by
  apply decodeTapeBoundary?_mod_ne
  change address state phase % phaseCount ≠ 0
  rw [address_mod]
  exact nonzero

theorem right_phase_rejected (state : Nat) (phase : RightPhase)
    (notStart : phase ≠ .start) (left right scratch : Nat) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (runningState (address state (.right phase)) left right scratch) = none := by
  apply phase_rejected
  cases phase with
  | start => exact False.elim (notStart rfl)
  | checkSentinel => decide
  | incrementScratch => decide
  | pairFirst => decide
  | pairSecond => decide
  | restoreFirst bit => cases bit <;> decide
  | restoreFirstIncrement bit => cases bit <;> decide
  | restoreCheck bit => cases bit <;> decide
  | restoreRestIncrement bit => cases bit <;> decide
  | restoreLoop bit => cases bit <;> decide
  | restoreLoopIncrement bit => cases bit <;> decide

theorem right_transfer_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (bounded : state < machine.states.length) (remaining : Nat) (bit : Bool)
    (left target : Nat) :
    PrefixRejected (compileMachine machine) (transferClock remaining)
      (runningState (address state (.right (.restoreLoop bit))) left target remaining) := by
  induction remaining generalizing target with
  | zero =>
      change PrefixRejected _ (0 + 1) _
      exact prefixRejected_prepend _ 0 _ _
        (right_phase_rejected state _ (by intro equal; cases equal) left target 0)
        rfl (prefixRejected_zero _ _)
  | succ remaining ih =>
      have firstStep : ThreeCounter.step (compileMachine machine)
          (runningState (address state (.right (.restoreLoop bit))) left target (remaining + 1)) =
          runningState (address state (.right (.restoreLoopIncrement bit))) left target remaining := by
        rw [step_at bounded]
        rfl
      have secondStep : ThreeCounter.step (compileMachine machine)
          (runningState (address state (.right (.restoreLoopIncrement bit))) left target remaining) =
          runningState (address state (.right (.restoreLoop bit))) left (target + 1) remaining := by
        rw [step_at bounded]
        rfl
      rw [transferClock, Nat.add_comm 2]
      exact prefixRejected_prepend _ _ _ _
        (right_phase_rejected state _ (by intro equal; cases equal) _ _ _) firstStep
        (prefixRejected_prepend _ _ _ _
          (right_phase_rejected state _ (by intro equal; cases equal) _ _ _) secondStep (ih (target + 1)))

theorem right_pairs_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (bounded : state < machine.states.length) (pairs : Nat) (bit : Bool)
    (left scratch : Nat) :
    PrefixRejected (compileMachine machine) (pairClock pairs bit)
      (runningState (address state (.right .pairFirst)) left (StackCode.push bit pairs) scratch) := by
  induction pairs generalizing scratch with
  | zero =>
      cases bit with
      | false =>
          change PrefixRejected _ (0 + 1) _
          exact prefixRejected_prepend _ 0 _ _
            (right_phase_rejected state _ (by intro equal; cases equal) _ _ _)
            rfl (prefixRejected_zero _ _)
      | true =>
          have firstStep : ThreeCounter.step (compileMachine machine)
              (runningState (address state (.right .pairFirst)) left (StackCode.push true 0) scratch) =
              runningState (address state (.right .pairSecond)) left 0 scratch := by
            rw [step_at bounded]
            rfl
          exact prefixRejected_prepend _ _ _ _
            (right_phase_rejected state _ (by intro equal; cases equal) _ _ _) firstStep
            (prefixRejected_prepend _ 0 _ _
              (right_phase_rejected state _ (by intro equal; cases equal) _ _ _)
              rfl (prefixRejected_zero _ _))
  | succ pairs ih =>
      have firstStep : ThreeCounter.step (compileMachine machine)
          (runningState (address state (.right .pairFirst)) left (StackCode.push bit (pairs + 1)) scratch) =
          runningState (address state (.right .pairSecond)) left (StackCode.push bit pairs + 1) scratch := by
        cases bit <;> rw [step_at bounded] <;> rfl
      have secondStep : ThreeCounter.step (compileMachine machine)
          (runningState (address state (.right .pairSecond)) left (StackCode.push bit pairs + 1) scratch) =
          runningState (address state (.right .incrementScratch)) left (StackCode.push bit pairs) scratch := by
        cases bit <;> rw [step_at bounded] <;> rfl
      have thirdStep : ThreeCounter.step (compileMachine machine)
          (runningState (address state (.right .incrementScratch)) left (StackCode.push bit pairs) scratch) =
          runningState (address state (.right .pairFirst)) left (StackCode.push bit pairs) (scratch + 1) := by
        rw [step_at bounded]
        rfl
      rw [pairClock, Nat.add_comm 3]
      exact prefixRejected_prepend _ _ _ _
        (right_phase_rejected state _ (by intro equal; cases equal) _ _ _) firstStep
        (prefixRejected_prepend _ _ _ _
          (right_phase_rejected state _ (by intro equal; cases equal) _ _ _) secondStep
          (prefixRejected_prepend _ _ _ _
            (right_phase_rejected state _ (by intro equal; cases equal) _ _ _) thirdStep (ih (scratch + 1))))

theorem right_restore_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (bounded : state < machine.states.length) (quotientBase : Nat) (bit : Bool)
    (left : Nat) :
    PrefixRejected (compileMachine machine) (rightRestoreClock (quotientBase + 1))
      (runningState (address state (.right (.restoreFirst bit))) left 0 (quotientBase + 1)) := by
  cases quotientBase with
  | zero =>
      apply prefixRejected_prepend _ 2 _
        (runningState (address state (.right (.restoreFirstIncrement bit))) left 0 0)
      · exact right_phase_rejected state _ (by intro equal; cases equal) _ _ _
      · rw [step_at bounded]; rfl
      · apply prefixRejected_prepend _ 1 _
          (runningState (address state (.right (.restoreCheck bit))) left 1 0)
        · exact right_phase_rejected state _ (by intro equal; cases equal) _ _ _
        · rw [step_at bounded]; rfl
        · exact prefixRejected_prepend _ 0 _ _
            (right_phase_rejected state _ (by intro equal; cases equal) _ _ _)
            rfl (prefixRejected_zero _ _)
  | succ remaining =>
      rw [rightRestoreClock, Nat.add_comm 4]
      apply prefixRejected_prepend _ _ _
        (runningState (address state (.right (.restoreFirstIncrement bit))) left 0 (remaining + 1))
      · exact right_phase_rejected state _ (by intro equal; cases equal) _ _ _
      · rw [step_at bounded]; rfl
      · apply prefixRejected_prepend _ _ _
          (runningState (address state (.right (.restoreCheck bit))) left 1 (remaining + 1))
        · exact right_phase_rejected state _ (by intro equal; cases equal) _ _ _
        · rw [step_at bounded]; rfl
        · apply prefixRejected_prepend _ _ _
            (runningState (address state (.right (.restoreRestIncrement bit))) left 1 remaining)
          · exact right_phase_rejected state _ (by intro equal; cases equal) _ _ _
          · rw [step_at bounded]; rfl
          · apply prefixRejected_prepend _ _ _
              (runningState (address state (.right (.restoreLoop bit))) left 2 remaining)
            · exact right_phase_rejected state _ (by intro equal; cases equal) _ _ _
            · rw [step_at bounded]; rfl
            · exact right_transfer_prefix_rejected bounded remaining bit left 2

theorem right_pop_positive_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (bounded : state < machine.states.length) (quotientBase : Nat) (bit : Bool)
    (left fuel : Nat) (positive : 0 < fuel) (inside : fuel < rightPopClock quotientBase bit) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run (compileMachine machine) fuel
        (runningState (boundaryAddress state) left (StackCode.push bit (quotientBase + 1)) 0)) = none := by
  have pairsAndRestore : PrefixRejected (compileMachine machine)
      (pairClock quotientBase bit + rightRestoreClock (quotientBase + 1))
      (runningState (address state (.right .pairFirst)) left (StackCode.push bit quotientBase) 1) := by
    apply prefixRejected_append _ _ _ _
      (runningState (address state (.right (.restoreFirst bit))) left 0 (quotientBase + 1))
    · rw [run_right_pairs bounded, Nat.add_comm 1]
    · exact right_pairs_prefix_rejected bounded quotientBase bit left 1
    · exact right_restore_prefix_rejected bounded quotientBase bit left
  have afterStart : PrefixRejected (compileMachine machine)
      ((pairClock quotientBase bit + rightRestoreClock (quotientBase + 1)) + 2)
      (runningState (address state (.right .checkSentinel)) left (StackCode.push bit quotientBase + 1) 0) := by
    apply prefixRejected_prepend _ _ _
      (runningState (address state (.right .incrementScratch)) left (StackCode.push bit quotientBase) 0)
    · exact right_phase_rejected state _ (by intro equal; cases equal) _ _ _
    · cases bit <;> rw [step_at bounded] <;> rfl
    · apply prefixRejected_prepend _ _ _
        (runningState (address state (.right .pairFirst)) left (StackCode.push bit quotientBase) 1)
      · exact right_phase_rejected state _ (by intro equal; cases equal) _ _ _
      · rw [step_at bounded]; rfl
      · exact pairsAndRestore
  cases fuel with
  | zero => exact False.elim (Nat.lt_irrefl 0 positive)
  | succ fuel =>
      have firstStep : ThreeCounter.step (compileMachine machine)
          (runningState (boundaryAddress state) left (StackCode.push bit (quotientBase + 1)) 0) =
          runningState (address state (.right .checkSentinel)) left (StackCode.push bit quotientBase + 1) 0 := by
        change ThreeCounter.step _ (runningState (address state (.right .start)) _ _ _) = _
        cases bit <;> rw [step_at bounded] <;> rfl
      rw [run_succ_front, firstStep]
      apply afterStart
      rw [rightPopClock, Nat.add_comm 3] at inside
      exact Nat.lt_of_succ_lt_succ inside

theorem push_phase_rejected (state : Nat) (context : PushContext) (phase : PushPhase)
    (target other scratch : Nat) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (pushState context (address state (.push context phase)) target other scratch) = none := by
  cases context <;> apply phase_rejected <;> simp [encodePhase]

theorem push_drain_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (bounded : state < machine.states.length) (context : PushContext)
    (target other scratch : Nat) :
    PrefixRejected (compileMachine machine) (drainClock target)
      (pushState context (address state (.push context .drain)) target other scratch) := by
  induction target generalizing scratch with
  | zero =>
      exact prefixRejected_prepend _ 0 _ _
        (push_phase_rejected state context .drain _ _ _) rfl (prefixRejected_zero _ _)
  | succ target ih =>
      rw [drainClock, Nat.add_comm 2]
      apply prefixRejected_prepend _ _ _
        (pushState context (address state (.push context .drainIncrement)) target other scratch)
      · exact push_phase_rejected state context .drain _ _ _
      · rw [step_push_at bounded]; cases context <;> rfl
      · apply prefixRejected_prepend _ _ _
          (pushState context (address state (.push context .drain)) target other (scratch + 1))
        · exact push_phase_rejected state context .drainIncrement _ _ _
        · rw [step_push_at bounded]; cases context <;> rfl
        · exact ih (scratch + 1)

theorem push_restore_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (bounded : state < machine.states.length) (context : PushContext)
    (target other scratch : Nat) :
    PrefixRejected (compileMachine machine) (restoreClock scratch (pushBit machine state context))
      (pushState context (address state (.push context .restore)) target other scratch) := by
  induction scratch generalizing target with
  | zero =>
      cases bitEq : pushBit machine state context with
      | false =>
          exact prefixRejected_prepend _ 0 _ _
            (push_phase_rejected state context .restore _ _ _) rfl (prefixRejected_zero _ _)
      | true =>
          apply prefixRejected_prepend _ 1 _
            (pushState context (address state (.push context .addBit)) target other 0)
          · exact push_phase_rejected state context .restore _ _ _
          · rw [step_push_at bounded]
            cases context <;> simp [instructionFor, bitEq, pushState, runningState,
              ThreeCounter.execute, ThreeCounter.read]
          · exact prefixRejected_prepend _ 0 _ _
              (push_phase_rejected state context .addBit _ _ _) rfl (prefixRejected_zero _ _)
  | succ scratch ih =>
      rw [restoreClock, Nat.add_comm 3]
      apply prefixRejected_prepend _ _ _
        (pushState context (address state (.push context .restoreIncrementFirst)) target other scratch)
      · exact push_phase_rejected state context .restore _ _ _
      · rw [step_push_at bounded]; cases context <;> rfl
      · apply prefixRejected_prepend _ _ _
          (pushState context (address state (.push context .restoreIncrementSecond)) (target + 1) other scratch)
        · exact push_phase_rejected state context .restoreIncrementFirst _ _ _
        · rw [step_push_at bounded]; cases context <;> rfl
        · apply prefixRejected_prepend _ _ _
            (pushState context (address state (.push context .restore)) (target + 2) other scratch)
          · exact push_phase_rejected state context .restoreIncrementSecond _ _ _
          · rw [step_push_at bounded]; cases context <;> rfl
          · exact ih (target + 2)

theorem push_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (bounded : state < machine.states.length) (context : PushContext)
    (target other : Nat) :
    PrefixRejected (compileMachine machine) (pushClock target (pushBit machine state context))
      (pushState context (address state (.push context .drain)) target other 0) := by
  apply prefixRejected_append _ _ _ _
    (pushState context (address state (.push context .restore)) 0 other target)
  · rw [run_push_drain bounded, Nat.zero_add]
  · exact push_drain_prefix_rejected bounded context target other 0
  · exact push_restore_prefix_rejected bounded context 0 other target

theorem left_phase_rejected (state : Nat) (symbol : Bool) (phase : LeftPhase)
    (left right scratch : Nat) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (runningState (address state (.left symbol phase)) left right scratch) = none := by
  apply phase_rejected
  simp [encodePhase]

theorem left_pairs_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (bounded : state < machine.states.length) (pairs : Nat) (symbol neighbor : Bool)
    (right scratch : Nat) :
    PrefixRejected (compileMachine machine) (pairClock pairs neighbor)
      (runningState (address state (.left symbol .pairFirst)) (StackCode.push neighbor pairs) right scratch) := by
  induction pairs generalizing scratch with
  | zero =>
      cases neighbor with
      | false =>
          exact prefixRejected_prepend _ 0 _ _
            (left_phase_rejected state symbol .pairFirst _ _ _) rfl (prefixRejected_zero _ _)
      | true =>
          apply prefixRejected_prepend _ 1 _
            (runningState (address state (.left symbol .pairSecond)) 0 right scratch)
          · exact left_phase_rejected state symbol .pairFirst _ _ _
          · rw [step_at bounded]; rfl
          · exact prefixRejected_prepend _ 0 _ _
              (left_phase_rejected state symbol .pairSecond _ _ _) rfl (prefixRejected_zero _ _)
  | succ pairs ih =>
      rw [pairClock, Nat.add_comm 3]
      apply prefixRejected_prepend _ _ _
        (runningState (address state (.left symbol .pairSecond)) (StackCode.push neighbor pairs + 1) right scratch)
      · exact left_phase_rejected state symbol .pairFirst _ _ _
      · cases neighbor <;> rw [step_at bounded] <;> rfl
      · apply prefixRejected_prepend _ _ _
          (runningState (address state (.left symbol .incrementScratch)) (StackCode.push neighbor pairs) right scratch)
        · exact left_phase_rejected state symbol .pairSecond _ _ _
        · cases neighbor <;> rw [step_at bounded] <;> rfl
        · apply prefixRejected_prepend _ _ _
            (runningState (address state (.left symbol .pairFirst)) (StackCode.push neighbor pairs) right (scratch + 1))
          · exact left_phase_rejected state symbol .incrementScratch _ _ _
          · rw [step_at bounded]; rfl
          · exact ih (scratch + 1)

theorem left_transfer_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (bounded : state < machine.states.length) (remaining : Nat) (symbol neighbor : Bool)
    (target right : Nat) :
    PrefixRejected (compileMachine machine) (transferClock remaining)
      (runningState (address state (.left symbol (.restore neighbor))) target right remaining) := by
  induction remaining generalizing target with
  | zero =>
      exact prefixRejected_prepend _ 0 _ _
        (left_phase_rejected state symbol (.restore neighbor) _ _ _) rfl (prefixRejected_zero _ _)
  | succ remaining ih =>
      rw [transferClock, Nat.add_comm 2]
      apply prefixRejected_prepend _ _ _
        (runningState (address state (.left symbol (.restoreIncrement neighbor))) target right remaining)
      · exact left_phase_rejected state symbol (.restore neighbor) _ _ _
      · rw [step_at bounded]; rfl
      · apply prefixRejected_prepend _ _ _
          (runningState (address state (.left symbol (.restore neighbor))) (target + 1) right remaining)
        · exact left_phase_rejected state symbol (.restoreIncrement neighbor) _ _ _
        · rw [step_at bounded]; rfl
        · exact ih (target + 1)

theorem left_pop_nonempty_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (bounded : state < machine.states.length) (quotientBase : Nat) (symbol neighbor : Bool)
    (right : Nat) :
    PrefixRejected (compileMachine machine) (leftPopClock quotientBase neighbor)
      (runningState (address state (.left symbol .start)) (StackCode.push neighbor (quotientBase + 1)) right 0) := by
  rw [leftPopClock, Nat.add_comm 3]
  apply prefixRejected_prepend _ _ _
    (runningState (address state (.left symbol .checkSentinel)) (StackCode.push neighbor quotientBase + 1) right 0)
  · exact left_phase_rejected state symbol .start _ _ _
  · cases neighbor <;> rw [step_at bounded] <;> rfl
  · apply prefixRejected_prepend _ _ _
      (runningState (address state (.left symbol .incrementScratch)) (StackCode.push neighbor quotientBase) right 0)
    · exact left_phase_rejected state symbol .checkSentinel _ _ _
    · cases neighbor <;> rw [step_at bounded] <;> rfl
    · apply prefixRejected_prepend _ _ _
        (runningState (address state (.left symbol .pairFirst)) (StackCode.push neighbor quotientBase) right 1)
      · exact left_phase_rejected state symbol .incrementScratch _ _ _
      · rw [step_at bounded]; rfl
      · apply prefixRejected_append _ _ _ _
          (runningState (address state (.left symbol (.restore neighbor))) 0 right (quotientBase + 1))
        · rw [run_left_pairs bounded, Nat.add_comm 1]
        · exact left_pairs_prefix_rejected bounded quotientBase symbol neighbor right 1
        · exact left_transfer_prefix_rejected bounded (quotientBase + 1) symbol neighbor 0 right

theorem left_pop_empty_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (bounded : state < machine.states.length) (symbol : Bool) (right : Nat) :
    PrefixRejected (compileMachine machine) 3
      (runningState (address state (.left symbol .start)) 1 right 0) := by
  apply prefixRejected_prepend _ 2 _
    (runningState (address state (.left symbol .checkSentinel)) 0 right 0)
  · exact left_phase_rejected state symbol .start _ _ _
  · rw [step_at bounded]; rfl
  · apply prefixRejected_prepend _ 1 _
      (runningState (address state (.left symbol .restoreEmpty)) 0 right 0)
    · exact left_phase_rejected state symbol .checkSentinel _ _ _
    · rw [step_at bounded]; rfl
    · exact prefixRejected_prepend _ 0 _ _
        (left_phase_rejected state symbol .restoreEmpty _ _ _) rfl (prefixRejected_zero _ _)

theorem left_stage_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (bounded : state < machine.states.length) (left : List Bool) (symbol : Bool) (right : Nat) :
    PrefixRejected (compileMachine machine) (leftStageClock left)
      (runningState (address state (.left symbol .start)) (StackCode.encode left) right 0) := by
  cases left with
  | nil => exact left_pop_empty_prefix_rejected bounded symbol right
  | cons neighbor leftTail =>
      rw [leftStageClock, StackCode.encode_cons, encode_eq_stackBase_add_one]
      exact left_pop_nonempty_prefix_rejected bounded (stackBase leftTail) symbol neighbor right

theorem dispatch_rejected (state : Nat) (symbol tailEmpty : Bool) (left right scratch : Nat) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (runningState (address state (.dispatch symbol tailEmpty)) left right scratch) = none := by
  apply phase_rejected
  simp [encodePhase]

theorem after_pop_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (left tail : List Bool) (symbol : Bool) (rule : DeterministicTape.Rule)
    (selected : ruleFor machine state symbol = some rule) :
    PrefixRejected (compileMachine machine)
      (1 + match rule.move with
        | .stay => pushClock (StackCode.encode tail) rule.write
        | .left => leftStageClock left +
            (pushClock (StackCode.encode tail) rule.write +
              pushClock (StackCode.push rule.write (StackCode.encode tail)) (leftNeighbor left))
        | .right => pushClock (StackCode.encode left) rule.write + rightBlankClock tail)
      (runningState (address state (.dispatch symbol (stackEmpty tail)))
        (StackCode.encode left) (StackCode.encode tail) 0) := by
  have bounded := state_lt_of_ruleFor_eq_some selected
  cases moveEq : rule.move with
  | stay =>
      rw [Nat.add_comm 1]
      apply prefixRejected_prepend _ _ _ _ (dispatch_rejected state symbol (stackEmpty tail) _ _ _)
        (run_dispatch_stay bounded symbol (stackEmpty tail) rule selected moveEq _ _)
      simpa only [pushState, pushBit_stay selected] using
        push_prefix_rejected bounded (.stay symbol) (StackCode.encode tail) (StackCode.encode left)
  | left =>
      rw [Nat.add_comm 1]
      apply prefixRejected_prepend _ _ _ _ (dispatch_rejected state symbol (stackEmpty tail) _ _ _)
        (run_dispatch_left bounded symbol (stackEmpty tail) rule selected moveEq _ _)
      apply prefixRejected_append _ _ _ _ _ (run_left_stage bounded left symbol (StackCode.encode tail))
        (left_stage_prefix_rejected bounded left symbol (StackCode.encode tail))
      apply prefixRejected_append _ _ _ _ _
        (run_push_leftWrite bounded symbol (leftNeighbor left) rule selected _ _)
      · simpa only [pushState, pushBit_leftWrite selected] using
          push_prefix_rejected bounded (.leftWrite symbol (leftNeighbor left))
            (StackCode.encode tail) (StackCode.encode (leftRemainder left))
      · exact push_prefix_rejected bounded (.leftNeighbor symbol (leftNeighbor left))
          (StackCode.push rule.write (StackCode.encode tail)) (StackCode.encode (leftRemainder left))
  | right =>
      rw [Nat.add_comm 1]
      apply prefixRejected_prepend _ _ _ _ (dispatch_rejected state symbol (stackEmpty tail) _ _ _)
        (run_dispatch_right bounded symbol (stackEmpty tail) rule selected moveEq _ _)
      apply prefixRejected_append _ _ _ _ _
        (run_push_right bounded symbol (stackEmpty tail) rule selected _ _)
      · simpa only [pushState, pushBit_right selected] using
          push_prefix_rejected bounded (.right symbol (stackEmpty tail))
            (StackCode.encode left) (StackCode.encode tail)
      · cases tail with
        | nil =>
            apply prefixRejected_prepend _ 0 _ _ _ rfl (prefixRejected_zero _ _)
            apply phase_rejected
            simp [encodePhase]
        | cons bit tail => exact prefixRejected_zero _ _

theorem live_macro_positive_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (left tail : List Bool) (symbol : Bool) (rule : DeterministicTape.Rule)
    (selected : ruleFor machine state symbol = some rule) (fuel : Nat)
    (positive : 0 < fuel) (inside : fuel < liveMacroClock left tail symbol rule) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run (compileMachine machine) fuel
        (boundaryState (configurationOf state left (symbol :: tail)))) = none := by
  have bounded := state_lt_of_ruleFor_eq_some selected
  by_cases before : fuel < rightPopClock (stackBase tail) symbol
  · change DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run _ fuel (runningState (boundaryAddress state)
        (StackCode.encode left) (StackCode.encode (symbol :: tail)) 0)) = none
    rw [StackCode.encode_cons, encode_eq_stackBase_add_one tail]
    exact right_pop_positive_prefix_rejected bounded (stackBase tail) symbol _ fuel positive before
  · have popLe := Nat.le_of_not_gt before
    have remainderLt := Nat.sub_lt_left_of_lt_add popLe inside
    have splitFuel : fuel = rightPopClock (stackBase tail) symbol +
        (fuel - rightPopClock (stackBase tail) symbol) := (Nat.add_sub_of_le popLe).symm
    change DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run _ fuel (runningState (boundaryAddress state)
        (StackCode.encode left) (StackCode.encode (symbol :: tail)) 0)) = none
    rw [splitFuel, run_add, run_right_pop_list bounded]
    exact after_pop_prefix_rejected left tail symbol rule selected _ remainderLt

theorem halted_rejected (candidate : ThreeCounter.State) (halted : candidate.status = .halted) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate = none := by
  unfold DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
  rw [halted]
  rfl

theorem halt_macro_positive_prefix_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (left tail : List Bool) (symbol : Bool) (fuel : Nat)
    (positive : 0 < fuel) (inside : fuel < haltMacroClock machine state tail symbol) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run (compileMachine machine) fuel
        (boundaryState (configurationOf state left (symbol :: tail)))) = none := by
  by_cases bounded : state < machine.states.length
  · rw [haltMacroClock, if_pos bounded] at inside
    by_cases before : fuel < rightPopClock (stackBase tail) symbol
    · change DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
        (ThreeCounter.run _ fuel (runningState (boundaryAddress state)
          (StackCode.encode left) (StackCode.encode (symbol :: tail)) 0)) = none
      rw [StackCode.encode_cons, encode_eq_stackBase_add_one tail]
      exact right_pop_positive_prefix_rejected bounded (stackBase tail) symbol _ fuel positive before
    · have atPop : fuel = rightPopClock (stackBase tail) symbol :=
        Nat.le_antisymm (Nat.le_of_lt_succ inside) (Nat.le_of_not_gt before)
      change DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
        (ThreeCounter.run _ fuel (runningState (boundaryAddress state)
          (StackCode.encode left) (StackCode.encode (symbol :: tail)) 0)) = none
      rw [atPop, run_right_pop_list bounded]
      exact dispatch_rejected state symbol (stackEmpty tail) _ _ _
  · rw [haltMacroClock, if_neg bounded] at inside
    exact False.elim (Nat.not_lt_of_ge positive inside)

theorem halt_macro_positive_rejected {machine : DeterministicTape.Machine} {state : Nat}
    (left tail : List Bool) (symbol : Bool)
    (selected : ruleFor machine state symbol = none) (fuel : Nat) (positive : 0 < fuel) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run (compileMachine machine) fuel
        (boundaryState (configurationOf state left (symbol :: tail)))) = none := by
  by_cases inside : fuel < haltMacroClock machine state tail symbol
  · exact halt_macro_positive_prefix_rejected left tail symbol fuel positive inside
  · have clockLe := Nat.le_of_not_gt inside
    have splitFuel : fuel = haltMacroClock machine state tail symbol +
        (fuel - haltMacroClock machine state tail symbol) := (Nat.add_sub_of_le clockLe).symm
    rw [splitFuel, run_add, run_halted _ _ _ (run_halt_macro left tail symbol selected)]
    exact halted_rejected _ (run_halt_macro left tail symbol selected)

/-- Every accepted boundary on an actual primitive execution is a literal
row of the corresponding source execution. The proof excludes all interior
microphases and handles the absorbing halt status explicitly. -/
theorem decodeTapeBoundary?_run_reflects (machine : DeterministicTape.Machine)
    (primitiveFuel : Nat) :
    ∀ {initialRow row : DeterministicTape.Row} {configuration : StackCounter.Configuration},
      Represents initialRow configuration →
      DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
        (ThreeCounter.run (compileMachine machine) primitiveFuel (boundaryState configuration)) = some row →
      ∃ sourceFuel, DeterministicTape.runFor? machine initialRow sourceFuel = some row := by
  induction primitiveFuel using Nat.strongRecOn with
  | ind primitiveFuel ih =>
      intro initialRow row configuration represented accepted
      rcases represented with ⟨state, left, right, rightNonempty, rfl, rfl⟩
      cases primitiveFuel with
      | zero =>
          rw [ThreeCounter.run_zero,
            DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_boundaryState_configurationOf
              state left right rightNonempty] at accepted
          exact ⟨0, accepted⟩
      | succ fuel =>
          cases right with
          | nil => exact False.elim (rightNonempty rfl)
          | cons symbol tail =>
              cases selected : ruleFor machine state symbol with
              | none =>
                  rw [halt_macro_positive_rejected left tail symbol selected (fuel + 1)
                    (Nat.zero_lt_succ fuel)] at accepted
                  cases accepted
              | some rule =>
                  let macroFuel := liveMacroClock left tail symbol rule
                  by_cases inside : fuel + 1 < macroFuel
                  · rw [live_macro_positive_prefix_rejected left tail symbol rule selected
                      (fuel + 1) (Nat.zero_lt_succ fuel) inside] at accepted
                    cases accepted
                  · have macroLe := Nat.le_of_not_gt inside
                    have macroPos : 0 < macroFuel := liveMacroClock_pos left tail symbol rule
                    let remaining := fuel + 1 - macroFuel
                    have remainingLt : remaining < fuel + 1 := Nat.sub_lt (Nat.zero_lt_succ fuel) macroPos
                    have splitFuel : fuel + 1 = macroFuel + remaining := (Nat.add_sub_of_le macroLe).symm
                    have nextAccepted : DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
                        (ThreeCounter.run (compileMachine machine) remaining
                          (boundaryState (configurationOf rule.nextState
                            (afterRule left tail rule).1 (afterRule left tail rule).2))) = some row := by
                      rw [splitFuel, run_add, run_live_macro left tail symbol rule selected] at accepted
                      exact accepted
                    have nextRepresents : Represents
                        (rowOf rule.nextState (afterRule left tail rule).1 (afterRule left tail rule).2)
                        (configurationOf rule.nextState (afterRule left tail rule).1 (afterRule left tail rule).2) :=
                      ⟨rule.nextState, (afterRule left tail rule).1, (afterRule left tail rule).2,
                        afterRule_right_ne_nil left tail rule, rfl, rfl⟩
                    obtain ⟨sourceFuel, sourceRun⟩ := ih remaining remainingLt nextRepresents nextAccepted
                    refine ⟨sourceFuel + 1, ?_⟩
                    rw [DeterministicTape.runFor?, source_step?_rowOf machine state left tail symbol rule selected]
                    exact sourceRun

/-- Initial-state specialization with no supplied primitive trajectory or
source-time witness. -/
theorem decodeTapeBoundary?_actual_reflects (source : DeterministicTape.Instance)
    (primitiveFuel : Nat) {row : DeterministicTape.Row}
    (accepted : DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run (compileMachine source.machine) primitiveFuel (Execution.compileInitial source)) = some row) :
    ∃ sourceFuel, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row :=
  decodeTapeBoundary?_run_reflects source.machine primitiveFuel (initial_represents source) accepted

/-- The executable decoder observes exactly the source's finite trajectory. -/
theorem exists_decoded_boundary_iff (source : DeterministicTape.Instance) (row : DeterministicTape.Row) :
    (∃ primitiveFuel, DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run (compileMachine source.machine) primitiveFuel (Execution.compileInitial source)) = some row) ↔
    ∃ sourceFuel, DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) sourceFuel = some row := by
  constructor
  · rintro ⟨primitiveFuel, accepted⟩
    exact decodeTapeBoundary?_actual_reflects source primitiveFuel accepted
  · rintro ⟨sourceFuel, sourceRun⟩
    exact DeterministicTapeTrajectoryDecoder.exists_decodedPrimitiveBoundary_of_runFor?_eq_some
      source sourceFuel sourceRun

end PureSFormal.Computation.DeterministicTapePrimitiveBoundaryReflection
