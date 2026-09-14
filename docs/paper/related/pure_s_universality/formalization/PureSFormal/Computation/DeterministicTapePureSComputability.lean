import PureSFormal.Computation.DeterministicTapeCode
import PureSFormal.Computation.DeterministicTapePureS
import PureSFormal.Computation.PartialRecursive
import PureSFormal.PureS.EncoderSize

/-!
# Closed code for the fixed pure-S generator

This module closes the last, pure-S-specific part of the effective encoder.
It constructs a closed primitive-recursive program which consumes the
repository's bijective natural code of a Boolean word and returns the
canonical natural code of the literal generator term.  The construction is
uniform in the closed action term and is instantiated below at the fixed
period-912 endpoint.

`encodeTermCode_primitiveRecursive_of_encodeBitsCode` gives the composition
interface for a primitive-recursive certificate of the exact
`DeterministicTapeCook.encodeBits` code map. `CookEncodingComputability`
constructs that certificate and the complete tape-instance encoder program.
-/

namespace PureSFormal.Computation.DeterministicTapePureSComputability

open PureSFormal.PureS
open PureSFormal.Computation.DeterministicTapeCode

namespace Program

theorem eval_exact_unary (program : PRCode 1) (input : Nat) :
    PRCode.eval program [input] = PRCode.eval₁ program input :=
  rfl

theorem eval_exact_binary (program : PRCode 2) (first second : Nat) :
    PRCode.eval program [first, second] =
      PRCode.eval₂ program first second :=
  rfl

@[simp]
theorem eval₁_composeUnary (outer : PRCode 1) (inner : PRCode 1)
    (input : Nat) :
    PRCode.eval₁ (PRCode.composeUnary outer inner) input =
      PRCode.eval₁ outer (PRCode.eval₁ inner input) := by
  change PRCode.eval (PRCode.composeUnary outer inner) [input] = _
  rw [PRCode.eval_composeUnary]
  rfl

@[simp]
theorem eval₁_composeBinary (outer : PRCode 2)
    (first second : PRCode 1) (input : Nat) :
    PRCode.eval₁ (PRCode.composeBinary outer first second) input =
      PRCode.eval₂ outer (PRCode.eval₁ first input)
        (PRCode.eval₁ second input) := by
  change PRCode.eval (PRCode.composeBinary outer first second) [input] = _
  rw [PRCode.eval_composeBinary]
  rfl

@[simp]
theorem eval₁_composeTernary (outer : PRCode 3)
    (first second third : PRCode 1) (input : Nat) :
    PRCode.eval₁ (PRCode.composeTernary outer first second third) input =
      PRCode.eval outer
        [PRCode.eval₁ first input, PRCode.eval₁ second input,
          PRCode.eval₁ third input] := by
  change PRCode.eval
      (PRCode.composeTernary outer first second third) [input] = _
  rw [PRCode.eval_composeTernary]
  rfl

@[simp]
theorem eval₁_constant (value input : Nat) :
    PRCode.eval₁ (PRCode.constant 1 value) input = value := by
  change PRCode.eval (PRCode.constant 1 value) [input] = value
  exact PRCode.eval_constant 1 value [input]

/-- Natural code of one application node from the codes of its children. -/
def termApplication : PRCode 2 :=
  PRCode.composeUnary .successor PRCode.cantorPair

@[simp]
theorem eval_termApplication (function argument : Nat) :
    PRCode.eval₂ termApplication function argument =
      Term.pair function argument + 1 := by
  change PRCode.eval termApplication [function, argument] = _
  rw [termApplication, PRCode.eval_composeUnary]
  change PRCode.eval₁ PRCode.successor
      (PRCode.eval₂ PRCode.cantorPair function argument) = _
  rw [DeterministicTapeCode.eval₂_cantorPair_eq_termPair]
  rfl

/-- Apply a unary coded term constructor to two unary subprograms. -/
def applicationOf (function argument : PRCode 1) : PRCode 1 :=
  PRCode.composeBinary termApplication function argument

@[simp]
theorem eval_applicationOf (function argument : PRCode 1) (input : Nat) :
    PRCode.eval₁ (applicationOf function argument) input =
      Term.pair (PRCode.eval₁ function input)
        (PRCode.eval₁ argument input) + 1 := by
  change PRCode.eval (applicationOf function argument) [input] = _
  rw [applicationOf, PRCode.eval_composeBinary]
  change PRCode.eval₂ termApplication
      (PRCode.eval₁ function input) (PRCode.eval₁ argument input) = _
  rw [eval_termApplication]

