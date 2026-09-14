import PureSFormal.Research.ProtectedTrieConfluence
import PureSFormal.Research.ProtectedTrieMachineCode
import PureSFormal.Research.ProtectedTrieProjection
import PureSFormal.Research.ProtectedTrieSubdivisionMeasure
import PureSFormal.Research.ProtectedTrieTableau

/-!
# Concrete strong protected-trie integration

This module connects the frozen protected trie to the explicit ordered-binary
machine and literal-tableau verifier.  The source instance is serialized in the
normal header.  The public projection receives only the current pure-`S` term,
recovers that header, parses literal candidate addresses, and checks their
supplied tableaux.
-/

namespace PureSFormal.Research.ProtectedTrieStrong

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieConfluence
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieFinitePrefix
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieParser
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieTableau

/-! ## Concrete verifier, validity predicate, witness, encoder, and projection -/

def sourceVerifier : CertificateVerifier :=
  fun bits history payload =>
    match decodeInstance? bits with
    | none => false
    | some source => verify source history payload

def SourceValid (bits history : BitWord) : Prop :=
  match decodeInstance? bits with
  | none => False
  | some source => ValidHistory source history

def sourceWitness (bits history : BitWord) : BitWord :=
  match decodeInstance? bits with
  | none => []
  | some source =>
      match canonicalTableau? source history with
      | none => []
      | some rows => encodeTableau rows

def strongEncoder (source : Instance) : Term :=
  encoder (encodeInstance source)

def strongProjection (term : Term) : HistoryIdeal :=
  projection sourceVerifier term

/-- The only varying part of the finite target encoder is its literal normal
source word; distinct ordered-binary instances have distinct target terms. -/
theorem strongEncoder_injective {left right : Instance}
    (heq : strongEncoder left = strongEncoder right) : left = right := by
  have hparsed := congrArg parseHeader? heq
  change (some (HeaderView.mk (N (encodeInstance left)) (D 2 2)) :
      Option HeaderView) =
    some (HeaderView.mk (N (encodeInstance right)) (D 2 2)) at hparsed
  have hview := Option.some.inj hparsed
  have hseed : N (encodeInstance left) = N (encodeInstance right) :=
    congrArg HeaderView.seed hview
  exact encodeInstance_injective (N_injective hseed)

/-- Every unrestricted reduct retains the same literal source seed and only
changes the protected generator body. -/
theorem strongEncoder_frozen_header (source : Instance) {term : Term}
    (hreach : Steps (strongEncoder source) term) :
    exists body, Steps (D 2 2) body /\
      term = seededHeader (encodeInstance source) body := by
  simpa [strongEncoder, seededHeader] using
    (encoder_steps_preserves hreach)

/-- Executable ordered child-enable test read from the concrete source machine. -/
def sourceEnabled (source : Instance) (history : BitWord) (slot : Bool) : Bool :=
  match run? source.machine (initialRow source) history with
  | none => false
  | some row =>
      match step? source.machine row slot with
      | none => false
      | some _ => true

/-- The executable child-enable bit is exactly validity of that child history. -/
theorem sourceEnabled_eq_true_iff (source : Instance)
    (history : BitWord) (slot : Bool) :
    sourceEnabled source history slot = true <->
      ValidHistory source (history ++ [slot]) := by
  unfold sourceEnabled ValidHistory
  rw [run?_append]
  cases hrun : run? source.machine (initialRow source) history with
  | none =>
      constructor
      · intro impossible; cases impossible
      · rintro ⟨final, impossible⟩; cases impossible
  | some row =>
      change (match step? source.machine row slot with
        | none => false
        | some _ => true) = true ↔
          ∃ final, (step? source.machine row slot).bind (fun next => some next) =
            some final
      cases hstep : step? source.machine row slot with
      | none =>
          constructor
          · intro impossible; cases impossible
          · rintro ⟨final, impossible⟩; cases impossible
      | some next => exact ⟨fun _ => ⟨next, rfl⟩, fun _ => rfl⟩

@[simp]
theorem anchoredOpenedPaths_strongEncoder (source : Instance) :
    anchoredOpenedPaths (strongEncoder source) = [] := rfl

/-- The finite initial target exposes no computation certificate. -/
theorem strongProjection_initial_empty (source : Instance) (history : BitWord) :
    ¬ (strongProjection (strongEncoder source)).Contains history := by
  intro hcontains
  obtain ⟨seed, large, payload, hseed, hpath, hverify, hprefix⟩ :=
    (projection_contains_iff sourceVerifier (strongEncoder source) history).mp
      hcontains
  rw [anchoredOpenedPaths_strongEncoder] at hpath
  cases hpath

