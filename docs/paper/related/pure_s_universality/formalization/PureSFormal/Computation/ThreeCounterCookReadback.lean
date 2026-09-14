import PureSFormal.Computation.CookRegisteredReadback
import PureSFormal.Computation.ThreeCounterTagOutputBoundary
import PureSFormal.Computation.DeterministicTapeTrajectoryDecoder

/-!
# Literal counter and tape readback at live Cook boundaries

The decoder composes checked Cook parsing, the fixed-machine data inverse,
deletion-two alignment recovery, numerical symbol inversion, live counter
readback, and literal tape-stack parsing. Its runtime inputs are the finite
primitive program and the current CTS configuration.

The exact inverse theorem covers encoded live boundaries with arbitrary
Rogozhin padding and either registered Cook form. It does not supply the
remaining source-horizon reachability theorem for these particular boundaries,
and it does not invert the data-erasing halting pair.
-/

namespace PureSFormal.Computation.ThreeCounterCookReadback

open ThreeCounter ThreeCounterTag ThreeCounterTag.Numeric
open Cook Cook.PassClassification RogozhinT2Simulation
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeCounterCompiler DeterministicTapeThreeCounterCompiler

/-- The table-generating inverse treats out-of-range labels as `sink`.
Readback explicitly restores the separate ordinary halting label. -/
def decodeSymbol (program : ThreeCounter.Program) (label : Nat) : ThreeCounterTag.Symbol :=
  if label = ordinaryCount program then .halt else Numeric.decodeSymbol program label

theorem decodeSymbol_encodeSymbol (program : ThreeCounter.Program)
    (symbol : ThreeCounterTag.Symbol) (bounded : Bounded program symbol) :
    decodeSymbol program (encodeSymbol program symbol) = symbol := by
  by_cases halting : symbol = .halt
  · subst symbol
    exact if_pos rfl
  · have notHalt : encodeSymbol program symbol ≠ ordinaryCount program := by
      intro equal
      apply halting
      apply (encodeSymbol_eq_haltLabel_iff bounded).mp
      rw [ordinaryProgram_haltLabel]
      exact equal
    rw [decodeSymbol, if_neg notHalt]
    exact decode_encode bounded halting

theorem decodeSymbols_encodeWord (program : ThreeCounter.Program)
    (word : List ThreeCounterTag.Symbol) (bounded : WordBounded program word) :
    (Numeric.encodeWord program word).map (decodeSymbol program) = word := by
  induction word with
  | nil => rfl
  | cons first rest ih =>
      change decodeSymbol program (encodeSymbol program first) ::
        (Numeric.encodeWord program rest).map (decodeSymbol program) = first :: rest
      rw [decodeSymbol_encodeSymbol program first (bounded first (List.Mem.head _)),
        ih (fun symbol member => bounded symbol (List.Mem.tail first member))]

/-- Check an ordinary numerical word against the reconstructed live state. -/
def decodeCounterWord? (program : ThreeCounter.Program) (word : List Nat) :
    Option ThreeCounter.State :=
  ThreeCounterTagOutputBoundary.decodeLive? program (word.map (decodeSymbol program))

theorem decodeCounterWord?_encodeState (program : ThreeCounter.Program)
    (state : ThreeCounter.State) (running : state.status = .running)
    (live : instructionLive (instructionAt program state.control) = true) :
    decodeCounterWord? program (Numeric.encodeWord program (encodeState program state)) =
      some state := by
  rw [decodeCounterWord?, decodeSymbols_encodeWord program _ (encodeState_wordBounded _ _)]
  exact ThreeCounterTagOutputBoundary.decodeLive?_encodeState program state running live

/-- Complete live-counter readback from a current Cook CTS snapshot. -/
def decodeCounter? (program : ThreeCounter.Program)
    (snapshot : CTS.Config rogozhinCookProgram) : Option ThreeCounter.State :=
  (CookRegisteredReadback.decodeOrdinary? (ordinaryProgram program) snapshot).bind
    (decodeCounterWord? program)

/-- Compose literal stack parsing after the live-counter decoder. -/
def decodeTape? (program : ThreeCounter.Program)
    (snapshot : CTS.Config rogozhinCookProgram) : Option DeterministicTape.Row :=
  (decodeCounter? program snapshot).bind DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?

/-- The normalized word of a live state remains exactly readable through
arbitrary sweep padding and both valid registered Cook forms. -/
theorem decodeCounter?_registered_compileT2 (program : ThreeCounter.Program)
    (state : ThreeCounter.State) (running : state.status = .running)
    (live : instructionLive (instructionAt program state.control) = true)
    (padding : Nat)
    (boundary : RegisteredBoundary
      (compileWithPadding (compileT2 program state).program padding (compileT2 program state).word)) :
    decodeCounter? program
      (CTS.initial rogozhinCookProgram
        (Cook.encodeWord (registeredWord
          (compileWithPadding (compileT2 program state).program padding (compileT2 program state).word)
          boundary))) = some state := by
  unfold decodeCounter? CookRegisteredReadback.decodeOrdinary?
  rw [show DeletionTwoT2Normalizer.normalizeProgram (ordinaryProgram program) =
      (compileT2 program state).program from rfl]
  rw [CookRegisteredReadback.decodeTag?_registered_compileWithPadding
    _ (compileT2_isT2 program state) padding _ (compileT2_wellFormed program state).labels boundary]
  change ((DeletionTwoT2Readback.decodeWord? (ordinaryProgram program)
    (DeletionTwoT2Normalizer.normalizeWord (ordinaryProgram program)
      (Numeric.encodeWord program (encodeState program state)))).bind
        (decodeCounterWord? program)) = some state
  rw [DeletionTwoT2Readback.decodeWord?_normalizeWord _ _
    (encodeWord_labelsValid (encodeState_wordBounded program state))]
  exact decodeCounterWord?_encodeState program state running live

/-- The literal tape row is recovered at every live represented source-state
boundary in this codec family, including all left/right tape fragments. -/
theorem decodeTape?_registered_boundary (machine : DeterministicTape.Machine)
    (state : Nat) (bounded : state < machine.states.length)
    (left right : List Bool) (rightNonempty : right ≠ []) (padding : Nat)
    (boundary : RegisteredBoundary
      (compileWithPadding
        (compileT2 (Compiler.compileMachine machine)
          (Execution.boundaryState (configurationOf state left right))).program padding
        (compileT2 (Compiler.compileMachine machine)
          (Execution.boundaryState (configurationOf state left right))).word)) :
    decodeTape? (Compiler.compileMachine machine)
      (CTS.initial rogozhinCookProgram
        (Cook.encodeWord (registeredWord
          (compileWithPadding
            (compileT2 (Compiler.compileMachine machine)
              (Execution.boundaryState (configurationOf state left right))).program padding
            (compileT2 (Compiler.compileMachine machine)
              (Execution.boundaryState (configurationOf state left right))).word)
          boundary))) = some (rowOf state left right) := by
  have live : instructionLive
      (instructionAt (Compiler.compileMachine machine)
        (Execution.boundaryState (configurationOf state left right)).control) = true := by
    change instructionLive
      (instructionAt (Compiler.compileMachine machine) (Compiler.boundaryAddress state)) = true
    rw [Compiler.boundaryAddress, Compiler.instructionAt_compileMachine bounded]
    rfl
  rw [decodeTape?, decodeCounter?_registered_compileT2 _ _ rfl live padding boundary]
  exact DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_boundaryState_configurationOf
    state left right rightNonempty

end PureSFormal.Computation.ThreeCounterCookReadback
