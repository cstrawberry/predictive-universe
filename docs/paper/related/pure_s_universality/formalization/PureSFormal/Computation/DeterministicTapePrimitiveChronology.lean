import PureSFormal.Computation.DeterministicTapePrimitiveBoundaryReflection
import PureSFormal.Computation.DeterministicTapeStatePadding

/-!
# Explicit chronological sampling for the tape-to-three-counter compiler

`boundaryTime` sums the actual positive primitive macro durations along a
bounded source prefix. It is a total proof-support function, not an input to
the encoder, controller, or output decoder. Claims about its strict growth
are restricted to source prefixes that are defined.

This module stops at the primitive three-counter layer. It does not claim
chronological sampling of the final cyclic-tag or pure-S execution.
-/

namespace PureSFormal.Computation.DeterministicTapePrimitiveChronology

open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeCounterCompiler DeterministicTapeThreeCounterCompiler
open DeterministicTapeThreeCounterCompiler.Execution
open DeterministicTapeThreeCounterCompiler.Compiler

/-- Accumulated primitive duration of a requested source prefix. Undefined
suffixes contribute zero; successful-prefix theorems below avoid that case. -/
def boundaryTime (machine : DeterministicTape.Machine) :
    Nat → Nat → List Bool → List Bool → Nat
  | 0, _, _, _ => 0
  | _ + 1, _, _, [] => 0
  | fuel + 1, state, left, symbol :: tail =>
      match ruleFor machine state symbol with
      | none => 0
      | some rule =>
          liveMacroClock left tail symbol rule +
            boundaryTime machine fuel rule.nextState
              (afterRule left tail rule).1 (afterRule left tail rule).2

/-- At the computed time, the actual primitive run decodes the exact final
source row. No existentially chosen primitive clock is supplied. -/
theorem boundaryTime_decodes (machine : DeterministicTape.Machine) (fuel : Nat)
    (state : Nat) (left right : List Bool) (nonempty : right ≠ [])
    (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? machine (rowOf state left right) fuel = some row) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run (Compiler.compileMachine machine)
        (boundaryTime machine fuel state left right)
        (boundaryState (configurationOf state left right))) = some row := by
  induction fuel generalizing state left right row with
  | zero =>
      rw [DeterministicTape.runFor?] at sourceRun
      cases sourceRun
      exact DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_boundaryState_configurationOf
        state left right nonempty
  | succ fuel ih =>
      cases right with
      | nil => exact False.elim (nonempty rfl)
      | cons symbol tail =>
          cases selected : ruleFor machine state symbol with
          | none =>
              rw [DeterministicTape.runFor?,
                source_step?_rowOf_none machine state left tail symbol selected] at sourceRun
              contradiction
          | some rule =>
              rw [DeterministicTape.runFor?,
                source_step?_rowOf machine state left tail symbol rule selected] at sourceRun
              rw [boundaryTime, selected, run_add,
                run_live_macro left tail symbol rule selected]
              exact ih rule.nextState (afterRule left tail rule).1
                (afterRule left tail rule).2 (afterRule_right_ne_nil left tail rule) row sourceRun

/-- Every defined next source step strictly increases the accumulated clock,
including steps whose source row happens to repeat an earlier row. -/
theorem boundaryTime_lt_succ (machine : DeterministicTape.Machine) (fuel : Nat)
    (state : Nat) (left right : List Bool) (nonempty : right ≠ [])
    (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? machine (rowOf state left right) (fuel + 1) = some row) :
    boundaryTime machine fuel state left right <
      boundaryTime machine (fuel + 1) state left right := by
  induction fuel generalizing state left right row with
  | zero =>
      cases right with
      | nil => exact False.elim (nonempty rfl)
      | cons symbol tail =>
          cases selected : ruleFor machine state symbol with
          | none =>
              rw [DeterministicTape.runFor?,
                source_step?_rowOf_none machine state left tail symbol selected] at sourceRun
              contradiction
          | some rule =>
              simp only [boundaryTime, selected, Nat.add_zero]
              exact liveMacroClock_pos left tail symbol rule
  | succ fuel ih =>
      cases right with
      | nil => exact False.elim (nonempty rfl)
      | cons symbol tail =>
          cases selected : ruleFor machine state symbol with
          | none =>
              rw [DeterministicTape.runFor?,
                source_step?_rowOf_none machine state left tail symbol selected] at sourceRun
              contradiction
          | some rule =>
              rw [DeterministicTape.runFor?,
                source_step?_rowOf machine state left tail symbol rule selected] at sourceRun
              simp only [boundaryTime, selected]
              exact Nat.add_lt_add_left
                (ih rule.nextState (afterRule left tail rule).1 (afterRule left tail rule).2
                  (afterRule_right_ne_nil left tail rule) row sourceRun) _