theorem sourceVerifier_sound :
    VerifierSound sourceVerifier SourceValid := by
  intro bits history payload hverify
  cases hsource : decodeInstance? bits with
  | none => simp [sourceVerifier, hsource] at hverify
  | some source =>
      simpa [SourceValid, hsource] using
        (verify_sound (source := source) (history := history)
          (payload := payload) (by
            simpa [sourceVerifier, hsource] using hverify))

theorem sourceValid_prefixClosed : ValidPrefixClosed SourceValid := by
  intro bits small large hvalid hprefix
  cases hsource : decodeInstance? bits with
  | none => simp [SourceValid, hsource] at hvalid
  | some source =>
      have hlarge : ValidHistory source large := by
        simpa [SourceValid, hsource] using hvalid
      simpa [SourceValid, hsource] using valid_of_wordPrefix hprefix hlarge

theorem sourceVerifier_complete :
    VerifierComplete sourceVerifier SourceValid sourceWitness := by
  intro bits history hvalid
  cases hsource : decodeInstance? bits with
  | none => simp [SourceValid, hsource] at hvalid
  | some source =>
      have hsourceValid : ValidHistory source history := by
        simpa [SourceValid, hsource] using hvalid
      obtain ⟨rows, hrows⟩ :=
        (canonicalTableau?_exists_iff_valid source history).mpr hsourceValid
      simpa [sourceVerifier, sourceWitness, hsource, hrows] using
        ((verify_eq_true_iff_exists_rows source history _).mpr
          ⟨rows, hrows, rfl⟩)

theorem sourceVerifier_unique :
    VerifierUnique sourceVerifier SourceValid sourceWitness := by
  intro bits history payload hvalid hverify
  cases hsource : decodeInstance? bits with
  | none => simp [sourceVerifier, hsource] at hverify
  | some source =>
      have hverifySource : verify source history payload = true := by
        simpa [sourceVerifier, hsource] using hverify
      have hsourceValid : ValidHistory source history := by
        simpa [SourceValid, hsource] using hvalid
      obtain ⟨rows, hrows⟩ :=
        (canonicalTableau?_exists_iff_valid source history).mpr hsourceValid
      have hcanonical : verify source history (encodeTableau rows) = true :=
        (verify_eq_true_iff_exists_rows source history _).mpr
          ⟨rows, hrows, rfl⟩
      have hpayload := verify_witness_unique hverifySource hcanonical
      simpa [sourceWitness, hsource, hrows] using hpayload

@[simp]
theorem sourceValid_encoded_iff (source : Instance) (history : BitWord) :
    SourceValid (encodeInstance source) history <->
      ValidHistory source history := by
  simp [SourceValid]

@[simp]
theorem sourceVerifier_encoded (source : Instance)
    (history payload : BitWord) :
    sourceVerifier (encodeInstance source) history payload =
      verify source history payload := by
  simp [sourceVerifier]

/-! ## Actual persistent frontier-event reduction -/

/-- One genuine persistent event adjoins exactly one absent frontier history. -/
inductive PersistentStep (Valid : BitWord -> Prop) :
    HistoryIdeal -> HistoryIdeal -> Prop where
  | insert (ideal : HistoryIdeal) (history : BitWord)
      (hvalid : Valid history)
      (hfrontier : HistoryFrontier ideal history) :
      PersistentStep Valid ideal (insertFrontier ideal history hfrontier)

/-- Reflexive-transitive closure of genuine persistent frontier additions. -/
inductive PersistentSteps (Valid : BitWord -> Prop) :
    HistoryIdeal -> HistoryIdeal -> Prop where
  | refl (ideal : HistoryIdeal) : PersistentSteps Valid ideal ideal
  | tail {first middle last : HistoryIdeal} :
      PersistentSteps Valid first middle ->
      PersistentStep Valid middle last ->
      PersistentSteps Valid first last

namespace PersistentSteps

theorem single {Valid : BitWord -> Prop} {first last : HistoryIdeal}
    (hstep : PersistentStep Valid first last) :
    PersistentSteps Valid first last :=
  .tail (.refl first) hstep

