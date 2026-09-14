import PureSFormal.Research.ProtectedTrieTableau

/-!
# Literal labels extracted from verified tableau payloads

The public extractor below obtains the final row from the decoded literal row
list itself.  It does not call `run?`, `buildTrace?`, or
`canonicalTableau?`.  Ordered enabled-slot and terminal flags are then checked
directly against that literal final row and the protected machine table.
-/

namespace PureSFormal.Research.ProtectedTrieTableauLabel

open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieTableau

/-- Last element of a literal finite row list, without a default value. -/
def lastRow? : List Row -> Option Row
  | [] => none
  | [row] => some row
  | _ :: rows => lastRow? rows

theorem lastRow?_isSome_of_ne_nil {rows : List Row} (hne : rows ≠ []) :
    (lastRow? rows).isSome = true := by
  induction rows with
  | nil => exact (hne rfl).elim
  | cons row rows ih =>
      cases rows with
      | nil => rfl
      | cons next rows =>
          simp only [lastRow?]
          exact ih (by simp)

/-- Literal Boolean test for one ordered occurrence slot. -/
def slotEnabledB (machine : Machine) (row : Row) (slot : Bool) : Bool :=
  (step? machine row slot).isSome

/-- A current-term label: literal final row and two ordered availability bits. -/
structure LiteralHistoryLabel where
  finalRow : Row
  slot0Enabled : Bool
  slot1Enabled : Bool
  terminal : Bool
  deriving DecidableEq, Repr

/-- Build a label from a supplied literal final row. -/
def labelOfRow (machine : Machine) (row : Row) : LiteralHistoryLabel :=
  let enabled0 := slotEnabledB machine row false
  let enabled1 := slotEnabledB machine row true
  { finalRow := row
    slot0Enabled := enabled0
    slot1Enabled := enabled1
    terminal := !enabled0 && !enabled1 }

/--
Total label extractor.  The only candidate row is the last row of the parsed
payload that passed the public literal verifier.
-/
def verifyLabel? (source : Instance) (history payload : BitWord) :
    Option LiteralHistoryLabel :=
  match decodeTableau? payload with
  | none => none
  | some rows =>
      if payload == encodeTableau rows && verifyRows source history rows then
        (lastRow? rows).map (labelOfRow source.machine)
      else none

/-- A verified row list is nonempty. -/
theorem verifyRows_true_ne_nil {source : Instance} {history : BitWord}
    {rows : List Row} (hverify : verifyRows source history rows = true) :
    rows ≠ [] := by
  intro hnil
  subst rows
  simp [verifyRows] at hverify

/-- The label extractor succeeds exactly when the public verifier accepts. -/
@[simp]
theorem verifyLabel?_isSome (source : Instance) (history payload : BitWord) :
    (verifyLabel? source history payload).isSome =
      verify source history payload := by
  unfold verifyLabel? verify
  cases hdecode : decodeTableau? payload with
  | none => rfl
  | some rows =>
      cases hguard : (payload == encodeTableau rows &&
          verifyRows source history rows)
      · simp [hguard]
      · simp only [hguard, ↓reduceIte]
        have hparts : (payload == encodeTableau rows) = true /\
            verifyRows source history rows = true :=
          (Bool.and_eq_true _ _).mp hguard
        have hsome := lastRow?_isSome_of_ne_nil
          (verifyRows_true_ne_nil hparts.2)
        cases hlast : lastRow? rows with
        | none => simp [hlast] at hsome
        | some finalRow => rfl

/-- Any returned label entails literal-tableau acceptance. -/
theorem verifyLabel?_some_implies_verify
    {source : Instance} {history payload : BitWord}
    {label : LiteralHistoryLabel}
    (hlabel : verifyLabel? source history payload = some label) :
    verify source history payload = true := by
  have hisSome := congrArg Option.isSome hlabel
  simpa using (verifyLabel?_isSome source history payload).symm.trans hisSome

