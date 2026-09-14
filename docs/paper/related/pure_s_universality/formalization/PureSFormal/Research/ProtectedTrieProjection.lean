import PureSFormal.Research.ProtectedTrieMonotoneBuild
import PureSFormal.Research.ProtectedTrieSingleOpening

/-!
# Finite projection from protected tries to persistent history ideals

This Research module is the verifier-parametric integration layer for the
protected-certificate trie.  It contains no Turing-machine or tableau
definition.  Instead, a total Boolean verifier is an explicit parameter and
all semantic results state the exact soundness, completeness, prefix-closure,
and witness-uniqueness hypotheses they use.

The construction is entirely finite and duplicate tolerant.  Complete
certificate paths and proper frontier prefixes are converted to one explicit
finitely generated prefix set, built below the frozen seed, enumerated from
the current term, decoded structurally, and closed under history prefixes.
-/

namespace PureSFormal.Research.ProtectedTrieProjection

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieBuild
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieFinitePrefix
open PureSFormal.Research.ProtectedTrieMonotoneBuild
open PureSFormal.Research.ProtectedTrieParser
open PureSFormal.Research.ProtectedTriePrefixBuild
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieSingleOpening

/-! ## Explicit prepared prefix sets -/

/-- Enumerate all strict prefixes of a literal word, shortest first. -/
def properPrefixes : BitWord -> List BitWord
  | [] => []
  | bit :: rest => [] :: (properPrefixes rest).map (List.cons bit)

/-- Exact membership in the finite strict-prefix enumeration. -/
theorem mem_properPrefixes_iff (small large : BitWord) :
    List.Mem small (properPrefixes large) <-> ProperWordPrefix small large := by
  induction large generalizing small with
  | nil =>
      cases small with
      | nil =>
          constructor
          · intro h
            cases h
          · intro h
            exact False.elim (h.2 rfl)
      | cons bit rest =>
          constructor
          · intro h
            cases h
          · intro h
            exact False.elim (WordPrefix.not_cons_nil bit rest h.1)
  | cons bit rest ih =>
      cases small with
      | nil =>
          constructor
          · intro _
            exact ⟨.nil _, by simp⟩
          · intro _
            exact List.Mem.head _
      | cons smallBit smallRest =>
          cases bit <;> cases smallBit
          · constructor
            · intro hmem
              rcases List.mem_cons.mp hmem with heq | htail
              · cases heq
              · have hproper := (ih smallRest).mp
                    ((mem_map_cons_iff false smallRest
                      (properPrefixes rest)).mp htail)
                exact ⟨.cons false hproper.1, fun heq =>
                  hproper.2 (List.cons.inj heq).2⟩
            · intro hproper
              exact List.Mem.tail []
                ((mem_map_cons_iff false smallRest
                  (properPrefixes rest)).mpr ((ih smallRest).mpr
                    ⟨WordPrefix.tail hproper.1, fun heq =>
                      hproper.2 (congrArg (List.cons false) heq)⟩))
          · constructor
            · intro hmem
              rcases List.mem_cons.mp hmem with heq | htail
              · cases heq
              · exact False.elim
                  (true_cons_not_mem_map_false smallRest
                    (properPrefixes rest) htail)
            · intro hproper
              exact False.elim
                (WordPrefix.not_true_false smallRest rest hproper.1)
          · constructor
            · intro hmem
              rcases List.mem_cons.mp hmem with heq | htail
              · cases heq
              · exact False.elim
                  (false_cons_not_mem_map_true smallRest
                    (properPrefixes rest) htail)
            · intro hproper
              exact False.elim
                (WordPrefix.not_false_true smallRest rest hproper.1)
          · constructor
            · intro hmem
              rcases List.mem_cons.mp hmem with heq | htail
              · cases heq
              · have hproper := (ih smallRest).mp
                    ((mem_map_cons_iff true smallRest
                      (properPrefixes rest)).mp htail)
                exact ⟨.cons true hproper.1, fun heq =>
                  hproper.2 (List.cons.inj heq).2⟩
            · intro hproper
              exact List.Mem.tail []
                ((mem_map_cons_iff true smallRest
                  (properPrefixes rest)).mpr ((ih smallRest).mpr
                    ⟨WordPrefix.tail hproper.1, fun heq =>
                      hproper.2 (congrArg (List.cons true) heq)⟩))

/-- Flatten the strict prefixes of finitely many candidate endpoints. -/
def frontierPrefixGenerators : List (BitWord × BitWord) -> List BitWord
  | [] => []
  | pair :: rest =>
      properPrefixes (a pair.1 pair.2) ++ frontierPrefixGenerators rest

/-- Every flattened frontier generator is a proper candidate prefix. -/
theorem frontierPrefixGenerator_mem_cases {word : BitWord}
    {frontier : List (BitWord × BitWord)}
    (hmem : List.Mem word (frontierPrefixGenerators frontier)) :
    exists pair, List.Mem pair frontier /\
      ProperWordPrefix word (a pair.1 pair.2) := by
  induction frontier with
  | nil => cases hmem
  | cons pair rest ih =>
      simp only [frontierPrefixGenerators] at hmem
      rcases mem_append_cases hmem with hhere | hrest
      · exact ⟨pair, .head _, (mem_properPrefixes_iff _ _).mp hhere⟩
      · obtain ⟨found, hfound, hproper⟩ := ih hrest
        exact ⟨found, .tail pair hfound, hproper⟩

/-- Every selected frontier pair contributes all of its strict prefixes. -/
theorem frontierPrefixGenerator_mem_of_mem
    {pair : BitWord × BitWord} {word : BitWord}
    {frontier : List (BitWord × BitWord)}
    (hpair : List.Mem pair frontier)
    (hproper : ProperWordPrefix word (a pair.1 pair.2)) :
    List.Mem word (frontierPrefixGenerators frontier) := by
  induction hpair with
  | head =>
      exact mem_append_left ((mem_properPrefixes_iff _ _).mpr hproper)
  | tail first htail ih =>
      exact mem_append_right (properPrefixes (a first.1 first.2)) ih

/--
One explicit finite prefix set containing full selected certificates and all
strict prefixes, but not endpoints, of the prepared frontier certificates.
-/
def preparedPrefixSet (chosen frontier : List (BitWord × BitWord)) :
    FinitePrefixSet :=
  ⟨candidateGenerators chosen ++ frontierPrefixGenerators frontier⟩

/-- The explicit set is extensionally the selected/proper union. -/
theorem preparedPrefixSet_contains_iff
    (chosen frontier : List (BitWord × BitWord)) (word : BitWord) :
    (preparedPrefixSet chosen frontier).Contains word <->
      PreparedContains chosen frontier word := by
  constructor
  · rintro ⟨endpoint, hgenerator, hprefix⟩
    rcases mem_append_cases hgenerator with hselected | hfrontier
    · exact Or.inl ⟨endpoint, hselected, hprefix⟩
    · obtain ⟨pair, hpair, hproper⟩ :=
        frontierPrefixGenerator_mem_cases hfrontier
      exact Or.inr ⟨a pair.1 pair.2,
        candidateGenerator_mem_of_mem hpair,
        properWordPrefix_left_trans hprefix hproper⟩
  · intro hcontains
    rcases hcontains with hselected | hfrontier
    · obtain ⟨endpoint, hgenerator, hprefix⟩ := hselected
      exact ⟨endpoint, mem_append_left hgenerator, hprefix⟩
    · obtain ⟨endpoint, hgenerator, hproper⟩ := hfrontier
      obtain ⟨pair, hpair, heq⟩ := candidateGenerator_mem_cases hgenerator
      cases heq
      have hmem : List.Mem word (frontierPrefixGenerators frontier) :=
        frontierPrefixGenerator_mem_of_mem hpair hproper
      exact ⟨word, mem_append_right (candidateGenerators chosen) hmem,
        WordPrefix.refl word⟩

/-- Complete candidates in the explicit prepared set are exactly selected. -/
theorem a_preparedPrefixSet_contains_iff
    {history payload : BitWord}
    {chosen frontier : List (BitWord × BitWord)} :
    (preparedPrefixSet chosen frontier).Contains (a history payload) <->
      List.Mem (history, payload) chosen := by
  rw [preparedPrefixSet_contains_iff]
  exact a_preparedContains_iff