theorem trans {Valid : BitWord -> Prop} {first middle last : HistoryIdeal}
    (hfirst : PersistentSteps Valid first middle)
    (hlast : PersistentSteps Valid middle last) :
    PersistentSteps Valid first last := by
  induction hlast with
  | refl => exact hfirst
  | tail hprefix hstep ih => exact .tail ih hstep

theorem le {Valid : BitWord -> Prop} {first last : HistoryIdeal}
    (hsteps : PersistentSteps Valid first last) : first.LE last := by
  induction hsteps with
  | refl => exact HistoryIdeal.le_refl _
  | tail hprefix hstep ih =>
      cases hstep with
      | insert history hvalid hfrontier =>
          exact HistoryIdeal.le_trans ih (fun query hquery =>
            (insertFrontier_contains_iff _ history hfrontier query).mpr
              (Or.inr hquery))

theorem mapValid {First Second : BitWord -> Prop}
    (hmap : forall history, First history -> Second history)
    {first last : HistoryIdeal}
    (hsteps : PersistentSteps First first last) :
    PersistentSteps Second first last := by
  induction hsteps with
  | refl => exact .refl _
  | tail hprefix hstep ih =>
      cases hstep with
      | insert history hvalid hfrontier =>
          exact .tail ih (.insert _ history (hmap history hvalid) hfrontier)

/-- Rebase one frontier insertion across an equivalent duplicate-tolerant ideal. -/
theorem rebaseStep {Valid : BitWord -> Prop}
    {left right after : HistoryIdeal}
    (hequiv : left.Equivalent right)
    (hstep : PersistentStep Valid right after) :
    exists leftAfter,
      PersistentStep Valid left leftAfter /\
      leftAfter.Equivalent after := by
  cases hstep with
  | insert history hvalid hfrontier =>
      have hleftFrontier : HistoryFrontier left history := by
        refine ⟨?_, ?_⟩
        · intro hleft
          exact hfrontier.1 ((hequiv history).mp hleft)
        · intro small hproper
          exact (hequiv small).mpr (hfrontier.2 small hproper)
      let leftAfter := insertFrontier left history hleftFrontier
      refine ⟨leftAfter,
        PersistentStep.insert left history hvalid hleftFrontier, ?_⟩
      intro query
      rw [insertFrontier_contains_iff left history hleftFrontier query,
        insertFrontier_contains_iff right history hfrontier query]
      constructor
      · rintro (rfl | hold)
        · exact Or.inl rfl
        · exact Or.inr ((hequiv query).mp hold)
      · rintro (rfl | hold)
        · exact Or.inl rfl
        · exact Or.inr ((hequiv query).mpr hold)

/-- Rebase a finite persistent run across an equivalent starting ideal. -/
theorem rebase {Valid : BitWord -> Prop} {right after : HistoryIdeal}
    (hsteps : PersistentSteps Valid right after) :
    forall {left : HistoryIdeal}, left.Equivalent right ->
      exists leftAfter,
        PersistentSteps Valid left leftAfter /\
        leftAfter.Equivalent after := by
  induction hsteps with
  | refl =>
      intro left hequiv
      exact ⟨left, .refl left, hequiv⟩
  | tail hprefix hstep ih =>
      intro left hequiv
      obtain ⟨leftMiddle, hleftPrefix, hmiddleEquiv⟩ := ih hequiv
      obtain ⟨leftAfter, hleftStep, hafterEquiv⟩ :=
        rebaseStep hmiddleEquiv hstep
      exact ⟨leftAfter, .tail hleftPrefix hleftStep, hafterEquiv⟩

end PersistentSteps

/-- A word is a prefix of itself followed by any literal suffix. -/
theorem wordPrefix_append (stem suffix : BitWord) :
    WordPrefix stem (stem ++ suffix) := by
  induction stem with
  | nil => exact .nil suffix
  | cons bit rest ih => exact .cons bit ih

/-- Every proper prefix of `prefix ++ [bit]` is already a prefix of `prefix`. -/
theorem properPrefix_append_singleton_left
    {small stem : BitWord} {bit : Bool}
    (hproper : ProperWordPrefix small (stem ++ [bit])) :
    WordPrefix small stem := by
  induction stem generalizing small with
  | nil =>
      simp only [List.nil_append] at hproper
      cases small with
      | nil => exact .nil []
      | cons smallBit smallRest =>
          have hlt := properWordPrefix_length_lt hproper
          simp at hlt
  | cons head stem ih =>
      cases small with
      | nil => exact .nil (head :: stem)
      | cons smallBit smallRest =>
          have hhead := WordPrefix.head_eq hproper.1
          subst smallBit
          have htailPrefix : WordPrefix smallRest (stem ++ [bit]) :=
            WordPrefix.tail hproper.1
          have htailNe : smallRest ≠ stem ++ [bit] := by
            intro heq
            apply hproper.2
            exact congrArg (List.cons head) heq
          exact .cons head (ih ⟨htailPrefix, htailNe⟩)

