import PureSFormal.Computation.StandardMachine

/-!
# Conventional deterministic two-counter recognizers

This is the independent source model used for the universality layer.  Its
finite programs, states, transition function, bounded evaluator, and
recognizability predicate are defined without reference to either target
interpreter.  The last section gives a total instruction-for-instruction
compiler into `StandardMachine`, an explicit state representation invariant,
and unconditional step, run, and acceptance preservation.
-/

namespace PureSFormal.Computation

namespace CounterMachine

/-- The two unbounded source registers. -/
inductive Register where
  | first
  | second
  deriving DecidableEq, Repr

/-- Conventional Minsky instructions with explicit successor labels. -/
inductive Instruction where
  | increment (register : Register) (next : Nat)
  | decrementJump (register : Register) (positive zeroNext : Nat)
  | accept
  | reject
  deriving DecidableEq, Repr

/-- A finite transition table indexed by natural labels. -/
abbrev Program := List Instruction

/-- Falling outside a finite transition table rejects. -/
def instructionAt : Program → Nat → Instruction
  | [], _ => .reject
  | instruction :: _, 0 => instruction
  | _ :: rest, counter + 1 => instructionAt rest counter

/-- Explicit source control status. -/
inductive Status where
  | running
  | accepted
  | rejected
  deriving DecidableEq, Repr

/-- Complete two-counter source configuration. -/
structure State where
  counter : Nat
  first : Nat
  second : Nat
  status : Status
  deriving DecidableEq, Repr

/-- Load the input into the first counter and clear the second. -/
def initial (input : Nat) : State :=
  ⟨0, input, 0, .running⟩

/-- Read one source register. -/
def read (state : State) : Register → Nat
  | .first => state.first
  | .second => state.second

/-- Replace one source register. -/
def write (state : State) : Register → Nat → State
  | .first, value => { state with first := value }
  | .second, value => { state with second := value }

/-- One total deterministic source transition. -/
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

/-- Execute exactly `fuel` source transitions. -/
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

/-- Executable bounded acceptance observation. -/
def acceptsWithin (program : Program) (input fuel : Nat) : Bool :=
  match (run program fuel (initial input)).status with
  | .accepted => true
  | _ => false

/-- A source program accepts when a finite run reaches `accepted`. -/
def Accepts (program : Program) (input : Nat) : Prop :=
  ∃ fuel, acceptsWithin program input fuel = true

/-- Recognition by one conventional finite two-counter program. -/
def Recognizable (predicate : Nat → Prop) : Prop :=
  ∃ program : Program, ∀ input, predicate input ↔ Accepts program input

/-- Hardness for all predicates recognized by the conventional source model. -/
def Hard {Target : Type} (target : Target → Prop) : Prop :=
  ∀ source : Nat → Prop,
    Recognizable source → ManyOneReduces source target

/-- Source-model completeness with an executable target semidecider. -/
def Complete {Target : Type} (target : Target → Prop) : Prop :=
  BoundedlySemidecidable target ∧ Hard target

/-- A finite source program paired with its natural input. -/
structure UniversalInput where
  program : Program
  input : Nat
  deriving DecidableEq, Repr

/-- Universal acceptance for the conventional finite source model. -/
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

/-! ## Prefix-free natural coding of source syntax -/

/-- Unary operand payload in the common base-nine token alphabet. -/
def unaryOperand : Nat → List NatMachine.Token
  | 0 => [.operandEnd]
  | value + 1 => .operandSucc :: unaryOperand value

/-- Register-sensitive increment prefix. -/
def incrementTag : Register → NatMachine.Token
  | .first => .incrementFirst
  | .second => .incrementSecond

/-- Register-sensitive decrement prefix. -/
def decrementTag : Register → NatMachine.Token
  | .first => .decrementFirst
  | .second => .decrementSecond

/-- Prefix-free serialization of one source instruction. -/
def serializeInstruction : Instruction → List NatMachine.Token
  | .increment register next => incrementTag register :: unaryOperand next
  | .decrementJump register positive zeroNext =>
      decrementTag register ::
        (unaryOperand positive ++ unaryOperand zeroNext)
  | .accept => [.accept]
  | .reject => [.reject]

/-- Concatenated serialization of a finite source table. -/
def serializeProgram : Program → List NatMachine.Token
  | [] => []
  | instruction :: rest =>
      serializeInstruction instruction ++ serializeProgram rest

