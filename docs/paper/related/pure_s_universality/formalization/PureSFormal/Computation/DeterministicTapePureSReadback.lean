import PureSFormal.PureS.CheckpointSeedReadback
import PureSFormal.PureS.BalancedActionTree
import PureSFormal.Computation.CookSeedOutputExample
import PureSFormal.Computation.DeterministicTapePureS

/-!
# Literal source-row observation on the actual pure-S path

The observers receive only the current pure-S term. The checkpoint parser
recovers the immutable seed and current cyclic-tag configuration; the seed
parser supplies the fixed snapshot reader's program information. No source
program, source horizon, or execution certificate is an observer argument.

Every defined source prefix, and every final source row, appears through these
observers at an actual contraction sample. These are completeness statements.
Soundness of all accepted intermediate samples requires execution-boundary
reflection through the compiler.
-/

namespace PureSFormal.Computation.DeterministicTapePureSReadback

open PureS
open Research.ProtectedTrieDeterministicCompiler

abbrev dispatcher : ActionDispatcher Cook.rogozhinCookProgram :=
  BalancedActionTree.dispatcher Cook.rogozhinCookProgram

def termAt (bits : List Bool) (sample : Nat) : Term :=
  let system := SchedulerInvariant.SampledGood.productiveSystem Cook.rogozhinCookProgram
    dispatcher bits (SchedulerBound.bound Cook.rogozhinCookProgram dispatcher)
    (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram dispatcher bits)
    (SchedulerRecurrence.initialGood Cook.rogozhinCookProgram dispatcher bits)
  (system.contractionRun sample).cursor.erase

def checkpointTime (bits : List Bool) (horizon : Nat) : Nat :=
  ExactCheckpointRun.checkpointTime Cook.rogozhinCookProgram dispatcher bits horizon

def withCheckpoint {α : Type}
    (read : List Bool → CTS.Config Cook.rogozhinCookProgram → Option α)
    (term : Term) : Option α :=
  (CheckpointSeedReadback.decode? Cook.rogozhinCookProgram dispatcher.tree term).bind
    (fun decoded => read decoded.1 decoded.2.2)

def decodeRow? (term : Term) : Option DeterministicTape.Row :=
  withCheckpoint CookSeedReadbackContext.decodeTape? term

def decodeTerminalRow? (term : Term) : Option DeterministicTape.Row :=
  withCheckpoint CookSeedTerminalReadback.decodeTerminalTape? term

def decodeScannedOutput? (term : Term) : Option Bool :=
  withCheckpoint CookSeedOutputExample.output? term

theorem withCheckpoint_at_checkpoint {α : Type}
    (read : List Bool → CTS.Config Cook.rogozhinCookProgram → Option α)
    (bits : List Bool) (horizon : Nat) :
    withCheckpoint read (termAt bits (checkpointTime bits horizon)) =
      read bits (CTS.iterate Cook.rogozhinCookProgram horizon
        (CTS.initial Cook.rogozhinCookProgram bits)) := by
  rw [withCheckpoint]
  have checkpoint := CheckpointSeedReadback.decode?_actualCheckpoint
    Cook.rogozhinCookProgram dispatcher bits horizon
  change CheckpointSeedReadback.decode? Cook.rogozhinCookProgram dispatcher.tree
    (termAt bits (checkpointTime bits horizon)) = _ at checkpoint
  rw [checkpoint]
  rfl

def seed (source : DeterministicTape.Instance) : List Bool :=
  DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)

theorem termAt_zero (source : DeterministicTape.Instance) :
    termAt (seed source) 0 =
      DeterministicTapePureS.encodeTerm (DeterministicTapeStatePadding.pad source) := by
  rfl

theorem exists_literalRow_at_actualPureS (source : DeterministicTape.Instance)
    (sourceHorizon : Nat) (row : DeterministicTape.Row)
    (run : DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceHorizon = some row) :
    ∃ sample, decodeRow? (termAt (seed source) sample) = some row := by
  obtain ⟨horizon, decoded⟩ :=
    CookSeedReadbackContext.exists_literalRow_at_actualCTS source sourceHorizon row run
  refine ⟨checkpointTime (seed source) horizon, ?_⟩
  rw [decodeRow?, withCheckpoint_at_checkpoint]
  exact decoded

theorem exists_terminalRow_of_runFor? (source : DeterministicTape.Instance)
    (sourceHorizon : Nat) (row : DeterministicTape.Row)
    (run : DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceHorizon = some row)
    (halted : DeterministicTape.step? source.machine row = none) :
    ∃ sample, decodeTerminalRow? (termAt (seed source) sample) = some row := by
  obtain ⟨horizon, decoded⟩ :=
    CookSeedTerminalReadback.exists_terminalRow_of_runFor? source sourceHorizon row run halted
  refine ⟨checkpointTime (seed source) horizon, ?_⟩
  rw [decodeTerminalRow?, withCheckpoint_at_checkpoint]
  exact decoded

theorem exists_terminalRow_at_actualPureS (source : DeterministicTape.Instance)
    (halts : DeterministicTape.Halts source) :
    ∃ sample row, decodeTerminalRow? (termAt (seed source) sample) = some row ∧
      DeterministicTape.step? source.machine row = none := by
  obtain ⟨sourceHorizon, row, run, halted⟩ := halts
  obtain ⟨sample, observed⟩ := exists_terminalRow_of_runFor? source sourceHorizon row run halted
  exact ⟨sample, row, observed, halted⟩

theorem bitToggle_at_actualPureS (input : Bool) :
    ∃ sample,
      decodeScannedOutput? (termAt (CookSeedOutputExample.seed input) sample) = some (!input) := by
  obtain ⟨horizon, output⟩ := CookSeedOutputExample.exists_actual_output input
  refine ⟨checkpointTime (CookSeedOutputExample.seed input) horizon, ?_⟩
  rw [decodeScannedOutput?, withCheckpoint_at_checkpoint]
  exact output

end PureSFormal.Computation.DeterministicTapePureSReadback
