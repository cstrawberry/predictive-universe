import PureSFormal.Research.ProtectedTrieEncoderSize
import PureSFormal.Research.ProtectedTrieLabelledObserver
import PureSFormal.Research.ProtectedTrieMachineAgreement
import PureSFormal.Research.ProtectedTrieSimplePath
import PureSFormal.Research.ProtectedTrieSubdivision
import PureSFormal.Research.ProtectedTrieWholeObserverExactCost

/-!
# Protected trie whole-cone certificate theorem

The theorem in this module quantifies directly over the concrete ordered
binary machine instance.  Its encoder, current-term projection, persistent
source relation, checkpoints, observer, and source transition semantics are
the definitions named in the statement.  Its proof dependencies are the
protected-trie construction modules imported above.
-/

namespace PureSFormal.Research.ProtectedTrieStrongTheorem

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEncoderSize
open PureSFormal.Research.ProtectedTrieFinitePrefix
open PureSFormal.Research.ProtectedTrieLabelledObserver
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineAgreement
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTriePrefixBuild
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieSubdivision
open PureSFormal.Research.ProtectedTrieTableau
open PureSFormal.Research.ProtectedTrieTableauLabel
open PureSFormal.Research.ProtectedTrieWholeObserverExactCost

/-- Every represented member of one finite source ideal is a genuine history. -/
def SourceIdealValid (source : Instance) (ideal : HistoryIdeal) : Prop :=
  forall history, ideal.Contains history -> ValidHistory source history

/-- The exact protected opening used for one source-frontier event.  Every
proper vertex is a projection stutter and the final raw edge adds precisely
the requested history and its ancestors. -/
def ExactStrongFrontierOpening (source : Instance) (ideal : HistoryIdeal)
    (history : BitWord) (hfrontier : HistoryFrontier ideal history) : Prop :=
  exists selected : PrefixTree.Frontier
      (treeOfPrefixSet (preparedPrefixSet
        (selectedWitnesses sourceWitness (encodeInstance source) ideal.entries)
        [(history, sourceWitness (encodeInstance source) history)]))
      (a history (sourceWitness (encodeInstance source) history)),
    exists opening : CanonicalOpening (encodeInstance source)
      (selected.fieldContext (phaseAt 0))
      (selected.focusPhase (phaseAt 0)),
      Steps (strongEncoder source) opening.source /\
      idealCheckpoint (encodeInstance source) sourceWitness ideal
          [(history, sourceWitness (encodeInstance source) history)] =
            opening.source /\
      idealCheckpoint (encodeInstance source) sourceWitness
          (insertFrontier ideal history hfrontier)
          [(history, sourceWitness (encodeInstance source) history)] =
            opening.target /\
      (strongProjection opening.source).Equivalent ideal /\
      (strongProjection opening.target).Equivalent
        (insertFrontier ideal history hfrontier) /\
      (forall vertex, opening.walk.Interior vertex ->
        (strongProjection vertex).Equivalent
          (strongProjection opening.source)) /\
      (exists before,
        Step before opening.target /\
        forall small,
          (strongProjection opening.target).Contains small <->
            (strongProjection before).Contains small \/
              WordPrefix small history)

/-- Concrete specialization of the six- or seven-contraction opening theorem. -/
theorem strong_frontier_exact_opening
    (source : Instance) (ideal : HistoryIdeal)
    (hideal : SourceIdealValid source ideal)
    (history : BitWord) (hvalid : ValidHistory source history)
    (hfrontier : HistoryFrontier ideal history) :
    ExactStrongFrontierOpening source ideal history hfrontier := by
  unfold ExactStrongFrontierOpening
  have hidealSource : IdealValid SourceValid (encodeInstance source) ideal := by
    intro query hquery
    simpa [SourceValid] using hideal query hquery
  have hvalidSource : SourceValid (encodeInstance source) history := by
    simpa [SourceValid] using hvalid
  obtain ⟨selected, opening, hsource, htarget, hsourceProjection,
      htargetProjection, hinterior, hfinal⟩ :=
    exists_ideal_frontier_macro sourceVerifier_sound
      sourceVerifier_complete sourceVerifier_unique
      (encodeInstance source) ideal hidealSource history hfrontier
      hvalidSource []
  refine ⟨selected, opening, ?_, hsource, htarget, hsourceProjection,
    htargetProjection, hinterior, hfinal⟩
  rw [← hsource]
  exact strongEncoder_steps_checkpoint source ideal
    [(history, sourceWitness (encodeInstance source) history)]

