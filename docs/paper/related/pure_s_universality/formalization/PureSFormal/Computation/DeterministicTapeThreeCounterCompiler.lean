import PureSFormal.Computation.DeterministicTapeCounterCompiler
import PureSFormal.Computation.ThreeCounter

/-!
# Deterministic tape to primitive three-counter compiler

This module refines the arithmetic two-stack machine to a literal finite
three-counter program.  The third counter is scratch space.  Every compiled
instruction is either one increment or one decrement-with-zero-branch; the
finite control implements binary-stack push and pop by explicit loops.
-/

namespace PureSFormal.Computation.DeterministicTapeThreeCounterCompiler

open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open PureSFormal.Computation.DeterministicTapeCounterCompiler

namespace Layout

/-- Microphases of the right-stack pop at every source boundary. -/
inductive RightPhase where
  | start
  | checkSentinel
  | incrementScratch
  | pairFirst
  | pairSecond
  | restoreFirst (bit : Bool)
  | restoreFirstIncrement (bit : Bool)
  | restoreCheck (bit : Bool)
  | restoreRestIncrement (bit : Bool)
  | restoreLoop (bit : Bool)
  | restoreLoopIncrement (bit : Bool)
  deriving DecidableEq, Repr

/-- Microphases of the optional left-stack pop. -/
inductive LeftPhase where
  | start
  | checkSentinel
  | incrementScratch
  | pairFirst
  | pairSecond
  | restore (neighbor : Bool)
  | restoreIncrement (neighbor : Bool)
  | restoreEmpty
  deriving DecidableEq, Repr

/-- The four finite-control continuations that use the common push loop. -/
inductive PushContext where
  | stay (symbol : Bool)
  | right (symbol tailEmpty : Bool)
  | leftWrite (symbol neighbor : Bool)
  | leftNeighbor (symbol neighbor : Bool)
  deriving DecidableEq, Repr

/-- Microphases of one primitive doubling-and-optional-increment push. -/
inductive PushPhase where
  | drain
  | drainIncrement
  | restore
  | restoreIncrementFirst
  | restoreIncrementSecond
  | addBit
  deriving DecidableEq, Repr

/-- Complete fixed microphase alphabet. -/
inductive Phase where
  | right (phase : RightPhase)
  | dispatch (symbol tailEmpty : Bool)
  | left (symbol : Bool) (phase : LeftPhase)
  | push (context : PushContext) (phase : PushPhase)
  | rightBlank (symbol : Bool)
  deriving DecidableEq, Repr

def boolCode : Bool -> Nat
  | false => 0
  | true => 1

def encodeRight : RightPhase -> Nat
  | .start => 0
  | .checkSentinel => 1
  | .incrementScratch => 2
  | .pairFirst => 3
  | .pairSecond => 4
  | .restoreFirst false => 5
  | .restoreFirst true => 6
  | .restoreFirstIncrement false => 7
  | .restoreFirstIncrement true => 8
  | .restoreCheck false => 9
  | .restoreCheck true => 10
  | .restoreRestIncrement false => 11
  | .restoreRestIncrement true => 12
  | .restoreLoop false => 13
  | .restoreLoop true => 14
  | .restoreLoopIncrement false => 15
  | .restoreLoopIncrement true => 16

def decodeRight : Nat -> RightPhase
  | 0 => .start
  | 1 => .checkSentinel
  | 2 => .incrementScratch
  | 3 => .pairFirst
  | 4 => .pairSecond
  | 5 => .restoreFirst false
  | 6 => .restoreFirst true
  | 7 => .restoreFirstIncrement false
  | 8 => .restoreFirstIncrement true
  | 9 => .restoreCheck false
  | 10 => .restoreCheck true
  | 11 => .restoreRestIncrement false
  | 12 => .restoreRestIncrement true
  | 13 => .restoreLoop false
  | 14 => .restoreLoop true
  | 15 => .restoreLoopIncrement false
  | _ => .restoreLoopIncrement true

def encodeLeft : LeftPhase -> Nat
  | .start => 0
  | .checkSentinel => 1
  | .incrementScratch => 2
  | .pairFirst => 3
  | .pairSecond => 4
  | .restore false => 5
  | .restore true => 6
  | .restoreIncrement false => 7
  | .restoreIncrement true => 8
  | .restoreEmpty => 9

def decodeLeft : Nat -> LeftPhase
  | 0 => .start
  | 1 => .checkSentinel
  | 2 => .incrementScratch
  | 3 => .pairFirst
  | 4 => .pairSecond
  | 5 => .restore false
  | 6 => .restore true
  | 7 => .restoreIncrement false
  | 8 => .restoreIncrement true
  | _ => .restoreEmpty

def encodePushContext : PushContext -> Nat
  | .stay false => 0
  | .stay true => 1
  | .right false false => 2
  | .right false true => 3
  | .right true false => 4
  | .right true true => 5
  | .leftWrite false false => 6
  | .leftWrite false true => 7
  | .leftWrite true false => 8
  | .leftWrite true true => 9
  | .leftNeighbor false false => 10
  | .leftNeighbor false true => 11
  | .leftNeighbor true false => 12
  | .leftNeighbor true true => 13

def decodePushContext : Nat -> PushContext
  | 0 => .stay false
  | 1 => .stay true
  | 2 => .right false false
  | 3 => .right false true
  | 4 => .right true false
  | 5 => .right true true
  | 6 => .leftWrite false false
  | 7 => .leftWrite false true
  | 8 => .leftWrite true false
  | 9 => .leftWrite true true
  | 10 => .leftNeighbor false false
  | 11 => .leftNeighbor false true
  | 12 => .leftNeighbor true false
  | _ => .leftNeighbor true true

def encodePush : PushPhase -> Nat
  | .drain => 0
  | .drainIncrement => 1
  | .restore => 2
  | .restoreIncrementFirst => 3
  | .restoreIncrementSecond => 4
  | .addBit => 5

def decodePush : Nat -> PushPhase
  | 0 => .drain
  | 1 => .drainIncrement
  | 2 => .restore
  | 3 => .restoreIncrementFirst
  | 4 => .restoreIncrementSecond
  | _ => .addBit

/-- There are exactly 127 microphases per source control state. -/
def phaseCount : Nat := 127

def encodePhase : Phase -> Nat
  | .right phase => encodeRight phase
  | .dispatch symbol tailEmpty =>
      17 + 2 * boolCode symbol + boolCode tailEmpty
  | .left symbol phase => 21 + 10 * boolCode symbol + encodeLeft phase
  | .push context phase =>
      41 + 6 * encodePushContext context + encodePush phase
  | .rightBlank symbol => 125 + boolCode symbol

def decodePhase (code : Nat) : Phase :=
  if code < 17 then
    .right (decodeRight code)
  else if code < 21 then
    let offset := code - 17
    .dispatch (offset / 2 = 1) (offset % 2 = 1)
  else if code < 41 then
    let offset := code - 21
    .left (offset / 10 = 1) (decodeLeft (offset % 10))
  else if code < 125 then
    let offset := code - 41
    .push (decodePushContext (offset / 6)) (decodePush (offset % 6))
  else
    .rightBlank (code = 126)

theorem encodePhase_lt (phase : Phase) : encodePhase phase < phaseCount := by
  cases phase with
  | right phase =>
      cases phase <;> first | decide | (rename_i bit; cases bit <;> decide)
  | dispatch symbol tailEmpty => cases symbol <;> cases tailEmpty <;> decide
  | left symbol phase =>
      cases symbol <;> cases phase <;>
        first | decide | (rename_i bit; cases bit <;> decide)
  | push context phase =>
      cases context with
      | stay symbol => cases symbol <;> cases phase <;> decide
      | right symbol tailEmpty =>
          cases symbol <;> cases tailEmpty <;> cases phase <;> decide
      | leftWrite symbol neighbor =>
          cases symbol <;> cases neighbor <;> cases phase <;> decide
      | leftNeighbor symbol neighbor =>
          cases symbol <;> cases neighbor <;> cases phase <;> decide
  | rightBlank symbol => cases symbol <;> decide

@[simp]
theorem decodePhase_encodePhase (phase : Phase) :
    decodePhase (encodePhase phase) = phase := by
  cases phase with
  | right phase =>
      cases phase <;> first | rfl | (rename_i bit; cases bit <;> rfl)
  | dispatch symbol tailEmpty => cases symbol <;> cases tailEmpty <;> rfl
  | left symbol phase =>
      cases symbol <;> cases phase <;>
        first | rfl | (rename_i bit; cases bit <;> rfl)
  | push context phase =>
      cases context with
      | stay symbol => cases symbol <;> cases phase <;> rfl
      | right symbol tailEmpty =>
          cases symbol <;> cases tailEmpty <;> cases phase <;> rfl
      | leftWrite symbol neighbor =>
          cases symbol <;> cases neighbor <;> cases phase <;> rfl
      | leftNeighbor symbol neighbor =>
          cases symbol <;> cases neighbor <;> cases phase <;> rfl
  | rightBlank symbol => cases symbol <;> rfl

/-- Numeric label of one typed microphase in a source-state block. -/
def address (state : Nat) (phase : Phase) : Nat :=
  state * phaseCount + encodePhase phase

end Layout

open Layout

namespace Compiler

abbrev Machine := DeterministicTape.Machine
abbrev Rule := DeterministicTape.Rule

def haltAddress (machine : Machine) : Nat :=
  machine.states.length * phaseCount

def boundaryAddress (state : Nat) : Nat :=
  address state (.right .start)

def ruleFor (machine : Machine) (state : Nat) (symbol : Bool) : Option Rule :=
  DeterministicTape.ruleAt? machine state symbol

