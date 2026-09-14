import PureSFormal.Research.ProtectedTrieFairStream
import PureSFormal.Research.ProtectedTrieStrongTheorem

/-!
# Protected persistent certificate enumeration

One encoded pure-`S` term carries a protected binary trie of literal
certificates.  Arbitrary finite reductions preserve every projected history;
every finite valid history ideal occurs exactly at a reachable checkpoint;
and every reachable reduct has a common extension containing any requested
finite valid ideal.  Exact checkpoints and internally disjoint source-edge
paths embed the ordered computation-history tree.

The current-term observer parses the frozen source header and literal opened
candidate addresses.  It decodes each returned payload as a tableau and
checks that tableau with `verifyRows`, which evaluates the encoded source
transition relation.  The adjacent-step canonical path is address-complete
and eventually exposes a literal labelled record for every valid history.
-/

namespace PureSFormal.Research.ProtectedTrieCertificateEnumeration

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieFairStream
open PureSFormal.Research.ProtectedTrieLabelledObserver
open PureSFormal.Research.ProtectedTrieLabelSemantics
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineAgreement
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieStrongTheorem
open PureSFormal.Research.ProtectedTrieSubdivision
open PureSFormal.Research.ProtectedTrieTableau
open PureSFormal.Research.ProtectedTrieTableauLabel

/-- Positive observer-boundary evidence for one emitted record.  The record
comes from an opened literal candidate address, and its payload is a decoded
tableau accepted by the frozen source transition checker. -/
structure ParsedCheckedRecord (source : Instance) (term : Term)
    (entry : LabelledHistory) : Prop where
  openedCandidate :
    List.Mem (a entry.history entry.payload) (anchoredOpenedPaths term)
  decodedTableau : exists rows finalRow,
    decodeTableau? entry.payload = some rows /\
    verifyRows source entry.history rows = true /\
    lastRow? rows = some finalRow /\
    entry.label = labelOfRow source.machine finalRow

/-- Every record returned on the encoder cone has literal provenance and a
payload checked against the frozen source machine. -/
theorem parsedCheckedRecord_of_mem
    (source : Instance) {term : Term} {entry : LabelledHistory}
    (hreach : Steps (strongEncoder source) term)
    (hmem : List.Mem entry (labelledProjection term)) :
    ParsedCheckedRecord source term entry := by
  obtain ⟨body, _hbody, hterm⟩ := encoder_steps_preserves hreach
  have hheader : headerBits? term = some (encodeInstance source) := by
    rw [hterm]
    exact headerBits?_seededHeader (encodeInstance source) body
  have hopen :
      List.Mem (a entry.history entry.payload) (anchoredOpenedPaths term) := by
    unfold labelledProjection at hmem
    simp only [hheader, decodeInstance?_encodeInstance] at hmem
    exact (mem_collectLabels source (anchoredOpenedPaths term) entry hmem).1
  obtain ⟨rows, finalRow, hdecode, hcheck, hfinal, hlabel⟩ :=
    labelledProjection_literal_final_on_cone source hreach hmem
  exact ⟨hopen, rows, finalRow, hdecode, hcheck, hfinal, hlabel⟩

/-- Exact protected checkpoints and concrete source-edge paths embed the
ordered computation-history tree in the pure-`S` reduction graph. -/
structure EmbeddedComputationHistoryTree (source : Instance) : Prop where
  checkpointReachable : forall history : BitWord,
    ValidHistory source history ->
      Steps (strongEncoder source)
        (subdivisionCheckpoint sourceWitness (encodeInstance source) history)

  checkpointExact : forall history : BitWord,
    ValidHistory source history ->
      (strongProjection
        (subdivisionCheckpoint sourceWitness (encodeInstance source) history)
      ).Equivalent (branchIdeal history)

  sourceEdgePath : forall
      edge : HistoryEdge (SourceValid (encodeInstance source)),
    Nonempty (Walk.SimplePath Step
      (subdivisionCheckpoint sourceWitness (encodeInstance source)
        edge.source)
      (subdivisionCheckpoint sourceWitness (encodeInstance source)
        (edge.source ++ [edge.bit])))

  directedGeometry :
    (forall {left right}
        (_hleft : SourceValid (encodeInstance source) left)
        (_hright : SourceValid (encodeInstance source) right),
      subdivisionCheckpoint sourceWitness (encodeInstance source) left =
          subdivisionCheckpoint sourceWitness (encodeInstance source) right ->
        left = right) /\
    (forall (left right :
        HistoryEdge (SourceValid (encodeInstance source))), left ≠ right ->
      Walk.InternallyDisjoint
        (subdivisionSimpleEdgePath sourceWitness
          (encodeInstance source) left.source left.bit).walk
        (subdivisionSimpleEdgePath sourceWitness
          (encodeInstance source) right.source right.bit).walk) /\
    (forall (edge : HistoryEdge (SourceValid (encodeInstance source)))
        (vertex : Term),
      (subdivisionSimpleEdgePath sourceWitness
        (encodeInstance source) edge.source edge.bit).walk.Interior vertex ->
      forall history
          (_hvalid : SourceValid (encodeInstance source) history),
        vertex ≠ subdivisionCheckpoint sourceWitness
          (encodeInstance source) history)

