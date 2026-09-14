import PureSFormal.Research.ProtectedTrieMachine

/-!
# Finite ordered branching as binary first-return choices

This module gives the complete local compiler used to refine one finite
ordered transition-occurrence list into binary choices.  Occurrence `k` has
the prefix-free code `1^k 0`: every `1` is an administrative continuation and
the final `0` returns the literal `k`th rule.  The proofs retain list order,
retain duplicate rule occurrences, reject every proper selector prefix, and
give an executable round trip for complete macro-history lists.

Installation of these selector nodes into a single flat natural-numbered
`ProtectedTrieMachine.Machine` table additionally requires a proved finite
state-allocation/relocation layer.  No such layer is postulated here.
-/

namespace PureSFormal.Research.FiniteBranchBinaryCompiler

open PureSFormal.Research.ProtectedTrieMachine

/-- Explicit injectivity predicate; kept local to avoid any library-level
choice or set interface. -/
def IsInjective {alpha beta : Type} (f : alpha -> beta) : Prop :=
  forall {left right}, f left = f right -> left = right

/-- A general source cell is a finite ordered occurrence list. -/
abbrev FiniteCell := List Rule

/-- The two finite occurrence lists of one source control state. -/
structure FiniteStateRow where
  onFalse : FiniteCell
  onTrue : FiniteCell
  deriving DecidableEq, Repr

/-- A finite-list-branching source table. -/
structure FiniteMachine where
  states : List FiniteStateRow
  deriving DecidableEq, Repr

/-- A finite-list source together with its conventional initialization. -/
structure FiniteInstance where
  machine : FiniteMachine
  initialState : Nat
  input : List Bool
  deriving DecidableEq, Repr

/-- Select one physical-symbol occurrence list. -/
def finiteCell (row : FiniteStateRow) (symbol : Bool) : FiniteCell :=
  if symbol then row.onTrue else row.onFalse

/-- Literal ordered occurrence lookup. -/
def finiteRuleAt? (machine : FiniteMachine) (state : Nat)
    (symbol : Bool) (occurrenceIndex : Nat) : Option Rule := do
  let row <- machine.states[state]?
  (finiteCell row symbol)[occurrenceIndex]?

/-- Direct one-step source semantics for one supplied occurrence index. -/
def finiteStep? (machine : FiniteMachine) (row : Row)
    (occurrenceIndex : Nat) : Option Row := do
  let symbol <- scanned? row
  let rule <- finiteRuleAt? machine row.state symbol occurrenceIndex
  applyRule? row rule

/-- Prefix-free binary selector code `1^index 0`. -/
def occurrenceCode (index : Nat) : List Bool :=
  List.replicate index true ++ [false]

/-- Interpret one complete first-return code against an ordered list.
Returning a rule consumes the final `0`; an exhausted or trailing bitstring
is rejected. -/
def selectOccurrence? {alpha : Type} : List alpha -> List Bool -> Option alpha
  | [], _ => none
  | head :: _, [false] => some head
  | _ :: tail, true :: bits => selectOccurrence? tail bits
  | _, _ => none

/-- The binary code returns exactly the indexed occurrence. -/
theorem selectOccurrence?_occurrenceCode {alpha : Type}
    (occurrences : List alpha) (index : Nat) :
    selectOccurrence? occurrences (occurrenceCode index) =
      occurrences[index]? := by
  induction occurrences generalizing index with
  | nil => simp [selectOccurrence?]
  | cons head tail ih =>
      cases index with
      | zero => rfl
      | succ index =>
          simp only [occurrenceCode, List.replicate_succ,
            List.cons_append, selectOccurrence?, List.getElem?_cons_succ]
          exact ih index

/-- A source occurrence and its compiled binary code have exactly the same
rule result. -/
theorem finiteRuleAt?_via_binary
    (machine : FiniteMachine) (state : Nat) (symbol : Bool) (index : Nat) :
    (do
      let row <- machine.states[state]?
      selectOccurrence? (finiteCell row symbol) (occurrenceCode index)) =
      finiteRuleAt? machine state symbol index := by
  unfold finiteRuleAt?
  cases hrow : machine.states[state]? with
  | none => rfl
  | some row => exact selectOccurrence?_occurrenceCode (finiteCell row symbol) index

