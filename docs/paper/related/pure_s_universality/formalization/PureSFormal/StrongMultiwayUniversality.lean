import PureSFormal.Research.ProtectedTrieConfluenceObstruction
import PureSFormal.Research.ProtectedTrieConfigurationQuotient
import PureSFormal.Research.ProtectedTrieDeterministicCompiler
import PureSFormal.Research.FiniteBranchBinaryMachineCompiler
import PureSFormal.Research.ProtectedTrieBoundedTerminal
import PureSFormal.Research.ProtectedTrieObserverNecessity
import PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity
import PureSFormal.Research.ProtectedTrieObserverBoundary
import PureSFormal.Research.ProtectedTrieFairness
import PureSFormal.Research.ProtectedTrieExecutableScheduleStrong
import PureSFormal.Research.ProtectedTrieStrongTheorem

/-!
# Aggregate interface for protected trie certificates

This module exposes the `StrongMultiwayUniversality` declaration family
through direct imports.  The public Result-B interface is
`PureSFormal.Research.ProtectedTrieCertificateEnumeration`; it exposes the
protected-trie aggregate and ordinary quantified theorems for permanence,
range, cofinality, the adjacent-step path, subdivision, and terminal
certificates.
-/

namespace PureSFormal.StrongMultiwayUniversality

open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieTableau
open PureSFormal.Research.ProtectedTrieTableauLabel
open PureSFormal.Research.ProtectedTrieLabelledObserver
open PureSFormal.Research.ProtectedTrieLabelSemantics
open PureSFormal.Research.ProtectedTrieWholeObserverExactCost
open PureSFormal.Research.ProtectedTrieConfigurationQuotient
open PureSFormal.Research.ProtectedTrieBoundedTerminal
open PureSFormal.Research.ProtectedTrieObserverNecessity
open PureSFormal.Research.ProtectedTrieExecutableScheduleStrong
open PureSFormal.Research.ProtectedTrieObserverBoundary
open PureSFormal.Research.ProtectedTrieFairness
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieStrongTheorem
open PureSFormal.Research.ProtectedTrieSubdivision

