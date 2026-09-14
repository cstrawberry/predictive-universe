import PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity
import PureSFormal.Research.RootResetBoundedDepthObstruction

/-!
# Public boundaries for the protected-trie observer

This module exposes two facts about the division of work between the
protected trie and any conforming current-term observer.

First, a literal two-row tableau is accepted exactly when its supplied second
row is the result of the selected ordered source transition from the encoded
initial row.  Consequently the initial one-step relation reduces through a
displayed structural query map to acceptance by every cone-wide sound and
canonically complete current-term observer.

Second, the normal source header is invariant throughout every unrestricted
reduction cone.  The current term therefore decodes to exactly its originating
source instance, and cones belonging to distinct source instances are
disjoint.
-/

namespace PureSFormal.Research.ProtectedTrieObserverBoundary

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieBoundedTerminal
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieTableau
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieBuild
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieLabelledObserver
open PureSFormal.Research.ProtectedTrieLabelSemantics
open PureSFormal.Research.ProtectedTriePrefixBuild
open PureSFormal.Research.ProtectedTrieParser
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieTableauLabel
open PureSFormal.Research.ProtectedTrieWholeObserverExactCost

namespace PrefixLocality

open PureSFormal.Research.RootResetBoundedDepthObstruction

/-! ## Root-prefix locality and structural agreement -/

/-- An observer is fixed-depth root-prefix local when equal node kinds through
that depth force its complete literal output list to agree. -/
def PrefixLocal (depth : Nat) (observer : CurrentTermObserver) : Prop :=
  ∀ first second,
    AgreeThrough depth first second → observer first = observer second

/-- Literal provenance supplements verifier soundness: every emitted record
must name a candidate address that is actually open in the current encoded
term. -/
def ConeWideRecordProvenance (observer : CurrentTermObserver) : Prop :=
  ∀ source term history payload,
    Steps (strongEncoder source) term →
    Emits observer term history payload →
      List.Mem (a history payload) (anchoredOpenedPaths term)

/-- Agreement through a larger root depth implies agreement through every
smaller depth. -/
theorem agreeThrough_mono {small large : Nat} {first second : Term}
    (hle : small ≤ large) (hagrees : AgreeThrough large first second) :
    AgreeThrough small first second := by
  induction small generalizing large first second with
  | zero => trivial
  | succ small ih =>
      cases large with
      | zero => exact False.elim (Nat.not_succ_le_zero small hle)
      | succ large =>
          cases first with
          | s =>
              cases second with
              | s => trivial
              | app fn arg => exact False.elim hagrees
          | app firstFn firstArg =>
              cases second with
              | s => exact False.elim hagrees
              | app secondFn secondArg =>
                  exact ⟨
                    ih (Nat.le_of_succ_le_succ hle) hagrees.1,
                    ih (Nat.le_of_succ_le_succ hle) hagrees.2⟩

/-- Visible-prefix agreement is symmetric. -/
theorem agreeThrough_symm {depth : Nat} {first second : Term}
    (hagrees : AgreeThrough depth first second) :
    AgreeThrough depth second first := by
  induction depth generalizing first second with
  | zero => trivial
  | succ depth ih =>
      cases first with
      | s =>
          cases second with
          | s => trivial
          | app fn arg => exact False.elim hagrees
      | app firstFn firstArg =>
          cases second with
          | s => exact False.elim hagrees
          | app secondFn secondArg =>
              exact ⟨ih hagrees.1, ih hagrees.2⟩

/-- Application preserves equal-depth agreement and exposes one additional
root level. -/
theorem agreeThrough_app {depth : Nat}
    {firstFn secondFn firstArg secondArg : Term}
    (hfn : AgreeThrough depth firstFn secondFn)
    (harg : AgreeThrough depth firstArg secondArg) :
    AgreeThrough (depth + 1) (.app firstFn firstArg)
      (.app secondFn secondArg) := by
  simpa only [Nat.add_comm depth 1, AgreeThrough] using And.intro hfn harg

