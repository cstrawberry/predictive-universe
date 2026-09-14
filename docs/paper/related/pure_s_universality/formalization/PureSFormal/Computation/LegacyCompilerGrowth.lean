import PureSFormal.Computation.DeterministicTapeThreeCounterCompiler
import PureSFormal.Computation.ThreeCounterTag

/-!
# Exact growth of the retained arithmetic compiler chain

The deterministic-tape compiler represents a physical Boolean stack as a
binary natural number.  The subsequent three-counter-to-tag compiler
represents a counter value `n` by a literal unary block of length `2^n`.
This module records the resulting growth exactly.  These are properties of
the retained compiler; they do not rule out a different polynomial-horizon
compiler.
-/

namespace PureSFormal.Computation.LegacyCompilerGrowth

open DeterministicTapeCounterCompiler
open DeterministicTapeThreeCounterCompiler
open PureSFormal.Research.ProtectedTrieDeterministicCompiler

namespace Stack

/-- A physical stack of `width` zero bits has binary counter value exactly
`2^width`. -/
theorem encode_replicate_false (width : Nat) :
    StackCode.encode (List.replicate width false) = 2 ^ width := by
  induction width with
  | zero => rfl
  | succ width ih =>
      simp only [List.replicate_succ, StackCode.encode, StackCode.bit, ih,
        Nat.add_zero, Nat.pow_succ]
      exact Nat.mul_comm _ _

/-- The sentinel-free base used by the primitive pop routine is one below
the encoded zero stack. -/
theorem stackBase_replicate_false_add_one (width : Nat) :
    DeterministicTapeThreeCounterCompiler.Execution.stackBase
        (List.replicate width false) + 1 =
      2 ^ width := by
  rw [← encode_replicate_false]
  exact
    (DeterministicTapeThreeCounterCompiler.Execution.encode_eq_stackBase_add_one
      (List.replicate width false)).symm

end Stack

namespace PrimitiveClock

open DeterministicTapeThreeCounterCompiler.Execution

