import PureSFormal.Research.FiniteBranchBinaryCompiler
import PureSFormal.Research.ProtectedTrieTableau

/-!
# Flat ordered-binary machine installation for finite branching

Finite ordered occurrence lists are installed into one ordinary
`ProtectedTrieMachine.Machine`.  Each source control state has an entry key.
For each physical symbol and list position there is a finite selector key.
At a source boundary, `0` takes the current occurrence and `1` advances to the
next selector key without changing the tape.  Consequently occurrence `k`
executes under the exact first-return macrohistory `1^k 0`.
-/

namespace PureSFormal.Research.FiniteBranchBinaryMachineCompiler

open PureSFormal.Research.FiniteBranchBinaryCompiler
open PureSFormal.Research.ProtectedTrieMachine

/-- Explicit index of the first equal element, or list length when absent. -/
def listIndexOf {alpha : Type} [DecidableEq alpha] (needle : alpha) :
    List alpha -> Nat
  | [] => 0
  | head :: tail => if head = needle then 0 else listIndexOf needle tail + 1

/-- The explicit index retrieves every member. -/
theorem getElem?_listIndexOf_of_mem {alpha : Type} [DecidableEq alpha]
    (needle : alpha) (items : List alpha) (hmem : needle ∈ items) :
    items[listIndexOf needle items]? = some needle := by
  induction items with
  | nil => cases hmem
  | cons head tail ih =>
      by_cases heq : head = needle
      · subst head
        simp [listIndexOf]
      · have htail : needle ∈ tail := by
          rcases List.mem_cons.mp hmem with hhead | htail
          · exact False.elim (heq hhead.symm)
          · exact htail
        simp [listIndexOf, heq, ih htail]

/-- Entry states and symbol-specific selector states have disjoint literal
keys. -/
inductive StateKey where
  | entry (sourceState : Nat)
  | selector (sourceState : Nat) (symbol : Bool) (position : Nat)
  deriving DecidableEq, Repr

/-- Materialize consecutive selector keys without using a quotient-backed
range/map membership theorem in the proof interface. -/
def selectorKeysFromPosition (sourceState : Nat) (symbol : Bool) :
    Nat -> Nat -> List StateKey
  | _, 0 => []
  | position, count + 1 =>
      .selector sourceState symbol position ::
        selectorKeysFromPosition sourceState symbol (position + 1) count

/-- Materialize one selector key for every list position. -/
def selectorKeys (sourceState : Nat) (symbol : Bool)
    (cell : FiniteCell) : List StateKey :=
  selectorKeysFromPosition sourceState symbol 0 cell.length

/-- Materialize all finite keys while retaining source state numbers. -/
def stateKeysFrom : Nat -> List FiniteStateRow -> List StateKey
  | _, [] => []
  | sourceState, row :: rows =>
      .entry sourceState ::
        (selectorKeys sourceState false row.onFalse ++
          selectorKeys sourceState true row.onTrue ++
          stateKeysFrom (sourceState + 1) rows)

def stateKeys (machine : FiniteMachine) : List StateKey :=
  stateKeysFrom 0 machine.states

/-- Concrete target state number allocated to a literal key. -/
def stateId (machine : FiniteMachine) (key : StateKey) : Nat :=
  listIndexOf key (stateKeys machine)

/-- A source-table lookup supplies its entry key. -/
theorem entry_mem_stateKeysFrom_of_getElem?
    (rows : List FiniteStateRow) (base index : Nat) (row : FiniteStateRow)
    (hrow : rows[index]? = some row) :
    StateKey.entry (base + index) ∈ stateKeysFrom base rows := by
  induction rows generalizing base index with
  | nil => simp at hrow
  | cons head tail ih =>
      cases index with
      | zero =>
          simp at hrow
          subst head
          simp [stateKeysFrom]
      | succ index =>
          simp only [List.getElem?_cons_succ] at hrow
          have htail := ih (base + 1) index hrow
          have heq : base + (index + 1) = (base + 1) + index := by
            simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
          rw [heq]
          simp [stateKeysFrom, htail]

theorem entry_mem_stateKeys_of_getElem?
    (machine : FiniteMachine) (index : Nat) (row : FiniteStateRow)
    (hrow : machine.states[index]? = some row) :
    StateKey.entry index ∈ stateKeys machine := by
  simpa [stateKeys] using
    entry_mem_stateKeysFrom_of_getElem? machine.states 0 index row hrow

/-- Every relative position below a consecutive-key count is present. -/
theorem selector_mem_selectorKeysFromPosition
    (sourceState : Nat) (symbol : Bool) (start count offset : Nat)
    (hoffset : offset < count) :
    StateKey.selector sourceState symbol (start + offset) ∈
      selectorKeysFromPosition sourceState symbol start count := by
  induction count generalizing start offset with
  | zero => simp at hoffset
  | succ count ih =>
      cases offset with
      | zero => exact List.Mem.head _
      | succ offset =>
          apply List.Mem.tail
          have htail : offset < count := by simpa using hoffset
          simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using!
            ih (start + 1) offset htail

/-- Entry and selector constructors are disjoint throughout a consecutive
selector-key block. -/
theorem entry_not_mem_selectorKeysFromPosition
    (entryState sourceState : Nat) (symbol : Bool) (start count : Nat) :
    StateKey.entry entryState ∉
      selectorKeysFromPosition sourceState symbol start count := by
  induction count generalizing start with
  | zero => simp [selectorKeysFromPosition]
  | succ count ih =>
      intro hmem
      rcases List.mem_cons.mp hmem with heq | htail
      · cases heq
      · exact ih (start + 1) htail

/-- No entry key occurs in a selector-key block. -/
theorem entry_not_mem_selectorKeys (entryState sourceState : Nat)
    (symbol : Bool) (cell : FiniteCell) :
    StateKey.entry entryState ∉ selectorKeys sourceState symbol cell :=
  entry_not_mem_selectorKeysFromPosition entryState sourceState symbol 0 cell.length

/-- Every in-range position of a source cell has its allocated selector key. -/
theorem selector_mem_selectorKeys (sourceState : Nat) (symbol : Bool)
    (cell : FiniteCell) (position : Nat) (hposition : position < cell.length) :
    StateKey.selector sourceState symbol position ∈
      selectorKeys sourceState symbol cell := by
  simpa [selectorKeys] using
    selector_mem_selectorKeysFromPosition sourceState symbol 0 cell.length
      position hposition