/-- The protected source-code validity predicate agrees pointwise with the
direct ordered-binary machine semantics on the canonical source word. -/
theorem sourceValidity_iff (source : Instance) (history : BitWord) :
    SourceValid (encodeInstance source) history <->
      ValidHistory source history := by
  simp [SourceValid]

/-- Every history returned anywhere in the unrestricted reduction cone is a
genuine ordered-occurrence history of the frozen source instance. -/
theorem strongProjection_contains_valid_on_cone (source : Instance)
    {term : Term} {history : BitWord}
    (hreach : Steps (strongEncoder source) term)
    (hcontains : (strongProjection term).Contains history) :
    ValidHistory source history := by
  obtain ⟨body, _hbody, hterm⟩ := encoder_steps_preserves hreach
  rw [hterm] at hcontains
  have hvalid : SourceValid (encodeInstance source) history :=
    projection_contains_valid sourceVerifier_sound sourceValid_prefixClosed
      hcontains
  simpa [SourceValid] using hvalid

/-- Every executable subdivision checkpoint for a genuine history lies in
the unrestricted reduction cone of the concrete encoder. -/
theorem strong_subdivisionCheckpoint_reachable (source : Instance)
    (history : BitWord) (_hvalid : ValidHistory source history) :
    Steps (strongEncoder source)
      (subdivisionCheckpoint sourceWitness (encodeInstance source) history) :=
  encoder_steps_seededPrefixBuild (encodeInstance source)
    ⟨subdivisionCheckpointGenerators sourceWitness
      (encodeInstance source) history⟩

/-- The executable subdivision checkpoint decodes to exactly the ancestor
ideal of its concrete source history. -/
theorem strong_subdivisionCheckpoint_exact (source : Instance)
    (history : BitWord) (hvalid : ValidHistory source history) :
    (strongProjection
      (subdivisionCheckpoint sourceWitness (encodeInstance source) history)
    ).Equivalent (branchIdeal history) := by
  apply projection_subdivisionCheckpoint_equivalent
    sourceValid_prefixClosed sourceVerifier_complete
  simpa [SourceValid] using hvalid

/-- Every genuine ordered source edge has a loop-erased pure-S path with no
repeated target vertex between its exact executable checkpoints. -/
theorem strongSourceEdgeSimplePath_nonempty (source : Instance)
    (edge : HistoryEdge (SourceValid (encodeInstance source))) :
    Nonempty (Walk.SimplePath Step
      (subdivisionCheckpoint sourceWitness (encodeInstance source)
        edge.source)
      (subdivisionCheckpoint sourceWitness (encodeInstance source)
        (edge.source ++ [edge.bit]))) :=
  subdivisionSimpleEdgePath_nonempty sourceWitness (encodeInstance source)
    edge.source edge.bit

/-- Directed-subdivision geometry for the same concrete loop-erased edge
family: injective checkpoints, pairwise-disjoint interiors, and avoidance of
all valid checkpoints by every proper edge-path vertex. -/
theorem strong_simple_directed_subdivision (source : Instance) :
    (forall {left right}
        (hleft : SourceValid (encodeInstance source) left)
        (hright : SourceValid (encodeInstance source) right),
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
          (hvalid : SourceValid (encodeInstance source) history),
        vertex ≠ subdivisionCheckpoint sourceWitness
          (encodeInstance source) history) := by
  exact protectedTrie_simple_directed_subdivision sourceVerifier SourceValid
    sourceWitness sourceValid_prefixClosed sourceVerifier_complete
    (encodeInstance source)

/-- Every finite valid source branch concatenates to one literal target walk
between its exact protected-trie checkpoints. -/
noncomputable def strongFiniteBranchWalk (source : Instance)
    (history branch : BitWord) (hsource : ValidHistory source history)
    (hbranch : ValidBranchFrom (ValidHistory source) history branch) :
    Walk Step
      (subdivisionCheckpoint sourceWitness (encodeInstance source) history)
      (subdivisionCheckpoint sourceWitness (encodeInstance source)
        (history ++ branch)) :=
  protectedTrieFiniteBranchWalk (ValidHistory source) sourceWitness
    (encodeInstance source) history branch hsource hbranch

/-- The first `count` ordered choices of an infinite source branch. -/
def streamPrefix (branch : Nat -> Bool) : Nat -> BitWord
  | 0 => []
  | count + 1 => streamPrefix branch count ++ [branch count]

