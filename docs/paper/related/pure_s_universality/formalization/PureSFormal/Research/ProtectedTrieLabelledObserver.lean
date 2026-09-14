import PureSFormal.Research.ProtectedTrieStrong
import PureSFormal.Research.ProtectedTrieTableauLabel

/-!
# Total labelled current-term observer

The observer enumerates only literal opened certificate addresses.  Every
returned final row is extracted from the final row of the decoded payload
that passed the local verifier.  The decoder never invokes `run?`,
`buildTrace?`, or `canonicalTableau?`.
-/

namespace PureSFormal.Research.ProtectedTrieLabelledObserver

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieParser
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieTableau
open PureSFormal.Research.ProtectedTrieTableauLabel

/-! ## Clean structural enumeration bounds -/

theorem term_size_app_left_lt (fn arg : Term) :
    fn.size < (Term.app fn arg).size := by
  simp only [Term.size]
  exact Nat.lt_succ_of_le (Nat.le_add_right _ _)

theorem term_size_app_right_lt (fn arg : Term) :
    arg.size < (Term.app fn arg).size := by
  simp only [Term.size]
  exact Nat.lt_succ_of_le (Nat.le_add_left _ _)

theorem openedAt_path_length_lt_size {term : Term} {path : BitWord}
    (hopened : OpenedAt term path) : path.length < term.size := by
  induction hopened with
  | here left right junk =>
      simp [protectedNode, passive]
  | @downLeft left right junk path hopened ih =>
      simp only [List.length_cons]
      calc
        path.length + 1 < left.size + 1 := Nat.add_lt_add_right ih 1
        _ <= (protectedNode left right junk).size :=
          Nat.succ_le_of_lt (Nat.lt_trans
            (term_size_app_right_lt Term.s left)
            (term_size_app_left_lt (Term.app Term.s left)
              (passive right junk)))
  | @downRight left right junk path hopened ih =>
      simp only [List.length_cons]
      calc
        path.length + 1 < right.size + 1 := Nat.add_lt_add_right ih 1
        _ <= (protectedNode left right junk).size := by
          exact Nat.succ_le_of_lt (Nat.lt_trans
            (Nat.lt_trans
              (term_size_app_right_lt Term.s right)
              (term_size_app_left_lt (Term.app Term.s right) junk))
            (term_size_app_right_lt (Term.app Term.s left)
              (passive right junk)))

theorem mem_openedPaths_length_lt {term : Term} {path : BitWord}
    (hmem : List.Mem path (openedPaths term)) : path.length < term.size :=
  openedAt_path_length_lt_size
    ((mem_openedPaths_iff_openedAt term path).mp hmem)

theorem openedPaths_length_le_size (term : Term) :
    (openedPaths term).length <= term.size := by
  induction term using openedPaths.induct with
  | case1 left right junk ihLeft ihRight =>
      change (openedPaths (protectedNode left right junk)).length <=
        (protectedNode left right junk).size
      rw [openedPaths_protectedNode]
      simp only [List.length_cons, List.length_append, List.length_map]
      have hchildren :
          (openedPaths left).length + (openedPaths right).length <=
            left.size + right.size := Nat.add_le_add ihLeft ihRight
      have hchildren' := Nat.add_le_add_right hchildren 1
      have hleftEmbed : left.size <= (Term.app Term.s left).size :=
        Nat.le_of_lt (term_size_app_right_lt Term.s left)
      have hrightEmbed : right.size <= (passive right junk).size :=
        Nat.le_of_lt (Nat.lt_trans
          (term_size_app_right_lt Term.s right)
          (term_size_app_left_lt (Term.app Term.s right) junk))
      have hembed := Nat.succ_le_succ
        (Nat.add_le_add hleftEmbed hrightEmbed)
      calc
        (openedPaths left).length + 1 + (openedPaths right).length =
            ((openedPaths left).length +
              (openedPaths right).length) + 1 := by
              simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        _ <= (left.size + right.size) + 1 := hchildren'
        _ <= (protectedNode left right junk).size := by
          simpa [protectedNode, passive, Nat.add_assoc] using hembed
  | case2 term hnotProtected =>
      cases hpaths : openedPaths term with
      | nil => simp [hpaths]
      | cons path paths =>
          have hopen : OpenedAt term path :=
            (mem_openedPaths_iff_openedAt term path).mp (by
              rw [hpaths]
              exact List.Mem.head paths)
          cases hopen with
          | here left right junk =>
              exact False.elim (hnotProtected left right junk rfl)
          | downLeft right junk hopen =>
              exact False.elim (hnotProtected _ right junk rfl)
          | downRight left junk hopen =>
              exact False.elim (hnotProtected left _ junk rfl)