/-- Encode the state `(remaining Boolean-list code, accumulated term code)`. -/
def stateOf (remaining accumulated : PRCode 1) : PRCode 1 :=
  PRCode.composeBinary PRCode.cantorPair remaining accumulated

@[simp]
theorem eval_stateOf (remaining accumulated : PRCode 1) (input : Nat) :
    PRCode.eval₁ (stateOf remaining accumulated) input =
      Term.pair (PRCode.eval₁ remaining input)
        (PRCode.eval₁ accumulated input) := by
  change PRCode.eval (stateOf remaining accumulated) [input] = _
  rw [stateOf, PRCode.eval_composeBinary]
  change PRCode.eval₂ PRCode.cantorPair
      (PRCode.eval₁ remaining input) (PRCode.eval₁ accumulated input) = _
  rw [DeterministicTapeCode.eval₂_cantorPair_eq_termPair]

/-- One bounded decoder/fold step on the paired word-building state. -/
def wordStateStep : PRCode 1 :=
  let state : PRCode 1 := PRCode.identity
  let remaining : PRCode 1 :=
    PRCode.composeUnary PRCode.cantorLeft state
  let accumulated : PRCode 1 :=
    PRCode.composeUnary PRCode.cantorRight state
  let predecessor : PRCode 1 :=
    PRCode.composeUnary PRCode.predecessor remaining
  let tail : PRCode 1 :=
    PRCode.composeBinary PRCode.division predecessor (PRCode.constant 1 2)
  let bit : PRCode 1 :=
    PRCode.composeBinary PRCode.modulus predecessor (PRCode.constant 1 2)
  let liveCode : PRCode 1 :=
    PRCode.composeTernary PRCode.branchIfZero
      (PRCode.constant 1 (Term.code (live false)))
      (PRCode.constant 1 (Term.code (live true))) bit
  let nextAccumulated : PRCode 1 := applicationOf liveCode accumulated
  let advanced : PRCode 1 := stateOf tail nextAccumulated
  PRCode.composeTernary PRCode.branchIfZero state advanced remaining

/-- Executable arithmetic semantics of `wordStateStep`. -/
def wordStateStepValue (state : Nat) : Nat :=
  let remaining := (Term.unpair state).1
  let accumulated := (Term.unpair state).2
  if remaining = 0 then
    state
  else
    let predecessor := remaining - 1
    let bit := predecessor % 2
    let liveCode := if bit = 0 then Term.code (live false)
      else Term.code (live true)
    Term.pair (predecessor / 2)
      (Term.pair liveCode accumulated + 1)

@[simp]
theorem eval_wordStateStep (state : Nat) :
    PRCode.eval₁ wordStateStep state = wordStateStepValue state := by
  change PRCode.eval wordStateStep [state] = wordStateStepValue state
  unfold wordStateStep
  rw [PRCode.eval_composeTernary]
  simp only [PRCode.eval_composeUnary,
    PRCode.eval_composeBinary,
    eval_exact_unary, eval_exact_binary,
    eval₁_composeUnary, eval₁_composeBinary, eval₁_composeTernary,
    PRCode.eval₁_predecessor, PRCode.eval₂_division,
    PRCode.eval₂_modulus, PRCode.eval_constant,
    PRCode.eval_branchIfZero, PRCode.eval_identity,
    DeterministicTapeCode.eval₁_cantorLeft_eq_unpair_fst,
    DeterministicTapeCode.eval₁_cantorRight_eq_unpair_snd,
    DeterministicTapeCode.eval₂_cantorPair_eq_termPair,
    eval_stateOf, eval_applicationOf, eval₁_constant, wordStateStepValue]

/-- Iterate the state transformer, retaining the original word code as a
parameter and using the second argument as the primitive-recursion bound. -/
def wordStateLoop : PRCode 2 :=
  .recursion
    (stateOf (.projection 0) (.zero 1))
    (PRCode.composeUnary wordStateStep (.projection 2))

/-- Mathematical recurrence computed by `wordStateLoop`. -/
def runWordState (initial : Nat) : Nat → Nat
  | 0 => initial
  | fuel + 1 => wordStateStepValue (runWordState initial fuel)

@[simp]
theorem eval_wordStateLoop (wordCode fuel : Nat) :
    PRCode.eval₂ wordStateLoop wordCode fuel =
      runWordState (Term.pair wordCode 0) fuel := by
  induction fuel with
  | zero =>
      change PRCode.eval₁
          (stateOf (.projection 0) (.zero 1)) wordCode =
        Term.pair wordCode 0
      rw [eval_stateOf]
      rfl
  | succ fuel ih =>
      change PRCode.eval₁ wordStateStep
          (PRCode.eval₂ wordStateLoop wordCode fuel) =
        wordStateStepValue (runWordState (Term.pair wordCode 0) fuel)
      rw [eval_wordStateStep, ih]

