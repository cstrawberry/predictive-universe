import PureSFormal.Research.ProtectedTrieLabelSemantics
import PureSFormal.Research.ProtectedTrieMonotoneBuild

/-!
# Structural fairness and liveness for protected tries

Fairness below is stated only in terms of literal protected addresses in the
current finite term.  It neither mentions a source machine nor asks whether an
address is a valid certificate.  The liveness theorem then derives eventual
semantic and literal labelled discovery for every valid source history.
-/

namespace PureSFormal.Research.ProtectedTrieFairness

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieBuild
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieLabelledObserver
open PureSFormal.Research.ProtectedTrieLabelSemantics
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieMonotoneBuild
open PureSFormal.Research.ProtectedTriePrefixBuild
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieTableau
open PureSFormal.Research.ProtectedTrieTableauLabel

/-- A term sequence is structurally fair when every finite protected address
eventually occurs literally in its anchored protected trie.  This condition is
source-independent and makes no reference to verification or projection. -/
def StructurallyFair (terms : Nat -> Term) : Prop :=
  forall address : BitWord, exists stage,
    List.Mem address (anchoredOpenedPaths (terms stage))

/-- An infinite, genuine one-contraction path from one encoded source. -/
structure EncoderReductionPath (source : Instance) where
  term : Nat -> Term
  startsAt : term 0 = strongEncoder source
  contracts : forall stage, Step (term stage) (term (stage + 1))

namespace EncoderReductionPath

/-- Every term on an encoded one-contraction path lies in that encoder cone. -/
theorem reachable (path : EncoderReductionPath source) (stage : Nat) :
    Steps (strongEncoder source) (path.term stage) := by
  induction stage with
  | zero =>
      rw [path.startsAt]
      exact Steps.refl _
  | succ stage ih =>
      exact Steps.tail ih (path.contracts stage)

end EncoderReductionPath

/-- Every valid source history eventually belongs to the semantic projection
along every structurally fair encoded reduction path. -/
theorem fair_path_eventually_strongProjection
    (source : Instance) (path : EncoderReductionPath source)
    (hfair : StructurallyFair path.term)
    (history : BitWord) (hvalid : ValidHistory source history) :
    exists stage, (strongProjection (path.term stage)).Contains history := by
  let payload := sourceWitness (encodeInstance source) history
  obtain ⟨stage, hpath⟩ := hfair (a history payload)
  have hreach := path.reachable stage
  obtain ⟨body, _hbody, hterm⟩ := strongEncoder_frozen_header source hreach
  apply Exists.intro stage
  apply (projection_contains_iff sourceVerifier (path.term stage) history).mpr
  refine ⟨encodeInstance source, history, payload, ?_, hpath, ?_,
    WordPrefix.refl history⟩
  · rw [hterm]
    exact headerBits?_seededHeader (encodeInstance source) body
  · exact sourceVerifier_complete (encodeInstance source) history (by
      simpa [SourceValid] using hvalid)

/-- Every valid source history eventually has its own literal labelled record
along every structurally fair encoded reduction path.  The record is not
obtained merely from ancestor closure. -/
theorem fair_path_eventually_labelledProjection
    (source : Instance) (path : EncoderReductionPath source)
    (hfair : StructurallyFair path.term)
    (history : BitWord) (hvalid : ValidHistory source history) :
    exists stage entry,
      List.Mem entry (labelledProjection (path.term stage)) /\
      entry.history = history := by
  let payload := sourceWitness (encodeInstance source) history
  obtain ⟨stage, hpath⟩ := hfair (a history payload)
  have hreach := path.reachable stage
  obtain ⟨body, _hbody, hterm⟩ := strongEncoder_frozen_header source hreach
  have hisSome := sourceWitness_verifyLabel?_isSome source history hvalid
  cases hlabel : verifyLabel? source history payload with
  | none => simp [payload, hlabel] at hisSome
  | some label =>
      let entry : LabelledHistory := ⟨history, payload, label⟩
      refine ⟨stage, entry, ?_, rfl⟩
      rw [hterm] at hpath ⊢
      simp only [labelledProjection, headerBits?_seededHeader,
        decodeInstance?_encodeInstance]
      exact mem_collectLabels_of_candidate source _ history payload label
        hpath hlabel

/-! ## A coherent source-independent fairness witness at macro boundaries -/

/-- The finite complete binary prefix tree of depth `depth`. -/
def completeTree : Nat -> PrefixTree
  | 0 => .empty
  | depth + 1 => .node (completeTree depth) (completeTree depth)