/-- Any initial segment of a successful finite source run is defined. -/
theorem source_prefix_defined (machine : DeterministicTape.Machine)
    (initial final : DeterministicTape.Row) (horizon : Nat)
    (sourceRun : DeterministicTape.runFor? machine initial horizon = some final)
    (fuel : Nat) (bounded : fuel ≤ horizon) :
    ∃ row, DeterministicTape.runFor? machine initial fuel = some row := by
  induction horizon generalizing initial fuel with
  | zero =>
      have zero : fuel = 0 := Nat.eq_zero_of_le_zero bounded
      subst fuel
      exact ⟨initial, rfl⟩
  | succ horizon ih =>
      cases fuel with
      | zero => exact ⟨initial, rfl⟩
      | succ fuel =>
          cases stepped : DeterministicTape.step? machine initial with
          | none =>
              rw [DeterministicTape.runFor?, stepped] at sourceRun
              contradiction
          | some next =>
              rw [DeterministicTape.runFor?, stepped] at sourceRun
              obtain ⟨row, prefixRun⟩ := ih next sourceRun fuel (Nat.le_of_succ_le_succ bounded)
              exact ⟨row, by rw [DeterministicTape.runFor?, stepped]; exact prefixRun⟩

/-- Strict order for any two source indices within a defined prefix. -/
theorem boundaryTime_strict (machine : DeterministicTape.Machine)
    (state : Nat) (left right : List Bool) (nonempty : right ≠ [])
    (horizon : Nat) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? machine (rowOf state left right) horizon = some row)
    (first second : Nat) (ordered : first < second) (bounded : second ≤ horizon) :
    boundaryTime machine first state left right < boundaryTime machine second state left right := by
  induction second with
  | zero => exact False.elim (Nat.not_lt_zero first ordered)
  | succ second ih =>
      obtain ⟨atNext, nextRun⟩ := source_prefix_defined machine _ row horizon sourceRun (second + 1) bounded
      have nextLt := boundaryTime_lt_succ machine second state left right nonempty atNext nextRun
      have firstLe : first ≤ second := Nat.le_of_lt_succ ordered
      cases Nat.eq_or_lt_of_le firstLe with
      | inl same => simpa only [same] using nextLt
      | inr before => exact Nat.lt_trans (ih before (Nat.le_trans (Nat.le_succ second) bounded)) nextLt