/-- A looked-up source cell and in-range position supply a global selector
key. -/
theorem selector_mem_stateKeysFrom_of_getElem?
    (rows : List FiniteStateRow) (base index : Nat) (row : FiniteStateRow)
    (hrow : rows[index]? = some row) (symbol : Bool) (position : Nat)
    (hposition : position < (finiteCell row symbol).length) :
    StateKey.selector (base + index) symbol position ∈
      stateKeysFrom base rows := by
  induction rows generalizing base index with
  | nil => simp at hrow
  | cons head tail ih =>
      cases index with
      | zero =>
          simp at hrow
          subst head
          cases symbol with
          | false =>
              simp only [stateKeysFrom, List.mem_cons, List.mem_append]
              exact Or.inr (Or.inl (Or.inl
                (selector_mem_selectorKeys base false row.onFalse position
                  (by simpa [finiteCell] using hposition))))
          | true =>
              simp only [stateKeysFrom, List.mem_cons, List.mem_append]
              exact Or.inr (Or.inl (Or.inr
                (selector_mem_selectorKeys base true row.onTrue position
                  (by simpa [finiteCell] using hposition))))
      | succ index =>
          simp only [List.getElem?_cons_succ] at hrow
          have htail := ih (base + 1) index hrow
          have heq : base + (index + 1) = (base + 1) + index := by
            simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
          rw [heq]
          simp [stateKeysFrom, htail]

theorem selector_mem_stateKeys_of_getElem?
    (machine : FiniteMachine) (index : Nat) (row : FiniteStateRow)
    (hrow : machine.states[index]? = some row) (symbol : Bool) (position : Nat)
    (hposition : position < (finiteCell row symbol).length) :
    StateKey.selector index symbol position ∈ stateKeys machine := by
  simpa [stateKeys] using selector_mem_stateKeysFrom_of_getElem?
    machine.states 0 index row hrow symbol position hposition

/-- Relocate an actual source rule to the compiled entry state of its target. -/
def relocateRule (machine : FiniteMachine) (rule : Rule) : Rule :=
  { rule with nextState := stateId machine (.entry rule.nextState) }

/-- Administrative continuation preserves the scanned symbol and tape head. -/
def selectorContinueRule (machine : FiniteMachine) (sourceState : Nat)
    (symbol : Bool) (nextPosition : Nat) : Rule :=
  { write := symbol
    move := .stay
    nextState := stateId machine (.selector sourceState symbol nextPosition) }

/-- The empty target cell. -/
def emptyOrderedCell : OrderedCell := ⟨none, none⟩

/-- Compile one list position: slot zero performs the actual occurrence;
slot one advances iff another list occurrence exists. -/
def compilePosition (machine : FiniteMachine) (sourceState : Nat)
    (symbol : Bool) (cell : FiniteCell) (position : Nat) : OrderedCell :=
  { slot0 := (cell[position]?).map (relocateRule machine)
    slot1 := if (cell[position + 1]?).isSome then
        some (selectorContinueRule machine sourceState symbol (position + 1))
      else none }

/-- Total row compiler for one allocated key. -/
def compileKey (machine : FiniteMachine) : StateKey -> StateRow
  | .entry sourceState =>
      match machine.states[sourceState]? with
      | none => ⟨emptyOrderedCell, emptyOrderedCell⟩
      | some row =>
          ⟨compilePosition machine sourceState false row.onFalse 0,
            compilePosition machine sourceState true row.onTrue 0⟩
  | .selector sourceState symbol position =>
      match machine.states[sourceState]? with
      | none => ⟨emptyOrderedCell, emptyOrderedCell⟩
      | some row =>
          let selected := compilePosition machine sourceState symbol
            (finiteCell row symbol) position
          if symbol then ⟨emptyOrderedCell, selected⟩
          else ⟨selected, emptyOrderedCell⟩

/-- Compile an allocated key list structurally.  This transparent recursion
keeps lookup proofs independent of quotient-backed generic map theorems. -/
def compileKeys (machine : FiniteMachine) : List StateKey -> List StateRow
  | [] => []
  | key :: keys => compileKey machine key :: compileKeys machine keys

@[simp]
theorem compileKeys_length (machine : FiniteMachine) (keys : List StateKey) :
    (compileKeys machine keys).length = keys.length := by
  induction keys with
  | nil => rfl
  | cons key keys ih => simp [compileKeys, ih]

/-- Structural compilation preserves lookup at the explicit first index. -/
theorem compileKeys_getElem?_listIndexOf_of_mem
    (machine : FiniteMachine) (key : StateKey) (keys : List StateKey)
    (hmem : key ∈ keys) :
    (compileKeys machine keys)[listIndexOf key keys]? =
      some (compileKey machine key) := by
  induction keys with
  | nil => cases hmem
  | cons head tail ih =>
      by_cases heq : head = key
      · subst head
        simp [listIndexOf, compileKeys]
      · have htail : key ∈ tail := by
          rcases List.mem_cons.mp hmem with hhead | htail
          · exact False.elim (heq hhead.symm)
          · exact htail
        simp [listIndexOf, compileKeys, heq, ih htail]

/-- One finite flat natural-numbered ordered-binary transition table. -/
def compileMachine (machine : FiniteMachine) : Machine :=
  { states := compileKeys machine (stateKeys machine) }

/-- Source initialization relocates only the finite control state. -/
def compileInstance (source : FiniteInstance) : Instance :=
  { machine := compileMachine source.machine
    initialState := stateId source.machine (.entry source.initialState)
    input := source.input }

/-- Compiled lookup at an allocated key recovers its exact compiled row. -/
theorem compileMachine_getElem?_stateId
    (machine : FiniteMachine) (key : StateKey)
    (hmem : key ∈ stateKeys machine) :
    (compileMachine machine).states[stateId machine key]? =
      some (compileKey machine key) := by
  exact compileKeys_getElem?_listIndexOf_of_mem machine key
    (stateKeys machine) hmem

/-- Relocate a complete source row to a compiled source-boundary row. -/
def compileRow (machine : FiniteMachine) (row : Row) : Row :=
  { row with state := stateId machine (.entry row.state) }

/-- Initialization is literally preserved except for finite-control
relocation. -/
theorem compile_initialRow (source : FiniteInstance) :
    ProtectedTrieTableau.initialRow (compileInstance source) =
      compileRow source.machine
        { state := source.initialState
          head := 1
          tape := false :: source.input ++ [false] } :=
  rfl

/-! ## Executable first-return semantics -/

/-- Replacing a list entry by the value already stored there leaves the list
literally unchanged. -/
theorem replaceAt?_same_of_getElem? {alpha : Type} (items : List alpha)
    (index : Nat) (value : alpha) (hget : items[index]? = some value) :
    replaceAt? items index value = some items := by
  induction items generalizing index with
  | nil => simp at hget
  | cons head tail ih =>
      cases index with
      | zero =>
          simp at hget
          subst value
          rfl
      | succ index =>
          simp only [List.getElem?_cons_succ] at hget
          simp [replaceAt?, ih index hget]

