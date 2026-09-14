import PureSFormal.Computation.ThreeCounterCookReadback

/-!
# Allocated source-state boundaries by undefined-row padding

Appending undefined rows changes no source transition. Allocating every
initial and mentioned target state nevertheless ensures that every reachable
source row has a live boundary block in the existing primitive compiler.
Literal state IDs, head positions, and tape windows are preserved.

The transform is independent of the compiler: the compiler's instruction
semantics and its certified halting behavior are unchanged.
-/

namespace PureSFormal.Computation.DeterministicTapeStatePadding

open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTape DeterministicTapeCounterCompiler DeterministicTapeThreeCounterCompiler

def undefinedRow : StateRow := ⟨none, none⟩

def ruleTargetBound : Option Rule → Nat
  | none => 0
  | some rule => rule.nextState + 1

def rowTargetBound (row : StateRow) : Nat :=
  max (ruleTargetBound row.onFalse) (ruleTargetBound row.onTrue)

def tableTargetBound : List StateRow → Nat
  | [] => 0
  | row :: rest => max (rowTargetBound row) (tableTargetBound rest)

/-- One common bound for the existing table, initial ID, and every target ID. -/
def allocationSize (source : Instance) : Nat :=
  max source.machine.states.length
    (max (source.initialState + 1) (tableTargetBound source.machine.states))

/-- Append undefined rows while preserving every source field and state ID. -/
def pad (source : Instance) : Instance :=
  { machine :=
      ⟨source.machine.states ++
        List.replicate (allocationSize source - source.machine.states.length) undefinedRow⟩
    initialState := source.initialState
    input := source.input }

theorem sourceLength_le_allocationSize (source : Instance) :
    source.machine.states.length ≤ allocationSize source :=
  Nat.le_max_left _ _

theorem initialState_lt_allocationSize (source : Instance) :
    source.initialState < allocationSize source :=
  Nat.lt_of_lt_of_le (Nat.lt_succ_self _)
    (Nat.le_trans (Nat.le_max_left _ _) (Nat.le_max_right _ _))

theorem tableTargetBound_le_allocationSize (source : Instance) :
    tableTargetBound source.machine.states ≤ allocationSize source :=
  Nat.le_trans (Nat.le_max_right _ _) (Nat.le_max_right _ _)

theorem pad_states_length (source : Instance) :
    (pad source).machine.states.length = allocationSize source := by
  change (source.machine.states ++ List.replicate
    (allocationSize source - source.machine.states.length) undefinedRow).length = _
  rw [List.length_append, List.length_replicate, Nat.add_comm,
    Nat.sub_add_cancel (sourceLength_le_allocationSize source)]

theorem ruleAt?_undefined_replicate (count state : Nat) (symbol : Bool) :
    ruleAt? ⟨List.replicate count undefinedRow⟩ state symbol = none := by
  induction count generalizing state with
  | zero => rfl
  | succ count ih =>
      cases state with
      | zero => cases symbol <;> rfl
      | succ state => exact ih state

theorem ruleAt?_append_undefined (rows : List StateRow) (count state : Nat) (symbol : Bool) :
    ruleAt? ⟨rows ++ List.replicate count undefinedRow⟩ state symbol =
      ruleAt? ⟨rows⟩ state symbol := by
  induction rows generalizing state with
  | nil => exact ruleAt?_undefined_replicate count state symbol
  | cons first rest ih =>
      cases state with
      | zero => rfl
      | succ state => exact ih state

/-- Padding preserves every lookup, including IDs outside either table. -/
theorem ruleAt?_pad (source : Instance) (state : Nat) (symbol : Bool) :
    ruleAt? (pad source).machine state symbol = ruleAt? source.machine state symbol :=
  ruleAt?_append_undefined source.machine.states _ state symbol

theorem step?_pad (source : Instance) (row : Row) :
    DeterministicTape.step? (pad source).machine row =
      DeterministicTape.step? source.machine row := by
  unfold DeterministicTape.step?
  cases scanned : PureSFormal.Research.ProtectedTrieMachine.scanned? row with
  | none => rfl
  | some symbol =>
      change (ruleAt? (pad source).machine row.state symbol).bind _ =
        (ruleAt? source.machine row.state symbol).bind _
      rw [ruleAt?_pad]