/--
The complete compatibility contract.  Besides the all-reduct target certificate for
the quantified ordered-binary source, it packages literal terminal semantics,
the bounded canonical terminal-candidate bridge, the state-merged graph
quotient, computed checkpoint schedules and
nonvacuity, exact finite reduction enumeration, the terminal-observation
semidecider, and the internal deterministic and finite-branch source bridges.
-/
structure CompleteStrongWholeMultiwayCertificate (source : Instance) : Prop where
  target : StrongWholeMultiwayCertificate source
  initialObserverEmpty :
    labelledProjection (strongEncoder source) = []
  initialCountedObserverEmpty :
    (runWholeLabelledObserver (strongEncoder source)).value = []
  observerNonfabrication : forall
      {term : PureSFormal.PureS.Term} {entry : LabelledHistory},
    List.Mem entry (runWholeLabelledObserver term).value ->
      List.Mem (a entry.history entry.payload) (anchoredOpenedPaths term) /\
      exists bits decodedSource rows finalRow,
        headerBits? term = some bits /\
        decodeInstance? bits = some decodedSource /\
        decodeTableau? entry.payload = some rows /\
        verifyRows decodedSource entry.history rows = true /\
        lastRow? rows = some finalRow /\
        entry.label = labelOfRow decodedSource.machine finalRow
  observerTargetGenerated :
    exists term entry,
      PureSFormal.PureS.Steps (strongEncoder source) term /\
      List.Mem entry (runWholeLabelledObserver term).value
  terminalObservation :
    SourceBranchHalts source <-> TargetTerminalObservation source
  boundedTerminalCandidate :
    (exists bound, BoundedTerminalCandidate source bound) <->
      SourceBranchHalts source
  fairPathSemanticLiveness : forall
      (path : EncoderReductionPath source),
    StructurallyFair path.term ->
    forall history, ValidHistory source history ->
      exists stage, (strongProjection (path.term stage)).Contains history
  fairPathLiteralLiveness : forall
      (path : EncoderReductionPath source),
    StructurallyFair path.term ->
    forall history, ValidHistory source history ->
      exists stage entry,
        List.Mem entry (labelledProjection (path.term stage)) /\
        entry.history = history
  configurationQuotient : ConfigurationQuotientCertificate source
  executableNonvacuity : NonvacuityCertificate source
  executableEdge : forall (history : BitWord) (bit : Bool),
    ValidHistory source history ->
    ValidHistory source (history ++ [bit]) ->
      PureSFormal.Research.ProtectedTrieExecutableSchedule.ExecutableEdgeCertificate
        PureSFormal.Research.ProtectedTrieStrong.sourceVerifier
        PureSFormal.Research.ProtectedTrieStrong.sourceWitness
        (encodeInstance source) history bit
  oneStepEnumeration : forall before after : PureSFormal.PureS.Term,
    after ∈
        PureSFormal.Research.ProtectedTrieStrongCompleteness.oneStepResults before <->
      PureSFormal.PureS.Step before after
  finiteReductionEnumeration : forall before after : PureSFormal.PureS.Term,
    PureSFormal.PureS.Steps before after <->
      exists depth,
        after ∈
          PureSFormal.Research.ProtectedTrieStrongCompleteness.reductionLayer
            depth before
  terminalObservationSemidecidable :
    PureSFormal.Computation.BoundedlySemidecidable
      PureSFormal.Research.ProtectedTrieStrongCompleteness.EventuallyTerminalObserved
  deterministicHalting : forall
      deterministicSource :
        PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Instance,
    PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts
        deterministicSource <->
      TargetTerminalObservation
        (PureSFormal.Research.ProtectedTrieDeterministicCompiler.compileInstance
          deterministicSource)
  deterministicHaltingReduction :
    PureSFormal.Computation.ReducesVia
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.compileInstance
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts
      TargetTerminalObservation
  deterministicHaltingManyOne :
    PureSFormal.Computation.ManyOneReduces
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts
      TargetTerminalObservation
  deterministicHaltingTermReduction :
    PureSFormal.Computation.ReducesVia
      (fun deterministicSource =>
        strongEncoder
          (PureSFormal.Research.ProtectedTrieDeterministicCompiler.compileInstance
            deterministicSource))
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts
      PureSFormal.Research.ProtectedTrieStrongCompleteness.EventuallyTerminalObserved
  deterministicHaltingTermManyOne :
    PureSFormal.Computation.ManyOneReduces
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts
      PureSFormal.Research.ProtectedTrieStrongCompleteness.EventuallyTerminalObserved
  deterministicAcceptanceSemidecidable :
    PureSFormal.Computation.BoundedlySemidecidable
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Accepts
  finiteBranchFirstReturn : forall
      finiteSource :
        PureSFormal.Research.FiniteBranchBinaryCompiler.FiniteInstance,
    PureSFormal.Research.FiniteBranchBinaryMachineCompiler.FlatBinaryFirstReturnCertificate
      finiteSource

