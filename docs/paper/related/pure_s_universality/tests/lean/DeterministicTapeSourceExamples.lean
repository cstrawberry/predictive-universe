import PureSFormal.Research.ProtectedTrieDeterministicCompiler

/-!
Small deterministic source examples using the library's literal finite-window
semantics. The 37 output records describe exact source horizons, including
failure beyond a halt. They do not execute the downstream universal encoder.
-/

namespace DeterministicTapeSourceExamples

open PureSFormal.Research
open PureSFormal.Research.ProtectedTrieDeterministicCompiler

def immediateMachine : DeterministicTape.Machine :=
  ⟨[⟨none, none⟩]⟩

def immediateSource (input : List Bool) : DeterministicTape.Instance :=
  ⟨immediateMachine, 0, input⟩

def flipMachine : DeterministicTape.Machine :=
  ⟨[⟨some ⟨true, .stay, 1⟩, some ⟨false, .stay, 1⟩⟩,
    ⟨none, none⟩]⟩

def growthMachine (direction : ProtectedTrieMachine.Direction) :
    DeterministicTape.Machine :=
  ⟨[⟨some ⟨true, direction, 1⟩, some ⟨false, direction, 1⟩⟩,
    ⟨some ⟨true, direction, 2⟩, some ⟨true, direction, 2⟩⟩,
    ⟨none, none⟩]⟩

def loopMachine : DeterministicTape.Machine :=
  ⟨[⟨some ⟨false, .stay, 0⟩, some ⟨true, .stay, 0⟩⟩]⟩

def loopSource (input : Bool) : DeterministicTape.Instance :=
  ⟨loopMachine, 0, [input]⟩

/-- Undefined entries halt immediately for every finite input, including []. -/
theorem immediate_step (input : List Bool) :
    DeterministicTape.step? immediateMachine
      (DeterministicTape.initialRow (immediateSource input)) = none := by
  cases input with
  | nil => rfl
  | cons bit tail => cases bit <;> rfl

/-- The input bit is the literal scanned symbol in either loop fixture. -/
theorem loop_input (input : Bool) :
    ProtectedTrieMachine.scanned?
      (DeterministicTape.initialRow (loopSource input)) = some input := by
  rfl

/-- A live source transition can preserve the entire literal row. -/
theorem loop_step (input : Bool) :
    DeterministicTape.step? loopMachine
      (DeterministicTape.initialRow (loopSource input)) =
      some (DeterministicTape.initialRow (loopSource input)) := by
  cases input <;> rfl

/-- Repeated row equality does not identify a unique source horizon. -/
theorem loop_run (input : Bool) (horizon : Nat) :
    DeterministicTape.runFor? loopMachine
      (DeterministicTape.initialRow (loopSource input)) horizon =
      some (DeterministicTape.initialRow (loopSource input)) := by
  induction horizon with
  | zero => rfl
  | succ horizon ih =>
      change (DeterministicTape.step? loopMachine
        (DeterministicTape.initialRow (loopSource input))).bind
          (fun next => DeterministicTape.runFor? loopMachine next horizon) = _
      rw [loop_step]
      exact ih

structure Example where
  name : String
  source : DeterministicTape.Instance
  lastHorizon : Nat

def examples : List Example :=
  [⟨"immediate_empty", immediateSource [], 2⟩,
   ⟨"immediate_false", immediateSource [false], 2⟩,
   ⟨"immediate_true", immediateSource [true], 2⟩,
   ⟨"flip_false", ⟨flipMachine, 0, [false]⟩, 3⟩,
   ⟨"flip_true", ⟨flipMachine, 0, [true]⟩, 3⟩,
   ⟨"left_growth", ⟨growthMachine .left, 0, [false]⟩, 4⟩,
   ⟨"right_growth", ⟨growthMachine .right, 0, [true]⟩, 4⟩,
   ⟨"loop_false", loopSource false, 4⟩,
   ⟨"loop_true", loopSource true, 4⟩]

def bitText (bit : Bool) : String := if bit then "1" else "0"

def tapeText (bits : List Bool) : String :=
  String.ofList (bits.map fun bit => if bit then '1' else '0')

def emit (fixture : Example) (horizon : Nat) : IO Unit := do
  let source := fixture.source
  match DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) horizon with
  | none => IO.println s!"SOURCE|{fixture.name}|{horizon}|none"
  | some row =>
      match ProtectedTrieMachine.scanned? row with
      | none =>
          throw (IO.userError s!"invalid scanned position: {fixture.name}/{horizon}")
      | some scanned =>
          let halted := (DeterministicTape.step? source.machine row).isNone
          IO.println s!"SOURCE|{fixture.name}|{horizon}|{row.state}|{row.head}|{tapeText row.tape}|{bitText scanned}|{bitText halted}"

def run : IO Unit := do
  for fixture in examples do
    for horizon in List.range (fixture.lastHorizon + 1) do
      emit fixture horizon

end DeterministicTapeSourceExamples

def main : IO Unit := DeterministicTapeSourceExamples.run