theorem anchoredOpenedPaths_length_le_size (term : Term) :
    (anchoredOpenedPaths term).length <= term.size := by
  unfold anchoredOpenedPaths
  cases hparse : parseHeader? term with
  | none => simp
  | some view =>
      have hterm := parseHeader?_sound hparse
      rw [hterm]
      have hbody := openedPaths_length_le_size view.body
      exact Nat.le_trans hbody (Nat.le_of_lt
        (term_size_app_right_lt (Term.app Term.s view.seed) view.body))

theorem mem_anchoredOpenedPaths_length_lt_size
    {term : Term} {path : BitWord}
    (hmem : List.Mem path (anchoredOpenedPaths term)) :
    path.length < term.size := by
  unfold anchoredOpenedPaths at hmem
  cases hparse : parseHeader? term with
  | none =>
      simp only [hparse] at hmem
      cases hmem
  | some view =>
      simp only [hparse] at hmem
      have hterm := parseHeader?_sound hparse
      have hpath := mem_openedPaths_length_lt hmem
      rw [hterm]
      exact Nat.lt_trans hpath
        (term_size_app_right_lt (Term.app Term.s view.seed) view.body)

/-- One accepted literal certificate and its payload-derived machine label. -/
structure LabelledHistory where
  history : BitWord
  payload : BitWord
  label : LiteralHistoryLabel
  deriving DecidableEq, Repr

/-- Collect labels from a finite list of literal opened trie addresses. -/
def collectLabels (source : Instance) : List BitWord -> List LabelledHistory
  | [] => []
  | path :: paths =>
      let rest := collectLabels source paths
      match parseCandidate? path with
      | none => rest
      | some pair =>
          match verifyLabel? source pair.1 pair.2 with
          | none => rest
          | some label => ⟨pair.1, pair.2, label⟩ :: rest

/-- Fixed total labelled decoder on an arbitrary current pure-`S` term. -/
def labelledProjection (term : Term) : List LabelledHistory :=
  match headerBits? term with
  | none => []
  | some bits =>
      match decodeInstance? bits with
      | none => []
      | some source => collectLabels source (anchoredOpenedPaths term)

/-- Semantic history erasure, closed under all literal history prefixes. -/
def labelledHistoryIdeal (term : Term) : HistoryIdeal :=
  idealOf ((labelledProjection term).map LabelledHistory.history)

/-- No candidate is labelled when its source word fails to decode. -/
theorem verifiedHistories_sourceVerifier_none
    (bits : BitWord) (paths : List BitWord)
    (hdecode : decodeInstance? bits = none) :
    verifiedHistories sourceVerifier bits paths = [] := by
  induction paths with
  | nil => rfl
  | cons path paths ih =>
      cases hparse : parseCandidate? path with
      | none => simpa [verifiedHistories, hparse] using ih
      | some pair =>
          rcases pair with ⟨history, payload⟩
          simp [verifiedHistories, hparse, sourceVerifier, hdecode, ih]

/-- Label collection erases exactly to the public verified-history list. -/
theorem map_collectLabels_history
    (source : Instance) (paths : List BitWord) :
    (collectLabels source paths).map LabelledHistory.history =
      verifiedHistories sourceVerifier (encodeInstance source) paths := by
  induction paths with
  | nil => rfl
  | cons path paths ih =>
      cases hparse : parseCandidate? path with
      | none => simpa [collectLabels, verifiedHistories, hparse] using ih
      | some pair =>
          rcases pair with ⟨history, payload⟩
          cases hlabel : verifyLabel? source history payload with
          | none =>
              have hisSome : verify source history payload = false := by
                have h := verifyLabel?_isSome source history payload
                rw [hlabel] at h
                simpa using h.symm
              simp [collectLabels, verifiedHistories, hparse, hlabel,
                sourceVerifier_encoded, hisSome, ih]
          | some label =>
              have hverify : verify source history payload = true :=
                verifyLabel?_some_implies_verify hlabel
              simp [collectLabels, verifiedHistories, hparse, hlabel,
                sourceVerifier_encoded, hverify, ih]

