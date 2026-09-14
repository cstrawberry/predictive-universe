/-!
# Primitive deterministic three-counter machines

This module fixes the small target language used by the deterministic-tape
compiler.  Its only mutating commands are one-register increment and
decrement-with-zero-branch.  A finite list is the complete program; a missing
label has the same absorbing halting meaning as an explicit `halt` command.
-/

namespace PureSFormal.Computation.ThreeCounter

/-- The three unbounded primitive registers. -/
inductive Register where
  | left
  | right
  | scratch
  deriving DecidableEq, Repr

/-- Primitive commands with explicit finite-control successors. -/
inductive Instruction where
  | increment (register : Register) (next : Nat)
  | decrementJump (register : Register) (positive zeroNext : Nat)
  | halt
  deriving DecidableEq, Repr

/-- A complete finite instruction table indexed by natural labels. -/
abbrev Program := List Instruction

/-- Falling outside the finite table halts. -/
def instructionAt : Program -> Nat -> Instruction
  | [], _ => .halt
  | instruction :: _, 0 => instruction
  | _ :: rest, label + 1 => instructionAt rest label

/-- Explicit absorbing control status. -/
inductive Status where
  | running
  | halted
  deriving DecidableEq, Repr

/-- Complete primitive three-counter configuration. -/
structure State where
  control : Nat
  left : Nat
  right : Nat
  scratch : Nat
  status : Status
  deriving DecidableEq, Repr

/-- Read one primitive register. -/
def read (state : State) : Register -> Nat
  | .left => state.left
  | .right => state.right
  | .scratch => state.scratch

/-- Replace one primitive register. -/
def write (state : State) : Register -> Nat -> State
  | .left, value => { state with left := value }
  | .right, value => { state with right := value }
  | .scratch, value => { state with scratch := value }

/-- One total primitive transition. -/
def execute (instruction : Instruction) (state : State) : State :=
  match instruction with
  | .halt => { state with status := .halted }
  | .increment register next =>
      { write state register (read state register + 1) with control := next }
  | .decrementJump register positive zeroNext =>
      match read state register with
      | 0 => { state with control := zeroNext }
      | value + 1 => { write state register value with control := positive }

/-- One total primitive transition. -/
def step (program : Program) (state : State) : State :=
  match state.status with
  | .halted => state
  | .running => execute (instructionAt program state.control) state

/-- Execute exactly `fuel` primitive transitions. -/
def run (program : Program) : Nat -> State -> State
  | 0, state => state
  | fuel + 1, state => step program (run program fuel state)

@[simp]
theorem run_zero (program : Program) (state : State) :
    run program 0 state = state := rfl

@[simp]
theorem run_succ (program : Program) (fuel : Nat) (state : State) :
    run program (fuel + 1) state = step program (run program fuel state) :=
  rfl

/-- Finite reachability of the absorbing halting status. -/
def Halts (program : Program) (initial : State) : Prop :=
  exists fuel, (run program fuel initial).status = .halted

/-- One finite program together with its complete initialized registers. -/
structure Job where
  program : Program
  initial : State
  deriving DecidableEq, Repr

/-- Universal primitive three-counter halting. -/
def UniversalHalts (job : Job) : Prop :=
  Halts job.program job.initial

end PureSFormal.Computation.ThreeCounter
