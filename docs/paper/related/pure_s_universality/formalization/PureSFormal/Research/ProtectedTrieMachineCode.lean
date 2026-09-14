import PureSFormal.Research.ProtectedTrieTableau

/-!
# Total literal codec for ordered-binary machine instances

The protected header carries one finite bitstring.  This module gives the
concrete self-delimiting serialization of the complete source instance and a
total executable parser.  The round-trip and injectivity theorems pin the
header interpretation without an external machine value.
-/

namespace PureSFormal.Research.ProtectedTrieMachineCode

open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieTableau

/-- Fixed two-bit direction code. -/
def encodeDirection : Direction -> BitWord
  | .left => [false, false]
  | .stay => [false, true]
  | .right => [true, false]

/-- Total prefix parser for the fixed direction code. -/
def decodeDirection? : BitWord -> Option (Direction × BitWord)
  | false :: false :: tail => some (.left, tail)
  | false :: true :: tail => some (.stay, tail)
  | true :: false :: tail => some (.right, tail)
  | _ => none

/-- Exact direction-prefix round trip. -/
theorem decodeDirection?_encodeDirection_append
    (direction : Direction) (tail : BitWord) :
    decodeDirection? (encodeDirection direction ++ tail) =
      some (direction, tail) := by
  cases direction <;> rfl

/-- Serialize one rule occurrence. -/
def encodeRule (rule : Rule) : BitWord :=
  rule.write :: encodeDirection rule.move ++ encodeNat rule.nextState

/-- Parse one rule occurrence and return the unused suffix. -/
def decodeRule? : BitWord -> Option (Rule × BitWord)
  | [] => none
  | write :: tail => do
      let (move, tail) <- decodeDirection? tail
      let (nextState, tail) <- decodeNat? tail
      pure (⟨write, move, nextState⟩, tail)

/-- Exact rule-prefix round trip. -/
theorem decodeRule?_encodeRule_append (rule : Rule) (tail : BitWord) :
    decodeRule? (encodeRule rule ++ tail) = some (rule, tail) := by
  cases rule with
  | mk write move nextState =>
      simp only [encodeRule, List.cons_append, decodeRule?]
      rw [List.append_assoc, decodeDirection?_encodeDirection_append]
      simp [decodeNat?_encodeNat_append]

/-- Serialize an optional ordered rule slot with one presence bit. -/
def encodeRuleOption : Option Rule -> BitWord
  | none => [false]
  | some rule => true :: encodeRule rule

/-- Parse one optional ordered rule slot. -/
def decodeRuleOption? : BitWord -> Option (Option Rule × BitWord)
  | [] => none
  | false :: tail => some (none, tail)
  | true :: tail => do
      let (rule, tail) <- decodeRule? tail
      pure (some rule, tail)

/-- Exact optional-rule-prefix round trip. -/
theorem decodeRuleOption?_encodeRuleOption_append
    (slot : Option Rule) (tail : BitWord) :
    decodeRuleOption? (encodeRuleOption slot ++ tail) = some (slot, tail) := by
  cases slot with
  | none => rfl
  | some rule =>
      simp only [encodeRuleOption, List.cons_append, decodeRuleOption?]
      rw [decodeRule?_encodeRule_append]
      rfl

/-- Serialize the two ordered slots of one state/symbol cell. -/
def encodeOrderedCell (cell : OrderedCell) : BitWord :=
  encodeRuleOption cell.slot0 ++ encodeRuleOption cell.slot1

/-- Parse one ordered two-slot cell. -/
def decodeOrderedCell? (payload : BitWord) : Option (OrderedCell × BitWord) := do
  let (slot0, tail) <- decodeRuleOption? payload
  let (slot1, tail) <- decodeRuleOption? tail
  pure (⟨slot0, slot1⟩, tail)

/-- Exact ordered-cell-prefix round trip. -/
theorem decodeOrderedCell?_encodeOrderedCell_append
    (cell : OrderedCell) (tail : BitWord) :
    decodeOrderedCell? (encodeOrderedCell cell ++ tail) = some (cell, tail) := by
  cases cell with
  | mk slot0 slot1 =>
      simp only [encodeOrderedCell, List.append_assoc, decodeOrderedCell?]
      rw [decodeRuleOption?_encodeRuleOption_append]
      simp [decodeRuleOption?_encodeRuleOption_append]

/-- Serialize the two physical-symbol cells of one finite control state. -/
def encodeStateRow (state : StateRow) : BitWord :=
  encodeOrderedCell state.onFalse ++ encodeOrderedCell state.onTrue

/-- Parse one finite control-state row. -/
def decodeStateRow? (payload : BitWord) : Option (StateRow × BitWord) := do
  let (onFalse, tail) <- decodeOrderedCell? payload
  let (onTrue, tail) <- decodeOrderedCell? tail
  pure (⟨onFalse, onTrue⟩, tail)

/-- Exact control-state-row-prefix round trip. -/
theorem decodeStateRow?_encodeStateRow_append
    (state : StateRow) (tail : BitWord) :
    decodeStateRow? (encodeStateRow state ++ tail) = some (state, tail) := by
  cases state with
  | mk onFalse onTrue =>
      simp only [encodeStateRow, List.append_assoc, decodeStateRow?]
      rw [decodeOrderedCell?_encodeOrderedCell_append]
      simp [decodeOrderedCell?_encodeOrderedCell_append]