/-- The protected-trie result, stated as persistent certificate enumeration.
Every field refers to the current bare term and the single total
`labelledProjection` observer. -/
structure ProtectedPersistentCertificateEnumeration
    (source : Instance) : Prop where
  allReductPermanence : forall {before after : Term},
    Steps (strongEncoder source) before -> Steps before after ->
      PersistentReaches (ValidHistory source)
        (strongProjection before) (strongProjection after)

  decodedRangeSound : forall {term : Term} {history : BitWord},
    Steps (strongEncoder source) term ->
    (strongProjection term).Contains history ->
      ValidHistory source history

  exactFiniteRange : forall ideal : HistoryIdeal,
    SourceIdealValid source ideal ->
      exists checkpoint,
        Steps (strongEncoder source) checkpoint /\
        (strongProjection checkpoint).Equivalent ideal

  cofinalRecovery : forall {reduct : Term},
    Steps (strongEncoder source) reduct ->
    forall ideal : HistoryIdeal, SourceIdealValid source ideal ->
      exists join,
        Steps reduct join /\
        (strongProjection reduct).LE (strongProjection join) /\
        ideal.LE (strongProjection join)

  historyTree : EmbeddedComputationHistoryTree source

  observerBoundary : forall {term : Term} {entry : LabelledHistory},
    Steps (strongEncoder source) term ->
    List.Mem entry (labelledProjection term) ->
      ParsedCheckedRecord source term entry

  sourceTransitionAgreement : forall (row next : Row) (slot : Bool),
    step? source.machine row slot = some next <->
      TextbookStep source.machine row slot next

  addressCompleteAdjacentPath :
    exists path : AddressCompleteCanonicalPath (encodeInstance source),
      forall history : BitWord, ValidHistory source history ->
        exists ticks entry,
          List.Mem entry (labelledProjection (path.term ticks)) /\
          entry.history = history

/-- Every explicit ordered-binary source instance has protected persistent
certificate enumeration with an embedded history tree and an address-complete
adjacent-step canonical path. -/
theorem protectedPersistentCertificateEnumeration (source : Instance) :
    ProtectedPersistentCertificateEnumeration source := by
  let path := addressCompleteCanonicalPath (encodeInstance source)
  refine {
    allReductPermanence := ?_
    decodedRangeSound := ?_
    exactFiniteRange := ?_
    cofinalRecovery := ?_
    historyTree := ?_
    observerBoundary := ?_
    sourceTransitionAgreement := ?_
    addressCompleteAdjacentPath := ?_ }
  · intro before after hbefore hafter
    exact strongProjection_steps_reaches source hbefore hafter
  · intro term history hreach hcontains
    exact strongProjection_contains_valid_on_cone source hreach hcontains
  · intro ideal hideal
    refine ⟨strongCheckpoint source ideal [], ?_, ?_⟩
    · exact strongEncoder_steps_checkpoint source ideal []
    · exact strongCheckpoint_exact source ideal hideal []
  · intro reduct hreach ideal hideal
    exact strong_cofinal_complete source hreach ideal hideal
  · exact {
      checkpointReachable := strong_subdivisionCheckpoint_reachable source
      checkpointExact := strong_subdivisionCheckpoint_exact source
      sourceEdgePath := strongSourceEdgeSimplePath_nonempty source
      directedGeometry := strong_simple_directed_subdivision source }
  · intro term entry hreach hmem
    exact parsedCheckedRecord_of_mem source hreach hmem
  · intro row next slot
    exact step?_eq_some_iff_textbookStep source.machine row next slot
  · refine ⟨path, ?_⟩
    intro history hvalid
    change exists ticks entry,
      List.Mem entry
        (labelledProjection (termAt (encodeInstance source) ticks)) /\
      entry.history = history
    exact termAt_eventually_labelledProjection source history hvalid