/-- Run the bounded word fold for exactly the input-code value. -/
def wordStateProgram : PRCode 1 :=
  .composition wordStateLoop (fun _ => PRCode.identity)

/-- Extract the accumulated term code from the completed state. -/
def wordCodeProgram : PRCode 1 :=
  PRCode.composeUnary PRCode.cantorRight wordStateProgram

end Program

namespace WordCorrectness

open Program

theorem runWordState_add (initial first second : Nat) :
    runWordState initial (first + second) =
      runWordState (runWordState initial first) second := by
  induction second with
  | zero => simp [runWordState]
  | succ second ih =>
      rw [Nat.add_succ, runWordState, runWordState, ih]

/-- Repeated application may be exposed at the front as well as at the end. -/
theorem runWordState_succ_front (initial fuel : Nat) :
    runWordState initial (fuel + 1) =
      runWordState (wordStateStepValue initial) fuel := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      change wordStateStepValue (runWordState initial (fuel + 1)) =
        wordStateStepValue
          (runWordState (wordStateStepValue initial) fuel)
      exact congrArg wordStateStepValue ih

@[simp]
theorem wordStateStepValue_zero (accumulated : Term) :
    wordStateStepValue (Term.pair 0 accumulated.code) =
      Term.pair 0 accumulated.code := by
  simp [wordStateStepValue, Term.unpair_pair]

@[simp]
theorem runWordState_zero (fuel : Nat) (accumulated : Term) :
    runWordState (Term.pair 0 accumulated.code) fuel =
      Term.pair 0 accumulated.code := by
  induction fuel with
  | zero => rfl
  | succ fuel ih => simp [runWordState, ih]

@[simp]
theorem wordStateStepValue_cons (bit : Bool) (tail : List Bool)
    (accumulated : Term) :
    wordStateStepValue
        (Term.pair (bitListCode (bit :: tail)) accumulated.code) =
      Term.pair (bitListCode tail)
        (Term.app (live bit) accumulated).code := by
  cases bit with
  | false =>
      have predecessor : 1 + 2 * bitListCode tail - 1 =
          2 * bitListCode tail := by
        exact Nat.add_sub_cancel_left 1 (2 * bitListCode tail)
      have quotient : (2 * bitListCode tail) / 2 = bitListCode tail :=
        Nat.mul_div_right (bitListCode tail) (by decide)
      have remainder : (2 * bitListCode tail) % 2 = 0 :=
        Nat.mul_mod_right 2 (bitListCode tail)
      simp [wordStateStepValue, bitListCode, Term.unpair_pair,
        predecessor, quotient, remainder, Term.code_app, Nat.add_comm]
  | true =>
      have predecessor : 2 + 2 * bitListCode tail - 1 =
          1 + 2 * bitListCode tail := by
        have rearranged : 2 + 2 * bitListCode tail =
            (1 + 2 * bitListCode tail) + 1 := by
          calc
            2 + 2 * bitListCode tail =
                Nat.succ (1 + 2 * bitListCode tail) := by
              rw [show 2 = Nat.succ 1 from rfl, Nat.succ_add]
            _ = (1 + 2 * bitListCode tail) + 1 :=
              Nat.succ_eq_add_one _
        rw [rearranged]
        exact Nat.add_sub_cancel (1 + 2 * bitListCode tail) 1
      have quotient : (1 + 2 * bitListCode tail) / 2 =
          bitListCode tail := by
        simpa only [Nat.add_comm] using
          DeterministicTapeCode.one_add_two_mul_div_two (bitListCode tail)
      have remainder : (1 + 2 * bitListCode tail) % 2 = 1 := by
        calc
          (1 + 2 * bitListCode tail) % 2 =
              (1 + bitListCode tail * 2) % 2 := by rw [Nat.mul_comm]
          _ = 1 % 2 :=
            Nat.add_mul_mod_self_right 1 (bitListCode tail) 2
          _ = 1 := Nat.mod_eq_of_lt (by decide)
      simp [wordStateStepValue, bitListCode, Term.unpair_pair,
        predecessor, quotient, remainder, Term.code_app, Nat.add_comm]

