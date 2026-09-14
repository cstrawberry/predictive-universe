import Std

/-!
# A concrete natural-number semidecision model

Programs and inputs are natural numbers. A program is a base-nine stream of
nonzero prefix tokens. The stream decodes to a finite deterministic
two-register program; malformed streams reject. Operands are unary in the
bytecode. This favors a small executable definition and an auditable coding
proof over compact program codes.

The universal acceptance result in this file is internal to this interpreter.
A separate finite source language and compiler are proved correct in
`StandardMachine`; no arbitrary Lean function is treated as machine code.
-/

namespace PureSFormal.Computation

namespace NatMachine

/-- The two registers of the bytecode interpreter. -/
inductive Register where
  | first
  | second
  deriving DecidableEq, Repr

/-- Decoded bytecode instructions with explicit natural labels. -/
inductive Instruction where
  | increment (register : Register) (next : Nat)
  | decrementJump (register : Register) (positive zeroNext : Nat)
  | accept
  | reject
  deriving DecidableEq, Repr

/-- A decoded finite bytecode program. -/
abbrev Program := List Instruction

/-- The eight nonzero base-nine tokens. Zero terminates the numeral. -/
inductive Token where
  | incrementFirst
  | incrementSecond
  | decrementFirst
  | decrementSecond
  | accept
  | reject
  | operandSucc
  | operandEnd
  deriving DecidableEq, Repr

/-- Canonical base-nine digit of a token. -/
def Token.digit : Token → Nat
  | .incrementFirst => 1
  | .incrementSecond => 2
  | .decrementFirst => 3
  | .decrementSecond => 4
  | .accept => 5
  | .reject => 6
  | .operandSucc => 7
  | .operandEnd => 8

/-- Decode one nonzero base-nine digit. -/
def Token.ofDigit? : Nat → Option Token
  | 1 => some .incrementFirst
  | 2 => some .incrementSecond
  | 3 => some .decrementFirst
  | 4 => some .decrementSecond
  | 5 => some .accept
  | 6 => some .reject
  | 7 => some .operandSucc
  | 8 => some .operandEnd
  | _ => none

@[simp]
theorem Token.ofDigit?_digit (token : Token) :
    Token.ofDigit? token.digit = some token := by
  cases token <;> rfl

@[simp]
theorem Token.digit_lt_nine (token : Token) : token.digit < 9 := by
  cases token <;> decide

/-- Least-significant-token-first base-nine coding. -/
def encodeTokens : List Token → Nat
  | [] => 0
  | token :: rest => token.digit + encodeTokens rest * 9

@[simp]
theorem encodeTokens_nil : encodeTokens [] = 0 := rfl

@[simp]
theorem encodeTokens_cons (token : Token) (rest : List Token) :
    encodeTokens (token :: rest) = token.digit + encodeTokens rest * 9 :=
  rfl

@[simp]
theorem encodeTokens_cons_mod_nine (token : Token) (rest : List Token) :
    encodeTokens (token :: rest) % 9 = token.digit := by
  rw [encodeTokens_cons, Nat.add_mul_mod_self_right]
  exact Nat.mod_eq_of_lt token.digit_lt_nine

@[simp]
theorem encodeTokens_cons_div_nine (token : Token) (rest : List Token) :
    encodeTokens (token :: rest) / 9 = encodeTokens rest := by
  rw [encodeTokens_cons, Nat.add_mul_div_right token.digit
    (encodeTokens rest) (by decide : 0 < 9)]
  rw [Nat.div_eq_of_lt token.digit_lt_nine, Nat.zero_add]

theorem encodeTokens_cons_ne_zero (token : Token) (rest : List Token) :
    encodeTokens (token :: rest) ≠ 0 := by
  cases token <;> simp [encodeTokens, Token.digit]

/-- Total partial decoder; a zero digit inside a nonterminal position rejects. -/
def decodeTokens (code : Nat) : Option (List Token) :=
  if code = 0 then
    some []
  else
    match Token.ofDigit? (code % 9) with
    | none => none
    | some token =>
        match decodeTokens (code / 9) with
        | none => none
        | some rest => some (token :: rest)