/-- Every finite prefix of an infinite ordered choice stream is a genuine
history of the concrete source machine. -/
def InfiniteValidBranch (source : Instance) (branch : Nat -> Bool) : Prop :=
  forall count, ValidHistory source (streamPrefix branch count)

/-- Each adjacent pair of finite prefixes of a valid infinite source branch
is joined by the concrete protected-trie edge walk. -/
theorem strongInfiniteBranchStep (source : Instance) (branch : Nat -> Bool)
    (hbranch : InfiniteValidBranch source branch) (count : Nat) :
    Nonempty (Walk Step
      (subdivisionCheckpoint sourceWitness (encodeInstance source)
        (streamPrefix branch count))
      (subdivisionCheckpoint sourceWitness (encodeInstance source)
        (streamPrefix branch (count + 1)))) := by
  have hsource := hbranch count
  have htarget := hbranch (count + 1)
  have hone : ValidBranchFrom (ValidHistory source)
      (streamPrefix branch count) [branch count] :=
    .cons htarget .nil
  exact Nonempty.intro (strongFiniteBranchWalk source
    (streamPrefix branch count) [branch count] hsource hone)

/--
Concrete public contract for the strong all-reduct construction.  Each field
uses the single global `strongProjection` on the current bare term.
-/
structure StrongWholeMultiwayCertificate (source : Instance) : Prop where
  validityAgreement : forall history : BitWord,
    SourceValid (encodeInstance source) history <->
      ValidHistory source history

  encoderInjective : forall other : Instance,
    strongEncoder source = strongEncoder other -> source = other

  frozenSourceHeader : forall {term : Term},
    Steps (strongEncoder source) term ->
      exists body, Steps (D 2 2) body /\
        term = seededHeader (encodeInstance source) body

  initial : forall history,
    Not ((strongProjection (strongEncoder source)).Contains history)

  wholeEdge : forall {before after : Term},
    Steps (strongEncoder source) before -> Step before after ->
      PersistentReaches (ValidHistory source)
        (strongProjection before) (strongProjection after)

  wholeEdgeBatch : forall {before after : Term},
    Steps (strongEncoder source) before -> Step before after ->
      RankOrderedBatch (ValidHistory source)
        (strongProjection before) (strongProjection after)

  decodedHistoriesValid : forall {term : Term} {history : BitWord},
    Steps (strongEncoder source) term ->
    (strongProjection term).Contains history ->
      ValidHistory source history

  exactCanonicalRange : forall ideal : HistoryIdeal,
    SourceIdealValid source ideal ->
      exists checkpoint,
        Steps (strongEncoder source) checkpoint /\
        (strongProjection checkpoint).Equivalent ideal

  cofinalFromEveryReduct : forall {reduct : Term},
    Steps (strongEncoder source) reduct ->
    forall ideal : HistoryIdeal, SourceIdealValid source ideal ->
      exists join,
        Steps reduct join /\
        (strongProjection reduct).LE (strongProjection join) /\
        ideal.LE (strongProjection join)

  exactFrontierMacrostep : forall (ideal : HistoryIdeal),
    SourceIdealValid source ideal ->
    forall (history : BitWord), ValidHistory source history ->
      forall hfrontier : HistoryFrontier ideal history,
        ExactStrongFrontierOpening source ideal history hfrontier

  terminality : forall (history : BitWord),
    TerminalHistory source history -> forall (slot : Bool) (body : Term),
      Not ((strongProjection
        (seededHeader (encodeInstance source) body)).Contains
          (history ++ [slot]))

  orderedOccurrenceMultiplicity :
    forall (history : BitWord),
      ValidHistory source (history ++ [false]) ->
      ValidHistory source (history ++ [true]) ->
      exists payloadFalse payloadTrue,
        sourceVerifier (encodeInstance source) (history ++ [false])
          payloadFalse = true /\
        sourceVerifier (encodeInstance source) (history ++ [true])
          payloadTrue = true /\
        a (history ++ [false]) payloadFalse ≠
          a (history ++ [true]) payloadTrue

  labelledHistoryErasure : forall term : Term,
    labelledHistoryIdeal term = strongProjection term

  literalRowsOnCone : forall {term : Term} {entry : LabelledHistory},
    Steps (strongEncoder source) term ->
    List.Mem entry (labelledProjection term) ->
      exists rows finalRow,
        decodeTableau? entry.payload = some rows /\
        verifyRows source entry.history rows = true /\
        lastRow? rows = some finalRow /\
        entry.label = labelOfRow source.machine finalRow

  literalOrderedFlagsOnCone : forall {term : Term} {entry : LabelledHistory},
    Steps (strongEncoder source) term ->
    List.Mem entry (labelledProjection term) ->
      entry.label.slot0Enabled =
          (step? source.machine entry.label.finalRow false).isSome /\
      entry.label.slot1Enabled =
          (step? source.machine entry.label.finalRow true).isSome /\
      (entry.label.terminal = true <->
        Terminal source.machine entry.label.finalRow)

  literalLabelUnique : forall {term : Term} {left right : LabelledHistory},
    List.Mem left (labelledProjection term) ->
    List.Mem right (labelledProjection term) ->
    left.history = right.history ->
      left.payload = right.payload /\ left.label = right.label

  simpleSourceEdgePath : forall
      (edge : HistoryEdge (SourceValid (encodeInstance source))),
    Nonempty (Walk.SimplePath Step
      (subdivisionCheckpoint sourceWitness (encodeInstance source)
        edge.source)
      (subdivisionCheckpoint sourceWitness (encodeInstance source)
        (edge.source ++ [edge.bit])))

  simpleDirectedSubdivision :
    (forall {left right}
        (hleft : SourceValid (encodeInstance source) left)
        (hright : SourceValid (encodeInstance source) right),
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
          (hvalid : SourceValid (encodeInstance source) history),
        vertex ≠ subdivisionCheckpoint sourceWitness
          (encodeInstance source) history)

  subdivisionCheckpointReachable : forall (history : BitWord),
    ValidHistory source history ->
      Steps (strongEncoder source)
        (subdivisionCheckpoint sourceWitness (encodeInstance source) history)

  subdivisionCheckpointExact : forall (history : BitWord),
    ValidHistory source history ->
      (strongProjection
        (subdivisionCheckpoint sourceWitness (encodeInstance source) history)
      ).Equivalent (branchIdeal history)

  finiteBranchLift : forall (history branch : BitWord)
      (hsource : ValidHistory source history)
      (hbranch : ValidBranchFrom (ValidHistory source) history branch),
    Nonempty (Walk Step
      (subdivisionCheckpoint sourceWitness (encodeInstance source) history)
      (subdivisionCheckpoint sourceWitness (encodeInstance source)
        (history ++ branch)))

  infiniteBranchLift : forall (branch : Nat -> Bool),
    InfiniteValidBranch source branch -> forall count : Nat,
      Nonempty (Walk Step
        (subdivisionCheckpoint sourceWitness (encodeInstance source)
          (streamPrefix branch count))
        (subdivisionCheckpoint sourceWitness (encodeInstance source)
          (streamPrefix branch (count + 1))))

  countedEncoderValue :
    (runStrongEncoder source).value = strongEncoder source

  countedEncoderTime :
    (runStrongEncoder source).ticks <= strongEncoderTimeBound source

  countedEncoderSpace :
    (runStrongEncoder source).peak <= strongEncoderSpaceBound source

  countedObserverValue : forall term : Term,
    (runWholeLabelledObserver term).value = labelledProjection term

  countedObserverIdeal : forall term : Term,
    idealOf ((runWholeLabelledObserver term).value.map
        LabelledHistory.history) = strongProjection term

  countedObserverOutput : forall term : Term,
    labelledOutputCells (runWholeLabelledObserver term).value <=
      10 * (term.size + 1) * (term.size + 1)

  countedObserverTime : forall term : Term,
    (runWholeLabelledObserver term).ticks <= wholeObserverTimeBound term

  /-- The observer meter's structural recursion and temporary-list peak;
  this is the published abstract space measure, not a claim about a
  particular compiler's runtime memory layout. -/
  countedObserverStructuralPeak : forall term : Term,
    (runWholeLabelledObserver term).peak <= wholeObserverSpaceBound term

  countedObserverResources : forall term : Term,
    WholeObserverResourceCertificate term

  linearEncoder :
    (strongEncoder source).size <=
      41 + 6 * (encodeInstance source).length

  exactEncoderSize :
    (strongEncoder source).size =
      (N (encodeInstance source)).size + 40

  textbookSourceAgreement : forall (row next : Row) (slot : Bool),
    step? source.machine row slot = some next <->
      TextbookStep source.machine row slot next