/-- The bounded arithmetic loop decodes every Boolean-list code and performs
the exact left fold used by `PureS.word`. -/
theorem runWordState_bitListCode (bits : List Bool) (start : Term) :
    runWordState (Term.pair (bitListCode bits) start.code)
        (bitListCode bits) =
      Term.pair 0
        (bits.foldl (fun accumulated bit => Term.app (live bit) accumulated)
          start).code := by
  induction bits generalizing start with
  | nil => rfl
  | cons bit tail ih =>
      cases bit with
      | false =>
          let tailCode := bitListCode tail
          have codeShape : 2 * tailCode = tailCode + tailCode := by
            rw [Nat.two_mul]
          have stepEq :
              wordStateStepValue
                  (Term.pair (2 * tailCode + 1) start.code) =
                Term.pair tailCode
                  (Term.app (live false) start).code := by
            simpa [tailCode, bitListCode] using
              wordStateStepValue_cons false tail start
          rw [bitListCode, runWordState_succ_front]
          rw [stepEq]
          rw [codeShape]
          rw [runWordState_add, ih]
          simp
      | true =>
          let tailCode := bitListCode tail
          have codeShape : 2 * tailCode + 1 =
              tailCode + (tailCode + 1) := by
            rw [Nat.two_mul, Nat.add_assoc]
          have stepEq :
              wordStateStepValue
                  (Term.pair (2 * tailCode + 2) start.code) =
                Term.pair tailCode
                  (Term.app (live true) start).code := by
            simpa [tailCode, bitListCode] using
              wordStateStepValue_cons true tail start
          change runWordState
              (Term.pair (2 * bitListCode tail + 2) start.code)
              ((2 * bitListCode tail + 1) + 1) = _
          rw [runWordState_succ_front]
          rw [stepEq]
          rw [codeShape]
          rw [runWordState_add, ih]
          simp

@[simp]
theorem eval_wordStateProgram (bits : List Bool) :
    PRCode.eval₁ Program.wordStateProgram (bitListCode bits) =
      Term.pair 0 (word bits).code := by
  change PRCode.eval Program.wordStateProgram [bitListCode bits] = _
  change PRCode.eval₂ Program.wordStateLoop (bitListCode bits)
      (bitListCode bits) = _
  rw [Program.eval_wordStateLoop]
  simpa [omega] using! runWordState_bitListCode bits omega

@[simp]
theorem eval_wordCodeProgram (bits : List Bool) :
    PRCode.eval₁ Program.wordCodeProgram (bitListCode bits) =
      (word bits).code := by
  change PRCode.eval Program.wordCodeProgram [bitListCode bits] = _
  rw [Program.wordCodeProgram, PRCode.eval_composeUnary]
  change PRCode.eval₁ PRCode.cantorRight
      (PRCode.eval₁ Program.wordStateProgram (bitListCode bits)) = _
  rw [eval_wordStateProgram,
    DeterministicTapeCode.eval₁_cantorRight_eq_unpair_snd,
    Term.unpair_pair]

end WordCorrectness

namespace Generator

open Program
open WordCorrectness

/-- Closed structural program mapping a word-term code to the code of the
generator with the supplied closed action term. -/
def shellProgram (actions : Term) : PRCode 1 :=
  let sCode := PRCode.constant 1 Term.s.code
  let actCode := PRCode.constant 1 (PureS.actCode actions).code
  let clockCode := PRCode.constant 1 (Term.app (C 0) (C 0)).code
  let seed := applicationOf sCode PRCode.identity
  let dispatcher := applicationOf (applicationOf sCode actCode) seed
  let environment := applicationOf sCode dispatcher
  applicationOf clockCode environment

@[simp]
theorem eval_shellProgram (actions wordTerm : Term) :
    PRCode.eval₁ (shellProgram actions) wordTerm.code =
      (Term.app (Term.app (C 0) (C 0))
        (Term.app Term.s
          (Term.app (Term.app Term.s (PureS.actCode actions))
            (Term.app Term.s wordTerm)))).code := by
  change PRCode.eval (shellProgram actions) [wordTerm.code] = _
  simp [shellProgram, Program.eval_exact_unary, eval_applicationOf,
    PRCode.eval_constant, Term.code_app, Nat.add_comm]

/-- Closed primitive-recursive program from a Boolean-list code to the code
of the literal pure-S generator. -/
def generatorProgram (actions : Term) : PRCode 1 :=
  PRCode.composeUnary (shellProgram actions) Program.wordCodeProgram

