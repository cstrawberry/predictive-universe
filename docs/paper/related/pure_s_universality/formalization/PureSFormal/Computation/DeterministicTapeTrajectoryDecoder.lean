import PureSFormal.Computation.DeterministicTapeThreeCounterCompiler

/-!
# Literal tape rows at primitive compiler boundaries

This module supplies the first executable inverse layer for the deterministic
tape compiler.  It recognizes only literal macro-boundary states, parses both
sentinel-terminated stack registers, rejects an empty right stack, and returns
the represented source row.  It does not assert that arbitrary pure-S terms
contain such a boundary or provide a tape-level checkpoint theorem.
-/

namespace PureSFormal.Computation.DeterministicTapeTrajectoryDecoder

open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open PureSFormal.Computation.DeterministicTapeCounterCompiler
open PureSFormal.Computation.DeterministicTapeThreeCounterCompiler

/-- Total structural decoder for a primitive three-counter macro-boundary.
The phase-zero congruence identifies a source-state boundary; successful stack
parses supply the literal left and right tape fragments. -/
def decodeTapeBoundary? (candidate : ThreeCounter.State) :
    Option DeterministicTape.Row :=
  if candidate.status = .running then
    if candidate.scratch = 0 then
      if candidate.control % Layout.phaseCount =
          Layout.encodePhase (.right .start) then
        match StackCode.decode? candidate.left, StackCode.decode? candidate.right with
        | some left, some right =>
            if right = [] then
              none
            else
              some (rowOf (candidate.control / Layout.phaseCount) left right)
        | _, _ => none
      else
        none
    else
      none
  else
    none

/-- Every accepted candidate is exactly a represented primitive boundary;
the decoder cannot accept a running interior state or a noncanonical stack
number. -/
theorem decodeTapeBoundary?_sound {candidate : ThreeCounter.State}
    {row : DeterministicTape.Row}
    (accepted : decodeTapeBoundary? candidate = some row) :
    ∃ state left right,
      right ≠ [] ∧
      candidate = Execution.boundaryState (configurationOf state left right) ∧
      row = rowOf state left right := by
  unfold decodeTapeBoundary? at accepted
  by_cases running : candidate.status = .running
  · rw [if_pos running] at accepted
    by_cases scratchZero : candidate.scratch = 0
    · rw [if_pos scratchZero] at accepted
      by_cases phaseBoundary :
          candidate.control % Layout.phaseCount =
            Layout.encodePhase (.right .start)
      · rw [if_pos phaseBoundary] at accepted
        cases leftParse : StackCode.decode? candidate.left with
        | none => simp [leftParse] at accepted
        | some left =>
          cases rightParse : StackCode.decode? candidate.right with
          | none => simp [leftParse, rightParse] at accepted
          | some right =>
            rw [leftParse, rightParse] at accepted
            simp only at accepted
            by_cases rightNonempty : right = []
            · simp [rightNonempty] at accepted
            · rw [if_neg rightNonempty] at accepted
              cases accepted
              have leftCanonical : StackCode.encode left = candidate.left :=
                StackCode.encode_of_decode?_eq leftParse
              have rightCanonical : StackCode.encode right = candidate.right :=
                StackCode.encode_of_decode?_eq rightParse
              have controlEq :
                  candidate.control =
                    Compiler.boundaryAddress
                      (candidate.control / Layout.phaseCount) := by
                unfold Compiler.boundaryAddress Layout.address
                calc
                  candidate.control =
                      candidate.control % Layout.phaseCount +
                        Layout.phaseCount *
                          (candidate.control / Layout.phaseCount) :=
                    (Nat.mod_add_div candidate.control Layout.phaseCount).symm
                  _ = Layout.encodePhase (.right .start) +
                        Layout.phaseCount *
                          (candidate.control / Layout.phaseCount) := by
                    rw [phaseBoundary]
                  _ = (candidate.control / Layout.phaseCount) *
                        Layout.phaseCount +
                          Layout.encodePhase (.right .start) := by
                    rw [Nat.add_comm,
                      Nat.mul_comm Layout.phaseCount
                        (candidate.control / Layout.phaseCount)]
              refine ⟨candidate.control / Layout.phaseCount, left, right,
                rightNonempty, ?_, rfl⟩
              cases candidate with
              | mk control leftCode rightCode scratch status =>
                dsimp at running scratchZero leftCanonical rightCanonical controlEq
                unfold Execution.boundaryState Execution.runningState
                  configurationOf
                rw [← controlEq, leftCanonical, rightCanonical, scratchZero,
                  running]
      · simp [if_neg phaseBoundary] at accepted
    · simp [if_neg scratchZero] at accepted
  · simp [if_neg running] at accepted

