import PureSFormal.Computation.CookSeedTerminalReadback

/-!
# A computed nonconstant output at actual compiled checkpoints

One fixed source table flips its input bit and halts. The seed-only terminal
observer recovers both resulting literal rows at actual CTS iterates. These
existence statements do not classify every accepted intermediate snapshot.
-/

namespace PureSFormal.Computation.CookSeedOutputExample

open PureSFormal.Research.ProtectedTrieDeterministicCompiler

def machine : DeterministicTape.Machine :=
  ⟨[⟨some ⟨true, .stay, 1⟩, some ⟨false, .stay, 1⟩⟩, ⟨none, none⟩]⟩

def source (input : Bool) : DeterministicTape.Instance :=
  ⟨machine, 0, [input]⟩

def finalRow (input : Bool) : DeterministicTape.Row :=
  { state := 1, head := 1, tape := [false, !input, false] }

theorem run_one (input : Bool) :
    DeterministicTape.runFor? machine (DeterministicTape.initialRow (source input)) 1 =
      some (finalRow input) := by
  cases input <;> decide

theorem final_halted (input : Bool) :
    DeterministicTape.step? machine (finalRow input) = none := by
  cases input <;> decide

def seed (input : Bool) : List Bool :=
  DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad (source input))

def output? (original : List Bool) (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    Option Bool :=
  (CookSeedTerminalReadback.decodeTerminalTape? original snapshot).bind
    PureSFormal.Research.ProtectedTrieMachine.scanned?

theorem exists_actual_terminalRow (input : Bool) :
    ∃ ticks,
      CookSeedTerminalReadback.decodeTerminalTape? (seed input)
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram (seed input))) = some (finalRow input) :=
  CookSeedTerminalReadback.exists_terminalRow_of_runFor? (source input) 1 (finalRow input)
    (run_one input) (final_halted input)

/-- Both Boolean inputs have actual checkpoints exposing their computed
negation through the same snapshot observer and the same fixed source table. -/
theorem exists_actual_output (input : Bool) :
    ∃ ticks,
      output? (seed input)
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram (seed input))) = some (!input) := by
  obtain ⟨ticks, decoded⟩ := exists_actual_terminalRow input
  refine ⟨ticks, ?_⟩
  rw [output?, decoded]
  rfl

theorem computed_outputs_differ : finalRow false ≠ finalRow true := by decide

end PureSFormal.Computation.CookSeedOutputExample