def pushRegister : PushContext -> ThreeCounter.Register
  | .right _ _ => .left
  | _ => .right

def pushSymbol : PushContext -> Bool
  | .stay symbol => symbol
  | .right symbol _ => symbol
  | .leftWrite symbol _ => symbol
  | .leftNeighbor symbol _ => symbol

def pushBit (machine : Machine) (state : Nat) : PushContext -> Bool
  | .leftNeighbor _ neighbor => neighbor
  | context =>
      match ruleFor machine state (pushSymbol context) with
      | none => false
      | some rule => rule.write

def finishAddress (machine : Machine) (state : Nat) : PushContext -> Nat
  | .stay symbol =>
      match ruleFor machine state symbol with
      | none => haltAddress machine
      | some rule => boundaryAddress rule.nextState
  | .right symbol tailEmpty =>
      match ruleFor machine state symbol with
      | none => haltAddress machine
      | some rule =>
          if tailEmpty then address state (.rightBlank symbol)
          else boundaryAddress rule.nextState
  | .leftWrite symbol neighbor =>
      address state (.push (.leftNeighbor symbol neighbor) .drain)
  | .leftNeighbor symbol _ =>
      match ruleFor machine state symbol with
      | none => haltAddress machine
      | some rule => boundaryAddress rule.nextState

def zeroGoto (machine : Machine) (state : Nat) (phase : Phase) :
    ThreeCounter.Instruction :=
  .decrementJump .scratch (haltAddress machine) (address state phase)

/-- Instruction selected by one typed compiled microphase. -/
def instructionFor (machine : Machine) (state : Nat) : Phase ->
    ThreeCounter.Instruction
  | .right .start =>
      .decrementJump .right (address state (.right .checkSentinel))
        (haltAddress machine)
  | .right .checkSentinel =>
      .decrementJump .right (address state (.right .incrementScratch))
        (haltAddress machine)
  | .right .incrementScratch =>
      .increment .scratch (address state (.right .pairFirst))
  | .right .pairFirst =>
      .decrementJump .right (address state (.right .pairSecond))
        (address state (.right (.restoreFirst false)))
  | .right .pairSecond =>
      .decrementJump .right (address state (.right .incrementScratch))
        (address state (.right (.restoreFirst true)))
  | .right (.restoreFirst bit) =>
      .decrementJump .scratch
        (address state (.right (.restoreFirstIncrement bit)))
        (haltAddress machine)
  | .right (.restoreFirstIncrement bit) =>
      .increment .right (address state (.right (.restoreCheck bit)))
  | .right (.restoreCheck bit) =>
      .decrementJump .scratch
        (address state (.right (.restoreRestIncrement bit)))
        (address state (.dispatch bit true))
  | .right (.restoreRestIncrement bit) =>
      .increment .right (address state (.right (.restoreLoop bit)))
  | .right (.restoreLoop bit) =>
      .decrementJump .scratch
        (address state (.right (.restoreLoopIncrement bit)))
        (address state (.dispatch bit false))
  | .right (.restoreLoopIncrement bit) =>
      .increment .right (address state (.right (.restoreLoop bit)))
  | .dispatch symbol tailEmpty =>
      match ruleFor machine state symbol with
      | none => .halt
      | some rule =>
          match rule.move with
          | .stay => zeroGoto machine state
              (.push (.stay symbol) .drain)
          | .left => zeroGoto machine state (.left symbol .start)
          | .right => zeroGoto machine state
              (.push (.right symbol tailEmpty) .drain)
  | .left symbol .start =>
      .decrementJump .left (address state (.left symbol .checkSentinel))
        (haltAddress machine)
  | .left symbol .checkSentinel =>
      .decrementJump .left (address state (.left symbol .incrementScratch))
        (address state (.left symbol .restoreEmpty))
  | .left symbol .incrementScratch =>
      .increment .scratch (address state (.left symbol .pairFirst))
  | .left symbol .pairFirst =>
      .decrementJump .left (address state (.left symbol .pairSecond))
        (address state (.left symbol (.restore false)))
  | .left symbol .pairSecond =>
      .decrementJump .left (address state (.left symbol .incrementScratch))
        (address state (.left symbol (.restore true)))
  | .left symbol (.restore neighbor) =>
      .decrementJump .scratch
        (address state (.left symbol (.restoreIncrement neighbor)))
        (address state (.push (.leftWrite symbol neighbor) .drain))
  | .left symbol (.restoreIncrement neighbor) =>
      .increment .left (address state (.left symbol (.restore neighbor)))
  | .left symbol .restoreEmpty =>
      .increment .left
        (address state (.push (.leftWrite symbol false) .drain))
  | .push context .drain =>
      .decrementJump (pushRegister context)
        (address state (.push context .drainIncrement))
        (address state (.push context .restore))
  | .push context .drainIncrement =>
      .increment .scratch (address state (.push context .drain))
  | .push context .restore =>
      .decrementJump .scratch
        (address state (.push context .restoreIncrementFirst))
        (if pushBit machine state context then
          address state (.push context .addBit)
        else finishAddress machine state context)
  | .push context .restoreIncrementFirst =>
      .increment (pushRegister context)
        (address state (.push context .restoreIncrementSecond))
  | .push context .restoreIncrementSecond =>
      .increment (pushRegister context)
        (address state (.push context .restore))
  | .push context .addBit =>
      .increment (pushRegister context) (finishAddress machine state context)
  | .rightBlank symbol =>
      match ruleFor machine state symbol with
      | none => .halt
      | some rule => .increment .right (boundaryAddress rule.nextState)

/-- Structural finite-table generator with literal numeric labels. -/
def tabulate {alpha : Type} : Nat -> (Nat -> alpha) -> List alpha
  | 0, _ => []
  | count + 1, entry => entry 0 :: tabulate count (fun index => entry (index + 1))

theorem tabulate_length {alpha : Type} (count : Nat) (entry : Nat -> alpha) :
    (tabulate count entry).length = count := by
  induction count generalizing entry with
  | zero => rfl
  | succ count ih =>
      simp only [tabulate, List.length_cons, ih]

theorem instructionAt_tabulate {count index : Nat}
    (entry : Nat -> ThreeCounter.Instruction) (bounded : index < count) :
    ThreeCounter.instructionAt (tabulate count entry) index = entry index := by
  induction count generalizing index entry with
  | zero => exact False.elim (Nat.not_lt_zero index bounded)
  | succ count ih =>
      cases index with
      | zero => rfl
      | succ index =>
          exact ih (fun offset => entry (offset + 1))
            (Nat.lt_of_succ_lt_succ bounded)

/-- Literal finite primitive program compiled from the source table. -/
def compileMachine (machine : Machine) : ThreeCounter.Program :=
  tabulate (haltAddress machine) fun label =>
    instructionFor machine (label / phaseCount)
      (decodePhase (label % phaseCount))

@[simp]
theorem compileMachine_length (machine : Machine) :
    (compileMachine machine).length = haltAddress machine := by
  exact tabulate_length _ _