/-- The concrete frozen-seed endpoint for one explicit prepared prefix set. -/
def seededPreparedBuild (bits : BitWord)
    (chosen frontier : List (BitWord × BitWord)) : Term :=
  seededPrefixBuild bits (preparedPrefixSet chosen frontier)

/-- Every explicit prepared certificate/frontier set has a canonical reduct. -/
theorem encoder_steps_seededPreparedBuild (bits : BitWord)
    (chosen frontier : List (BitWord × BitWord)) :
    Steps (encoder bits) (seededPreparedBuild bits chosen frontier) :=
  encoder_steps_seededPrefixBuild bits (preparedPrefixSet chosen frontier)

/-- Exact anchored enumeration of the prepared canonical endpoint. -/
theorem mem_anchoredOpenedPaths_seededPreparedBuild_iff
    (bits path : BitWord) (chosen frontier : List (BitWord × BitWord)) :
    List.Mem path
        (anchoredOpenedPaths (seededPreparedBuild bits chosen frontier)) <->
      PreparedContains chosen frontier path := by
  rw [seededPreparedBuild,
    mem_anchoredOpenedPaths_seededPrefixBuild_iff,
    preparedPrefixSet_contains_iff]

/-- Exact complete-certificate range at the prepared canonical endpoint. -/
theorem candidate_mem_seededPreparedBuild_iff
    (bits history payload : BitWord)
    (chosen frontier : List (BitWord × BitWord)) :
    List.Mem (a history payload)
        (anchoredOpenedPaths (seededPreparedBuild bits chosen frontier)) <->
      List.Mem (history, payload) chosen := by
  rw [seededPreparedBuild,
    mem_anchoredOpenedPaths_seededPrefixBuild_iff,
    a_preparedPrefixSet_contains_iff]

/-! ## A total inverse for complete candidate addresses -/

/-- Parse `1^n 0 payload`, remembering the number of leading ones. -/
def parsePcAux : Nat -> BitWord -> Option BitWord
  | _, [] => none
  | count, false :: payload =>
      if payload.length = count then some payload else none
  | count, true :: rest => parsePcAux (count + 1) rest

/-- Parse one complete self-delimiting payload. -/
def parsePc? (word : BitWord) : Option BitWord :=
  parsePcAux 0 word

/-- Behavior of `parsePcAux` on its literal replicate/delimiter grammar. -/
theorem parsePcAux_replicate (count n : Nat) (payload : BitWord) :
    parsePcAux count
        (List.replicate n true ++ false :: payload) =
      if payload.length = count + n then some payload else none := by
  induction n generalizing count with
  | zero => rfl
  | succ n ih =>
      simp only [List.replicate_succ, List.cons_append, parsePcAux]
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using ih (count + 1)

/-- Every canonical payload code is accepted literally. -/
@[simp]
theorem parsePc?_pc (payload : BitWord) : parsePc? (pc payload) = some payload := by
  rw [parsePc?, pc_eq_replicate, parsePcAux_replicate]
  simp

/-- Every successful payload parse reconstructs its complete input. -/
theorem parsePcAux_sound {count : Nat} {word payload : BitWord}
    (hparse : parsePcAux count word = some payload) :
    exists n,
      word = List.replicate n true ++ false :: payload /\
      payload.length = count + n := by
  induction word generalizing count with
  | nil => simp [parsePcAux] at hparse
  | cons bit rest ih =>
      cases bit with
      | false =>
          simp only [parsePcAux] at hparse
          split at hparse <;> rename_i hlen
          · cases hparse
            exact ⟨0, rfl, by simpa using hlen⟩
          · cases hparse
      | true =>
          simp only [parsePcAux] at hparse
          obtain ⟨n, hword, hlen⟩ := ih hparse
          refine ⟨n + 1, ?_, ?_⟩
          · simp only [List.replicate_succ, List.cons_append, hword]
          · simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hlen

/-- The total payload parser accepts only the canonical encoding. -/
theorem parsePc?_sound {word payload : BitWord}
    (hparse : parsePc? word = some payload) : word = pc payload := by
  obtain ⟨n, hword, hlen⟩ := parsePcAux_sound hparse
  have hn : n = payload.length := by simpa using hlen.symm
  rw [hword, pc_eq_replicate, hn]

/-- Parse route pairs until the separator, then parse the payload. -/
def parseCandidateAux : BitWord -> BitWord -> Option (BitWord × BitWord)
  | _, [] => none
  | reversed, false :: payloadCode =>
      (parsePc? payloadCode).map (fun payload => (reversed.reverse, payload))
  | _, [true] => none
  | reversed, true :: bit :: rest =>
      parseCandidateAux (bit :: reversed) rest

/-- Total structural inverse for complete candidate paths. -/
def parseCandidate? (word : BitWord) : Option (BitWord × BitWord) :=
  parseCandidateAux [] word

/-- Completeness of the candidate parser with an accumulated route prefix. -/
theorem parseCandidateAux_a (reversed history payload : BitWord) :
    parseCandidateAux reversed (a history payload) =
      some (reversed.reverse ++ history, payload) := by
  induction history generalizing reversed with
  | nil => simp [a_nil, parseCandidateAux, parsePc?_pc]
  | cons bit history ih =>
      simp only [a_cons, parseCandidateAux]
      simpa [List.reverse_cons, List.append_assoc] using ih (bit :: reversed)

/-- Every literal candidate address decodes to its history and payload. -/
@[simp]
theorem parseCandidate?_a (history payload : BitWord) :
    parseCandidate? (a history payload) = some (history, payload) := by
  simpa [parseCandidate?] using parseCandidateAux_a [] history payload

/-- Soundness of the accumulated candidate parser. -/
theorem parseCandidateAux_sound {reversed word history payload : BitWord}
    (hparse : parseCandidateAux reversed word = some (history, payload)) :
    exists suffix,
      word = a suffix payload /\ history = reversed.reverse ++ suffix := by
  induction reversed, word using parseCandidateAux.induct with
  | case1 reversed => simp [parseCandidateAux] at hparse
  | case2 reversed payloadCode =>
      cases hpc : parsePc? payloadCode with
      | none => simp [parseCandidateAux, hpc] at hparse
      | some decoded =>
          have hpair : (reversed.reverse, decoded) = (history, payload) := by
            change (parsePc? payloadCode).map
                (fun value => (reversed.reverse, value)) =
              some (history, payload) at hparse
            rw [hpc] at hparse
            exact Option.some.inj hparse
          have hhistory : reversed.reverse = history := congrArg Prod.fst hpair
          have hpayload : decoded = payload := congrArg Prod.snd hpair
          refine ⟨[], ?_, ?_⟩
          · simpa [a_nil, hpayload] using parsePc?_sound hpc
          · simpa using hhistory.symm
  | case3 reversed => simp [parseCandidateAux] at hparse
  | case4 reversed bit rest ih =>
      obtain ⟨suffix, htail, hhistory⟩ := ih hparse
      refine ⟨bit :: suffix, ?_, ?_⟩
      · simpa only [a_cons] using congrArg (fun x => true :: bit :: x) htail
      · simpa [List.reverse_cons, List.append_assoc] using hhistory

/-- The candidate parser accepts only complete candidate addresses. -/
theorem parseCandidate?_sound {word history payload : BitWord}
    (hparse : parseCandidate? word = some (history, payload)) :
    word = a history payload := by
  obtain ⟨suffix, hword, hhistory⟩ := parseCandidateAux_sound hparse
  simpa [parseCandidate?] using hword.trans (congrArg (fun h => a h payload)
    (by simpa using hhistory.symm))

/-! ## Finite persistent history ideals -/

/-- Enumerate all prefixes of one history, from the root through the history. -/
def historyPrefixes : BitWord -> List BitWord
  | [] => [[]]
  | bit :: rest => [] :: (historyPrefixes rest).map (List.cons bit)

