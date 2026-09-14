import PureSFormal.Computation.CounterMachine

/-!
# Exponentially initialized two-counter bounded-run interface

`BoundedSigmaOne` contains a separate copy of the finite two-counter
instruction syntax.  The natural input `n` is presented to its evaluator as
`2^n`; a supplied witness is the number of execution steps, and membership is
the existence of a witness whose bounded run accepts.

The state space, transition function, and bounded evaluator are defined
separately from `CounterMachine` and `NatMachine`.  Total
instruction-for-instruction translations in both directions prove exact
equivalence with `CounterMachine` under the same exponential initialization.
The conventional c.e. interpretation uses the external universality theorem
for that exponentially initialized model.
-/

namespace PureSFormal.Computation

namespace BoundedSigmaOne

/-- Registers in the bounded-run two-counter syntax. -/
inductive Register where
  | first
  | second
  deriving DecidableEq, Repr

/-- Finite instruction syntax for one two-counter bounded-run evaluator. -/
inductive Command where
  | increment (register : Register) (next : Nat)
  | decrementJump (register : Register) (positive zeroNext : Nat)
  | accept
  | reject
  deriving DecidableEq, Repr

/-- The finite program stored by a `Formula`. -/
abbrev Program := List Command

/-- A `Formula` wraps one finite two-counter bounded-run program. -/
structure Formula where
  program : Program
  deriving DecidableEq, Repr

/-- Out-of-range labels reject. -/
def instructionAt : Program → Nat → Command
  | [], _ => .reject
  | command :: _, 0 => command
  | _ :: rest, counter + 1 => instructionAt rest counter

/-- Independent evaluator status. -/
inductive Status where
  | running
  | accepted
  | rejected
  deriving DecidableEq, Repr

/-- Independent bounded-evaluator state. -/
structure State where
  counter : Nat
  first : Nat
  second : Nat
  status : Status
  deriving DecidableEq, Repr

/-- Standard exponential code of one natural source input. -/
def encodedInput (input : Nat) : Nat :=
  2 ^ input

/-- Exponentially encoded input convention for formula evaluation. -/
def initial (input : Nat) : State :=
  ⟨0, encodedInput input, 0, .running⟩

def read (state : State) : Register → Nat
  | .first => state.first
  | .second => state.second

def write (state : State) : Register → Nat → State
  | .first, value => { state with first := value }
  | .second, value => { state with second := value }

/-- One total evaluator step. -/
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

/-- Total bounded evaluator. -/
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

/-- Boolean acceptance test for one supplied execution bound. -/
def eval (formula : Formula) (input witness : Nat) : Bool :=
  match (run formula.program witness (initial input)).status with
  | .accepted => true
  | _ => false

/-- A formula defines a predicate by existentially quantifying its time witness. -/
def Defines (formula : Formula) (predicate : Nat → Prop) : Prop :=
  ∀ input, predicate input ↔ ∃ witness, eval formula input witness = true

/-- Predicates recognized by the exponentially initialized bounded-run interface. -/
def Predicate (predicate : Nat → Prop) : Prop :=
  ∃ formula : Formula, Defines formula predicate

/-! ## Verified equivalence with exponentially encoded two-counter recognition -/

def toCounterRegister : Register → CounterMachine.Register
  | .first => .first
  | .second => .second

def fromCounterRegister : CounterMachine.Register → Register
  | .first => .first
  | .second => .second

def toCounterCommand : Command → CounterMachine.Instruction
  | .increment register next =>
      .increment (toCounterRegister register) next
  | .decrementJump register positive zeroNext =>
      .decrementJump (toCounterRegister register) positive zeroNext
  | .accept => .accept
  | .reject => .reject

def fromCounterCommand : CounterMachine.Instruction → Command
  | .increment register next =>
      .increment (fromCounterRegister register) next
  | .decrementJump register positive zeroNext =>
      .decrementJump (fromCounterRegister register) positive zeroNext
  | .accept => .accept
  | .reject => .reject

/-- Total compiler from formula programs to conventional programs. -/
def toCounterProgram (program : Program) : CounterMachine.Program :=
  program.map toCounterCommand

/-- Total compiler from conventional programs to formula programs. -/
def fromCounterProgram (program : CounterMachine.Program) : Program :=
  program.map fromCounterCommand

@[simp]
theorem from_to_register (register : Register) :
    fromCounterRegister (toCounterRegister register) = register := by
  cases register <;> rfl

@[simp]
theorem to_from_register (register : CounterMachine.Register) :
    toCounterRegister (fromCounterRegister register) = register := by
  cases register <;> rfl

@[simp]
theorem from_to_command (command : Command) :
    fromCounterCommand (toCounterCommand command) = command := by
  cases command with
  | increment register next => cases register <;> rfl
  | decrementJump register positive zeroNext => cases register <;> rfl
  | accept => rfl
  | reject => rfl