/-- Every explicit finite ordered-binary source instance satisfies the entire
compatibility contract. -/
theorem strongWholeMultiwayUniversality (source : Instance) :
    CompleteStrongWholeMultiwayCertificate source := by
  refine {
    target :=
      PureSFormal.Research.ProtectedTrieStrongTheorem.strongWholeMultiwayUniversality
        source
    initialObserverEmpty := strongEncoder_initialLabelledProjection_empty source
    initialCountedObserverEmpty := by
      rw [runWholeLabelledObserver_labels]
      exact strongEncoder_initialLabelledProjection_empty source
    observerNonfabrication := ?_
    observerTargetGenerated := ?_
    terminalObservation := sourceBranchHalts_iff_targetTerminalObservation source
    boundedTerminalCandidate := exists_boundedTerminalCandidate_iff source
    fairPathSemanticLiveness := fair_path_eventually_strongProjection source
    fairPathLiteralLiveness := fair_path_eventually_labelledProjection source
    configurationQuotient := configurationQuotientCertificate source
    executableNonvacuity := strongExecutableNonvacuity source
    executableEdge := strongSourceEdgeSchedule_executable_certificate source
    oneStepEnumeration := ?_
    finiteReductionEnumeration := ?_
    terminalObservationSemidecidable :=
      PureSFormal.Research.ProtectedTrieStrongCompleteness.eventuallyTerminalObserved_semidecidable
    deterministicHalting :=
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.halts_iff_targetTerminalObservation
    deterministicHaltingReduction :=
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.deterministicHalting_reducesVia_targetTerminalObservation
    deterministicHaltingManyOne :=
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.deterministicHalting_manyOne_targetTerminalObservation
    deterministicHaltingTermReduction :=
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.deterministicHalting_reducesVia_eventuallyTerminalObserved
    deterministicHaltingTermManyOne :=
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.deterministicHalting_manyOne_eventuallyTerminalObserved
    deterministicAcceptanceSemidecidable :=
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.compiledAcceptance_semidecidable
    finiteBranchFirstReturn :=
      PureSFormal.Research.FiniteBranchBinaryMachineCompiler.finiteBranchBinaryMachineFirstReturn
  }
  · intro term entry hmem
    rw [runWholeLabelledObserver_labels] at hmem
    refine ⟨labelledProjection_candidate_mem hmem, ?_⟩
    exact labelledProjection_literal_final hmem
  · have hroot : ValidHistory source [] := ⟨initialRow source, rfl⟩
    obtain ⟨entry, hmem, _⟩ :=
      labelledProjection_checkpoint_contains_prefix
        source [] [] hroot (WordPrefix.refl [])
    refine ⟨subdivisionCheckpoint sourceWitness (encodeInstance source) [],
      entry, strong_subdivisionCheckpoint_reachable source [] hroot, ?_⟩
    rw [runWholeLabelledObserver_labels]
    exact hmem
  · exact PureSFormal.Research.ProtectedTrieStrongCompleteness.mem_oneStepResults_iff
  · intro before after
    constructor
    · exact
        PureSFormal.Research.ProtectedTrieStrongCompleteness.steps_mem_some_reductionLayer
    · rintro ⟨depth, hmem⟩
      exact
        PureSFormal.Research.ProtectedTrieStrongCompleteness.mem_reductionLayer_steps
          hmem

/-- Source branch halting is exactly reachable literal terminal observation
in the unrestricted pure-`S` reduction cone. -/
theorem strongTerminalObservationIff (source : Instance) :
    SourceBranchHalts source <-> TargetTerminalObservation source :=
  (strongWholeMultiwayUniversality source).terminalObservation

/-- The semantic history projection of the finite encoder contains no
history.  Computation records enter the projection only after pure-`S`
contractions expose protected certificates. -/
theorem strongInitialProjectionEmpty (source : Instance) (history : BitWord) :
    Not ((strongProjection (strongEncoder source)).Contains history) :=
  (strongWholeMultiwayUniversality source).target.initial history

/-- The fixed observer emits no accepted history at the finite encoder;
accepted source records arise only after pure-`S` contractions expose their
literal protected certificates. -/
theorem strongInitialObserverEmpty (source : Instance) :
    labelledProjection (strongEncoder source) = [] :=
  (strongWholeMultiwayUniversality source).initialObserverEmpty

/-- The executed metered observer itself returns the empty compact output on
the finite encoder, before any pure-`S` contraction exposes a protected
certificate. -/
theorem strongInitialCountedObserverEmpty (source : Instance) :
    (runWholeLabelledObserver (strongEncoder source)).value = [] :=
  (strongWholeMultiwayUniversality source).initialCountedObserverEmpty

/-- Every record returned by the executed observer is anchored at a literal
opened certificate address in the current term and is copied from a tableau
that the decoded frozen source accepts. -/
theorem strongObserverOutputHasLiteralCertificate
    {term : PureSFormal.PureS.Term} {entry : LabelledHistory}
    (hmem : List.Mem entry (runWholeLabelledObserver term).value) :
    List.Mem (a entry.history entry.payload) (anchoredOpenedPaths term) /\
    exists bits decodedSource rows finalRow,
      headerBits? term = some bits /\
      decodeInstance? bits = some decodedSource /\
      decodeTableau? entry.payload = some rows /\
      verifyRows decodedSource entry.history rows = true /\
      lastRow? rows = some finalRow /\
      entry.label = labelOfRow decodedSource.machine finalRow :=
  by
    rw [runWholeLabelledObserver_labels] at hmem
    exact
      ⟨labelledProjection_candidate_mem hmem,
        labelledProjection_literal_final hmem⟩