/-! ## Ordinary theorem interface -/

/-- Every single contraction from the encoder cone preserves every history
already present and can add only source-valid histories. -/
theorem allEdgeProtectedPathPersistence
    (source : Instance) {before after : Term}
    (hbefore : Steps (strongEncoder source) before)
    (hedge : Step before after) :
    PersistentReaches (ValidHistory source)
      (strongProjection before) (strongProjection after) := by
  exact (protectedPersistentCertificateEnumeration source).allReductPermanence
    hbefore (Steps.single hedge)

/-- Every finite prefix-closed ideal of valid histories is the exact decoded
range of a reachable pure-`S` checkpoint. -/
theorem protectedExactFiniteRange
    (source : Instance) (ideal : HistoryIdeal)
    (hideal : SourceIdealValid source ideal) :
    exists checkpoint,
      Steps (strongEncoder source) checkpoint /\
      (strongProjection checkpoint).Equivalent ideal := by
  exact (protectedPersistentCertificateEnumeration source).exactFiniteRange
    ideal hideal

/-- From every reachable reduct, every finite valid ideal has a common
extension that retains the current histories and contains that ideal. -/
theorem protectedCofinalExtension
    (source : Instance) {reduct : Term}
    (hreach : Steps (strongEncoder source) reduct)
    (ideal : HistoryIdeal) (hideal : SourceIdealValid source ideal) :
    exists join,
      Steps reduct join /\
      (strongProjection reduct).LE (strongProjection join) /\
      ideal.LE (strongProjection join) := by
  exact (protectedPersistentCertificateEnumeration source).cofinalRecovery
    hreach ideal hideal

/-- A single infinite sequence of adjacent pure-`S` contractions has strict
macro checkpoints and eventually exposes a literal labelled record for every
valid history. -/
theorem addressCompleteAdjacentStepPath
    (source : Instance) :
    exists path : AddressCompleteCanonicalPath (encodeInstance source),
      forall history : BitWord, ValidHistory source history ->
        exists ticks entry,
          List.Mem entry (labelledProjection (path.term ticks)) /\
          entry.history = history := by
  let result := protectedPersistentCertificateEnumeration source
  exact result.addressCompleteAdjacentPath

/-- Exact checkpoints and internally disjoint edge paths give a directed
subdivision of the ordered valid-history tree. -/
theorem protectedDirectedSubdivision
    (source : Instance) :
    (forall {left right}
        (_hleft : SourceValid (encodeInstance source) left)
        (_hright : SourceValid (encodeInstance source) right),
      subdivisionCheckpoint sourceWitness (encodeInstance source) left =
          subdivisionCheckpoint sourceWitness (encodeInstance source) right ->
        left = right) /\
    (forall (left right :
        HistoryEdge (SourceValid (encodeInstance source))), left ≠ right ->
      Walk.InternallyDisjoint
        (subdivisionSimpleEdgePath sourceWitness
          (encodeInstance source) left.source left.bit).walk
        (subdivisionSimpleEdgePath sourceWitness
          (encodeInstance source) right.source right.bit).walk) /\
    (forall (edge : HistoryEdge (SourceValid (encodeInstance source)))
        (vertex : Term),
      (subdivisionSimpleEdgePath sourceWitness
        (encodeInstance source) edge.source edge.bit).walk.Interior vertex ->
      forall history
          (_hvalid : SourceValid (encodeInstance source) history),
        vertex ≠ subdivisionCheckpoint sourceWitness
          (encodeInstance source) history) := by
  let result := protectedPersistentCertificateEnumeration source
  exact result.historyTree.directedGeometry

/-- Source branch termination is equivalent to a reachable literal record
whose checked terminal flag is true. -/
theorem terminalCertificateEquivalence
    (source : Instance) :
    SourceBranchHalts source <-> TargetTerminalObservation source := by
  exact sourceBranchHalts_iff_targetTerminalObservation source

end PureSFormal.Research.ProtectedTrieCertificateEnumeration
