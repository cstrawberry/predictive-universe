import PureSFormal.Research.ProtectedTrieStrongTheorem

/-!
# Literal labels and source semantics

This module separates two facts that have different quantifier scopes.
On an arbitrary current term, ancestor closure means that a projected history
is a prefix of some literal labelled endpoint.  At a canonical subdivision
checkpoint, every ancestor certificate is itself open and therefore has its
own literal labelled record.

The module also identifies each emitted final row with the result of the
formal source run and proves exact equivalence between source branch halting
and a reachable terminal-labelled observation.
-/

namespace PureSFormal.Research.ProtectedTrieLabelSemantics

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieBuild
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieLabelledObserver
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTriePrefixBuild
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieStrongTheorem
open PureSFormal.Research.ProtectedTrieSubdivision
open PureSFormal.Research.ProtectedTrieTableau
open PureSFormal.Research.ProtectedTrieTableauLabel

/-- The partial final-row map of the concrete ordered-binary source. -/
def sourceFinalRow? (source : Instance) (history : BitWord) : Option Row :=
  run? source.machine (initialRow source) history

/-- The empty occurrence history denotes the literal initialized row. -/
@[simp]
theorem sourceFinalRow?_nil (source : Instance) :
    sourceFinalRow? source [] = some (initialRow source) :=
  rfl

/-- Membership in the history-only projection means prefix membership in one
current literal labelled endpoint.  It does not assert that every such prefix
has a separate label record on an arbitrary reduct. -/
theorem mem_map_labelledHistory_history_iff
    (entries : List LabelledHistory) (history : BitWord) :
    List.Mem history (entries.map LabelledHistory.history) <->
      exists entry, List.Mem entry entries /\ history = entry.history := by
  induction entries with
  | nil =>
      constructor
      · intro hmem
        cases hmem
      · rintro ⟨entry, hmem, heq⟩
        cases hmem
  | cons first rest ih =>
      change
        List.Mem history
            (first.history :: rest.map LabelledHistory.history) <-> _
      constructor
      · intro hmem
        rcases List.mem_cons.mp hmem with hfirst | hrest
        · exact ⟨first, List.Mem.head rest, hfirst⟩
        · obtain ⟨entry, hentry, heq⟩ := ih.mp hrest
          exact ⟨entry, List.Mem.tail first hentry, heq⟩
      · rintro ⟨entry, hentry, heq⟩
        rcases List.mem_cons.mp hentry with hfirst | hrest
        · subst entry
          subst history
          exact List.Mem.head _
        · exact List.Mem.tail first.history
            (ih.mpr ⟨entry, hrest, heq⟩)

theorem strongProjection_contains_iff_labelled_extension
    (term : Term) (history : BitWord) :
    (strongProjection term).Contains history <->
      exists entry,
        List.Mem entry (labelledProjection term) /\
        WordPrefix history entry.history := by
  rw [<- labelledHistoryIdeal_eq]
  unfold labelledHistoryIdeal
  rw [idealOf_contains_iff]
  constructor
  · rintro ⟨large, hlarge, hprefix⟩
    obtain ⟨entry, hentry, heq⟩ :=
      (mem_map_labelledHistory_history_iff _ _).mp hlarge
    subst large
    exact ⟨entry, hentry, hprefix⟩
  · rintro ⟨entry, hentry, hprefix⟩
    exact ⟨entry.history,
      (mem_map_labelledHistory_history_iff _ _).mpr
        ⟨entry, hentry, rfl⟩,
      hprefix⟩

/-- A successful canonical trace ends in exactly the row returned by the
formal source runner. -/
theorem buildTrace?_lastRow?_eq_run?
    (machine : Machine) (row : Row) (history : BitWord) (rows : List Row)
    (htrace : buildTrace? machine row history = some rows) :
    lastRow? rows = run? machine row history := by
  induction history generalizing row rows with
  | nil =>
      simp [buildTrace?, run?] at htrace
      subst rows
      rfl
  | cons slot history ih =>
      unfold buildTrace? at htrace
      unfold run?
      cases hstep : step? machine row slot with
      | none => simp [hstep] at htrace
      | some next =>
          simp only [hstep, Option.bind_some] at htrace
          cases htail : buildTrace? machine next history with
          | none => simp [htail] at htrace
          | some tail =>
              simp [htail] at htrace
              subst rows
              have hne : tail ≠ [] := by
                intro hnil
                subst tail
                exact (buildTrace?_ne_nil machine next history htail).elim
              cases tail with
              | nil => exact False.elim (hne rfl)
              | cons head rest =>
                  change lastRow? (head :: rest) = run? machine next history
                  exact ih next (head :: rest) htail