@[simp]
theorem to_from_command (instruction : CounterMachine.Instruction) :
    toCounterCommand (fromCounterCommand instruction) = instruction := by
  cases instruction with
  | increment register next => cases register <;> rfl
  | decrementJump register positive zeroNext => cases register <;> rfl
  | accept => rfl
  | reject => rfl

@[simp]
theorem from_to_program (program : Program) :
    fromCounterProgram (toCounterProgram program) = program := by
  induction program with
  | nil => rfl
  | cons command rest ih =>
      rw [toCounterProgram, List.map_cons, fromCounterProgram,
        List.map_cons, from_to_command, List.cons.injEq]
      exact ⟨rfl, by
        change fromCounterProgram (toCounterProgram rest) = rest
        exact ih⟩

@[simp]
theorem to_from_program (program : CounterMachine.Program) :
    toCounterProgram (fromCounterProgram program) = program := by
  induction program with
  | nil => rfl
  | cons instruction rest ih =>
      rw [fromCounterProgram, List.map_cons, toCounterProgram,
        List.map_cons, to_from_command, List.cons.injEq]
      exact ⟨rfl, by
        change toCounterProgram (fromCounterProgram rest) = rest
        exact ih⟩

/-- Translate evaluator status to conventional source status. -/
def toCounterStatus : Status → CounterMachine.Status
  | .running => .running
  | .accepted => .accepted
  | .rejected => .rejected

/-- Exact state representation between the two independent evaluators. -/
def toCounterState (state : State) : CounterMachine.State :=
  ⟨state.counter, state.first, state.second, toCounterStatus state.status⟩

/-- Explicit instruction-boundary representation invariant. -/
def Represents (source : State) (target : CounterMachine.State) : Prop :=
  target = toCounterState source

theorem initial_represents (input : Nat) :
    Represents (initial input)
      (CounterMachine.initial (encodedInput input)) := rfl

theorem instructionAt_toCounter (program : Program) (counter : Nat) :
    CounterMachine.instructionAt (toCounterProgram program) counter =
      toCounterCommand (instructionAt program counter) := by
  induction counter generalizing program with
  | zero => cases program <;> rfl
  | succ counter ih =>
      cases program with
      | nil => rfl
      | cons command rest => exact ih rest

/-- One formula-evaluator step is exactly one conventional-machine step. -/
theorem step_toCounter (program : Program) (state : State) :
    CounterMachine.step (toCounterProgram program) (toCounterState state) =
      toCounterState (step program state) := by
  cases state with
  | mk counter first second status =>
      cases status with
      | accepted => rfl
      | rejected => rfl
      | running =>
          unfold CounterMachine.step step toCounterState toCounterStatus
          rw [instructionAt_toCounter]
          cases h : instructionAt program counter with
          | accept => rfl
          | reject => rfl
          | increment register next => cases register <;> rfl
          | decrementJump register positive zeroNext =>
              cases register <;> cases first <;> cases second <;> rfl

/-- Bounded runs commute with the formula-to-counter compiler. -/
theorem run_toCounter (program : Program) (fuel : Nat) (state : State) :
    CounterMachine.run (toCounterProgram program) fuel
        (toCounterState state) =
      toCounterState (run program fuel state) := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      rw [CounterMachine.run_succ, run_succ, ih, step_toCounter]

/-- The bounded Boolean matrix is preserved by formula compilation. -/
theorem eval_toCounter (formula : Formula) (input witness : Nat) :
    CounterMachine.acceptsWithin (toCounterProgram formula.program)
        (encodedInput input) witness =
      eval formula input witness := by
  unfold CounterMachine.acceptsWithin eval
  have hrun := run_toCounter formula.program witness (initial input)
  rw [show CounterMachine.initial (encodedInput input) =
    toCounterState (initial input) from rfl]
  rw [hrun]
  cases hstatus : (run formula.program witness (initial input)).status <;>
    simp [toCounterState, toCounterStatus, hstatus]

/-- Every formula yields exactly one exponentially encoded recognizer. -/
theorem formula_accepts_iff (formula : Formula) (input : Nat) :
    CounterMachine.Accepts (toCounterProgram formula.program)
        (encodedInput input) ↔
      ∃ witness, eval formula input witness = true := by
  unfold CounterMachine.Accepts
  constructor
  · rintro ⟨witness, haccepts⟩
    exact ⟨witness, (eval_toCounter formula input witness).symm.trans haccepts⟩
  · rintro ⟨witness, haccepts⟩
    exact ⟨witness, (eval_toCounter formula input witness).trans haccepts⟩

/-- Compile a conventional program back to a formula. -/
def formulaOfCounter (program : CounterMachine.Program) : Formula :=
  ⟨fromCounterProgram program⟩

