import PureSFormal.Research.ProtectedTrieCertificates

/-!
# Ordered-binary single-tape machines for protected certificates

This Research module fixes the source model used by the literal-tableau
certificate layer.  A finite state has one table cell for each physical tape
symbol.  Each cell has two ordered occurrence slots.  Selecting a slot is a
literal Boolean history bit, so equal rule texts in the two slots remain
different transition occurrences.

Rows use a finite, explicitly padded tape window.  Crossing the left or right
boundary grows the window by one physical blank.  This deterministic convention
gives one source run independent of the future history length while keeping
every supplied tableau row finite and complete.
-/

namespace PureSFormal.Research.ProtectedTrieMachine

open PureSFormal.Research.ProtectedTrieCertificates

/-- The three physical head moves of the source machine. -/
inductive Direction where
  | left
  | stay
  | right
  deriving DecidableEq, Repr

/-- One literal source transition occurrence. -/
structure Rule where
  write : Bool
  move : Direction
  nextState : Nat
  deriving DecidableEq, Repr

/-- The ordered occurrence slots of one state/symbol table cell. -/
structure OrderedCell where
  slot0 : Option Rule
  slot1 : Option Rule
  deriving DecidableEq, Repr

/-- The two physical-symbol cells belonging to one finite control state. -/
structure StateRow where
  onFalse : OrderedCell
  onTrue : OrderedCell
  deriving DecidableEq, Repr

/-- A finite ordered-binary nondeterministic single-tape machine. -/
structure Machine where
  states : List StateRow
  deriving DecidableEq, Repr

/-- A complete finite-window configuration row. -/
structure Row where
  state : Nat
  head : Nat
  tape : List Bool
  deriving DecidableEq, Repr

/-- A finite machine together with its finite initial configuration data. -/
structure Instance where
  machine : Machine
  initialState : Nat
  input : List Bool
  deriving DecidableEq, Repr

/-- Select the physical-symbol cell of a state row. -/
def symbolCell (state : StateRow) (symbol : Bool) : OrderedCell :=
  if symbol then state.onTrue else state.onFalse

/-- Select ordered occurrence slot `0`/`1` literally. -/
def occurrence (cell : OrderedCell) (slot : Bool) : Option Rule :=
  if slot then cell.slot1 else cell.slot0

/-- Lookup of one ordered transition occurrence. -/
def ruleAt? (machine : Machine) (state : Nat) (symbol slot : Bool) : Option Rule := do
  let stateRow <- machine.states[state]?
  occurrence (symbolCell stateRow symbol) slot

/-- Constructively replace the element at a finite-list index. -/
def replaceAt? {alpha : Type} : List alpha -> Nat -> alpha -> Option (List alpha)
  | [], _, _ => none
  | _ :: tail, 0, value => some (value :: tail)
  | head :: tail, index + 1, value =>
      (replaceAt? tail index value).map (List.cons head)

/-- A successful replacement preserves the list length. -/
theorem replaceAt?_length {alpha : Type} {xs ys : List alpha}
    {index : Nat} {value : alpha}
    (hreplace : replaceAt? xs index value = some ys) :
    ys.length = xs.length := by
  induction xs generalizing ys index with
  | nil => simp [replaceAt?] at hreplace
  | cons head tail ih =>
      cases index with
      | zero =>
          simp [replaceAt?] at hreplace
          cases hreplace
          rfl
      | succ index =>
          cases htail : replaceAt? tail index value with
          | none => simp [replaceAt?, htail] at hreplace
          | some tail' =>
              simp [replaceAt?, htail] at hreplace
              cases hreplace
              simp only [List.length_cons, Nat.succ.injEq]
              exact ih htail

/-- A successful replacement is possible only at an existing index. -/
theorem replaceAt?_index_lt {alpha : Type} {xs ys : List alpha}
    {index : Nat} {value : alpha}
    (hreplace : replaceAt? xs index value = some ys) :
    index < xs.length := by
  induction xs generalizing ys index with
  | nil => simp [replaceAt?] at hreplace
  | cons head tail ih =>
      cases index with
      | zero => exact Nat.zero_lt_succ _
      | succ index =>
          cases htail : replaceAt? tail index value with
          | none => simp [replaceAt?, htail] at hreplace
          | some tail' =>
              simp [replaceAt?, htail] at hreplace
              cases hreplace
              exact Nat.succ_lt_succ (ih htail)

/-- Read the symbol under a finite-window head. -/
def scanned? (row : Row) : Option Bool :=
  row.tape[row.head]?

/-- Move within a finite row, growing it by one blank at a crossed boundary. -/
def movePadded (tape : List Bool) (head : Nat) :
    Direction -> List Bool × Nat
  | .left =>
      match head with
      | 0 => (false :: tape, 0)
      | previous + 1 => (tape, previous)
  | .stay => (tape, head)
  | .right =>
      if head + 1 < tape.length then (tape, head + 1)
      else (tape ++ [false], head + 1)