/-- Canonical natural Goedel code of a conventional source program. -/
def encodeProgram (program : Program) : Nat :=
  NatMachine.encodeTokens (serializeProgram program)

/-- Parse one unary source operand. -/
def parseOperand : List NatMachine.Token →
    Option (Nat × List NatMachine.Token)
  | [] => none
  | .operandEnd :: rest => some (0, rest)
  | .operandSucc :: rest =>
      match parseOperand rest with
      | none => none
      | some (value, tail) => some (value + 1, tail)
  | _ => none

theorem parseOperand_unary (value : Nat) (tail : List NatMachine.Token) :
    parseOperand (unaryOperand value ++ tail) = some (value, tail) := by
  induction value with
  | zero => rfl
  | succ value ih =>
      rw [unaryOperand, List.cons_append, parseOperand, ih]

/-- Parse one prefix-free source instruction. -/
def parseInstruction : List NatMachine.Token →
    Option (Instruction × List NatMachine.Token)
  | [] => none
  | .incrementFirst :: rest =>
      match parseOperand rest with
      | none => none
      | some (next, tail) => some (.increment .first next, tail)
  | .incrementSecond :: rest =>
      match parseOperand rest with
      | none => none
      | some (next, tail) => some (.increment .second next, tail)
  | .decrementFirst :: rest =>
      match parseOperand rest with
      | none => none
      | some (positive, afterPositive) =>
          match parseOperand afterPositive with
          | none => none
          | some (zeroNext, tail) =>
              some (.decrementJump .first positive zeroNext, tail)
  | .decrementSecond :: rest =>
      match parseOperand rest with
      | none => none
      | some (positive, afterPositive) =>
          match parseOperand afterPositive with
          | none => none
          | some (zeroNext, tail) =>
              some (.decrementJump .second positive zeroNext, tail)
  | .accept :: rest => some (.accept, rest)
  | .reject :: rest => some (.reject, rest)
  | _ => none

theorem parseInstruction_serialize (instruction : Instruction)
    (tail : List NatMachine.Token) :
    parseInstruction (serializeInstruction instruction ++ tail) =
      some (instruction, tail) := by
  cases instruction with
  | increment register next =>
      cases register <;>
        simp only [serializeInstruction, incrementTag, List.cons_append,
          parseInstruction, parseOperand_unary]
  | decrementJump register positive zeroNext =>
      cases register <;>
        simp only [serializeInstruction, decrementTag, List.cons_append,
          List.append_assoc, parseInstruction, parseOperand_unary]
  | accept => rfl
  | reject => rfl

/-- Parser with one unit of fuel per source token. -/
def parseProgramAux : Nat → List NatMachine.Token → Option Program
  | 0, [] => some []
  | 0, _ :: _ => none
  | _ + 1, [] => some []
  | fuel + 1, tokens@(_ :: _) =>
      match parseInstruction tokens with
      | none => none
      | some (instruction, rest) =>
          match parseProgramAux fuel rest with
          | none => none
          | some program => some (instruction :: program)

def parseProgram (tokens : List NatMachine.Token) : Option Program :=
  parseProgramAux tokens.length tokens

theorem serializeInstruction_ne_nil (instruction : Instruction) :
    serializeInstruction instruction ≠ [] := by
  cases instruction with
  | increment register next =>
      cases register <;> simp [serializeInstruction, incrementTag]
  | decrementJump register positive zeroNext =>
      cases register <;> simp [serializeInstruction, decrementTag]
  | accept => simp [serializeInstruction]
  | reject => simp [serializeInstruction]

theorem serializeInstruction_length_pos (instruction : Instruction) :
    1 ≤ (serializeInstruction instruction).length := by
  cases h : serializeInstruction instruction with
  | nil => exact (serializeInstruction_ne_nil instruction h).elim
  | cons head tail =>
      rw [List.length_cons]
      exact Nat.succ_le_succ (Nat.zero_le tail.length)

theorem program_length_le_serialize (program : Program) :
    program.length ≤ (serializeProgram program).length := by
  induction program with
  | nil => exact Nat.le_refl 0
  | cons instruction rest ih =>
      rw [List.length_cons, serializeProgram, List.length_append,
        Nat.add_comm rest.length 1]
      exact Nat.add_le_add (serializeInstruction_length_pos instruction) ih