/-- Exact membership in the all-prefix enumeration. -/
theorem mem_historyPrefixes_iff (small large : BitWord) :
    List.Mem small (historyPrefixes large) <-> WordPrefix small large := by
  induction large generalizing small with
  | nil =>
      cases small with
      | nil => exact ⟨fun _ => .nil [], fun _ => .head []⟩
      | cons bit rest =>
          constructor
          · intro h
            cases h with
            | tail _ htail => cases htail
          · exact fun h => False.elim (WordPrefix.not_cons_nil bit rest h)
  | cons bit rest ih =>
      cases small with
      | nil => exact ⟨fun _ => .nil _, fun _ => .head _⟩
      | cons smallBit smallRest =>
          cases bit <;> cases smallBit
          · constructor
            · intro hmem
              rcases List.mem_cons.mp hmem with heq | htail
              · cases heq
              · exact .cons false ((ih smallRest).mp
                  ((mem_map_cons_iff false smallRest
                    (historyPrefixes rest)).mp htail))
            · intro hprefix
              exact .tail [] ((mem_map_cons_iff false smallRest
                (historyPrefixes rest)).mpr ((ih smallRest).mpr
                  (WordPrefix.tail hprefix)))
          · constructor
            · intro hmem
              rcases List.mem_cons.mp hmem with heq | htail
              · cases heq
              · exact False.elim (true_cons_not_mem_map_false smallRest
                  (historyPrefixes rest) htail)
            · intro hprefix
              exact False.elim
                (WordPrefix.not_true_false smallRest rest hprefix)
          · constructor
            · intro hmem
              rcases List.mem_cons.mp hmem with heq | htail
              · cases heq
              · exact False.elim (false_cons_not_mem_map_true smallRest
                  (historyPrefixes rest) htail)
            · intro hprefix
              exact False.elim
                (WordPrefix.not_false_true smallRest rest hprefix)
          · constructor
            · intro hmem
              rcases List.mem_cons.mp hmem with heq | htail
              · cases heq
              · exact .cons true ((ih smallRest).mp
                  ((mem_map_cons_iff true smallRest
                    (historyPrefixes rest)).mp htail))
            · intro hprefix
              exact .tail [] ((mem_map_cons_iff true smallRest
                (historyPrefixes rest)).mpr ((ih smallRest).mpr
                  (WordPrefix.tail hprefix)))

/-- Flatten the ancestor lists of finitely many accepted histories. -/
def ancestorEntries : List BitWord -> List BitWord
  | [] => []
  | history :: rest => historyPrefixes history ++ ancestorEntries rest

/-- Exact membership in the flattened ancestor closure. -/
theorem mem_ancestorEntries_iff {small : BitWord} (histories : List BitWord) :
    List.Mem small (ancestorEntries histories) <->
      exists large, List.Mem large histories /\ WordPrefix small large := by
  induction histories with
  | nil =>
      constructor
      · intro h
        cases h
      · rintro ⟨large, h, _⟩
        cases h
  | cons history rest ih =>
      simp only [ancestorEntries]
      constructor
      · intro hmem
        rcases mem_append_cases hmem with hhere | hrest
        · exact ⟨history, .head _, (mem_historyPrefixes_iff _ _).mp hhere⟩
        · obtain ⟨large, hlarge, hprefix⟩ := ih.mp hrest
          exact ⟨large, .tail history hlarge, hprefix⟩
      · rintro ⟨large, hlarge, hprefix⟩
        cases hlarge with
        | head => exact mem_append_left ((mem_historyPrefixes_iff _ _).mpr hprefix)
        | tail _ hrest =>
            exact mem_append_right (historyPrefixes history)
              (ih.mpr ⟨large, hrest, hprefix⟩)

/-- A duplicate-tolerant finite representation of an ancestor-closed history set. -/
structure HistoryIdeal where
  entries : List BitWord
  ancestorClosed : forall {small large},
    List.Mem large entries -> WordPrefix small large -> List.Mem small entries

namespace HistoryIdeal

/-- Semantic membership in the represented finite ideal. -/
def Contains (ideal : HistoryIdeal) (history : BitWord) : Prop :=
  List.Mem history ideal.entries

/-- Semantic inclusion of represented ideals. -/
def LE (left right : HistoryIdeal) : Prop :=
  forall history, left.Contains history -> right.Contains history

/-- Semantic equality, independent of duplicate/order choices. -/
def Equivalent (left right : HistoryIdeal) : Prop :=
  forall history, left.Contains history <-> right.Contains history

theorem le_refl (ideal : HistoryIdeal) : ideal.LE ideal :=
  fun _ h => h

theorem le_trans {first second third : HistoryIdeal}
    (h12 : first.LE second) (h23 : second.LE third) : first.LE third :=
  fun history h => h23 history (h12 history h)

theorem contains_ancestor {ideal : HistoryIdeal} {small large : BitWord}
    (hlarge : ideal.Contains large) (hprefix : WordPrefix small large) :
    ideal.Contains small :=
  ideal.ancestorClosed hlarge hprefix

end HistoryIdeal

/-- Close a finite history list under every literal ancestor. -/
def idealOf (histories : List BitWord) : HistoryIdeal where
  entries := ancestorEntries histories
  ancestorClosed := by
    intro small large hlarge hsmallLarge
    obtain ⟨top, htop, hlargeTop⟩ :=
      (mem_ancestorEntries_iff histories).mp hlarge
    exact (mem_ancestorEntries_iff histories).mpr
      ⟨top, htop, wordPrefix_trans hsmallLarge hlargeTop⟩

/-- Exact semantics of the finite ancestor closure. -/
theorem idealOf_contains_iff {small : BitWord} (histories : List BitWord) :
    (idealOf histories).Contains small <->
      exists large, List.Mem large histories /\ WordPrefix small large :=
  mem_ancestorEntries_iff histories

/-! ## Total verifier-parametric projection -/

/-- A concrete verifier reads the frozen seed, claimed history, and payload. -/
abbrev CertificateVerifier := BitWord -> BitWord -> BitWord -> Bool

/--
Collect verified histories from a finite list of literal opened paths.  Every
path is parsed once; malformed or verifier-rejected paths contribute nothing.
-/
def verifiedHistories (verify : CertificateVerifier) (seed : BitWord) :
    List BitWord -> List BitWord
  | [] => []
  | path :: rest =>
      match parseCandidate? path with
      | none => verifiedHistories verify seed rest
      | some pair =>
          if verify seed pair.1 pair.2 then
            pair.1 :: verifiedHistories verify seed rest
          else verifiedHistories verify seed rest

/-- Exact finite enumeration performed by `verifiedHistories`. -/
theorem mem_verifiedHistories_iff
    (verify : CertificateVerifier) (seed history : BitWord)
    (paths : List BitWord) :
    List.Mem history (verifiedHistories verify seed paths) <->
      exists payload,
        List.Mem (a history payload) paths /\
        verify seed history payload = true := by
  induction paths with
  | nil =>
      constructor
      · intro h
        cases h
      · rintro ⟨payload, h, _⟩
        cases h
  | cons path rest ih =>
      cases hparse : parseCandidate? path with
      | none =>
          simp only [verifiedHistories, hparse]
          rw [ih]
          constructor
          · rintro ⟨payload, hmem, hverify⟩
            exact ⟨payload, .tail path hmem, hverify⟩
          · rintro ⟨payload, hmem, hverify⟩
            cases hmem with
            | head =>
                have : parseCandidate? (a history payload) = none := by
                  exact hparse
                rw [parseCandidate?_a] at this
                cases this
            | tail _ hrest => exact ⟨payload, hrest, hverify⟩
      | some pair =>
          rcases pair with ⟨parsedHistory, parsedPayload⟩
          by_cases hverified : verify seed parsedHistory parsedPayload = true
          · simp only [verifiedHistories, hparse, hverified, if_pos]
            constructor
            · intro hmem
              rcases List.mem_cons.mp hmem with heq | hrest
              · have hpath : path = a parsedHistory parsedPayload :=
                  parseCandidate?_sound hparse
                refine ⟨parsedPayload, ?_, ?_⟩
                rw [heq, ← hpath]
                exact List.Mem.head rest
                simpa [heq] using hverified
              · obtain ⟨payload, hpath, hverify⟩ := ih.mp hrest
                exact ⟨payload, .tail path hpath, hverify⟩
            · rintro ⟨payload, hpath, hverify⟩
              cases hpath with
              | head =>
                  have hcanonical :
                      parseCandidate? (a history payload) =
                        some (history, payload) := parseCandidate?_a _ _
                  rw [hparse] at hcanonical
                  have hpair := Option.some.inj hcanonical
                  exact List.mem_cons.mpr
                    (Or.inl (congrArg Prod.fst hpair).symm)
              | tail _ hrest =>
                  exact List.mem_cons.mpr
                    (Or.inr (ih.mpr ⟨payload, hrest, hverify⟩))
          · have hdef :
                verifiedHistories verify seed (path :: rest) =
                  verifiedHistories verify seed rest := by
              simp [verifiedHistories, hparse, hverified]
            rw [hdef]
            rw [ih]
            constructor
            · rintro ⟨payload, hpath, hverify⟩
              exact ⟨payload, .tail path hpath, hverify⟩
            · rintro ⟨payload, hpath, hverify⟩
              cases hpath with
              | head =>
                  have hcanonical :
                      parseCandidate? (a history payload) =
                        some (history, payload) := parseCandidate?_a _ _
                  rw [hparse] at hcanonical
                  have hpair := Option.some.inj hcanonical
                  have hhistory : parsedHistory = history :=
                    congrArg Prod.fst hpair
                  have hpayload : parsedPayload = payload :=
                    congrArg Prod.snd hpair
                  rw [hhistory, hpayload, hverify] at hverified
                  exact False.elim (hverified rfl)
              | tail _ hrest => exact ⟨payload, hrest, hverify⟩