/-- Inserting an `after`-member preserves semantic inclusion in `after`. -/
theorem insertFrontier_le
    {ideal after : HistoryIdeal} {history : BitWord}
    (hle : ideal.LE after) (hafter : after.Contains history)
    (hfrontier : HistoryFrontier ideal history) :
    (insertFrontier ideal history hfrontier).LE after := by
  intro query hquery
  rcases (insertFrontier_contains_iff ideal history hfrontier query).mp hquery with
    rfl | hold
  · exact hafter
  · exact hle query hold

/--
Install the still-missing suffix of one known `after`-history.  The prefix is
already present, so every new node is a literal frontier event.
-/
theorem ensureSuffix
    {Valid : BitWord -> Prop} {after before : HistoryIdeal}
    (hvalid : forall history, after.Contains history -> Valid history)
    (stem remaining : BitWord)
    (hle : before.LE after)
    (hstem : before.Contains stem)
    (hfinal : after.Contains (stem ++ remaining)) :
    exists result,
      PersistentSteps Valid before result /\
      result.LE after /\
      result.Contains (stem ++ remaining) := by
  classical
  induction remaining generalizing stem before with
  | nil =>
      exact ⟨before, .refl before, hle, by simpa using hstem⟩
  | cons bit remaining ih =>
      let next := stem ++ [bit]
      have hnextFinal : WordPrefix next (stem ++ bit :: remaining) := by
        simpa [next, List.append_assoc] using wordPrefix_append next remaining
      have hnextAfter : after.Contains next :=
        after.contains_ancestor hfinal hnextFinal
      letI : Decidable (before.Contains next) := by
        unfold HistoryIdeal.Contains
        exact inferInstanceAs (Decidable (next ∈ before.entries))
      by_cases hpresent : before.Contains next
      · obtain ⟨result, hsteps, hresultLE, hresult⟩ :=
          ih next hle hpresent (by
            simpa [next, List.append_assoc] using hfinal)
        exact ⟨result, hsteps, hresultLE, by
          simpa [next, List.append_assoc] using hresult⟩
      · have hfrontier : HistoryFrontier before next := by
          refine ⟨hpresent, ?_⟩
          intro small hsmall
          exact before.contains_ancestor hstem
            (properPrefix_append_singleton_left hsmall)
        let middle := insertFrontier before next hfrontier
        have hmiddleLE : middle.LE after :=
          insertFrontier_le hle hnextAfter hfrontier
        have hmiddleNext : middle.Contains next :=
          (insertFrontier_contains_iff before next hfrontier next).mpr
            (Or.inl rfl)
        obtain ⟨result, htail, hresultLE, hresult⟩ :=
          ih next hmiddleLE hmiddleNext (by
            simpa [next, List.append_assoc] using hfinal)
        exact ⟨result,
          PersistentSteps.trans
            (PersistentSteps.single
              (PersistentStep.insert before next (hvalid next hnextAfter)
                hfrontier)) htail,
          hresultLE,
          by simpa [next, List.append_assoc] using hresult⟩