theorem parseProgramAux_serialize (program : Program) (extra : Nat) :
    parseProgramAux (program.length + extra) (serializeProgram program) =
      some program := by
  induction program generalizing extra with
  | nil => cases extra <;> rfl
  | cons instruction rest ih =>
      rw [List.length_cons]
      have hfuel : rest.length + 1 + extra =
          (rest.length + extra) + 1 := by
        rw [Nat.add_assoc, Nat.add_assoc, Nat.add_comm 1 extra]
      rw [hfuel, serializeProgram]
      cases hserialize : serializeInstruction instruction with
      | nil => exact (serializeInstruction_ne_nil instruction hserialize).elim
      | cons head payload =>
          rw [List.cons_append, parseProgramAux]
          have hparse :=
            parseInstruction_serialize instruction (serializeProgram rest)
          rw [hserialize, List.cons_append] at hparse
          rw [hparse]
          change (match parseProgramAux (rest.length + extra)
              (serializeProgram rest) with
            | none => none
            | some program => some (instruction :: program)) =
              some (instruction :: rest)
          rw [ih]

theorem parseProgram_serialize (program : Program) :
    parseProgram (serializeProgram program) = some program := by
  unfold parseProgram
  have hle := program_length_le_serialize program
  have heq : program.length +
      ((serializeProgram program).length - program.length) =
        (serializeProgram program).length :=
    Nat.add_sub_of_le hle
  rw [← heq]
  exact parseProgramAux_serialize program
    ((serializeProgram program).length - program.length)

/-- Partial decoder for arbitrary natural source codes. -/
def decodeProgram (code : Nat) : Option Program :=
  match NatMachine.decodeTokens code with
  | none => none
  | some tokens => parseProgram tokens

theorem decodeProgram_encode (program : Program) :
    decodeProgram (encodeProgram program) = some program := by
  unfold decodeProgram encodeProgram
  rw [NatMachine.decodeTokens_encode]
  exact parseProgram_serialize program

/-- Bounded acceptance of an arbitrary natural source code. -/
def acceptsCodeWithin (code input fuel : Nat) : Bool :=
  match decodeProgram code with
  | none => false
  | some program => acceptsWithin program input fuel

/-- Acceptance of a natural-number-coded source program. -/
def AcceptsCode (code input : Nat) : Prop :=
  ∃ fuel, acceptsCodeWithin code input fuel = true

theorem acceptsCodeWithin_encode (program : Program) (input fuel : Nat) :
    acceptsCodeWithin (encodeProgram program) input fuel =
      acceptsWithin program input fuel := by
  unfold acceptsCodeWithin
  rw [decodeProgram_encode]

theorem acceptsCode_encode (program : Program) (input : Nat) :
    AcceptsCode (encodeProgram program) input ↔ Accepts program input := by
  unfold AcceptsCode Accepts
  constructor
  · rintro ⟨fuel, haccepts⟩
    exact ⟨fuel,
      (acceptsCodeWithin_encode program input fuel).symm.trans haccepts⟩
  · rintro ⟨fuel, haccepts⟩
    exact ⟨fuel,
      (acceptsCodeWithin_encode program input fuel).trans haccepts⟩

/-- Recognition by one natural code for the conventional source syntax. -/
def CodedRecognizable (predicate : Nat → Prop) : Prop :=
  ∃ code : Nat, ∀ input, predicate input ↔ AcceptsCode code input

def CodedHard {Target : Type} (target : Target → Prop) : Prop :=
  ∀ source : Nat → Prop,
    CodedRecognizable source → ManyOneReduces source target

def CodedComplete {Target : Type} (target : Target → Prop) : Prop :=
  BoundedlySemidecidable target ∧ CodedHard target

structure CodedUniversalInput where
  code : Nat
  input : Nat
  deriving DecidableEq, Repr

def CodedUniversalAccepts (job : CodedUniversalInput) : Prop :=
  AcceptsCode job.code job.input

theorem codedUniversalAccepts_semidecidable :
    BoundedlySemidecidable CodedUniversalAccepts := by
  exact ⟨fun job fuel => acceptsCodeWithin job.code job.input fuel,
    fun _ => Iff.rfl⟩

theorem codedUniversalAccepts_hard :
    CodedHard CodedUniversalAccepts := by
  intro predicate recognizable
  rcases recognizable with ⟨code, recognizes⟩
  exact ⟨fun input => ⟨code, input⟩, recognizes⟩

theorem codedUniversalAccepts_complete :
    CodedComplete CodedUniversalAccepts :=
  ⟨codedUniversalAccepts_semidecidable, codedUniversalAccepts_hard⟩