/-- The reverse compiler retains exactly the original source acceptance. -/
theorem counter_accepts_iff_formula (program : CounterMachine.Program)
    (input : Nat) :
    CounterMachine.Accepts program (encodedInput input) ↔
      ∃ witness, eval (formulaOfCounter program) input witness = true := by
  have h := formula_accepts_iff (formulaOfCounter program) input
  rw [formulaOfCounter, to_from_program] at h
  exact h

/-- Recognition by a fixed two-counter program on the input code `2^n`. -/
def ExponentiallyEncodedRecognizable (predicate : Nat → Prop) : Prop :=
  ∃ program : CounterMachine.Program, ∀ input,
    predicate input ↔
      CounterMachine.Accepts program (encodedInput input)

/-- Every predicate in the exponentially initialized bounded-run class has an
encoded-input recognizer. -/
theorem predicate_to_encodedRecognizable {predicate : Nat → Prop}
    (hsigma : Predicate predicate) :
    ExponentiallyEncodedRecognizable predicate := by
  rcases hsigma with ⟨formula, hdefines⟩
  refine ⟨toCounterProgram formula.program, ?_⟩
  intro input
  exact (hdefines input).trans (formula_accepts_iff formula input).symm

/-- Every exponentially encoded two-counter recognizer has a formula. -/
theorem encodedRecognizable_to_predicate {predicate : Nat → Prop}
    (hrecognizable : ExponentiallyEncodedRecognizable predicate) :
    Predicate predicate := by
  rcases hrecognizable with ⟨program, hrecognizes⟩
  refine ⟨formulaOfCounter program, ?_⟩
  intro input
  exact (hrecognizes input).trans
    (counter_accepts_iff_formula program input)

/-- Exact equivalence with exponentially encoded two-counter recognition. -/
theorem predicate_iff_encodedCounterRecognizable (predicate : Nat → Prop) :
    Predicate predicate ↔ ExponentiallyEncodedRecognizable predicate :=
  ⟨predicate_to_encodedRecognizable, encodedRecognizable_to_predicate⟩

/-- Explicit universal job assigned to a formula and its unencoded input. -/
def formulaUniversalInput (formula : Formula) (input : Nat) :
    CounterMachine.UniversalInput :=
  ⟨toCounterProgram formula.program, encodedInput input⟩

/-- The named formula job accepts exactly when its bounded matrix has a witness. -/
theorem formulaUniversalInput_accepts_iff (formula : Formula) (input : Nat) :
    CounterMachine.UniversalAccepts (formulaUniversalInput formula input) ↔
      ∃ witness, eval formula input witness = true := by
  simpa [formulaUniversalInput, CounterMachine.UniversalAccepts] using
    (formula_accepts_iff formula input)

/-! ## Exponentially initialized bounded-run completeness -/

def Hard {Target : Type} (target : Target → Prop) : Prop :=
  ∀ source : Nat → Prop, Predicate source → ManyOneReduces source target

def Complete {Target : Type} (target : Target → Prop) : Prop :=
  BoundedlySemidecidable target ∧ Hard target

/-- Natural bytecode universal acceptance is hard for every predicate in this
exponentially initialized bounded-run class. -/
theorem natMachineUniversal_hard : Hard NatMachine.UniversalAccepts := by
  intro predicate hsigma
  rcases hsigma with ⟨formula, defines⟩
  refine ⟨fun input => CounterMachine.compileUniversalInput
    (formulaUniversalInput formula input), ?_⟩
  intro input
  exact (defines input).trans
    ((formulaUniversalInput_accepts_iff formula input).symm.trans
      (CounterMachine.compileUniversalInput_correct
        (formulaUniversalInput formula input)))

/-- Exponentially initialized two-counter bounded-run completeness of natural
acceptance. -/
theorem natMachineUniversal_complete :
    Complete NatMachine.UniversalAccepts :=
  ⟨universalAcceptance_semidecidable, natMachineUniversal_hard⟩

end BoundedSigmaOne

/-!
`BoundedSigmaOne` is retained as a compatibility namespace.  This public
alias names the implemented source model directly: finite two-counter
programs initialized at `(2^n, 0)` and accepted within a supplied step bound.
-/
namespace ExponentialCounterBoundedRun

abbrev Specification := BoundedSigmaOne.Formula
abbrev eval := BoundedSigmaOne.eval
abbrev Defines := BoundedSigmaOne.Defines
abbrev Predicate := BoundedSigmaOne.Predicate
abbrev Hard {Target : Type} (target : Target → Prop) :=
  BoundedSigmaOne.Hard target
abbrev Complete {Target : Type} (target : Target → Prop) :=
  BoundedSigmaOne.Complete target

end ExponentialCounterBoundedRun

end PureSFormal.Computation