/-- Every literal address of length below `depth` occurs in the complete
finite prefix tree of that depth. -/
theorem mem_completeTree_of_length_lt
    (address : BitWord) {depth : Nat} (hdepth : address.length < depth) :
    List.Mem address (completeTree depth).paths := by
  induction address generalizing depth with
  | nil =>
      cases depth with
      | zero => simp at hdepth
      | succ depth => exact nil_mem_paths_node _ _
  | cons bit rest ih =>
      cases depth with
      | zero => simp at hdepth
      | succ depth =>
          have hrest : rest.length < depth := by
            simpa using hdepth
          cases bit with
          | false =>
              exact (false_cons_mem_paths_node_iff rest _ _).mpr (ih hrest)
          | true =>
              exact (true_cons_mem_paths_node_iff rest _ _).mpr (ih hrest)

/-- Complete finite trees grow monotonically by one depth. -/
theorem completeTree_le_succ (depth : Nat) :
    PrefixTree.LE (completeTree depth) (completeTree (depth + 1)) := by
  induction depth with
  | zero => exact .empty _
  | succ depth ih => exact .node ih ih

/-- Canonical macro-boundary terms that successively expose complete finite
binary prefix trees. -/
def fairMacroTerm (bits : BitWord) (depth : Nat) : Term :=
  seededBuild bits (completeTree depth)

@[simp]
theorem fairMacroTerm_zero (bits : BitWord) :
    fairMacroTerm bits 0 = encoder bits := rfl

/-- Consecutive macro boundaries are connected by a finite genuine pure-`S`
reduction. -/
theorem fairMacroTerm_steps (bits : BitWord) (depth : Nat) :
    Steps (fairMacroTerm bits depth) (fairMacroTerm bits (depth + 1)) :=
  seededBuild_steps_of_le bits (completeTree_le_succ depth)

/-- The canonical macro-boundary sequence satisfies structural fairness. -/
theorem fairMacroTerm_structurallyFair (bits : BitWord) :
    StructurallyFair (fairMacroTerm bits) := by
  intro address
  refine ⟨address.length + 1, ?_⟩
  rw [fairMacroTerm, anchoredOpenedPaths_seededBuild]
  exact mem_completeTree_of_length_lt address (Nat.lt_succ_self _)

/-- The concrete fair macro sequence eventually carries a literal labelled
record for every valid source history. -/
theorem fairMacroTerm_eventually_labelled
    (source : Instance) (history : BitWord)
    (hvalid : ValidHistory source history) :
    exists depth entry,
      List.Mem entry
        (labelledProjection
          (fairMacroTerm (encodeInstance source) depth)) /\
      entry.history = history := by
  let payload := sourceWitness (encodeInstance source) history
  obtain ⟨depth, hpath⟩ :=
    fairMacroTerm_structurallyFair (encodeInstance source)
      (a history payload)
  have hisSome := sourceWitness_verifyLabel?_isSome source history hvalid
  cases hlabel : verifyLabel? source history payload with
  | none => simp [payload, hlabel] at hisSome
  | some label =>
      let entry : LabelledHistory := ⟨history, payload, label⟩
      refine ⟨depth, entry, ?_, rfl⟩
      have hheader :
          headerBits? (fairMacroTerm (encodeInstance source) depth) =
            some (encodeInstance source) := by
        exact headerBits?_seededHeader _ _
      simp only [labelledProjection, hheader, decodeInstance?_encodeInstance]
      exact mem_collectLabels_of_candidate source _ history payload label
        hpath hlabel

/-- Every finite structural fairness obligation can be met from every reduct
of the same frozen encoder, while preserving all already opened paths. -/
theorem finite_fairness_obligations_extendible
    {bits : BitWord} {reduct : Term}
    (hreach : Steps (encoder bits) reduct) (addresses : List BitWord) :
    exists target,
      Steps reduct target /\
      (forall old,
        List.Mem old (anchoredOpenedPaths reduct) ->
        List.Mem old (anchoredOpenedPaths target)) /\
      (forall address, List.Mem address addresses ->
        List.Mem address (anchoredOpenedPaths target)) := by
  let requested :
      PureSFormal.Research.ProtectedTrieFinitePrefix.FinitePrefixSet :=
    ⟨addresses⟩
  obtain ⟨target, hreduct, _hbuild, hkeep, hrequested⟩ :=
    PureSFormal.Research.ProtectedTrieConfluence.encoder_reduct_cofinal_prefixSet
      requested hreach
  refine ⟨target, hreduct, hkeep, ?_⟩
  intro address hmem
  exact hrequested address
    (PureSFormal.Research.ProtectedTrieFinitePrefix.FinitePrefixSet.contains_generator
      hmem)

end PureSFormal.Research.ProtectedTrieFairness