termination_by code
decreasing_by
  rename_i hzero
  exact Nat.div_lt_self (Nat.zero_lt_of_ne_zero hzero)
    (by decide : 1 < 9)

/-- Canonical token streams round-trip through their natural code. -/
theorem decodeTokens_encode (tokens : List Token) :
    decodeTokens (encodeTokens tokens) = some tokens := by
  induction tokens with
  | nil => simp [decodeTokens]
  | cons token rest ih =>
      rw [decodeTokens]
      rw [if_neg (encodeTokens_cons_ne_zero token rest)]
      rw [encodeTokens_cons_mod_nine, Token.ofDigit?_digit,
        encodeTokens_cons_div_nine, ih]

/-- Prefix-free unary natural operand. -/
def operandTokens : Nat → List Token
  | 0 => [.operandEnd]
  | value + 1 => .operandSucc :: operandTokens value

/-- Prefix-token serialization of one decoded instruction. -/
def serializeInstruction : Instruction → List Token
  | .increment .first next => .incrementFirst :: operandTokens next
  | .increment .second next => .incrementSecond :: operandTokens next
  | .decrementJump .first positive zeroNext =>
      .decrementFirst :: (operandTokens positive ++ operandTokens zeroNext)
  | .decrementJump .second positive zeroNext =>
      .decrementSecond :: (operandTokens positive ++ operandTokens zeroNext)
  | .accept => [.accept]
  | .reject => [.reject]

/-- Concatenated serialization of a finite decoded program. -/
def serializeProgram : Program → List Token
  | [] => []
  | instruction :: rest =>
      serializeInstruction instruction ++ serializeProgram rest

/-- Canonical natural bytecode of a finite instruction table. -/
def encodeProgram (program : Program) : Nat :=
  encodeTokens (serializeProgram program)

/-- Parse one unary operand and retain the unused suffix. -/
def parseOperand : List Token → Option (Nat × List Token)
  | [] => none
  | .operandEnd :: rest => some (0, rest)
  | .operandSucc :: rest =>
      match parseOperand rest with
      | none => none
      | some (value, tail) => some (value + 1, tail)
  | _ => none

/-- Unary operands parse exactly in front of every suffix. -/
theorem parseOperand_tokens (value : Nat) (tail : List Token) :
    parseOperand (operandTokens value ++ tail) = some (value, tail) := by
  induction value with
  | zero => rfl
  | succ value ih =>
      rw [operandTokens, List.cons_append, parseOperand, ih]

/-- Parse one prefix-token instruction. -/
def parseInstruction : List Token → Option (Instruction × List Token)
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

/-- One serialized instruction parses exactly and preserves its suffix. -/
theorem parseInstruction_serialize (instruction : Instruction)
    (tail : List Token) :
    parseInstruction (serializeInstruction instruction ++ tail) =
      some (instruction, tail) := by
  cases instruction with
  | increment register next =>
      cases register <;>
        simp only [serializeInstruction, List.cons_append,
          parseInstruction, parseOperand_tokens]
  | decrementJump register positive zeroNext =>
      cases register <;>
        simp only [serializeInstruction, List.cons_append,
          List.append_assoc, parseInstruction, parseOperand_tokens]
  | accept => rfl
  | reject => rfl

/-- Bounded parser with one unit of fuel per input token. -/
def parseProgramAux : Nat → List Token → Option Program
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

/-- Parse an entire finite token stream. -/
def parseProgram (tokens : List Token) : Option Program :=
  parseProgramAux tokens.length tokens

theorem serializeInstruction_ne_nil (instruction : Instruction) :
    serializeInstruction instruction ≠ [] := by
  cases instruction with
  | increment register next =>
      cases register <;> simp [serializeInstruction]
  | decrementJump register positive zeroNext =>
      cases register <;> simp [serializeInstruction]
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

/-- Canonical serialized instruction tables parse exactly. -/
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