/-- Binary refinement preserves the exact tape update and successor row. -/
theorem finiteStep?_via_binary
    (machine : FiniteMachine) (row : Row) (index : Nat) :
    (do
      let symbol <- scanned? row
      let sourceRow <- machine.states[row.state]?
      let rule <- selectOccurrence? (finiteCell sourceRow symbol)
        (occurrenceCode index)
      applyRule? row rule) =
      finiteStep? machine row index := by
  unfold finiteStep?
  cases hsymbol : scanned? row with
  | none => rfl
  | some symbol =>
      change (do
        let sourceRow <- machine.states[row.state]?
        let rule <- selectOccurrence? (finiteCell sourceRow symbol)
          (occurrenceCode index)
        applyRule? row rule) =
          (finiteRuleAt? machine row.state symbol index).bind (applyRule? row)
      unfold finiteRuleAt?
      cases hstate : machine.states[row.state]? with
      | none => rfl
      | some sourceRow =>
          change (selectOccurrence? (finiteCell sourceRow symbol)
            (occurrenceCode index)).bind (applyRule? row) =
              ((finiteCell sourceRow symbol)[index]?).bind (applyRule? row)
          rw [selectOccurrence?_occurrenceCode]

/-- The code length exposes its occurrence index exactly. -/
theorem occurrenceCode_length (index : Nat) :
    (occurrenceCode index).length = index + 1 := by
  simp [occurrenceCode]

/-- Different ordered occurrence indices remain different binary histories. -/
theorem occurrenceCode_injective : IsInjective occurrenceCode := by
  intro left right heq
  have hlength := congrArg List.length heq
  simp only [occurrenceCode_length, Nat.add_right_cancel_iff] at hlength
  exact hlength

/-- A code contains exactly one terminating zero, at its last position. -/
theorem occurrenceCode_eq_replicate_append (index : Nat) :
    occurrenceCode index = List.replicate index true ++ [false] :=
  rfl

/-- Count leading administrative `1` bits until the first return `0`. -/
def decodeOccurrencePrefix? : List Bool -> Option (Nat × List Bool)
  | [] => none
  | false :: tail => some (0, tail)
  | true :: tail => do
      let (index, rest) <- decodeOccurrencePrefix? tail
      pure (index + 1, rest)

/-- Exact prefix decoding of one occurrence code in front of any suffix. -/
theorem decodeOccurrencePrefix?_occurrenceCode_append
    (index : Nat) (suffix : List Bool) :
    decodeOccurrencePrefix? (occurrenceCode index ++ suffix) =
      some (index, suffix) := by
  induction index with
  | zero => rfl
  | succ index ih =>
      simp only [occurrenceCode, List.replicate_succ, List.cons_append,
        decodeOccurrencePrefix?]
      rw [show List.replicate index true ++ [false] ++ suffix =
          occurrenceCode index ++ suffix by rfl, ih]
      rfl

/-- Encode a finite sequence of source occurrence indices. -/
def encodeOccurrenceHistory : List Nat -> List Bool
  | [] => []
  | index :: history => occurrenceCode index ++ encodeOccurrenceHistory history

/-- Structurally decode unary first-return codes, accumulating the current
leading-`1` count.  Empty input is accepted only at a code boundary. -/
def decodeOccurrenceHistoryAux : Nat -> List Bool -> Option (List Nat)
  | count, [] => if count = 0 then some [] else none
  | count, false :: tail => do
      let history <- decodeOccurrenceHistoryAux 0 tail
      pure (count :: history)
  | count, true :: tail => decodeOccurrenceHistoryAux (count + 1) tail

/-- Decode a complete concatenation of first-return codes. -/
def decodeOccurrenceHistory? (bits : List Bool) : Option (List Nat) :=
  decodeOccurrenceHistoryAux 0 bits

/-- A run of `index` administrative bits adds exactly `index` to the current
occurrence counter before the return bit. -/
theorem decodeOccurrenceHistoryAux_replicate
    (count index : Nat) (suffix : List Bool) :
    decodeOccurrenceHistoryAux count
        (List.replicate index true ++ false :: suffix) =
      (decodeOccurrenceHistoryAux 0 suffix).map
        (fun history => (count + index) :: history) := by
  induction index generalizing count with
  | zero =>
      change (decodeOccurrenceHistoryAux 0 suffix).bind
          (fun history => some (count :: history)) =
        (decodeOccurrenceHistoryAux 0 suffix).map (fun history => count :: history)
      cases decodeOccurrenceHistoryAux 0 suffix <;> rfl
  | succ index ih =>
      simp only [List.replicate_succ, List.cons_append,
        decodeOccurrenceHistoryAux]
      rw [ih (count + 1)]
      exact congrArg (fun total => (decodeOccurrenceHistoryAux 0 suffix).map
        (fun history => total :: history))
          (by rw [Nat.add_assoc, Nat.add_comm 1 index])