/-- Every accepted primitive sample occurs at one of the computed source
boundary times. Strict macro interiors and the post-halt tail are rejected. -/
theorem accepted_at_boundaryTime (machine : DeterministicTape.Machine) (primitiveFuel : Nat)
    (state : Nat) (left right : List Bool) (nonempty : right ≠ [])
    (row : DeterministicTape.Row)
    (accepted : DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run (Compiler.compileMachine machine) primitiveFuel
        (boundaryState (configurationOf state left right))) = some row) :
    ∃ sourceFuel, DeterministicTape.runFor? machine (rowOf state left right) sourceFuel = some row ∧
      primitiveFuel = boundaryTime machine sourceFuel state left right := by
  induction primitiveFuel using Nat.strongRecOn generalizing state left right row with
  | ind primitiveFuel ih =>
      cases primitiveFuel with
      | zero =>
          rw [ThreeCounter.run_zero,
            DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_boundaryState_configurationOf
              state left right nonempty] at accepted
          exact ⟨0, accepted, rfl⟩
      | succ fuel =>
          cases right with
          | nil => exact False.elim (nonempty rfl)
          | cons symbol tail =>
              cases selected : ruleFor machine state symbol with
              | none =>
                  rw [DeterministicTapePrimitiveBoundaryReflection.halt_macro_positive_rejected
                    left tail symbol selected (fuel + 1) (Nat.zero_lt_succ fuel)] at accepted
                  cases accepted
              | some rule =>
                  let macroFuel := liveMacroClock left tail symbol rule
                  by_cases inside : fuel + 1 < macroFuel
                  · rw [DeterministicTapePrimitiveBoundaryReflection.live_macro_positive_prefix_rejected
                      left tail symbol rule selected (fuel + 1) (Nat.zero_lt_succ fuel) inside] at accepted
                    cases accepted
                  · have macroLe := Nat.le_of_not_gt inside
                    let remaining := fuel + 1 - macroFuel
                    have remainingLt : remaining < fuel + 1 :=
                      Nat.sub_lt (Nat.zero_lt_succ fuel) (liveMacroClock_pos left tail symbol rule)
                    have splitFuel : fuel + 1 = macroFuel + remaining := (Nat.add_sub_of_le macroLe).symm
                    have nextAccepted : DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
                        (ThreeCounter.run (Compiler.compileMachine machine) remaining
                          (boundaryState (configurationOf rule.nextState
                            (afterRule left tail rule).1 (afterRule left tail rule).2))) = some row := by
                      rw [splitFuel, run_add, run_live_macro left tail symbol rule selected] at accepted
                      exact accepted
                    obtain ⟨sourceFuel, sourceRun, timeEq⟩ := ih remaining remainingLt rule.nextState
                      (afterRule left tail rule).1 (afterRule left tail rule).2
                      (afterRule_right_ne_nil left tail rule) row nextAccepted
                    refine ⟨sourceFuel + 1, ?_, ?_⟩
                    · rw [DeterministicTape.runFor?,
                        source_step?_rowOf machine state left tail symbol rule selected]
                      exact sourceRun
                    · rw [boundaryTime, selected, splitFuel, timeEq]

/-- The explicit source-to-primitive clock for initialized source instances. -/
def sourceTime (source : DeterministicTape.Instance) (fuel : Nat) : Nat :=
  boundaryTime source.machine fuel source.initialState [false] (source.input ++ [false])

theorem sourceTime_decodes (source : DeterministicTape.Instance) (fuel : Nat)
    (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run (Compiler.compileMachine source.machine) (sourceTime source fuel)
        (Execution.compileInitial source)) = some row := by
  apply boundaryTime_decodes source.machine fuel source.initialState [false]
    (source.input ++ [false]) (by simp) row
  simpa only [rowOf, DeterministicTape.initialRow, List.reverse_cons,
    List.reverse_nil, List.nil_append, List.length_cons, List.length_nil] using! sourceRun

theorem sourceTime_strict (source : DeterministicTape.Instance) (horizon : Nat)
    (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some row)
    (first second : Nat) (ordered : first < second) (bounded : second ≤ horizon) :
    sourceTime source first < sourceTime source second := by
  apply boundaryTime_strict source.machine source.initialState [false]
    (source.input ++ [false]) (by simp) horizon row _ first second ordered bounded
  simpa only [rowOf, DeterministicTape.initialRow, List.reverse_cons,
    List.reverse_nil, List.nil_append, List.length_cons, List.length_nil] using! sourceRun

/-- Complete indexed boundary characterization at the primitive layer. The
source index is a proof witness; the unchanged decoder reads only its state. -/
theorem sourceTime_exact_iff (source : DeterministicTape.Instance) (primitiveFuel : Nat)
    (row : DeterministicTape.Row) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run (Compiler.compileMachine source.machine) primitiveFuel
        (Execution.compileInitial source)) = some row ↔
      ∃ sourceFuel, DeterministicTape.runFor? source.machine
        (DeterministicTape.initialRow source) sourceFuel = some row ∧
        primitiveFuel = sourceTime source sourceFuel := by
  constructor
  · intro accepted
    obtain ⟨sourceFuel, sourceRun, timeEq⟩ := accepted_at_boundaryTime source.machine primitiveFuel
      source.initialState [false] (source.input ++ [false]) (by simp) row accepted
    refine ⟨sourceFuel, ?_, timeEq⟩
    simpa only [rowOf, DeterministicTape.initialRow, List.reverse_cons,
      List.reverse_nil, List.nil_append, List.length_cons, List.length_nil] using! sourceRun
  · rintro ⟨sourceFuel, sourceRun, timeEq⟩
    rw [timeEq]
    exact sourceTime_decodes source sourceFuel row sourceRun