/-- Decode arbitrary natural bytecode; every malformed code yields `none`. -/
def decodeProgram (code : Nat) : Option Program :=
  match decodeTokens code with
  | none => none
  | some tokens => parseProgram tokens

/-- Every canonically encoded finite program decodes exactly. -/
theorem decodeProgram_encode (program : Program) :
    decodeProgram (encodeProgram program) = some program := by
  unfold decodeProgram encodeProgram
  rw [decodeTokens_encode]
  exact parseProgram_serialize program

/-- Finite lookup with explicit rejection outside the instruction table. -/
def lookup : Program → Nat → Instruction
  | [], _ => .reject
  | instruction :: _, 0 => instruction
  | _ :: rest, counter + 1 => lookup rest counter

/-- Instruction lookup decodes the natural program before table access. -/
def instructionAt (code counter : Nat) : Instruction :=
  match decodeProgram code with
  | none => .reject
  | some program => lookup program counter

/-- Canonical programs have exact instruction lookup. -/
theorem instructionAt_encode (program : Program) (counter : Nat) :
    instructionAt (encodeProgram program) counter = lookup program counter := by
  unfold instructionAt
  rw [decodeProgram_encode]

/-- Explicit running, accepting, and rejecting control states. -/
inductive Status where
  | running
  | accepted
  | rejected
  deriving DecidableEq, Repr

/-- Complete state of the decoded two-register bytecode interpreter. -/
structure State where
  counter : Nat
  first : Nat
  second : Nat
  status : Status
  deriving DecidableEq, Repr

/-- Load the input in the first register and clear the second. -/
def initial (input : Nat) : State :=
  ⟨0, input, 0, .running⟩

/-- Read one register. -/
def read (state : State) : Register → Nat
  | .first => state.first
  | .second => state.second

/-- Replace one register. -/
def write (state : State) : Register → Nat → State
  | .first, value => { state with first := value }
  | .second, value => { state with second := value }

/-- One total executable bytecode step. -/
def step (program : Nat) (state : State) : State :=
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

/-- Execute exactly `fuel` interpreter steps. -/
def run (program : Nat) : Nat → State → State
  | 0, state => state
  | fuel + 1, state => step program (run program fuel state)

@[simp]
theorem run_zero (program : Nat) (state : State) :
    run program 0 state = state := rfl

@[simp]
theorem run_succ (program fuel : Nat) (state : State) :
    run program (fuel + 1) state = step program (run program fuel state) :=
  rfl

/-- Executable bounded acceptance observation. -/
def acceptsWithin (program input fuel : Nat) : Bool :=
  match (run program fuel (initial input)).status with
  | .accepted => true
  | _ => false

/-- A natural bytecode accepts if a finite run reaches `accepted`. -/
def Accepts (program input : Nat) : Prop :=
  ∃ fuel, acceptsWithin program input fuel = true

/-- Malformed bytecode selects rejection at every program counter. -/
theorem instructionAt_of_decode_none (code : Nat)
    (hdecode : decodeProgram code = none) (counter : Nat) :
    instructionAt code counter = .reject := by
  unfold instructionAt
  rw [hdecode]

/-- A malformed program rejects on its first step. -/
theorem run_malformed_succ (code input fuel : Nat)
    (hdecode : decodeProgram code = none) :
    run code (fuel + 1) (initial input) =
      { initial input with status := .rejected } := by
  induction fuel with
  | zero =>
      rw [run_succ, run_zero]
      unfold step
      rw [instructionAt_of_decode_none code hdecode]
      rfl
  | succ fuel ih =>
      rw [run_succ, ih]
      rfl

/-- No malformed natural code can accept. -/
theorem not_accepts_of_decode_none (code input : Nat)
    (hdecode : decodeProgram code = none) :
    ¬Accepts code input := by
  rintro ⟨fuel, haccepts⟩
  cases fuel with
  | zero =>
      unfold acceptsWithin run initial at haccepts
      cases haccepts
  | succ fuel =>
      unfold acceptsWithin at haccepts
      rw [run_malformed_succ code input fuel hdecode] at haccepts
      cases haccepts