/-- Relocating finite control commutes exactly with applying a source rule. -/
theorem applyRule?_relocateRule (machine : FiniteMachine) (row : Row)
    (rule : Rule) :
    applyRule? (compileRow machine row) (relocateRule machine rule) =
      (applyRule? row rule).map (compileRow machine) := by
  unfold applyRule?
  cases hwrite : replaceAt? row.tape row.head rule.write with
  | none => simp [compileRow, relocateRule, hwrite]
  | some tape =>
      simp [compileRow, relocateRule, hwrite]

/-- A selector continuation changes only the compiled finite-control state. -/
theorem applyRule?_selectorContinueRule
    (machine : FiniteMachine) (row : Row) (sourceState : Nat)
    (symbol : Bool) (nextPosition : Nat)
    (hscan : scanned? row = some symbol) :
    applyRule? row
        (selectorContinueRule machine sourceState symbol nextPosition) =
      some { row with
        state := stateId machine (StateKey.selector sourceState symbol nextPosition) } := by
  unfold scanned? at hscan
  have hreplace := replaceAt?_same_of_getElem? row.tape row.head symbol hscan
  simp [applyRule?, selectorContinueRule, hreplace, movePadded]

/-- Relocating finite control does not alter the scanned physical symbol. -/
theorem scanned?_compileRow (machine : FiniteMachine) (row : Row) :
    scanned? (compileRow machine row) = scanned? row :=
  rfl

/-- The allocated source-entry row exposes occurrence zero in slot `0`. -/
theorem ruleAt?_compiled_entry_false
    (machine : FiniteMachine) (sourceState : Nat) (sourceRow : FiniteStateRow)
    (symbol : Bool) (hstate : machine.states[sourceState]? = some sourceRow) :
    ruleAt? (compileMachine machine) (stateId machine (.entry sourceState))
        symbol false =
      ((finiteCell sourceRow symbol)[0]?).map (relocateRule machine) := by
  have hmem := entry_mem_stateKeys_of_getElem? machine sourceState sourceRow hstate
  have hlookup := compileMachine_getElem?_stateId machine (.entry sourceState) hmem
  unfold ruleAt?
  rw [hlookup]
  change occurrence (symbolCell (compileKey machine (.entry sourceState)) symbol)
      false = _
  simp only [compileKey, hstate]
  cases symbol <;> rfl

/-- The allocated source-entry row advances from occurrence zero exactly
when occurrence one exists. -/
theorem ruleAt?_compiled_entry_true
    (machine : FiniteMachine) (sourceState : Nat) (sourceRow : FiniteStateRow)
    (symbol : Bool) (hstate : machine.states[sourceState]? = some sourceRow) :
    ruleAt? (compileMachine machine) (stateId machine (.entry sourceState))
        symbol true =
      if ((finiteCell sourceRow symbol)[1]?).isSome then
        some (selectorContinueRule machine sourceState symbol 1)
      else none := by
  have hmem := entry_mem_stateKeys_of_getElem? machine sourceState sourceRow hstate
  have hlookup := compileMachine_getElem?_stateId machine (.entry sourceState) hmem
  unfold ruleAt?
  rw [hlookup]
  change occurrence (symbolCell (compileKey machine (.entry sourceState)) symbol)
      true = _
  simp only [compileKey, hstate]
  cases symbol <;> rfl

/-- An allocated selector row exposes its indexed occurrence in slot `0`. -/
theorem ruleAt?_compiled_selector_false
    (machine : FiniteMachine) (sourceState : Nat) (sourceRow : FiniteStateRow)
    (symbol : Bool) (position : Nat)
    (hstate : machine.states[sourceState]? = some sourceRow)
    (hposition : position < (finiteCell sourceRow symbol).length) :
    ruleAt? (compileMachine machine)
        (stateId machine (.selector sourceState symbol position)) symbol false =
      ((finiteCell sourceRow symbol)[position]?).map (relocateRule machine) := by
  have hmem := selector_mem_stateKeys_of_getElem? machine sourceState sourceRow
    hstate symbol position hposition
  have hlookup := compileMachine_getElem?_stateId machine
    (.selector sourceState symbol position) hmem
  unfold ruleAt?
  rw [hlookup]
  change occurrence
      (symbolCell (compileKey machine (.selector sourceState symbol position)) symbol)
      false = _
  simp only [compileKey, hstate]
  cases symbol <;> rfl

/-- An allocated selector row advances exactly when the following source
occurrence exists. -/
theorem ruleAt?_compiled_selector_true
    (machine : FiniteMachine) (sourceState : Nat) (sourceRow : FiniteStateRow)
    (symbol : Bool) (position : Nat)
    (hstate : machine.states[sourceState]? = some sourceRow)
    (hposition : position < (finiteCell sourceRow symbol).length) :
    ruleAt? (compileMachine machine)
        (stateId machine (.selector sourceState symbol position)) symbol true =
      if ((finiteCell sourceRow symbol)[position + 1]?).isSome then
        some (selectorContinueRule machine sourceState symbol (position + 1))
      else none := by
  have hmem := selector_mem_stateKeys_of_getElem? machine sourceState sourceRow
    hstate symbol position hposition
  have hlookup := compileMachine_getElem?_stateId machine
    (.selector sourceState symbol position) hmem
  unfold ruleAt?
  rw [hlookup]
  change occurrence
      (symbolCell (compileKey machine (.selector sourceState symbol position)) symbol)
      true = _
  simp only [compileKey, hstate]
  cases symbol <;> rfl

/-- The entry key represents list position zero; positive positions use the
literal symbol-specific selector key. -/
def positionKey (sourceState : Nat) (symbol : Bool) : Nat -> StateKey
  | 0 => .entry sourceState
  | position + 1 => .selector sourceState symbol (position + 1)

/-- The compiled configuration at an intermediate selector position. -/
def positionRow (machine : FiniteMachine) (row : Row)
    (symbol : Bool) (position : Nat) : Row :=
  { row with state := stateId machine (positionKey row.state symbol position) }

@[simp] theorem positionRow_zero (machine : FiniteMachine) (row : Row)
    (symbol : Bool) :
    positionRow machine row symbol 0 = compileRow machine row :=
  rfl

@[simp] theorem scanned?_positionRow (machine : FiniteMachine) (row : Row)
    (symbol : Bool) (position : Nat) :
    scanned? (positionRow machine row symbol position) = scanned? row :=
  rfl

/-- Rule application ignores the incoming control state, so the same
relocation theorem holds at every intermediate selector position. -/
theorem applyRule?_relocateRule_positionRow
    (machine : FiniteMachine) (row : Row) (symbol : Bool) (position : Nat)
    (rule : Rule) :
    applyRule? (positionRow machine row symbol position)
        (relocateRule machine rule) =
      (applyRule? row rule).map (compileRow machine) := by
  unfold applyRule?
  cases hwrite : replaceAt? row.tape row.head rule.write with
  | none => simp [positionRow, compileRow, relocateRule, hwrite]
  | some tape => simp [positionRow, compileRow, relocateRule, hwrite]