theorem runFor?_pad (source : Instance) (fuel : Nat) (row : Row) :
    DeterministicTape.runFor? (pad source).machine row fuel =
      DeterministicTape.runFor? source.machine row fuel := by
  induction fuel generalizing row with
  | zero => rfl
  | succ fuel ih =>
      rw [DeterministicTape.runFor?, DeterministicTape.runFor?, step?_pad]
      cases selected : DeterministicTape.step? source.machine row with
      | none => rfl
      | some next => exact ih next

theorem initialRow_pad (source : Instance) : initialRow (pad source) = initialRow source := rfl

theorem halts_pad_iff (source : Instance) : Halts (pad source) ↔ Halts source := by
  constructor
  · rintro ⟨fuel, row, run, halted⟩
    rw [initialRow_pad, runFor?_pad] at run
    rw [step?_pad] at halted
    exact ⟨fuel, row, run, halted⟩
  · rintro ⟨fuel, row, run, halted⟩
    refine ⟨fuel, row, ?_, ?_⟩
    · rw [initialRow_pad, runFor?_pad]
      exact run
    · rw [step?_pad]
      exact halted

theorem ruleAt?_target_lt_tableTargetBound (rows : List StateRow) (state : Nat)
    (symbol : Bool) (rule : Rule) (selected : ruleAt? ⟨rows⟩ state symbol = some rule) :
    rule.nextState < tableTargetBound rows := by
  induction rows generalizing state with
  | nil => cases selected
  | cons first rest ih =>
      cases state with
      | zero =>
          apply Nat.lt_of_lt_of_le _ (Nat.le_max_left _ _)
          cases symbol with
          | false =>
              have entry : first.onFalse = some rule := selected
              have bound : rule.nextState + 1 ≤ rowTargetBound first := by
                unfold rowTargetBound
                rw [entry]
                exact Nat.le_max_left _ _
              exact Nat.lt_of_lt_of_le (Nat.lt_succ_self _) bound
          | true =>
              have entry : first.onTrue = some rule := selected
              have bound : rule.nextState + 1 ≤ rowTargetBound first := by
                unfold rowTargetBound
                rw [entry]
                exact Nat.le_max_right _ _
              exact Nat.lt_of_lt_of_le (Nat.lt_succ_self _) bound
      | succ state =>
          exact Nat.lt_of_lt_of_le (ih state selected) (Nat.le_max_right _ _)

theorem applyRule?_state {row next : Row} {rule : Rule}
    (applied : PureSFormal.Research.ProtectedTrieMachine.applyRule? row rule = some next) :
    next.state = rule.nextState := by
  unfold PureSFormal.Research.ProtectedTrieMachine.applyRule? at applied
  cases written : PureSFormal.Research.ProtectedTrieMachine.replaceAt?
      row.tape row.head rule.write with
  | none => simp only [written, Option.bind_none] at applied; cases applied
  | some tape =>
      simp only [written, Option.bind_some] at applied
      cases applied
      rfl

/-- Any successful transition targets an ID covered by the finite allocation. -/
theorem step?_state_lt_allocationSize (source : Instance) (row next : Row)
    (stepped : DeterministicTape.step? source.machine row = some next) :
    next.state < allocationSize source := by
  unfold DeterministicTape.step? at stepped
  cases scanned : PureSFormal.Research.ProtectedTrieMachine.scanned? row with
  | none => simp only [scanned, Option.bind_none] at stepped; cases stepped
  | some symbol =>
      simp only [scanned, Option.bind_some] at stepped
      change (ruleAt? source.machine row.state symbol).bind
        (PureSFormal.Research.ProtectedTrieMachine.applyRule? row) = some next at stepped
      cases selected : ruleAt? source.machine row.state symbol with
      | none => rw [selected] at stepped; cases stepped
      | some rule =>
          rw [selected] at stepped
          rw [applyRule?_state stepped]
          exact Nat.lt_of_lt_of_le
            (ruleAt?_target_lt_tableTargetBound source.machine.states row.state symbol rule selected)
            (tableTargetBound_le_allocationSize source)

theorem runFor?_state_lt_allocationSize_aux (source : Instance) (fuel : Nat)
    (row next : Row) (initialBound : row.state < allocationSize source)
    (run : DeterministicTape.runFor? source.machine row fuel = some next) :
    next.state < allocationSize source := by
  induction fuel generalizing row with
  | zero => cases run; exact initialBound
  | succ fuel ih =>
      rw [DeterministicTape.runFor?] at run
      cases stepped : DeterministicTape.step? source.machine row with
      | none => simp only [stepped, Option.bind_none] at run; cases run
      | some middle =>
          simp only [stepped, Option.bind_some] at run
          exact ih middle (step?_state_lt_allocationSize source row middle stepped) run