/-- The universal instance contains a natural program and natural input. -/
structure UniversalInput where
  program : Nat
  input : Nat
  deriving DecidableEq, Repr

/-- Universal acceptance of the explicit natural bytecode interpreter. -/
def UniversalAccepts (job : UniversalInput) : Prop :=
  Accepts job.program job.input

theorem universal_accepts_iff (job : UniversalInput) :
    UniversalAccepts job ↔
      ∃ fuel, acceptsWithin job.program job.input fuel = true :=
  Iff.rfl

end NatMachine

/-- A bounded-witness Boolean presentation for an arbitrary input type.
Concrete uses below supply named executable tests. -/
def BoundedlySemidecidable {Input : Type} (predicate : Input → Prop) : Prop :=
  ∃ test : Input → Nat → Bool,
    ∀ input, predicate input ↔ ∃ witness, test input witness = true

/-- Recognition by one code of the fixed executable natural interpreter. -/
def NatRecognizable (predicate : Nat → Prop) : Prop :=
  ∃ program : Nat,
    ∀ input, predicate input ↔ NatMachine.Accepts program input

/-- Pointwise correctness of one specified reduction map.

Unlike `ExtensionalReduces`, this proposition does not existentially hide the
map.  It is used by the public source-to-event interface to state a logical
reduction through a named, transparent structural encoder. -/
def ReducesVia
    {Source Target : Type}
    (encode : Source → Target)
    (source : Source → Prop) (target : Target → Prop) : Prop :=
  ∀ input, source input ↔ target (encode input)

/-- An extensional reduction with an explicit encoding function.

This is deliberately not called a computable many-one reduction: it records
only a map and pointwise logical equivalence. -/
def ExtensionalReduces
    {Source Target : Type}
    (source : Source → Prop) (target : Target → Prop) : Prop :=
  ∃ encode : Source → Target,
    ∀ input, source input ↔ target (encode input)

/-- Alias for the extensional relation
`ExtensionalReduces`; this abbreviation carries no computability assertion. -/
abbrev ManyOneReduces
    {Source Target : Type}
    (source : Source → Prop) (target : Target → Prop) : Prop :=
  ExtensionalReduces source target

/-- Extensional hardness for predicates recognized by the fixed natural
interpreter. -/
def NatMachineExtensionalHard {Target : Type} (target : Target → Prop) : Prop :=
  ∀ (source : Nat → Prop),
    NatRecognizable source → ExtensionalReduces source target

/-- Interpreter-relative extensional completeness with an executable target
test. -/
def NatMachineExtensionalComplete {Target : Type} (target : Target → Prop) : Prop :=
  BoundedlySemidecidable target ∧ NatMachineExtensionalHard target

/-- Compatibility name for `NatMachineExtensionalHard`. -/
abbrev NatMachineHard {Target : Type} (target : Target → Prop) : Prop :=
  NatMachineExtensionalHard target

/-- Compatibility name for `NatMachineExtensionalComplete`. -/
abbrev NatMachineComplete {Target : Type} (target : Target → Prop) : Prop :=
  NatMachineExtensionalComplete target

namespace ExtensionalReduces

theorem refl {Input : Type} (predicate : Input → Prop) :
    ExtensionalReduces predicate predicate :=
  ⟨id, fun _ => Iff.rfl⟩

theorem trans
    {First Second Third : Type}
    {first : First → Prop} {second : Second → Prop} {third : Third → Prop}
    (firstSecond : ExtensionalReduces first second)
    (secondThird : ExtensionalReduces second third) :
    ExtensionalReduces first third := by
  rcases firstSecond with ⟨encodeFirst, hfirst⟩
  rcases secondThird with ⟨encodeSecond, hsecond⟩
  exact ⟨fun input => encodeSecond (encodeFirst input), fun input =>
    (hfirst input).trans (hsecond (encodeFirst input))⟩

end ExtensionalReduces

namespace ManyOneReduces