/-- Concatenate a literal list of finite control-state rows. -/
def encodeStateData : List StateRow -> BitWord
  | [] => []
  | state :: states => encodeStateRow state ++ encodeStateData states

/-- Parse an explicit number of finite control-state rows. -/
def decodeStateRowsN? : Nat -> BitWord -> Option (List StateRow × BitWord)
  | 0, payload => some ([], payload)
  | count + 1, payload => do
      let (state, tail) <- decodeStateRow? payload
      let (states, tail) <- decodeStateRowsN? count tail
      pure (state :: states, tail)

/-- Exact state-list-prefix round trip. -/
theorem decodeStateRowsN?_encodeStateData_append
    (states : List StateRow) (tail : BitWord) :
    decodeStateRowsN? states.length (encodeStateData states ++ tail) =
      some (states, tail) := by
  induction states with
  | nil => rfl
  | cons state states ih =>
      simp only [List.length_cons, encodeStateData, List.append_assoc]
      unfold decodeStateRowsN?
      rw [decodeStateRow?_encodeStateRow_append]
      simp [ih]

/-- Self-delimiting serialization of a finite machine table. -/
def encodeMachine (machine : Machine) : BitWord :=
  encodeNat machine.states.length ++ encodeStateData machine.states

/-- Parse one finite machine table and return the unused suffix. -/
def decodeMachine? (payload : BitWord) : Option (Machine × BitWord) := do
  let (count, tail) <- decodeNat? payload
  let (states, tail) <- decodeStateRowsN? count tail
  pure (⟨states⟩, tail)

/-- Exact finite-machine-prefix round trip. -/
theorem decodeMachine?_encodeMachine_append
    (machine : Machine) (tail : BitWord) :
    decodeMachine? (encodeMachine machine ++ tail) = some (machine, tail) := by
  cases machine with
  | mk states =>
      simp only [encodeMachine, List.append_assoc, decodeMachine?]
      rw [decodeNat?_encodeNat_append]
      simp [decodeStateRowsN?_encodeStateData_append]

/-- Complete literal serialization of a source instance. -/
def encodeInstance (source : Instance) : BitWord :=
  encodeMachine source.machine ++ encodeNat source.initialState ++
    encodeBits source.input

/-- Prefix parser for a source instance.  Keeping the unused suffix explicit
makes exact-consumption and reconstruction properties transparent. -/
def decodeInstancePrefix? (payload : BitWord) : Option (Instance × BitWord) := do
  let (machine, tail) <- decodeMachine? payload
  let (initialState, tail) <- decodeNat? tail
  let (input, tail) <- decodeBits? tail
  pure (⟨machine, initialState, input⟩, tail)

/-- Total exact parser for a complete source-instance serialization.  The
final literal guard pins every accepted input to the canonical codec image. -/
def decodeInstance? (payload : BitWord) : Option Instance := do
  let (source, tail) <- decodeInstancePrefix? payload
  match tail with
  | [] =>
      if payload = encodeInstance source then some source else none
  | _ :: _ => none

/-- The prefix parser consumes exactly one encoded instance. -/
theorem decodeInstancePrefix?_encodeInstance_append
    (source : Instance) (tail : BitWord) :
    decodeInstancePrefix? (encodeInstance source ++ tail) =
      some (source, tail) := by
  cases source with
  | mk machine initialState input =>
      simp only [decodeInstancePrefix?, encodeInstance, List.append_assoc]
      rw [decodeMachine?_encodeMachine_append]
      simp [decodeNat?_encodeNat_append, decodeBits?_encodeBits_append]

/-- Every complete source instance parses back literally. -/
@[simp]
theorem decodeInstance?_encodeInstance (source : Instance) :
    decodeInstance? (encodeInstance source) = some source := by
  have hprefix := decodeInstancePrefix?_encodeInstance_append source []
  simp only [List.append_nil] at hprefix
  unfold decodeInstance?
  rw [hprefix]
  change (if encodeInstance source = encodeInstance source then
      some source else none) = some source
  exact if_pos rfl

/-- Every accepted complete source parse is the literal canonical encoding. -/
theorem decodeInstance?_some_implies_eq_encode
    {payload : BitWord} {source : Instance}
    (hdecode : decodeInstance? payload = some source) :
    payload = encodeInstance source := by
  unfold decodeInstance? at hdecode
  cases hprefix : decodeInstancePrefix? payload with
  | none => simp [hprefix] at hdecode
  | some parsedTail =>
      rcases parsedTail with ⟨parsed, tail⟩
      cases tail with
      | cons bit tail => simp [hprefix] at hdecode
      | nil =>
          by_cases hcanonical : payload = encodeInstance parsed
          · rw [hprefix] at hdecode
            change (if payload = encodeInstance parsed then
                some parsed else none) = some source at hdecode
            rw [if_pos hcanonical] at hdecode
            have hsource : parsed = source := Option.some.inj hdecode
            exact hcanonical.trans (congrArg encodeInstance hsource)
          · rw [hprefix] at hdecode
            change (if payload = encodeInstance parsed then
                some parsed else none) = some source at hdecode
            rw [if_neg hcanonical] at hdecode
            cases hdecode

/-- The complete finite source-instance encoding is injective. -/
theorem encodeInstance_injective {left right : Instance}
    (heq : encodeInstance left = encodeInstance right) : left = right := by
  have hdecoded := congrArg decodeInstance? heq
  simpa only [decodeInstance?_encodeInstance, Option.some.injEq] using hdecoded

end PureSFormal.Research.ProtectedTrieMachineCode
