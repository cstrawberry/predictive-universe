import Std

/-!
# Rogozhin's fixed four-state, six-symbol machine

This module is the finite, executable transcription of the normalized table
printed in Appendix D of the paper. Rows are read symbols
`0` through `5`; columns are states `A` through `D`.  The normalized blank is
symbol `4`, and the only halting cells are `(C, 3)` and `(D, 3)`.
-/

namespace PureSFormal.Rogozhin46

/-- The four states, in the printed column order. -/
inductive State where
  | A | B | C | D
  deriving DecidableEq, Repr

/-- The six normalized tape symbols, in the printed row order. -/
inductive Symbol where
  | s0 | s1 | s2 | s3 | s4 | s5
  deriving DecidableEq, Repr

/-- Head movement in a nonhalting machine command. -/
inductive Direction where
  | left | right
  deriving DecidableEq, Repr

/-- A table result: either a write/move/state command or a halt. -/
inductive Transition where
  | step (next : State) (write : Symbol) (move : Direction)
  | halt
  deriving DecidableEq, Repr

/-- The normalized blank symbol (Rogozhin's printed symbol `0`). -/
def blank : Symbol := .s4

/--
Total executable lookup for all 24 cells of Rogozhin's normalized
`UTM(4,6)` table.
-/
def transition : State → Symbol → Transition
  | .A, .s0 => .step .A .s3 .left
  | .B, .s0 => .step .B .s4 .right
  | .C, .s0 => .step .C .s0 .right
  | .D, .s0 => .step .D .s4 .right
  | .A, .s1 => .step .A .s2 .right
  | .B, .s1 => .step .C .s2 .left
  | .C, .s1 => .step .D .s3 .right
  | .D, .s1 => .step .B .s5 .left
  | .A, .s2 => .step .A .s1 .left
  | .B, .s2 => .step .B .s3 .right
  | .C, .s2 => .step .C .s1 .right
  | .D, .s2 => .step .D .s3 .right
  | .A, .s3 => .step .A .s4 .right
  | .B, .s3 => .step .B .s2 .left
  | .C, .s3 => .halt
  | .D, .s3 => .halt
  | .A, .s4 => .step .A .s3 .left
  | .B, .s4 => .step .B .s0 .left
  | .C, .s4 => .step .A .s5 .right
  | .D, .s4 => .step .B .s5 .left
  | .A, .s5 => .step .D .s4 .right
  | .B, .s5 => .step .B .s1 .right
  | .C, .s5 => .step .A .s0 .right
  | .D, .s5 => .step .D .s1 .right

/-- A fully reflected cell of the finite table. -/
structure Cell where
  state : State
  read : Symbol
  result : Transition
  deriving DecidableEq, Repr

/-- State enumeration in the printed column order. -/
def states : List State := [.A, .B, .C, .D]

/-- Symbol enumeration in the printed row order. -/
def symbols : List Symbol := [.s0, .s1, .s2, .s3, .s4, .s5]

/-- The complete direction enumeration. -/
def directions : List Direction := [.left, .right]

/-- All state/symbol keys in printed row-major order. -/
def keys : List (State × Symbol) := [
  (.A, .s0), (.B, .s0), (.C, .s0), (.D, .s0),
  (.A, .s1), (.B, .s1), (.C, .s1), (.D, .s1),
  (.A, .s2), (.B, .s2), (.C, .s2), (.D, .s2),
  (.A, .s3), (.B, .s3), (.C, .s3), (.D, .s3),
  (.A, .s4), (.B, .s4), (.C, .s4), (.D, .s4),
  (.A, .s5), (.B, .s5), (.C, .s5), (.D, .s5)
]

/-- Reflect an executable lookup into a table cell. -/
def cellOfKey (key : State × Symbol) : Cell :=
  ⟨key.1, key.2, transition key.1 key.2⟩

/-- The table as a finite row-major list of all reflected cells. -/
def table : List Cell := keys.map cellOfKey

@[simp]
theorem blank_eq_s4 : blank = .s4 := rfl

@[simp]
theorem states_length : states.length = 4 := rfl

@[simp]
theorem symbols_length : symbols.length = 6 := rfl

@[simp]
theorem directions_length : directions.length = 2 := rfl

@[simp]
theorem keys_length : keys.length = 24 := rfl

@[simp]
theorem table_length : table.length = 24 := rfl

/-- Every state occurs in the canonical state enumeration. -/
theorem state_mem_states (state : State) : state ∈ states := by
  cases state <;> decide

/-- Every symbol occurs in the canonical symbol enumeration. -/
theorem symbol_mem_symbols (symbol : Symbol) : symbol ∈ symbols := by
  cases symbol <;> decide

/-- Every direction occurs in the canonical direction enumeration. -/
theorem direction_mem_directions (direction : Direction) :
    direction ∈ directions := by
  cases direction <;> decide

/-- Every state/symbol input occurs among the 24 row-major keys. -/
theorem key_mem_keys (state : State) (read : Symbol) :
    (state, read) ∈ keys := by
  cases state <;> cases read <;> decide

/-- The row-major input keys have no repetition. -/
theorem keys_nodup : keys.Nodup := by
  decide

/-- The 24 reflected table cells have no repetition. -/
theorem table_nodup : table.Nodup := by
  decide

/-- Constructive forward transport of list membership through `map`. -/
theorem mem_map_image (f : α → β) {value : α} {input : List α}
    (hmem : value ∈ input) : f value ∈ input.map f := by
  induction hmem with
  | head tail => exact .head _
  | tail head hmem ih => exact .tail _ ih

/-- Constructive inversion of membership in a mapped list. -/
theorem exists_of_mem_map (f : α → β) {output : β} {input : List α}
    (hmem : output ∈ input.map f) :
    ∃ value : α, value ∈ input ∧ f value = output := by
  induction input with
  | nil => cases hmem
  | cons head tail ih =>
      cases hmem with
      | head => exact ⟨head, .head _, rfl⟩
      | tail _ htail =>
          obtain ⟨value, hvalue, heq⟩ := ih htail
          exact ⟨value, .tail _ hvalue, heq⟩

/-- Membership in the finite table is exactly agreement with lookup. -/
theorem cell_mem_table_iff (cell : Cell) :
    cell ∈ table ↔ cell.result = transition cell.state cell.read := by
  constructor
  · intro hmem
    obtain ⟨key, _, hcell⟩ := exists_of_mem_map cellOfKey hmem
    rw [← hcell]
    rfl
  · intro hagree
    cases cell with
    | mk state read result =>
        simp only at hagree
        subst result
        exact mem_map_image cellOfKey (key_mem_keys state read)

/-- Executable lookup always has its reflected cell in the table. -/
theorem lookup_complete (state : State) (read : Symbol) :
    ⟨state, read, transition state read⟩ ∈ table := by
  exact (cell_mem_table_iff _).2 rfl

/-- Lookup equality is equivalent to membership of the proposed cell. -/
theorem lookup_eq_iff_mem (state : State) (read : Symbol)
    (result : Transition) :
    transition state read = result ↔ ⟨state, read, result⟩ ∈ table := by
  constructor
  · intro h
    exact (cell_mem_table_iff _).2 h.symm
  · intro h
    exact ((cell_mem_table_iff _).1 h).symm

/-- Each state/symbol key has exactly one table result. -/
theorem lookup_unique (state : State) (read : Symbol) :
    ∃ result : Transition,
      ⟨state, read, result⟩ ∈ table ∧
      ∀ candidate : Transition,
        ⟨state, read, candidate⟩ ∈ table → candidate = result := by
  refine ⟨transition state read, lookup_complete state read, ?_⟩
  intro result hmem
  exact (cell_mem_table_iff _).1 hmem

/-- Any two table cells with the same input key have the same result. -/
theorem result_unique_of_mem
    {left right : Cell}
    (hleft : left ∈ table)
    (hright : right ∈ table)
    (hstate : left.state = right.state)
    (hread : left.read = right.read) :
    left.result = right.result := by
  rw [(cell_mem_table_iff left).1 hleft,
    (cell_mem_table_iff right).1 hright, hstate, hread]

/-- Exactly the two printed cells halt. -/
theorem transition_eq_halt_iff (state : State) (read : Symbol) :
    transition state read = .halt ↔
      (state = .C ∧ read = .s3) ∨ (state = .D ∧ read = .s3) := by
  cases state <;> cases read <;> decide

/-- The normalized blank is symbol number four. -/
theorem blank_is_four : blank = .s4 := rfl

/-- There are exactly two halting entries in the reflected table. -/
theorem halting_cell_count :
    (table.filter (fun cell => cell.result == .halt)).length = 2 := by
  decide

/-- There are exactly 22 nonhalting entries in the reflected table. -/
theorem running_cell_count :
    (table.filter (fun cell => cell.result != .halt)).length = 22 := by
  decide

end PureSFormal.Rogozhin46