/-- Equivalent form of `ExtensionalReduces.refl`. -/
theorem refl {Input : Type} (predicate : Input → Prop) :
    ManyOneReduces predicate predicate :=
  ExtensionalReduces.refl predicate

/-- Equivalent form of `ExtensionalReduces.trans`. -/
theorem trans
    {First Second Third : Type}
    {first : First → Prop} {second : Second → Prop} {third : Third → Prop}
    (firstSecond : ManyOneReduces first second)
    (secondThird : ManyOneReduces second third) :
    ManyOneReduces first third :=
  ExtensionalReduces.trans firstSecond secondThird

end ManyOneReduces

namespace ReducesVia

/-- A specified reduction map supplies the corresponding extensional
reduction. -/
theorem extensional
    {Source Target : Type}
    {encode : Source → Target}
    {source : Source → Prop} {target : Target → Prop}
    (reduction : ReducesVia encode source target) :
    ExtensionalReduces source target :=
  ⟨encode, reduction⟩

/-- Equivalent form of `ReducesVia.extensional`. -/
theorem manyOne
    {Source Target : Type}
    {encode : Source → Target}
    {source : Source → Prop} {target : Target → Prop}
    (reduction : ReducesVia encode source target) :
    ManyOneReduces source target :=
  extensional reduction

/-- Composition retains the two specified maps in the resulting map. -/
theorem trans
    {First Second Third : Type}
    {encodeFirst : First → Second} {encodeSecond : Second → Third}
    {first : First → Prop} {second : Second → Prop} {third : Third → Prop}
    (firstSecond : ReducesVia encodeFirst first second)
    (secondThird : ReducesVia encodeSecond second third) :
    ReducesVia (fun input => encodeSecond (encodeFirst input)) first third :=
  fun input => (firstSecond input).trans (secondThird (encodeFirst input))

end ReducesVia

theorem semidecidable_of_reduces
    {Source Target : Type}
    {source : Source → Prop} {target : Target → Prop}
    (reduction : ExtensionalReduces source target)
    (targetSemi : BoundedlySemidecidable target) :
    BoundedlySemidecidable source := by
  rcases reduction with ⟨encode, hencode⟩
  rcases targetSemi with ⟨test, htest⟩
  exact ⟨fun input witness => test (encode input) witness,
    fun input => (hencode input).trans (htest (encode input))⟩

theorem complete_of_complete_reduces
    {Source Target : Type}
    {source : Source → Prop} {target : Target → Prop}
    (sourceComplete : NatMachineExtensionalComplete source)
    (reduction : ExtensionalReduces source target)
    (targetSemi : BoundedlySemidecidable target) :
    NatMachineExtensionalComplete target := by
  refine ⟨targetSemi, ?_⟩
  intro predicate predicateRecognizable
  exact ExtensionalReduces.trans
    (sourceComplete.2 predicate predicateRecognizable) reduction

theorem semidecidable_congr
    {Input : Type} {first second : Input → Prop}
    (equivalent : ∀ input, first input ↔ second input)
    (firstSemi : BoundedlySemidecidable first) :
    BoundedlySemidecidable second := by
  rcases firstSemi with ⟨test, htest⟩
  exact ⟨test, fun input => (equivalent input).symm.trans (htest input)⟩

theorem universalAcceptance_semidecidable :
    BoundedlySemidecidable NatMachine.UniversalAccepts := by
  exact ⟨fun job fuel =>
    NatMachine.acceptsWithin job.program job.input fuel,
    fun _ => Iff.rfl⟩

theorem universalAcceptance_hard :
    NatMachineExtensionalHard NatMachine.UniversalAccepts := by
  intro predicate recognizable
  rcases recognizable with ⟨program, recognizes⟩
  exact ⟨fun input => ⟨program, input⟩, recognizes⟩

/-- Universal natural bytecode acceptance is interpreter-relative complete. -/
theorem universalAcceptance_complete :
    NatMachineExtensionalComplete NatMachine.UniversalAccepts :=
  ⟨universalAcceptance_semidecidable, universalAcceptance_hard⟩

end PureSFormal.Computation