/-- Install one complete valid history, including the root when necessary. -/
theorem ensureHistory
    {Valid : BitWord -> Prop} {after before : HistoryIdeal}
    (hvalid : forall history, after.Contains history -> Valid history)
    (history : BitWord) (hle : before.LE after)
    (hhistory : after.Contains history) :
    exists result,
      PersistentSteps Valid before result /\
      result.LE after /\ result.Contains history := by
  classical
  have hrootAfter : after.Contains [] :=
    after.contains_ancestor hhistory (.nil history)
  letI : Decidable (before.Contains []) := by
    unfold HistoryIdeal.Contains
    exact inferInstanceAs (Decidable ([] ∈ before.entries))
  by_cases hroot : before.Contains []
  · simpa using ensureSuffix hvalid [] history hle hroot hhistory
  · have hfrontier : HistoryFrontier before [] := by
      refine ⟨hroot, ?_⟩
      intro small hproper
      exact False.elim (hproper.2 (WordPrefix.eq_of_length_eq hproper.1
        (Nat.le_antisymm (wordPrefix_length_le hproper.1) (Nat.zero_le _))))
    let middle := insertFrontier before [] hfrontier
    have hmiddleLE : middle.LE after :=
      insertFrontier_le hle hrootAfter hfrontier
    have hmiddleRoot : middle.Contains [] :=
      (insertFrontier_contains_iff before [] hfrontier []).mpr (Or.inl rfl)
    obtain ⟨result, htail, hresultLE, hresult⟩ :=
      ensureSuffix hvalid [] history hmiddleLE hmiddleRoot hhistory
    exact ⟨result,
      PersistentSteps.trans
        (PersistentSteps.single
          (PersistentStep.insert before [] (hvalid [] hrootAfter) hfrontier))
        htail,
      hresultLE, by simpa using hresult⟩

/-- Process a finite list of `after` entries, skipping every duplicate. -/
theorem ensureEntries
    {Valid : BitWord -> Prop} {after before : HistoryIdeal}
    (hvalid : forall history, after.Contains history -> Valid history)
    (entries : List BitWord)
    (hentries : forall history, List.Mem history entries -> after.Contains history)
    (hle : before.LE after) :
    exists result,
      PersistentSteps Valid before result /\
      result.LE after /\
      (forall history, List.Mem history entries -> result.Contains history) := by
  induction entries generalizing before with
  | nil => exact ⟨before, .refl before, hle, fun _ hmem => nomatch hmem⟩
  | cons history rest ih =>
      have hhistory : after.Contains history :=
        hentries history (.head rest)
      obtain ⟨middle, hfirst, hmiddleLE, hmiddleHistory⟩ :=
        ensureHistory hvalid history hle hhistory
      have hrest : forall query, List.Mem query rest -> after.Contains query :=
        fun query hmem => hentries query (.tail history hmem)
      obtain ⟨result, htail, hresultLE, hresultRest⟩ :=
        ih hrest hmiddleLE
      refine ⟨result, PersistentSteps.trans hfirst htail, hresultLE, ?_⟩
      intro query hmem
      rcases List.mem_cons.mp hmem with rfl | hmem
      · exact (PersistentSteps.le htail) _ hmiddleHistory
      · exact hresultRest query hmem

/-- Every finite valid ideal extension is an actual finite frontier-event run. -/
theorem persistentSteps_of_le
    {Valid : BitWord -> Prop} {before after : HistoryIdeal}
    (hle : before.LE after)
    (hvalid : forall history, after.Contains history -> Valid history) :
    exists result,
      PersistentSteps Valid before result /\ result.Equivalent after := by
  obtain ⟨result, hsteps, hresultLE, hall⟩ :=
    ensureEntries hvalid after.entries (fun history hmem => hmem) hle
  refine ⟨result, hsteps, fun history => ⟨hresultLE history, ?_⟩⟩
  intro hafter
  exact hall history hafter

/-- Semantic reflexive-transitive reachability modulo ideal representation. -/
def PersistentReaches (Valid : BitWord -> Prop)
    (before after : HistoryIdeal) : Prop :=
  exists result,
    PersistentSteps Valid before result /\ result.Equivalent after

theorem PersistentReaches.refl (Valid : BitWord -> Prop)
    (ideal : HistoryIdeal) : PersistentReaches Valid ideal ideal :=
  ⟨ideal, .refl ideal, fun _ => Iff.rfl⟩

/-- Semantic persistent reachability is transitive across ideal representations. -/
theorem PersistentReaches.trans {Valid : BitWord -> Prop}
    {first middle last : HistoryIdeal}
    (hfirst : PersistentReaches Valid first middle)
    (hlast : PersistentReaches Valid middle last) :
    PersistentReaches Valid first last := by
  obtain ⟨firstResult, hfirstSteps, hfirstEquiv⟩ := hfirst
  obtain ⟨lastResult, hlastSteps, hlastEquiv⟩ := hlast
  obtain ⟨rebasedResult, hrebasedSteps, hrebasedEquiv⟩ :=
    PersistentSteps.rebase hlastSteps hfirstEquiv
  refine ⟨rebasedResult,
    PersistentSteps.trans hfirstSteps hrebasedSteps, ?_⟩
  intro history
  exact Iff.trans (hrebasedEquiv history) (hlastEquiv history)

