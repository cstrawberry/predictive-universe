import PureSFormal.Research.ProtectedTrieMachine

/-!
# Agreement with an independent relational machine semantics

The executable ordered-binary machine is convenient for the certificate
checker.  This module defines list lookup, tape replacement, head motion,
rule selection, and one source transition again as inductive relations.  The
final equivalence pins `ProtectedTrieMachine.step?` to that relational
definition.
-/

namespace PureSFormal.Research.ProtectedTrieMachineAgreement

open PureSFormal.Research.ProtectedTrieMachine

/-- Textbook zero-based membership in a finite list. -/
inductive At {alpha : Type} : List alpha -> Nat -> alpha -> Prop where
  | zero (head : alpha) (tail : List alpha) : At (head :: tail) 0 head
  | succ {tail : List alpha} {index : Nat} {value : alpha}
      (head : alpha) : At tail index value -> At (head :: tail) (index + 1) value

/-- Relational replacement of exactly one existing list position. -/
inductive Replaces {alpha : Type} :
    List alpha -> Nat -> alpha -> List alpha -> Prop where
  | zero (old value : alpha) (tail : List alpha) :
      Replaces (old :: tail) 0 value (value :: tail)
  | succ {tail result : List alpha} {index : Nat} {value : alpha}
      (head : alpha) : Replaces tail index value result ->
        Replaces (head :: tail) (index + 1) value (head :: result)

/-- Independent relational account of the three head motions. -/
inductive Moves : List Bool -> Nat -> Direction -> List Bool -> Nat -> Prop where
  | leftBoundary (tape : List Bool) :
      Moves tape 0 .left (false :: tape) 0
  | leftInside (tape : List Bool) (head : Nat) :
      Moves tape (head + 1) .left tape head
  | stay (tape : List Bool) (head : Nat) :
      Moves tape head .stay tape head
  | rightInside (tape : List Bool) (head : Nat)
      (hinside : head + 1 < tape.length) :
      Moves tape head .right tape (head + 1)
  | rightBoundary (tape : List Bool) (head : Nat)
      (hboundary : Not (head + 1 < tape.length)) :
      Moves tape head .right (tape ++ [false]) (head + 1)

/-- Independent relational selection of the physical-symbol cell.  The two
constructors mention the literal record fields and do not call the executable
`symbolCell` selector. -/
inductive SelectsCell : StateRow -> Bool -> OrderedCell -> Prop where
  | onFalse (stateRow : StateRow) :
      SelectsCell stateRow false stateRow.onFalse
  | onTrue (stateRow : StateRow) :
      SelectsCell stateRow true stateRow.onTrue

/-- Independent relational selection of one ordered occurrence slot.  The
constructors mention `slot0` and `slot1` directly and do not call the
executable `occurrence` selector. -/
inductive SelectsOccurrence : OrderedCell -> Bool -> Rule -> Prop where
  | slot0 {cell : OrderedCell} {rule : Rule}
      (hslot : cell.slot0 = some rule) :
      SelectsOccurrence cell false rule
  | slot1 {cell : OrderedCell} {rule : Rule}
      (hslot : cell.slot1 = some rule) :
      SelectsOccurrence cell true rule

/-- Independent ordered lookup of one literal transition occurrence. -/
def SelectsRule (machine : Machine)
    (state : Nat) (symbol slot : Bool) (rule : Rule) : Prop :=
  exists stateRow cell,
    At machine.states state stateRow /\
      SelectsCell stateRow symbol cell /\
      SelectsOccurrence cell slot rule

/-- Independent relational application of a supplied transition occurrence. -/
def AppliesRule (row : Row) (rule : Rule) (next : Row) : Prop :=
  exists written nextTape nextHead,
    Replaces row.tape row.head rule.write written /\
      Moves written row.head rule.move nextTape nextHead /\
      next = { state := rule.nextState, head := nextHead, tape := nextTape }

/-- Textbook one-step relation for an ordered occurrence bit. -/
def TextbookStep (machine : Machine) (row : Row) (slot : Bool)
    (next : Row) : Prop :=
  exists symbol rule,
    At row.tape row.head symbol /\
      SelectsRule machine row.state symbol slot rule /\
      AppliesRule row rule next