/-- Extract the frozen bitstring from an exact public header. -/
def headerBits? (term : Term) : Option BitWord :=
  match parseHeader? term with
  | none => none
  | some view => decodeN? view.seed

@[simp]
theorem headerBits?_seededHeader (bits : BitWord) (body : Term) :
    headerBits? (seededHeader bits body) = some bits := by
  simp [headerBits?, seededHeader, decodeN?_N]

/-- Finite verified histories obtained from the current unannotated term. -/
def projectedGenerators (verify : CertificateVerifier) (term : Term) :
    List BitWord :=
  match headerBits? term with
  | none => []
  | some seed => verifiedHistories verify seed (anchoredOpenedPaths term)

/--
The total structural projection.  Malformed headers project to the empty
ideal; well-formed terms are parsed, verified, and ancestor-closed.
-/
def projection (verify : CertificateVerifier) (term : Term) : HistoryIdeal :=
  idealOf (projectedGenerators verify term)

/-- Exact all-input semantics of the total projection. -/
theorem projection_contains_iff
    (verify : CertificateVerifier) (term : Term) (small : BitWord) :
    (projection verify term).Contains small <->
      exists seed history payload,
        headerBits? term = some seed /\
        List.Mem (a history payload) (anchoredOpenedPaths term) /\
        verify seed history payload = true /\
        WordPrefix small history := by
  rw [projection, idealOf_contains_iff]
  constructor
  · rintro ⟨history, hhistory, hprefix⟩
    cases hseed : headerBits? term with
    | none =>
        simp [projectedGenerators, hseed] at hhistory
        cases hhistory
    | some seed =>
        have hhistory' : List.Mem history
            (verifiedHistories verify seed (anchoredOpenedPaths term)) := by
          simpa [projectedGenerators, hseed] using hhistory
        obtain ⟨payload, hpath, hverify⟩ :=
          (mem_verifiedHistories_iff verify seed history
            (anchoredOpenedPaths term)).mp hhistory'
        exact ⟨seed, history, payload, rfl, hpath, hverify, hprefix⟩
  · rintro ⟨seed, history, payload, hseed, hpath, hverify, hprefix⟩
    refine ⟨history, ?_, hprefix⟩
    have hmem := (mem_verifiedHistories_iff verify seed history
      (anchoredOpenedPaths term)).mpr ⟨payload, hpath, hverify⟩
    simpa [projectedGenerators, hseed] using hmem

/-- Seed-specialized exact projection semantics below a literal header. -/
theorem projection_seededHeader_contains_iff
    (verify : CertificateVerifier) (bits : BitWord) (body : Term)
    (small : BitWord) :
    (projection verify (seededHeader bits body)).Contains small <->
      exists history payload,
        List.Mem (a history payload)
          (anchoredOpenedPaths (seededHeader bits body)) /\
        verify bits history payload = true /\
        WordPrefix small history := by
  rw [projection_contains_iff]
  constructor
  · rintro ⟨seed, history, payload, hseed, hpath, hverify, hprefix⟩
    rw [headerBits?_seededHeader] at hseed
    cases hseed
    exact ⟨history, payload, hpath, hverify, hprefix⟩
  · rintro ⟨history, payload, hpath, hverify, hprefix⟩
    exact ⟨bits, history, payload, headerBits?_seededHeader bits body,
      hpath, hverify, hprefix⟩

/-! ## Whole-edge and finite-reduction monotonicity -/