/-- Row verification identifies its literal last row with the formal run. -/
theorem verifyRows_lastRow?_eq_sourceFinalRow?
    (source : Instance) (history : BitWord) (rows : List Row)
    (hverify : verifyRows source history rows = true) :
    lastRow? rows = sourceFinalRow? source history := by
  have hcanonical :=
    (verifyRows_eq_true_iff source history rows).mp hverify
  exact buildTrace?_lastRow?_eq_run? source.machine (initialRow source)
    history rows hcanonical

/-- Add a successfully labelled complete candidate to the structural label
collector. -/
theorem mem_collectLabels_of_candidate
    (source : Instance) (paths : List BitWord)
    (history payload : BitWord) (label : LiteralHistoryLabel)
    (hpath : List.Mem (a history payload) paths)
    (hlabel : verifyLabel? source history payload = some label) :
    List.Mem ⟨history, payload, label⟩ (collectLabels source paths) := by
  induction paths with
  | nil => cases hpath
  | cons path paths ih =>
      rcases List.mem_cons.mp hpath with hhere | htail
      · subst path
        simp only [collectLabels, parseCandidate?_a, hlabel]
        exact List.Mem.head _
      · cases hparse : parseCandidate? path with
        | none =>
            simp only [collectLabels, hparse]
            exact ih htail
        | some pair =>
            rcases pair with ⟨otherHistory, otherPayload⟩
            cases hother : verifyLabel? source otherHistory otherPayload with
            | none =>
                simp only [collectLabels, hparse, hother]
                exact ih htail
            | some otherLabel =>
                simp only [collectLabels, hparse, hother, List.mem_cons]
                exact List.Mem.tail _ (ih htail)

/-- The canonical witness for every valid history produces a literal label. -/
theorem sourceWitness_verifyLabel?_isSome
    (source : Instance) (history : BitWord)
    (hvalid : ValidHistory source history) :
    (verifyLabel? source history
      (sourceWitness (encodeInstance source) history)).isSome = true := by
  rw [verifyLabel?_isSome]
  simpa [sourceVerifier_encoded] using
    (sourceVerifier_complete (encodeInstance source) history (by
      simpa [SourceValid] using hvalid))

/-- Every ancestor on a canonical branch checkpoint has its own current
literal labelled record, not merely membership contributed by closure. -/
theorem labelledProjection_checkpoint_contains_prefix
    (source : Instance) (history ancestor : BitWord)
    (hvalid : ValidHistory source history)
    (hprefix : WordPrefix ancestor history) :
    exists entry,
      List.Mem entry (labelledProjection
        (subdivisionCheckpoint sourceWitness (encodeInstance source) history)) /\
      entry.history = ancestor := by
  have hancestorValid : ValidHistory source ancestor :=
    valid_of_wordPrefix hprefix hvalid
  have hpath : List.Mem
      (a ancestor (sourceWitness (encodeInstance source) ancestor))
      (anchoredOpenedPaths
        (subdivisionCheckpoint sourceWitness (encodeInstance source) history)) :=
    (candidate_mem_subdivisionCheckpoint_iff sourceWitness
      (encodeInstance source) history ancestor
      (sourceWitness (encodeInstance source) ancestor)).mpr ⟨hprefix, rfl⟩
  have hisSome := sourceWitness_verifyLabel?_isSome source ancestor
    hancestorValid
  cases hlabel : verifyLabel? source ancestor
      (sourceWitness (encodeInstance source) ancestor) with
  | none => simp [hlabel] at hisSome
  | some label =>
      let entry : LabelledHistory :=
        ⟨ancestor, sourceWitness (encodeInstance source) ancestor, label⟩
      refine ⟨entry, ?_, rfl⟩
      have hheader : headerBits?
          (subdivisionCheckpoint sourceWitness (encodeInstance source) history) =
          some (encodeInstance source) := by
        simp [subdivisionCheckpoint, seededPrefixBuild, seededBuild,
          headerBits?_seededHeader]
      simp only [labelledProjection, hheader,
        decodeInstance?_encodeInstance]
      exact mem_collectLabels_of_candidate source _ ancestor
        (sourceWitness (encodeInstance source) ancestor) label hpath hlabel

/-- The emitted literal final row on the encoder cone is exactly the result
of running the formal source semantics on the emitted occurrence history. -/
theorem labelledProjection_finalRow_eq_sourceRun
    (source : Instance) {term : Term} {entry : LabelledHistory}
    (hreach : Steps (strongEncoder source) term)
    (hmem : List.Mem entry (labelledProjection term)) :
    sourceFinalRow? source entry.history = some entry.label.finalRow := by
  obtain ⟨rows, finalRow, hdecode, hverify, hlast, hlabel⟩ :=
    labelledProjection_literal_final_on_cone source hreach hmem
  have hrun := verifyRows_lastRow?_eq_sourceFinalRow? source
    entry.history rows hverify
  rw [hlast] at hrun
  rw [hlabel]
  exact hrun.symm