theorem address_lt_haltAddress {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (phase : Phase) :
    address state phase < haltAddress machine := by
  have within : state * phaseCount + encodePhase phase <
      state * phaseCount + phaseCount :=
    Nat.add_lt_add_left (encodePhase_lt phase) (state * phaseCount)
  have blockEnd : state * phaseCount + phaseCount =
      (state + 1) * phaseCount := by
    rw [Nat.add_mul]
    rfl
  have nextLe : state + 1 <= machine.states.length :=
    bounded
  exact Nat.lt_of_lt_of_le (blockEnd ▸ within)
    (Nat.mul_le_mul_right phaseCount nextLe)

theorem address_mod (state : Nat) (phase : Phase) :
    address state phase % phaseCount = encodePhase phase := by
  rw [address, Nat.add_comm, Nat.add_mul_mod_self_right]
  exact Nat.mod_eq_of_lt (encodePhase_lt phase)

theorem address_div (state : Nat) (phase : Phase) :
    address state phase / phaseCount = state := by
  rw [address, Nat.add_comm]
  rw [Nat.add_mul_div_right (encodePhase phase) state
    (by decide : 0 < phaseCount)]
  rw [Nat.div_eq_of_lt (encodePhase_lt phase), Nat.zero_add]

/-- Generated finite-table lookup at a bounded typed address. -/
theorem instructionAt_compileMachine {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (phase : Phase) :
    ThreeCounter.instructionAt (compileMachine machine) (address state phase) =
      instructionFor machine state phase := by
  rw [compileMachine, instructionAt_tabulate _
    (address_lt_haltAddress bounded phase), address_div, address_mod,
    decodePhase_encodePhase]

end Compiler

open Compiler

namespace Execution

/-- A running primitive configuration written without record-update noise. -/
def runningState (control left right scratch : Nat) : ThreeCounter.State :=
  { control := control
    left := left
    right := right
    scratch := scratch
    status := .running }

/-- A source macro-boundary configuration in the primitive machine. -/
def boundaryState (configuration : StackCounter.Configuration) :
    ThreeCounter.State :=
  runningState (boundaryAddress configuration.state)
    configuration.left configuration.right 0

/-- Literal primitive initialization of a deterministic-tape instance. -/
def compileInitial (source : DeterministicTape.Instance) : ThreeCounter.State :=
  boundaryState (DeterministicTapeCounterCompiler.compileInitial source)

/-- State shape shared by every push loop.  The `.right` source move pushes
onto the left register; all other contexts push onto the right register. -/
def pushState (context : PushContext) (control target other scratch : Nat) :
    ThreeCounter.State :=
  match context with
  | .right _ _ => runningState control target other scratch
  | _ => runningState control other target scratch

/-- Exact one-step reduction at a bounded typed microphase. -/
theorem step_at {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (phase : Phase)
    (left right scratch : Nat) :
    ThreeCounter.step (compileMachine machine)
        (runningState (address state phase) left right scratch) =
      ThreeCounter.execute (instructionFor machine state phase)
        (runningState (address state phase) left right scratch) := by
  unfold ThreeCounter.step runningState
  rw [instructionAt_compileMachine bounded phase]

/-- Lookup depends only on a running state's control label, not on how the
register record was presented by the preceding primitive instruction. -/
theorem step_control_at {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (phase : Phase)
    (configuration : ThreeCounter.State)
    (running : configuration.status = .running)
    (control : configuration.control = address state phase) :
    ThreeCounter.step (compileMachine machine) configuration =
      ThreeCounter.execute (instructionFor machine state phase) configuration := by
  unfold ThreeCounter.step
  rw [running, control, instructionAt_compileMachine bounded phase]

/-- `step_at` specialized to the common context-dependent push-state shape. -/
theorem step_push_at {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (context : PushContext)
    (phase : PushPhase) (target other scratch : Nat) :
    ThreeCounter.step (compileMachine machine)
        (pushState context (address state (.push context phase))
          target other scratch) =
      ThreeCounter.execute (instructionFor machine state (.push context phase))
        (pushState context (address state (.push context phase))
          target other scratch) := by
  cases context <;> exact step_at bounded _ _ _ _

/-- Primitive runs concatenate literally. -/
theorem run_add (program : ThreeCounter.Program) (first second : Nat)
    (initial : ThreeCounter.State) :
    ThreeCounter.run program (first + second) initial =
      ThreeCounter.run program second
        (ThreeCounter.run program first initial) := by
  induction second with
  | zero => rfl
  | succ second ih =>
      rw [Nat.add_succ, ThreeCounter.run_succ, ThreeCounter.run_succ, ih]

/-- Microticks needed to drain a target counter into scratch. -/
def drainClock : Nat -> Nat
  | 0 => 1
  | target + 1 => 2 + drainClock target

/-- Microticks needed to restore scratch, doubling into the target and then
optionally adding one. -/
def restoreClock : Nat -> Bool -> Nat
  | 0, false => 1
  | 0, true => 2
  | scratch + 1, bit => 3 + restoreClock scratch bit

/-- Arithmetic value produced by the executable restore loop. -/
def restoreValue : Nat -> Nat -> Bool -> Nat
  | target, 0, false => target
  | target, 0, true => target + 1
  | target, scratch + 1, bit => restoreValue (target + 2) scratch bit

/-- Executable microtick clock for one binary-stack push. -/
def pushClock (target : Nat) (bit : Bool) : Nat :=
  drainClock target + restoreClock target bit

theorem restoreValue_zero (target : Nat) (bit : Bool) :
    restoreValue target 0 bit = target + boolCode bit := by
  cases bit <;> rfl

/-- The arithmetic restore loop computes literal doubling plus its Boolean
digit. -/
theorem restoreValue_eq (target scratch : Nat) (bit : Bool) :
    restoreValue target scratch bit =
      target + 2 * scratch + boolCode bit := by
  induction scratch generalizing target with
  | zero => cases bit <;> simp [restoreValue, boolCode]
  | succ scratch ih =>
      rw [restoreValue, ih]
      simp only [Nat.mul_succ]
      cases bit <;>
        simp [boolCode, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

@[simp]
theorem restoreValue_push (target : Nat) (bit : Bool) :
    restoreValue 0 target bit = StackCode.push bit target := by
  rw [restoreValue_eq]
  cases bit <;> simp [StackCode.push, StackCode.bit, boolCode]

/-- The drain half of the common push loop is an exact primitive run. -/
theorem run_push_drain {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (context : PushContext)
    (target other scratch : Nat) :
    ThreeCounter.run (compileMachine machine) (drainClock target)
        (pushState context
          (address state (.push context .drain)) target other scratch) =
      pushState context (address state (.push context .restore))
        0 other (scratch + target) := by
  induction target generalizing scratch with
  | zero =>
      rw [drainClock, ThreeCounter.run_succ, ThreeCounter.run_zero]
      rw [step_push_at bounded]
      cases context <;> rfl
  | succ target ih =>
      rw [drainClock, run_add]
      have firstTwo :
          ThreeCounter.run (compileMachine machine) 2
              (pushState context
                (address state (.push context .drain)) (target + 1)
                other scratch) =
            pushState context (address state (.push context .drain))
              target other (scratch + 1) := by
        simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
        rw [step_push_at bounded]
        cases context <;>
          simp only [instructionFor, pushRegister, ThreeCounter.execute,
            ThreeCounter.read, ThreeCounter.write, runningState, pushState]
        all_goals rw [step_control_at bounded
          (.push _ .drainIncrement) _ rfl rfl]
        all_goals rfl
      rw [firstTwo, ih]
      have addEq : (scratch + 1) + target = scratch + (target + 1) := by
        rw [Nat.add_assoc, Nat.add_comm 1 target]
      rw [addEq]

/-- The restore half of the common push loop is an exact primitive run. -/
theorem run_push_restore {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (context : PushContext)
    (target other scratch : Nat) :
    ThreeCounter.run (compileMachine machine)
        (restoreClock scratch (pushBit machine state context))
        (pushState context (address state (.push context .restore))
          target other scratch) =
      pushState context (finishAddress machine state context)
        (restoreValue target scratch (pushBit machine state context)) other 0 := by
  induction scratch generalizing target with
  | zero =>
      cases bitEq : pushBit machine state context with
      | false =>
          rw [restoreClock, ThreeCounter.run_succ, ThreeCounter.run_zero]
          rw [step_push_at bounded]
          cases context <;> simp [instructionFor, bitEq, pushState,
            runningState, ThreeCounter.execute, ThreeCounter.read,
            ThreeCounter.write, restoreValue]
      | true =>
          rw [restoreClock]
          simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
          rw [step_push_at bounded]
          cases context <;> simp only [instructionFor, bitEq, if_true,
            pushState, pushRegister, ThreeCounter.execute, ThreeCounter.read,
            ThreeCounter.write, runningState]
          all_goals rw [step_control_at bounded (.push _ .addBit) _ rfl rfl]
          all_goals rfl
  | succ scratch ih =>
      rw [restoreClock, run_add]
      have firstThree :
          ThreeCounter.run (compileMachine machine) 3
              (pushState context
                (address state (.push context .restore)) target other
                  (scratch + 1)) =
            pushState context (address state (.push context .restore))
              (target + 2) other scratch := by
        have restoreStep :
            ThreeCounter.step (compileMachine machine)
                (pushState context
                  (address state (.push context .restore)) target other
                    (scratch + 1)) =
              pushState context
                (address state (.push context .restoreIncrementFirst))
                target other scratch := by
          rw [step_push_at bounded]
          cases context <;> rfl
        have firstIncrement :
            ThreeCounter.step (compileMachine machine)
                (pushState context
                  (address state (.push context .restoreIncrementFirst))
                  target other scratch) =
              pushState context
                (address state (.push context .restoreIncrementSecond))
                (target + 1) other scratch := by
          rw [step_push_at bounded]
          cases context <;> rfl
        have secondIncrement :
            ThreeCounter.step (compileMachine machine)
                (pushState context
                  (address state (.push context .restoreIncrementSecond))
                  (target + 1) other scratch) =
              pushState context (address state (.push context .restore))
                (target + 2) other scratch := by
          rw [step_push_at bounded]
          cases context <;> rfl
        simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
        rw [restoreStep, firstIncrement, secondIncrement]
      rw [firstThree, ih]
      rfl

/-- Full exact primitive implementation of one arithmetic stack push. -/
theorem run_push {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (context : PushContext)
    (target other : Nat) :
    ThreeCounter.run (compileMachine machine)
        (pushClock target (pushBit machine state context))
        (pushState context (address state (.push context .drain))
          target other 0) =
      pushState context (finishAddress machine state context)
        (StackCode.push (pushBit machine state context) target) other 0 := by
  rw [pushClock, run_add, run_push_drain bounded, Nat.zero_add,
    run_push_restore bounded, restoreValue_push]

/-! ## Exact right-stack pop -/

/-- Microticks for consuming the remaining quotient pairs after the first
pair has been removed. -/
def pairClock : Nat -> Bool -> Nat
  | 0, false => 1
  | 0, true => 2
  | pairs + 1, bit => 3 + pairClock pairs bit

/-- Exact pair-consumption loop used by both pop routines. -/
theorem run_right_pairs {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (pairs : Nat) (bit : Bool)
    (left scratch : Nat) :
    ThreeCounter.run (compileMachine machine) (pairClock pairs bit)
        (runningState (address state (.right .pairFirst)) left
          (StackCode.push bit pairs) scratch) =
      runningState (address state (.right (.restoreFirst bit))) left 0
        (scratch + pairs) := by
  induction pairs generalizing scratch with
  | zero =>
      cases bit with
      | false =>
          rw [pairClock, ThreeCounter.run_succ, ThreeCounter.run_zero]
          rw [step_at bounded]
          rfl
      | true =>
          rw [pairClock]
          simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
          have firstStep :
              ThreeCounter.step (compileMachine machine)
                  (runningState (address state (.right .pairFirst)) left
                    (StackCode.push true 0) scratch) =
                runningState (address state (.right .pairSecond)) left 0
                  scratch := by
            rw [step_at bounded]
            rfl
          have secondStep :
              ThreeCounter.step (compileMachine machine)
                  (runningState (address state (.right .pairSecond)) left 0
                    scratch) =
                runningState
                  (address state (.right (.restoreFirst true))) left 0
                  scratch := by
            rw [step_at bounded]
            rfl
          rw [firstStep, secondStep]
          rw [Nat.add_zero]
  | succ pairs ih =>
      rw [pairClock, run_add]
      have firstThree :
          ThreeCounter.run (compileMachine machine) 3
              (runningState (address state (.right .pairFirst)) left
                (StackCode.push bit (pairs + 1)) scratch) =
            runningState (address state (.right .pairFirst)) left
              (StackCode.push bit pairs) (scratch + 1) := by
        have firstStep :
            ThreeCounter.step (compileMachine machine)
                (runningState (address state (.right .pairFirst)) left
                  (StackCode.push bit (pairs + 1)) scratch) =
              runningState (address state (.right .pairSecond)) left
                (StackCode.push bit pairs + 1) scratch := by
          cases bit <;> rw [step_at bounded] <;> rfl
        have secondStep :
            ThreeCounter.step (compileMachine machine)
                (runningState (address state (.right .pairSecond)) left
                  (StackCode.push bit pairs + 1) scratch) =
              runningState (address state (.right .incrementScratch)) left
                (StackCode.push bit pairs) scratch := by
          cases bit <;> rw [step_at bounded] <;> rfl
        have thirdStep :
            ThreeCounter.step (compileMachine machine)
                (runningState (address state (.right .incrementScratch)) left
                  (StackCode.push bit pairs) scratch) =
              runningState (address state (.right .pairFirst)) left
                (StackCode.push bit pairs) (scratch + 1) := by
          rw [step_at bounded]
          rfl
        simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
        rw [firstStep, secondStep, thirdStep]
      rw [firstThree, ih]
      have addEq : (scratch + 1) + pairs = scratch + (pairs + 1) := by
        rw [Nat.add_assoc, Nat.add_comm 1 pairs]
      rw [addEq]

/-- Microticks for the final one-at-a-time restoration loop. -/
def transferClock : Nat -> Nat
  | 0 => 1
  | remaining + 1 => 2 + transferClock remaining

/-- Arithmetic value produced by a one-at-a-time transfer. -/
def transferValue : Nat -> Nat -> Nat
  | target, 0 => target
  | target, remaining + 1 => transferValue (target + 1) remaining

theorem transferValue_eq (target remaining : Nat) :
    transferValue target remaining = target + remaining := by
  induction remaining generalizing target with
  | zero => rfl
  | succ remaining ih =>
      rw [transferValue, ih]
      rw [Nat.add_assoc, Nat.add_comm 1 remaining]

/-- Exact final restoration loop for a nonempty right tail. -/
theorem run_right_transfer {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (remaining : Nat) (bit : Bool)
    (left target : Nat) :
    ThreeCounter.run (compileMachine machine) (transferClock remaining)
        (runningState (address state (.right (.restoreLoop bit))) left target
          remaining) =
      runningState (address state (.dispatch bit false)) left
        (transferValue target remaining) 0 := by
  induction remaining generalizing target with
  | zero =>
      rw [transferClock, ThreeCounter.run_succ, ThreeCounter.run_zero]
      rw [step_at bounded]
      rfl
  | succ remaining ih =>
      rw [transferClock, run_add]
      have firstTwo :
          ThreeCounter.run (compileMachine machine) 2
              (runningState (address state (.right (.restoreLoop bit))) left
                target (remaining + 1)) =
            runningState (address state (.right (.restoreLoop bit))) left
              (target + 1) remaining := by
        simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
        have firstStep :
            ThreeCounter.step (compileMachine machine)
                (runningState (address state (.right (.restoreLoop bit))) left
                  target (remaining + 1)) =
              runningState
                (address state (.right (.restoreLoopIncrement bit))) left
                target remaining := by
          rw [step_at bounded]
          rfl
        have secondStep :
            ThreeCounter.step (compileMachine machine)
                (runningState
                  (address state (.right (.restoreLoopIncrement bit))) left
                  target remaining) =
              runningState (address state (.right (.restoreLoop bit))) left
                (target + 1) remaining := by
          rw [step_at bounded]
          rfl
        rw [firstStep, secondStep]
      rw [firstTwo, ih]
      rfl

/-- Restoration clock once a positive quotient has reached scratch. -/
def rightRestoreClock : Nat -> Nat
  | 0 => 1
  | 1 => 3
  | remaining + 2 => 4 + transferClock remaining

/-- Exact quotient restoration, including the finite-control observation of
whether the right tail is the sentinel-only empty stack. -/
theorem run_right_restore {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (quotientBase : Nat) (bit : Bool)
    (left : Nat) :
    ThreeCounter.run (compileMachine machine)
        (rightRestoreClock (quotientBase + 1))
        (runningState (address state (.right (.restoreFirst bit))) left 0
          (quotientBase + 1)) =
      runningState
        (address state (.dispatch bit (quotientBase = 0))) left
        (quotientBase + 1) 0 := by
  cases quotientBase with
  | zero =>
      rw [rightRestoreClock]
      simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
      have firstStep :
          ThreeCounter.step (compileMachine machine)
              (runningState (address state (.right (.restoreFirst bit))) left 0
                1) =
            runningState
              (address state (.right (.restoreFirstIncrement bit))) left 0 0 := by
        rw [step_at bounded]
        rfl
      have secondStep :
          ThreeCounter.step (compileMachine machine)
              (runningState
                (address state (.right (.restoreFirstIncrement bit))) left 0
                0) =
            runningState (address state (.right (.restoreCheck bit))) left 1
              0 := by
        rw [step_at bounded]
        rfl
      have thirdStep :
          ThreeCounter.step (compileMachine machine)
              (runningState (address state (.right (.restoreCheck bit))) left 1
                0) =
            runningState (address state (.dispatch bit true)) left 1 0 := by
        rw [step_at bounded]
        rfl
      rw [firstStep, secondStep, thirdStep]
      rfl
  | succ remaining =>
      rw [rightRestoreClock, run_add]
      have firstFour :
          ThreeCounter.run (compileMachine machine) 4
              (runningState (address state (.right (.restoreFirst bit))) left 0
                (remaining + 2)) =
            runningState (address state (.right (.restoreLoop bit))) left 2
              remaining := by
        simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
        have firstStep :
            ThreeCounter.step (compileMachine machine)
                (runningState (address state (.right (.restoreFirst bit))) left
                  0 (remaining + 2)) =
              runningState
                (address state (.right (.restoreFirstIncrement bit))) left 0
                (remaining + 1) := by
          rw [step_at bounded]
          rfl
        have secondStep :
            ThreeCounter.step (compileMachine machine)
                (runningState
                  (address state (.right (.restoreFirstIncrement bit))) left 0
                  (remaining + 1)) =
              runningState (address state (.right (.restoreCheck bit))) left 1
                (remaining + 1) := by
          rw [step_at bounded]
          rfl
        have thirdStep :
            ThreeCounter.step (compileMachine machine)
                (runningState (address state (.right (.restoreCheck bit))) left
                  1 (remaining + 1)) =
              runningState
                (address state (.right (.restoreRestIncrement bit))) left 1
                remaining := by
          rw [step_at bounded]
          rfl
        have fourthStep :
            ThreeCounter.step (compileMachine machine)
                (runningState
                  (address state (.right (.restoreRestIncrement bit))) left 1
                  remaining) =
              runningState (address state (.right (.restoreLoop bit))) left 2
                remaining := by
          rw [step_at bounded]
          rfl
        rw [firstStep, secondStep, thirdStep, fourthStep]
      rw [firstFour, run_right_transfer bounded, transferValue_eq]
      rw [Nat.add_comm 2 remaining]
      rfl

/-- Complete clock for exposing the scanned bit and restoring its right tail. -/
def rightPopClock (quotientBase : Nat) (bit : Bool) : Nat :=
  3 + (pairClock quotientBase bit + rightRestoreClock (quotientBase + 1))

/-- Exact right-stack pop from a valid sentinel-terminated stack. -/
theorem run_right_pop {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (quotientBase : Nat) (bit : Bool)
    (left : Nat) :
    ThreeCounter.run (compileMachine machine) (rightPopClock quotientBase bit)
        (runningState (boundaryAddress state) left
          (StackCode.push bit (quotientBase + 1)) 0) =
      runningState (address state (.dispatch bit (quotientBase = 0))) left
        (quotientBase + 1) 0 := by
  rw [rightPopClock, run_add]
  have firstThree :
      ThreeCounter.run (compileMachine machine) 3
          (runningState (boundaryAddress state) left
            (StackCode.push bit (quotientBase + 1)) 0) =
        runningState (address state (.right .pairFirst)) left
          (StackCode.push bit quotientBase) 1 := by
    have firstStep :
        ThreeCounter.step (compileMachine machine)
            (runningState (address state (.right .start)) left
              (StackCode.push bit (quotientBase + 1)) 0) =
          runningState (address state (.right .checkSentinel)) left
            (StackCode.push bit quotientBase + 1) 0 := by
      cases bit <;> rw [step_at bounded] <;> rfl
    have secondStep :
        ThreeCounter.step (compileMachine machine)
            (runningState (address state (.right .checkSentinel)) left
              (StackCode.push bit quotientBase + 1) 0) =
          runningState (address state (.right .incrementScratch)) left
            (StackCode.push bit quotientBase) 0 := by
      cases bit <;> rw [step_at bounded] <;> rfl
    have thirdStep :
        ThreeCounter.step (compileMachine machine)
            (runningState (address state (.right .incrementScratch)) left
              (StackCode.push bit quotientBase) 0) =
          runningState (address state (.right .pairFirst)) left
            (StackCode.push bit quotientBase) 1 := by
      rw [step_at bounded]
      rfl
    simp only [boundaryAddress, ThreeCounter.run_succ, ThreeCounter.run_zero]
    rw [firstStep, secondStep, thirdStep]
  rw [firstThree, run_add, run_right_pairs bounded]
  rw [Nat.add_comm 1 quotientBase]
  exact run_right_restore bounded quotientBase bit left

/-! ## Exact optional left-stack pop -/

/-- Pair-consumption loop for the left stack. -/
theorem run_left_pairs {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (pairs : Nat)
    (symbol neighbor : Bool) (right scratch : Nat) :
    ThreeCounter.run (compileMachine machine) (pairClock pairs neighbor)
        (runningState (address state (.left symbol .pairFirst))
          (StackCode.push neighbor pairs) right scratch) =
      runningState
        (address state (.left symbol (.restore neighbor))) 0 right
        (scratch + pairs) := by
  induction pairs generalizing scratch with
  | zero =>
      cases neighbor with
      | false =>
          rw [pairClock, ThreeCounter.run_succ, ThreeCounter.run_zero]
          rw [step_at bounded]
          rfl
      | true =>
          rw [pairClock]
          simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
          have firstStep :
              ThreeCounter.step (compileMachine machine)
                  (runningState (address state (.left symbol .pairFirst))
                    (StackCode.push true 0) right scratch) =
                runningState (address state (.left symbol .pairSecond)) 0
                  right scratch := by
            rw [step_at bounded]
            rfl
          have secondStep :
              ThreeCounter.step (compileMachine machine)
                  (runningState (address state (.left symbol .pairSecond)) 0
                    right scratch) =
                runningState
                  (address state (.left symbol (.restore true))) 0 right
                  scratch := by
            rw [step_at bounded]
            rfl
          rw [firstStep, secondStep, Nat.add_zero]
  | succ pairs ih =>
      rw [pairClock, run_add]
      have firstThree :
          ThreeCounter.run (compileMachine machine) 3
              (runningState (address state (.left symbol .pairFirst))
                (StackCode.push neighbor (pairs + 1)) right scratch) =
            runningState (address state (.left symbol .pairFirst))
              (StackCode.push neighbor pairs) right (scratch + 1) := by
        have firstStep :
            ThreeCounter.step (compileMachine machine)
                (runningState (address state (.left symbol .pairFirst))
                  (StackCode.push neighbor (pairs + 1)) right scratch) =
              runningState (address state (.left symbol .pairSecond))
                (StackCode.push neighbor pairs + 1) right scratch := by
          cases neighbor <;> rw [step_at bounded] <;> rfl
        have secondStep :
            ThreeCounter.step (compileMachine machine)
                (runningState (address state (.left symbol .pairSecond))
                  (StackCode.push neighbor pairs + 1) right scratch) =
              runningState (address state (.left symbol .incrementScratch))
                (StackCode.push neighbor pairs) right scratch := by
          cases neighbor <;> rw [step_at bounded] <;> rfl
        have thirdStep :
            ThreeCounter.step (compileMachine machine)
                (runningState
                  (address state (.left symbol .incrementScratch))
                  (StackCode.push neighbor pairs) right scratch) =
              runningState (address state (.left symbol .pairFirst))
                (StackCode.push neighbor pairs) right (scratch + 1) := by
          rw [step_at bounded]
          rfl
        simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
        rw [firstStep, secondStep, thirdStep]
      rw [firstThree, ih]
      have addEq : (scratch + 1) + pairs = scratch + (pairs + 1) := by
        rw [Nat.add_assoc, Nat.add_comm 1 pairs]
      rw [addEq]

/-- One-at-a-time left restoration reaches the first right-push phase. -/
theorem run_left_transfer {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (remaining : Nat)
    (symbol neighbor : Bool) (target right : Nat) :
    ThreeCounter.run (compileMachine machine) (transferClock remaining)
        (runningState (address state (.left symbol (.restore neighbor)))
          target right remaining) =
      runningState
        (address state (.push (.leftWrite symbol neighbor) .drain))
        (transferValue target remaining) right 0 := by
  induction remaining generalizing target with
  | zero =>
      rw [transferClock, ThreeCounter.run_succ, ThreeCounter.run_zero]
      rw [step_at bounded]
      rfl
  | succ remaining ih =>
      rw [transferClock, run_add]
      have firstTwo :
          ThreeCounter.run (compileMachine machine) 2
              (runningState
                (address state (.left symbol (.restore neighbor))) target right
                (remaining + 1)) =
            runningState
              (address state (.left symbol (.restore neighbor))) (target + 1)
              right remaining := by
        simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
        have firstStep :
            ThreeCounter.step (compileMachine machine)
                (runningState
                  (address state (.left symbol (.restore neighbor))) target
                  right (remaining + 1)) =
              runningState
                (address state (.left symbol (.restoreIncrement neighbor)))
                target right remaining := by
          rw [step_at bounded]
          rfl
        have secondStep :
            ThreeCounter.step (compileMachine machine)
                (runningState
                  (address state (.left symbol (.restoreIncrement neighbor)))
                  target right remaining) =
              runningState
                (address state (.left symbol (.restore neighbor))) (target + 1)
                right remaining := by
          rw [step_at bounded]
          rfl
        rw [firstStep, secondStep]
      rw [firstTwo, ih]
      rfl

/-- Complete clock for a nonempty left-stack pop. -/
def leftPopClock (quotientBase : Nat) (neighbor : Bool) : Nat :=
  3 + (pairClock quotientBase neighbor + transferClock (quotientBase + 1))

/-- Exact nonempty left-stack pop. -/
theorem run_left_pop_nonempty {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (quotientBase : Nat)
    (symbol neighbor : Bool) (right : Nat) :
    ThreeCounter.run (compileMachine machine)
        (leftPopClock quotientBase neighbor)
        (runningState (address state (.left symbol .start))
          (StackCode.push neighbor (quotientBase + 1)) right 0) =
      runningState
        (address state (.push (.leftWrite symbol neighbor) .drain))
        (quotientBase + 1) right 0 := by
  rw [leftPopClock, run_add]
  have firstThree :
      ThreeCounter.run (compileMachine machine) 3
          (runningState (address state (.left symbol .start))
            (StackCode.push neighbor (quotientBase + 1)) right 0) =
        runningState (address state (.left symbol .pairFirst))
          (StackCode.push neighbor quotientBase) right 1 := by
    have firstStep :
        ThreeCounter.step (compileMachine machine)
            (runningState (address state (.left symbol .start))
              (StackCode.push neighbor (quotientBase + 1)) right 0) =
          runningState (address state (.left symbol .checkSentinel))
            (StackCode.push neighbor quotientBase + 1) right 0 := by
      cases neighbor <;> rw [step_at bounded] <;> rfl
    have secondStep :
        ThreeCounter.step (compileMachine machine)
            (runningState (address state (.left symbol .checkSentinel))
              (StackCode.push neighbor quotientBase + 1) right 0) =
          runningState (address state (.left symbol .incrementScratch))
            (StackCode.push neighbor quotientBase) right 0 := by
      cases neighbor <;> rw [step_at bounded] <;> rfl
    have thirdStep :
        ThreeCounter.step (compileMachine machine)
            (runningState (address state (.left symbol .incrementScratch))
              (StackCode.push neighbor quotientBase) right 0) =
          runningState (address state (.left symbol .pairFirst))
            (StackCode.push neighbor quotientBase) right 1 := by
      rw [step_at bounded]
      rfl
    simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
    rw [firstStep, secondStep, thirdStep]
  rw [firstThree, run_add, run_left_pairs bounded]
  rw [Nat.add_comm 1 quotientBase]
  rw [run_left_transfer bounded, transferValue_eq, Nat.zero_add]

/-- The sentinel-only empty left stack is restored before inserting the
implicit blank neighbor. -/
theorem run_left_pop_empty {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (symbol : Bool) (right : Nat) :
    ThreeCounter.run (compileMachine machine) 3
        (runningState (address state (.left symbol .start)) 1 right 0) =
      runningState
        (address state (.push (.leftWrite symbol false) .drain)) 1 right 0 := by
  simp only [ThreeCounter.run_succ, ThreeCounter.run_zero]
  have firstStep :
      ThreeCounter.step (compileMachine machine)
          (runningState (address state (.left symbol .start)) 1 right 0) =
        runningState (address state (.left symbol .checkSentinel)) 0 right 0 := by
    rw [step_at bounded]
    rfl
  have secondStep :
      ThreeCounter.step (compileMachine machine)
          (runningState (address state (.left symbol .checkSentinel)) 0 right 0) =
        runningState (address state (.left symbol .restoreEmpty)) 0 right 0 := by
    rw [step_at bounded]
    rfl
  have thirdStep :
      ThreeCounter.step (compileMachine machine)
          (runningState (address state (.left symbol .restoreEmpty)) 0 right 0) =
        runningState
          (address state (.push (.leftWrite symbol false) .drain)) 1 right 0 := by
    rw [step_at bounded]
    rfl
  rw [firstStep, secondStep, thirdStep]

/-! ## Source-rule dispatch and composed macrosteps -/

theorem state_lt_of_ruleFor_eq_some {machine : Machine} {state : Nat}
    {symbol : Bool} {rule : Rule}
    (selected : ruleFor machine state symbol = some rule) :
    state < machine.states.length := by
  unfold ruleFor DeterministicTape.ruleAt? at selected
  cases lookup : machine.states[state]? with
  | none => simp [lookup] at selected
  | some row =>
      exact (List.getElem?_eq_some_iff.mp lookup).1

theorem run_dispatch_stay {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (symbol tailEmpty : Bool)
    (rule : Rule) (selected : ruleFor machine state symbol = some rule)
    (move : rule.move = .stay) (left right : Nat) :
    ThreeCounter.run (compileMachine machine) 1
        (runningState (address state (.dispatch symbol tailEmpty)) left right 0) =
      runningState (address state (.push (.stay symbol) .drain)) left right 0 := by
  rw [ThreeCounter.run_succ, ThreeCounter.run_zero, step_at bounded]
  simp [instructionFor, selected, move, zeroGoto, runningState,
    ThreeCounter.execute, ThreeCounter.read]

theorem run_dispatch_left {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (symbol tailEmpty : Bool)
    (rule : Rule) (selected : ruleFor machine state symbol = some rule)
    (move : rule.move = .left) (left right : Nat) :
    ThreeCounter.run (compileMachine machine) 1
        (runningState (address state (.dispatch symbol tailEmpty)) left right 0) =
      runningState (address state (.left symbol .start)) left right 0 := by
  rw [ThreeCounter.run_succ, ThreeCounter.run_zero, step_at bounded]
  simp [instructionFor, selected, move, zeroGoto, runningState,
    ThreeCounter.execute, ThreeCounter.read]

theorem run_dispatch_right {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (symbol tailEmpty : Bool)
    (rule : Rule) (selected : ruleFor machine state symbol = some rule)
    (move : rule.move = .right) (left right : Nat) :
    ThreeCounter.run (compileMachine machine) 1
        (runningState (address state (.dispatch symbol tailEmpty)) left right 0) =
      runningState
        (address state (.push (.right symbol tailEmpty) .drain)) left right 0 := by
  rw [ThreeCounter.run_succ, ThreeCounter.run_zero, step_at bounded]
  simp [instructionFor, selected, move, zeroGoto, runningState,
    ThreeCounter.execute, ThreeCounter.read]

theorem pushBit_stay {machine : Machine} {state : Nat} {symbol : Bool}
    {rule : Rule} (selected : ruleFor machine state symbol = some rule) :
    pushBit machine state (.stay symbol) = rule.write := by
  simp [pushBit, pushSymbol, selected]

theorem pushBit_right {machine : Machine} {state : Nat} {symbol tail : Bool}
    {rule : Rule} (selected : ruleFor machine state symbol = some rule) :
    pushBit machine state (.right symbol tail) = rule.write := by
  simp [pushBit, pushSymbol, selected]

theorem pushBit_leftWrite {machine : Machine} {state : Nat}
    {symbol neighbor : Bool} {rule : Rule}
    (selected : ruleFor machine state symbol = some rule) :
    pushBit machine state (.leftWrite symbol neighbor) = rule.write := by
  simp [pushBit, pushSymbol, selected]

@[simp]
theorem pushBit_leftNeighbor (machine : Machine) (state : Nat)
    (symbol neighbor : Bool) :
    pushBit machine state (.leftNeighbor symbol neighbor) = neighbor := rfl

theorem run_push_stay {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (symbol : Bool) (rule : Rule)
    (selected : ruleFor machine state symbol = some rule) (left right : Nat) :
    ThreeCounter.run (compileMachine machine) (pushClock right rule.write)
        (runningState (address state (.push (.stay symbol) .drain))
          left right 0) =
      runningState (boundaryAddress rule.nextState) left
        (StackCode.push rule.write right) 0 := by
  have bitEq := pushBit_stay selected
  simpa [pushState, bitEq, finishAddress, selected] using
    run_push bounded (.stay symbol) right left

theorem run_push_right {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (symbol tailEmpty : Bool)
    (rule : Rule) (selected : ruleFor machine state symbol = some rule)
    (left right : Nat) :
    ThreeCounter.run (compileMachine machine) (pushClock left rule.write)
        (runningState
          (address state (.push (.right symbol tailEmpty) .drain)) left right 0) =
      runningState
        (if tailEmpty then address state (.rightBlank symbol)
          else boundaryAddress rule.nextState)
        (StackCode.push rule.write left) right 0 := by
  have bitEq := pushBit_right (tail := tailEmpty) selected
  simpa [pushState, bitEq, finishAddress, selected] using
    run_push bounded (.right symbol tailEmpty) left right

theorem run_push_leftWrite {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (symbol neighbor : Bool)
    (rule : Rule) (selected : ruleFor machine state symbol = some rule)
    (left right : Nat) :
    ThreeCounter.run (compileMachine machine) (pushClock right rule.write)
        (runningState
          (address state (.push (.leftWrite symbol neighbor) .drain))
          left right 0) =
      runningState
        (address state (.push (.leftNeighbor symbol neighbor) .drain))
        left (StackCode.push rule.write right) 0 := by
  have bitEq := pushBit_leftWrite (neighbor := neighbor) selected
  simpa [pushState, bitEq, finishAddress, selected] using
    run_push bounded (.leftWrite symbol neighbor) right left

theorem run_push_leftNeighbor {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (symbol neighbor : Bool)
    (rule : Rule) (selected : ruleFor machine state symbol = some rule)
    (left right : Nat) :
    ThreeCounter.run (compileMachine machine) (pushClock right neighbor)
        (runningState
          (address state (.push (.leftNeighbor symbol neighbor) .drain))
          left right 0) =
      runningState (boundaryAddress rule.nextState) left
        (StackCode.push neighbor right) 0 := by
  simpa [pushState, finishAddress, selected] using
    run_push bounded (.leftNeighbor symbol neighbor) right left

theorem run_rightBlank {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (symbol : Bool) (rule : Rule)
    (selected : ruleFor machine state symbol = some rule) (left right : Nat) :
    ThreeCounter.run (compileMachine machine) 1
        (runningState (address state (.rightBlank symbol)) left right 0) =
      runningState (boundaryAddress rule.nextState) left (right + 1) 0 := by
  rw [ThreeCounter.run_succ, ThreeCounter.run_zero, step_at bounded]
  simp [instructionFor, selected, runningState, ThreeCounter.execute,
    ThreeCounter.read, ThreeCounter.write]

/-- Every encoded physical stack is a successor. -/
theorem exists_encode_eq_succ (values : List Bool) :
    exists base, StackCode.encode values = base + 1 := by
  cases encodedEq : StackCode.encode values with
  | zero => exact False.elim (Nat.not_lt_zero 0 (encodedEq ▸ StackCode.encode_pos values))
  | succ base => exact ⟨base, rfl⟩

theorem encode_eq_one_iff_nil (values : List Bool) :
    StackCode.encode values = 1 <-> values = [] := by
  constructor
  · intro encoded
    cases values with
    | nil => rfl
    | cons value rest =>
        exact False.elim (StackCode.encode_cons_ne_one value rest encoded)
  · intro emptyEq
    rw [emptyEq]
    rfl

/-! ## Complete source macrosteps -/

/-- The sentinel-free part of an encoded physical stack.  Its defining
equation makes the positivity invariant computational rather than a premise. -/
def stackBase : List Bool -> Nat
  | [] => 0
  | false :: rest => 2 * stackBase rest + 1
  | true :: rest => 2 * stackBase rest + 2

@[simp]
theorem encode_eq_stackBase_add_one (values : List Bool) :
    StackCode.encode values = stackBase values + 1 := by
  induction values with
  | nil => rfl
  | cons value rest ih =>
      cases value <;>
        simp only [StackCode.encode, StackCode.bit, stackBase, ih]
      all_goals rw [Nat.mul_add]
      all_goals simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- Executable observation of whether a physical stack is empty. -/
def stackEmpty : List Bool -> Bool
  | [] => true
  | _ :: _ => false

@[simp]
theorem decide_stackBase_eq_zero (values : List Bool) :
    decide (stackBase values = 0) = stackEmpty values := by
  cases values with
  | nil => decide
  | cons value rest => cases value <;> simp [stackBase, stackEmpty]

/-- The right-pop helper specialized to the canonical encoding of a physical
tail. -/
theorem run_right_pop_list {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (tail : List Bool)
    (symbol : Bool) (left : Nat) :
    ThreeCounter.run (compileMachine machine)
        (rightPopClock (stackBase tail) symbol)
        (runningState (boundaryAddress state) left
          (StackCode.encode (symbol :: tail)) 0) =
      runningState (address state (.dispatch symbol (stackEmpty tail))) left
        (StackCode.encode tail) 0 := by
  rw [StackCode.encode_cons, encode_eq_stackBase_add_one]
  simpa only [decide_stackBase_eq_zero] using
    run_right_pop bounded (stackBase tail) symbol left

/-- Microticks for the optional physical left-stack pop. -/
def leftStageClock : List Bool -> Nat
  | [] => 3
  | neighbor :: leftTail => leftPopClock (stackBase leftTail) neighbor

/-- Physical neighbor supplied by a left move, with an implicit blank at the
left boundary. -/
def leftNeighbor : List Bool -> Bool
  | [] => false
  | neighbor :: _ => neighbor

/-- Physical tail left behind by a left move. -/
def leftRemainder : List Bool -> List Bool
  | [] => []
  | _ :: leftTail => leftTail

/-- Exact optional left-pop helper on a canonical physical stack. -/
theorem run_left_stage {machine : Machine} {state : Nat}
    (bounded : state < machine.states.length) (left : List Bool)
    (symbol : Bool) (right : Nat) :
    ThreeCounter.run (compileMachine machine) (leftStageClock left)
        (runningState (address state (.left symbol .start))
          (StackCode.encode left) right 0) =
      runningState
        (address state
          (.push (.leftWrite symbol (leftNeighbor left)) .drain))
        (StackCode.encode (leftRemainder left)) right 0 := by
  cases left with
  | nil => simpa [leftStageClock, leftNeighbor, leftRemainder] using!
      run_left_pop_empty bounded symbol right
  | cons neighbor leftTail =>
      rw [leftStageClock, StackCode.encode_cons,
        encode_eq_stackBase_add_one]
      simpa [leftNeighbor, leftRemainder,
        encode_eq_stackBase_add_one] using
        run_left_pop_nonempty bounded (stackBase leftTail) symbol neighbor right

/-- Final blank-restoration cost of a right move. -/
def rightBlankClock : List Bool -> Nat
  | [] => 1
  | _ :: _ => 0

/-- Exact, data-dependent primitive clock for one defined source
transition. -/
def liveMacroClock (left tail : List Bool) (symbol : Bool) (rule : Rule) : Nat :=
  rightPopClock (stackBase tail) symbol +
    (1 + match rule.move with
      | .stay => pushClock (StackCode.encode tail) rule.write
      | .left =>
          leftStageClock left +
            (pushClock (StackCode.encode tail) rule.write +
              pushClock
                (StackCode.push rule.write (StackCode.encode tail))
                (leftNeighbor left))
      | .right =>
          pushClock (StackCode.encode left) rule.write +
            rightBlankClock tail)

/-- One defined deterministic-tape transition is implemented by an exact
finite primitive run between canonical macro boundaries. -/
theorem run_live_macro {machine : Machine} {state : Nat}
    (left tail : List Bool) (symbol : Bool) (rule : Rule)
    (selected : ruleFor machine state symbol = some rule) :
    ThreeCounter.run (compileMachine machine)
        (liveMacroClock left tail symbol rule)
        (boundaryState (configurationOf state left (symbol :: tail))) =
      boundaryState (configurationOf rule.nextState
        (afterRule left tail rule).1 (afterRule left tail rule).2) := by
  have bounded := state_lt_of_ruleFor_eq_some selected
  cases rule with
  | mk write move nextState =>
      cases move with
      | stay =>
          rw [liveMacroClock, run_add]
          simp only [boundaryState, configurationOf]
          rw [run_right_pop_list bounded]
          rw [run_add]
          rw [run_dispatch_stay bounded symbol (stackEmpty tail)
            { write := write, move := .stay, nextState := nextState }
            selected rfl]
          rw [run_push_stay bounded symbol
            { write := write, move := .stay, nextState := nextState }
            selected]
          rfl
      | left =>
          rw [liveMacroClock, run_add]
          simp only [boundaryState, configurationOf]
          rw [run_right_pop_list bounded]
          rw [run_add]
          rw [run_dispatch_left bounded symbol (stackEmpty tail)
            { write := write, move := .left, nextState := nextState }
            selected rfl]
          rw [run_add]
          rw [run_left_stage bounded]
          rw [run_add]
          rw [run_push_leftWrite bounded symbol (leftNeighbor left)
            { write := write, move := .left, nextState := nextState }
            selected]
          rw [run_push_leftNeighbor bounded symbol (leftNeighbor left)
            { write := write, move := .left, nextState := nextState }
            selected]
          cases left <;> rfl
      | right =>
          rw [liveMacroClock, run_add]
          simp only [boundaryState, configurationOf]
          rw [run_right_pop_list bounded]
          rw [run_add]
          rw [run_dispatch_right bounded symbol (stackEmpty tail)
            { write := write, move := .right, nextState := nextState }
            selected rfl]
          rw [run_add]
          rw [run_push_right bounded symbol (stackEmpty tail)
            { write := write, move := .right, nextState := nextState }
            selected]
          cases tail with
          | nil =>
              rw [rightBlankClock]
              simp only [stackEmpty, if_true]
              rw [run_rightBlank bounded symbol
                { write := write, move := .right, nextState := nextState }
                selected]
              rfl
          | cons neighbor rightTail =>
              rw [rightBlankClock, ThreeCounter.run_zero]
              simp only [stackEmpty, if_false]
              rfl

theorem liveMacroClock_pos (left tail : List Bool) (symbol : Bool)
    (rule : Rule) : 0 < liveMacroClock left tail symbol rule := by
  unfold liveMacroClock
  let cost := match rule.move with
    | .stay => pushClock (StackCode.encode tail) rule.write
    | .left =>
        leftStageClock left +
          (pushClock (StackCode.encode tail) rule.write +
            pushClock (StackCode.push rule.write (StackCode.encode tail))
              (leftNeighbor left))
    | .right =>
        pushClock (StackCode.encode left) rule.write + rightBlankClock tail
  have costPos : 0 < 1 + cost := by
    rw [Nat.add_comm]
    exact Nat.zero_lt_succ cost
  exact Nat.lt_of_lt_of_le costPos (Nat.le_add_left _ _)

/-! ## Primitive halting and prefix safety -/

/-- Lookup beyond a literal finite table yields the explicit halt command. -/
theorem instructionAt_eq_halt_of_length_le
    (program : ThreeCounter.Program) (label : Nat)
    (outside : program.length <= label) :
    ThreeCounter.instructionAt program label = .halt := by
  induction program generalizing label with
  | nil => rfl
  | cons instruction rest ih =>
      cases label with
      | zero =>
          exact False.elim (Nat.not_succ_le_zero rest.length outside)
      | succ label =>
          exact ih label (Nat.le_of_succ_le_succ outside)

/-- A running configuration whose control is at or beyond the compiled table
halts in one literal primitive step. -/
theorem step_outside {machine : Machine} (configuration : ThreeCounter.State)
    (running : configuration.status = .running)
    (outside : haltAddress machine <= configuration.control) :
    ThreeCounter.step (compileMachine machine) configuration =
      { configuration with status := .halted } := by
  unfold ThreeCounter.step
  rw [running]
  rw [instructionAt_eq_halt_of_length_le _ _
    (compileMachine_length machine ▸ outside)]
  rfl

/-- Executable clock to the first primitive halt from an undefined source
boundary, including out-of-table source controls. -/
def haltMacroClock (machine : Machine) (state : Nat) (tail : List Bool)
    (symbol : Bool) : Nat :=
  if state < machine.states.length then
    rightPopClock (stackBase tail) symbol + 1
  else
    1

/-- An undefined source transition reaches the absorbing primitive halt
status at the exact executable clock. -/
theorem run_halt_macro {machine : Machine} {state : Nat}
    (left tail : List Bool) (symbol : Bool)
    (selected : ruleFor machine state symbol = none) :
    (ThreeCounter.run (compileMachine machine)
      (haltMacroClock machine state tail symbol)
      (boundaryState (configurationOf state left (symbol :: tail)))).status =
        .halted := by
  by_cases bounded : state < machine.states.length
  · rw [haltMacroClock, if_pos bounded, run_add]
    simp only [boundaryState, configurationOf]
    rw [run_right_pop_list bounded]
    rw [ThreeCounter.run_succ, ThreeCounter.run_zero]
    rw [step_at bounded]
    simp [instructionFor, selected, runningState, ThreeCounter.execute]
  · rw [haltMacroClock, if_neg bounded, ThreeCounter.run_succ,
      ThreeCounter.run_zero]
    have outside : haltAddress machine <= boundaryAddress state := by
      have mulLe := Nat.mul_le_mul_right phaseCount
        (Nat.le_of_not_gt bounded)
      simpa [boundaryAddress, address, haltAddress] using! mulLe
    unfold boundaryState configurationOf
    have outsideStep := step_outside (machine := machine)
      (runningState (boundaryAddress state) (StackCode.encode left)
        (StackCode.encode (symbol :: tail)) 0) rfl outside
    rw [outsideStep]

@[simp]
theorem step_halted (program : ThreeCounter.Program)
    (configuration : ThreeCounter.State)
    (halted : configuration.status = .halted) :
    ThreeCounter.step program configuration = configuration := by
  unfold ThreeCounter.step
  rw [halted]

/-- The explicit primitive halt status is absorbing for every finite run. -/
theorem run_halted (program : ThreeCounter.Program) (fuel : Nat)
    (configuration : ThreeCounter.State)
    (halted : configuration.status = .halted) :
    ThreeCounter.run program fuel configuration = configuration := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      rw [ThreeCounter.run_succ, ih, step_halted program configuration halted]

theorem status_eq_halted_of_ne_running (status : ThreeCounter.Status)
    (notRunning : status ≠ .running) : status = .halted := by
  cases status with
  | running => exact False.elim (notRunning rfl)
  | halted => rfl

theorem status_running_or_halted (status : ThreeCounter.Status) :
    status = .running ∨ status = .halted := by
  cases status with
  | running => exact Or.inl rfl
  | halted => exact Or.inr rfl

/-- A running exact endpoint reflects running status to every earlier run
prefix. -/
theorem running_prefix_of_running_endpoint
    (program : ThreeCounter.Program) (initial : ThreeCounter.State)
    (total prefixFuel : Nat) (prefixLe : prefixFuel <= total)
    (endpoint : (ThreeCounter.run program total initial).status = .running) :
    (ThreeCounter.run program prefixFuel initial).status = .running := by
  have split : prefixFuel + (total - prefixFuel) = total :=
    Nat.add_sub_of_le prefixLe
  rcases status_running_or_halted
      (ThreeCounter.run program prefixFuel initial).status with
    prefixStatus | prefixStatus
  · exact prefixStatus
  · have fixed := run_halted program (total - prefixFuel)
      (ThreeCounter.run program prefixFuel initial) prefixStatus
    rw [← split, run_add, fixed, prefixStatus] at endpoint
    cases endpoint

/-- Every prefix, including the endpoint, of a defined source macro remains
in the running primitive status. -/
theorem run_live_macro_prefix_running {machine : Machine} {state : Nat}
    (left tail : List Bool) (symbol : Bool) (rule : Rule)
    (selected : ruleFor machine state symbol = some rule)
    (prefixFuel : Nat)
    (prefixLe : prefixFuel <= liveMacroClock left tail symbol rule) :
    (ThreeCounter.run (compileMachine machine) prefixFuel
      (boundaryState (configurationOf state left (symbol :: tail)))).status =
        .running := by
  apply running_prefix_of_running_endpoint _ _ _ _ prefixLe
  rw [run_live_macro left tail symbol rule selected]
  rfl

/-- Strict-prefix spelling of `run_live_macro_prefix_running`. -/
theorem run_live_macro_strict_prefix_ne_halted {machine : Machine}
    {state : Nat} (left tail : List Bool) (symbol : Bool) (rule : Rule)
    (selected : ruleFor machine state symbol = some rule)
    (prefixFuel : Nat)
    (prefixLt : prefixFuel < liveMacroClock left tail symbol rule) :
    (ThreeCounter.run (compileMachine machine) prefixFuel
      (boundaryState (configurationOf state left (symbol :: tail)))).status ≠
        .halted := by
  rw [run_live_macro_prefix_running left tail symbol rule selected prefixFuel
    (Nat.le_of_lt prefixLt)]
  decide

/-! ## Exact finite source runs -/

/-- Every successful finite deterministic-tape run has an exact primitive
three-counter run between related canonical boundaries.  The primitive clock
is produced by the proof and records the literal data-dependent loop costs. -/
theorem runFor?_some_exact (machine : Machine) (fuel : Nat)
    {row finalRow : DeterministicTape.Row}
    {configuration : StackCounter.Configuration}
    (represents : Represents row configuration)
    (sourceRun : DeterministicTape.runFor? machine row fuel = some finalRow) :
    exists finalConfiguration primitiveFuel,
      Represents finalRow finalConfiguration /\
      ThreeCounter.run (compileMachine machine) primitiveFuel
        (boundaryState configuration) = boundaryState finalConfiguration := by
  induction fuel generalizing row configuration finalRow with
  | zero =>
      rw [DeterministicTape.runFor?] at sourceRun
      cases sourceRun
      exact ⟨configuration, 0, represents, rfl⟩
  | succ fuel ih =>
      rcases represents with
        ⟨state, left, right, rightNonempty, rfl, rfl⟩
      cases right with
      | nil => exact False.elim (rightNonempty rfl)
      | cons symbol tail =>
          cases selected : ruleFor machine state symbol with
          | none =>
              have sourceStep := source_step?_rowOf_none machine state left
                tail symbol selected
              rw [DeterministicTape.runFor?, sourceStep] at sourceRun
              contradiction
          | some rule =>
              have sourceStep := source_step?_rowOf machine state left tail
                symbol rule selected
              rw [DeterministicTape.runFor?, sourceStep] at sourceRun
              have nextRepresents :
                  Represents
                    (rowOf rule.nextState (afterRule left tail rule).1
                      (afterRule left tail rule).2)
                    (configurationOf rule.nextState
                      (afterRule left tail rule).1
                      (afterRule left tail rule).2) := by
                exact ⟨rule.nextState, (afterRule left tail rule).1,
                  (afterRule left tail rule).2,
                  afterRule_right_ne_nil left tail rule, rfl, rfl⟩
              obtain ⟨finalConfiguration, primitiveFuel,
                  finalRepresents, primitiveRun⟩ :=
                ih nextRepresents sourceRun
              refine ⟨finalConfiguration,
                liveMacroClock left tail symbol rule + primitiveFuel,
                finalRepresents, ?_⟩
              rw [run_add, run_live_macro left tail symbol rule selected,
                primitiveRun]

/-! ## Halting preservation and reflection -/

/-- A deterministic-tape halting witness compiles to a literal primitive
three-counter halting witness. -/
theorem threeCounterHalts_of_halts (source : DeterministicTape.Instance) :
    DeterministicTape.Halts source ->
      ThreeCounter.Halts (compileMachine source.machine)
        (compileInitial source) := by
  rintro ⟨sourceFuel, finalRow, sourceRun, sourceHalt⟩
  obtain ⟨finalConfiguration, primitiveFuel,
      finalRepresents, primitiveRun⟩ :=
    runFor?_some_exact source.machine sourceFuel
      (initial_represents source) sourceRun
  rcases finalRepresents with
    ⟨state, left, right, rightNonempty, rfl, rfl⟩
  cases right with
  | nil => exact False.elim (rightNonempty rfl)
  | cons symbol tail =>
      cases selected : ruleFor source.machine state symbol with
      | some rule =>
          have sourceStep := source_step?_rowOf source.machine state left tail
            symbol rule selected
          rw [sourceStep] at sourceHalt
          contradiction
      | none =>
          refine ⟨primitiveFuel +
            haltMacroClock source.machine state tail symbol, ?_⟩
          unfold compileInitial
          rw [run_add, primitiveRun]
          exact run_halt_macro left tail symbol selected

/-- Any primitive halt reachable from a related macro boundary reflects an
undefined deterministic-tape transition at some source boundary. -/
theorem sourceHalts_of_run_halted (machine : Machine) (primitiveFuel : Nat) :
    forall {row : DeterministicTape.Row}
      {configuration : StackCounter.Configuration},
      Represents row configuration ->
      (ThreeCounter.run (compileMachine machine) primitiveFuel
        (boundaryState configuration)).status = .halted ->
      exists sourceFuel finalRow,
        DeterministicTape.runFor? machine row sourceFuel = some finalRow /\
        DeterministicTape.step? machine finalRow = none := by
  induction primitiveFuel using Nat.strongRecOn with
  | ind primitiveFuel ih =>
      intro row configuration represents targetHalt
      rcases represents with
        ⟨state, left, right, rightNonempty, rfl, rfl⟩
      cases right with
      | nil => exact False.elim (rightNonempty rfl)
      | cons symbol tail =>
          cases selected : ruleFor machine state symbol with
          | none =>
              refine ⟨0, rowOf state left (symbol :: tail), rfl, ?_⟩
              exact source_step?_rowOf_none machine state left tail symbol
                selected
          | some rule =>
              let macroFuel := liveMacroClock left tail symbol rule
              by_cases inside : primitiveFuel < macroFuel
              · have running := run_live_macro_prefix_running left tail symbol
                    rule selected primitiveFuel (Nat.le_of_lt inside)
                rw [targetHalt] at running
                cases running
              · have macroLe : macroFuel <= primitiveFuel :=
                  Nat.le_of_not_gt inside
                have macroPos : 0 < macroFuel :=
                  liveMacroClock_pos left tail symbol rule
                have primitivePos : 0 < primitiveFuel :=
                  Nat.lt_of_lt_of_le macroPos macroLe
                let remaining := primitiveFuel - macroFuel
                have remainingLt : remaining < primitiveFuel := by
                  exact Nat.sub_lt primitivePos macroPos
                have split : macroFuel + remaining = primitiveFuel := by
                  exact Nat.add_sub_of_le macroLe
                have nextHalt :
                    (ThreeCounter.run (compileMachine machine) remaining
                      (boundaryState (configurationOf rule.nextState
                        (afterRule left tail rule).1
                        (afterRule left tail rule).2))).status = .halted := by
                  rw [← split, run_add,
                    run_live_macro left tail symbol rule selected] at targetHalt
                  exact targetHalt
                have nextRepresents :
                    Represents
                      (rowOf rule.nextState (afterRule left tail rule).1
                        (afterRule left tail rule).2)
                      (configurationOf rule.nextState
                        (afterRule left tail rule).1
                        (afterRule left tail rule).2) := by
                  exact ⟨rule.nextState, (afterRule left tail rule).1,
                    (afterRule left tail rule).2,
                    afterRule_right_ne_nil left tail rule, rfl, rfl⟩
                obtain ⟨sourceFuel, finalRow, sourceRun, sourceHalt⟩ :=
                  ih remaining remainingLt nextRepresents nextHalt
                refine ⟨sourceFuel + 1, finalRow, ?_, sourceHalt⟩
                rw [DeterministicTape.runFor?]
                have sourceStep := source_step?_rowOf machine state left tail
                  symbol rule selected
                rw [sourceStep]
                exact sourceRun

/-- Primitive three-counter halting reflects deterministic-tape halting from
the compiler's literal initialized state. -/
theorem halts_of_threeCounterHalts (source : DeterministicTape.Instance) :
    ThreeCounter.Halts (compileMachine source.machine) (compileInitial source) ->
      DeterministicTape.Halts source := by
  rintro ⟨primitiveFuel, targetHalt⟩
  unfold compileInitial at targetHalt
  exact sourceHalts_of_run_halted source.machine primitiveFuel
    (initial_represents source) targetHalt

/-- The premise-free executable compiler preserves and reflects halting
exactly. -/
theorem halts_iff_threeCounterHalts (source : DeterministicTape.Instance) :
    DeterministicTape.Halts source <->
      ThreeCounter.Halts (compileMachine source.machine)
        (compileInitial source) :=
  ⟨threeCounterHalts_of_halts source, halts_of_threeCounterHalts source⟩

end Execution

end PureSFormal.Computation.DeterministicTapeThreeCounterCompiler