/-! ## Verified compiler into the separate finite target syntax -/

/-- Exact semantic obligation for a source-to-target compiler. -/
def CompilerCorrect
    (compile : Program → StandardMachine.Program) : Prop :=
  ∀ program input,
    StandardMachine.Accepts (compile program) input ↔ Accepts program input

namespace Compiler

/-- Compile source registers to the distinct target register type. -/
def compileRegister : Register → StandardMachine.Register
  | .first => .first
  | .second => .second

/-- Compile one source instruction. -/
def compileInstruction : Instruction → StandardMachine.Command
  | .increment register next =>
      .increment (compileRegister register) next
  | .decrementJump register positive zeroNext =>
      .decrementJump (compileRegister register) positive zeroNext
  | .accept => .accept
  | .reject => .reject

/-- Total executable compiler on finite source tables. -/
def compile (program : Program) : StandardMachine.Program :=
  program.map compileInstruction

/-- Compile source status to target status. -/
def compileStatus : Status → StandardMachine.Status
  | .running => .running
  | .accepted => .accepted
  | .rejected => .rejected

/-- Exact state representation at every source/target instruction boundary. -/
def compileState (state : State) : StandardMachine.State :=
  ⟨state.counter, state.first, state.second, compileStatus state.status⟩

/-- Explicit compiler representation invariant. -/
def Represents (source : State) (target : StandardMachine.State) : Prop :=
  target = compileState source

theorem initial_represents (input : Nat) :
    Represents (initial input) (StandardMachine.initial input) :=
  rfl

/-- Finite table lookup commutes with compilation. -/
theorem instructionAt_compile (program : Program) (counter : Nat) :
    StandardMachine.instructionAt (compile program) counter =
      compileInstruction (instructionAt program counter) := by
  induction counter generalizing program with
  | zero => cases program <;> rfl
  | succ counter ih =>
      cases program with
      | nil => rfl
      | cons instruction rest => exact ih rest

theorem read_compileState (state : State) (register : Register) :
    StandardMachine.read (compileState state) (compileRegister register) =
      read state register := by
  cases register <;> rfl

theorem write_compileState (state : State) (register : Register)
    (value : Nat) :
    StandardMachine.write (compileState state) (compileRegister register)
        value =
      compileState (write state register value) := by
  cases register <;> rfl

/-- One compiled target transition represents exactly one source transition. -/
theorem step_compile (program : Program) (state : State) :
    StandardMachine.step (compile program) (compileState state) =
      compileState (step program state) := by
  cases state with
  | mk counter first second status =>
      cases status with
      | accepted => rfl
      | rejected => rfl
      | running =>
          unfold StandardMachine.step step compileState compileStatus
          rw [instructionAt_compile]
          cases h : instructionAt program counter with
          | accept => rfl
          | reject => rfl
          | increment register next => cases register <;> rfl
          | decrementJump register positive zeroNext =>
              cases register <;> cases first <;> cases second <;> rfl

/-- Equal-length target runs maintain the representation invariant. -/
theorem run_compile (program : Program) (fuel : Nat) (state : State) :
    StandardMachine.run (compile program) fuel (compileState state) =
      compileState (run program fuel state) := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      rw [StandardMachine.run_succ, run_succ, ih, step_compile]

/-- Bounded acceptance is preserved exactly. -/
theorem acceptsWithin_compile (program : Program) (input fuel : Nat) :
    StandardMachine.acceptsWithin (compile program) input fuel =
      acceptsWithin program input fuel := by
  unfold StandardMachine.acceptsWithin acceptsWithin
  have hrun := run_compile program fuel (initial input)
  rw [show StandardMachine.initial input = compileState (initial input) from rfl]
  rw [hrun]
  cases hstatus : (run program fuel (initial input)).status <;>
    simp [compileState, compileStatus, hstatus]

/-- The concrete compiler preserves source acceptance unconditionally. -/
theorem accepts_compile (program : Program) (input : Nat) :
    StandardMachine.Accepts (compile program) input ↔ Accepts program input := by
  unfold StandardMachine.Accepts Accepts
  constructor
  · rintro ⟨fuel, haccepts⟩
    exact ⟨fuel, (acceptsWithin_compile program input fuel).symm.trans haccepts⟩
  · rintro ⟨fuel, haccepts⟩
    exact ⟨fuel, (acceptsWithin_compile program input fuel).trans haccepts⟩

