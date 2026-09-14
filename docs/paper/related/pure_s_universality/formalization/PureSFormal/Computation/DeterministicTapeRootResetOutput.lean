import PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement
import PureSFormal.Computation.DeterministicTapePureSOutput
import PureSFormal.Computation.DeterministicTapeOutputQuartic
import PureSFormal.Computation.DeterministicTapePaddedEncoderConstructionMachine

/-! Literal source rows and returning output on iteration of the actual
finite root-restarted selector, using the fully certified padded encoder. -/
namespace PureSFormal.Computation.DeterministicTapeRootResetOutput
open PureS
open PureSFormal.Research
open PureSFormal.Research.ProtectedTrieDeterministicCompiler

abbrev selector := RootResetFiniteAllInputsTraceAgreement.selector Cook.rogozhinCookProgram
abbrev encode := DeterministicTapePureSOutput.encode

def termAt (source : DeterministicTape.Instance) (sample : Nat) : Term :=
  RootResetTermOnlyTransfer.run selector sample (encode source)

theorem termAt_eq_persistent (source : DeterministicTape.Instance) (sample : Nat) :
    termAt source sample = DeterministicTapePureSOutput.termAt source sample :=
  RootResetFiniteAllInputsTraceAgreement.termOnlyPath_eq_persistentPath Cook.rogozhinCookProgram
    (DeterministicTapePureSOutput.seed source) sample

theorem termAt_zero (source : DeterministicTape.Instance) : termAt source 0 = encode source := rfl

theorem selected_next (source : DeterministicTape.Instance) (sample : Nat) :
    selector (termAt source sample) = some (termAt source (sample + 1)) := by
  rw [termAt_eq_persistent, termAt_eq_persistent]
  exact RootResetFiniteAllInputsTraceAgreement.selectsEveryContractionRun Cook.rogozhinCookProgram
    DeterministicTapePureSOutput.dispatcher (DeterministicTapePureSOutput.seed source) sample

theorem termAt_step (source : DeterministicTape.Instance) (sample : Nat) :
    Step (termAt source sample) (termAt source (sample + 1)) := by
  rw [termAt_eq_persistent, termAt_eq_persistent]
  exact DeterministicTapePureSOutput.termAt_step source sample

theorem exists_observe_iff {α : Type} (observer : Term → Option α)
    (source : DeterministicTape.Instance) (value : α) :
    (∃ sample, observer (termAt source sample) = some value) ↔
      ∃ sample, observer (DeterministicTapePureSOutput.termAt source sample) = some value := by
  constructor
  · rintro ⟨sample, accepted⟩
    rw [termAt_eq_persistent] at accepted
    exact ⟨sample, accepted⟩
  · rintro ⟨sample, accepted⟩
    refine ⟨sample, ?_⟩
    rw [termAt_eq_persistent]
    exact accepted

theorem exists_literalRow_iff (source : DeterministicTape.Instance) (row : DeterministicTape.Row) :
    (∃ sample, DeterministicTapePureSOutput.decodeRow? (termAt source sample) = some row) ↔
      ∃ sourceFuel, DeterministicTape.runFor? source.machine
        (DeterministicTape.initialRow source) sourceFuel = some row :=
  (exists_observe_iff DeterministicTapePureSOutput.decodeRow? source row).trans
    (DeterministicTapePureSOutput.exists_literalRow_iff source row)

theorem exists_terminalRow_iff (source : DeterministicTape.Instance) (row : DeterministicTape.Row) :
    (∃ sample, DeterministicTapePureSOutput.decodeTerminalRow? (termAt source sample) = some row) ↔
      (∃ sourceFuel, DeterministicTape.runFor? source.machine
        (DeterministicTape.initialRow source) sourceFuel = some row) ∧
      DeterministicTape.step? source.machine row = none :=
  (exists_observe_iff DeterministicTapePureSOutput.decodeTerminalRow? source row).trans
    (DeterministicTapePureSOutput.exists_terminalRow_iff source row)

theorem exists_scannedOutput_iff (source : DeterministicTape.Instance) (output : Bool) :
    (∃ sample, DeterministicTapePureSOutput.decodeScannedOutput? (termAt source sample) = some output) ↔
      DeterministicTapePureSOutput.Returns source output :=
  (exists_observe_iff DeterministicTapePureSOutput.decodeScannedOutput? source output).trans
    (DeterministicTapePureSOutput.exists_scannedOutput_iff source output)

theorem nonhalting_rejects_terminal (source : DeterministicTape.Instance)
    (nonhalting : ¬ DeterministicTape.Halts source) (sample : Nat) :
    DeterministicTapePureSOutput.decodeTerminalRow? (termAt source sample) = none := by
  rw [termAt_eq_persistent]
  exact DeterministicTapePureSOutput.nonhalting_rejects_terminal source nonhalting sample

theorem bitToggle_output_iff (input output : Bool) :
    (∃ sample, DeterministicTapePureSOutput.decodeScannedOutput?
      (termAt (CookSeedOutputExample.source input) sample) = some output) ↔ output = !input :=
  (exists_observe_iff DeterministicTapePureSOutput.decodeScannedOutput? (CookSeedOutputExample.source input) output).trans
    (DeterministicTapePureSOutput.bitToggle_output_iff input output)

theorem source_output_iff (source : DeterministicTape.Instance) (output : Bool) :
    (∃ sample, (DeterministicTapeOutputPrimitive.scanned (termAt source sample)).value = some output) ↔
      DeterministicTapePureSOutput.Returns source output :=
  (exists_observe_iff (fun term => (DeterministicTapeOutputPrimitive.scanned term).value) source output).trans
    (DeterministicTapeOutputPrimitive.source_output_iff source output)

end PureSFormal.Computation.DeterministicTapeRootResetOutput
