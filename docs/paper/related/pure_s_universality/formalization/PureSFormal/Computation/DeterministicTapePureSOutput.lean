import PureSFormal.Computation.CookSeedPassSourceReflection
import PureSFormal.Computation.DeterministicTapeStatePaddingComputability
import PureSFormal.PureS.CheckpointSeedReflection
import PureSFormal.PureS.BalancedActionTree

/-!
# Literal source computation and output on the pure-S contraction path

Three fixed observers read a source row, a terminal source row, or its scanned
bit from the current bare term. The immutable seed supplies static decoding
information; the term also supplies the current CTS horizon and snapshot.
Every accepted result comes from the encoded source run, and every defined
source row and terminal output occurs on the actual contraction path.

The path here is the fixed persistent-cursor scheduler. The output and
encoding theorems do not assume root-restarted selection.
-/

namespace PureSFormal.Computation.DeterministicTapePureSOutput

open PureS
open PureSFormal.Research.ProtectedTrieDeterministicCompiler

abbrev dispatcher : ActionDispatcher Cook.rogozhinCookProgram :=
  BalancedActionTree.dispatcher Cook.rogozhinCookProgram

def seed (source : DeterministicTape.Instance) : List Bool :=
  DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)

def encode (source : DeterministicTape.Instance) : Term :=
  DeterministicTapePureS.encodeTerm (DeterministicTapeStatePadding.pad source)

def termAt (source : DeterministicTape.Instance) (sample : Nat) : Term :=
  CheckpointSeedReflection.sampleTerm Cook.rogozhinCookProgram dispatcher (seed source) sample

def decodeRow? : Term → Option DeterministicTape.Row :=
  CheckpointSeedReflection.observe Cook.rogozhinCookProgram dispatcher.tree CookSeedPassReadback.decodeTape?

def decodeTerminalRow? : Term → Option DeterministicTape.Row :=
  CheckpointSeedReflection.observe Cook.rogozhinCookProgram dispatcher.tree CookSeedPassReadback.decodeTerminalTape?

def decodeScannedOutput? : Term → Option Bool :=
  CheckpointSeedReflection.observe Cook.rogozhinCookProgram dispatcher.tree CookSeedPassReadback.decodeScannedOutput?

def Returns (source : DeterministicTape.Instance) (output : Bool) : Prop :=
  ∃ sourceFuel row, DeterministicTape.runFor? source.machine
    (DeterministicTape.initialRow source) sourceFuel = some row ∧
    DeterministicTape.step? source.machine row = none ∧
    PureSFormal.Research.ProtectedTrieMachine.scanned? row = some output

theorem termAt_zero (source : DeterministicTape.Instance) : termAt source 0 = encode source := rfl

theorem termAt_step (source : DeterministicTape.Instance) (sample : Nat) :
    Step (termAt source sample) (termAt source (sample + 1)) := by
  let system := SchedulerInvariant.SampledGood.productiveSystem Cook.rogozhinCookProgram dispatcher (seed source)
    (SchedulerBound.bound Cook.rogozhinCookProgram dispatcher)
    (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram dispatcher (seed source))
    (SchedulerRecurrence.initialGood Cook.rogozhinCookProgram dispatcher (seed source))
  exact system.reductionPath.contracts sample

theorem encode_code_primitiveRecursive :
    PrimitiveRecursive (fun number => (encode (DeterministicTapeCode.instanceDecodeCode number)).code) :=
  DeterministicTapeStatePaddingComputability.paddedTerm_primitiveRecursive

theorem encode_code_computable :
    PartialRecursive.Computable (fun number => (encode (DeterministicTapeCode.instanceDecodeCode number)).code) :=
  DeterministicTapeStatePaddingComputability.paddedTerm_computable

theorem decodeRow?_actual_reflects (source : DeterministicTape.Instance)
    (sample : Nat) (row : DeterministicTape.Row)
    (accepted : decodeRow? (termAt source sample) = some row) :
    ∃ sourceFuel, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row := by
  obtain ⟨horizon, _, found⟩ :=
    (CheckpointSeedReflection.observe_actual_iff Cook.rogozhinCookProgram dispatcher
      CookSeedPassReadback.decodeTape? (seed source) sample row).mp accepted
  exact CookSeedPassSourceReflection.decodeTape?_padded_actual_reflects source horizon row found