/-- Boundary padding never removes an explicit tape cell. -/
theorem movePadded_length_le (tape : List Bool) (head : Nat)
    (direction : Direction) :
    tape.length <= (movePadded tape head direction).1.length := by
  cases direction with
  | left =>
      cases head <;> simp [movePadded]
  | stay => simp [movePadded]
  | right =>
      simp [movePadded]
      split <;> simp

/-- Apply one supplied literal rule to a complete finite row. -/
def applyRule? (row : Row) (rule : Rule) : Option Row := do
  let tape <- replaceAt? row.tape row.head rule.write
  let moved := movePadded tape row.head rule.move
  pure { state := rule.nextState, head := moved.2, tape := moved.1 }

/-- Execute the ordered occurrence selected by the literal history bit. -/
def step? (machine : Machine) (row : Row) (slot : Bool) : Option Row := do
  let symbol <- scanned? row
  let rule <- ruleAt? machine row.state symbol slot
  applyRule? row rule

/-- A successful supplied-rule update never shrinks the explicit tape window. -/
theorem applyRule?_tape_length_le {row next : Row} {rule : Rule}
    (hstep : applyRule? row rule = some next) :
    row.tape.length <= next.tape.length := by
  unfold applyRule? at hstep
  cases hwritten : replaceAt? row.tape row.head rule.write with
  | none => simp [hwritten] at hstep
  | some tape =>
      simp only [hwritten, Option.bind_some] at hstep
      cases hstep
      rw [← replaceAt?_length hwritten]
      exact movePadded_length_le tape row.head rule.move

/-- Every successful source occurrence never shrinks the explicit tape width. -/
theorem step?_tape_length_le {machine : Machine} {row next : Row} {slot : Bool}
    (hstep : step? machine row slot = some next) :
    row.tape.length <= next.tape.length := by
  unfold step? at hstep
  cases hsymbol : scanned? row with
  | none => simp [hsymbol] at hstep
  | some symbol =>
      cases hrule : ruleAt? machine row.state symbol slot with
      | none => simp [hsymbol, hrule] at hstep
      | some rule =>
          simp [hsymbol, hrule] at hstep
          exact applyRule?_tape_length_le hstep

/-- Execute a finite literal occurrence history, returning its final row. -/
def run? (machine : Machine) : Row -> BitWord -> Option Row
  | row, [] => some row
  | row, slot :: history => do
      let next <- step? machine row slot
      run? machine next history

/-- Running through a concatenated history factors at the concatenation point. -/
theorem run?_append (machine : Machine) (row : Row) (left right : BitWord) :
    run? machine row (left ++ right) =
      (run? machine row left).bind (fun middle => run? machine middle right) := by
  induction left generalizing row with
  | nil => rfl
  | cons slot left ih =>
      change (do
        let next <- step? machine row slot
        run? machine next (left ++ right)) =
        (do
          let next <- step? machine row slot
          run? machine next left).bind
            (fun middle => run? machine middle right)
      cases hstep : step? machine row slot with
      | none =>
          rfl
      | some next =>
          exact ih next

/-- An occurrence slot is enabled exactly when its one-step result exists. -/
def Enabled (machine : Machine) (row : Row) (slot : Bool) : Prop :=
  exists next, step? machine row slot = some next

/-- A row is terminal exactly when neither ordered occurrence slot is enabled. -/
def Terminal (machine : Machine) (row : Row) : Prop :=
  step? machine row false = none /\ step? machine row true = none

/-- A terminal row rejects both literal occurrence bits. -/
theorem terminal_step?_none {machine : Machine} {row : Row}
    (hterminal : Terminal machine row) (slot : Bool) :
    step? machine row slot = none := by
  cases slot
  · exact hterminal.1
  · exact hterminal.2

/-- A terminal final row has no valid one-bit history extension. -/
theorem terminal_run?_append_singleton_none
    {machine : Machine} {initial final : Row} {history : BitWord}
    (hrun : run? machine initial history = some final)
    (hterminal : Terminal machine final) (slot : Bool) :
    run? machine initial (history ++ [slot]) = none := by
  rw [run?_append, hrun]
  simp only [Option.bind_some, run?]
  change (step? machine final slot).bind (fun next => some next) = none
  rw [terminal_step?_none hterminal slot]
  rfl

/-- Slot `0` and slot `1` remain different occurrence histories. -/
theorem ordered_singleton_ne (history : BitWord) :
    history ++ [false] ≠ history ++ [true] := by
  intro heq
  have hget := congrArg (fun xs => xs[history.length]?) heq
  simp at hget

end PureSFormal.Research.ProtectedTrieMachine
