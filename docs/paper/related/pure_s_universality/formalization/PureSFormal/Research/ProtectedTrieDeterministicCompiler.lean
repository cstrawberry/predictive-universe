import PureSFormal.Research.ProtectedTrieLabelSemantics
import PureSFormal.Research.ProtectedTrieStrongCompleteness

/-!
# Deterministic single-tape source compiler

This module defines a conventional finite deterministic single-tape machine:
one partial transition per control-state/symbol cell, a finite Boolean input,
and undefined transition as the halting boundary.  Its transition function is
defined independently of the ordered-binary source lookup.  The compiler puts
the unique deterministic rule in ordered slot zero and leaves slot one empty.
Initialization, one-step execution, bounded runs, and halting are preserved
and reflected exactly.
-/

namespace PureSFormal.Research.ProtectedTrieDeterministicCompiler

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieLabelSemantics
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieStrongCompleteness

namespace DeterministicTape

abbrev Rule := ProtectedTrieMachine.Rule
abbrev Row := ProtectedTrieMachine.Row

/-- One deterministic rule option for each physical Boolean tape symbol. -/
structure StateRow where
  onFalse : Option Rule
  onTrue : Option Rule
  deriving DecidableEq, Repr

/-- A finite partial deterministic single-tape transition table. -/
structure Machine where
  states : List StateRow
  deriving DecidableEq, Repr

/-- A finite deterministic machine with its initialized control and input. -/
structure Instance where
  machine : Machine
  initialState : Nat
  input : List Bool
  deriving DecidableEq, Repr

/-- Select the deterministic physical-symbol entry. -/
def ruleAt? (machine : Machine) (state : Nat) (symbol : Bool) : Option Rule := do
  let row <- machine.states[state]?
  if symbol then row.onTrue else row.onFalse

/-- Independent deterministic one-step semantics. -/
def step? (machine : Machine) (row : Row) : Option Row := do
  let symbol <- ProtectedTrieMachine.scanned? row
  let rule <- ruleAt? machine row.state symbol
  ProtectedTrieMachine.applyRule? row rule

/-- Execute exactly `fuel` deterministic transitions, failing if the machine
has already halted before that horizon. -/
def runFor? (machine : Machine) : Row -> Nat -> Option Row
  | row, 0 => some row
  | row, fuel + 1 => do
      let next <- step? machine row
      runFor? machine next fuel

/-- Literal padded initialization, matching the target source convention. -/
def initialRow (source : Instance) : Row :=
  { state := source.initialState
    head := 1
    tape := false :: source.input ++ [false] }

/-- A deterministic run halts when it reaches a row with undefined next
transition. -/
def Halts (source : Instance) : Prop :=
  exists fuel finalRow,
    runFor? source.machine (initialRow source) fuel = some finalRow /\
    step? source.machine finalRow = none

/-- In this partial-transition presentation, acceptance is the halting event. -/
def Accepts (source : Instance) : Prop := Halts source

end DeterministicTape

open DeterministicTape

/-- Embed one deterministic cell into ordered slot zero. -/
def compileCell (rule : Option DeterministicTape.Rule) :
    ProtectedTrieMachine.OrderedCell :=
  { slot0 := rule, slot1 := none }

/-- Embed both physical-symbol entries of one deterministic state. -/
def compileStateRow (row : DeterministicTape.StateRow) :
    ProtectedTrieMachine.StateRow :=
  { onFalse := compileCell row.onFalse
    onTrue := compileCell row.onTrue }

/-- Compile the complete finite deterministic table. -/
def compileMachine (machine : DeterministicTape.Machine) :
    ProtectedTrieMachine.Machine :=
  { states := machine.states.map compileStateRow }

/-- Compile initialization without changing the literal input or control. -/
def compileInstance (source : DeterministicTape.Instance) :
    ProtectedTrieMachine.Instance :=
  { machine := compileMachine source.machine
    initialState := source.initialState
    input := source.input }

/-- Structural lookup-through-map equation, proved without the quotient-backed
generic list theorem. -/
theorem getElem?_map_structural {alpha beta : Type} (items : List alpha)
    (f : alpha -> beta) (index : Nat) :
    (items.map f)[index]? = (items[index]?).map f := by
  induction items generalizing index with
  | nil => cases index <;> rfl
  | cons head tail ih =>
      cases index with
      | zero => rfl
      | succ index => exact ih index

/-- Compiled state lookup returns the compiled source state row. -/
theorem compileMachine_state_lookup
    (machine : DeterministicTape.Machine) (state : Nat) :
    (compileMachine machine).states[state]? =
      (machine.states[state]?).map compileStateRow := by
  exact getElem?_map_structural machine.states compileStateRow state

/-- Ordered slot zero contains exactly the deterministic source rule. -/
theorem compile_ruleAt?_slot0
    (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool) :
    ProtectedTrieMachine.ruleAt? (compileMachine machine)
        state symbol false =
      DeterministicTape.ruleAt? machine state symbol := by
  unfold ProtectedTrieMachine.ruleAt? DeterministicTape.ruleAt?
  rw [compileMachine_state_lookup]
  cases machine.states[state]? with
  | none => rfl
  | some row => cases symbol <;> rfl