/-- Headline unconditional compiler-correctness theorem. -/
theorem correct : CompilerCorrect compile :=
  accepts_compile

/-- The source unary operand spelling is the target codec's spelling. -/
theorem unaryOperand_eq (value : Nat) :
    unaryOperand value = NatMachine.operandTokens value := by
  induction value with
  | zero => rfl
  | succ value ih => rw [unaryOperand, NatMachine.operandTokens, ih]

/-- The two source codecs assign the same natural bytecode to compilation. -/
theorem serialize_compileInstruction (instruction : Instruction) :
    NatMachine.serializeInstruction
        (StandardMachine.compileCommand (compileInstruction instruction)) =
      serializeInstruction instruction := by
  cases instruction with
  | increment register next =>
      cases register <;> simp [compileInstruction, compileRegister,
        StandardMachine.compileCommand, StandardMachine.compileRegister,
        NatMachine.serializeInstruction, serializeInstruction, incrementTag,
        unaryOperand_eq]
  | decrementJump register positive zeroNext =>
      cases register <;> simp [compileInstruction, compileRegister,
        StandardMachine.compileCommand, StandardMachine.compileRegister,
        NatMachine.serializeInstruction, serializeInstruction, decrementTag,
        unaryOperand_eq]
  | accept => rfl
  | reject => rfl

theorem serializeProgram_compile (program : Program) :
    NatMachine.serializeProgram
        (StandardMachine.compileProgram (compile program)) =
      serializeProgram program := by
  induction program with
  | nil => rfl
  | cons instruction rest ih =>
      rw [compile, StandardMachine.compileProgram, List.map_cons,
        List.map_cons, NatMachine.serializeProgram, serializeProgram,
        serialize_compileInstruction]
      rw [show List.map compileInstruction rest = compile rest from rfl]
      rw [show List.map StandardMachine.compileCommand (compile rest) =
        StandardMachine.compileProgram (compile rest) from rfl]
      rw [ih]

/-- Direct source coding equals the composed source-to-target bytecode compiler. -/
theorem targetCode_eq_sourceCode (program : Program) :
    StandardMachine.compile (compile program) = encodeProgram program := by
  unfold StandardMachine.compile NatMachine.encodeProgram encodeProgram
  rw [serializeProgram_compile]

end Compiler

/-- The concrete compiler satisfies its full semantic obligation. -/
theorem compiler_correct : CompilerCorrect Compiler.compile :=
  Compiler.correct

/-- Conventional two-counter universal acceptance reduces to the finite target. -/
theorem universalAccepts_reduces_to_standard :
    ManyOneReduces UniversalAccepts StandardMachine.UniversalAccepts := by
  refine ⟨fun job => ⟨Compiler.compile job.program, job.input⟩, ?_⟩
  intro job
  exact (Compiler.accepts_compile job.program job.input).symm

/-- Finite-target universal acceptance is hard for conventional recognizers. -/
theorem standardUniversal_hard :
    Hard StandardMachine.UniversalAccepts := by
  intro predicate recognizable
  exact ManyOneReduces.trans
    (universalAccepts_hard predicate recognizable)
    universalAccepts_reduces_to_standard

/-- Conventional universal acceptance reduces to natural bytecode acceptance. -/
def compileUniversalInput (job : UniversalInput) : NatMachine.UniversalInput :=
  ⟨StandardMachine.compile (Compiler.compile job.program), job.input⟩

theorem compileUniversalInput_correct (job : UniversalInput) :
    UniversalAccepts job ↔
      NatMachine.UniversalAccepts (compileUniversalInput job) := by
  exact (Compiler.accepts_compile job.program job.input).symm.trans
    (StandardMachine.accepts_compile
      (Compiler.compile job.program) job.input).symm

/-- Natural bytecode universal acceptance is hard for conventional programs. -/
theorem natMachineUniversal_hard :
    Hard NatMachine.UniversalAccepts := by
  intro predicate recognizable
  exact ManyOneReduces.trans
    (universalAccepts_hard predicate recognizable)
    ⟨compileUniversalInput, compileUniversalInput_correct⟩

/-- Natural universal acceptance is complete relative to the conventional model. -/
theorem natMachineUniversal_complete :
    Complete NatMachine.UniversalAccepts :=
  ⟨universalAcceptance_semidecidable, natMachineUniversal_hard⟩

end CounterMachine

end PureSFormal.Computation