/-- For every source instance, pure-`S` contractions reach a term on which
the executed observer emits a literal computation record.  Together with
`strongInitialCountedObserverEmpty`, this rules out a constant or preloaded
observer for the displayed construction. -/
theorem strongObserverTargetGenerated (source : Instance) :
    exists term entry,
      PureSFormal.PureS.Steps (strongEncoder source) term /\
      List.Mem entry (runWholeLabelledObserver term).value :=
  (strongWholeMultiwayUniversality source).observerTargetGenerated

/-- The executed observer is not constant on any encoded source cone: it is
empty at the encoder and becomes nonempty after a finite pure-`S` reduction.
This directly excludes constant-output and preloaded-answer observers for the
displayed construction. -/
theorem strongObserverNonconstantOnCone (source : Instance) :
    exists term,
      PureSFormal.PureS.Steps (strongEncoder source) term /\
      (runWholeLabelledObserver (strongEncoder source)).value = [] /\
      (runWholeLabelledObserver term).value ≠ [] := by
  obtain ⟨term, entry, hsteps, hmem⟩ := strongObserverTargetGenerated source
  refine ⟨term, hsteps, strongInitialCountedObserverEmpty source, ?_⟩
  intro hempty
  rw [hempty] at hmem
  exact List.not_mem_nil hmem

/-! ## Structural fairness and pathwise liveness -/

/-- Source-independent structural fairness: every finite protected address is
eventually literal in the anchored trie of the current term. -/
abbrev StrongStructuralFairness := StructurallyFair

/-- A genuine one-contraction path beginning at one encoded source. -/
abbrev StrongEncoderReductionPath := EncoderReductionPath

/-- Along every structurally fair one-contraction path from the encoder, each
valid source history eventually belongs to the semantic projection. -/
theorem strongFairPathEventuallyProjects
    (source : Instance) (path : StrongEncoderReductionPath source)
    (hfair : StrongStructuralFairness path.term)
    (history : BitWord) (hvalid : ValidHistory source history) :
    exists stage, (strongProjection (path.term stage)).Contains history :=
  (strongWholeMultiwayUniversality source).fairPathSemanticLiveness
    path hfair history hvalid

/-- Along every structurally fair one-contraction path from the encoder, each
valid history eventually has its own literal current-term labelled record. -/
theorem strongFairPathEventuallyLabels
    (source : Instance) (path : StrongEncoderReductionPath source)
    (hfair : StrongStructuralFairness path.term)
    (history : BitWord) (hvalid : ValidHistory source history) :
    exists stage entry,
      List.Mem entry (labelledProjection (path.term stage)) /\
      entry.history = history :=
  (strongWholeMultiwayUniversality source).fairPathLiteralLiveness
    path hfair history hvalid

/-- Canonical complete-prefix macro boundaries start at the strong encoder. -/
theorem strongFairMacroSequenceStarts (source : Instance) :
    fairMacroTerm (encodeInstance source) 0 = strongEncoder source := rfl

/-- Consecutive canonical complete-prefix macro boundaries are connected by a
finite genuine pure-`S` reduction. -/
theorem strongFairMacroSequenceAdvances (source : Instance) (depth : Nat) :
    PureSFormal.PureS.Steps
      (fairMacroTerm (encodeInstance source) depth)
      (fairMacroTerm (encodeInstance source) (depth + 1)) :=
  fairMacroTerm_steps (encodeInstance source) depth

/-- The canonical complete-prefix macro-boundary sequence is structurally
fair independently of which source is frozen in its header. -/
theorem strongFairMacroSequenceStructurallyFair (source : Instance) :
    StrongStructuralFairness
      (fairMacroTerm (encodeInstance source)) :=
  fairMacroTerm_structurallyFair (encodeInstance source)

/-- The concrete structurally fair macro sequence eventually carries a
literal current-term label for every valid history. -/
theorem strongFairMacroSequenceEventuallyLabels
    (source : Instance) (history : BitWord)
    (hvalid : ValidHistory source history) :
    exists depth entry,
      List.Mem entry
        (labelledProjection
          (fairMacroTerm (encodeInstance source) depth)) /\
      entry.history = history :=
  fairMacroTerm_eventually_labelled source history hvalid