/-- The actual padded compiler used by the output endpoint has chronological
primitive samples for every defined prefix of the original source. -/
theorem padded_sourceTime_decodes (source : DeterministicTape.Instance) (fuel : Nat)
    (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
        (sourceTime (DeterministicTapeStatePadding.pad source) fuel)
        (Execution.compileInitial (DeterministicTapeStatePadding.pad source))) = some row := by
  apply sourceTime_decodes
  rw [DeterministicTapeStatePadding.initialRow_pad, DeterministicTapeStatePadding.runFor?_pad]
  exact sourceRun

theorem padded_sourceTime_strict (source : DeterministicTape.Instance) (horizon : Nat)
    (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some row)
    (first second : Nat) (ordered : first < second) (bounded : second ≤ horizon) :
    sourceTime (DeterministicTapeStatePadding.pad source) first <
      sourceTime (DeterministicTapeStatePadding.pad source) second := by
  apply sourceTime_strict (DeterministicTapeStatePadding.pad source) horizon row _ first second ordered bounded
  rw [DeterministicTapeStatePadding.initialRow_pad, DeterministicTapeStatePadding.runFor?_pad]
  exact sourceRun

theorem padded_sourceTime_exact_iff (source : DeterministicTape.Instance) (primitiveFuel : Nat)
    (row : DeterministicTape.Row) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (ThreeCounter.run (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
        primitiveFuel (Execution.compileInitial (DeterministicTapeStatePadding.pad source))) = some row ↔
      ∃ sourceFuel, DeterministicTape.runFor? source.machine
        (DeterministicTape.initialRow source) sourceFuel = some row ∧
        primitiveFuel = sourceTime (DeterministicTapeStatePadding.pad source) sourceFuel := by
  constructor
  · intro accepted
    obtain ⟨sourceFuel, sourceRun, timeEq⟩ :=
      (sourceTime_exact_iff (DeterministicTapeStatePadding.pad source) primitiveFuel row).mp accepted
    rw [DeterministicTapeStatePadding.initialRow_pad, DeterministicTapeStatePadding.runFor?_pad] at sourceRun
    exact ⟨sourceFuel, sourceRun, timeEq⟩
  · rintro ⟨sourceFuel, sourceRun, timeEq⟩
    apply (sourceTime_exact_iff (DeterministicTapeStatePadding.pad source) primitiveFuel row).mpr
    refine ⟨sourceFuel, ?_, timeEq⟩
    rw [DeterministicTapeStatePadding.initialRow_pad, DeterministicTapeStatePadding.runFor?_pad]
    exact sourceRun

/-- The explicit chronological sample is still live in the tag encoding,
including the final source row before its undefined transition. -/
theorem padded_sourceTime_running_live (source : DeterministicTape.Instance) (fuel : Nat)
    (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    let padded := DeterministicTapeStatePadding.pad source
    let candidate := ThreeCounter.run (Compiler.compileMachine padded.machine)
      (sourceTime padded fuel) (Execution.compileInitial padded)
    candidate.status = .running ∧ ThreeCounterTag.instructionLive
      (ThreeCounter.instructionAt (Compiler.compileMachine padded.machine) candidate.control) = true := by
  have decoded := padded_sourceTime_decodes source fuel row sourceRun
  obtain ⟨state, left, right, _, candidateEq, rowEq⟩ :=
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_sound decoded
  have stateEq : row.state = state := congrArg (fun result : DeterministicTape.Row => result.state) rowEq
  have bounded : state < (DeterministicTapeStatePadding.pad source).machine.states.length := by
    rw [← stateEq]
    exact DeterministicTapeStatePadding.runFor?_state_lt_padded_length source fuel row sourceRun
  change (ThreeCounter.run _ _ _).status = .running ∧ _
  rw [candidateEq]
  exact ⟨rfl, DeterministicTapeStatePadding.boundary_instruction_live source state bounded⟩

end PureSFormal.Computation.DeterministicTapePrimitiveChronology