/-- All literal rows of every actual source run have allocated state IDs. -/
theorem runFor?_state_lt_padded_length (source : Instance) (fuel : Nat) (row : Row)
    (run : DeterministicTape.runFor? source.machine (initialRow source) fuel = some row) :
    row.state < (pad source).machine.states.length := by
  rw [pad_states_length]
  exact runFor?_state_lt_allocationSize_aux source fuel _ row
    (initialState_lt_allocationSize source) run

/-- The existing compiler starts every allocated source block with a live
instruction, even when that source state's rule is undefined. -/
theorem boundary_instruction_live (source : Instance) (state : Nat)
    (bounded : state < (pad source).machine.states.length) :
    ThreeCounterTag.instructionLive
      (ThreeCounter.instructionAt (Compiler.compileMachine (pad source).machine)
        (Compiler.boundaryAddress state)) = true := by
  rw [Compiler.boundaryAddress, Compiler.instructionAt_compileMachine bounded]
  rfl

/-- Every defined source prefix reaches an actual primitive state from which
the entire literal row is decoded, and whose tag encoder is still live. -/
theorem exists_live_decodedPrimitiveBoundary (source : Instance) (fuel : Nat) (row : Row)
    (run : DeterministicTape.runFor? source.machine (initialRow source) fuel = some row) :
    ∃ primitiveFuel,
      let candidate := ThreeCounter.run (Compiler.compileMachine (pad source).machine)
        primitiveFuel (Execution.compileInitial (pad source))
      DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate = some row ∧
        candidate.status = .running ∧
        ThreeCounterTag.instructionLive
          (ThreeCounter.instructionAt (Compiler.compileMachine (pad source).machine)
            candidate.control) = true := by
  have paddedRun : DeterministicTape.runFor? (pad source).machine
      (initialRow (pad source)) fuel = some row := by
    rw [initialRow_pad, runFor?_pad]
    exact run
  obtain ⟨primitiveFuel, decoded⟩ :=
    DeterministicTapeTrajectoryDecoder.exists_decodedPrimitiveBoundary_of_runFor?_eq_some
      (pad source) fuel paddedRun
  refine ⟨primitiveFuel, decoded, ?_, ?_⟩
  · obtain ⟨state, left, right, _, candidateEq, _⟩ :=
      DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_sound decoded
    rw [candidateEq]
    rfl
  · obtain ⟨state, left, right, _, candidateEq, rowEq⟩ :=
      DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_sound decoded
    have stateEq : row.state = state := congrArg (fun result : Row => result.state) rowEq
    have bounded : state < (pad source).machine.states.length := by
      rw [← stateEq]
      exact runFor?_state_lt_padded_length source fuel row run
    rw [candidateEq]
    exact boundary_instruction_live source state bounded

/-- An undefined rule halts inside its allocated block after the observable
running boundary. The exact positive clock is the existing right-pop clock. -/
theorem undefined_boundary_halts_after_readback (source : Instance) (state : Nat)
    (bounded : state < (pad source).machine.states.length)
    (left tail : List Bool) (symbol : Bool)
    (undefined : ruleAt? source.machine state symbol = none) :
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
      (Execution.boundaryState (configurationOf state left (symbol :: tail))) =
        some (rowOf state left (symbol :: tail)) ∧
    ThreeCounterTag.instructionLive
      (ThreeCounter.instructionAt (Compiler.compileMachine (pad source).machine)
        (Compiler.boundaryAddress state)) = true ∧
    (ThreeCounter.run (Compiler.compileMachine (pad source).machine)
      (Execution.rightPopClock (Execution.stackBase tail) symbol + 1)
      (Execution.boundaryState (configurationOf state left (symbol :: tail)))).status = .halted := by
  refine ⟨DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_boundaryState_configurationOf
    state left (symbol :: tail) (List.cons_ne_nil _ _),
    boundary_instruction_live source state bounded, ?_⟩
  have selected : Compiler.ruleFor (pad source).machine state symbol = none := by
    change ruleAt? (pad source).machine state symbol = none
    rw [ruleAt?_pad]
    exact undefined
  have halted := Execution.run_halt_macro left tail symbol selected
  rw [Execution.haltMacroClock, if_pos bounded] at halted
  exact halted

end PureSFormal.Computation.DeterministicTapeStatePadding