/-- From every reduct, every finite list of structural fairness obligations
can be met by a common descendant without losing an already opened path. -/
theorem strongFiniteFairnessObligationsExtendible
    (source : Instance) {reduct : PureSFormal.PureS.Term}
    (hreach : PureSFormal.PureS.Steps (strongEncoder source) reduct)
    (addresses : List BitWord) :
    exists target,
      PureSFormal.PureS.Steps reduct target /\
      (forall old,
        List.Mem old (anchoredOpenedPaths reduct) ->
        List.Mem old (anchoredOpenedPaths target)) /\
      (forall address, List.Mem address addresses ->
        List.Mem address (anchoredOpenedPaths target)) := by
  exact finite_fairness_obligations_extendible
    (bits := encodeInstance source)
    (by simpa [strongEncoder] using hreach) addresses

/-! ## Extensional verifier-language boundary for candidate predicates -/

/-- A source-indexed Boolean predicate on supplied literal
history/tableau candidates. -/
abbrev CandidateObserverPredicate := CandidatePredicate

/-- The predicate accepts no more literal records than the verified tableau
language.  This is an extensional condition, not an implementation mandate. -/
abbrev CandidateObserverRefinesVerifier := PointwiseRefinesVerifier

/-- The predicate accepts every verifier-accepted literal record. -/
abbrev CandidateObserverCompleteForVerifier :=
  PointwiseCompleteForVerifier

/-- The predicate and verifier agree exactly on every supplied literal
history/tableau record. -/
abbrev CandidateObserverAgreesWithVerifier :=
  PointwiseAgreesWithVerifier

/-- Every accepted candidate exposed in an encoded pure-`S` cone passes the
verified tableau checker for that cone's source. -/
abbrev ConeWideCandidateObserverSound := ConeWideLiteralSound

/-- Accepting one verifier-rejected supplied record has a reachable
counterexample: the source-independent protected body exposes that record at
a finite pure-`S` descendant. The explicit address-list schedule is proved
separately and supplies this existence proof internally. -/
theorem strongInvalidCandidateAcceptanceReachable
    (candidate : CandidateObserverPredicate)
    {source : Instance} {history payload : BitWord}
    (hcandidate : candidate source history payload = true)
    (hinvalid : verify source history payload = false) :
    exists term,
      PureSFormal.PureS.Steps (strongEncoder source) term /\
      List.Mem (a history payload) (anchoredOpenedPaths term) /\
      candidate source history payload = true /\
      verify source history payload = false :=
  invalidCandidateAcceptance_reachable candidate hcandidate hinvalid

/-- A source-indexed Boolean candidate predicate is cone-wide sound on exposed
literal computation records if and only if it extensionally refines the
verified tableau language. Thus
transition-inconsistent acceptances cannot be hidden in unreachable
certificates; this theorem does not require any particular checker algorithm
or a literal call to `step?`. It is not a statement about arbitrary
current-term observers or an implementation/time lower bound. -/
theorem strongConeWideCandidateObserverSoundIffRefinesVerifier
    (candidate : CandidateObserverPredicate) :
    ConeWideCandidateObserverSound candidate <->
      CandidateObserverRefinesVerifier candidate :=
  coneWideLiteralSound_iff_pointwiseRefinesVerifier candidate

/-- Cone-wide soundness and pointwise completeness together hold exactly when
the candidate predicate agrees with the verified tableau language on every
source, history, and payload.  The result remains implementation-agnostic. -/
theorem strongConeWideCandidateObserverSoundAndCompleteIffAgreesWithVerifier
    (candidate : CandidateObserverPredicate) :
    (ConeWideCandidateObserverSound candidate /\
      CandidateObserverCompleteForVerifier candidate) <->
        CandidateObserverAgreesWithVerifier candidate :=
  coneWideLiteralSound_and_complete_iff_pointwiseAgreesWithVerifier candidate

/-- Every bare-current-term literal-record observer that is sound throughout
every encoded cone and complete on canonical candidate terms agrees with the
verified tableau language exactly at those terms.  This is extensional and
asserts neither an implementation nor a time lower bound. -/
theorem strongCurrentTermObserverCandidateIff
    (observer :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.CurrentTermObserver)
    (sound :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.ConeWideRecordSound
        observer)
    (complete :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.CanonicalCandidateComplete
        observer)
    (source : Instance) (history payload : BitWord) :
    PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.Emits
        observer
        (PureSFormal.Research.ProtectedTrieBoundedTerminal.candidateTerm
          source history payload)
        history payload <->
      verify source history payload = true :=
  PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.emits_candidateTerm_iff_verify
    observer sound complete source history payload