/-- Every represented arithmetic configuration is recovered exactly at its
literal primitive boundary, provided its right stack contains the scanned
cell. -/
@[simp]
theorem decodeTapeBoundary?_boundaryState_configurationOf
    (state : Nat) (left right : List Bool) (rightNonempty : right ≠ []) :
    decodeTapeBoundary?
        (Execution.boundaryState (configurationOf state left right)) =
      some (rowOf state left right) := by
  unfold configurationOf
  unfold decodeTapeBoundary? Execution.boundaryState Execution.runningState
  rw [if_pos rfl, if_pos rfl]
  unfold Compiler.boundaryAddress
  rw [if_pos (Compiler.address_mod state (.right .start))]
  rw [StackCode.decode?_encode, StackCode.decode?_encode]
  simp only [if_neg rightNonempty]
  rw [Compiler.address_div]

/-- The executable initial primitive state exposes exactly the source's
literal initial tape row. -/
@[simp]
theorem decodeTapeBoundary?_compileInitial
    (source : DeterministicTape.Instance) :
    decodeTapeBoundary? (Execution.compileInitial source) =
      some (DeterministicTape.initialRow source) := by
  change decodeTapeBoundary?
      (Execution.boundaryState
        (configurationOf source.initialState [false]
          (source.input ++ [false]))) = _
  rw [decodeTapeBoundary?_boundaryState_configurationOf _ _ _ (by simp)]
  simp [DeterministicTape.initialRow, rowOf]

/-- Every defined finite source run is exposed literally at a primitive
three-counter macro boundary.  The witness is the accumulated, data-dependent
number of primitive counter steps produced by the compiler correctness proof;
the decoder itself receives only the reached counter state. -/
theorem exists_decodedPrimitiveBoundary_of_runFor?_eq_some
    (source : DeterministicTape.Instance) (sourceFuel : Nat)
    {row : DeterministicTape.Row}
    (sourceRun :
      DeterministicTape.runFor? source.machine
        (DeterministicTape.initialRow source) sourceFuel = some row) :
    ∃ primitiveFuel,
      decodeTapeBoundary?
          (ThreeCounter.run (Compiler.compileMachine source.machine)
            primitiveFuel (Execution.compileInitial source)) = some row := by
  obtain ⟨finalConfiguration, primitiveFuel, represented, primitiveRun⟩ :=
    Execution.runFor?_some_exact source.machine sourceFuel
      (DeterministicTapeCounterCompiler.initial_represents source) sourceRun
  rcases represented with
    ⟨state, left, right, rightNonempty, rowEq, configurationEq⟩
  refine ⟨primitiveFuel, ?_⟩
  rw [show ThreeCounter.run (Compiler.compileMachine source.machine)
        primitiveFuel (Execution.compileInitial source) =
      Execution.boundaryState (configurationOf state left right) by
        simpa [Execution.compileInitial, configurationEq] using primitiveRun]
  rw [decodeTapeBoundary?_boundaryState_configurationOf state left right
    rightNonempty]
  exact congrArg some rowEq.symm

end PureSFormal.Computation.DeterministicTapeTrajectoryDecoder