/-- At every allocated list position, slot zero is exactly the relocated
source occurrence at that position. -/
theorem ruleAt?_compiled_position_false
    (machine : FiniteMachine) (row : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool) (position : Nat)
    (hstate : machine.states[row.state]? = some sourceRow)
    (hposition : position = 0 \/
      position < (finiteCell sourceRow symbol).length) :
    ruleAt? (compileMachine machine)
        (stateId machine (positionKey row.state symbol position)) symbol false =
      ((finiteCell sourceRow symbol)[position]?).map (relocateRule machine) := by
  cases position with
  | zero =>
      simpa [positionKey] using
        ruleAt?_compiled_entry_false machine row.state sourceRow symbol hstate
  | succ position =>
      have hlt : position + 1 < (finiteCell sourceRow symbol).length := by
        rcases hposition with hzero | hlt
        · simp at hzero
        · exact hlt
      simpa [positionKey] using
        ruleAt?_compiled_selector_false machine row.state sourceRow symbol
          (position + 1) hstate hlt

/-- At every allocated list position, slot one is exactly the administrative
edge to the following position, when that following occurrence exists. -/
theorem ruleAt?_compiled_position_true
    (machine : FiniteMachine) (row : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool) (position : Nat)
    (hstate : machine.states[row.state]? = some sourceRow)
    (hposition : position = 0 \/
      position < (finiteCell sourceRow symbol).length) :
    ruleAt? (compileMachine machine)
        (stateId machine (positionKey row.state symbol position)) symbol true =
      if ((finiteCell sourceRow symbol)[position + 1]?).isSome then
        some (selectorContinueRule machine row.state symbol (position + 1))
      else none := by
  cases position with
  | zero =>
      simpa [positionKey] using
        ruleAt?_compiled_entry_true machine row.state sourceRow symbol hstate
  | succ position =>
      have hlt : position + 1 < (finiteCell sourceRow symbol).length := by
        rcases hposition with hzero | hlt
        · simp at hzero
        · exact hlt
      simpa [positionKey] using
        ruleAt?_compiled_selector_true machine row.state sourceRow symbol
          (position + 1) hstate hlt

/-- Returning through slot zero at an allocated position performs precisely
the source rule and relocates only its successor control state. -/
theorem step?_compiled_position_false
    (machine : FiniteMachine) (row : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool) (position : Nat)
    (hscan : scanned? row = some symbol)
    (hstate : machine.states[row.state]? = some sourceRow)
    (hposition : position = 0 \/
      position < (finiteCell sourceRow symbol).length) :
    step? (compileMachine machine) (positionRow machine row symbol position) false =
      ((finiteCell sourceRow symbol)[position]?).bind
        (fun rule => (applyRule? row rule).map (compileRow machine)) := by
  unfold step?
  change (do
      let scanned <- scanned? row
      let rule <- ruleAt? (compileMachine machine)
        (stateId machine (positionKey row.state symbol position)) scanned false
      applyRule? (positionRow machine row symbol position) rule) = _
  rw [hscan]
  change (ruleAt? (compileMachine machine)
      (stateId machine (positionKey row.state symbol position)) symbol false).bind
        (fun rule => applyRule? (positionRow machine row symbol position) rule) = _
  rw [ruleAt?_compiled_position_false machine row sourceRow symbol position
    hstate hposition]
  cases hget : (finiteCell sourceRow symbol)[position]? with
  | none => simp [hget]
  | some rule =>
      simp [hget, applyRule?_relocateRule_positionRow]

/-- A successful administrative selector edge preserves the entire physical
configuration and advances to the next allocated list position. -/
theorem step?_compiled_position_true
    (machine : FiniteMachine) (row : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool) (position : Nat)
    (hscan : scanned? row = some symbol)
    (hstate : machine.states[row.state]? = some sourceRow)
    (hposition : position = 0 \/
      position < (finiteCell sourceRow symbol).length)
    (hnext : position + 1 < (finiteCell sourceRow symbol).length) :
    step? (compileMachine machine) (positionRow machine row symbol position) true =
      some (positionRow machine row symbol (position + 1)) := by
  have hsome : ((finiteCell sourceRow symbol)[position + 1]?).isSome := by
    simpa using hnext
  unfold step?
  change (do
      let scanned <- scanned? row
      let rule <- ruleAt? (compileMachine machine)
        (stateId machine (positionKey row.state symbol position)) scanned true
      applyRule? (positionRow machine row symbol position) rule) = _
  rw [hscan]
  change (ruleAt? (compileMachine machine)
      (stateId machine (positionKey row.state symbol position)) symbol true).bind
        (fun rule => applyRule? (positionRow machine row symbol position) rule) = _
  rw [ruleAt?_compiled_position_true machine row sourceRow symbol position
    hstate hposition]
  simp only [hsome, ↓reduceIte]
  change applyRule? (positionRow machine row symbol position)
      (selectorContinueRule machine row.state symbol (position + 1)) = _
  rw [applyRule?_selectorContinueRule _ _ _ _ _ (by simpa using hscan)]
  simp [positionRow, positionKey]