/-! ## Concrete whole-edge, exact-range, cofinality, and macrostep theorems -/

/-- Every raw target edge is a finite rank-ordered batch of genuine histories. -/
theorem strongProjection_step_genuine_batch
    (machine : Instance) {source target : Term}
    (hreach : Steps (strongEncoder machine) source)
    (hstep : Step source target) :
    RankOrderedBatch (ValidHistory machine)
      (strongProjection source) (strongProjection target) := by
  have hbatch := projection_step_genuine_batch
    sourceVerifier_sound sourceValid_prefixClosed
    (bits := encodeInstance machine) hreach hstep
  rcases hbatch with
    ⟨events, hnodup, hle, hmembership, hvalid, hancestors⟩
  refine ⟨events, hnodup, hle, hmembership, ?_, hancestors⟩
  intro history hmem
  have hsourceValid := hvalid hmem
  exact ⟨by simpa [SourceValid] using hsourceValid.1, hsourceValid.2⟩

/-- Every unrestricted target edge is an actual finite batch of source events. -/
theorem sourceProjection_step_persistent
    {bits : BitWord} {source target : Term}
    (hreach : Steps (encoder bits) source) (hstep : Step source target) :
    exists result,
      PersistentSteps (SourceValid bits)
        (projection sourceVerifier source) result /\
      result.Equivalent (projection sourceVerifier target) := by
  have hle := projection_step_mono_on_encoder_cone
    sourceVerifier hreach hstep
  have htargetReach : Steps (encoder bits) target := Steps.tail hreach hstep
  obtain ⟨body, hbody, htarget⟩ := encoder_steps_preserves htargetReach
  have hvalid : forall history,
      (projection sourceVerifier target).Contains history ->
        SourceValid bits history := by
    intro history hmem
    rw [htarget] at hmem
    exact projection_contains_valid sourceVerifier_sound
      sourceValid_prefixClosed hmem
  exact persistentSteps_of_le hle hvalid

/-- Every finite unrestricted reduction is one finite persistent-event run. -/
theorem sourceProjection_steps_persistent
    {bits : BitWord} {source target : Term}
    (hreach : Steps (encoder bits) source) (hsteps : Steps source target) :
    exists result,
      PersistentSteps (SourceValid bits)
        (projection sourceVerifier source) result /\
      result.Equivalent (projection sourceVerifier target) := by
  have hle := projection_steps_mono_on_encoder_cone
    sourceVerifier hreach hsteps
  have htargetReach : Steps (encoder bits) target := Steps.trans hreach hsteps
  obtain ⟨body, hbody, htarget⟩ := encoder_steps_preserves htargetReach
  have hvalid : forall history,
      (projection sourceVerifier target).Contains history ->
        SourceValid bits history := by
    intro history hmem
    rw [htarget] at hmem
    exact projection_contains_valid sourceVerifier_sound
      sourceValid_prefixClosed hmem
  exact persistentSteps_of_le hle hvalid

/-- Machine-specialized whole-edge soundness with no hidden source parameter. -/
theorem strongProjection_step_persistent
    (machine : Instance) {source target : Term}
    (hreach : Steps (strongEncoder machine) source)
    (hstep : Step source target) :
    exists result,
      PersistentSteps (ValidHistory machine)
        (strongProjection source) result /\
      result.Equivalent (strongProjection target) := by
  obtain ⟨result, hsteps, hequiv⟩ :=
    sourceProjection_step_persistent
      (bits := encodeInstance machine) hreach hstep
  refine ⟨result, ?_, hequiv⟩
  exact PersistentSteps.mapValid (fun history hvalid => by
    simpa [SourceValid] using hvalid) hsteps

/-- Whole-target-edge soundness stated directly as persistent `->*`. -/
theorem strongProjection_step_reaches
    (machine : Instance) {source target : Term}
    (hreach : Steps (strongEncoder machine) source)
    (hstep : Step source target) :
    PersistentReaches (ValidHistory machine)
      (strongProjection source) (strongProjection target) :=
  strongProjection_step_persistent machine hreach hstep

/-- Finite target reductions map to persistent source `->*` directly. -/
theorem strongProjection_steps_reaches
    (machine : Instance) {source target : Term}
    (hreach : Steps (strongEncoder machine) source)
    (hsteps : Steps source target) :
    PersistentReaches (ValidHistory machine)
      (strongProjection source) (strongProjection target) := by
  obtain ⟨result, hpersistent, hequiv⟩ :=
    sourceProjection_steps_persistent
      (bits := encodeInstance machine) hreach hsteps
  exact ⟨result, PersistentSteps.mapValid (fun history hvalid => by
    simpa [SourceValid] using hvalid) hpersistent, hequiv⟩