/-- The returned final row is literally the last row of the parsed payload. -/
theorem verifyLabel?_some_literal_final
    {source : Instance} {history payload : BitWord}
    {label : LiteralHistoryLabel}
    (hlabel : verifyLabel? source history payload = some label) :
    exists rows finalRow,
      decodeTableau? payload = some rows /\
      verifyRows source history rows = true /\
      lastRow? rows = some finalRow /\
      label = labelOfRow source.machine finalRow := by
  unfold verifyLabel? at hlabel
  cases hdecode : decodeTableau? payload with
  | none => simp [hdecode] at hlabel
  | some rows =>
      cases hguard : (payload == encodeTableau rows &&
          verifyRows source history rows)
      · simp [hdecode, hguard] at hlabel
      · simp only [hdecode, hguard, ↓reduceIte] at hlabel
        cases hlast : lastRow? rows with
        | none => simp [hlast] at hlabel
        | some finalRow =>
            simp [hlast] at hlabel
            have hparts := (Bool.and_eq_true _ _).mp hguard
            exact ⟨rows, finalRow, rfl, hparts.2, hlast, hlabel.symm⟩

/-- Accepted payloads have one and only one literal label. -/
theorem verifyLabel?_unique
    {source : Instance} {history payload : BitWord}
    {left right : LiteralHistoryLabel}
    (hleft : verifyLabel? source history payload = some left)
    (hright : verifyLabel? source history payload = some right) :
    left = right := by
  rw [hleft] at hright
  exact Option.some.inj hright

/-- Slot availability in a returned label is exactly the source one-step test. -/
theorem verifyLabel?_slot0
    {source : Instance} {history payload : BitWord}
    {label : LiteralHistoryLabel}
    (hlabel : verifyLabel? source history payload = some label) :
    label.slot0Enabled =
      (step? source.machine label.finalRow false).isSome := by
  obtain ⟨rows, finalRow, hdecode, hverify, hlast, heq⟩ :=
    verifyLabel?_some_literal_final hlabel
  rw [heq]
  rfl

/-- Slot availability in a returned label is exactly the source one-step test. -/
theorem verifyLabel?_slot1
    {source : Instance} {history payload : BitWord}
    {label : LiteralHistoryLabel}
    (hlabel : verifyLabel? source history payload = some label) :
    label.slot1Enabled =
      (step? source.machine label.finalRow true).isSome := by
  obtain ⟨rows, finalRow, hdecode, hverify, hlast, heq⟩ :=
    verifyLabel?_some_literal_final hlabel
  rw [heq]
  rfl

/-- The literal terminal flag is equivalent to rejection of both slots. -/
theorem verifyLabel?_terminal_iff
    {source : Instance} {history payload : BitWord}
    {label : LiteralHistoryLabel}
    (hlabel : verifyLabel? source history payload = some label) :
    label.terminal = true <-> Terminal source.machine label.finalRow := by
  obtain ⟨rows, finalRow, hdecode, hverify, hlast, heq⟩ :=
    verifyLabel?_some_literal_final hlabel
  rw [heq]
  unfold labelOfRow slotEnabledB Terminal
  simp only [Bool.and_eq_true, Bool.not_eq_true]
  constructor
  · rintro ⟨hzero, hone⟩
    constructor
    · cases hstep : step? source.machine _ false with
      | none => rfl
      | some row => simp [hstep] at hzero
    · cases hstep : step? source.machine _ true with
      | none => rfl
      | some row => simp [hstep] at hone
  · rintro ⟨hzero, hone⟩
    simp [hzero, hone]

/-- Equal successor rows in the two slots still yield two enabled labels and
two different ordered occurrence histories. -/
theorem verifyLabel?_equal_slots_preserve_multiplicity
    {source : Instance} {history payload : BitWord}
    {label : LiteralHistoryLabel} {successor : Row}
    (hlabel : verifyLabel? source history payload = some label)
    (hzero : step? source.machine label.finalRow false = some successor)
    (hone : step? source.machine label.finalRow true = some successor) :
    label.slot0Enabled = true /\ label.slot1Enabled = true /\
      history ++ [false] ≠ history ++ [true] := by
  rw [verifyLabel?_slot0 hlabel, verifyLabel?_slot1 hlabel]
  simp [hzero, hone, ordered_singleton_ne]

end PureSFormal.Research.ProtectedTrieTableauLabel