/-- Ordered slot one is absent in every compiled deterministic cell. -/
theorem compile_ruleAt?_slot1
    (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool) :
    ProtectedTrieMachine.ruleAt? (compileMachine machine)
        state symbol true = none := by
  unfold ProtectedTrieMachine.ruleAt?
  rw [compileMachine_state_lookup]
  cases machine.states[state]? with
  | none => rfl
  | some row => cases symbol <;> rfl

/-- One source transition is exactly ordered occurrence zero. -/
theorem compile_step_slot0 (machine : DeterministicTape.Machine)
    (row : DeterministicTape.Row) :
    ProtectedTrieMachine.step? (compileMachine machine) row false =
      DeterministicTape.step? machine row := by
  unfold ProtectedTrieMachine.step? DeterministicTape.step?
  cases hsymbol : ProtectedTrieMachine.scanned? row with
  | none => rfl
  | some symbol =>
      change (ProtectedTrieMachine.ruleAt? (compileMachine machine)
          row.state symbol false).bind (ProtectedTrieMachine.applyRule? row) =
        (DeterministicTape.ruleAt? machine row.state symbol).bind
          (ProtectedTrieMachine.applyRule? row)
      rw [compile_ruleAt?_slot0]

/-- Ordered occurrence one is nowhere enabled by the deterministic compiler. -/
theorem compile_step_slot1 (machine : DeterministicTape.Machine)
    (row : DeterministicTape.Row) :
    ProtectedTrieMachine.step? (compileMachine machine) row true = none := by
  unfold ProtectedTrieMachine.step?
  cases hsymbol : ProtectedTrieMachine.scanned? row with
  | none => rfl
  | some symbol =>
      change (ProtectedTrieMachine.ruleAt? (compileMachine machine)
          row.state symbol true).bind (ProtectedTrieMachine.applyRule? row) = none
      rw [compile_ruleAt?_slot1]
      rfl

/-- Padded initialization is literally unchanged by compilation. -/
theorem compile_initialRow (source : DeterministicTape.Instance) :
    ProtectedTrieTableau.initialRow (compileInstance source) =
      DeterministicTape.initialRow source :=
  rfl

/-- A deterministic choice history consists of `fuel` copies of slot zero. -/
def deterministicHistory (fuel : Nat) : List Bool :=
  List.replicate fuel false

/-- Exact bounded-run preservation with no administrative target steps. -/
theorem compile_run (source : DeterministicTape.Instance)
    (row : DeterministicTape.Row) (fuel : Nat) :
    ProtectedTrieMachine.run? (compileMachine source.machine) row
        (deterministicHistory fuel) =
      DeterministicTape.runFor? source.machine row fuel := by
  induction fuel generalizing row with
  | zero => rfl
  | succ fuel ih =>
      simp only [deterministicHistory, List.replicate_succ,
        ProtectedTrieMachine.run?, DeterministicTape.runFor?]
      rw [compile_step_slot0]
      cases hstep : DeterministicTape.step? source.machine row with
      | none => simp [hstep]
      | some next =>
          change ProtectedTrieMachine.run? (compileMachine source.machine) next
              (List.replicate fuel false) =
            DeterministicTape.runFor? source.machine next fuel
          simpa [deterministicHistory] using ih next

/-- Every successful compiled history consists only of the unique live slot
zero; a slot-one bit makes the run fail immediately. -/
theorem successful_compiled_history_eq
    (machine : DeterministicTape.Machine) {row finalRow : DeterministicTape.Row}
    {history : List Bool}
    (hrun : ProtectedTrieMachine.run? (compileMachine machine) row history =
      some finalRow) :
    history = deterministicHistory history.length := by
  induction history generalizing row with
  | nil => rfl
  | cons slot history ih =>
      cases slot with
      | false =>
          unfold ProtectedTrieMachine.run? at hrun
          cases hstep : ProtectedTrieMachine.step?
              (compileMachine machine) row false with
          | none => simp [hstep] at hrun
          | some next =>
              simp only [hstep, Option.bind_some] at hrun
              have htail := ih hrun
              unfold deterministicHistory at htail ⊢
              rw [List.length_cons, List.replicate_succ]
              exact congrArg (List.cons false) htail
      | true =>
          unfold ProtectedTrieMachine.run? at hrun
          rw [compile_step_slot1] at hrun
          simp at hrun

/-- A deterministic row is halted exactly when the compiled ordered-binary
row is terminal. -/
theorem compile_terminal_iff (machine : DeterministicTape.Machine)
    (row : DeterministicTape.Row) :
    ProtectedTrieMachine.Terminal (compileMachine machine) row <->
      DeterministicTape.step? machine row = none := by
  unfold ProtectedTrieMachine.Terminal
  rw [compile_step_slot0, compile_step_slot1]
  simp