/-- A source branch halts when some valid occurrence history ends in a
terminal formal row. -/
def SourceBranchHalts (source : Instance) : Prop :=
  exists history finalRow,
    sourceFinalRow? source history = some finalRow /\
    Terminal source.machine finalRow

/-- A target term terminally observes the source when one current literal
record carries its verified terminal flag. -/
def TargetTerminalObservation (source : Instance) : Prop :=
  exists term entry,
    Steps (strongEncoder source) term /\
    List.Mem entry (labelledProjection term) /\
    entry.label.terminal = true

/-- Branch halting is equivalent to a reachable current-term literal terminal
observation.  Both implications use the same formal source instance frozen in
the encoder header. -/
theorem sourceBranchHalts_iff_targetTerminalObservation
    (source : Instance) :
    SourceBranchHalts source <-> TargetTerminalObservation source := by
  constructor
  · rintro ⟨history, finalRow, hrun, hterminal⟩
    have hvalid : ValidHistory source history := ⟨finalRow, hrun⟩
    obtain ⟨entry, hentry, hentryHistory⟩ :=
      labelledProjection_checkpoint_contains_prefix source history history
        hvalid (WordPrefix.refl history)
    have hreach := strong_subdivisionCheckpoint_reachable source history hvalid
    have hrunEntry := labelledProjection_finalRow_eq_sourceRun source
      hreach hentry
    rw [hentryHistory, hrun] at hrunEntry
    have hrow : entry.label.finalRow = finalRow :=
      (Option.some.inj hrunEntry).symm
    have hflags := labelledProjection_slot_and_terminal_on_cone source
      hreach hentry
    refine ⟨subdivisionCheckpoint sourceWitness (encodeInstance source) history,
      entry, hreach, hentry, ?_⟩
    apply hflags.2.2.mpr
    simpa [hrow] using hterminal
  · rintro ⟨term, entry, hreach, hentry, hterminalFlag⟩
    have hrun := labelledProjection_finalRow_eq_sourceRun source hreach hentry
    have hflags := labelledProjection_slot_and_terminal_on_cone source
      hreach hentry
    exact ⟨entry.history, entry.label.finalRow, hrun,
      hflags.2.2.mp hterminalFlag⟩

/-- The finite encoder starts before the root-history discovery. -/
theorem strongEncoder_initialIdeal_empty (source : Instance) :
    forall history,
      Not ((strongProjection (strongEncoder source)).Contains history) :=
  strongProjection_initial_empty source

/-- The fixed labelled observer emits no computation record at the finite
encoder.  Every accepted record therefore requires at least one genuine
target contraction below the protected header. -/
theorem strongEncoder_initialLabelledProjection_empty (source : Instance) :
    labelledProjection (strongEncoder source) = [] := by
  have hheader :
      headerBits? (strongEncoder source) = some (encodeInstance source) := by
    simp [strongEncoder, encoder, headerBits?_seededHeader]
  simp only [labelledProjection, hheader, decodeInstance?_encodeInstance,
    anchoredOpenedPaths_strongEncoder, collectLabels]

/-- The root checkpoint is reachable and denotes exactly the root ideal. -/
theorem rootCheckpoint_reachable_exact (source : Instance) :
    Steps (strongEncoder source)
        (subdivisionCheckpoint sourceWitness (encodeInstance source) []) /\
    (strongProjection
      (subdivisionCheckpoint sourceWitness (encodeInstance source) [])
    ).Equivalent (branchIdeal []) := by
  have hroot : ValidHistory source [] := ⟨initialRow source, rfl⟩
  exact ⟨strong_subdivisionCheckpoint_reachable source [] hroot,
    strong_subdivisionCheckpoint_exact source [] hroot⟩

/-- A child occurrence is valid exactly when its ordered slot is enabled at
the parent's formal final row. -/
theorem valid_append_singleton_iff_step?_isSome
    (source : Instance) (history : BitWord) (row : Row) (slot : Bool)
    (hrun : sourceFinalRow? source history = some row) :
    ValidHistory source (history ++ [slot]) <->
      (step? source.machine row slot).isSome = true := by
  unfold ValidHistory sourceFinalRow? at *
  rw [run?_append, hrun]
  change
    (exists final, run? source.machine row [slot] = some final) <->
      (step? source.machine row slot).isSome = true
  cases hstep : step? source.machine row slot with
  | none =>
      constructor
      · rintro ⟨final, hfinal⟩
        unfold run? at hfinal
        rw [hstep] at hfinal
        cases hfinal
      · intro hisSome
        exact Bool.noConfusion hisSome
  | some next =>
      constructor
      · intro _
        rfl
      · intro _
        refine ⟨next, ?_⟩
        unfold run?
        rw [hstep]
        rfl

end PureSFormal.Research.ProtectedTrieLabelSemantics