/-- Erasing literal labels gives exactly the public list of verified histories. -/
theorem map_labelledProjection_history (term : Term) :
    (labelledProjection term).map LabelledHistory.history =
      projectedGenerators sourceVerifier term := by
  unfold labelledProjection projectedGenerators
  cases hbits : headerBits? term with
  | none => rfl
  | some bits =>
      cases hdecode : decodeInstance? bits with
      | none =>
          simpa only [hdecode] using!
            (verifiedHistories_sourceVerifier_none bits
              (anchoredOpenedPaths term) hdecode).symm
      | some source =>
          have hcanonical : bits = encodeInstance source :=
            decodeInstance?_some_implies_eq_encode hdecode
          rw [hcanonical]
          simpa only [decodeInstance?_encodeInstance] using
            map_collectLabels_history source (anchoredOpenedPaths term)

/-- Erasing literal labels recovers the exact history-only public projection. -/
theorem labelledHistoryIdeal_eq (term : Term) :
    labelledHistoryIdeal term = strongProjection term := by
  unfold labelledHistoryIdeal strongProjection projection
  rw [map_labelledProjection_history]

/-- Semantic erasure, independent of duplicate/order representation. -/
theorem labelledHistoryIdeal_equivalent (term : Term) :
    (labelledHistoryIdeal term).Equivalent (strongProjection term) := by
  rw [labelledHistoryIdeal_eq]
  intro history
  exact Iff.rfl

/-- Every emitted label is anchored at one literal accepted candidate path. -/
theorem mem_collectLabels
    (source : Instance) (paths : List BitWord) (entry : LabelledHistory)
    (hmem : List.Mem entry (collectLabels source paths)) :
      List.Mem (a entry.history entry.payload) paths /\
      verifyLabel? source entry.history entry.payload = some entry.label := by
  induction paths with
  | nil => cases hmem
  | cons path paths ih =>
      cases hparse : parseCandidate? path with
      | none =>
          simp only [collectLabels, hparse] at hmem
          have htail := ih hmem
          exact ⟨List.Mem.tail path htail.1, htail.2⟩
      | some pair =>
          rcases pair with ⟨history, payload⟩
          cases hlabel : verifyLabel? source history payload with
          | none =>
              simp only [collectLabels, hparse, hlabel] at hmem
              have htail := ih hmem
              exact ⟨List.Mem.tail path htail.1, htail.2⟩
          | some label =>
              simp only [collectLabels, hparse, hlabel, List.mem_cons] at hmem
              cases hmem with
              | head =>
                have hpath := parseCandidate?_sound hparse
                constructor
                · rw [hpath]
                  exact List.Mem.head _
                · exact hlabel
              | tail _ htail =>
                have hrest := ih htail
                exact ⟨List.Mem.tail path hrest.1, hrest.2⟩

/-- Every returned row is the literal final row of its decoded accepted payload. -/
theorem labelledProjection_literal_final
    {term : Term} {entry : LabelledHistory}
    (hmem : List.Mem entry (labelledProjection term)) :
    exists bits source rows finalRow,
      headerBits? term = some bits /\
      decodeInstance? bits = some source /\
      decodeTableau? entry.payload = some rows /\
      verifyRows source entry.history rows = true /\
      lastRow? rows = some finalRow /\
      entry.label = labelOfRow source.machine finalRow := by
  unfold labelledProjection at hmem
  cases hbits : headerBits? term with
  | none =>
      simp only [hbits] at hmem
      cases hmem
  | some bits =>
      cases hdecode : decodeInstance? bits with
      | none =>
          simp only [hbits, hdecode] at hmem
          cases hmem
      | some source =>
          simp only [hbits, hdecode] at hmem
          have hentry := mem_collectLabels source
            (anchoredOpenedPaths term) entry hmem
          obtain ⟨rows, finalRow, hrows, hverify, hlast, hlabel⟩ :=
            verifyLabel?_some_literal_final hentry.2
          exact ⟨bits, source, rows, finalRow, rfl, hdecode,
            hrows, hverify, hlast, hlabel⟩