theorem exists_literalRow_iff (source : DeterministicTape.Instance) (row : DeterministicTape.Row) :
    (∃ sample, decodeRow? (termAt source sample) = some row) ↔
    ∃ sourceFuel, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row :=
  (CheckpointSeedReflection.exists_observe_actual_iff Cook.rogozhinCookProgram dispatcher
    CookSeedPassReadback.decodeTape? (seed source) row).trans
    (CookSeedPassSourceReflection.exists_literalRow_iff source row)

theorem decodeTerminalRow?_actual_reflects (source : DeterministicTape.Instance)
    (sample : Nat) (row : DeterministicTape.Row)
    (accepted : decodeTerminalRow? (termAt source sample) = some row) :
    (∃ sourceFuel, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row) ∧
      DeterministicTape.step? source.machine row = none := by
  obtain ⟨horizon, _, found⟩ :=
    (CheckpointSeedReflection.observe_actual_iff Cook.rogozhinCookProgram dispatcher
      CookSeedPassReadback.decodeTerminalTape? (seed source) sample row).mp accepted
  exact CookSeedPassSourceReflection.decodeTerminalTape?_actual_reflects source horizon row found

theorem exists_terminalRow_iff (source : DeterministicTape.Instance) (row : DeterministicTape.Row) :
    (∃ sample, decodeTerminalRow? (termAt source sample) = some row) ↔
    (∃ sourceFuel, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row) ∧
      DeterministicTape.step? source.machine row = none :=
  (CheckpointSeedReflection.exists_observe_actual_iff Cook.rogozhinCookProgram dispatcher
    CookSeedPassReadback.decodeTerminalTape? (seed source) row).trans
    (CookSeedPassSourceReflection.exists_terminalRow_iff source row)

theorem halts_iff_exists_terminalRow (source : DeterministicTape.Instance) :
    DeterministicTape.Halts source ↔
      ∃ sample row, decodeTerminalRow? (termAt source sample) = some row := by
  constructor
  · rintro ⟨sourceFuel, row, sourceRun, halted⟩
    obtain ⟨sample, accepted⟩ := (exists_terminalRow_iff source row).mpr ⟨⟨sourceFuel, sourceRun⟩, halted⟩
    exact ⟨sample, row, accepted⟩
  · rintro ⟨sample, row, accepted⟩
    obtain ⟨⟨sourceFuel, sourceRun⟩, halted⟩ := decodeTerminalRow?_actual_reflects source sample row accepted
    exact ⟨sourceFuel, row, sourceRun, halted⟩

theorem exists_scannedOutput_iff (source : DeterministicTape.Instance) (output : Bool) :
    (∃ sample, decodeScannedOutput? (termAt source sample) = some output) ↔ Returns source output :=
  (CheckpointSeedReflection.exists_observe_actual_iff Cook.rogozhinCookProgram dispatcher
    CookSeedPassReadback.decodeScannedOutput? (seed source) output).trans
    (CookSeedPassSourceReflection.exists_scannedOutput_iff source output)

theorem decodeScannedOutput?_actual_reflects (source : DeterministicTape.Instance)
    (sample : Nat) (output : Bool)
    (accepted : decodeScannedOutput? (termAt source sample) = some output) : Returns source output :=
  (exists_scannedOutput_iff source output).mp ⟨sample, accepted⟩

theorem nonhalting_rejects_terminal (source : DeterministicTape.Instance)
    (nonhalting : ¬ DeterministicTape.Halts source) (sample : Nat) :
    decodeTerminalRow? (termAt source sample) = none := by
  cases found : decodeTerminalRow? (termAt source sample) with
  | none => rfl
  | some row => exact (nonhalting ((halts_iff_exists_terminalRow source).mpr ⟨sample, row, found⟩)).elim

theorem bitToggle_output_iff (input output : Bool) :
    (∃ sample, decodeScannedOutput? (termAt (CookSeedOutputExample.source input) sample) = some output) ↔
      output = !input :=
  (CheckpointSeedReflection.exists_observe_actual_iff Cook.rogozhinCookProgram dispatcher
    CookSeedPassReadback.decodeScannedOutput? (seed (CookSeedOutputExample.source input)) output).trans
    (CookSeedPassSourceReflection.bitToggle_output_iff input output)

end PureSFormal.Computation.DeterministicTapePureSOutput