/-- Exact cost of the pair-consumption loop. -/
theorem pairClock_eq (pairs : Nat) (bit : Bool) :
    pairClock pairs bit = 3 * pairs + 1 + Layout.boolCode bit := by
  induction pairs with
  | zero => cases bit <;> rfl
  | succ pairs ih =>
      rw [pairClock, ih]
      simp [Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- Exact cost of the one-at-a-time restoration loop. -/
theorem transferClock_eq (remaining : Nat) :
    transferClock remaining = 2 * remaining + 1 := by
  induction remaining with
  | zero => rfl
  | succ remaining ih =>
      rw [transferClock, ih]
      simp [Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- Exact component decomposition of the primitive cost of exposing one
right-stack bit and restoring its tail. -/
theorem rightPopClock_eq (quotientBase : Nat) (bit : Bool) :
    rightPopClock quotientBase bit =
      3 +
        (3 * quotientBase + 1 + Layout.boolCode bit +
          rightRestoreClock (quotientBase + 1)) := by
  rw [rightPopClock, pairClock_eq]

/-- Popping the head of a zero-filled physical tail of width `width` already
requires at least an exponential number of primitive three-counter steps. -/
theorem two_pow_le_rightPopClock_replicate_false (width : Nat) :
    2 ^ width <=
      rightPopClock
        (DeterministicTapeThreeCounterCompiler.Execution.stackBase
          (List.replicate width false)) false := by
  rw [rightPopClock_eq]
  simp only [Layout.boolCode, Nat.add_zero]
  let base := DeterministicTapeThreeCounterCompiler.Execution.stackBase
    (List.replicate width false)
  have baseEq : base + 1 = 2 ^ width :=
    Stack.stackBase_replicate_false_add_one width
  rw [← baseEq]
  have baseLeTriple : base <= 3 * base :=
    Nat.le_mul_of_pos_left base (by decide : 0 < 3)
  have pairLe : base + 1 <= 3 * base + 1 :=
    Nat.add_le_add_right baseLeTriple 1
  exact Nat.le_trans pairLe
    (Nat.le_trans
      (Nat.le_add_right (3 * base + 1) (rightRestoreClock (base + 1)))
      (Nat.le_add_left _ 3))

end PrimitiveClock

namespace TagMaterialization

open ThreeCounter

/-- A live three-counter control row represents register value `value` by a
literal block of `scale * 2^value` symbols. -/
theorem dataBlock_length_of_live (program : Program) (control : Nat)
    (register : Register) (value : Nat)
    (live : ThreeCounterTag.instructionLive
      (instructionAt program control) = true) :
    (ThreeCounterTag.dataBlock program control register value).length =
      ThreeCounterTag.scale (instructionAt program control) register *
        2 ^ value := by
  simp [ThreeCounterTag.dataBlock, live, CounterMachineTag.radix]

/-- Every live register block contains at least its full radix-two unary
payload. -/
theorem two_pow_le_dataBlock_length_of_live (program : Program)
    (control : Nat) (register : Register) (value : Nat)
    (live : ThreeCounterTag.instructionLive
      (instructionAt program control) = true) :
    2 ^ value <=
      (ThreeCounterTag.dataBlock program control register value).length := by
  rw [dataBlock_length_of_live program control register value live]
  by_cases tested :
      ThreeCounterTag.instructionTested? (instructionAt program control) =
        some register
  · simp [ThreeCounterTag.scale, tested]
  · simp only [ThreeCounterTag.scale, tested, if_false]
    exact Nat.le_mul_of_pos_left (2 ^ value) (by decide : 0 < 2)

/-- Composing the two retained representations yields a literal
double-exponential lower bound in the physical stack width. -/
theorem two_pow_two_pow_le_dataBlock_of_zero_stack
    (program : Program) (control : Nat) (register : Register) (width : Nat)
    (live : ThreeCounterTag.instructionLive
      (instructionAt program control) = true) :
    2 ^ (2 ^ width) <=
      (ThreeCounterTag.dataBlock program control register
          (StackCode.encode (List.replicate width false))).length := by
  rw [Stack.encode_replicate_false]
  exact two_pow_le_dataBlock_length_of_live
    program control register (2 ^ width) live

/-- In a running three-counter encoding, the complete word contains the
literal right-register block as a sublist and is therefore at least as long. -/
theorem right_dataBlock_length_le_encodeState_running
    (program : Program) (control left right scratch : Nat) :
    (ThreeCounterTag.dataBlock program control .right right).length <=
      (ThreeCounterTag.encodeState program
        { control := control
          left := left
          right := right
          scratch := scratch
          status := .running }).length := by
  simp only [ThreeCounterTag.encodeState, ThreeCounterTag.canonical,
    List.length_append]
  exact Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ _)

/-- Actual retained-compiler corollary.  At every bounded source-state
boundary, a syntactic running configuration whose right counter contains a
zero-filled physical stack of width `width` expands under the existing tag
encoder to at least `2^(2^width)` literal symbols.  The statement is about
the compiler representation and does not assert that this particular family
of boundary configurations is reachable from a fixed input. -/
theorem two_pow_two_pow_le_compiled_boundary_encodeState
    (machine : DeterministicTape.Machine) (state width : Nat)
    (bounded : state < machine.states.length) :
    2 ^ (2 ^ width) <=
      (ThreeCounterTag.encodeState
        (DeterministicTapeThreeCounterCompiler.Compiler.compileMachine machine)
        (DeterministicTapeThreeCounterCompiler.Execution.runningState
          (DeterministicTapeThreeCounterCompiler.Compiler.boundaryAddress state)
          0 (StackCode.encode (List.replicate width false)) 0)).length := by
  let program :=
    DeterministicTapeThreeCounterCompiler.Compiler.compileMachine machine
  let control :=
    DeterministicTapeThreeCounterCompiler.Compiler.boundaryAddress state
  have instructionEq :
      ThreeCounter.instructionAt program control =
        DeterministicTapeThreeCounterCompiler.Compiler.instructionFor machine
          state (.right .start) := by
    exact
      DeterministicTapeThreeCounterCompiler.Compiler.instructionAt_compileMachine
        bounded (.right .start)
  have live :
      ThreeCounterTag.instructionLive
        (ThreeCounter.instructionAt program control) = true := by
    rw [instructionEq]
    rfl
  have blockLower := two_pow_two_pow_le_dataBlock_of_zero_stack
    program control .right width live
  have contained := right_dataBlock_length_le_encodeState_running
    program control 0 (StackCode.encode (List.replicate width false)) 0
  exact Nat.le_trans blockLower (by
    simpa [program, control,
      DeterministicTapeThreeCounterCompiler.Execution.runningState] using
      contained)

end TagMaterialization

end PureSFormal.Computation.LegacyCompilerGrowth