/-! ## Executable/relational agreement -/

theorem at_iff_getElem? {alpha : Type} (xs : List alpha)
    (index : Nat) (value : alpha) :
    At xs index value <-> xs[index]? = some value := by
  constructor
  · intro h
    induction h with
    | zero => rfl
    | succ head htail ih => simpa using ih
  · intro h
    induction index generalizing xs with
    | zero =>
        cases xs with
        | nil => simp at h
        | cons head tail =>
            simp at h
            subst value
            exact .zero head tail
    | succ index ih =>
        cases xs with
        | nil => simp at h
        | cons head tail => exact .succ head (ih tail (by simpa using h))

theorem replaces_iff_replaceAt? {alpha : Type} (xs : List alpha)
    (index : Nat) (value : alpha) (result : List alpha) :
    Replaces xs index value result <-> replaceAt? xs index value = some result := by
  constructor
  · intro h
    induction h with
    | zero => rfl
    | succ head htail ih => simpa [replaceAt?, ih]
  · intro h
    induction index generalizing xs result with
    | zero =>
        cases xs with
        | nil => simp [replaceAt?] at h
        | cons head tail =>
            simp [replaceAt?] at h
            subst result
            exact .zero head value tail
    | succ index ih =>
        cases xs with
        | nil => simp [replaceAt?] at h
        | cons head tail =>
            cases htail : replaceAt? tail index value with
            | none => simp [replaceAt?, htail] at h
            | some tailResult =>
                simp [replaceAt?, htail] at h
                subst result
                exact .succ head (ih tail tailResult htail)

theorem moves_iff_movePadded (tape result : List Bool)
    (head resultHead : Nat) (direction : Direction) :
    Moves tape head direction result resultHead <->
      movePadded tape head direction = (result, resultHead) := by
  constructor
  · intro h
    cases h with
    | leftBoundary => rfl
    | leftInside => rfl
    | stay => rfl
    | rightInside tape hinside => simp [movePadded, hinside]
    | rightBoundary tape hboundary => simp [movePadded, hboundary]
  · intro h
    cases direction with
    | left =>
        cases head with
        | zero =>
            change (false :: tape, 0) = (result, resultHead) at h
            cases h
            exact .leftBoundary tape
        | succ head =>
            change (tape, head) = (result, resultHead) at h
            cases h
            exact .leftInside tape _
    | stay =>
        change (tape, head) = (result, resultHead) at h
        cases h
        exact .stay tape head
    | right =>
        by_cases hinside : head + 1 < tape.length
        · have heq : (tape, head + 1) = (result, resultHead) := by
            simpa [movePadded, hinside] using h
          cases heq
          exact .rightInside tape head hinside
        · have heq : (tape ++ [false], head + 1) =
              (result, resultHead) := by
            simpa [movePadded, hinside] using h
          cases heq
          exact .rightBoundary tape head hinside

theorem selectsCell_iff_symbolCell (stateRow : StateRow)
    (symbol : Bool) (cell : OrderedCell) :
    SelectsCell stateRow symbol cell <->
      symbolCell stateRow symbol = cell := by
  constructor
  · intro h
    cases h with
    | onFalse => rfl
    | onTrue => rfl
  · intro h
    cases symbol with
    | false =>
        change stateRow.onFalse = cell at h
        subst cell
        exact .onFalse stateRow
    | true =>
        change stateRow.onTrue = cell at h
        subst cell
        exact .onTrue stateRow

theorem selectsOccurrence_iff_occurrence (cell : OrderedCell)
    (slot : Bool) (rule : Rule) :
    SelectsOccurrence cell slot rule <->
      occurrence cell slot = some rule := by
  constructor
  · intro h
    cases h with
    | slot0 hslot => exact hslot
    | slot1 hslot => exact hslot
  · intro h
    cases slot with
    | false => exact .slot0 h
    | true => exact .slot1 h