/-- Deterministic halting is exactly branch halting of the concrete compiled
ordered-binary source instance. -/
theorem halts_iff_sourceBranchHalts (source : DeterministicTape.Instance) :
    DeterministicTape.Halts source <->
      SourceBranchHalts (compileInstance source) := by
  constructor
  · rintro ⟨fuel, finalRow, hrun, hhalt⟩
    refine ⟨deterministicHistory fuel, finalRow, ?_, ?_⟩
    · unfold sourceFinalRow?
      change ProtectedTrieMachine.run? (compileMachine source.machine)
          (ProtectedTrieTableau.initialRow (compileInstance source))
          (deterministicHistory fuel) = some finalRow
      rw [compile_initialRow]
      exact (compile_run source (DeterministicTape.initialRow source) fuel).trans hrun
    · simpa [compileInstance] using
        (compile_terminal_iff source.machine finalRow).mpr hhalt
  · rintro ⟨history, finalRow, hrun, hterminal⟩
    unfold sourceFinalRow? at hrun
    change ProtectedTrieMachine.run? (compileMachine source.machine)
        (ProtectedTrieTableau.initialRow (compileInstance source)) history =
      some finalRow at hrun
    rw [compile_initialRow] at hrun
    have hall : history = deterministicHistory history.length :=
      successful_compiled_history_eq source.machine hrun
    refine ⟨history.length, finalRow, ?_, ?_⟩
    · rw [hall] at hrun
      rw [compile_run] at hrun
      exact hrun
    · apply (compile_terminal_iff source.machine finalRow).mp
      simpa [compileInstance] using hterminal

/-- The strong pure-`S` terminal observation preserves and reflects halting
of the independently defined deterministic tape source. -/
theorem halts_iff_targetTerminalObservation
    (source : DeterministicTape.Instance) :
    DeterministicTape.Halts source <->
      TargetTerminalObservation (compileInstance source) := by
  exact (halts_iff_sourceBranchHalts source).trans
    (sourceBranchHalts_iff_targetTerminalObservation (compileInstance source))

/-- The concrete compiler is a named pointwise reduction from conventional
deterministic tape halting to the strong pure-`S` terminal language. -/
theorem deterministicHalting_reducesVia_targetTerminalObservation :
    PureSFormal.Computation.ReducesVia compileInstance
      DeterministicTape.Halts TargetTerminalObservation :=
  fun source => halts_iff_targetTerminalObservation source

/-- Existential many-one wrapper around the same transparent compiler. -/
theorem deterministicHalting_manyOne_targetTerminalObservation :
    PureSFormal.Computation.ManyOneReduces
      DeterministicTape.Halts TargetTerminalObservation :=
  PureSFormal.Computation.ReducesVia.manyOne
    deterministicHalting_reducesVia_targetTerminalObservation

/-- The same equivalence stated using the finite contextual-reduction search
predicate of `ProtectedTrieStrongCompleteness`. -/
theorem halts_iff_eventuallyTerminalObserved
    (source : DeterministicTape.Instance) :
    DeterministicTape.Halts source <->
      EventuallyTerminalObserved
        (strongEncoder (compileInstance source)) := by
  rw [halts_iff_targetTerminalObservation]
  constructor
  · rintro ⟨term, entry, hsteps, hentry, hterminal⟩
    exact ⟨term, hsteps, ⟨entry, hentry, hterminal⟩⟩
  · rintro ⟨term, hsteps, entry, hentry, hterminal⟩
    exact ⟨term, entry, hsteps, hentry, hterminal⟩

/-- The displayed composition of the deterministic-instance compiler and the
pure-`S` encoder is a pointwise reduction directly into the term language of
reachable terminal observations. -/
theorem deterministicHalting_reducesVia_eventuallyTerminalObserved :
    PureSFormal.Computation.ReducesVia
      (fun source => strongEncoder (compileInstance source))
      DeterministicTape.Halts EventuallyTerminalObserved :=
  fun source => halts_iff_eventuallyTerminalObserved source

/-- Existential many-one wrapper around the same explicit term encoder. -/
theorem deterministicHalting_manyOne_eventuallyTerminalObserved :
    PureSFormal.Computation.ManyOneReduces
      DeterministicTape.Halts EventuallyTerminalObserved :=
  PureSFormal.Computation.ReducesVia.manyOne
    deterministicHalting_reducesVia_eventuallyTerminalObserved

/-- Deterministic-source acceptance has an explicit total bounded witness
test after compilation to pure `S`. -/
theorem compiledAcceptance_semidecidable :
    PureSFormal.Computation.BoundedlySemidecidable
      DeterministicTape.Accepts := by
  refine ⟨fun source depth => terminalObservedAtDepth
      (strongEncoder (compileInstance source)) depth, ?_⟩
  intro source
  exact (halts_iff_eventuallyTerminalObserved source).trans
    (eventuallyTerminalObserved_iff
      (strongEncoder (compileInstance source)))

end PureSFormal.Research.ProtectedTrieDeterministicCompiler
