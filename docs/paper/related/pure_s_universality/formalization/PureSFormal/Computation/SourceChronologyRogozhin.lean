import PureSFormal.Computation.SourceChronologyNormalizedTag

/-!
# Chronological source samples in actual Rogozhin execution

The existing Rogozhin boundary clock is explicit. Composing it with a coherent
finite normalized trace preserves strict source order and literal readback.
The normalized trace remains a supplied finite witness; this file introduces
no global choice of such witnesses and makes no CTS or pure-S chronology claim.
-/

namespace PureSFormal.Computation.SourceChronologyRogozhin

open RogozhinTagInput RogozhinT2Simulation
open SourceChronologyNormalizedTag
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open ThreeCounterTag ThreeCounterTag.Numeric

theorem boundaryTime_lt_succ {program : Program} {word : List Label}
    (wellFormed : WellFormed program word) (horizon : Nat) :
    boundaryTime program word horizon < boundaryTime program word (horizon + 1) := by
  obtain ⟨first, second, rest, currentEq⟩ := exists_two_prefix (wellFormed.iterate horizon).lengthTwo
  rw [boundaryTime, currentEq]
  exact Nat.lt_add_of_pos_left (nonhaltingMacroFuel_positive program (boundaryPadding program word horizon) first second rest)

/-- Strictness of the numerical clock alone holds for every well-formed word.
Its execution interpretation separately requires `NonhaltingBefore`. -/
theorem boundaryTime_strict {program : Program} {word : List Label}
    (wellFormed : WellFormed program word) (first second : Nat) (ordered : first < second) :
    boundaryTime program word first < boundaryTime program word second := by
  induction second with
  | zero => exact False.elim (Nat.not_lt_zero first ordered)
  | succ second ih =>
      have nextLt := boundaryTime_lt_succ wellFormed second
      cases Nat.eq_or_lt_of_le (Nat.le_of_lt_succ ordered) with
      | inl same => simpa only [same] using nextLt
      | inr before => exact Nat.lt_trans (ih before) nextLt

/-- Exactly the normalized instance in the existing source compiler chain. -/
def sourceT2 (source : DeterministicTape.Instance) : RogozhinTagInput.Job :=
  compileT2 (sourceProgram source) (sourceInitial source)

def machineTime {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (fuel : Nat) : Nat :=
  boundaryTime (sourceT2 source).program (sourceT2 source).word (trace.sourceTime fuel)

theorem machineTime_zero {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) : machineTime trace 0 = 0 := by
  rw [machineTime, trace.sourceTime_zero]
  rfl

theorem machineTime_strict {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some row)
    (first second : Nat) (ordered : first < second) (bounded : second ≤ horizon) :
    machineTime trace first < machineTime trace second := by
  exact boundaryTime_strict (compileT2_wellFormed (sourceProgram source) (sourceInitial source)) _ _
    (trace.sourceTime_strict row sourceRun first second ordered bounded)

theorem machineTime_exact {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint)
    (fuel : Nat) (bounded : fuel ≤ horizon) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    Rogozhin46.iterate (machineTime trace fuel) (RogozhinTagInput.compile (sourceT2 source)) =
      compileWithPadding (sourceT2 source).program
        (boundaryPadding (sourceT2 source).program (sourceT2 source).word (trace.sourceTime fuel))
        (RogozhinTagInput.iterate (sourceT2 source).program (trace.sourceTime fuel) (sourceT2 source).word) := by
  exact iterate_compileWithPadding_nonhaltingRun
    (compileT2_wellFormed (sourceProgram source) (sourceInitial source)) _
    (trace.sourceTime_nonhaltingBefore endpoint endpointRun fuel bounded row sourceRun)

theorem machineTime_decodes {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint)
    (fuel : Nat) (bounded : fuel ≤ horizon) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    (RogozhinT2BoundaryReadback.decodeBoundary? (sourceT2 source).program
      (Rogozhin46.iterate (machineTime trace fuel) (RogozhinTagInput.compile (sourceT2 source)))).bind
      (fun normalized => (DeletionTwoT2Readback.decodeWord? (ordinaryProgram (sourceProgram source)) normalized).bind
        (fun ordinary => (ThreeCounterCookReadback.decodeCounterWord? (sourceProgram source) ordinary).bind
          DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?)) = some row := by
  unfold machineTime sourceT2
  rw [RogozhinT2BoundaryReadback.decodeBoundary?_iterate_nonhaltingRun
    (compileT2_wellFormed (sourceProgram source) (sourceInitial source)) _
    (trace.sourceTime_nonhaltingBefore endpoint endpointRun fuel bounded row sourceRun)]
  exact trace.sourceTime_decodes endpoint endpointRun fuel bounded row sourceRun

/-- The entire actual machine prefix through each source checkpoint is safe,
providing the hypothesis needed by the next Cook registered-path layer. -/
theorem machineTime_safeThrough {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint)
    (fuel : Nat) (bounded : fuel ≤ horizon) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    SafeThrough (machineTime trace fuel) (RogozhinTagInput.compile (sourceT2 source)) := by
  exact safeThrough_compileWithPadding_nonhaltingRun
    (compileT2_wellFormed (sourceProgram source) (sourceInitial source)) _
    (trace.sourceTime_nonhaltingBefore endpoint endpointRun fuel bounded row sourceRun)

/-- Intermediate literal decoder with only the finite primitive program and
current machine configuration as inputs. It receives no source index or run. -/
def decodeMachineRow? (program : ThreeCounter.Program) (config : Rogozhin46.Config) :
    Option DeterministicTape.Row :=
  (RogozhinT2BoundaryReadback.decodeBoundary? (DeletionTwoT2Normalizer.normalizeProgram (ordinaryProgram program)) config).bind
    (fun normalized => (DeletionTwoT2Readback.decodeWord? (ordinaryProgram program) normalized).bind
      (fun ordinary => (ThreeCounterCookReadback.decodeCounterWord? program ordinary).bind
        DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?))

/-- One strictly increasing clock simultaneously samples every defined index
of a finite source prefix along the actual compiled machine execution.
This is an existential finite-prefix specification, not a global clock. -/
theorem exists_sourceClock (source : DeterministicTape.Instance) (horizon : Nat)
    (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint) :
    ∃ clock : Nat → Nat, clock 0 = 0 ∧
      (∀ first second, first < second → second ≤ horizon → clock first < clock second) ∧
      (∀ fuel, fuel ≤ horizon → ∀ row,
        DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row →
        decodeMachineRow? (sourceProgram source)
          (Rogozhin46.iterate (clock fuel) (RogozhinTagInput.compile (sourceT2 source))) = some row) := by
  obtain ⟨trace⟩ := exists_sourcePrefix source horizon endpoint endpointRun
  refine ⟨machineTime trace, machineTime_zero trace, ?_, ?_⟩
  · intro first second ordered bounded
    exact machineTime_strict trace endpoint endpointRun first second ordered bounded
  · intro fuel bounded row sourceRun
    exact machineTime_decodes trace endpoint endpointRun fuel bounded row sourceRun

end PureSFormal.Computation.SourceChronologyRogozhin
