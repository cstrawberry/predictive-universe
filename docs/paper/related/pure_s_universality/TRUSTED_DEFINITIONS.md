# Trusted Definitions

The table identifies the definitions whose intended mathematical meaning must
be inspected by a reader. The cited agreement theorems are kernel-checked
consequences. Line references use the source tree recorded by this document.

The [verification guide](VERIFICATION.md) gives the completed checks and
reproduction commands.

| Definition | File and line | Role | Agreement theorem |
|---|---|---|---|
| `RootResetHeadline.HeadlineUniversality` | [`RootResetHeadline.lean`](formalization/PureSFormal/RootResetHeadline.lean) | Generic CTS realization and the fixed computation contract, regular halting language and finite-prefix observations, all tied to the displayed source trajectory | `sCombinatorIsRootResetUniversal` |
| `RootResetFiniteMarkerObserver.markerPattern`, `observer`, `accepts?` | [`RootResetFiniteMarkerObserver.lean`](formalization/PureSFormal/Research/RootResetFiniteMarkerObserver.lean) | Read-only root priority selection followed by the literal fresh halt-field test; a declined priority selection returns false and does not use Euler fallback | `observer_all_input`; `observer_readOnly`; `RootResetMarkerObserverSoundness.root_observed_iff_eventuallyEmpty` |
| `PhysicalMarkerExclusion.EventuallyContractsFresh`, `markedFocus?`, `CursorSafe` | [`PhysicalMarkerGlobalSoundness.lean`](formalization/PureSFormal/PureS/PhysicalMarkerGlobalSoundness.lean), [`PhysicalMarkerExclusion.lean`](formalization/PureSFormal/PureS/PhysicalMarkerExclusion.lean) | Actual successful fresh-field contraction in the scheduler, with literal cursor-focus information and no program-counter registration premise | `physicalEvent_iff_eventuallyEmpty`; `RootResetMarkerPhysicalSoundness.accepted_sample_native_fresh_focus` |
| `Term.contractAt?` occurrence identity | [`PureSContractionOccurrenceInjectivity.lean`](formalization/PureSFormal/Research/PureSContractionOccurrenceInjectivity.lean) | Equal source and target trees of successful native contractions determine the same occurrence address | `contractAt_address_injective`; `same_source_target_occurrence` |
| `FiniteTreeAutomatonPowerset.Deterministic`, `Nondeterministic`, `Bits`, `determinize` | [`FiniteTreeAutomatonPowerset.lean`](formalization/PureSFormal/Research/FiniteTreeAutomatonPowerset.lean) | Explicit finite-state bottom-up tree automata, Boolean-vector powerset construction and final-state complement | Exact language equivalence theorems in that module; exhaustive `Bits.mem_all` cover |
| `ClosedSetTreeAutomaton.rootClosed`, `upClosed`, `certificateAutomaton`, `Certificate` | [`ClosedSetTreeAutomaton.lean`](formalization/PureSFormal/Research/ClosedSetTreeAutomaton.lean) | Local finite subsets closed under read-only walker transitions and excluding accepting controls; the root includes the initial control | `certificate_accepts_iff`; `ClosedSetCertificateSoundness.certificate_excludes_acceptance`; `ClosedSetCertificateCompleteness.stabilized_negative_certificate` |
| `FiniteControllerReindexing.reindex`; `RootResetMarkerObserverDecidableEq.observerControlDecidableEq` | [`FiniteControllerReindexing.lean`](formalization/PureSFormal/Research/FiniteControllerReindexing.lean), [`RootResetMarkerObserverDecidableEq.lean`](formalization/PureSFormal/Research/RootResetMarkerObserverDecidableEq.lean) | Constructive indexing of the actual control cover, including duplicate entries; no assumed equality oracle | `project_run`; `reindex_mutation`; `reindex_fixed` |
| `RootResetMarkerTreeAutomaton.automaton` | [`RootResetMarkerTreeAutomaton.lean`](formalization/PureSFormal/Research/RootResetMarkerTreeAutomaton.lean) | Explicit finite automaton obtained by complementing nonacceptance certificates for the actual observer | `automaton_accepts_eq_observer`; `automaton_cover_complete`; `automaton_root_trajectory_iff` |
| `RootResetRegularMarkerLanguage.automaton`, `member?` | [`RootResetRegularMarkerLanguage.lean`](formalization/PureSFormal/Research/RootResetRegularMarkerLanguage.lean) | One fixed regular tree language for the same padded source encoder and root-restarted output path | `fixed_language_halting_iff`; the existing `DeterministicTapeRootResetOutput.source_output_iff` preserves the separate literal output result |
| `DeterministicTapeInfiniteTape.Infinite.Config`, `lookup`, `write`, `step?`, `runFor?`, `initial`; `Represents` | [`DeterministicTapeInfiniteTape.lean`](formalization/PureSFormal/Computation/DeterministicTapeInfiniteTape.lean) | Independent conventional binary tape with integer head; pointwise finite-window representation, origin minus one initially and decreasing only on left extension | `initial_represents`; `step_forward`; `step_backward`; `undefined_step_iff`; `run_forward`; `run_backward`; `halts_iff`; `returns_iff` |
| `SourceChronologyRootReset.checkpoint` | [`SourceChronologyRootReset.lean`](formalization/PureSFormal/Computation/SourceChronologyRootReset.lean) | Composition of the actual padded CTS checkpoint clock with a simultaneous strictly increasing sampling of each defined finite source prefix; no executable global source clock or all-observation order | `checkpoint_strict`; `checkpoint_decodes`; `exists_sourceClock` |
| `RootResetCumulativeResources.cumulative`, `sourcePath`, `sourceMicroticks` | [`RootResetCumulativeResources.lean`](formalization/PureSFormal/Research/RootResetCumulativeResources.lean) | Sum of invocation budgets for the actual controller, bounded using native-S tree growth | `path_cumulative_bound`; `source_cumulative_bound` |
| `Term` | [`formalization/PureSFormal/PureS/Term.lean:19`](formalization/PureSFormal/PureS/Term.lean#L19) | Closed pure-`S` syntax | — |
| `Term.contractRoot?`, `Step` | [`formalization/PureSFormal/PureS/Reduction.lean:32`](formalization/PureSFormal/PureS/Reduction.lean#L32), [`:52`](formalization/PureSFormal/PureS/Reduction.lean#L52) | The root rule and its contextual closure | `PureSFormal.PureS.step_iff_textbookStep`; `Term.contractRoot?_sound` |
| `CTS.Program`, `Config`, `ordinaryStep`, `absorbingStep`, `iterate` | [`formalization/PureSFormal/CTS/Core.lean:19`](formalization/PureSFormal/CTS/Core.lean#L19), [`:32`](formalization/PureSFormal/CTS/Core.lean#L32), [`:79`](formalization/PureSFormal/CTS/Core.lean#L79), [`:129`](formalization/PureSFormal/CTS/Core.lean#L129), [`:176`](formalization/PureSFormal/CTS/Core.lean#L176) | Binary cyclic-tag semantics | — |
| `DeterministicTape.Machine`, `Instance`, `step?`, `runFor?`, `Halts` | [`formalization/PureSFormal/Research/ProtectedTrieDeterministicCompiler.lean:35`](formalization/PureSFormal/Research/ProtectedTrieDeterministicCompiler.lean#L35), [`:40`](formalization/PureSFormal/Research/ProtectedTrieDeterministicCompiler.lean#L40), [`:52`](formalization/PureSFormal/Research/ProtectedTrieDeterministicCompiler.lean#L52), [`:59`](formalization/PureSFormal/Research/ProtectedTrieDeterministicCompiler.lean#L59), [`:73`](formalization/PureSFormal/Research/ProtectedTrieDeterministicCompiler.lean#L73) | Deterministic Boolean-tape machine, execution, and halting | — |
| `Probe.NodeKind`, `Probe.Incoming`, `observeNode`, `observeIncoming` | [`formalization/PureSFormal/PureS/Probe.lean:18`](formalization/PureSFormal/PureS/Probe.lean#L18), [`:24`](formalization/PureSFormal/PureS/Probe.lean#L24), [`:30`](formalization/PureSFormal/PureS/Probe.lean#L30), [`:35`](formalization/PureSFormal/PureS/Probe.lean#L35) | The strategy's observation alphabet | — |
| `Primitive` | [`formalization/PureSFormal/PureS/Cursor.lean:238`](formalization/PureSFormal/PureS/Cursor.lean#L238) | One-edge left, right, parent, and focused contraction commands | — |
| `Cursor`, `left?`, `right?`, `up?`, `rdx?` | [`formalization/PureSFormal/PureS/Cursor.lean:49`](formalization/PureSFormal/PureS/Cursor.lean#L49), [`:79`](formalization/PureSFormal/PureS/Cursor.lean#L79), [`:84`](formalization/PureSFormal/PureS/Cursor.lean#L84), [`:89`](formalization/PureSFormal/PureS/Cursor.lean#L89), [`:94`](formalization/PureSFormal/PureS/Cursor.lean#L94) | One occurrence-tree zipper; retained across contractions in the baseline and initialized afresh at the root for each new selector invocation | `Cursor.rdx?_sound` |
| `FiniteController.Command`, `Machine`, `Configuration`, `step` | [`formalization/PureSFormal/PureS/FiniteController.lean:23`](formalization/PureSFormal/PureS/FiniteController.lean#L23), [`:33`](formalization/PureSFormal/PureS/FiniteController.lean#L33), [`:46`](formalization/PureSFormal/PureS/FiniteController.lean#L46), [`:71`](formalization/PureSFormal/PureS/FiniteController.lean#L71) | Deterministic finite-control operational semantics | `FiniteController.machineEquivTextbook`; `FiniteController.step_projects_stepsN` |
| `RootResetSelectorContract.Contract`, `Contract.initial`, `InterInvocationState`, `invokeRun` | [`RootResetSelectorContract.lean`](formalization/PureSFormal/Research/RootResetSelectorContract.lean) | Fixed finite machine, identical root start, unit boundary state, all-input terminal result and exact zero/one mutation | `Contract.invokeRun_state_independent`; `Contract.exact_mutation_count`; `Contract.successfulEdgeMoves_le` |
| `RootResetReadonlySelector.Control`, `states`, `covers`, `transition`, `stoppingTime`, `final`, `outcome` | [`RootResetReadonlySelector.lean`](formalization/PureSFormal/Research/RootResetReadonlySelector.lean) | Constructive finite cover and deterministic local transition generator; read-only selection followed by one contraction or root ascent and Euler search | `all_input`; `final_result`; `selectorContract` |
| `RootResetPriorityReplay.worker`, `RootResetReplayProbe.transition` | [`RootResetPriorityReplay.lean`](formalization/PureSFormal/Research/RootResetPriorityReplay.lean), [`RootResetReplayProbe.lean`](formalization/PureSFormal/Research/RootResetReplayProbe.lean) | Declined priority passes return to the root by actual `U` moves before replay; no origin cursor or address is stored | `RootResetReplayProbe.enters_root`; `RootResetPriorityReplay.all_input` |
| `RootResetScopedResponseProbes.completed`, `RootResetEmptyAwareResponseProbe.worker` | [`RootResetScopedResponseProbes.lean`](formalization/PureSFormal/Research/RootResetScopedResponseProbes.lean), [`RootResetEmptyAwareResponseProbe.lean`](formalization/PureSFormal/Research/RootResetEmptyAwareResponseProbe.lean) | Finite parent guards discharge return boundaries, and the EMPTY-origin decision distinguishes COMMIT from pending handoff | `completed_restoring`; `RootResetInitialEmptyCommitAgreement.selectStep?_completed_empty` |
| `RootResetFinitePrioritySelector.selectionSpec`, `selectorContract`, `selectStep?` | [`RootResetFinitePrioritySelector.lean`](formalization/PureSFormal/Research/RootResetFinitePrioritySelector.lean) | Complete fresh-response, marked-handoff and active-endpoint priority, with all-input Euler fallback | `all_input_linear`; `all_input_terminal`; `RootResetContractProjection.none_iff_normal`; `some_result`; `none_result` |
| `RootResetFiniteAllInputsTraceAgreement.selector`, `finiteCTSUniversality`; `RootResetTermOnlyTransfer.run` | [`RootResetFiniteAllInputsTraceAgreement.lean`](formalization/PureSFormal/Research/RootResetFiniteAllInputsTraceAgreement.lean), [`RootResetTermOnlyTransfer.lean`](formalization/PureSFormal/Research/RootResetTermOnlyTransfer.lean) | Iteration depends only on the current bare term and realizes the unchanged exact CTS path | `selectsEveryContractionRun`; `agreesOnEverySample`; `termOnlyPath_eq_persistentPath` |
| `RootResetChallenge.UniversalProgram`, `UniversalDispatcher`, `UniversalContract`, `UniversalSelector`, `RootResetComputationUniversality` | [`RootResetChallenge.lean`](formalization/PureSFormal/RootResetChallenge.lean) | Closed period-912 controller and complete computation-interface specification, fixed before every source instance | `sCombinatorIsRootResetComputationUniversal`; its public axiom audit permits at most `propext` and `Quot.sound` |
| `WeakPath.ReductionPath`, `BareTermDecoder`, `Realizes`, `UniformRealizes` | [`formalization/PureSFormal/WeakPath/Interface.lean:20`](formalization/PureSFormal/WeakPath/Interface.lean#L20), [`:39`](formalization/PureSFormal/WeakPath/Interface.lean#L39), [`:61`](formalization/PureSFormal/WeakPath/Interface.lean#L61), [`:162`](formalization/PureSFormal/WeakPath/Interface.lean#L162) | Exact selected-path realization of a cyclic tag system | — |
| `PublicDecoder.decode` | [`formalization/PureSFormal/PureS/PublicDecoder.lean:31`](formalization/PureSFormal/PureS/PublicDecoder.lean#L31) | Public total decoder of the bare current term | `decode_eq_decodeLiteral`; `exists_literal_of_decode` |
| `CheckpointDecoder.decode?`, `parseGenerator?`, `parseTerminal?`, `parseLocal?`, `decodeCarrier?`, `parseChainTail?`, `parsePositive?` | [`formalization/PureSFormal/PureS/CheckpointDecoder.lean:1272`](formalization/PureSFormal/PureS/CheckpointDecoder.lean#L1272), [`:230`](formalization/PureSFormal/PureS/CheckpointDecoder.lean#L230), [`:313`](formalization/PureSFormal/PureS/CheckpointDecoder.lean#L313), [`:530`](formalization/PureSFormal/PureS/CheckpointDecoder.lean#L530), [`:802`](formalization/PureSFormal/PureS/CheckpointDecoder.lean#L802), [`:988`](formalization/PureSFormal/PureS/CheckpointDecoder.lean#L988), [`:1163`](formalization/PureSFormal/PureS/CheckpointDecoder.lean#L1163) | Complete checkpoint grammar and its principal parser stages | `CheckpointDecoder.decode?_sound`; `CheckpointDecoder.decode?_eq_some_iff` |
| `CarrierDecoder.decode?`, `DispatchParser.parse`, `CellSpine.decode?`, `CanonicalStep.parseCell?` | [`formalization/PureSFormal/PureS/CarrierDecoder.lean:435`](formalization/PureSFormal/PureS/CarrierDecoder.lean#L435), [`formalization/PureSFormal/PureS/DispatchParser.lean:135`](formalization/PureSFormal/PureS/DispatchParser.lean#L135), [`formalization/PureSFormal/PureS/CellSpine.lean:43`](formalization/PureSFormal/PureS/CellSpine.lean#L43), [`formalization/PureSFormal/PureS/CanonicalStep.lean:203`](formalization/PureSFormal/PureS/CanonicalStep.lean#L203) | Delegated carrier, dispatcher, queue-spine, and cell parsers | `CarrierDecoder.decode?_eq_some_iff`; `DispatchParser.parse_sound`; `CellSpine.decode?_eq_some_iff`; `CanonicalStep.parseCell?_sound` |
| `CountedCheckpointDecoder.Meter`, `staticWeight`, `scanTick`, `countedDecode`; `CountedTermEvent.countedObservesMarkedCheckpoint?` | [`formalization/PureSFormal/PureS/CountedCheckpointDecoder.lean:25`](formalization/PureSFormal/PureS/CountedCheckpointDecoder.lean#L25), [`:31`](formalization/PureSFormal/PureS/CountedCheckpointDecoder.lean#L31), [`:36`](formalization/PureSFormal/PureS/CountedCheckpointDecoder.lean#L36), [`:338`](formalization/PureSFormal/PureS/CountedCheckpointDecoder.lean#L338), [`:724`](formalization/PureSFormal/PureS/CountedCheckpointDecoder.lean#L724) | Retained abstract meters with stipulated per-parser allowances. Their value agreements and arithmetic bounds do not establish domination of primitive work; the measured implementations below supply that evidence. | `countedDecode_value`; `publicDecoder_resource_certificate`; `countedObservesMarkedCheckpoint?_value`; `detector_resource_certificate` |
| `PublicDecoderPrimitive.decode`, `TermEventPrimitive.observesMarkedCheckpoint`, `CheckpointSeedReadbackPrimitive.decode` | [`PublicDecoderPrimitive.lean:104`](formalization/PureSFormal/PureS/PublicDecoderPrimitive.lean#L104), [`TermEventPrimitive.lean:36`](formalization/PureSFormal/PureS/TermEventPrimitive.lean#L36), [`CheckpointSeedReadbackPrimitive.lean:153`](formalization/PureSFormal/PureS/CheckpointSeedReadbackPrimitive.lean#L153) | Actual measured checkpoint, marked-event and immutable-seed parsers, with fixed grammar prepared before the bare input term and quadratic primitive-operation bounds on all inputs | Each module's value and operations theorems; `primitivePublicDecoder_resource_certificate`; `primitiveMarkedDetector_resource_certificate`; `primitiveSeedReadback_resource_certificate` |
| `DeterministicTapeOutputPrimitive.row`, `terminal`, `scanned` | [`DeterministicTapeOutputPrimitive.lean:23`](formalization/PureSFormal/Computation/DeterministicTapeOutputPrimitive.lean#L23) | Measured observers of the bare current term; all seed/code parsing, counter reconstruction, complete candidate validation, tape parsing and static terminal lookup are included | `row_resource_certificate`; `terminal_resource_certificate`; `scanned_resource_certificate`; `source_output_iff` |
| `DeterministicTapeRootResetOutput.termAt`, `encode`; `DeterministicTapeOutputQuartic.budget` | [`DeterministicTapeRootResetOutput.lean`](formalization/PureSFormal/Computation/DeterministicTapeRootResetOutput.lean), [`DeterministicTapeOutputQuartic.lean`](formalization/PureSFormal/Computation/DeterministicTapeOutputQuartic.lean) | Fresh-root iteration of the same padded source encoding, with the same literal observers and common all-input quartic operation budget | `termAt_eq_persistent`; `exists_literalRow_iff`; `exists_terminalRow_iff`; `exists_scannedOutput_iff`; `source_output_iff`; `complete_output_resource_certificate` |
| `TermEvent.observesMarkedCheckpoint?` | [`formalization/PureSFormal/PureS/TermEvent.lean:71`](formalization/PureSFormal/PureS/TermEvent.lean#L71) | Total Boolean checkpoint detector | `emitsMarkH?_eq_true_iff` |
| `DeterministicTapePureS.encodeTerm` | [`formalization/PureSFormal/Computation/DeterministicTapePureS.lean:37`](formalization/PureSFormal/Computation/DeterministicTapePureS.lean#L37) | Deterministic-tape instance to pure-`S` term | — |
| `DeterministicTapePaddedEncoderConstructionMachine.sourceTerm` | [`DeterministicTapePaddedEncoderConstructionMachine.lean:57`](formalization/PureSFormal/Computation/DeterministicTapePaddedEncoderConstructionMachine.lean#L57) | Complete measured unary-source decoder, state padding, compiler and final unshared-term materialization for the actual output endpoint | `complete_padded_encoder_certificate`; `sourceTerm_size_le`; `closedProgramReduction` |
| `Term.code`, `Term.decodeCodeTotal` | [`formalization/PureSFormal/PureS/TermNatCode.lean:182`](formalization/PureSFormal/PureS/TermNatCode.lean#L182), [`formalization/PureSFormal/Computation/DeterministicTapeCode.lean:501`](formalization/PureSFormal/Computation/DeterministicTapeCode.lean#L501) | Bijective natural numbering of pure-`S` terms | `Term.decodeCodeTotal_code`; `Term.code_decodeCodeTotal` |
| `DeterministicTapeCode.bitListCode`, `bitListDecode`, `instanceCode`, `instanceDecodeCode` | [`formalization/PureSFormal/Computation/DeterministicTapeCode.lean:365`](formalization/PureSFormal/Computation/DeterministicTapeCode.lean#L365), [`:371`](formalization/PureSFormal/Computation/DeterministicTapeCode.lean#L371), [`:448`](formalization/PureSFormal/Computation/DeterministicTapeCode.lean#L448), [`:453`](formalization/PureSFormal/Computation/DeterministicTapeCode.lean#L453) | Total bijective numberings of Boolean words and deterministic-tape instances | `bitListDecode_code`; `bitListCode_decode`; `instanceDecodeCode_code`; `instanceCode_decodeCode` |
| `PRCode`, `PRCode.eval`, `PrimitiveRecursive` | [`formalization/PureSFormal/Computation/PrimitiveRecursive.lean:15`](formalization/PureSFormal/Computation/PrimitiveRecursive.lean#L15), [`:29`](formalization/PureSFormal/Computation/PrimitiveRecursive.lean#L29), [`:750`](formalization/PureSFormal/Computation/PrimitiveRecursive.lean#L750) | Closed first-order primitive-recursive program syntax, total evaluator, and realization predicate | `FixedEndpoint.generatorProgram_correct`; `FixedEndpoint.generatorCode_primitiveRecursive` |
| `PartialRecursive.Code`, `Code.eval?`, `Code.ComputesTotal`, `PartialRecursive.Computable` | [`formalization/PureSFormal/Computation/PartialRecursive.lean:17`](formalization/PureSFormal/Computation/PartialRecursive.lean#L17), [`:84`](formalization/PureSFormal/Computation/PartialRecursive.lean#L84), [`:179`](formalization/PureSFormal/Computation/PartialRecursive.lean#L179), [`:186`](formalization/PureSFormal/Computation/PartialRecursive.lean#L186) | Closed minimization-program syntax, fuelled evaluator, total-correctness certificate, and computability predicate | `PartialRecursive.computable_of_primitiveRecursive`; `FixedEndpoint.generatorCode_computable` |
| `Cook.rogozhinCookProgram` | [`formalization/PureSFormal/Cook/CTS.lean:179`](formalization/PureSFormal/Cook/CTS.lean#L179) | The fixed 912-phase cyclic tag program | `Cook.rogozhinCookProgram_period` |
| `Rogozhin46.transition`, `Rogozhin46.table`, `Rogozhin46.step?` | [`formalization/PureSFormal/Rogozhin/Table.lean:42`](formalization/PureSFormal/Rogozhin/Table.lean#L42), [`:99`](formalization/PureSFormal/Rogozhin/Table.lean#L99), [`formalization/PureSFormal/Rogozhin/Machine.lean:46`](formalization/PureSFormal/Rogozhin/Machine.lean#L46) | Rogozhin's `(4,6)` machine table and transition | — |
| `ProtectedTrieMachine.Machine`, `strongEncoder`, `strongProjection`, `verify` | [`formalization/PureSFormal/Research/ProtectedTrieMachine.lean:49`](formalization/PureSFormal/Research/ProtectedTrieMachine.lean#L49), [`formalization/PureSFormal/Research/ProtectedTrieStrong.lean:53`](formalization/PureSFormal/Research/ProtectedTrieStrong.lean#L53), [`:56`](formalization/PureSFormal/Research/ProtectedTrieStrong.lean#L56), [`formalization/PureSFormal/Research/ProtectedTrieTableau.lean:211`](formalization/PureSFormal/Research/ProtectedTrieTableau.lean#L211) | Ordered-binary source model, target encoder, projection, and observer | `ProtectedTrieMachineAgreement.step?_eq_some_iff_textbookStep` |

The complete root-restarted state type is the fixed sum of the compiled
priority-pass controls and the contraction/Euler tail. Each component supplies
a finite covering list; its transition reads only finite control, node kind
and incoming side. Static patterns, action labels and row lists depend on the
fixed program and dispatcher, never on a source instance. The assembled cover
and transition definitions are a deterministic table generator. Their raw
cover length, deduplicated cardinality and reachable-state count are distinct;
no numerical count for the complete controller is asserted here.

`RootResetReadonlySelector.stoppingTime` is the generated coefficient times
`term.size + 1`. The executable Lean result wrapper computes this size-based
budget outside the controller and observes its absorbing terminal state.
The transition function neither reads the size nor stores a countdown. The
coefficient is fixed once the controller is fixed; the 51 and 74
microtick coefficients belong to partial machines. Exact projection theorems
tie the returned term or normality answer to this actual run. Temporary cursor
storage is the functional zipper, potentially of linear depth; no logarithmic
implementation-space or constant-time indexed-store bound follows from it.

`RootResetFiniteAllInputsTraceAgreement` proves that every generated contraction
is selected by this same machine, and fresh-root iteration is pointwise equal
to the persistent baseline. The fixed fallback covers malformed terms as well.
The [verification guide](VERIFICATION.md) identifies the public aggregate,
formal audits and supplemental checker coverage.

`ParserPrimitiveMachine` and `ParserWordPrimitive` provide a primitive-operation
refinement of literal-word decoding. The operation model counts constructor
inspection, child-reference reads, Boolean branches, and list allocation on
immutable trees and lists. Equality stops at the first mismatch; append counts
the traversal and copying of its left operand. `parse_value` proves agreement
with `CheckpointDecoder.parseWord?` on every bare term, and
`parse_operations_le` proves the bound `128 * (term.size + 1)^2` for this
implementation, including rejected inputs. These are operation counts in the
stated reference model, not bit costs or Lean execution times.
`ParserCellSpinePrimitive` extends the implementation to transparent
tombstones: its value agrees with `CellSpine.decode?` on every term, its
audit fields remain opaque, and its operation count is at most
`129 * (term.size + 1)^2`. The six-module census records safe declarations with at most `propext` and `Quot.sound`.

`ParserActionPrimitive` collects an action's application-spine arguments in
one pass and compares the history length with an immutable unary count from
the precompiled grammar. It returns the same accumulator and histories as
`ActionParser.parse` for every term. Its bound is `36 * (term.size + 1)`
operations, including the initial empty-list allocation. The comparison
stops at the first length mismatch; it does not traverse a large expected
count after the argument list ends. The pair's census covers safe
declarations with at most `propext` and `Quot.sound`.

`ParserRoutePrimitive` traverses a fixed prepared dispatcher grammar whose
nodes store their compiled code. It preserves the public route parser's
short-circuit order and agrees with it on every term. Its bound is
`coefficient grammar * (term.size + 1)`. The coefficient includes the sizes
of stored code used in dormant-branch comparisons. Its complete pair census
covers safe declarations with at most `propext` and `Quot.sound`.
`DispatchParserPrimitive` adds response projection and selected-action
checking. Unary expected history counts are stored at prepared leaves and
read during projection. `parsePrepared_operations_le` gives a linear bound
with coefficient `ParserRoutePrimitive.coefficient grammar +
responseBound counts + 52`; `parse_value` proves agreement with the public
dispatcher parser on all inputs. Its pair census covers safe declarations
with at most `propext` and `Quot.sound`. Grammar preparation is fixed before an input term is
provided and is separate from these traversal bounds.

`ParserLocalPrimitive` captures the prepared grammar and unary history counts
before receiving the input term. `ParserCarrierPrimitive`,
`ParserChainPrimitive`, `ParserPhasePrimitive`, `ParserPositivePrimitive`,
and `ParserCheckpointPrimitive` compose the measured local checks through
the complete continuation and checkpoint grammar. `PublicDecoderPrimitive`
and `TermEventPrimitive` agree with the actual public decoder and marker
detector on every term, with explicit quadratic bounds. Phase arithmetic
uses unary successor and constructor comparison. The four public-decoder
and detector source/audit modules have safe declarations with at most
`propext` and `Quot.sound`, and no policy violations. `CheckpointSeedReadbackPrimitive`
also measures recovery of the immutable seed and exact current checkpoint;
its pair census covers safe declarations. The source-output reader's
subsequent compiler-code parsing is included in the complete quartic budget
of `DeterministicTapeOutputQuartic`.

`ParserNatPrimitive` and `ParserNatDivisionPrimitive` implement measured unary
addition, subtraction, multiplication, and quotient/remainder computation.
`TapeStackPrimitive` uses those operations to invert each binary stack code,
including rejection of malformed inputs. `TapeRowPrimitive` agrees with
`decodeTapeBoundary?` for every primitive state. Its operation count is at
most `640 * (control + left + right + 1)^2`; successful parsing also bounds
the returned state, head, and tape length by the input fields. The tape-row
source/audit pair has safe declarations with at most `propext` and `Quot.sound` and no
policy violations.

The complete encoder certificate is
[`CookEncodingComputability`](formalization/PureSFormal/Computation/CookEncodingComputability.lean).
Its closed programs `Program.sourceBits` and `Program.sourceTerm` compute the
exact existing source-to-word and source-to-term code maps on every natural
input. Intermediate certificates use explicit instruction/list numberings,
normalization, Rogozhin data and program windows, radix-eight counters, and
the fixed one-hot encoding. Each code is connected to the actual typed
compiler by an evaluation equation and boundary decoder.
[`DeterministicTapeEffectiveReduction`](formalization/PureSFormal/Computation/DeterministicTapeEffectiveReduction.lean)
defines the source and target predicates using the established total
numberings and joins encoder computability with the fixed marked-path
halting equivalence.

`EncoderPrimitive.literal` constructs the final pure-S term from its Boolean
word. The fixed dispatcher headers are prepared before receiving that word.
After constructing the application spine, a measured constructor copy
materializes every syntax-tree occurrence, including every fixed-header
occurrence. The resulting value is exactly `generator actions bits`, with
at most `77 * bits.length + 4 * actions.size + 167` primitive operations.
Independent execution derivations cover the word fold and complete tree copy.
The source/audit pair has safe declarations with at most `propext` and `Quot.sound` and
no policy violations. This is the final word-to-term stage; the full source
encoder also requires the preceding table and data construction costs.

`ThreeCounterTagConstructionSize` bounds actual intermediate syntax.
A primitive program with `P` instructions yields `30P + 3` normalized tag
rows, each with at most ten labels. Its initial word has length
`4 + initialMass`, at most `4 + 2 * (2^L + 2^R + 2^S)` for the three
initial register values. These are materialized list sizes; numerical-label
storage and construction operations require separate accounting.

`DeletionTwoNormalizationMachine.normalization_execution` supplies an
actual constructor execution of the initial-word normalizer. For a table
with `M` rows and a word of `N` labels, it takes at most
`M + 3 + (M + 3) * N` transitions and at most four unary tree/list data operations
per transition. Natural-number comparisons inspect unary constructors;
labels and output subtrees are shared references. This representation bound
is distinct from the cost of Lean's native integer representation.

`DeterministicTapeStatePadding` allocates undefined rows for every initial
and referenced state without changing any source transition or run.
`DeterministicTapeStatePaddingComputability` certifies this transform and
its composition with the complete encoder on every natural input code.
`CookSeedReadbackContext.decodeTape?` receives the immutable input word and
the current cyclic-tag snapshot. It parses program frames from the seed and
recovers a literal tape row from the snapshot's registered encodings.
`CookSeedTerminalReadback.decodeTerminalTape?` additionally checks the
source transition's absence through a static production lookup. Neither
observer receives a source program or executes one.
`CookSeedBoundaryReflection.contextOf_decodeBoundary?_sound` reconstructs
the entire checked Rogozhin boundary, including its unchanged program region
and unary audit prefix, from any accepted input configuration.

`CookSeedPassReadback` uses the seed, current CTS horizon, and current
snapshot to recognize Cook's canonical initial boundary and later arrivals.
`CookArrivalReflection`, `RogozhinBoundaryOperationalReflection`, and
`DeterministicTapeTagSourceReflection` reflect every accepted row through
the actual Cook, Rogozhin, normalized tag, counter, and source executions.
The Rogozhin argument excludes every strict macro interior, including
intermediate visits to state A with the wrong current symbol. A nonempty
accepted tag word is therefore an actual tag iterate.

`CheckpointSeedReflection.decode?_actual_iff` proves that every accepted
term snapshot contains the original seed, the actual CTS horizon and
configuration, and occurs at exactly that horizon's scheduler checkpoint.
`DeterministicTapePureSOutput` composes this fact with the compiler reflection.
Its three observers have types `Term → Option Row`, `Term → Option Row`,
and `Term → Option Bool`. `exists_literalRow_iff` identifies the observed
rows with the literal finite source trajectory; `exists_terminalRow_iff`
identifies terminal observations with reachable halted rows;
`exists_scannedOutput_iff` preserves and reflects the declared scanned-bit
output. `bitToggle_output_iff` proves that the example accepts exactly the
complemented input bit. The encoder has a closed primitive-recursive code
certificate, and every adjacent sampled term is related by one native S
contraction. The output pair has 20 authored axiom queries. Its complete
census records safe declarations using at most `propext` and `Quot.sound`. These are retained
persistent-path certificates. `DeterministicTapeRootResetOutput` transfers
the same row, terminal-row and scanned-bit equivalences to iteration of the
actual finite root-restarted selector, using the same padded encoder.
`DeterministicTapePaddedEncoderConstructionMachine.complete_padded_encoder_certificate`
certifies all source decoding, padding, compiler construction and final
unshared-tree materialization for that encoder, with its stated unary/list
operation budget. It does not simulate the source computation or claim a
polynomial bound in binary source-description length.

For every finite input term of size `N`, including rejected terms,
`DeterministicTapeOutputQuartic.complete_output_resource_certificate` bounds
each full observer by `sU * (N + 1)^4 + 114010 * (N + 1)^4 + 8 * (N + 1)^4`,
where `sU = DeterministicTapeOutputPrimitive.coefficient` is fixed. This bound
counts actual parsing, numeric reconstruction, complete candidate checks and
output construction. Pointwise path equality preserves these same input terms
and operation bounds under root restart.

The physical-size counts below describe the retained baseline interface and
its named modules. They are not counts of the expanded root-reset inspection
surface or of its controller states.

The operational outer-interface declarations preceding the numbering rows
occupy **229** physical declaration lines under the count used here. The
executable decoder interface and its
delegated parser/proof modules—`PublicDecoder`, `CheckpointDecoder`,
`CarrierDecoder`, `DispatchParser`, `CellSpine`, and `CanonicalStep`—occupy
**3,804** physical source lines in total. The latter count deliberately
includes parser definitions, supporting grammar definitions, docstrings, and
proofs so that the transitive decoder inspection surface is visible rather
than represented by its public wrapper alone.

The five transparent numbering and computability modules named above occupy
**2,664** physical source lines in total: `TermNatCode`,
`DeterministicTapeCode`, `PrimitiveRecursive`, `PartialRecursive`, and
`DeterministicTapePureSComputability`. This count likewise includes their
definitions, executable evaluators, supporting lemmas, and proofs; it does not
represent the closed generator certificate by its small public wrapper alone.

Appendix F uses the same native `PureS.Step` and closed minimization
computability model. `AppendixF.MaximalPaths.Path` represents either an
infinite native path or a finite path ending in normal form; its acceptance
predicate includes the initial sample and the finite endpoint. `Exact`
quantifies over every such path. `DecidableSet` requires an actual closed
computable characteristic function. `ComputabilityCertificates.computable_iff_certificate`
connects the finite computation certificates to that existing model.

`AppendixF.Carrier.Code` and `AppendixF.RecursiveCall.Admissible` encode the
literal carrier and I/G grammars. Their parsers have soundness and coverage
proofs. `RecursiveCall.recognized_call_has_finite_table` extracts the finite
table needed by the recursive observation decision. The observation theorems
expand each macro into native contractions and include every intermediate
term in its surrounding context. The Appendix F exports and their exact
axioms are listed in `formalization/generated/public_api.json`.
