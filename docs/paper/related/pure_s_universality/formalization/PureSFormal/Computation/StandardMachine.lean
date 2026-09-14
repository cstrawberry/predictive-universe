import PureSFormal.Computation.Enumerable

/-!
# Finite two-register syntax and its natural bytecode compiler

This source machine is a finite list syntax with its own registers, commands,
states, transition function, and acceptance predicate.  `compile` translates
it to the prefix-tokenized natural bytecode of `NatMachine`.  The representation
invariant and step, run, and acceptance preservation theorems below are all
unconditional.
-/

namespace PureSFormal.Computation

namespace StandardMachine

/-- Registers of the independent finite source syntax. -/
inductive Register where
  | first
  | second
  deriving DecidableEq, Repr

/-- Conventional deterministic two-register source instructions. -/
inductive Command where
  | increment (register : Register) (next : Nat)
  | decrementJump (register : Register) (positive zeroNext : Nat)
  | accept
  | reject
  deriving DecidableEq, Repr

/-- A finite source transition table. -/
abbrev Program := List Command

/-- Lookup outside the finite source table rejects. -/
def instructionAt : Program → Nat → Command
  | [], _ => .reject
  | command :: _, 0 => command
  | _ :: rest, counter + 1 => instructionAt rest counter

/-- Source control status, distinct from the target interpreter status. -/
inductive Status where
  | running
  | accepted
  | rejected
  deriving DecidableEq, Repr

/-- Complete source state. -/
structure State where
  counter : Nat
  first : Nat
  second : Nat
  status : Status
  deriving DecidableEq, Repr

/-- Load the input in the first source register. -/
def initial (input : Nat) : State :=
  ⟨0, input, 0, .running⟩

/-- Read a source register. -/
def read (state : State) : Register → Nat
  | .first => state.first
  | .second => state.second

/-- Replace a source register. -/
def write (state : State) : Register → Nat → State
  | .first, value => { state with first := value }
  | .second, value => { state with second := value }

/-- One total source transition. -/
def step (program : Program) (state : State) : State :=
  match state.status with
  | .accepted => state
  | .rejected => state
  | .running =>
      match instructionAt program state.counter with
      | .accept => { state with status := .accepted }
      | .reject => { state with status := .rejected }
      | .increment register next =>
          { write state register (read state register + 1) with
            counter := next }
      | .decrementJump register positive zeroNext =>
          match read state register with
          | 0 => { state with counter := zeroNext }
          | value + 1 =>
              { write state register value with counter := positive }

/-- Execute exactly `fuel` source steps. -/
def run (program : Program) : Nat → State → State
  | 0, state => state
  | fuel + 1, state => step program (run program fuel state)

@[simp]
theorem run_zero (program : Program) (state : State) :
    run program 0 state = state := rfl

@[simp]
theorem run_succ (program : Program) (fuel : Nat) (state : State) :
    run program (fuel + 1) state = step program (run program fuel state) :=
  rfl

/-- Executable source acceptance test at a fixed horizon. -/
def acceptsWithin (program : Program) (input fuel : Nat) : Bool :=
  match (run program fuel (initial input)).status with
  | .accepted => true
  | _ => false

/-- Source acceptance is witnessed by a finite execution horizon. -/
def Accepts (program : Program) (input : Nat) : Prop :=
  ∃ fuel, acceptsWithin program input fuel = true

/-! ## Executable compiler and representation invariant -/

/-- Compile a source register to the target bytecode register. -/
def compileRegister : Register → NatMachine.Register
  | .first => .first
  | .second => .second

/-- Compile one finite-syntax command. -/
def compileCommand : Command → NatMachine.Instruction
  | .increment register next =>
      .increment (compileRegister register) next
  | .decrementJump register positive zeroNext =>
      .decrementJump (compileRegister register) positive zeroNext
  | .accept => .accept
  | .reject => .reject

/-- Compile the entire finite source table. -/
def compileProgram (program : Program) : NatMachine.Program :=
  program.map compileCommand

/-- Compile finite syntax to its canonical executable natural bytecode. -/
def compile (program : Program) : Nat :=
  NatMachine.encodeProgram (compileProgram program)

/-- Compile source status to target status. -/
def compileStatus : Status → NatMachine.Status
  | .running => .running
  | .accepted => .accepted
  | .rejected => .rejected

/-- Exact state representation at every instruction boundary. -/
def compileState (state : State) : NatMachine.State :=
  ⟨state.counter, state.first, state.second, compileStatus state.status⟩

/-- Explicit source/target representation invariant. -/
def Represents (source : State) (target : NatMachine.State) : Prop :=
  target = compileState source

/-- Initial states satisfy the representation invariant. -/
theorem initial_represents (input : Nat) :
    Represents (initial input) (NatMachine.initial input) :=
  rfl

/-- The natural decoder recovers the compiled source table exactly. -/
theorem decode_compile (program : Program) :
    NatMachine.decodeProgram (compile program) =
      some (compileProgram program) := by
  unfold compile
  exact NatMachine.decodeProgram_encode (compileProgram program)

/-- Compiled finite lookup agrees with source lookup at every label. -/
theorem lookup_compile (program : Program) (counter : Nat) :
    NatMachine.lookup (compileProgram program) counter =
      compileCommand (instructionAt program counter) := by
  induction counter generalizing program with
  | zero => cases program <;> rfl
  | succ counter ih =>
      cases program with
      | nil => rfl
      | cons command rest => exact ih rest