/--
Every explicit finite ordered-binary machine instance satisfies the concrete
whole-reduct contract.
-/
theorem strongWholeMultiwayUniversality (source : Instance) :
    StrongWholeMultiwayCertificate source := by
  refine {
    validityAgreement := ?_
    encoderInjective := ?_
    frozenSourceHeader := ?_
    initial := ?_
    wholeEdge := ?_
    wholeEdgeBatch := ?_
    decodedHistoriesValid := ?_
    exactCanonicalRange := ?_
    cofinalFromEveryReduct := ?_
    exactFrontierMacrostep := ?_
    terminality := ?_
    orderedOccurrenceMultiplicity := ?_
    labelledHistoryErasure := ?_
    literalRowsOnCone := ?_
    literalOrderedFlagsOnCone := ?_
    literalLabelUnique := ?_
    simpleSourceEdgePath := ?_
    simpleDirectedSubdivision := ?_
    subdivisionCheckpointReachable := ?_
    subdivisionCheckpointExact := ?_
    finiteBranchLift := ?_
    infiniteBranchLift := ?_
    countedEncoderValue := ?_
    countedEncoderTime := ?_
    countedEncoderSpace := ?_
    countedObserverValue := ?_
    countedObserverIdeal := ?_
    countedObserverOutput := ?_
    countedObserverTime := ?_
    countedObserverStructuralPeak := ?_
    countedObserverResources := ?_
    linearEncoder := ?_
    exactEncoderSize := ?_
    textbookSourceAgreement := ?_ }
  · exact sourceValidity_iff source
  · intro other heq
    exact strongEncoder_injective heq
  · intro term hreach
    exact strongEncoder_frozen_header source hreach
  · exact strongProjection_initial_empty source
  · intro before after hreach hstep
    exact strongProjection_step_reaches source hreach hstep
  · intro before after hreach hstep
    exact strongProjection_step_genuine_batch source hreach hstep
  · intro term history hreach hcontains
    exact strongProjection_contains_valid_on_cone source hreach hcontains
  · intro ideal hideal
    refine ⟨strongCheckpoint source ideal [], ?_, ?_⟩
    · exact strongEncoder_steps_checkpoint source ideal []
    · exact strongCheckpoint_exact source ideal hideal []
  · intro reduct hreach ideal hideal
    exact strong_cofinal_complete source hreach ideal hideal
  · intro ideal hideal history hvalid hfrontier
    exact strong_frontier_exact_opening source ideal hideal history
      hvalid hfrontier
  · intro history hterminal slot body
    exact strongProjection_excludes_terminal_child hterminal slot
  · intro history hfalse htrue
    exact strong_valid_children_preserve_multiplicity hfalse htrue
  · exact labelledHistoryIdeal_eq
  · intro term entry hreach hmem
    exact labelledProjection_literal_final_on_cone source hreach hmem
  · intro term entry hreach hmem
    exact labelledProjection_slot_and_terminal_on_cone source hreach hmem
  · intro term left right hleft hright hhistory
    exact labelledProjection_history_unique hleft hright hhistory
  · intro edge
    exact strongSourceEdgeSimplePath_nonempty source edge
  · exact strong_simple_directed_subdivision source
  · intro history hvalid
    exact strong_subdivisionCheckpoint_reachable source history hvalid
  · intro history hvalid
    exact strong_subdivisionCheckpoint_exact source history hvalid
  · intro history branch hsource hbranch
    exact Nonempty.intro (strongFiniteBranchWalk source history branch
      hsource hbranch)
  · intro branch hbranch count
    exact strongInfiniteBranchStep source branch hbranch count
  · exact runStrongEncoder_value source
  · exact runStrongEncoder_ticks_le source
  · exact runStrongEncoder_peak_le source
  · exact runWholeLabelledObserver_labels
  · exact runWholeLabelledObserver_historyIdeal
  · exact runWholeLabelledObserver_outputCells_le
  · exact runWholeLabelledObserver_ticks_le
  · exact runWholeLabelledObserver_peak_le
  · exact wholeObserver_resource_certificate
  · simpa [strongEncoder] using
      encoder_size_le (encodeInstance source)
  · unfold strongEncoder encoder
    rw [seededHeader_size, D_two_two_size]
  · intro row next slot
    exact step?_eq_some_iff_textbookStep source.machine row next slot

end PureSFormal.Research.ProtectedTrieStrongTheorem