/-- From any allocated selector position, the unary first-return code selects
exactly the source occurrence at the corresponding absolute list index. -/
theorem run?_compiled_position_occurrenceCode
    (machine : FiniteMachine) (row : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool) (position offset : Nat)
    (hscan : scanned? row = some symbol)
    (hstate : machine.states[row.state]? = some sourceRow)
    (hposition : position = 0 \/
      position < (finiteCell sourceRow symbol).length) :
    run? (compileMachine machine) (positionRow machine row symbol position)
        (occurrenceCode offset) =
      ((finiteCell sourceRow symbol)[position + offset]?).bind
        (fun rule => (applyRule? row rule).map (compileRow machine)) := by
  induction offset generalizing position with
  | zero =>
      simp only [occurrenceCode, List.replicate_zero, List.nil_append, run?]
      simpa using step?_compiled_position_false machine row sourceRow symbol
        position hscan hstate hposition
  | succ offset ih =>
      rw [show occurrenceCode (offset + 1) = true :: occurrenceCode offset by
        simp [occurrenceCode, List.replicate_succ]]
      simp only [run?]
      by_cases hnext : position + 1 < (finiteCell sourceRow symbol).length
      · rw [step?_compiled_position_true machine row sourceRow symbol position
          hscan hstate hposition hnext]
        change run? (compileMachine machine)
          (positionRow machine row symbol (position + 1))
          (occurrenceCode offset) = _
        have hposition' : position + 1 = 0 \/
            position + 1 < (finiteCell sourceRow symbol).length :=
          Or.inr hnext
        rw [ih (position + 1) hposition']
        congr 2
        simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      · have hnone :
            (finiteCell sourceRow symbol)[position + (offset + 1)]? = none := by
          apply List.getElem?_eq_none
          apply Nat.le_trans (Nat.le_of_not_gt hnext)
          rw [Nat.add_comm offset 1, ← Nat.add_assoc]
          exact Nat.le_add_right _ _
        have hsome :
            ((finiteCell sourceRow symbol)[position + 1]?).isSome = false := by
          simpa using hnext
        have hstepnone :
            step? (compileMachine machine)
                (positionRow machine row symbol position) true = none := by
          unfold step?
          change (do
              let scanned <- scanned? row
              let rule <- ruleAt? (compileMachine machine)
                (stateId machine (positionKey row.state symbol position))
                scanned true
              applyRule? (positionRow machine row symbol position) rule) = none
          rw [hscan]
          change (ruleAt? (compileMachine machine)
              (stateId machine (positionKey row.state symbol position))
              symbol true).bind
                (fun rule => applyRule?
                  (positionRow machine row symbol position) rule) = none
          rw [ruleAt?_compiled_position_true machine row sourceRow symbol position
            hstate hposition]
          simp [hsome]
        rw [hstepnone]
        simp [hnone]

/-- At a source boundary, the complete code `1^k0` has exactly the same
partial result as direct occurrence `k`, modulo finite-control relocation. -/
theorem run?_compiled_occurrenceCode_of_state_scan
    (machine : FiniteMachine) (row : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool) (index : Nat)
    (hscan : scanned? row = some symbol)
    (hstate : machine.states[row.state]? = some sourceRow) :
    run? (compileMachine machine) (compileRow machine row)
        (occurrenceCode index) =
      (finiteStep? machine row index).map (compileRow machine) := by
  rw [← positionRow_zero machine row symbol,
    run?_compiled_position_occurrenceCode machine row sourceRow symbol 0 index
      hscan hstate (Or.inl rfl)]
  rw [Nat.zero_add]
  unfold finiteStep? finiteRuleAt?
  rw [hscan, hstate]
  change ((finiteCell sourceRow symbol)[index]?).bind
      (fun rule => (applyRule? row rule).map (compileRow machine)) =
    (((finiteCell sourceRow symbol)[index]?).bind
      (fun rule => applyRule? row rule)).map (compileRow machine)
  cases hget : (finiteCell sourceRow symbol)[index]? with
  | none => rfl
  | some rule =>
      cases happly : applyRule? row rule <;> rfl

/-- Every successful finite-list source occurrence is preserved by its exact
binary first-return macrohistory. -/
theorem compiled_occurrence_preserved
    (machine : FiniteMachine) (row next : Row) (index : Nat)
    (hstep : finiteStep? machine row index = some next) :
    run? (compileMachine machine) (compileRow machine row)
      (occurrenceCode index) = some (compileRow machine next) := by
  have hsource := hstep
  unfold finiteStep? at hstep
  cases hscan : scanned? row with
  | none =>
      rw [hscan] at hstep
      cases hstep
  | some symbol =>
      cases hstate : machine.states[row.state]? with
      | none =>
          rw [hscan] at hstep
          unfold finiteRuleAt? at hstep
          rw [hstate] at hstep
          cases hstep
      | some sourceRow =>
          rw [run?_compiled_occurrenceCode_of_state_scan machine row sourceRow
            symbol index hscan hstate, hsource]
          rfl

/-- A successful compiled first-return macrohistory reflects one and only one
source occurrence result. -/
theorem compiled_occurrence_reflected_of_state_scan
    (machine : FiniteMachine) (row target : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool) (index : Nat)
    (hscan : scanned? row = some symbol)
    (hstate : machine.states[row.state]? = some sourceRow)
    (hrun : run? (compileMachine machine) (compileRow machine row)
      (occurrenceCode index) = some target) :
    exists next,
      finiteStep? machine row index = some next /\
      target = compileRow machine next := by
  rw [run?_compiled_occurrenceCode_of_state_scan machine row sourceRow symbol
    index hscan hstate] at hrun
  cases hstep : finiteStep? machine row index with
  | none => simp [hstep] at hrun
  | some next =>
      simp [hstep] at hrun
      exact ⟨next, rfl, hrun.symm⟩

/-- On every well-formed boundary row, source success and compiled
first-return success are equivalent, with the final row fixed literally by
`compileRow`. -/
theorem compiled_occurrence_success_iff
    (machine : FiniteMachine) (row : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool) (index : Nat)
    (hscan : scanned? row = some symbol)
    (hstate : machine.states[row.state]? = some sourceRow) :
    (exists next, finiteStep? machine row index = some next) <->
      exists next,
        run? (compileMachine machine) (compileRow machine row)
          (occurrenceCode index) = some (compileRow machine next) := by
  constructor
  · rintro ⟨next, hnext⟩
    exact ⟨next, compiled_occurrence_preserved machine row next index hnext⟩
  · rintro ⟨next, hrun⟩
    obtain ⟨sourceNext, hsource, heq⟩ :=
      compiled_occurrence_reflected_of_state_scan machine row
        (compileRow machine next) sourceRow symbol index hscan hstate hrun
    exact ⟨sourceNext, hsource⟩

/-- Any existing list position can be overwritten by an arbitrary value. -/
theorem replaceAt?_exists_of_getElem? {alpha : Type} (items : List alpha)
    (index : Nat) (oldValue newValue : alpha)
    (hget : items[index]? = some oldValue) :
    exists updated, replaceAt? items index newValue = some updated := by
  induction items generalizing index with
  | nil => simp at hget
  | cons head tail ih =>
      cases index with
      | zero => exact ⟨newValue :: tail, rfl⟩
      | succ index =>
          simp only [List.getElem?_cons_succ] at hget
          obtain ⟨updated, hupdated⟩ := ih index hget
          exact ⟨head :: updated, by simp [replaceAt?, hupdated]⟩

/-- A supplied rule is total whenever the finite-window head scans an
existing tape cell. -/
theorem applyRule?_exists_of_scanned (row : Row) (symbol : Bool) (rule : Rule)
    (hscan : scanned? row = some symbol) :
    exists next, applyRule? row rule = some next := by
  unfold scanned? at hscan
  obtain ⟨written, hwritten⟩ := replaceAt?_exists_of_getElem?
    row.tape row.head symbol rule.write hscan
  unfold applyRule?
  rw [hwritten]
  exact ⟨{ state := rule.nextState
           head := (movePadded written row.head rule.move).2
           tape := (movePadded written row.head rule.move).1 }, rfl⟩

/-- A complete first-return code cannot run when neither the administrative
nor return slot is enabled at its starting row. -/
theorem run?_occurrenceCode_eq_none_of_both_steps_none
    (machine : Machine) (row : Row) (index : Nat)
    (hfalse : step? machine row false = none)
    (htrue : step? machine row true = none) :
    run? machine row (occurrenceCode index) = none := by
  cases index with
  | zero =>
      change (step? machine row false).bind
        (fun next => run? machine next []) = none
      rw [hfalse]
      rfl
  | succ index =>
      rw [show occurrenceCode (index + 1) =
          true :: occurrenceCode index by rfl]
      change (step? machine row true).bind
        (fun next => run? machine next (occurrenceCode index)) = none
      rw [htrue]
      rfl

/-- Conventional terminality for a finite-list-branching source row. -/
def FiniteTerminal (machine : FiniteMachine) (row : Row) : Prop :=
  forall index, finiteStep? machine row index = none

/-- On a well-formed boundary row, source terminality is exactly emptiness of
the scanned ordered occurrence list. -/
theorem finiteTerminal_iff_cell_empty
    (machine : FiniteMachine) (row : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool)
    (hscan : scanned? row = some symbol)
    (hstate : machine.states[row.state]? = some sourceRow) :
    FiniteTerminal machine row <-> finiteCell sourceRow symbol = [] := by
  constructor
  · intro hterminal
    cases hcell : finiteCell sourceRow symbol with
    | nil => rfl
    | cons rule tail =>
        obtain ⟨next, happly⟩ := applyRule?_exists_of_scanned row symbol rule hscan
        have hstep : finiteStep? machine row 0 = some next := by
          unfold finiteStep? finiteRuleAt?
          rw [hscan, hstate]
          change ((finiteCell sourceRow symbol)[0]?).bind
            (fun selected => applyRule? row selected) = some next
          rw [hcell]
          change applyRule? row rule = some next
          exact happly
        rw [hterminal 0] at hstep
        contradiction
  · intro hempty index
    unfold finiteStep? finiteRuleAt?
    rw [hscan, hstate]
    change ((finiteCell sourceRow symbol)[index]?).bind
      (fun selected => applyRule? row selected) = none
    rw [hempty]
    rfl

/-- The compiled entry row is terminal exactly when the source occurrence
list under the same physical symbol is empty. -/
theorem compiledTerminal_iff_cell_empty
    (machine : FiniteMachine) (row : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool)
    (hscan : scanned? row = some symbol)
    (hstate : machine.states[row.state]? = some sourceRow) :
    Terminal (compileMachine machine) (compileRow machine row) <->
      finiteCell sourceRow symbol = [] := by
  constructor
  · intro hterminal
    cases hcell : finiteCell sourceRow symbol with
    | nil => rfl
    | cons rule tail =>
        obtain ⟨next, happly⟩ := applyRule?_exists_of_scanned row symbol rule hscan
        have hsource : finiteStep? machine row 0 = some next := by
          unfold finiteStep? finiteRuleAt?
          rw [hscan, hstate]
          change ((finiteCell sourceRow symbol)[0]?).bind
            (fun selected => applyRule? row selected) = some next
          rw [hcell]
          change applyRule? row rule = some next
          exact happly
        have htarget := compiled_occurrence_preserved machine row next 0 hsource
        have hnone := run?_occurrenceCode_eq_none_of_both_steps_none
          (compileMachine machine) (compileRow machine row) 0
          hterminal.1 hterminal.2
        rw [hnone] at htarget
        contradiction
  · intro hempty
    constructor
    · unfold step?
      rw [scanned?_compileRow, hscan]
      change (ruleAt? (compileMachine machine)
          (stateId machine (.entry row.state)) symbol false).bind
            (fun rule => applyRule? (compileRow machine row) rule) = none
      rw [ruleAt?_compiled_entry_false machine row.state sourceRow symbol hstate]
      rw [hempty]
      rfl
    · unfold step?
      rw [scanned?_compileRow, hscan]
      change (ruleAt? (compileMachine machine)
          (stateId machine (.entry row.state)) symbol true).bind
            (fun rule => applyRule? (compileRow machine row) rule) = none
      rw [ruleAt?_compiled_entry_true machine row.state sourceRow symbol hstate]
      rw [hempty]
      rfl

/-- Flat binary compilation preserves and reflects conventional terminality
at every source boundary. -/
theorem finiteTerminal_iff_compiledTerminal
    (machine : FiniteMachine) (row : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool)
    (hscan : scanned? row = some symbol)
    (hstate : machine.states[row.state]? = some sourceRow) :
    FiniteTerminal machine row <->
      Terminal (compileMachine machine) (compileRow machine row) := by
  rw [finiteTerminal_iff_cell_empty machine row sourceRow symbol hscan hstate,
    compiledTerminal_iff_cell_empty machine row sourceRow symbol hscan hstate]

/-- No in-range administrative selector position can be mistaken for a
terminal source boundary: its slot-zero occurrence is enabled. -/
theorem compiled_selector_not_terminal
    (machine : FiniteMachine) (row : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool) (position : Nat)
    (hscan : scanned? row = some symbol)
    (hstate : machine.states[row.state]? = some sourceRow)
    (hposition : position < (finiteCell sourceRow symbol).length) :
    Not (Terminal (compileMachine machine)
      (positionRow machine row symbol position)) := by
  intro hterminal
  have hposition' : position = 0 \/
      position < (finiteCell sourceRow symbol).length := Or.inr hposition
  have hget := getElem?_pos (finiteCell sourceRow symbol) position hposition
  let rule := (finiteCell sourceRow symbol)[position]'hposition
  have hgetRule : (finiteCell sourceRow symbol)[position]? = some rule := by
    exact hget
  obtain ⟨next, happly⟩ := applyRule?_exists_of_scanned row symbol rule hscan
  have hstep := step?_compiled_position_false machine row sourceRow symbol position
    hscan hstate hposition'
  rw [hgetRule] at hstep
  have hstep' : step? (compileMachine machine)
      (positionRow machine row symbol position) false =
        some (compileRow machine next) := by
    rw [hstep]
    change (applyRule? row rule).map (compileRow machine) = _
    rw [happly]
    rfl
  rw [hterminal.1] at hstep'
  contradiction

/-- Equal rule texts at distinct source positions retain distinct successful
compiled macrohistories, even though their final physical rows coincide. -/
theorem compiled_equal_rules_preserve_multiplicity
    (machine : FiniteMachine) (row : Row) (sourceRow : FiniteStateRow)
    (symbol : Bool) (left right : Nat) (rule : Rule)
    (hscan : scanned? row = some symbol)
    (hstate : machine.states[row.state]? = some sourceRow)
    (hleft : (finiteCell sourceRow symbol)[left]? = some rule)
    (hright : (finiteCell sourceRow symbol)[right]? = some rule)
    (hne : left ≠ right) :
    exists next,
      run? (compileMachine machine) (compileRow machine row)
          (occurrenceCode left) = some (compileRow machine next) /\
      run? (compileMachine machine) (compileRow machine row)
          (occurrenceCode right) = some (compileRow machine next) /\
      occurrenceCode left ≠ occurrenceCode right := by
  obtain ⟨next, happly⟩ := applyRule?_exists_of_scanned row symbol rule hscan
  have hstepLeft : finiteStep? machine row left = some next := by
    unfold finiteStep? finiteRuleAt?
    rw [hscan, hstate]
    change ((finiteCell sourceRow symbol)[left]?).bind
      (fun selected => applyRule? row selected) = some next
    rw [hleft]
    change applyRule? row rule = some next
    exact happly
  have hstepRight : finiteStep? machine row right = some next := by
    unfold finiteStep? finiteRuleAt?
    rw [hscan, hstate]
    change ((finiteCell sourceRow symbol)[right]?).bind
      (fun selected => applyRule? row selected) = some next
    rw [hright]
    change applyRule? row rule = some next
    exact happly
  exact ⟨next,
    compiled_occurrence_preserved machine row next left hstepLeft,
    compiled_occurrence_preserved machine row next right hstepRight,
    fun heq => hne (occurrenceCode_injective heq)⟩

/-- Execute a finite sequence of source occurrence indices. -/
def finiteRun? (machine : FiniteMachine) : Row -> List Nat -> Option Row
  | row, [] => some row
  | row, index :: history => do
      let next <- finiteStep? machine row index
      finiteRun? machine next history

/-- Concatenating the unary first-return codes preserves every successful
finite source run, including all intermediate selector administration. -/
theorem compiled_history_preserved
    (machine : FiniteMachine) (row final : Row) (history : List Nat)
    (hrun : finiteRun? machine row history = some final) :
    run? (compileMachine machine) (compileRow machine row)
        (encodeOccurrenceHistory history) =
      some (compileRow machine final) := by
  induction history generalizing row with
  | nil =>
      simp [finiteRun?] at hrun
      subst final
      rfl
  | cons index history ih =>
      unfold finiteRun? at hrun
      cases hstep : finiteStep? machine row index with
      | none => simp [hstep] at hrun
      | some next =>
          rw [hstep] at hrun
          change finiteRun? machine next history = some final at hrun
          have hmacro := compiled_occurrence_preserved machine row next index hstep
          have htail := ih next hrun
          unfold encodeOccurrenceHistory
          rw [run?_append, hmacro]
          exact htail

/-! ## Total boundary reflection, including malformed source rows -/

/-- Entry keys occupy exactly the source-state interval represented by a
suffix table.  Selector keys cannot alias an entry key. -/
theorem entry_mem_stateKeysFrom_iff (rows : List FiniteStateRow)
    (base sourceState : Nat) :
    StateKey.entry sourceState ∈ stateKeysFrom base rows <->
      base <= sourceState /\ sourceState < base + rows.length := by
  induction rows generalizing base with
  | nil => simp [stateKeysFrom]
  | cons row rows ih =>
      simp only [stateKeysFrom, List.mem_cons, List.mem_append,
        List.length_cons]
      have hfalse := entry_not_mem_selectorKeys sourceState base false row.onFalse
      have htrue := entry_not_mem_selectorKeys sourceState base true row.onTrue
      simp only [hfalse, htrue, false_or, ih]
      constructor
      · intro hmem
        rcases hmem with heq | htail
        · have heqNat : sourceState = base := StateKey.entry.inj heq
          subst sourceState
          exact ⟨Nat.le_refl base, by simp⟩
        · exact ⟨Nat.le_trans (Nat.le_add_right base 1) htail.1,
            by simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using htail.2⟩
      · intro hbounds
        rcases Nat.eq_or_lt_of_le hbounds.1 with heq | hlt
        · exact Or.inl (congrArg StateKey.entry heq.symm)
        · exact Or.inr ⟨Nat.add_one_le_iff.mpr hlt,
            by simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hbounds.2⟩

theorem entry_mem_stateKeys_iff (machine : FiniteMachine)
    (sourceState : Nat) :
    StateKey.entry sourceState ∈ stateKeys machine <->
      sourceState < machine.states.length := by
  simp [stateKeys, entry_mem_stateKeysFrom_iff]

/-- If an element is absent, the explicit first-index function returns the
list length. -/
theorem listIndexOf_eq_length_of_not_mem {alpha : Type} [DecidableEq alpha]
    (needle : alpha) (items : List alpha) (hnot : needle ∉ items) :
    listIndexOf needle items = items.length := by
  induction items with
  | nil => rfl
  | cons head tail ih =>
      have htail : needle ∉ tail := by
        intro hmem
        exact hnot (List.mem_cons_of_mem head hmem)
      by_cases heq : head = needle
      · subst head
        exact False.elim (hnot (by simp))
      · simp [listIndexOf, heq, ih htail]

/-- An out-of-range source entry is allocated no target row; its explicit
index is the one-past-the-end target-table index. -/
theorem compileMachine_entry_none_of_state_none
    (machine : FiniteMachine) (sourceState : Nat)
    (hstate : machine.states[sourceState]? = none) :
    (compileMachine machine).states[
      stateId machine (.entry sourceState)]? = none := by
  have hout : machine.states.length <= sourceState := by
    simpa using hstate
  have hnot : StateKey.entry sourceState ∉ stateKeys machine := by
    rw [entry_mem_stateKeys_iff]
    exact Nat.not_lt_of_ge hout
  unfold compileMachine stateId
  rw [listIndexOf_eq_length_of_not_mem _ _ hnot]
  simp

/-- The exact compiled/source option equality holds for every finite row,
including absent scans and out-of-range source states. -/
theorem run?_compiled_occurrenceCode
    (machine : FiniteMachine) (row : Row) (index : Nat) :
    run? (compileMachine machine) (compileRow machine row)
        (occurrenceCode index) =
      (finiteStep? machine row index).map (compileRow machine) := by
  cases hscan : scanned? row with
  | none =>
      have hsource : finiteStep? machine row index = none := by
        unfold finiteStep?
        rw [hscan]
        rfl
      have htarget (slot : Bool) :
          step? (compileMachine machine) (compileRow machine row) slot = none := by
        unfold step?
        rw [scanned?_compileRow, hscan]
        rfl
      rw [hsource]
      exact run?_occurrenceCode_eq_none_of_both_steps_none
        (compileMachine machine) (compileRow machine row) index
        (htarget false) (htarget true)
  | some symbol =>
      cases hstate : machine.states[row.state]? with
      | some sourceRow =>
          exact run?_compiled_occurrenceCode_of_state_scan machine row sourceRow
            symbol index hscan hstate
      | none =>
          have hlookup := compileMachine_entry_none_of_state_none
            machine row.state hstate
          have hrule (slot : Bool) :
              ruleAt? (compileMachine machine) (compileRow machine row).state
                symbol slot = none := by
            unfold ruleAt?
            change ((compileMachine machine).states[
              stateId machine (.entry row.state)]?).bind
                (fun stateRow => occurrence (symbolCell stateRow symbol) slot) = none
            rw [hlookup]
            rfl
          have hsource : finiteStep? machine row index = none := by
            unfold finiteStep? finiteRuleAt?
            rw [hscan, hstate]
            rfl
          have htarget (slot : Bool) :
              step? (compileMachine machine) (compileRow machine row) slot = none := by
            unfold step?
            rw [scanned?_compileRow, hscan]
            change (ruleAt? (compileMachine machine)
              (compileRow machine row).state symbol slot).bind
                (fun rule => applyRule? (compileRow machine row) rule) = none
            rw [hrule]
            rfl
          rw [hsource]
          exact run?_occurrenceCode_eq_none_of_both_steps_none
            (compileMachine machine) (compileRow machine row) index
            (htarget false) (htarget true)

/-- Total reflection: any successful complete selector code from a compiled
boundary is the relocation of a genuine source occurrence result. -/
theorem compiled_occurrence_reflected
    (machine : FiniteMachine) (row target : Row) (index : Nat)
    (hrun : run? (compileMachine machine) (compileRow machine row)
      (occurrenceCode index) = some target) :
    exists next,
      finiteStep? machine row index = some next /\
      target = compileRow machine next := by
  rw [run?_compiled_occurrenceCode machine row index] at hrun
  cases hstep : finiteStep? machine row index with
  | none => simp [hstep] at hrun
  | some next =>
      simp [hstep] at hrun
      exact ⟨next, rfl, hrun.symm⟩

/-- Premise-free terminality preservation and reflection.  Missing tape
scans and out-of-range source states are terminal on both sides; ordinary
boundary rows reduce to literal scanned-cell emptiness. -/
theorem finiteTerminal_iff_compiledTerminal_total
    (machine : FiniteMachine) (row : Row) :
    FiniteTerminal machine row <->
      Terminal (compileMachine machine) (compileRow machine row) := by
  cases hscan : scanned? row with
  | none =>
      have hsource : FiniteTerminal machine row := by
        intro index
        unfold finiteStep?
        rw [hscan]
        rfl
      have htarget :
          Terminal (compileMachine machine) (compileRow machine row) := by
        constructor <;>
          unfold step? <;>
          rw [scanned?_compileRow, hscan] <;>
          rfl
      exact ⟨fun _ => htarget, fun _ => hsource⟩
  | some symbol =>
      cases hstate : machine.states[row.state]? with
      | some sourceRow =>
          exact finiteTerminal_iff_compiledTerminal machine row sourceRow
            symbol hscan hstate
      | none =>
          have hsource : FiniteTerminal machine row := by
            intro index
            unfold finiteStep? finiteRuleAt?
            rw [hscan, hstate]
            rfl
          have hlookup := compileMachine_entry_none_of_state_none
            machine row.state hstate
          have hrule (slot : Bool) :
              ruleAt? (compileMachine machine) (compileRow machine row).state
                symbol slot = none := by
            unfold ruleAt?
            change ((compileMachine machine).states[
              stateId machine (.entry row.state)]?).bind
                (fun stateRow => occurrence (symbolCell stateRow symbol) slot) = none
            rw [hlookup]
            rfl
          have htarget :
              Terminal (compileMachine machine) (compileRow machine row) := by
            constructor
            · unfold step?
              rw [scanned?_compileRow, hscan]
              change (ruleAt? (compileMachine machine)
                (compileRow machine row).state symbol false).bind
                  (fun rule => applyRule? (compileRow machine row) rule) = none
              rw [hrule]
              rfl
            · unfold step?
              rw [scanned?_compileRow, hscan]
              change (ruleAt? (compileMachine machine)
                (compileRow machine row).state symbol true).bind
                  (fun rule => applyRule? (compileRow machine row) rule) = none
              rw [hrule]
              rfl
          exact ⟨fun _ => htarget, fun _ => hsource⟩

/-! ## Public flat-compilation certificate -/

/-- Concatenating complete first-return codes agrees with the entire finite
source run as an option, not merely on successful histories. -/
theorem run?_compiled_history
    (machine : FiniteMachine) (row : Row) (history : List Nat) :
    run? (compileMachine machine) (compileRow machine row)
        (encodeOccurrenceHistory history) =
      (finiteRun? machine row history).map (compileRow machine) := by
  induction history generalizing row with
  | nil => rfl
  | cons index history ih =>
      unfold encodeOccurrenceHistory
      rw [run?_append, run?_compiled_occurrenceCode]
      cases hstep : finiteStep? machine row index with
      | none => simp [finiteRun?, hstep]
      | some next =>
          simp only [hstep, Option.map_some, Option.bind_some, finiteRun?]
          exact ih next

/-- One premise-free certificate packages flat allocation, literal
initialization, exact first-return macrosteps, exact finite-history
refinement, terminality preservation/reflection, distinct occurrence codes,
and exclusion of false terminal selector states. -/
structure FlatBinaryFirstReturnCertificate (source : FiniteInstance) : Prop where
  initial :
    ProtectedTrieTableau.initialRow (compileInstance source) =
      compileRow source.machine
        { state := source.initialState
          head := 1
          tape := false :: source.input ++ [false] }
  exactOccurrence : forall (row : Row) (index : Nat),
    run? (compileMachine source.machine) (compileRow source.machine row)
        (occurrenceCode index) =
      (finiteStep? source.machine row index).map (compileRow source.machine)
  exactHistory : forall (row : Row) (history : List Nat),
    run? (compileMachine source.machine) (compileRow source.machine row)
        (encodeOccurrenceHistory history) =
      (finiteRun? source.machine row history).map (compileRow source.machine)
  terminality : forall row : Row,
    FiniteTerminal source.machine row <->
      Terminal (compileMachine source.machine) (compileRow source.machine row)
  occurrenceIdentity : IsInjective occurrenceCode
  selectorNotTerminal : forall
      (row : Row) (sourceRow : FiniteStateRow) (symbol : Bool) (position : Nat),
    scanned? row = some symbol ->
    source.machine.states[row.state]? = some sourceRow ->
    position < (finiteCell sourceRow symbol).length ->
    Not (Terminal (compileMachine source.machine)
      (positionRow source.machine row symbol position))

/-- Every finite ordered-list source instance has one concrete flat
natural-numbered ordered-binary first-return compilation certificate. -/
theorem finiteBranchBinaryMachineFirstReturn (source : FiniteInstance) :
    FlatBinaryFirstReturnCertificate source :=
  { initial := compile_initialRow source
    exactOccurrence := run?_compiled_occurrenceCode source.machine
    exactHistory := run?_compiled_history source.machine
    terminality := finiteTerminal_iff_compiledTerminal_total source.machine
    occurrenceIdentity := occurrenceCode_injective
    selectorNotTerminal := fun row sourceRow symbol position =>
      compiled_selector_not_terminal source.machine row sourceRow symbol position }

end PureSFormal.Research.FiniteBranchBinaryMachineCompiler