/-- The transparent canonical-candidate query map is a pointwise reduction
from verified tableaux to acceptance by any cone-wide sound and canonically
complete current-term observer. -/
theorem strongVerifiedCandidateReducesViaCurrentTermObserver
    (observer :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.CurrentTermObserver)
    (sound :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.ConeWideRecordSound
        observer)
    (complete :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.CanonicalCandidateComplete
        observer) :
    PureSFormal.Computation.ReducesVia
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.candidateQuery
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.VerifiedCandidate
      (PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.ObserverAccepts
        observer) :=
  PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.verifiedCandidate_reducesVia_observer
    observer sound complete

/-- The same transparent map supplies the corresponding extensional
`ManyOneReduces` witness. -/
theorem strongVerifiedCandidateManyOneCurrentTermObserver
    (observer :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.CurrentTermObserver)
    (sound :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.ConeWideRecordSound
        observer)
    (complete :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.CanonicalCandidateComplete
        observer) :
    PureSFormal.Computation.ManyOneReduces
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.VerifiedCandidate
      (PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.ObserverAccepts
        observer) :=
  PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.verifiedCandidate_manyOneReduces_observer
    observer sound complete

/-- A literal two-row tableau query reduces the ordered source transition
from the encoded initial row to acceptance by every cone-wide sound and
canonically complete current-term observer.  The query carries its proposed
successor row literally. -/
theorem strongInitialSourceStepReducesViaCurrentTermObserver
    (observer :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.CurrentTermObserver)
    (sound :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.ConeWideRecordSound
        observer)
    (complete :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.CanonicalCandidateComplete
        observer) :
    PureSFormal.Computation.ReducesVia
      PureSFormal.Research.ProtectedTrieObserverBoundary.initialStepQuery
      PureSFormal.Research.ProtectedTrieObserverBoundary.InitialSourceStep
      (PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.ObserverAccepts
        observer) :=
  PureSFormal.Research.ProtectedTrieObserverBoundary.initialSourceStep_reducesVia_observer
    observer sound complete

/-- The same literal two-row query gives the corresponding extensional
many-one reduction. -/
theorem strongInitialSourceStepManyOneCurrentTermObserver
    (observer :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.CurrentTermObserver)
    (sound :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.ConeWideRecordSound
        observer)
    (complete :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.CanonicalCandidateComplete
        observer) :
    PureSFormal.Computation.ManyOneReduces
      PureSFormal.Research.ProtectedTrieObserverBoundary.InitialSourceStep
      (PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.ObserverAccepts
        observer) :=
  PureSFormal.Research.ProtectedTrieObserverBoundary.initialSourceStep_manyOneReduces_observer
    observer sound complete

/-- Every unrestricted reduct of an encoded source decodes its frozen header
to exactly that source instance. -/
theorem strongEncoderConeCurrentSource
    (source : Instance) {term : PureSFormal.PureS.Term}
    (hreach : PureSFormal.PureS.Steps
      (PureSFormal.Research.ProtectedTrieStrong.strongEncoder source) term) :
    PureSFormal.Research.ProtectedTrieObserverBoundary.currentSource? term =
      some source :=
  PureSFormal.Research.ProtectedTrieObserverBoundary.strongEncoder_cone_currentSource
    source hreach

/-- Unrestricted encoder cones for distinct source instances are disjoint. -/
theorem strongEncoderConesSourceSeparated
    {left right : Instance} {term : PureSFormal.PureS.Term}
    (hleft : PureSFormal.PureS.Steps
      (PureSFormal.Research.ProtectedTrieStrong.strongEncoder left) term)
    (hright : PureSFormal.PureS.Steps
      (PureSFormal.Research.ProtectedTrieStrong.strongEncoder right) term) :
    left = right :=
  PureSFormal.Research.ProtectedTrieObserverBoundary.strongEncoder_cones_source_separated
    hleft hright