@[simp]
theorem generatorProgram_correct (actions : Term) (bits : List Bool) :
    PRCode.eval₁ (generatorProgram actions) (bitListCode bits) =
      (PureS.generator actions bits).code := by
  change PRCode.eval (generatorProgram actions) [bitListCode bits] = _
  rw [generatorProgram, PRCode.eval_composeUnary]
  change PRCode.eval₁ (shellProgram actions)
      (PRCode.eval₁ Program.wordCodeProgram (bitListCode bits)) = _
  rw [WordCorrectness.eval_wordCodeProgram,
    eval_shellProgram]
  rfl

/-- All-natural-input form, using the total inverse of the Boolean-list
numbering. -/
theorem generatorProgram_correct_total (actions : Term) (number : Nat) :
    PRCode.eval₁ (generatorProgram actions) number =
      (PureS.generator actions (bitListDecode number)).code := by
  have correct := generatorProgram_correct actions (bitListDecode number)
  rw [bitListCode_decode] at correct
  exact correct

/-- The general pure-S generator-code map is primitive recursive for every
fixed closed action term. -/
theorem generatorCode_primitiveRecursive (actions : Term) :
    PrimitiveRecursive
      (fun number => (PureS.generator actions (bitListDecode number)).code) :=
  ⟨generatorProgram actions, generatorProgram_correct_total actions⟩

/-- The same closed program supplies a minimization-program computability
certificate. -/
theorem generatorCode_computable (actions : Term) :
    PartialRecursive.Computable
      (fun number => (PureS.generator actions (bitListDecode number)).code) :=
  PrimitiveRecursive.computable (generatorCode_primitiveRecursive actions)

end Generator

namespace FixedEndpoint

/-- The closed action term of the literal period-912 universal endpoint. -/
abbrev actions : Term :=
  compileActions Cook.rogozhinCookProgram
    DeterministicTapePureS.dispatcher.tree

/-- Closed primitive-recursive program for the pure-S generator at the fixed
universal endpoint. -/
def generatorProgram : PRCode 1 := Generator.generatorProgram actions

@[simp]
theorem generatorProgram_correct (bits : List Bool) :
    PRCode.eval₁ generatorProgram (bitListCode bits) =
      (PureS.generator actions bits).code :=
  Generator.generatorProgram_correct actions bits

theorem generatorCode_primitiveRecursive :
    PrimitiveRecursive
      (fun number =>
        (PureS.generator actions (bitListDecode number)).code) :=
  Generator.generatorCode_primitiveRecursive actions

theorem generatorCode_computable :
    PartialRecursive.Computable
      (fun number =>
        (PureS.generator actions (bitListDecode number)).code) :=
  Generator.generatorCode_computable actions

/-- Composition with a primitive-recursive source compiler.  If the
natural code of `DeterministicTapeCook.encodeBits` is primitive recursive,
the actual tape-instance-to-pure-S term-code map is primitive recursive by
constructive composition with `generatorProgram`. -/
theorem encodeTermCode_primitiveRecursive_of_encodeBitsCode
    (encodeBitsCertificate :
      PrimitiveRecursive
        (fun number => bitListCode
          (DeterministicTapeCook.encodeBits
            (DeterministicTapeCode.instanceDecodeCode number)))) :
    PrimitiveRecursive
      (fun number =>
        (DeterministicTapePureS.encodeTerm
          (DeterministicTapeCode.instanceDecodeCode number)).code) := by
  rcases encodeBitsCertificate with ⟨encodeBitsProgram, encodeBitsCorrect⟩
  refine ⟨PRCode.composeUnary generatorProgram encodeBitsProgram, ?_⟩
  intro number
  change PRCode.eval
      (PRCode.composeUnary generatorProgram encodeBitsProgram) [number] = _
  rw [PRCode.eval_composeUnary]
  change PRCode.eval₁ generatorProgram
      (PRCode.eval₁ encodeBitsProgram number) = _
  rw [encodeBitsCorrect,
    generatorProgram_correct]
  rfl

/-- The computability-bearing version of the preceding transfer theorem. -/
theorem encodeTermCode_computable_of_encodeBitsCode_primitiveRecursive
    (encodeBitsCertificate :
      PrimitiveRecursive
        (fun number => bitListCode
          (DeterministicTapeCook.encodeBits
            (DeterministicTapeCode.instanceDecodeCode number)))) :
    PartialRecursive.Computable
      (fun number =>
        (DeterministicTapePureS.encodeTerm
          (DeterministicTapeCode.instanceDecodeCode number)).code) :=
  PrimitiveRecursive.computable
    (encodeTermCode_primitiveRecursive_of_encodeBitsCode encodeBitsCertificate)

end FixedEndpoint

end PureSFormal.Computation.DeterministicTapePureSComputability