/-- Changing protected fields only below depth `d` cannot be observed above
depth `d+1`. -/
theorem agreeThrough_protectedNode {depth : Nat}
    {firstLeft secondLeft firstRight secondRight firstJunk secondJunk : Term}
    (hleft : AgreeThrough depth firstLeft secondLeft)
    (hright : AgreeThrough depth firstRight secondRight)
    (hjunk : AgreeThrough depth firstJunk secondJunk) :
    AgreeThrough (depth + 1)
      (protectedNode firstLeft firstRight firstJunk)
      (protectedNode secondLeft secondRight secondJunk) := by
  have hhead : AgreeThrough depth (.s : Term) .s :=
    agreeThrough_refl depth .s
  have hleftSpineHigh := agreeThrough_app hhead hleft
  have hrightSpineHigh := agreeThrough_app hhead hright
  have hrightSpine : AgreeThrough depth
      (.app .s firstRight) (.app .s secondRight) :=
    agreeThrough_mono (Nat.le_add_right depth 1) hrightSpineHigh
  have htailHigh := agreeThrough_app hrightSpine hjunk
  have hleftSpine : AgreeThrough depth
      (.app .s firstLeft) (.app .s secondLeft) :=
    agreeThrough_mono (Nat.le_add_right depth 1) hleftSpineHigh
  exact agreeThrough_app hleftSpine
    (agreeThrough_mono (Nat.le_add_right depth 1) htailHigh)

/-- Single-path canonical tries whose endpoints first diverge after `common`
are indistinguishable through at least `|common|+1` raw tree levels. -/
theorem buildFrom_insertPath_divergence_agree
    (phase : Nat × Nat) (common leftTail rightTail : BitWord) :
    AgreeThrough (common.length + 1)
      (buildFrom phase
        (insertPath (common ++ false :: leftTail) PrefixTree.empty))
      (buildFrom phase
        (insertPath (common ++ true :: rightTail) PrefixTree.empty)) := by
  induction common generalizing phase with
  | nil =>
      exact ⟨trivial, trivial⟩
  | cons bit common ih =>
      cases bit with
      | false =>
          simp only [List.cons_append, insertPath, buildFrom,
            List.length_cons]
          apply agreeThrough_protectedNode
          · simpa only [Nat.succ_eq_add_one] using ih (nextPhase phase)
          · exact agreeThrough_refl (common.length + 1)
              (phaseGenerator (nextPhase phase))
          · exact agreeThrough_refl (common.length + 1) (phaseJunk phase)
      | true =>
          simp only [List.cons_append, insertPath, buildFrom,
            List.length_cons]
          apply agreeThrough_protectedNode
          · exact agreeThrough_refl (common.length + 1)
              (phaseGenerator (nextPhase phase))
          · simpa only [Nat.succ_eq_add_one] using ih (nextPhase phase)
          · exact agreeThrough_refl (common.length + 1) (phaseJunk phase)

/-- Adding the identical frozen source header preserves one further visible
root level. -/
theorem seededBuild_insertPath_divergence_agree
    (bits common leftTail rightTail : BitWord) :
    AgreeThrough (common.length + 2)
      (seededBuild bits
        (insertPath (common ++ false :: leftTail) PrefixTree.empty))
      (seededBuild bits
        (insertPath (common ++ true :: rightTail) PrefixTree.empty)) := by
  unfold seededBuild buildAt seededHeader header passive
  apply agreeThrough_app
  · exact agreeThrough_mono
      (Nat.le_add_right (common.length + 1) 1)
      (agreeThrough_app
        (agreeThrough_refl (common.length + 1) (.s : Term))
        (agreeThrough_refl (common.length + 1) (N bits)))
  · exact buildFrom_insertPath_divergence_agree
      (phaseAt 0) common leftTail rightTail

/-! ## Explicit deep canonical adversaries -/

/-- One source instance with a literal ordered slot-0 self-loop on blank. -/
def loopSource : Instance :=
  { machine :=
      { states :=
          [{ onFalse :=
              { slot0 := some { write := false, move := .stay, nextState := 0 }
                slot1 := none }
             onTrue := { slot0 := none, slot1 := none } }] }
    initialState := 0
    input := [] }

@[simp]
theorem loopSource_step_false :
    step? loopSource.machine (initialRow loopSource) false =
      some (initialRow loopSource) := by
  rfl

@[simp]
theorem loopSource_run_replicate_false (count : Nat) :
    run? loopSource.machine (initialRow loopSource)
      (List.replicate count false) = some (initialRow loopSource) := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp only [List.replicate_succ, run?, loopSource_step_false,
        Option.bind_some]
      exact ih