/-- Canonical protected checkpoint carrying an exact finite source ideal. -/
def strongCheckpoint (source : Instance) (ideal : HistoryIdeal)
    (frontier : List (BitWord × BitWord)) : Term :=
  idealCheckpoint (encodeInstance source) sourceWitness ideal frontier

/-- Every finite ideal of genuine histories has an exact canonical target. -/
theorem strongCheckpoint_exact
    (source : Instance) (ideal : HistoryIdeal)
    (hideal : forall history, ideal.Contains history ->
      ValidHistory source history)
    (frontier : List (BitWord × BitWord)) :
    (strongProjection (strongCheckpoint source ideal frontier)).Equivalent ideal := by
  apply projection_idealCheckpoint_equivalent
    sourceVerifier_sound sourceVerifier_complete sourceVerifier_unique
  intro history hmem
  simpa [SourceValid] using hideal history hmem

/-- Every exact canonical finite ideal is reachable from the finite encoder. -/
theorem strongEncoder_steps_checkpoint
    (source : Instance) (ideal : HistoryIdeal)
    (frontier : List (BitWord × BitWord)) :
    Steps (strongEncoder source) (strongCheckpoint source ideal frontier) := by
  exact encoder_steps_seededPreparedBuild (encodeInstance source)
    (selectedWitnesses sourceWitness (encodeInstance source) ideal.entries)
    frontier

/--
From every unrestricted reduct, every finite valid source ideal is jointly
recoverable while all already decoded events persist.
-/
theorem strong_cofinal_complete
    (source : Instance) {reduct : Term}
    (hreach : Steps (strongEncoder source) reduct)
    (ideal : HistoryIdeal)
    (hideal : forall history, ideal.Contains history ->
      ValidHistory source history) :
    exists join,
      Steps reduct join /\
      (strongProjection reduct).LE (strongProjection join) /\
      ideal.LE (strongProjection join) := by
  let bits := encodeInstance source
  let chosen := selectedWitnesses sourceWitness bits ideal.entries
  let requested := preparedPrefixSet chosen []
  obtain ⟨join, hreductJoin, hbuildJoin, hkeep, hrequested⟩ :=
    encoder_reduct_cofinal_prefixSet requested (by
      simpa [strongEncoder, bits] using hreach)
  have hprojectionLE :
      (strongProjection reduct).LE (strongProjection join) := by
    exact projection_steps_mono_on_encoder_cone sourceVerifier
      (by simpa [strongEncoder, bits] using hreach) hreductJoin
  have hjoinReach : Steps (encoder bits) join :=
    Steps.trans (by simpa [strongEncoder, bits] using hreach) hreductJoin
  obtain ⟨body, hbody, hjoin⟩ := encoder_steps_preserves hjoinReach
  refine ⟨join, hreductJoin, hprojectionLE, ?_⟩
  intro history hhistory
  have hselected : List.Mem (history, sourceWitness bits history) chosen := by
    apply (mem_selectedWitnesses_iff sourceWitness bits ideal.entries
      history (sourceWitness bits history)).mpr
    exact ⟨hhistory, rfl⟩
  have hcontains : requested.Contains
      (a history (sourceWitness bits history)) := by
    apply (a_preparedPrefixSet_contains_iff
      (chosen := chosen) (frontier := [])).mpr
    exact hselected
  have hpath : List.Mem (a history (sourceWitness bits history))
      (anchoredOpenedPaths join) := hrequested _ hcontains
  have hvalid : SourceValid bits history := by
    simpa [bits, SourceValid] using hideal history hhistory
  have hverify := sourceVerifier_complete bits history hvalid
  apply (projection_contains_iff sourceVerifier join history).mpr
  refine ⟨bits, history, sourceWitness bits history, ?_, hpath,
    hverify, WordPrefix.refl history⟩
  rw [hjoin]
  exact headerBits?_seededHeader bits body