/-- Complete finite macro histories round-trip exactly. -/
theorem decodeOccurrenceHistory?_encodeOccurrenceHistory
    (history : List Nat) :
    decodeOccurrenceHistory? (encodeOccurrenceHistory history) =
      some history := by
  induction history with
  | nil => simp [decodeOccurrenceHistory?, decodeOccurrenceHistoryAux,
      encodeOccurrenceHistory]
  | cons index history ih =>
      unfold encodeOccurrenceHistory decodeOccurrenceHistory?
      rw [show occurrenceCode index ++ encodeOccurrenceHistory history =
          List.replicate index true ++ false :: encodeOccurrenceHistory history by
            simp [occurrenceCode],
        decodeOccurrenceHistoryAux_replicate]
      change (decodeOccurrenceHistory? (encodeOccurrenceHistory history)).map
          (fun rest => (0 + index) :: rest) = some (index :: history)
      rw [ih]
      change some ((0 + index) :: history) = some (index :: history)
      rw [Nat.zero_add]

/-- The complete macro-history encoder is injective. -/
theorem encodeOccurrenceHistory_injective :
    IsInjective encodeOccurrenceHistory := by
  intro left right heq
  have hdecode := congrArg decodeOccurrenceHistory? heq
  simpa only [decodeOccurrenceHistory?_encodeOccurrenceHistory,
    Option.some.injEq] using hdecode

/-- A proper all-`1` selector prefix never returns a source occurrence. -/
theorem selectOccurrence?_administrative_prefix {alpha : Type}
    (occurrences : List alpha) (count : Nat) :
    selectOccurrence? occurrences (List.replicate count true) = none := by
  induction occurrences generalizing count with
  | nil => simp [selectOccurrence?]
  | cons head tail ih =>
      cases count with
      | zero => rfl
      | succ count =>
          simp [List.replicate_succ, selectOccurrence?, ih]

/-- An empty source cell has no accepted binary occurrence code. -/
theorem emptyCell_rejects (bits : List Bool) :
    selectOccurrence? ([] : List Rule) bits = none :=
  rfl

/-- A nonempty source cell has at least its ordered first occurrence. -/
theorem nonemptyCell_accepts_head (head : Rule) (tail : List Rule) :
    selectOccurrence? (head :: tail) (occurrenceCode 0) = some head :=
  rfl

/-- Source terminality at one physical symbol is preserved and reflected by
absence of every accepted binary first-return code. -/
theorem cell_empty_iff_no_binary_choice (cell : FiniteCell) :
    cell = [] <->
      forall index rule,
        selectOccurrence? cell (occurrenceCode index) = some rule -> False := by
  constructor
  · intro hempty index rule hselect
    subst cell
    simp [selectOccurrence?] at hselect
  · intro hnone
    cases cell with
    | nil => rfl
    | cons head tail =>
        exact False.elim (hnone 0 head rfl)

/-- Equal rule texts at two list positions retain distinct occurrence codes. -/
theorem equal_rules_preserve_multiplicity
    (cell : FiniteCell) (left right : Nat) (rule : Rule)
    (hleft : cell[left]? = some rule)
    (hright : cell[right]? = some rule)
    (hne : left ≠ right) :
    selectOccurrence? cell (occurrenceCode left) = some rule /\
    selectOccurrence? cell (occurrenceCode right) = some rule /\
    occurrenceCode left ≠ occurrenceCode right := by
  rw [selectOccurrence?_occurrenceCode, hleft,
    selectOccurrence?_occurrenceCode, hright]
  exact ⟨rfl, rfl, fun heq => hne (occurrenceCode_injective heq)⟩

/-- The local binary refinement certificate: exact indexed selection,
prefix-free occurrence identity, administrative non-return, terminality, and
finite macro-history round trip. -/
structure BinaryFirstReturnCertificate : Prop where
  exactSelection : forall (cell : FiniteCell) (index : Nat),
    selectOccurrence? cell (occurrenceCode index) = cell[index]?
  occurrenceIdentity : IsInjective occurrenceCode
  administrativeNoReturn : forall (cell : FiniteCell) (count : Nat),
    selectOccurrence? cell (List.replicate count true) = none
  terminality : forall cell : FiniteCell,
    cell = [] <-> forall index rule,
      selectOccurrence? cell (occurrenceCode index) = some rule -> False
  historyRoundTrip : forall history : List Nat,
    decodeOccurrenceHistory? (encodeOccurrenceHistory history) = some history

/-- Every finite ordered occurrence list satisfies the exact binary
first-return contract. -/
theorem finiteBranchBinaryFirstReturn : BinaryFirstReturnCertificate :=
  { exactSelection := selectOccurrence?_occurrenceCode
    occurrenceIdentity := occurrenceCode_injective
    administrativeNoReturn := selectOccurrence?_administrative_prefix
    terminality := cell_empty_iff_no_binary_choice
    historyRoundTrip := decodeOccurrenceHistory?_encodeOccurrenceHistory }

end PureSFormal.Research.FiniteBranchBinaryCompiler