theorem loopSource_valid_replicate_false (count : Nat) :
    ValidHistory loopSource (List.replicate count false) :=
  ⟨initialRow loopSource, loopSource_run_replicate_false count⟩

/-- Verifier acceptance entails a nonempty literal tableau payload. -/
theorem verified_payload_ne_nil {source : Instance} {history payload : BitWord}
    (hverify : verify source history payload = true) : payload ≠ [] := by
  intro hpayload
  subst payload
  simp [verify, decodeTableau?, decodeNat?] at hverify

/-- A candidate endpoint different from the sole opened endpoint is absent
from that canonical one-candidate term. -/
theorem candidateAddress_not_mem_candidateTerm
    (source : Instance) (history leftPayload rightPayload : BitWord)
    (hne : leftPayload ≠ rightPayload) :
    ¬ List.Mem (a history leftPayload)
        (anchoredOpenedPaths
          (candidateTerm source history rightPayload)) := by
  intro hmem
  rw [candidateTerm, anchoredOpenedPaths_seededBuild,
    mem_paths_insertPath_iff] at hmem
  rcases hmem with hold | hprefix
  · cases hold
  · exact hne (a_prefix_eq hprefix).2

/-- For every fixed root depth there are two canonical terms for the same
source and history that agree through that depth, while only the first opens
its verified literal record. -/
theorem deepCanonicalCandidateAdversary (depth : Nat) :
    ∃ history payload,
      verify loopSource history payload = true ∧
      AgreeThrough depth
        (candidateTerm loopSource history payload)
        (candidateTerm loopSource history []) ∧
      ¬ List.Mem (a history payload)
          (anchoredOpenedPaths (candidateTerm loopSource history [])) := by
  let history := List.replicate depth false
  obtain ⟨payload, hverify⟩ :=
    verify_complete (loopSource_valid_replicate_false depth)
  have hpayload : payload ≠ [] := verified_payload_ne_nil hverify
  cases payload with
  | nil => exact False.elim (hpayload rfl)
  | cons bit tail =>
      let common := r history ++ [false]
      let goodTail := unaryPayload tail.length (bit :: tail)
      have hgoodPc : pc (bit :: tail) = true :: goodTail := by
        rfl
      have hgoodAddress :
          a history (bit :: tail) = common ++ true :: goodTail := by
        calc
          a history (bit :: tail) =
              r history ++ false :: pc (bit :: tail) := rfl
          _ = r history ++ false :: true :: goodTail := by rw [hgoodPc]
          _ = (r history ++ [false]) ++ true :: goodTail := by simp
          _ = common ++ true :: goodTail := rfl
      have hbadAddress : a history [] = common ++ false :: [] := by
        simp [a, common, pc, unaryPayload, List.append_assoc]
      have hagreeLarge :
          AgreeThrough (common.length + 2)
            (candidateTerm loopSource history (bit :: tail))
            (candidateTerm loopSource history []) := by
        rw [candidateTerm, candidateTerm, hgoodAddress, hbadAddress]
        exact agreeThrough_symm
          (seededBuild_insertPath_divergence_agree
            (encodeInstance loopSource) common [] goodTail)
      have hdepth : depth ≤ common.length + 2 := by
        have hmul : depth ≤ 2 * depth :=
          Nat.le_mul_of_pos_left depth (by decide : 0 < 2)
        have hpad : 2 * depth ≤ 2 * depth + 3 :=
          Nat.le_add_right _ 3
        simpa [common, routeCode_length, history, Nat.add_assoc] using
          Nat.le_trans hmul hpad
      refine ⟨history, bit :: tail, hverify,
        agreeThrough_mono hdepth hagreeLarge, ?_⟩
      exact candidateAddress_not_mem_candidateTerm loopSource history
        (bit :: tail) [] (by simp)