/-- One valid frontier event has coherent exact canonical endpoints. -/
theorem strong_frontier_exact_macrostep
    (source : Instance) (ideal : HistoryIdeal)
    (hideal : forall query, ideal.Contains query -> ValidHistory source query)
    (history : BitWord) (hvalid : ValidHistory source history)
    (hfrontier : HistoryFrontier ideal history) :
    Steps
      (frontierCheckpoint (encodeInstance source) sourceWitness ideal history)
      (frontierCheckpoint (encodeInstance source) sourceWitness
        (insertFrontier ideal history hfrontier) history) /\
    (strongProjection
      (frontierCheckpoint (encodeInstance source) sourceWitness ideal history)).Equivalent
        ideal /\
    (strongProjection
      (frontierCheckpoint (encodeInstance source) sourceWitness
        (insertFrontier ideal history hfrontier) history)).Equivalent
          (insertFrontier ideal history hfrontier) := by
  apply frontierCheckpoint_exact_macrostep
    sourceVerifier_sound sourceVerifier_complete sourceVerifier_unique
  · intro query hquery
    simpa [SourceValid] using hideal query hquery
  · simpa [SourceValid] using hvalid

/-- A terminal source history cannot be forged by any literal child payload. -/
theorem sourceVerifier_rejects_terminal_child
    {source : Instance} {history payload : BitWord}
    (hterminal : TerminalHistory source history) (slot : Bool) :
    sourceVerifier (encodeInstance source) (history ++ [slot]) payload = false := by
  simpa [sourceVerifier] using
    terminalHistory_rejects_extension hterminal slot (payload := payload)

/-- No projection below the frozen source header contains a terminal child. -/
theorem strongProjection_excludes_terminal_child
    {source : Instance} {body : Term} {history : BitWord}
    (hterminal : TerminalHistory source history) (slot : Bool) :
    ¬ (strongProjection
      (seededHeader (encodeInstance source) body)).Contains
        (history ++ [slot]) := by
  intro hcontains
  have hvalid : SourceValid (encodeInstance source) (history ++ [slot]) :=
    projection_contains_valid sourceVerifier_sound sourceValid_prefixClosed hcontains
  exact terminalHistory_not_valid_extension hterminal slot
    (by simpa [SourceValid] using hvalid)

/-- Equal rule text in two slots retains two distinct accepted addresses. -/
theorem strong_equal_slots_preserve_multiplicity
    {source : Instance} {symbol : Bool} {rule : Rule} {next : Row}
    (hscan : scanned? (initialRow source) = some symbol)
    (hzero : ruleAt? source.machine source.initialState symbol false = some rule)
    (hone : ruleAt? source.machine source.initialState symbol true = some rule)
    (happly : applyRule? (initialRow source) rule = some next) :
    exists payload,
      sourceVerifier (encodeInstance source) [false] payload = true /\
      sourceVerifier (encodeInstance source) [true] payload = true /\
      a [false] payload ≠ a [true] payload := by
  obtain ⟨payload, hfalse, htrue, hne⟩ :=
    equal_rule_slots_preserve_multiplicity hscan hzero hone happly
  refine ⟨payload, ?_, ?_, hne⟩
  · rw [sourceVerifier_encoded]
    exact hfalse
  · rw [sourceVerifier_encoded]
    exact htrue

/--
Pure validity-level form of ordered occurrence multiplicity.  It applies at
every source history and does not identify equal successor configurations.
-/
theorem strong_valid_children_preserve_multiplicity
    {source : Instance} {history : BitWord}
    (hfalse : ValidHistory source (history ++ [false]))
    (htrue : ValidHistory source (history ++ [true])) :
    exists payloadFalse payloadTrue,
      sourceVerifier (encodeInstance source) (history ++ [false])
        payloadFalse = true /\
      sourceVerifier (encodeInstance source) (history ++ [true])
        payloadTrue = true /\
      a (history ++ [false]) payloadFalse ≠
        a (history ++ [true]) payloadTrue := by
  obtain ⟨payloadFalse, hpayloadFalse⟩ := verify_complete hfalse
  obtain ⟨payloadTrue, hpayloadTrue⟩ := verify_complete htrue
  refine ⟨payloadFalse, payloadTrue, ?_, ?_, ?_⟩
  · rw [sourceVerifier_encoded]
    exact hpayloadFalse
  · rw [sourceVerifier_encoded]
    exact hpayloadTrue
  · intro heq
    have hpairs := a_injective
      (left := (history ++ [false], payloadFalse))
      (right := (history ++ [true], payloadTrue)) heq
    exact ordered_singleton_ne history (congrArg Prod.fst hpairs)


end PureSFormal.Research.ProtectedTrieStrong