/-- Returned labels are functional for each literal history/payload pair. -/
theorem labelledProjection_label_unique
    {term : Term} {left right : LabelledHistory}
    (hleft : List.Mem left (labelledProjection term))
    (hright : List.Mem right (labelledProjection term))
    (hhistory : left.history = right.history)
    (hpayload : left.payload = right.payload) : left.label = right.label := by
  unfold labelledProjection at hleft hright
  cases hbits : headerBits? term with
  | none =>
      simp only [hbits] at hleft
      cases hleft
  | some bits =>
      cases hdecode : decodeInstance? bits with
      | none =>
          simp only [hbits, hdecode] at hleft
          cases hleft
      | some source =>
          simp only [hbits, hdecode] at hleft hright
          have hl := mem_collectLabels source
            (anchoredOpenedPaths term) left hleft
          have hr := mem_collectLabels source
            (anchoredOpenedPaths term) right hright
          rw [hhistory, hpayload] at hl
          exact Option.some.inj (hl.2.symm.trans hr.2)

/-- A fixed current term cannot emit two different canonical payloads or
labels for the same accepted history.  This strengthens record-level
functionality from a history/payload pair to the history itself. -/
theorem labelledProjection_history_unique
    {term : Term} {left right : LabelledHistory}
    (hleft : List.Mem left (labelledProjection term))
    (hright : List.Mem right (labelledProjection term))
    (hhistory : left.history = right.history) :
      left.payload = right.payload /\ left.label = right.label := by
  unfold labelledProjection at hleft hright
  cases hbits : headerBits? term with
  | none =>
      simp only [hbits] at hleft
      cases hleft
  | some bits =>
      cases hdecode : decodeInstance? bits with
      | none =>
          simp only [hbits, hdecode] at hleft
          cases hleft
      | some source =>
          simp only [hbits, hdecode] at hleft hright
          have hl := mem_collectLabels source
            (anchoredOpenedPaths term) left hleft
          have hr := mem_collectLabels source
            (anchoredOpenedPaths term) right hright
          have hvl := verifyLabel?_some_implies_verify hl.2
          have hvr := verifyLabel?_some_implies_verify hr.2
          have hhistory' : right.history = left.history := hhistory.symm
          rw [hhistory'] at hvr
          have hpayload : left.payload = right.payload :=
            verify_witness_unique hvl hvr
          have hrlabel := hr.2
          rw [hhistory', ← hpayload] at hrlabel
          exact ⟨hpayload, verifyLabel?_unique hl.2 hrlabel⟩

/-- Ordered availability and terminality are read from the emitted literal row. -/
theorem labelledProjection_slot_and_terminal
    {term : Term} {entry : LabelledHistory}
    (hmem : List.Mem entry (labelledProjection term)) :
    exists source : Instance,
      entry.label.slot0Enabled =
          (step? source.machine entry.label.finalRow false).isSome /\
      entry.label.slot1Enabled =
          (step? source.machine entry.label.finalRow true).isSome /\
      (entry.label.terminal = true <->
        Terminal source.machine entry.label.finalRow) := by
  unfold labelledProjection at hmem
  cases hbits : headerBits? term with
  | none =>
      simp only [hbits] at hmem
      cases hmem
  | some bits =>
      cases hdecode : decodeInstance? bits with
      | none =>
          simp only [hbits, hdecode] at hmem
          cases hmem
      | some source =>
          simp only [hbits, hdecode] at hmem
          have hentry := mem_collectLabels source
            (anchoredOpenedPaths term) entry hmem
          exact ⟨source,
            verifyLabel?_slot0 hentry.2,
            verifyLabel?_slot1 hentry.2,
            verifyLabel?_terminal_iff hentry.2⟩

/-- On the encoder cone, the literal final row is verified against the one
frozen source instance named by the encoder. -/
theorem labelledProjection_literal_final_on_cone
    (source : Instance) {term : Term} {entry : LabelledHistory}
    (hreach : Steps (strongEncoder source) term)
    (hmem : List.Mem entry (labelledProjection term)) :
    exists rows finalRow,
      decodeTableau? entry.payload = some rows /\
      verifyRows source entry.history rows = true /\
      lastRow? rows = some finalRow /\
      entry.label = labelOfRow source.machine finalRow := by
  obtain ⟨body, hbody, hterm⟩ := encoder_steps_preserves hreach
  rw [hterm] at hmem
  have hheader :
      headerBits? (header (N (encodeInstance source)) body) =
        some (encodeInstance source) := by
    simpa [seededHeader] using
      (headerBits?_seededHeader (encodeInstance source) body)
  simp only [labelledProjection, hheader,
    decodeInstance?_encodeInstance] at hmem
  have hentry := mem_collectLabels source
    (anchoredOpenedPaths (seededHeader (encodeInstance source) body))
    entry hmem
  exact verifyLabel?_some_literal_final hentry.2

/-- On the encoder cone, both ordered availability bits and terminality are
literal tests of the emitted final row for the frozen source machine. -/
theorem labelledProjection_slot_and_terminal_on_cone
    (source : Instance) {term : Term} {entry : LabelledHistory}
    (hreach : Steps (strongEncoder source) term)
    (hmem : List.Mem entry (labelledProjection term)) :
    entry.label.slot0Enabled =
        (step? source.machine entry.label.finalRow false).isSome /\
    entry.label.slot1Enabled =
        (step? source.machine entry.label.finalRow true).isSome /\
    (entry.label.terminal = true <->
      Terminal source.machine entry.label.finalRow) := by
  obtain ⟨body, hbody, hterm⟩ := encoder_steps_preserves hreach
  rw [hterm] at hmem
  have hheader :
      headerBits? (header (N (encodeInstance source)) body) =
        some (encodeInstance source) := by
    simpa [seededHeader] using
      (headerBits?_seededHeader (encodeInstance source) body)
  simp only [labelledProjection, hheader,
    decodeInstance?_encodeInstance] at hmem
  have hentry := mem_collectLabels source
    (anchoredOpenedPaths (seededHeader (encodeInstance source) body))
    entry hmem
  exact ⟨verifyLabel?_slot0 hentry.2,
    verifyLabel?_slot1 hentry.2,
    verifyLabel?_terminal_iff hentry.2⟩

/-- At most one labelled record is emitted per opened syntax node. -/
theorem collectLabels_length_le (source : Instance) (paths : List BitWord) :
    (collectLabels source paths).length <= paths.length := by
  induction paths with
  | nil => exact Nat.le_refl _
  | cons path paths ih =>
      cases hparse : parseCandidate? path with
      | none =>
          simp only [collectLabels, hparse, List.length_cons]
          exact Nat.le_trans ih (Nat.le_succ _)
      | some pair =>
          rcases pair with ⟨history, payload⟩
          cases hlabel : verifyLabel? source history payload with
          | none =>
              simp only [collectLabels, hparse, hlabel, List.length_cons]
              exact Nat.le_trans ih (Nat.le_succ _)
          | some label =>
              simp only [collectLabels, hparse, hlabel, List.length_cons]
              exact Nat.succ_le_succ ih

/-- Materialized label-record count is linear in the current target term. -/
theorem labelledProjection_length_le (term : Term) :
    (labelledProjection term).length <= term.size := by
  unfold labelledProjection
  cases hbits : headerBits? term with
  | none => simp [hbits]
  | some bits =>
      cases hdecode : decodeInstance? bits with
      | none => simp [hbits, hdecode]
      | some source =>
          simp only [hbits, hdecode]
          exact Nat.le_trans
            (collectLabels_length_le source (anchoredOpenedPaths term))
            (anchoredOpenedPaths_length_le_size term)

end PureSFormal.Research.ProtectedTrieLabelledObserver