/-- No observer can simultaneously be fixed-depth root-prefix local, emit
every verified record at its canonical term, and emit only records whose
literal addresses are open in the current encoded term.  This is an
intensional locality obstruction; it assumes literal provenance, which is
strictly stronger than verifier soundness alone. -/
theorem no_fixed_depth_complete_provenance_observer
    (depth : Nat) (observer : CurrentTermObserver)
    (locality : PrefixLocal depth observer)
    (complete : CanonicalCandidateComplete observer)
    (provenance : ConeWideRecordProvenance observer) : False := by
  obtain ⟨history, payload, hverify, hagree, habsent⟩ :=
    deepCanonicalCandidateAdversary depth
  have hemits : Emits observer
      (candidateTerm loopSource history payload) history payload :=
    complete loopSource history payload hverify
  have houtputs := locality _ _ hagree
  have hemitsBad : Emits observer
      (candidateTerm loopSource history []) history payload := by
    unfold Emits at hemits ⊢
    rw [← houtputs]
    exact hemits
  have hopen := provenance loopSource
    (candidateTerm loopSource history []) history payload
    (candidateSchedule_steps loopSource history []) hemitsBad
  exact habsent hopen

/-! ## The package observer meets the strengthened contract -/

/-- Erase final-row labels from the package observer while retaining each
literal history and payload record. -/
def labelledLiteralObserver : CurrentTermObserver :=
  fun term => (labelledProjection term).map
    (fun entry => (entry.history, entry.payload))

/-- The package observer emits every verifier-accepted record at its
canonical one-candidate term. -/
theorem labelledLiteralObserver_canonicalComplete :
    CanonicalCandidateComplete labelledLiteralObserver := by
  intro source history payload hverify
  have hisSome : (verifyLabel? source history payload).isSome = true := by
    simpa only [verifyLabel?_isSome] using hverify
  cases hlabel : verifyLabel? source history payload with
  | none => simp [hlabel] at hisSome
  | some label =>
      have hentry :
          List.Mem ⟨history, payload, label⟩
            (labelledProjection (candidateTerm source history payload)) := by
        have hheader :
            headerBits? (candidateTerm source history payload) =
              some (encodeInstance source) := by
          simp [candidateTerm, seededBuild, headerBits?_seededHeader]
        simp only [labelledProjection, hheader,
          decodeInstance?_encodeInstance]
        exact mem_collectLabels_of_candidate source _ history payload label
          (candidateAddress_mem_openedPaths source history payload) hlabel
      unfold Emits labelledLiteralObserver
      exact (mem_map_iff_literal (history, payload)
        (labelledProjection (candidateTerm source history payload))
        (fun entry => (entry.history, entry.payload))).mpr
          ⟨⟨history, payload, label⟩, hentry, rfl⟩

/-- Every package-observer record has a literal open candidate address in the
current term. -/
theorem labelledLiteralObserver_coneWideProvenance :
    ConeWideRecordProvenance labelledLiteralObserver := by
  intro source term history payload hreach hemits
  unfold Emits labelledLiteralObserver at hemits
  obtain ⟨entry, hentry, heq⟩ :=
    (mem_map_iff_literal (history, payload) (labelledProjection term)
      (fun entry => (entry.history, entry.payload))).mp hemits
  have hhistory : entry.history = history := congrArg Prod.fst heq
  have hpayload : entry.payload = payload := congrArg Prod.snd heq
  rw [← hhistory, ← hpayload]
  exact labelledProjection_candidate_mem hentry

/-- The concrete package observer is not local to any fixed-depth root
prefix.  Its unbounded structural scan is therefore required by the literal
completeness-and-provenance contract, rather than being an implementation
accident. -/
theorem labelledLiteralObserver_not_prefixLocal (depth : Nat) :
    ¬ PrefixLocal depth labelledLiteralObserver := by
  intro locality
  exact no_fixed_depth_complete_provenance_observer depth
    labelledLiteralObserver locality
    labelledLiteralObserver_canonicalComplete
    labelledLiteralObserver_coneWideProvenance

end PrefixLocality

/-! ## The source one-step relation inside literal observer acceptance -/

/-- A supplied ordered transition out of the encoded initial row.  The target
row is literal input data, rather than a value synthesized by the reduction
map. -/
structure InitialStepCandidate where
  source : Instance
  slot : Bool
  next : Row

/-- The displayed source relation: the selected ordered occurrence maps the
initial row to the supplied next row. -/
def InitialSourceStep (candidate : InitialStepCandidate) : Prop :=
  step? candidate.source.machine (initialRow candidate.source)
      candidate.slot = some candidate.next