/-- No fixed-depth root-prefix observer can both emit every verified record at
its canonical term and restrict every emitted record to a literal address
open in the current encoded term.  The provenance premise is essential: it
is stronger than verifier soundness alone. -/
theorem strongNoFixedDepthCompleteProvenanceObserver
    (depth : Nat)
    (observer :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.CurrentTermObserver)
    (locality :
      PureSFormal.Research.ProtectedTrieObserverBoundary.PrefixLocality.PrefixLocal
        depth observer)
    (complete :
      PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity.CanonicalCandidateComplete
        observer)
    (provenance :
      PureSFormal.Research.ProtectedTrieObserverBoundary.PrefixLocality.ConeWideRecordProvenance
        observer) : False :=
  PureSFormal.Research.ProtectedTrieObserverBoundary.PrefixLocality.no_fixed_depth_complete_provenance_observer
    depth observer locality complete provenance

/-- The concrete package observer, after erasing its final-row labels, is not
local to any fixed-depth root prefix. -/
theorem strongLabelledLiteralObserverNotPrefixLocal (depth : Nat) :
    ¬ PureSFormal.Research.ProtectedTrieObserverBoundary.PrefixLocality.PrefixLocal
        depth
        PureSFormal.Research.ProtectedTrieObserverBoundary.PrefixLocality.labelledLiteralObserver :=
  PureSFormal.Research.ProtectedTrieObserverBoundary.PrefixLocality.labelledLiteralObserver_not_prefixLocal
    depth

/-- Existence of an explicitly replayable bounded canonical terminal-candidate
program is exactly source branch halting.  The bound charges the literal
root-relative contraction schedule; source-runtime bounds require a separate
clocked-source theorem. -/
theorem strongBoundedTerminalCandidateIff (source : Instance) :
    (exists bound, BoundedTerminalCandidate source bound) <->
      SourceBranchHalts source :=
  (strongWholeMultiwayUniversality source).boundedTerminalCandidate

/-- Constructive graph quotient from valid ordered occurrence histories to
the ordinary reachable state-merged configuration graph. -/
theorem strongStateMergedConfigurationQuotient (source : Instance) :
    ConfigurationQuotientCertificate source :=
  (strongWholeMultiwayUniversality source).configurationQuotient

/-- Computed root-relative schedules are nonvacuous and separate every valid
source edge and every finite or infinite valid branch prefix. -/
theorem strongExecutableScheduleNonvacuity (source : Instance) :
    NonvacuityCertificate source :=
  (strongWholeMultiwayUniversality source).executableNonvacuity

/-- The literal computed schedule for a valid source edge has exact replay,
preparation stuttering, and one final projection event. -/
theorem strongExecutableEdgeCertificate (source : Instance)
    (history : BitWord) (bit : Bool)
    (hsource : ValidHistory source history)
    (htarget : ValidHistory source (history ++ [bit])) :
    PureSFormal.Research.ProtectedTrieExecutableSchedule.ExecutableEdgeCertificate
      PureSFormal.Research.ProtectedTrieStrong.sourceVerifier
      PureSFormal.Research.ProtectedTrieStrong.sourceWitness
      (encodeInstance source) history bit :=
  (strongWholeMultiwayUniversality source).executableEdge
    history bit hsource htarget

/-- The executable finite successor list contains exactly the contextual
pure-`S` one-step reducts. -/
theorem strongOneStepEnumerationExact
    (source target : PureSFormal.PureS.Term) :
    target ∈
        PureSFormal.Research.ProtectedTrieStrongCompleteness.oneStepResults source <->
      PureSFormal.PureS.Step source target :=
  PureSFormal.Research.ProtectedTrieStrongCompleteness.mem_oneStepResults_iff
    source target

/-- Finite layer enumeration is exact for arbitrary finite contextual
pure-`S` reductions. -/
theorem strongFiniteReductionEnumerationExact
    (source target : PureSFormal.PureS.Term) :
    PureSFormal.PureS.Steps source target <->
      exists depth,
        target ∈
          PureSFormal.Research.ProtectedTrieStrongCompleteness.reductionLayer
            depth source := by
  constructor
  · exact PureSFormal.Research.ProtectedTrieStrongCompleteness.steps_mem_some_reductionLayer
  · rintro ⟨depth, hmem⟩
    exact PureSFormal.Research.ProtectedTrieStrongCompleteness.mem_reductionLayer_steps
      hmem