theorem selectsRule_iff_ruleAt? (machine : Machine) (state : Nat)
    (symbol slot : Bool) (rule : Rule) :
    SelectsRule machine state symbol slot rule <->
      ruleAt? machine state symbol slot = some rule := by
  constructor
  · rintro ⟨stateRow, cell, hstate, hcell, hslot⟩
    unfold ruleAt?
    rw [(at_iff_getElem? machine.states state stateRow).mp hstate]
    change occurrence (symbolCell stateRow symbol) slot = some rule
    rw [(selectsCell_iff_symbolCell stateRow symbol cell).mp hcell]
    exact (selectsOccurrence_iff_occurrence cell slot rule).mp hslot
  · intro h
    unfold ruleAt? at h
    cases hstate : machine.states[state]? with
    | none => simp [hstate] at h
    | some stateRow =>
        simp only [hstate, Option.bind_some] at h
        exact ⟨stateRow, symbolCell stateRow symbol,
          (at_iff_getElem? machine.states state stateRow).mpr hstate,
          (selectsCell_iff_symbolCell stateRow symbol
            (symbolCell stateRow symbol)).mpr rfl,
          (selectsOccurrence_iff_occurrence
            (symbolCell stateRow symbol) slot rule).mpr h⟩

theorem appliesRule_iff_applyRule? (row : Row) (rule : Rule) (next : Row) :
    AppliesRule row rule next <-> applyRule? row rule = some next := by
  constructor
  · rintro ⟨written, nextTape, nextHead, hwrite, hmove, rfl⟩
    unfold applyRule?
    rw [(replaces_iff_replaceAt? row.tape row.head rule.write written).mp hwrite]
    simp only [Option.bind_some]
    have hmoved :=
      (moves_iff_movePadded written nextTape row.head nextHead rule.move).mp hmove
    simp [hmoved]
  · intro h
    unfold applyRule? at h
    cases hwrite : replaceAt? row.tape row.head rule.write with
    | none => simp [hwrite] at h
    | some written =>
        simp only [hwrite, Option.bind_some] at h
        let moved := movePadded written row.head rule.move
        have hnext : next =
            { state := rule.nextState, head := moved.2, tape := moved.1 } := by
          exact Option.some.inj h |>.symm
        subst next
        exact ⟨written, moved.1, moved.2,
          (replaces_iff_replaceAt? row.tape row.head rule.write written).mpr hwrite,
          (moves_iff_movePadded written moved.1 row.head moved.2 rule.move).mpr rfl,
          rfl⟩

/-- The executable source transition is exactly the independent textbook step. -/
theorem step?_eq_some_iff_textbookStep (machine : Machine)
    (row next : Row) (slot : Bool) :
    step? machine row slot = some next <-> TextbookStep machine row slot next := by
  constructor
  · intro h
    unfold step? at h
    cases hscan : scanned? row with
    | none => simp [hscan] at h
    | some symbol =>
        simp only [hscan, Option.bind_some] at h
        cases hrule : ruleAt? machine row.state symbol slot with
        | none => simp [hrule] at h
        | some rule =>
            have happly : applyRule? row rule = some next := by
              simpa [hrule] using h
            exact ⟨symbol, rule,
              (at_iff_getElem? row.tape row.head symbol).mpr
                (by simpa [scanned?] using hscan),
              (selectsRule_iff_ruleAt? machine row.state symbol slot rule).mpr hrule,
              (appliesRule_iff_applyRule? row rule next).mpr happly⟩
  · rintro ⟨symbol, rule, hscan, hrule, happly⟩
    unfold step?
    have hscanned : scanned? row = some symbol := by
      simpa [scanned?] using
        (at_iff_getElem? row.tape row.head symbol).mp hscan
    rw [hscanned]
    change (ruleAt? machine row.state symbol slot).bind
      (fun selected => applyRule? row selected) = some next
    rw [(selectsRule_iff_ruleAt? machine row.state symbol slot rule).mp hrule]
    exact (appliesRule_iff_applyRule? row rule next).mp happly

end PureSFormal.Research.ProtectedTrieMachineAgreement