/-- One arbitrary contraction below a frozen seed monotonically grows projection. -/
theorem projection_seededHeader_step_mono
    (verify : CertificateVerifier) {bits : BitWord} {body target : Term}
    (hstep : Step (seededHeader bits body) target) :
    (projection verify (seededHeader bits body)).LE (projection verify target) := by
  rcases seededHeader_step_preserves hstep with ⟨body', hbodyStep, htarget⟩
  subst target
  intro small hsmall
  obtain ⟨history, payload, hpath, hverify, hprefix⟩ :=
    (projection_seededHeader_contains_iff verify bits body small).mp hsmall
  have hopen : anchoredOpenedAt? (seededHeader bits body)
      (a history payload) = true :=
    (mem_anchoredOpenedPaths_iff_anchoredOpenedAt? _ _).mp hpath
  have hopen' : anchoredOpenedAt? (seededHeader bits body')
      (a history payload) = true :=
    seededHeader_anchoredOpenedAt?_step_mono hopen
      (by simpa only [seededHeader] using!
        Step.appRight (.app .s (N bits)) hbodyStep)
  apply (projection_seededHeader_contains_iff verify bits body' small).mpr
  exact ⟨history, payload,
    (mem_anchoredOpenedPaths_iff_anchoredOpenedAt? _ _).mpr hopen',
    hverify, hprefix⟩

/-- Every finite unrestricted reduction below the frozen seed is monotone. -/
theorem projection_seededHeader_steps_mono
    (verify : CertificateVerifier) {bits : BitWord} {body target : Term}
    (hsteps : Steps (seededHeader bits body) target) :
    (projection verify (seededHeader bits body)).LE (projection verify target) := by
  rcases seededHeader_steps_preserves hsteps with ⟨body', hbodySteps, htarget⟩
  subst target
  intro small hsmall
  obtain ⟨history, payload, hpath, hverify, hprefix⟩ :=
    (projection_seededHeader_contains_iff verify bits body small).mp hsmall
  have hopen : anchoredOpenedAt? (seededHeader bits body)
      (a history payload) = true :=
    (mem_anchoredOpenedPaths_iff_anchoredOpenedAt? _ _).mp hpath
  have hopen' : anchoredOpenedAt? (seededHeader bits body')
      (a history payload) = true :=
    seededHeader_anchoredOpenedAt?_steps_mono hopen
      (by simpa only [seededHeader, Context.plug] using!
        hbodySteps.inContext (.appRight (.app .s (N bits)) .hole))
  apply (projection_seededHeader_contains_iff verify bits body' small).mpr
  exact ⟨history, payload,
    (mem_anchoredOpenedPaths_iff_anchoredOpenedAt? _ _).mpr hopen',
    hverify, hprefix⟩

/-- Whole-one-step form for any term in the concrete encoder's reduction cone. -/
theorem projection_step_mono_on_encoder_cone
    (verify : CertificateVerifier) {bits : BitWord} {source target : Term}
    (hreach : Steps (encoder bits) source) (hstep : Step source target) :
    (projection verify source).LE (projection verify target) := by
  rcases encoder_steps_preserves hreach with ⟨body, hbody, hsource⟩
  subst source
  exact projection_seededHeader_step_mono verify hstep

/-- Finite-reduction form from any term in the concrete encoder's cone. -/
theorem projection_steps_mono_on_encoder_cone
    (verify : CertificateVerifier) {bits : BitWord} {source target : Term}
    (hreach : Steps (encoder bits) source) (hsteps : Steps source target) :
    (projection verify source).LE (projection verify target) := by
  rcases encoder_steps_preserves hreach with ⟨body, hbody, hsource⟩
  subst source
  exact projection_seededHeader_steps_mono verify hsteps

/-! ## Verifier contracts and finite event batches -/

/-- Every verifier-accepted witness denotes a genuine source history. -/
def VerifierSound (verify : CertificateVerifier)
    (Valid : BitWord -> BitWord -> Prop) : Prop :=
  forall seed history payload,
    verify seed history payload = true -> Valid seed history

/-- Validity is inherited by every literal history prefix. -/
def ValidPrefixClosed (Valid : BitWord -> BitWord -> Prop) : Prop :=
  forall seed small large,
    Valid seed large -> WordPrefix small large -> Valid seed small

/-- Every member of a sound projected ideal is a genuine history. -/
theorem projection_contains_valid
    {verify : CertificateVerifier} {Valid : BitWord -> BitWord -> Prop}
    (hsound : VerifierSound verify Valid)
    (hclosed : ValidPrefixClosed Valid)
    {bits : BitWord} {body : Term} {history : BitWord}
    (hmem : (projection verify (seededHeader bits body)).Contains history) :
    Valid bits history := by
  obtain ⟨large, payload, hpath, hverify, hprefix⟩ :=
    (projection_seededHeader_contains_iff verify bits body history).mp hmem
  exact hclosed bits history large (hsound bits large payload hverify) hprefix

/-- Executable equality on finite Boolean words. -/
def sameWord : BitWord -> BitWord -> Bool
  | [], [] => true
  | [], _ :: _ => false
  | _ :: _, [] => false
  | left :: leftRest, right :: rightRest =>
      (left == right) && sameWord leftRest rightRest

/-- Exactness of executable word equality. -/
theorem sameWord_eq_true_iff (left right : BitWord) :
    sameWord left right = true <-> left = right := by
  induction left generalizing right with
  | nil =>
      cases right <;> simp [sameWord]
  | cons bit rest ih =>
      cases right with
      | nil => simp [sameWord]
      | cons other otherRest =>
          cases bit <;> cases other <;>
            simp [sameWord, ih]

/-- Executable membership in a finite Boolean-word list. -/
def wordOccurs (word : BitWord) : List BitWord -> Bool
  | [] => false
  | first :: rest => sameWord word first || wordOccurs word rest

/-- Exactness of executable finite word membership. -/
theorem wordOccurs_eq_true_iff (word : BitWord) (words : List BitWord) :
    wordOccurs word words = true <-> List.Mem word words := by
  induction words with
  | nil =>
      constructor
      · intro h
        cases h
      · intro h
        cases h
  | cons first rest ih =>
      rw [wordOccurs, Bool.or_eq_true, sameWord_eq_true_iff, ih]
      exact List.mem_cons.symm

/-- Remove from a finite list every value already represented by `blocked`. -/
def listDifference (blocked : List BitWord) : List BitWord -> List BitWord
  | [] => []
  | value :: rest =>
      if wordOccurs value blocked then listDifference blocked rest
      else value :: listDifference blocked rest

/-- Exact semantic membership in the duplicate-tolerant finite difference. -/
theorem mem_listDifference_iff (blocked candidates : List BitWord)
    (history : BitWord) :
    List.Mem history (listDifference blocked candidates) <->
      List.Mem history candidates /\ Not (List.Mem history blocked) := by
  induction candidates with
  | nil =>
      constructor
      · intro h
        cases h
      · rintro ⟨h, _⟩
        cases h
  | cons value rest ih =>
      cases hoccurs : wordOccurs value blocked with
      | true =>
        have hvalue : List.Mem value blocked :=
          (wordOccurs_eq_true_iff value blocked).mp hoccurs
        have hdef : listDifference blocked (value :: rest) =
            listDifference blocked rest := by
          simp [listDifference, hoccurs]
        rw [hdef]
        constructor
        · intro hdiff
          have hrest := ih.mp hdiff
          exact ⟨.tail value hrest.1, hrest.2⟩
        · rintro ⟨hmem, hnot⟩
          rcases List.mem_cons.mp hmem with heq | hrest
          · cases heq
            exact False.elim (hnot hvalue)
          · exact ih.mpr ⟨hrest, hnot⟩
      | false =>
        have hvalue : Not (List.Mem value blocked) := by
          intro hmem
          have : wordOccurs value blocked = true :=
            (wordOccurs_eq_true_iff value blocked).mpr hmem
          rw [hoccurs] at this
          cases this
        have hdef : listDifference blocked (value :: rest) =
            value :: listDifference blocked rest := by
          simp [listDifference, hoccurs]
        rw [hdef]
        constructor
        · intro hmem
          rcases List.mem_cons.mp hmem with heq | hrest
          · cases heq
            exact ⟨.head _, hvalue⟩
          · have htail := ih.mp hrest
            exact ⟨.tail value htail.1, htail.2⟩
        · rintro ⟨hmem, hnot⟩
          rcases List.mem_cons.mp hmem with heq | hrest
          · exact List.mem_cons.mpr (Or.inl heq)
          · exact List.mem_cons.mpr (Or.inr (ih.mpr ⟨hrest, hnot⟩))

/-- Constructive duplicate removal specialized to literal Boolean words. -/
def uniqueWords : List BitWord -> List BitWord
  | [] => []
  | first :: rest =>
      if wordOccurs first rest then uniqueWords rest
      else first :: uniqueWords rest

/-- Duplicate removal preserves exact semantic membership. -/
theorem mem_uniqueWords_iff (history : BitWord) (words : List BitWord) :
    List.Mem history (uniqueWords words) <-> List.Mem history words := by
  induction words with
  | nil =>
      constructor <;> intro h <;> cases h
  | cons first rest ih =>
      cases hoccurs : wordOccurs first rest with
      | true =>
          have hfirst : List.Mem first rest :=
            (wordOccurs_eq_true_iff first rest).mp hoccurs
          have hdef : uniqueWords (first :: rest) = uniqueWords rest := by
            simp [uniqueWords, hoccurs]
          rw [hdef, ih]
          constructor
          · exact List.Mem.tail first
          · intro hmem
            rcases List.mem_cons.mp hmem with heq | hrest
            · exact heq ▸ hfirst
            · exact hrest
      | false =>
          have hfirst : Not (List.Mem first rest) := by
            intro hmem
            have htrue := (wordOccurs_eq_true_iff first rest).mpr hmem
            rw [hoccurs] at htrue
            cases htrue
          have hdef : uniqueWords (first :: rest) =
              first :: uniqueWords rest := by
            simp [uniqueWords, hoccurs]
          rw [hdef]
          constructor
          · intro hmem
            rcases List.mem_cons.mp hmem with heq | hrest
            · exact List.mem_cons.mpr (Or.inl heq)
            · exact List.mem_cons.mpr (Or.inr (ih.mp hrest))
          · intro hmem
            rcases List.mem_cons.mp hmem with heq | hrest
            · exact List.mem_cons.mpr (Or.inl heq)
            · exact List.mem_cons.mpr (Or.inr (ih.mpr hrest))

/-- The specialized duplicate remover returns a canonical finite set list. -/
theorem uniqueWords_nodup (words : List BitWord) : (uniqueWords words).Nodup := by
  induction words with
  | nil => exact List.nodup_nil
  | cons first rest ih =>
      cases hoccurs : wordOccurs first rest with
      | true =>
          simpa [uniqueWords, hoccurs] using ih
      | false =>
          have hdef : uniqueWords (first :: rest) =
              first :: uniqueWords rest := by
            simp [uniqueWords, hoccurs]
          rw [hdef, List.nodup_cons]
          refine ⟨?_, ih⟩
          intro hmem
          have hrest : List.Mem first rest :=
            (mem_uniqueWords_iff first rest).mp hmem
          have htrue := (wordOccurs_eq_true_iff first rest).mpr hrest
          rw [hoccurs] at htrue
          cases htrue

/-- Prefixing never increases literal word length. -/
theorem wordPrefix_length_le {small large : BitWord}
    (hprefix : WordPrefix small large) : small.length <= large.length := by
  induction hprefix with
  | nil => exact Nat.zero_le _
  | cons bit htail ih => exact Nat.succ_le_succ ih

/-- A proper literal prefix has strictly smaller length. -/
theorem properWordPrefix_length_lt {small large : BitWord}
    (hproper : ProperWordPrefix small large) : small.length < large.length := by
  have hle := wordPrefix_length_le hproper.1
  exact Nat.lt_of_le_of_ne hle (by
    intro hlen
    exact hproper.2 (WordPrefix.eq_of_length_eq hproper.1 hlen))

/--
A finite batch that can be ordered canonically by history length.  The
`ancestorReady` clause says every strict ancestor is already present or is a
strictly lower-rank member of the same finite batch.
-/
def RankOrderedBatch (Valid : BitWord -> Prop)
    (before after : HistoryIdeal) : Prop :=
  exists events : List BitWord,
    events.Nodup /\
    before.LE after /\
    (forall history,
      after.Contains history <->
        before.Contains history \/ List.Mem history events) /\
    (forall {history}, List.Mem history events ->
      Valid history /\ Not (before.Contains history)) /\
    (forall {small large},
      List.Mem large events -> ProperWordPrefix small large ->
        before.Contains small \/
          (List.Mem small events /\ small.length < large.length))

/-- Every finite ideal extension by valid histories has a rank-ordered batch. -/
theorem exists_rankOrderedBatch
    {Valid : BitWord -> Prop} {before after : HistoryIdeal}
    (hle : before.LE after)
    (hvalid : forall history, after.Contains history -> Valid history) :
    RankOrderedBatch Valid before after := by
  let events := uniqueWords (listDifference before.entries after.entries)
  refine ⟨events, uniqueWords_nodup _, hle, ?_, ?_, ?_⟩
  · intro history
    constructor
    · intro hafter
      cases hoccurs : wordOccurs history before.entries with
      | true =>
          exact Or.inl ((wordOccurs_eq_true_iff history before.entries).mp hoccurs)
      | false =>
          have hbefore : Not (before.Contains history) := by
            intro hmem
            have htrue := (wordOccurs_eq_true_iff history before.entries).mpr hmem
            rw [hoccurs] at htrue
            cases htrue
          exact Or.inr ((mem_uniqueWords_iff history _).mpr
            ((mem_listDifference_iff before.entries after.entries history).mpr
              ⟨hafter, hbefore⟩))
    · intro h
      cases h with
      | inl hbefore => exact hle history hbefore
      | inr hevent =>
          exact (mem_listDifference_iff before.entries after.entries history).mp
            ((mem_uniqueWords_iff history _).mp hevent) |>.1
  · intro history hevent
    have hdiff :=
      (mem_listDifference_iff before.entries after.entries history).mp
        ((mem_uniqueWords_iff history _).mp hevent)
    exact ⟨hvalid history hdiff.1, hdiff.2⟩
  · intro small large hlarge hproper
    have hlargeAfter : after.Contains large :=
      (mem_listDifference_iff before.entries after.entries large).mp
        ((mem_uniqueWords_iff large _).mp hlarge) |>.1
    have hsmallAfter : after.Contains small :=
      after.contains_ancestor hlargeAfter hproper.1
    cases hoccurs : wordOccurs small before.entries with
    | true =>
        exact Or.inl ((wordOccurs_eq_true_iff small before.entries).mp hoccurs)
    | false =>
        have hsmallBefore : Not (before.Contains small) := by
          intro hmem
          have htrue := (wordOccurs_eq_true_iff small before.entries).mpr hmem
          rw [hoccurs] at htrue
          cases htrue
        exact Or.inr ⟨
          (mem_uniqueWords_iff small _).mpr
            ((mem_listDifference_iff before.entries after.entries small).mpr
              ⟨hsmallAfter, hsmallBefore⟩),
          properWordPrefix_length_lt hproper⟩

/-- Every raw edge in the encoder cone is a finite batch of genuine events. -/
theorem projection_step_genuine_batch
    {verify : CertificateVerifier} {Valid : BitWord -> BitWord -> Prop}
    (hsound : VerifierSound verify Valid)
    (hclosed : ValidPrefixClosed Valid)
    {bits : BitWord} {source target : Term}
    (hreach : Steps (encoder bits) source) (hstep : Step source target) :
    RankOrderedBatch (Valid bits) (projection verify source)
      (projection verify target) := by
  have hle := projection_step_mono_on_encoder_cone verify hreach hstep
  have htargetReach : Steps (encoder bits) target :=
    Steps.tail hreach hstep
  rcases encoder_steps_preserves htargetReach with ⟨body, hbody, htarget⟩
  subst target
  exact exists_rankOrderedBatch hle (fun history hmem =>
    projection_contains_valid hsound hclosed hmem)

/-- Finite reductions likewise admit one finite rank-ordered genuine batch. -/
theorem projection_steps_genuine_batch
    {verify : CertificateVerifier} {Valid : BitWord -> BitWord -> Prop}
    (hsound : VerifierSound verify Valid)
    (hclosed : ValidPrefixClosed Valid)
    {bits : BitWord} {source target : Term}
    (hreach : Steps (encoder bits) source) (hsteps : Steps source target) :
    RankOrderedBatch (Valid bits) (projection verify source)
      (projection verify target) := by
  have hle := projection_steps_mono_on_encoder_cone verify hreach hsteps
  have htargetReach := Steps.trans hreach hsteps
  rcases encoder_steps_preserves htargetReach with ⟨body, hbody, htarget⟩
  subst target
  exact exists_rankOrderedBatch hle (fun history hmem =>
    projection_contains_valid hsound hclosed hmem)

/-! ## Exact canonical range under an explicit verifier contract -/

/-- Every genuine history has the supplied canonical accepted payload. -/
def VerifierComplete (verify : CertificateVerifier)
    (Valid : BitWord -> BitWord -> Prop)
    (witness : BitWord -> BitWord -> BitWord) : Prop :=
  forall seed history,
    Valid seed history -> verify seed history (witness seed history) = true

/-- A genuine history has no accepted payload other than the supplied witness. -/
def VerifierUnique (verify : CertificateVerifier)
    (Valid : BitWord -> BitWord -> Prop)
    (witness : BitWord -> BitWord -> BitWord) : Prop :=
  forall seed history payload,
    Valid seed history -> verify seed history payload = true ->
      payload = witness seed history

/-- Every represented member of an ideal is genuine for the frozen seed. -/
def IdealValid (Valid : BitWord -> BitWord -> Prop)
    (seed : BitWord) (ideal : HistoryIdeal) : Prop :=
  forall history, ideal.Contains history -> Valid seed history

/-- Attach the canonical payload to every explicit entry of a finite ideal. -/
def selectedWitnesses (witness : BitWord -> BitWord -> BitWord)
    (seed : BitWord) : List BitWord -> List (BitWord × BitWord)
  | [] => []
  | history :: rest =>
      (history, witness seed history) :: selectedWitnesses witness seed rest

/-- Exact membership in the canonical witness list. -/
theorem mem_selectedWitnesses_iff
    (witness : BitWord -> BitWord -> BitWord) (seed : BitWord)
    (histories : List BitWord) (history payload : BitWord) :
    List.Mem (history, payload) (selectedWitnesses witness seed histories) <->
      List.Mem history histories /\ payload = witness seed history := by
  induction histories with
  | nil =>
      constructor
      · intro h
        cases h
      · rintro ⟨h, _⟩
        cases h
  | cons first rest ih =>
      simp only [selectedWitnesses]
      constructor
      · intro hmem
        rcases List.mem_cons.mp hmem with heq | htail
        · have hhistory : history = first := congrArg Prod.fst heq
          have hpayload : payload = witness seed first := congrArg Prod.snd heq
          subst history
          exact ⟨.head _, hpayload⟩
        · obtain ⟨hhistory, hpayload⟩ := ih.mp htail
          exact ⟨.tail first hhistory, hpayload⟩
      · rintro ⟨hhistory, hpayload⟩
        rcases List.mem_cons.mp hhistory with heq | htail
        · subst history
          rw [hpayload]
          exact List.Mem.head _
        · exact List.Mem.tail _ (ih.mpr ⟨htail, hpayload⟩)

/-- Canonical protected-trie checkpoint for a finite ideal and prepared frontier. -/
def idealCheckpoint (bits : BitWord)
    (witness : BitWord -> BitWord -> BitWord) (ideal : HistoryIdeal)
    (frontier : List (BitWord × BitWord)) : Term :=
  seededPreparedBuild bits
    (selectedWitnesses witness bits ideal.entries) frontier

/--
Exact projection range of the canonical checkpoint.  Every hypothesis is an
explicit obligation for the later concrete tableau module; no imported source
theorem is hidden in this result.
-/
theorem projection_idealCheckpoint_equivalent
    {verify : CertificateVerifier}
    {Valid : BitWord -> BitWord -> Prop}
    {witness : BitWord -> BitWord -> BitWord}
    (hsound : VerifierSound verify Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (hunique : VerifierUnique verify Valid witness)
    (bits : BitWord) (ideal : HistoryIdeal)
    (hideal : IdealValid Valid bits ideal)
    (frontier : List (BitWord × BitWord)) :
    (projection verify (idealCheckpoint bits witness ideal frontier)).Equivalent
      ideal := by
  intro small
  constructor
  · intro hsmall
    obtain ⟨history, payload, hpath, hverify, hprefix⟩ :=
      (projection_seededHeader_contains_iff verify bits
        (buildAt 0
          (treeOfPrefixSet (preparedPrefixSet
            (selectedWitnesses witness bits ideal.entries) frontier)))
        small).mp (by simpa [idealCheckpoint, seededPreparedBuild,
          seededPrefixBuild, seededBuild] using hsmall)
    have hselected : List.Mem (history, payload)
        (selectedWitnesses witness bits ideal.entries) :=
      (candidate_mem_seededPreparedBuild_iff bits history payload
        (selectedWitnesses witness bits ideal.entries) frontier).mp
        (by simpa [idealCheckpoint] using! hpath)
    obtain ⟨hhistory, hpayloadSelected⟩ :=
      (mem_selectedWitnesses_iff witness bits ideal.entries
        history payload).mp hselected
    have hvalid : Valid bits history := hsound bits history payload hverify
    have hpayloadUnique : payload = witness bits history :=
      hunique bits history payload hvalid hverify
    have _hagrees : hpayloadSelected = hpayloadUnique := rfl
    exact ideal.contains_ancestor hhistory hprefix
  · intro hsmall
    have hvalid : Valid bits small := hideal small hsmall
    have hverify : verify bits small (witness bits small) = true :=
      hcomplete bits small hvalid
    have hselected : List.Mem (small, witness bits small)
        (selectedWitnesses witness bits ideal.entries) :=
      (mem_selectedWitnesses_iff witness bits ideal.entries
        small (witness bits small)).mpr ⟨hsmall, rfl⟩
    have hpath : List.Mem (a small (witness bits small))
        (anchoredOpenedPaths (idealCheckpoint bits witness ideal frontier)) :=
      (candidate_mem_seededPreparedBuild_iff bits small (witness bits small)
        (selectedWitnesses witness bits ideal.entries) frontier).mpr hselected
    apply (projection_contains_iff verify
      (idealCheckpoint bits witness ideal frontier) small).mpr
    exact ⟨bits, small, witness bits small,
      by simp [idealCheckpoint, seededPreparedBuild, seededPrefixBuild,
        seededBuild, headerBits?],
      hpath, hverify, WordPrefix.refl small⟩

/-! ## Coherent canonical certificate insertion -/

/-- Promoting one prepared certificate is one coherent canonical reduction. -/
theorem seededPreparedBuild_steps_promote
    (bits : BitWord) (pair : BitWord × BitWord)
    (chosen frontier : List (BitWord × BitWord)) :
    Steps (seededPreparedBuild bits chosen frontier)
      (seededPreparedBuild bits (pair :: chosen) frontier) := by
  apply seededPrefixBuild_steps_of_contains bits
  intro path hcontains
  obtain ⟨endpoint, hgenerator, hprefix⟩ := hcontains
  refine ⟨endpoint, ?_, hprefix⟩
  exact List.Mem.tail (a pair.1 pair.2) hgenerator

/-- A history absent from an ideal but with all strict ancestors present. -/
def HistoryFrontier (ideal : HistoryIdeal) (history : BitWord) : Prop :=
  Not (ideal.Contains history) /\
    forall small, ProperWordPrefix small history -> ideal.Contains small

/-- Adjoin one frontier history while retaining explicit ancestor closure. -/
def insertFrontier (ideal : HistoryIdeal) (history : BitWord)
    (hfrontier : HistoryFrontier ideal history) : HistoryIdeal where
  entries := history :: ideal.entries
  ancestorClosed := by
    intro small large hlarge hprefix
    rcases List.mem_cons.mp hlarge with heq | hold
    · subst large
      by_cases heqSmall : small = history
      · subst small
        exact List.Mem.head _
      · exact List.Mem.tail history
          (hfrontier.2 small ⟨hprefix, heqSmall⟩)
    · exact List.Mem.tail history (ideal.ancestorClosed hold hprefix)

/-- Exact semantic effect of inserting one frontier history. -/
theorem insertFrontier_contains_iff (ideal : HistoryIdeal) (history : BitWord)
    (hfrontier : HistoryFrontier ideal history) (query : BitWord) :
    (insertFrontier ideal history hfrontier).Contains query <->
      query = history \/ ideal.Contains query :=
  List.mem_cons

/-- Inserting a genuine frontier history preserves ideal validity. -/
theorem insertFrontier_idealValid
    {Valid : BitWord -> BitWord -> Prop} {bits : BitWord}
    {ideal : HistoryIdeal} {history : BitWord}
    (hideal : IdealValid Valid bits ideal)
    (hvalid : Valid bits history)
    (hfrontier : HistoryFrontier ideal history) :
    IdealValid Valid bits (insertFrontier ideal history hfrontier) := by
  intro query hquery
  rcases (insertFrontier_contains_iff ideal history hfrontier query).mp hquery with
    heq | hold
  · subst query
    exact hvalid
  · exact hideal query hold

/-- Canonical source checkpoint with one complete frontier path prepared. -/
def frontierCheckpoint (bits : BitWord)
    (witness : BitWord -> BitWord -> BitWord)
    (ideal : HistoryIdeal) (history : BitWord) : Term :=
  idealCheckpoint bits witness ideal [(history, witness bits history)]

/-- Canonical checkpoints for a frontier event are coherently connected. -/
theorem idealCheckpoint_steps_insertFrontier
    (bits : BitWord) (witness : BitWord -> BitWord -> BitWord)
    (ideal : HistoryIdeal) (history : BitWord)
    (hfrontier : HistoryFrontier ideal history)
    (prepared : List (BitWord × BitWord)) :
    Steps
      (idealCheckpoint bits witness ideal prepared)
      (idealCheckpoint bits witness
        (insertFrontier ideal history hfrontier) prepared) := by
  simpa [idealCheckpoint, insertFrontier, selectedWitnesses] using
    seededPreparedBuild_steps_promote bits
      (history, witness bits history)
      (selectedWitnesses witness bits ideal.entries) prepared

/--
State-level coherent macrostep for one genuine frontier event.  The source and
target are the exact canonical projections of the two adjacent ideals; the
same prepared frontier path is retained at both endpoints.
-/
theorem frontierCheckpoint_exact_macrostep
    {verify : CertificateVerifier}
    {Valid : BitWord -> BitWord -> Prop}
    {witness : BitWord -> BitWord -> BitWord}
    (hsound : VerifierSound verify Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (hunique : VerifierUnique verify Valid witness)
    (bits : BitWord) (ideal : HistoryIdeal)
    (hideal : IdealValid Valid bits ideal)
    (history : BitWord) (hvalid : Valid bits history)
    (hfrontier : HistoryFrontier ideal history) :
    Steps (frontierCheckpoint bits witness ideal history)
      (frontierCheckpoint bits witness
        (insertFrontier ideal history hfrontier) history) /\
    (projection verify (frontierCheckpoint bits witness ideal history)).Equivalent
      ideal /\
    (projection verify (frontierCheckpoint bits witness
      (insertFrontier ideal history hfrontier) history)).Equivalent
        (insertFrontier ideal history hfrontier) := by
  refine ⟨?_, ?_, ?_⟩
  · simpa [frontierCheckpoint] using
      idealCheckpoint_steps_insertFrontier bits witness ideal history hfrontier
        [(history, witness bits history)]
  · exact projection_idealCheckpoint_equivalent hsound hcomplete hunique
      bits ideal hideal [(history, witness bits history)]
  · exact projection_idealCheckpoint_equivalent hsound hcomplete hunique
      bits (insertFrontier ideal history hfrontier)
      (insertFrontier_idealValid hideal hvalid hfrontier)
      [(history, witness bits history)]

/-! ## Exact final-edge projection delta -/

/-- Parser equivalence at every path implies semantic projection equivalence. -/
theorem projection_equivalent_of_openedAt_equiv
    (verify : CertificateVerifier) (bits : BitWord)
    (before after : Term)
    (hequiv : forall query, OpenedAt after query <-> OpenedAt before query) :
    (projection verify (seededHeader bits after)).Equivalent
      (projection verify (seededHeader bits before)) := by
  intro small
  constructor
  · intro hsmall
    obtain ⟨history, payload, hpath, hverify, hprefix⟩ :=
      (projection_seededHeader_contains_iff verify bits after small).mp hsmall
    have hopenAfter : OpenedAt after (a history payload) :=
      (mem_anchoredOpenedPaths_header_iff (N bits) after _).mp
        (by simpa [seededHeader] using hpath)
    have hopenBefore := (hequiv (a history payload)).mp hopenAfter
    apply (projection_seededHeader_contains_iff verify bits before small).mpr
    exact ⟨history, payload,
      by simpa [seededHeader] using
        (mem_anchoredOpenedPaths_header_iff (N bits) before _).mpr hopenBefore,
      hverify, hprefix⟩
  · intro hsmall
    obtain ⟨history, payload, hpath, hverify, hprefix⟩ :=
      (projection_seededHeader_contains_iff verify bits before small).mp hsmall
    have hopenBefore : OpenedAt before (a history payload) :=
      (mem_anchoredOpenedPaths_header_iff (N bits) before _).mp
        (by simpa [seededHeader] using hpath)
    have hopenAfter := (hequiv (a history payload)).mpr hopenBefore
    apply (projection_seededHeader_contains_iff verify bits after small).mpr
    exact ⟨history, payload,
      by simpa [seededHeader] using
        (mem_anchoredOpenedPaths_header_iff (N bits) after _).mpr hopenAfter,
      hverify, hprefix⟩

/--
If one final opening adds exactly one accepted candidate path, projection adds
exactly that history and its ancestors.  Existing certificates are untouched.
-/
theorem projection_delta_of_openedAt_singleton
    (verify : CertificateVerifier) (bits history payload : BitWord)
    (before after : Term)
    (hdelta : forall query,
      OpenedAt after query <->
        OpenedAt before query \/ query = a history payload)
    (hverify : verify bits history payload = true)
    (small : BitWord) :
    (projection verify (seededHeader bits after)).Contains small <->
      (projection verify (seededHeader bits before)).Contains small \/
        WordPrefix small history := by
  constructor
  · intro hsmall
    obtain ⟨found, foundPayload, hpath, hfoundVerify, hprefix⟩ :=
      (projection_seededHeader_contains_iff verify bits after small).mp hsmall
    have hopenAfter : OpenedAt after (a found foundPayload) :=
      (mem_anchoredOpenedPaths_header_iff (N bits) after _).mp
        (by simpa [seededHeader] using hpath)
    rcases (hdelta (a found foundPayload)).mp hopenAfter with
      hopenBefore | heq
    · exact Or.inl ((projection_seededHeader_contains_iff verify bits before small).mpr
        ⟨found, foundPayload,
          by simpa [seededHeader] using
            (mem_anchoredOpenedPaths_header_iff (N bits) before _).mpr hopenBefore,
          hfoundVerify, hprefix⟩)
    · have hpair : (found, foundPayload) = (history, payload) :=
        a_injective heq
      have hhistory : found = history := congrArg Prod.fst hpair
      exact Or.inr (by simpa [hhistory] using hprefix)
  · intro h
    cases h with
    | inl hold =>
        obtain ⟨found, foundPayload, hpath, hfoundVerify, hprefix⟩ :=
          (projection_seededHeader_contains_iff verify bits before small).mp hold
        have hopenBefore : OpenedAt before (a found foundPayload) :=
          (mem_anchoredOpenedPaths_header_iff (N bits) before _).mp
            (by simpa [seededHeader] using hpath)
        apply (projection_seededHeader_contains_iff verify bits after small).mpr
        exact ⟨found, foundPayload,
          by simpa [seededHeader] using
            (mem_anchoredOpenedPaths_header_iff (N bits) after _).mpr
              ((hdelta _).mpr (Or.inl hopenBefore)),
          hfoundVerify, hprefix⟩
    | inr hprefix =>
        apply (projection_seededHeader_contains_iff verify bits after small).mpr
        have hopenAfter : OpenedAt after (a history payload) :=
          (hdelta _).mpr (Or.inr rfl)
        exact ⟨history, payload,
          by simpa [seededHeader] using
            (mem_anchoredOpenedPaths_header_iff (N bits) after _).mpr hopenAfter,
          hverify, hprefix⟩

/-! ## Six-step positive macro: proper stutter, singleton final event -/

/-- Every proper positive stage is a projection stutter below the frozen seed. -/
theorem positiveProper_projection_stutter
    (verify : CertificateVerifier) (bits : BitWord)
    {path : BitWord} (context : ProtectedFieldContext path)
    (m n : Nat) (stage : PositiveProperStage) :
    (projection verify
        (seededHeader bits (context.plug (positiveProperTerm m n stage)))).Equivalent
      (projection verify (seededHeader bits (context.plug (positive0 m n)))) :=
  projection_equivalent_of_openedAt_equiv verify bits _ _
    (positiveProper_openedAt_stutter context m n stage)

/-- The final positive edge adds exactly the accepted designated certificate. -/
theorem positive_final_projection_event
    (verify : CertificateVerifier) (bits history payload : BitWord)
    {path : BitWord} (context : ProtectedFieldContext path)
    (m n : Nat) (hpath : path = a history payload)
    (hverify : verify bits history payload = true) :
    Step
        (seededHeader bits (context.plug (positive5 m n)))
        (seededHeader bits (context.plug (opened m n))) /\
      forall small,
        (projection verify
            (seededHeader bits (context.plug (opened m n)))).Contains small <->
          (projection verify
            (seededHeader bits (context.plug (positive5 m n)))).Contains small \/
            WordPrefix small history := by
  refine ⟨by
    simpa [seededHeader, header, passive] using
      Step.appRight (.app .s (N bits))
        (positive_final_step_in_field context m n), ?_⟩
  intro small
  apply projection_delta_of_openedAt_singleton verify bits history payload
  · intro query
    simpa [hpath] using
      (positive_last_step_exact_delta context m n).2 query
  · exact hverify

/-- The complete positive opening has exact length six below the frozen seed. -/
theorem positive_seeded_open_six
    (bits : BitWord) {path : BitWord}
    (context : ProtectedFieldContext path) (m n : Nat) :
    StepsN 6
      (seededHeader bits (context.plug (D (m + 1) (n + 2))))
      (seededHeader bits (context.plug (opened m n))) := by
  simpa [seededHeader, header, passive] using
    StepsN.appRight (.app .s (N bits))
      (positive_open_six_in_field context m n)

/-! ## Seven-step zero macro: proper stutter, singleton final event -/

/-- Every proper reset-branch stage is a projection stutter. -/
theorem zeroProper_projection_stutter
    (verify : CertificateVerifier) (bits : BitWord)
    {path : BitWord} (context : ProtectedFieldContext path)
    (n : Nat) (stage : ZeroProperStage) :
    (projection verify
        (seededHeader bits (context.plug (zeroProperTerm n stage)))).Equivalent
      (projection verify (seededHeader bits (context.plug (D 0 (n + 2))))) :=
  projection_equivalent_of_openedAt_equiv verify bits _ _
    (zeroProper_openedAt_stutter context n stage)

/-- The final reset-branch edge adds exactly the accepted designated certificate. -/
theorem zero_final_projection_event
    (verify : CertificateVerifier) (bits history payload : BitWord)
    {path : BitWord} (context : ProtectedFieldContext path)
    (n : Nat) (hpath : path = a history payload)
    (hverify : verify bits history payload = true) :
    Step
        (seededHeader bits
          (context.plug (positive5 (n + 2) (n + 1))))
        (seededHeader bits
          (context.plug (opened (n + 2) (n + 1)))) /\
      forall small,
        (projection verify
            (seededHeader bits
              (context.plug (opened (n + 2) (n + 1))))).Contains small <->
          (projection verify
            (seededHeader bits
              (context.plug (positive5 (n + 2) (n + 1))))).Contains small \/
            WordPrefix small history := by
  refine ⟨by
    simpa [seededHeader, header, passive] using
      Step.appRight (.app .s (N bits))
        (zero_final_step_in_field context n), ?_⟩
  intro small
  apply projection_delta_of_openedAt_singleton verify bits history payload
  · intro query
    simpa [hpath] using
      (zero_last_step_exact_delta context n).2 query
  · exact hverify

/-- The complete reset branch has exact length seven below the frozen seed. -/
theorem zero_seeded_open_seven
    (bits : BitWord) {path : BitWord}
    (context : ProtectedFieldContext path) (n : Nat) :
    StepsN 7
      (seededHeader bits (context.plug (D 0 (n + 2))))
      (seededHeader bits (context.plug (opened (n + 2) (n + 1)))) := by
  simpa [seededHeader, header, passive] using
    StepsN.appRight (.app .s (N bits))
      (zero_open_seven_in_field context n)

end PureSFormal.Research.ProtectedTrieProjection