/-- Reachable literal terminal observation is semidecidable by an explicit
finite contextual-reduction depth. -/
theorem strongTerminalObservationSemidecidable :
    PureSFormal.Computation.BoundedlySemidecidable
      PureSFormal.Research.ProtectedTrieStrongCompleteness.EventuallyTerminalObserved :=
  PureSFormal.Research.ProtectedTrieStrongCompleteness.eventuallyTerminalObserved_semidecidable

/-- Halting of the independently defined conventional deterministic Boolean
single-tape source is exactly terminal observation in the unrestricted
pure-`S` reduction cone of its compiled instance. -/
theorem strongDeterministicTapeHaltingIff
    (source :
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Instance) :
    PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts source <->
      TargetTerminalObservation
        (PureSFormal.Research.ProtectedTrieDeterministicCompiler.compileInstance source) :=
  PureSFormal.Research.ProtectedTrieDeterministicCompiler.halts_iff_targetTerminalObservation
    source

/-- The displayed structural source compiler is a named pointwise reduction
from conventional deterministic tape halting to reachable literal terminal
observation in the unrestricted pure-`S` reduction cone. -/
theorem strongDeterministicTapeHaltingReduction :
    PureSFormal.Computation.ReducesVia
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.compileInstance
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts
      TargetTerminalObservation :=
  PureSFormal.Research.ProtectedTrieDeterministicCompiler.deterministicHalting_reducesVia_targetTerminalObservation

/-- The same transparent structural compiler supplies an extensional
`ManyOneReduces` witness from conventional deterministic tape halting to
reachable literal terminal observation. This wrapper records the pointwise
equivalence; it does not internalize a machine model of computability. -/
theorem strongDeterministicTapeHaltingManyOne :
    PureSFormal.Computation.ManyOneReduces
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts
      TargetTerminalObservation :=
  PureSFormal.Research.ProtectedTrieDeterministicCompiler.deterministicHalting_manyOne_targetTerminalObservation

/-- The explicit composite encoder maps a conventional deterministic tape
instance to one closed pure-`S` term, and halting is equivalent to reachable
literal terminal observation from that term. -/
theorem strongDeterministicTapeHaltingTermReduction :
    PureSFormal.Computation.ReducesVia
      (fun source => strongEncoder
        (PureSFormal.Research.ProtectedTrieDeterministicCompiler.compileInstance
          source))
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts
      PureSFormal.Research.ProtectedTrieStrongCompleteness.EventuallyTerminalObserved :=
  PureSFormal.Research.ProtectedTrieDeterministicCompiler.deterministicHalting_reducesVia_eventuallyTerminalObserved

/-- The transparent composite term encoder supplies an extensional
`ManyOneReduces` witness from conventional deterministic tape halting to the
language of pure-`S` terms from which a literal terminal record is reachable.
This wrapper records the pointwise equivalence; ordinary computability of the
displayed structural encoder is a metatheoretic reading. -/
theorem strongDeterministicTapeHaltingTermManyOne :
    PureSFormal.Computation.ManyOneReduces
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts
      PureSFormal.Research.ProtectedTrieStrongCompleteness.EventuallyTerminalObserved :=
  PureSFormal.Research.ProtectedTrieDeterministicCompiler.deterministicHalting_manyOne_eventuallyTerminalObserved

/-- The conventional deterministic source acceptance language has an
explicit bounded semidecision procedure after compilation to pure `S`. -/
theorem strongDeterministicTapeAcceptanceSemidecidable :
    PureSFormal.Computation.BoundedlySemidecidable
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Accepts :=
  PureSFormal.Research.ProtectedTrieDeterministicCompiler.compiledAcceptance_semidecidable

/-- Every finite ordered-list branching source has one concrete flat
natural-numbered ordered-binary first-return compiler.  The certificate is
premise-free and includes exact macrostep and complete-history execution,
terminality preservation/reflection, occurrence-code injectivity, and
selector-state exclusion. -/
theorem strongFiniteBranchBinaryFirstReturn
    (source :
      PureSFormal.Research.FiniteBranchBinaryCompiler.FiniteInstance) :
    PureSFormal.Research.FiniteBranchBinaryMachineCompiler.FlatBinaryFirstReturnCertificate
      source :=
  PureSFormal.Research.FiniteBranchBinaryMachineCompiler.finiteBranchBinaryMachineFirstReturn
    source

end PureSFormal.StrongMultiwayUniversality