/-- Natural bytecode lookup is exactly compiled source lookup. -/
theorem instructionAt_compile (program : Program) (counter : Nat) :
    NatMachine.instructionAt (compile program) counter =
      compileCommand (instructionAt program counter) := by
  unfold compile
  rw [NatMachine.instructionAt_encode]
  exact lookup_compile program counter

/-- Register reads commute with state representation. -/
theorem read_compileState (state : State) (register : Register) :
    NatMachine.read (compileState state) (compileRegister register) =
      read state register := by
  cases register <;> rfl

/-- Register writes commute with state representation. -/
theorem write_compileState (state : State) (register : Register)
    (value : Nat) :
    NatMachine.write (compileState state) (compileRegister register) value =
      compileState (write state register value) := by
  cases register <;> rfl

/-- One source step is exactly one target bytecode step. -/
theorem step_compile (program : Program) (state : State) :
    NatMachine.step (compile program) (compileState state) =
      compileState (step program state) := by
  cases state with
  | mk counter first second status =>
      cases status with
      | accepted => rfl
      | rejected => rfl
      | running =>
          unfold NatMachine.step step compileState compileStatus
          rw [instructionAt_compile]
          cases hcommand : instructionAt program counter with
          | accept => rfl
          | reject => rfl
          | increment register next => cases register <;> rfl
          | decrementJump register positive zeroNext =>
              cases register <;> cases first <;> cases second <;> rfl

/-- Every bounded source run is represented by the equal-length target run. -/
theorem run_compile (program : Program) (fuel : Nat) (state : State) :
    NatMachine.run (compile program) fuel (compileState state) =
      compileState (run program fuel state) := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      rw [NatMachine.run_succ, run_succ, ih, step_compile]

/-- The compiler preserves every bounded acceptance observation. -/
theorem acceptsWithin_compile (program : Program) (input fuel : Nat) :
    NatMachine.acceptsWithin (compile program) input fuel =
      acceptsWithin program input fuel := by
  unfold NatMachine.acceptsWithin acceptsWithin
  have hrun := run_compile program fuel (initial input)
  rw [show NatMachine.initial input = compileState (initial input) from rfl]
  rw [hrun]
  cases hstatus : (run program fuel (initial input)).status <;>
    simp [compileState, compileStatus, hstatus]

/-- The executable natural-bytecode compiler preserves acceptance exactly. -/
theorem accepts_compile (program : Program) (input : Nat) :
    NatMachine.Accepts (compile program) input ↔ Accepts program input := by
  unfold NatMachine.Accepts Accepts
  constructor
  · rintro ⟨fuel, haccepts⟩
    exact ⟨fuel, (acceptsWithin_compile program input fuel).symm.trans haccepts⟩
  · rintro ⟨fuel, haccepts⟩
    exact ⟨fuel, (acceptsWithin_compile program input fuel).trans haccepts⟩

/-! ## Model-relative universal acceptance -/

/-- A natural predicate recognized by one finite source table. -/
def Recognizable (predicate : Nat → Prop) : Prop :=
  ∃ program : Program, ∀ input, predicate input ↔ Accepts program input

/-- Hardness for predicates recognized by the independent finite syntax. -/
def Hard {Target : Type} (target : Target → Prop) : Prop :=
  ∀ source : Nat → Prop,
    Recognizable source → ManyOneReduces source target

/-- Source-model completeness with an executable target test. -/
def Complete {Target : Type} (target : Target → Prop) : Prop :=
  BoundedlySemidecidable target ∧ Hard target

/-- A finite source program paired with its input. -/
structure UniversalInput where
  program : Program
  input : Nat
  deriving DecidableEq, Repr

/-- Universal acceptance for the independent finite source machine. -/
def UniversalAccepts (job : UniversalInput) : Prop :=
  Accepts job.program job.input

theorem universalAccepts_semidecidable :
    BoundedlySemidecidable UniversalAccepts := by
  exact ⟨fun job fuel => acceptsWithin job.program job.input fuel,
    fun _ => Iff.rfl⟩

theorem universalAccepts_hard : Hard UniversalAccepts := by
  intro predicate recognizable
  rcases recognizable with ⟨program, recognizes⟩
  exact ⟨fun input => ⟨program, input⟩, recognizes⟩

theorem universalAccepts_complete : Complete UniversalAccepts :=
  ⟨universalAccepts_semidecidable, universalAccepts_hard⟩

/-- Compile a finite source job to a natural-bytecode job. -/
def compileUniversalInput (job : UniversalInput) : NatMachine.UniversalInput :=
  ⟨compile job.program, job.input⟩

/-- Universal job compilation preserves acceptance. -/
theorem compileUniversalInput_correct (job : UniversalInput) :
    UniversalAccepts job ↔
      NatMachine.UniversalAccepts (compileUniversalInput job) :=
  (accepts_compile job.program job.input).symm

/-- Natural universal acceptance is hard for every finite-source predicate. -/
theorem natMachineUniversal_hard :
    Hard NatMachine.UniversalAccepts := by
  intro predicate recognizable
  exact ManyOneReduces.trans
    (universalAccepts_hard predicate recognizable)
    ⟨compileUniversalInput, compileUniversalInput_correct⟩

end StandardMachine

end PureSFormal.Computation