/-- Encode the proposed source step as the literal one-bit history and
two-row tableau consumed by the existing verifier. -/
def initialStepVerifiedCandidate
    (candidate : InitialStepCandidate) : Candidate :=
  { source := candidate.source
    history := [candidate.slot]
    payload := encodeTableau [initialRow candidate.source, candidate.next] }

/-- The public current-term query obtained by exposing that literal two-row
tableau at its canonical protected-trie address. -/
def initialStepQuery (candidate : InitialStepCandidate) : ObserverQuery :=
  candidateQuery (initialStepVerifiedCandidate candidate)

/-- The literal two-row verifier accepts exactly the supplied ordered source
step.  No existential history or synthesized successor occurs in this
statement. -/
theorem verify_initial_two_rows_iff_step
    (candidate : InitialStepCandidate) :
    VerifiedCandidate (initialStepVerifiedCandidate candidate) ↔
      InitialSourceStep candidate := by
  cases candidate with
  | mk source slot next =>
      simp only [VerifiedCandidate, initialStepVerifiedCandidate,
        InitialSourceStep]
      unfold verify
      rw [decodeTableau?_encodeTableau]
      simp only [beq_self_eq_true, Bool.true_and]
      simp [verifyRows, checkTrace]

/-- Every cone-wide sound and canonically complete current-term observer
answers the displayed initial source-step relation through the literal
two-row query map. -/
theorem initialSourceStep_reducesVia_observer
    (observer : CurrentTermObserver)
    (sound : ConeWideRecordSound observer)
    (complete : CanonicalCandidateComplete observer) :
    PureSFormal.Computation.ReducesVia initialStepQuery InitialSourceStep
      (ObserverAccepts observer) := by
  intro candidate
  calc
    InitialSourceStep candidate ↔
        VerifiedCandidate (initialStepVerifiedCandidate candidate) :=
      (verify_initial_two_rows_iff_step candidate).symm
    _ ↔ ObserverAccepts observer (initialStepQuery candidate) :=
      verifiedCandidate_reducesVia_observer observer sound complete
        (initialStepVerifiedCandidate candidate)

/-- The same literal two-row query supplies the corresponding extensional
many-one reduction. -/
theorem initialSourceStep_manyOneReduces_observer
    (observer : CurrentTermObserver)
    (sound : ConeWideRecordSound observer)
    (complete : CanonicalCandidateComplete observer) :
    PureSFormal.Computation.ManyOneReduces InitialSourceStep
      (ObserverAccepts observer) :=
  ⟨initialStepQuery,
    initialSourceStep_reducesVia_observer observer sound complete⟩

/-! ## Frozen source identity and cross-instance separation -/

/-- Decode a source instance only from the exact normal header of the current
bare term. -/
def currentSource? (term : Term) : Option Instance := do
  let bits ← headerBits? term
  decodeInstance? bits

/-- Every unrestricted reduct decodes to exactly the source instance whose
encoder cone contains it. -/
theorem strongEncoder_cone_currentSource
    (source : Instance) {term : Term}
    (hreach : Steps (strongEncoder source) term) :
    currentSource? term = some source := by
  obtain ⟨body, _, rfl⟩ := strongEncoder_frozen_header source hreach
  simp [currentSource?, headerBits?_seededHeader,
    decodeInstance?_encodeInstance]

/-- The frozen literal header bits themselves remain exactly the canonical
encoding of the originating source. -/
theorem strongEncoder_cone_headerBits
    (source : Instance) {term : Term}
    (hreach : Steps (strongEncoder source) term) :
    headerBits? term = some (encodeInstance source) := by
  obtain ⟨body, _, rfl⟩ := strongEncoder_frozen_header source hreach
  exact headerBits?_seededHeader (encodeInstance source) body

/-- A term cannot lie in the unrestricted encoder cones of two distinct
source instances. -/
theorem strongEncoder_cones_source_separated
    {left right : Instance} {term : Term}
    (hleft : Steps (strongEncoder left) term)
    (hright : Steps (strongEncoder right) term) :
    left = right := by
  have hleftSource := strongEncoder_cone_currentSource left hleft
  have hrightSource := strongEncoder_cone_currentSource right hright
  rw [hleftSource] at hrightSource
  exact Option.some.inj hrightSource

end PureSFormal.Research.ProtectedTrieObserverBoundary
