#!/usr/bin/env python3
"""Generate paper-ready public theorem statements from pinned Lean output."""

from __future__ import annotations

import argparse
import difflib
import json
import pathlib
import re
import subprocess
import sys


ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.dont_write_bytecode = True
sys.path.insert(0, str(ROOT.parent / "src"))
from local_workspace import LocalWorkspace, absolute_lake, lake_command, temporary_directory
ARTIFACT = ROOT / "generated" / "public_theorem_signatures.md"
API_ARTIFACT = ROOT / "generated" / "public_api.json"
PUBLIC_MODULE = ROOT / "PureSFormal" / "Public.lean"
PUBLIC_AUDIT = ROOT / "PureSFormal" / "PublicAudit.lean"
API_VERSION = 10

PUBLIC_IMPORTS: tuple[str, ...] = (
    "PureSFormal.DefinitionAgreement",
    "PureSFormal.CTS.Core",
    "PureSFormal.Cook.CTS",
    "PureSFormal.Cook.PassClassification",
    "PureSFormal.Computation.DeterministicTapeCook",
    "PureSFormal.Computation.DeterministicTapeThreeCounterCompiler",
    "PureSFormal.Computation.ThreeCounterTag",
    "PureSFormal.Computation.RogozhinT2Correctness",
    "PureSFormal.PureS.PublicDecoder",
    "PureSFormal.PureS.TermEvent",
    "PureSFormal.PureS.CountedCheckpointDecoder",
    "PureSFormal.PureS.EncoderSize",
    "PureSFormal.PureS.SchedulerStageAssembly",
    "PureSFormal.Research.ProtectedTrieProjection",
    "PureSFormal.StrongMultiwayUniversality",
    "PureSFormal.Research.ProtectedTrieCertificateEnumeration",
    "PureSFormal.WeakPathUniversality",
    "PureSFormal.WeakPathPolynomialCost",
    "PureSFormal.Computation.DeterministicTapeTrajectoryDecoder",
    "PureSFormal.Computation.LegacyCompilerGrowth",
    "PureSFormal.Research.RootResetBoundedDepthObstruction",
    "PureSFormal.Research.RootResetProgressWalker",
    "PureSFormal.Research.RootResetProgressCompleteness",
    "PureSFormal.Research.RootResetPersistentInitialBridge",
    "PureSFormal.Research.ProtectedTrieFairness",
    "PureSFormal.Research.ProtectedTrieTableauExactResource",
    "PureSFormal.CostModel.SharedCostTheorem",
    "PureSFormal.CostModel.DAGLocalObserver",
    "PureSFormal.CostModel.UnifiedResourceLedger",
    "PureSFormal.CostModel.PointerWordCost",
    "PureSFormal.PureS.MutationFreePeriodicity",
    "PureSFormal.EvaluatorBounds",
    "PureSFormal.Computation.FixedEndpointUniformity",
    "PureSFormal.Computation.DeterministicTapePureSComputability",
    "PureSFormal.Computation.CookEncodingComputability",
    "PureSFormal.Computation.DeterministicTapeEffectiveReduction",
    "PureSFormal.Computation.DeterministicTapePureSOutput",
    "PureSFormal.PureS.PrimitiveInterfaceCertificates",
    "PureSFormal.Challenge",
    "PureSFormal.Research.ProtectedTrieConfluenceObstruction",
    "PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement",
    "PureSFormal.Research.RootResetContractProjection",
    "PureSFormal.Computation.DeterministicTapeRootResetOutput",
    "PureSFormal.RootResetChallenge",
    "PureSFormal.RootResetHeadline",
    "PureSFormal.Computation.SourceChronologyRootReset",
    "PureSFormal.Research.RootResetCumulativeResources",
    "PureSFormal.Computation.DeterministicTapeInfiniteTape",
    "PureSFormal.Research.RootResetRegularMarkerLanguage",
)

# The formal statement is emitted by Lean. Only the heading and one-line gloss
# are authored here.
SIGNATURES: tuple[tuple[str, str, str], ...] = (
    (
        "Contextual pure-S contraction",
        "PureSFormal.PureS.Step",
        "One step contracts exactly one contextual occurrence of the sole pure-S rule.",
    ),
    (
        "Textbook pure-S rule agreement",
        "PureSFormal.PureS.step_iff_textbookStep",
        "The implemented contextual reduction relation is equivalent to the inductive closure of the textbook S contraction in application contexts.",
    ),
    (
        "Finite-controller representation agreement",
        "PureSFormal.PureS.FiniteController.machineEquivTextbook",
        "The executable controller representation and the independently presented textbook finite tree-walker representation are mutually inverse on states and transition commands.",
    ),
    (
        "Challenge persistent-cursor contract",
        "PureSFormal.Challenge.ChallengePathUniversality",
        "One proposition gathers the fixed period-912 persistent-cursor endpoint, exact pure-S trajectory and decoding, halting equivalence, component bounds, and mutation-disabled periodicity without asserting term-only selection.",
    ),
    (
        "Challenge persistent-cursor universality theorem",
        "PureSFormal.Challenge.sCombinatorIsChallengePathUniversal",
        "The fixed persistent-cursor evaluator supplies a witness of the challenge-facing contract whose individual obligations are displayed and audited below.",
    ),
    (
        "Challenge contract: fixed period",
        "PureSFormal.Challenge.ChallengePathUniversality.programPeriod",
        "Every witness identifies the closed endpoint program with period exactly 912.",
    ),
    (
        "Challenge contract: duplicate-free controller cover",
        "PureSFormal.Challenge.ChallengePathUniversality.controllerStatesNoDuplicates",
        "Every witness includes duplicate-freeness of the fixed controller's canonical state cover.",
    ),
    (
        "Challenge contract: exhaustive controller cover",
        "PureSFormal.Challenge.ChallengePathUniversality.controllerCoverComplete",
        "Every witness includes membership of every fixed-endpoint control value in the canonical finite cover.",
    ),
    (
        "Challenge contract: textbook controller agreement",
        "PureSFormal.Challenge.ChallengePathUniversality.controllerTextbookAgreement",
        "Every witness proves that round-tripping the fixed controller through the independently presented textbook finite tree-walker preserves every transition-table cell.",
    ),
    (
        "Challenge contract: fixed endpoint counts",
        "PureSFormal.Challenge.ChallengePathUniversality.fixedEndpointCounts",
        "Every witness includes the exact register, code-node, template, ordinary-cover, and runtime-cover counts.",
    ),
    (
        "Challenge contract: realization of every input",
        "PureSFormal.Challenge.ChallengePathUniversality.realizesEveryInput",
        "Every Boolean input word is realized by the same closed program, controller, and bare-term decoder.",
    ),
    (
        "Challenge contract: every sampled edge is pure S",
        "PureSFormal.Challenge.ChallengePathUniversality.everySampledEdgeIsS",
        "Every adjacent contraction-sampled pair on every realized input is related by one contextual pure-S step.",
    ),
    (
        "Challenge contract: strictly increasing checkpoints",
        "PureSFormal.Challenge.ChallengePathUniversality.checkpointsStrictlyIncrease",
        "The registered checkpoint indices strictly increase for every Boolean input word.",
    ),
    (
        "Challenge contract: exact checkpoint decoding",
        "PureSFormal.Challenge.ChallengePathUniversality.exactCTSDecoding",
        "Bare-term decoding succeeds exactly at the registered index for the reported horizon and exact cyclic-tag iterate.",
    ),
    (
        "Challenge contract: fixed tape-halting endpoint",
        "PureSFormal.Challenge.ChallengePathUniversality.fixedTapeHaltingEndpoint",
        "Every deterministic Boolean-tape instance halts exactly when its structural encoding has the fixed marked-snapshot trajectory event.",
    ),
    (
        "Challenge contract: fixed tape-encoder shape",
        "PureSFormal.Challenge.ChallengePathUniversality.fixedTapeEncoderShape",
        "The endpoint encoder is the common generator applied to the structurally compiled Boolean input word.",
    ),
    (
        "Challenge contract: linear cyclic-tag encoder size",
        "PureSFormal.Challenge.ChallengePathUniversality.ctsEncoderSize",
        "For fixed endpoint actions, the encoded pure-S term has the displayed affine size bound in input-word length.",
    ),
    (
        "Challenge contract: computable cyclic-tag encoder",
        "PureSFormal.Challenge.ChallengePathUniversality.ctsEncoderComputable",
        "The all-natural Boolean-word-code to fixed-generator-term-code map carries a closed partial-recursive computability certificate.",
    ),
    (
        "Challenge contract: bounded next contraction",
        "PureSFormal.Challenge.ChallengePathUniversality.nextContractionBound",
        "At every realized contraction sample, bounded search finds the next contraction within runtime-state count times current bare-term size.",
    ),
    (
        "Challenge contract: total selector decision",
        "PureSFormal.Challenge.ChallengePathUniversality.selectorTotalDecision",
        "For every scheduler configuration, the fixed structural bound either finds a mutation or proves that no fuel can find one.",
    ),
    (
        "Challenge contract: bounded decoder",
        "PureSFormal.Challenge.ChallengePathUniversality.decoderBound",
        "On every finite bare term, the counted decoder agrees with the public decoder and satisfies its explicit cubic structural-scan bound.",
    ),
    (
        "Challenge contract: bounded detector",
        "PureSFormal.Challenge.ChallengePathUniversality.detectorBound",
        "On every finite bare term, the counted detector agrees with the public detector and satisfies its explicit cubic structural-scan bound.",
    ),
    (
        "Challenge contract: periodicity without S",
        "PureSFormal.Challenge.ChallengePathUniversality.withoutSIsEventuallyPeriodic",
        "With contraction commands disabled, every fixed-controller cursor run is eventually periodic within the displayed state-position bound.",
    ),
    (
        "Uniform selected-path realization",
        "PureSFormal.WeakPathUniversality.finiteCTSWeakPathUniversality",
        "Every fixed finite binary cyclic tag program has one scheduler and bare-term decoder realizing every finite input on a legal pure-S path.",
    ),
    (
        "Exact concrete scheduler checkpoints",
        "PureSFormal.PureS.SchedulerRecurrence.exactCheckpoint",
        "At every registered checkpoint time, the public decoder applied to the concrete scheduler run returns that horizon and the exact cyclic-tag iterate.",
    ),
    (
        "Fixed selected-path period-912 endpoint",
        "PureSFormal.WeakPathUniversality.fixedCookWeakPathUniversality",
        "The uniform selected-path realization specializes to the fixed 912-phase cyclic tag program.",
    ),
    (
        "Fixed cyclic-tag program period",
        "PureSFormal.Cook.rogozhinCookProgram_period",
        "The cyclic tag program obtained from the displayed Rogozhin-to-Cook construction has period exactly 912.",
    ),
    (
        "Fixed endpoint period witness",
        "PureSFormal.Computation.FixedEndpointUniformity.fixedProgram_period",
        "The closed program constant used by the universal endpoint has period exactly 912.",
    ),
    (
        "Fixed controller has a duplicate-free cover",
        "PureSFormal.Computation.FixedEndpointUniformity.fixedController_states_nodup",
        "The fixed endpoint controller exposes a duplicate-free canonical enumeration of all ordinary control values.",
    ),
    (
        "Fixed controller cover is exhaustive",
        "PureSFormal.Computation.FixedEndpointUniformity.fixedController_covers",
        "Every control value of the fixed endpoint occurs in its canonical finite cover.",
    ),
    (
        "Fixed controller agrees with the textbook tree-walker",
        "PureSFormal.Computation.FixedEndpointUniformity.fixedController_textbookAgreement",
        "Round-tripping the fixed endpoint controller through the independently presented textbook finite tree-walker preserves every transition-table cell.",
    ),
    (
        "Fixed endpoint raw cover counts",
        "PureSFormal.Computation.FixedEndpointUniformity.fixedEndpoint_rawCoverCounts",
        "The fixed endpoint has 21,888 register tuples, 3,647 code nodes, 3,457,625 templates, 75,680,496,000 raw ordinary cover entries, and one added rejecting state.",
    ),
    (
        "Fixed endpoint input dependence",
        "PureSFormal.Computation.FixedEndpointUniformity.fixedEncoder_eq_generator",
        "At the fixed endpoint the source instance occurs only through the structurally computed input bits supplied to the common pure-S generator.",
    ),
    (
        "Fixed endpoint generator program agreement",
        "PureSFormal.Computation.DeterministicTapePureSComputability.FixedEndpoint.generatorProgram_correct",
        "A closed primitive-recursive program maps each canonical Boolean-word code to the natural code of the corresponding fixed-endpoint pure-S generator term.",
    ),
    (
        "Fixed endpoint generator is primitive recursive",
        "PureSFormal.Computation.DeterministicTapePureSComputability.FixedEndpoint.generatorCode_primitiveRecursive",
        "The total all-natural map from Boolean-word codes to fixed-endpoint generator-term codes has a closed primitive-recursive program certificate.",
    ),
    (
        "Fixed endpoint generator is computable",
        "PureSFormal.Computation.DeterministicTapePureSComputability.FixedEndpoint.generatorCode_computable",
        "The Boolean-word-code to fixed-endpoint generator-term-code map has a closed minimization-program computability certificate.",
    ),
    (
        "Tape encoder primitive-recursive transfer",
        "PureSFormal.Computation.DeterministicTapePureSComputability.FixedEndpoint.encodeTermCode_primitiveRecursive_of_encodeBitsCode",
        "A primitive-recursive certificate for the exact tape-to-Boolean-word compiler composes with the proved generator program to certify the actual tape-instance-to-pure-S term-code map.",
    ),
    (
        "Tape encoder computability transfer",
        "PureSFormal.Computation.DeterministicTapePureSComputability.FixedEndpoint.encodeTermCode_computable_of_encodeBitsCode_primitiveRecursive",
        "The generic composition theorem transfers a primitive-recursive source-word certificate to the full encoder; sourceBits_primitiveRecursive supplies its premise for the displayed compiler.",
    ),
    (
        "Complete tape-to-word program agreement",
        "PureSFormal.Computation.CookEncodingComputability.Program.eval_sourceBits",
        "For every natural input code, one closed primitive-recursive program computes the exact existing deterministic-tape-to-Boolean-word compiler output code.",
    ),
    (
        "Complete tape-to-word compiler is primitive recursive",
        "PureSFormal.Computation.CookEncodingComputability.sourceBits_primitiveRecursive",
        "The exact source-instance-code to fixed cyclic-tag input-word-code map is primitive recursive with no validity or compiler premise.",
    ),
    (
        "Complete tape encoder program agreement",
        "PureSFormal.Computation.CookEncodingComputability.Program.eval_sourceTerm",
        "For every natural input code, a closed primitive-recursive program computes the exact existing deterministic-tape-to-pure-S term code.",
    ),
    (
        "Complete tape encoder is primitive recursive",
        "PureSFormal.Computation.CookEncodingComputability.sourceTerm_primitiveRecursive",
        "The full deterministic-tape-instance-code to pure-S-term-code encoder is primitive recursive without an external source-compiler premise.",
    ),
    (
        "Complete tape encoder is computable",
        "PureSFormal.Computation.CookEncodingComputability.sourceTerm_computable",
        "The exact complete encoder has a closed minimization-program computability certificate on every natural input code.",
    ),
    (
        "Effective deterministic-tape halting reduction",
        "PureSFormal.Computation.DeterministicTapeEffectiveReduction.effectiveReduction",
        "The exact natural-code encoder is computable and preserves and reflects deterministic-tape halting into the fixed bare-term marked-path predicate in one premise-free theorem.",
    ),
    (
        "Output path starts at the certified encoder",
        "PureSFormal.Computation.DeterministicTapePureSOutput.termAt_zero",
        "The source-output trajectory starts at the same explicitly padded source encoder whose full code map is certified.",
    ),
    (
        "Every source-output path edge is a native S contraction",
        "PureSFormal.Computation.DeterministicTapePureSOutput.termAt_step",
        "Every adjacent sampled term on the fixed persistent-cursor output path is related by one native contextual S contraction.",
    ),
    (
        "Output-preserving encoder is primitive recursive",
        "PureSFormal.Computation.DeterministicTapePureSOutput.encode_code_primitiveRecursive",
        "The exact padded source-instance-to-term code map used by the output theorems has a closed primitive-recursive program certificate on every natural input.",
    ),
    (
        "Exact bare-term source-row readback",
        "PureSFormal.Computation.DeterministicTapePureSOutput.exists_literalRow_iff",
        "A fixed bare-term observer accepts a row somewhere on the actual contraction path exactly when that literal row occurs in the source computation.",
    ),
    (
        "Exact bare-term terminal-row readback",
        "PureSFormal.Computation.DeterministicTapePureSOutput.exists_terminalRow_iff",
        "A fixed bare-term observer accepts a terminal row exactly when it is reachable in the original source machine and its next transition is undefined.",
    ),
    (
        "Exact scanned-bit output preservation",
        "PureSFormal.Computation.DeterministicTapePureSOutput.exists_scannedOutput_iff",
        "The fixed bare-term scanned-bit observer emits a Boolean value exactly when the source computation halts with that scanned bit; all contraction samples are covered.",
    ),
    (
        "Nonhalting source runs reject terminal observations",
        "PureSFormal.Computation.DeterministicTapePureSOutput.nonhalting_rejects_terminal",
        "Every contraction sample of an encoded nonhalting source is rejected by the terminal-row observer.",
    ),
    (
        "Fixed Boolean negation through the pure-S path",
        "PureSFormal.Computation.DeterministicTapePureSOutput.bitToggle_output_iff",
        "The same source table, encoder, and fixed bare-term observer compute Boolean negation for both inputs and exclude every incorrect output at every sample.",
    ),
    (
        "Primitive public decoder certificate",
        "PureSFormal.PureS.PrimitiveInterfaceCertificates.primitivePublicDecoder_resource_certificate",
        "The measured constructor implementation agrees with the actual public decoder on every term and uses at most its explicit fixed coefficient times the squared tree-size successor.",
    ),
    (
        "Primitive marked detector certificate",
        "PureSFormal.PureS.PrimitiveInterfaceCertificates.primitiveMarkedDetector_resource_certificate",
        "The measured marked-checkpoint detector agrees with the actual Boolean observer on every term and has an explicit quadratic primitive-operation bound.",
    ),
    (
        "Primitive immutable-seed readback certificate",
        "PureSFormal.PureS.PrimitiveInterfaceCertificates.primitiveSeedReadback_resource_certificate",
        "The measured bare-term seed/checkpoint reader agrees with the actual executable reader on every term and has an explicit quadratic primitive-operation bound.",
    ),
    (
        "Linear cyclic-tag word encoder size",
        "PureSFormal.PureS.generator_size_le_eighteen",
        "For fixed action code, the pure-S generator has at most its fixed encoder constant plus eighteen nodes per input bit.",
    ),
    (
        "Fixed scheduler register count",
        "PureSFormal.PureS.SchedulerControl.cook_registerCoverEntryCount",
        "The fixed period-912 scheduler has exactly 21,888 syntactic register tuples in its raw cover.",
    ),
    (
        "Fixed scheduler dispatcher-node count",
        "PureSFormal.PureS.SchedulerControl.cook_codeNodeCoverEntryCount",
        "The fixed dispatcher contributes exactly 3,647 code-node identifiers.",
    ),
    (
        "Fixed scheduler macro-template count",
        "PureSFormal.PureS.SchedulerControl.cook_macroTemplateCount",
        "The fixed scheduler has exactly 10,970 macro program-counter templates.",
    ),
    (
        "Fixed scheduler script-template count",
        "PureSFormal.PureS.SchedulerControl.cook_scriptTemplateCount",
        "The fixed scheduler has exactly 3,028,833 script program-counter templates.",
    ),
    (
        "Fixed scheduler probe-template count",
        "PureSFormal.PureS.SchedulerControl.cook_probeTemplateCount",
        "The fixed scheduler has exactly 417,822 probe program-counter templates.",
    ),
    (
        "Fixed scheduler total-template count",
        "PureSFormal.PureS.SchedulerControl.cook_controlTemplateCount",
        "The fixed scheduler has exactly 3,457,625 macro, script, and probe templates in total.",
    ),
    (
        "Fixed scheduler raw control-cover count",
        "PureSFormal.PureS.SchedulerControl.cook_controlCoverEntryCount",
        "The Cartesian raw ordinary-control cover contains exactly 75,680,496,000 entries before deduplication.",
    ),
    (
        "Fixed scheduler raw runtime-cover count",
        "PureSFormal.PureS.SchedulerControl.cook_runtimeCoverEntryCount",
        "Adding the rejecting runtime state gives 75,680,496,001 raw runtime-cover entries.",
    ),
    (
        "Cyclic-tag phase arithmetic",
        "PureSFormal.CTS.iteratePhase_val",
        "The numeric phase after n cyclic-tag iterations is the initial phase plus n modulo the program period.",
    ),
    (
        "Deterministic tape to primitive three-counter halting",
        "PureSFormal.Computation.DeterministicTapeThreeCounterCompiler.Execution.halts_iff_threeCounterHalts",
        "A deterministic tape instance halts exactly when its compiled primitive three-counter machine halts from the compiled initial configuration.",
    ),
    (
        "Primitive three-counter to restricted tag halting",
        "PureSFormal.Computation.ThreeCounterTag.Numeric.universalHalts_iff_compileJob",
        "The universal primitive three-counter machine halts on a job exactly when the compiled restricted tag job eventually halts.",
    ),
    (
        "Restricted tag to Rogozhin-machine halting",
        "PureSFormal.Computation.RogozhinT2Simulation.eventuallyHalts_compile_iff",
        "For every well-formed restricted tag program and word, the compiled Rogozhin-machine configuration eventually halts exactly when the source job eventually halts.",
    ),
    (
        "Rogozhin machine to fixed cyclic-tag emptiness",
        "PureSFormal.Cook.PassClassification.canonical_eventuallyHalts_iff_exists_cts_empty",
        "A canonical Rogozhin configuration eventually halts exactly when its fixed cyclic-tag encoding reaches an empty dataword.",
    ),
    (
        "Deterministic tape to compiled three-counter job",
        "PureSFormal.Computation.DeterministicTapeCook.halts_iff_threeCounterJob",
        "Deterministic tape halting is equivalent to halting of its displayed initialized primitive three-counter job.",
    ),
    (
        "Deterministic tape to compiled restricted tag job",
        "PureSFormal.Computation.DeterministicTapeCook.halts_iff_t2Job",
        "Deterministic tape halting is equivalent to eventual halting of its displayed restricted tag job.",
    ),
    (
        "Premise-free deterministic-tape to fixed-Cook endpoint",
        "PureSFormal.Computation.DeterministicTapeCook.halts_iff_fixedCookEmpty",
        "Halting of the independently defined deterministic Boolean-tape source is exactly eventual emptiness of the encoded input to the fixed period-912 Cook cyclic tag program.",
    ),
    (
        "Premise-free deterministic-tape selected-path endpoint",
        "PureSFormal.WeakPathUniversality.deterministicTapeHalts_iff_fixedPureSMarkedSnapshotTermEvent",
        "Deterministic tape halting is exactly eventual decoder-recognized marked-checkpoint observation on the selected trajectory from the displayed bare pure-S term.",
    ),
    (
        "Literal stack-code decoding round trip",
        "PureSFormal.Computation.DeterministicTapeCounterCompiler.StackCode.decode?_encode",
        "The total sentinel-stack parser recovers every finite Boolean stack from its arithmetic compiler code.",
    ),
    (
        "Literal stack-code decoding soundness",
        "PureSFormal.Computation.DeterministicTapeCounterCompiler.StackCode.encode_of_decode?_eq",
        "Every successful stack parse is canonical: re-encoding the returned Boolean list gives the supplied natural exactly.",
    ),
    (
        "Literal tape-boundary decoder soundness",
        "PureSFormal.Computation.DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_sound",
        "Every accepted primitive candidate is exactly a canonical macro-boundary with two canonical stack codes, a nonempty scanned-cell stack, and the returned literal row.",
    ),
    (
        "Literal tape-boundary inverse",
        "PureSFormal.Computation.DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_boundaryState_configurationOf",
        "At every represented primitive macro-boundary with a scanned cell, the total decoder returns exactly the literal source tape row.",
    ),
    (
        "Literal initial tape-boundary decoding",
        "PureSFormal.Computation.DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_compileInitial",
        "The executable primitive initial state decodes exactly to the deterministic tape source's literal initial row.",
    ),
    (
        "Every defined tape run has a decoded primitive boundary",
        "PureSFormal.Computation.DeterministicTapeTrajectoryDecoder.exists_decodedPrimitiveBoundary_of_runFor?_eq_some",
        "Every defined finite deterministic-tape run reaches a compiled primitive three-counter boundary whose structural boundary parser returns that exact tape row.",
    ),
    (
        "Named pointwise deterministic-tape halting equivalence",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotTapeEncoder_reducesVia",
        "The transparent tape-instance encoder satisfies the displayed pointwise equivalence between deterministic-tape halting and the fixed bare-term marked-snapshot event; this declaration carries no computability field.",
    ),
    (
        "Selected-path exact recognition",
        "PureSFormal.WeakPath.Realizes.decode_eq_some_iff",
        "A successful bare-term decode occurs exactly at the registered checkpoint for its reported horizon and exact cyclic-tag iterate.",
    ),
    (
        "Selected-path noncheckpoint exclusion",
        "PureSFormal.WeakPath.Realizes.rejectsOther",
        "Every contraction index outside the checkpoint range decodes to failure.",
    ),
    (
        "Literal decoder factorization",
        "PureSFormal.PureS.PublicDecoder.decode_eq_decodeLiteral",
        "The public decoder is exactly a total syntactic literal parser followed by materialization of the reported phase and queue.",
    ),
    (
        "Counted decoder value agreement",
        "PureSFormal.PureS.CountedCheckpointDecoder.countedDecode_value",
        "The metered checkpoint decoder returns exactly the same value as the total public bare-term decoder on every finite term.",
    ),
    (
        "Counted decoder all-input bound",
        "PureSFormal.PureS.CountedCheckpointDecoder.countedDecode_ticks_le",
        "The metered checkpoint decoder uses at most its fixed explicit coefficient times the cube of one plus the current bare-term size, measured in charged complete structural scans.",
    ),
    (
        "Public decoder resource certificate",
        "PureSFormal.PureS.CountedCheckpointDecoder.publicDecoder_resource_certificate",
        "Value agreement and the all-input cubic charged-structural-scan bound hold together for the public decoder.",
    ),
    (
        "Counted detector value agreement",
        "PureSFormal.PureS.CountedTermEvent.countedObservesMarkedCheckpoint?_value",
        "The metered marked-checkpoint detector returns exactly the same Boolean as the public detector on every finite term.",
    ),
    (
        "Counted detector all-input bound",
        "PureSFormal.PureS.CountedTermEvent.countedObservesMarkedCheckpoint?_ticks_le",
        "The metered marked-checkpoint detector uses at most its fixed explicit coefficient times the cube of one plus the current bare-term size, measured in charged complete structural scans.",
    ),
    (
        "Public detector resource certificate",
        "PureSFormal.PureS.CountedTermEvent.detector_resource_certificate",
        "Value agreement and the all-input cubic charged-structural-scan bound hold together for the marked-checkpoint detector.",
    ),
    (
        "Marked-checkpoint detector characterization",
        "PureSFormal.PureS.TermEvent.emitsMarkH?_eq_true_iff",
        "The marked-checkpoint detector returns true exactly for a structurally decoded positive checkpoint whose literal queue is empty.",
    ),
    (
        "Fixed cyclic-tag emptiness to marked-checkpoint observation",
        "PureSFormal.PureS.TermEvent.eventuallyObservesMarkedCheckpointRaw_iff_eventuallyEmpty",
        "The fixed bare-term marked-checkpoint detector eventually fires on the actual scheduler run exactly when the simulated cyclic-tag dataword eventually becomes empty.",
    ),
    (
        "Selected-path per-contraction microtick bound",
        "PureSFormal.WeakPathUniversality.finiteCTSNextContractionMicroticks_le_linear",
        "Whenever a later scheduler mutation exists, the next contraction is found within q_A times the current erased-term size raw controller microticks.",
    ),
    (
        "Selected-path global raw-microtick bound",
        "PureSFormal.WeakPathUniversality.finiteCTS_sampleTick_le_explicit",
        "The raw finite controller reaches contraction sample j within j·q_A·2^j·|encode(w)| one-edge microticks, using the general unshared-tree growth envelope.",
    ),
    (
        "Selected-path cubic checkpoint bound",
        "PureSFormal.WeakPathUniversality.finiteCTSCheckpointTime_le_explicit_cubic",
        "The registered checkpoint contraction index has an explicit cubic upper bound with a coefficient fixed by the program and dispatcher.",
    ),
    (
        "Selected-path checkpoint tree-size bound",
        "PureSFormal.WeakPathUniversality.finiteCTSCheckpointTerm_size_le_explicit",
        "The unshared syntax tree at a registered checkpoint has an explicit exponential upper bound in the contraction count.",
    ),
    (
        "Monomial-envelope source-horizon transfer",
        "PureSFormal.WeakPathPolynomialCost.checkpointTime_le_of_horizon_le_polynomial",
        "A supplied monomial horizon envelope $H \\le K(t+1)^d$ yields the checked cubic checkpoint-contraction bound after substitution.",
    ),
    (
        "Quadratic-log source-horizon transfer",
        "PureSFormal.WeakPathPolynomialCost.checkpointTime_le_of_horizon_le_quadratic_log",
        "A supplied horizon bound $H \\le K(t+1)^2L$ yields $c_A(K(t+1)^2L+1)^3$, with $L$ supplied as an external factor.",
    ),
    (
        "Cubic source-horizon transfer",
        "PureSFormal.WeakPathPolynomialCost.checkpointTime_le_of_horizon_le_cubic",
        "A supplied degree-three cyclic-tag horizon envelope yields the explicit degree-nine pure-S checkpoint-contraction expression.",
    ),
    (
        "Cubic-log source-horizon transfer",
        "PureSFormal.WeakPathPolynomialCost.checkpointTime_le_of_horizon_le_cubic_log",
        "A supplied horizon bound $H \\le K(t+1)^3L$ yields $c_A(K(t+1)^3L+1)^3$, with $L$ supplied as an external factor.",
    ),
    (
        "Quartic source-horizon transfer",
        "PureSFormal.WeakPathPolynomialCost.checkpointTime_le_of_horizon_le_quartic",
        "A supplied degree-four cyclic-tag horizon envelope yields the explicit degree-twelve pure-S checkpoint-contraction envelope.",
    ),
    (
        "Selected-path universal-source equivalence",
        "PureSFormal.WeakPathUniversality.universalAccepts_iff_fixedPureSMarkedSnapshotTermEvent",
        "Explicit job-level two-counter acceptance is exactly eventual marked-checkpoint observation on the encoded scheduler trajectory.",
    ),
    (
        "Selected-path named source reduction",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotJobEncoder_reducesVia",
        "The displayed structural job encoder pointwise reduces universal-source acceptance to the fixed pure-S marked-snapshot term event.",
    ),
    (
        "Exponentially initialized term-event equivalence",
        "PureSFormal.WeakPathUniversality.encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotTermEvent",
        "Existential bounded-run acceptance from counters (2^n,0) is exactly marked-checkpoint observation at the displayed encoded pure-S term.",
    ),
    (
        "Exponentially initialized term-event reduction",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotFormulaEncoder_reducesVia",
        "The displayed formula encoder pointwise reduces the exponentially initialized bounded-run predicate to the marked-snapshot term event.",
    ),
    (
        "Exponentially initialized natural-code equivalence",
        "PureSFormal.WeakPathUniversality.encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotNatLanguage",
        "Existential bounded-run acceptance from counters (2^n,0) is exactly membership of the displayed natural code.",
    ),
    (
        "Exponentially initialized natural-code reduction",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotFormulaCodeEncoder_reducesVia",
        "The displayed formula-code encoder pointwise reduces the exponentially initialized bounded-run predicate to the natural-code language.",
    ),
    (
        "Mutation-free cursor periodicity",
        "PureSFormal.PureS.FiniteController.eventually_periodic_of_mutation_free",
        "On a fixed finite term, a contraction-free finite-control cursor run is eventually periodic within an explicit finite-state bound.",
    ),
    (
        "Bounded next contraction on every realized sample",
        "PureSFormal.EvaluatorBounds.selectNext_on_run_halts_within",
        "At every contraction sample of every realized cyclic-tag run, bounded search returns the next contraction within the fixed runtime-state count times current bare-term size.",
    ),
    (
        "All-configuration bounded selector decision",
        "PureSFormal.EvaluatorBounds.selectNext_total_decision",
        "On every arbitrary scheduler configuration, the published bound either finds a contraction or proves that no larger search fuel can find one.",
    ),
    (
        "Contraction-disabled controller periodicity",
        "PureSFormal.EvaluatorBounds.withoutContraction_run_eventuallyPeriodic",
        "Replacing every focused-contraction row by rejection makes every finite-control one-cursor run eventually periodic within the explicit state-position bound.",
    ),
    (
        "Scheduler mutation-free periodicity",
        "PureSFormal.EvaluatorBounds.mutationFree_run_eventuallyPeriodic",
        "Any mutation-free run of the scheduler is eventually periodic within its published finite-state/term-size bound.",
    ),
    (
        "Linear periodicity-bound identity",
        "PureSFormal.EvaluatorBounds.mutationFree_periodicityBound_eq_linear",
        "The scheduler periodicity bound is definitionally the runtime-state-list length times current erased-term size.",
    ),
    (
        "Fixed-depth root-prefix selector obstruction",
        "PureSFormal.Research.RootResetBoundedDepthObstruction.no_fixed_depth_sound_complete_selector",
        "No selector determined by one fixed-depth root prefix is both redex-sound and redex-complete on all pure-S terms; finite-state walkers with unbounded traversal and selectors restricted to a particular encoded reachable family are not excluded.",
    ),
    (
        "Root-reset progress-cell selected-step soundness",
        "PureSFormal.Research.RootResetProgressWalker.selectStep?_sound",
        "The fixed 23-state walker starts every invocation at the bare-term root; whenever its bounded search returns a target, that target is one genuine contextual pure-S contraction of the supplied current term.",
    ),
    (
        "Root-reset Armed endpoint execution",
        "PureSFormal.Research.RootResetProgressWalker.run_armed_endpoint",
        "A fresh root invocation opens either one-cell Armed progress spine after exactly twelve controller microticks; companion audited declarations give its single mutation and queue-deletion effect and the Open/Closed endpoint cases.",
    ),
    (
        "Progress-spine root-reset first-mutation execution",
        "PureSFormal.Research.RootResetProgressCompleteness.FirstMutation.run_freshRoot_exact",
        "On every finite registered progress spine with a designated first Armed or Open mutation, the fixed walker starts at the bare root, reaches that exact mutation, and uses at most sixteen microticks per registered cell.",
    ),
    (
        "Initial bare-root classifier agreement",
        "PureSFormal.Research.RootResetPersistentInitialBridge.firstPersistentEdge_rootResetAgreement",
        "On every encoded input, the 27-stage bare-root classifier recovers the initial stage, selects the persistent scheduler's first contraction address, and produces exactly its first sampled target term.",
    ),
    (
        "Progress-spine first-mutation exact-fuel completeness",
        "PureSFormal.Research.RootResetProgressCompleteness.FirstMutation.selectStep?_complete",
        "For every designated progress-spine first mutation, a derivation-linked registered-cell count and an exact fuel value select the named target within sixteen microticks per certified cell.",
    ),
    (
        "Progress-spine first-mutation state-bound completeness",
        "PureSFormal.Research.RootResetProgressCompleteness.FirstMutation.selectStep?_stateBound_complete",
        "The total state-bound invocation returns the exact designated first mutation on every arbitrary-depth term generated by the progress-spine relation; this is a component theorem, not a complete encoded-run closure theorem.",
    ),
    (
        "Root-reset exact mutation count",
        "PureSFormal.Research.RootResetProgressCompleteness.FirstMutation.runMutationCount_eq_one",
        "Every exact arbitrary-depth progress-spine execution reaches its selected target after one and only one pure-S contraction.",
    ),
    (
        "Root-reset bounded-wrapper fuel envelope",
        "PureSFormal.Research.RootResetProgressCompleteness.stateBound_initial_eq",
        "The structurally fuelled total wrapper supplies exactly twenty-four runtime states per syntax node to the fixed 23-control walker plus rejecting sink; this does not assert counter-free malformed-input termination of the bare controller.",
    ),
    (
        "Retained tape-compiler exponential primitive lower bound",
        "PureSFormal.Computation.LegacyCompilerGrowth.PrimitiveClock.two_pow_le_rightPopClock_replicate_false",
        "Exposing a leading zero above a zero tail of width w in the retained arithmetic compiler takes at least 2^w primitive right-pop steps.",
    ),
    (
        "Retained tag-materialization double-exponential lower bound",
        "PureSFormal.Computation.LegacyCompilerGrowth.TagMaterialization.two_pow_two_pow_le_dataBlock_of_zero_stack",
        "Composing the retained binary stack code with its literal unary tag representation produces a live register block of length at least 2^(2^w); no such lower bound is asserted for alternative compilers.",
    ),
    (
        "Retained compiled-boundary double-exponential lower bound",
        "PureSFormal.Computation.LegacyCompilerGrowth.TagMaterialization.two_pow_two_pow_le_compiled_boundary_encodeState",
        "At every bounded source-state control, the retained compiler's literal running boundary with a zero-filled right stack of width w has tag-encoded length at least 2^(2^w); the theorem concerns this representation and makes no reachability claim.",
    ),
    (
        "Shared-store kernel certificate",
        "PureSFormal.CostModel.sharedCostKernelCertificate",
        "Rank-certified acyclic arenas have bounded address growth, separated shared occurrences, exact complete-development contraction semantics, exact readback-preserving edge copying and privatization, exact supplied-path lifting, and an abstract charged allocation ceiling.",
    ),
    (
        "Shared-store edge-copy readback",
        "PureSFormal.CostModel.Arena.edgeCopy_rootReadback",
        "Copying one supplied nonroot incoming edge preserves the exact root readback.",
    ),
    (
        "Shared contraction is exact complete development",
        "PureSFormal.CostModel.Arena.contract_readback_eq_develop",
        "One concrete contraction of a reachable shared redex reads back exactly as the simultaneous development of every pairwise separated occurrence of that arena node.",
    ),
    (
        "Exact shared-store privatization",
        "PureSFormal.CostModel.Arena.privatize",
        "A supplied successful root address is privatized with exactly one copy per address edge, zero copies at the root, unchanged readback, and one root-relative endpoint occurrence.",
    ),
    (
        "Exact addressed-contraction lift",
        "PureSFormal.CostModel.Arena.lift_addressed_contraction",
        "Privatization followed by one concrete shared contraction realizes exactly one supplied ordinary addressed contraction.",
    ),
    (
        "Exact supplied-path lift",
        "PureSFormal.CostModel.Arena.lift_addressed_path",
        "Every supplied ordinary addressed path lifts from any rank-certified arena with the same source readback to a heterogeneous store trace with exact final readback and exact charged mutation count.",
    ),
    (
        "Direct supplied-path mutation bound",
        "PureSFormal.CostModel.AddressedPath.addressMoveCount_le_initial_size",
        "A supplied path of t ordinary contractions from a size-n source uses at most tn+t(t-1)/2 charged edge-copy and contraction mutations.",
    ),
    (
        "Concrete finite-arena interpreter certificate",
        "PureSFormal.CostModel.FiniteArena.interpreterCertificate",
        "The finite retained arena has charged one-edge navigation, exact one-record copies, exact two-record contractions, and retained/live cardinality bounds.",
    ),
    (
        "Unified selected-path resource ledger",
        "PureSFormal.CostModel.UnifiedResourceLedger.finiteCTS_endToEndLedger",
        "At every contraction sample one certificate identifies the bare term reached by the parent-linked controller, its exact contraction count, the raw controller-tick bound, the supplied shared-arena lift, and the combined structural charge.",
    ),
    (
        "Logarithmic pointer-word representation",
        "PureSFormal.CostModel.FiniteArena.pointerWordCertificate",
        "Every retained arena identifier and both fields of every application record fit a log2(retained-cardinality)+1-bit pointer word; this is a representation-width theorem, not an indexed-access runtime theorem.",
    ),
    (
        "DAG-local terminal-record observer value",
        "PureSFormal.CostModel.DAGLocalObserver.runTerminalCertificate_value",
        "The executed shared-store observer for one supplied history/payload record returns the direct DAG-local certificate predicate.",
    ),
    (
        "DAG-local terminal-record observer bound",
        "PureSFormal.CostModel.DAGLocalObserver.runTerminalCertificate_ticks_le_retainedLive",
        "One supplied terminal-record check has an explicit structural-tick bound in the frozen seed, protected address, tableau checker, retained cardinality, and live cardinality.",
    ),
    (
        "DAG-local terminal-record readback agreement",
        "PureSFormal.CostModel.DAGLocalObserver.terminalCertificate?_readback",
        "The direct arena check for one supplied terminal record agrees exactly with the corresponding check on the arena readback.",
    ),
    (
        "DAG-local terminal-record projection membership",
        "PureSFormal.CostModel.DAGLocalObserver.terminalRecordOnTerm?_eq_true_iff_labelledProjection",
        "On a tree term, acceptance of one supplied terminal record is equivalent to membership of that literal record in the labelled projection.",
    ),
    (
        "Independent source-transition agreement",
        "PureSFormal.Research.ProtectedTrieMachineAgreement.step?_eq_some_iff_textbookStep",
        "The executable ordered-binary machine step is equivalent to the independently defined textbook relation.",
    ),
    (
        "Exact six-contraction opening",
        "PureSFormal.Research.ProtectedTrieAlgebra.D_succ_open_six",
        "Every positive protected generator opens into its two child generators in six pure-S contractions.",
    ),
    (
        "Exact seven-contraction reset and opening",
        "PureSFormal.Research.ProtectedTrieAlgebra.D_zero_open_seven",
        "A zero-phase generator resets and opens into its two child generators in seven pure-S contractions.",
    ),
    (
        "All-redex protected-path monotonicity",
        "PureSFormal.Research.ProtectedTrieParser.anchoredOpenedAt?_step_mono",
        "Every protected path accepted below the frozen header survives every raw target contraction.",
    ),
    (
        "Prefix-free certificate addresses",
        "PureSFormal.Research.ProtectedTrieCertificates.a_prefix_iff",
        "One candidate address prefixes another exactly when both literal history and payload agree.",
    ),
    (
        "Literal-tableau verifier soundness",
        "PureSFormal.Research.ProtectedTrieTableau.verify_sound",
        "Every accepted supplied tableau certifies a genuine ordered source history.",
    ),
    (
        "Literal-tableau verifier completeness",
        "PureSFormal.Research.ProtectedTrieTableau.verify_complete",
        "Every genuine ordered source history has an accepted canonical literal tableau.",
    ),
    (
        "Unique accepted tableau witness",
        "PureSFormal.Research.ProtectedTrieTableau.verify_witness_unique",
        "Two accepted payloads for the same source and history are literally equal.",
    ),
    (
        "Whole-edge genuine batch",
        "PureSFormal.Research.ProtectedTrieStrong.strongProjection_step_genuine_batch",
        "Every unrestricted pure-S edge in the encoded reduction cone projects to an ancestor-ready finite batch of genuine frontier discoveries.",
    ),
    (
        "Every decoded history is genuine",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strongProjection_contains_valid_on_cone",
        "Every history returned at any term in the encoded reduction cone is a valid ordered-occurrence history of the frozen source instance.",
    ),
    (
        "Exact finite canonical range",
        "PureSFormal.Research.ProtectedTrieStrong.strongCheckpoint_exact",
        "The canonical representative of a valid finite history ideal decodes to exactly that ideal.",
    ),
    (
        "Cofinality from every reduct",
        "PureSFormal.Research.ProtectedTrieStrong.strong_cofinal_complete",
        "Every finite valid ideal remains recoverable above every finite reduct while retaining existing discoveries.",
    ),
    (
        "Exact one-event macrostep",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strong_frontier_exact_opening",
        "The selected opening stutters at every proper vertex and adds exactly one requested frontier history at its last edge.",
    ),
    (
        "Simple path for every source edge",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strongSourceEdgeSimplePath_nonempty",
        "Every valid source edge has a proof-level pure-S path whose complete literal vertex list is Nodup.",
    ),
    (
        "Subdivision-checkpoint reachability",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strong_subdivisionCheckpoint_reachable",
        "Every valid source-history checkpoint lies in the contextual reduction cone of the concrete encoder.",
    ),
    (
        "Exact subdivision-checkpoint projection",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strong_subdivisionCheckpoint_exact",
        "Every valid source-history checkpoint decodes to exactly its ancestor history ideal.",
    ),
    (
        "Literal simple directed subdivision",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strong_simple_directed_subdivision",
        "Executable checkpoints and the same loop-erased simple-path family give injective vertices, pairwise-disjoint interiors, and no checkpoint in an edge interior.",
    ),
    (
        "Finite source-branch lift",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strongFiniteBranchWalk",
        "Every finite valid ordered source branch has a proof-level target walk between its exact checkpoints.",
    ),
    (
        "Infinite source-branch lift",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strongInfiniteBranchStep",
        "Every adjacent pair of finite prefixes of a valid infinite ordered source branch is joined by a proof-level target edge walk.",
    ),
    (
        "Literal final-row provenance",
        "PureSFormal.Research.ProtectedTrieLabelledObserver.labelledProjection_literal_final_on_cone",
        "Every emitted public label is copied from the final row of an accepted literal tableau in the current term.",
    ),
    (
        "Ordered enabled slots and terminality",
        "PureSFormal.Research.ProtectedTrieLabelledObserver.labelledProjection_slot_and_terminal_on_cone",
        "The two enabled-slot flags and terminal flag agree exactly with the concrete ordered machine table.",
    ),
    (
        "Literal label uniqueness",
        "PureSFormal.Research.ProtectedTrieLabelledObserver.labelledProjection_history_unique",
        "Two accepted labelled records for the same history have the same literal payload and final-row label.",
    ),
    (
        "Exact local-verifier resources",
        "PureSFormal.Research.ProtectedTrieTableauExactResource.runLocalVerifier_resourceCertificate",
        "The counted local verifier has its exact value and explicit tick and peak recursion/temporary-list bounds.",
    ),
    (
        "Exact encoder resources",
        "PureSFormal.Research.ProtectedTrieWholeObserverExactCost.strongEncoder_resource_certificate",
        "The counted finite encoder has its exact value and explicit linear tick and peak recursion/temporary-list bounds.",
    ),
    (
        "Exact whole-observer value",
        "PureSFormal.Research.ProtectedTrieWholeObserverExactCost.runWholeLabelledObserver_labels",
        "The fully counted current-term observer returns exactly the public literal labelled projection.",
    ),
    (
        "Whole-observer semantic ideal",
        "PureSFormal.Research.ProtectedTrieWholeObserverExactCost.runWholeLabelledObserver_historyIdeal",
        "The ancestor closure of the compact counted output equals the public strong projection.",
    ),
    (
        "Whole-observer resource certificate",
        "PureSFormal.Research.ProtectedTrieWholeObserverExactCost.wholeObserver_resource_certificate",
        "The counted whole observer has explicit all-input tick, peak recursion/temporary-list, and materialized-output bounds.",
    ),
    (
        "Confluence obstruction to exclusive branching",
        "PureSFormal.Research.ProtectedTrieConfluenceObstruction.no_exclusive_fork_decoder",
        "A total functional decoder that is forward-sound on the encoded cone and complete for every source descendant cannot preserve two exclusive source states with no common descendant.",
    ),
    (
        "Confluence obstruction to distinct terminal forks",
        "PureSFormal.Research.ProtectedTrieConfluenceObstruction.no_distinct_terminal_fork_decoder",
        "A total functional decoder with encoded-cone forward soundness and source-cone completeness cannot preserve two distinct reachable terminal source states.",
    ),
    (
        "Generic confluence obstruction to exclusive branching",
        "PureSFormal.Research.ProtectedTrieConfluenceObstruction.no_exclusive_fork_decoder_of_confluent",
        "For every confluent target reachability relation, forward soundness and source-cone completeness rule out two source descendants with no common continuation.",
    ),
    (
        "Generic confluence obstruction to distinct terminal forks",
        "PureSFormal.Research.ProtectedTrieConfluenceObstruction.no_distinct_terminal_fork_decoder_of_confluent",
        "For every confluent target reachability relation, the same interface cannot represent two distinct reachable source sinks as exclusive alternatives.",
    ),
    (
        "Empty initial semantic projection",
        "PureSFormal.StrongMultiwayUniversality.strongInitialProjectionEmpty",
        "The semantic history projection contains no history at the finite encoder; projected computation records arise only after pure-S contraction.",
    ),
    (
        "Empty initial observer",
        "PureSFormal.StrongMultiwayUniversality.strongInitialObserverEmpty",
        "The fixed labelled observer emits no accepted computation record at the finite encoder; literal certificates must first be exposed by pure-S contractions.",
    ),
    (
        "Empty initial counted observer",
        "PureSFormal.StrongMultiwayUniversality.strongInitialCountedObserverEmpty",
        "The executed metered whole-term observer returns an empty compact output at the finite encoder before any pure-S contraction.",
    ),
    (
        "Literal provenance of every observer record",
        "PureSFormal.StrongMultiwayUniversality.strongObserverOutputHasLiteralCertificate",
        "Every executed-observer record is anchored at a literal opened address and carries a supplied tableau accepted against the source decoded from the current frozen header.",
    ),
    (
        "Observer output is target-generated",
        "PureSFormal.StrongMultiwayUniversality.strongObserverTargetGenerated",
        "For every source instance, pure-S contractions reach a term on which the initially empty executed observer emits a literal computation record.",
    ),
    (
        "Observer nonconstancy on every encoded cone",
        "PureSFormal.StrongMultiwayUniversality.strongObserverNonconstantOnCone",
        "For each encoded source, the executed observer is empty initially and nonempty at a finite pure-S descendant.",
    ),
    (
        "Reachable counterexample to invalid candidate-predicate acceptance",
        "PureSFormal.StrongMultiwayUniversality.strongInvalidCandidateAcceptanceReachable",
        "If a candidate predicate accepts one verifier-rejected literal history/tableau record, a finite pure-S descendant exposing that false record exists; the underlying canonical schedule is proved separately.",
    ),
    (
        "Exact cone-wide candidate-predicate soundness criterion",
        "PureSFormal.StrongMultiwayUniversality.strongConeWideCandidateObserverSoundIffRefinesVerifier",
        "Because every literal candidate address is reachable, cone-wide no-false-positive soundness of a source-indexed Boolean predicate holds exactly when it extensionally refines the verified tableau language; no checker implementation is prescribed.",
    ),
    (
        "Exact sound-and-complete candidate-predicate language",
        "PureSFormal.StrongMultiwayUniversality.strongConeWideCandidateObserverSoundAndCompleteIffAgreesWithVerifier",
        "Cone-wide soundness plus completeness for verifier-accepted candidates holds exactly when the source-indexed Boolean predicate agrees pointwise with the verified tableau language; this is an extensional language statement, independently of implementation.",
    ),
    (
        "Canonical acceptance of a sound-and-complete current-term observer",
        "PureSFormal.StrongMultiwayUniversality.strongCurrentTermObserverCandidateIff",
        "Any bare-current-term literal-record observer sound on every encoded cone and complete on canonical candidate terms accepts the canonical term exactly when its supplied tableau verifies.",
    ),
    (
        "Verified candidates reduce via canonical queries to current-term observation",
        "PureSFormal.StrongMultiwayUniversality.strongVerifiedCandidateReducesViaCurrentTermObserver",
        "The transparent canonical-term query map is a pointwise reduction from verified tableaux to any cone-wide sound and canonically complete current-term observer.",
    ),
    (
        "Literal source-step query reduction",
        "PureSFormal.StrongMultiwayUniversality.strongInitialSourceStepReducesViaCurrentTermObserver",
        "A supplied ordered transition from the encoded initial row reduces through its literal two-row tableau to every cone-wide sound and canonically complete current-term observer.",
    ),
    (
        "Exact source identity throughout an encoder cone",
        "PureSFormal.StrongMultiwayUniversality.strongEncoderConeCurrentSource",
        "Every unrestricted reduct decodes its frozen normal header to exactly the source instance whose encoder generated the cone.",
    ),
    (
        "Cross-instance encoder-cone separation",
        "PureSFormal.StrongMultiwayUniversality.strongEncoderConesSourceSeparated",
        "No term belongs to the unrestricted reduction cones of two distinct encoded source instances.",
    ),
    (
        "Fixed-depth observer locality obstruction",
        "PureSFormal.StrongMultiwayUniversality.strongNoFixedDepthCompleteProvenanceObserver",
        "No observer determined by a fixed-depth root prefix can combine canonical completeness with literal open-address provenance on every encoded cone.",
    ),
    (
        "Concrete observer requires unbounded structural depth",
        "PureSFormal.StrongMultiwayUniversality.strongLabelledLiteralObserverNotPrefixLocal",
        "The package's literal labelled observer is not determined by any fixed-depth root prefix.",
    ),
    (
        "Structurally fair pathwise semantic liveness",
        "PureSFormal.StrongMultiwayUniversality.strongFairPathEventuallyProjects",
        "On every genuine one-contraction path from the encoder that eventually opens every finite protected address, each valid source history eventually enters the semantic projection.",
    ),
    (
        "Structurally fair pathwise literal liveness",
        "PureSFormal.StrongMultiwayUniversality.strongFairPathEventuallyLabels",
        "On every such structurally fair one-contraction path, each valid source history eventually has its own literal current-term labelled record.",
    ),
    (
        "Canonical structurally fair macro sequence",
        "PureSFormal.StrongMultiwayUniversality.strongFairMacroSequenceStructurallyFair",
        "The complete-prefix canonical macro-boundary sequence eventually opens every finite protected address and therefore satisfies the source-independent structural-fairness condition.",
    ),
    (
        "Canonical fair-sequence literal completeness",
        "PureSFormal.StrongMultiwayUniversality.strongFairMacroSequenceEventuallyLabels",
        "Every valid source history eventually has its own literal label on the canonical structurally fair macro-boundary sequence.",
    ),
    (
        "Finite fairness obligations are cofinally extendible",
        "PureSFormal.StrongMultiwayUniversality.strongFiniteFairnessObligationsExtendible",
        "From every encoder reduct, any finite list of protected-address fairness obligations can be met at one descendant without losing an already opened address.",
    ),
    (
        "Exact terminal-observation bridge",
        "PureSFormal.StrongMultiwayUniversality.strongTerminalObservationIff",
        "A source branch terminates exactly when some unrestricted pure-S reduct carries a verified literal terminal record.",
    ),
    (
        "Bounded canonical terminal-candidate bridge",
        "PureSFormal.StrongMultiwayUniversality.strongBoundedTerminalCandidateIff",
        "A source branch terminates exactly when some explicitly replayable canonical terminal-candidate program fits a finite contraction bound.",
    ),
    (
        "Canonical terminal-candidate schedule bound",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.candidateSchedule_length_le",
        "The supplied history and tableau certificate opens in at most fourteen times each literal length plus twenty-one pure-S contractions.",
    ),
    (
        "Bounded candidate has bounded literal data",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.boundedTerminalCandidate_has_bounded_literals",
        "Every accepted canonical program within a unary contraction bound carries history and tableau data whose combined length is at most that bound.",
    ),
    (
        "State-merged configuration quotient",
        "PureSFormal.StrongMultiwayUniversality.strongStateMergedConfigurationQuotient",
        "Valid occurrence histories map surjectively to reachable configurations while ordered equal-successor edges retain their multiplicity.",
    ),
    (
        "Executable schedule nonvacuity",
        "PureSFormal.StrongMultiwayUniversality.strongExecutableScheduleNonvacuity",
        "Computed root-relative schedules replay every valid edge and every finite branch between their exact public checkpoints.",
    ),
    (
        "Executable source-edge certificate",
        "PureSFormal.StrongMultiwayUniversality.strongExecutableEdgeCertificate",
        "The literal computed schedule for each valid source edge has exact replay, stuttering preparation, and one final projected event.",
    ),
    (
        "Exact executable one-step enumeration",
        "PureSFormal.StrongMultiwayUniversality.strongOneStepEnumerationExact",
        "The finite executable successor list contains exactly the contextual pure-S one-step reducts.",
    ),
    (
        "Exact finite-reduction enumeration",
        "PureSFormal.StrongMultiwayUniversality.strongFiniteReductionEnumerationExact",
        "A term occurs in some executable finite reduction layer exactly when it is a finite contextual pure-S reduct.",
    ),
    (
        "Terminal observation is semidecidable",
        "PureSFormal.StrongMultiwayUniversality.strongTerminalObservationSemidecidable",
        "An explicit bounded search through finite reduction layers semidecides reachable literal terminal observation.",
    ),
    (
        "Deterministic tape halting equivalence",
        "PureSFormal.StrongMultiwayUniversality.strongDeterministicTapeHaltingIff",
        "Halting of the independent conventional deterministic tape source is equivalent to terminal observation after internal compilation.",
    ),
    (
        "Named deterministic halting reduction",
        "PureSFormal.StrongMultiwayUniversality.strongDeterministicTapeHaltingReduction",
        "The displayed structural compiler pointwise reduces deterministic tape halting to the source-indexed terminal-observation predicate.",
    ),
    (
        "Direct deterministic-halting term reduction",
        "PureSFormal.StrongMultiwayUniversality.strongDeterministicTapeHaltingTermReduction",
        "The explicit composite encoder maps each deterministic tape instance to one closed pure-S term, and halting is equivalent to membership in the fixed reachable-terminal term language.",
    ),
    (
        "Deterministic tape acceptance is semidecidable",
        "PureSFormal.StrongMultiwayUniversality.strongDeterministicTapeAcceptanceSemidecidable",
        "The independently defined deterministic tape acceptance language has an explicit bounded semidecision procedure.",
    ),
    (
        "Finite-branch ordered-binary first-return compiler",
        "PureSFormal.StrongMultiwayUniversality.strongFiniteBranchBinaryFirstReturn",
        "Every finite ordered rule-list machine has an internal binary-selector compilation with exact first return, terminality, and occurrence identity.",
    ),
    (
        "Persistent certificate enumeration",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.protectedPersistentCertificateEnumeration",
        "Every explicit finite ordered-binary source instance has all-reduct permanence, exact finite range, cofinal recovery, an embedded computation-history tree, a checked literal-record observer, and an address-complete adjacent-step path.",
    ),
    (
        "Ancestor-ready finite batch",
        "PureSFormal.Research.ProtectedTrieProjection.exists_rankOrderedBatch",
        "Every finite valid history-ideal extension admits a duplicate-free batch in which each proper prefix was already present or is a shorter member of the batch.",
    ),
    (
        "All-edge protected-path persistence",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.allEdgeProtectedPathPersistence",
        "Every pure-S contraction on an encoded cone preserves each projected history and relates the before and after ideals through source-valid persistent events.",
    ),
    (
        "Protected exact finite range",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.protectedExactFiniteRange",
        "Every finite prefix-closed ideal of valid ordered histories is exactly the projection of a reachable pure-S checkpoint.",
    ),
    (
        "Protected cofinal extension",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.protectedCofinalExtension",
        "Every reachable reduct and finite valid ideal have a common descendant that retains the reduct's projection and contains the requested ideal.",
    ),
    (
        "Address-complete adjacent-step path",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.addressCompleteAdjacentStepPath",
        "One infinite sequence of genuine adjacent pure-S contractions has strict macro checkpoints and eventually exposes a literal labelled record for every valid history.",
    ),
    (
        "Protected directed subdivision",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.protectedDirectedSubdivision",
        "Exact history checkpoints and internally disjoint target paths form a directed subdivision of the ordered valid-history tree.",
    ),
    (
        "Terminal-certificate equivalence",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.terminalCertificateEquivalence",
        "Source-branch termination is equivalent to reachability of a literal record whose source-verified tableau has a terminal final row.",
    ),
)

# Root-reset additions use explicit public names to preserve the persistent API.
ROOT_RESET_SIGNATURES: tuple[tuple[str, str, str, str], ...] = (
    (
        "Finite root-reset selection at every contraction",
        "PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement.selectsEveryContractionRun",
        "The actual fixed finite controller selects the next scheduler contraction for every finite cyclic-tag program, input word, and contraction index.",
        "rootResetSelectsEveryContractionRun",
    ),
    (
        "Finite and structural selector agreement",
        "PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement.agreesWithStructuralSelector",
        "The finite controller and structural selector return the same next term at every generated contraction sample.",
        "rootResetAgreesWithStructuralSelector",
    ),
    (
        "Term-only finite selector",
        "PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement.selector",
        "For each fixed cyclic-tag program, the same finite selector accepts only the current bare term.",
        "rootResetSelector",
    ),
    (
        "Finite selector agrees on every path sample",
        "PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement.agreesOnEverySample",
        "Every adjacent term on every certified input path is selected by the same finite root-restarted controller.",
        "rootResetAgreesOnEverySample",
    ),
    (
        "Uniform finite root-reset universality",
        "PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement.finiteCTSUniversality",
        "Every finite cyclic-tag program has a term-only realization with exact checkpoint decoding and one fixed finite root-restarted selector.",
        "rootResetFiniteCTSUniversality",
    ),
    (
        "Transferred path identity",
        "PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement.transferred_path_eq",
        "The root-reset realization retains the exact certified contraction path.",
        "rootResetTransferredPathEq",
    ),
    (
        "Bare-term iteration equals the certified path",
        "PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement.termOnlyPath_eq_persistentPath",
        "Repeated application to the current term equals the certified path at every index, with no retained scheduler state.",
        "rootResetTermOnlyPathEqPersistentPath",
    ),
    (
        "Term-valued contract projection",
        "PureSFormal.Research.RootResetContractProjection.projectedStep?",
        "The contract answer is projected to no successor for normality or the exact returned contraction target.",
        "rootResetProjectedStep?",
    ),
    (
        "Successful invocation operational agreement",
        "PureSFormal.Research.RootResetContractProjection.some_result",
        "A returned target is the actual invocation's erased final cursor, with a redex halt tag and exactly one successful contraction.",
        "rootResetSomeResult",
    ),
    (
        "Normal invocation operational agreement",
        "PureSFormal.Research.RootResetContractProjection.none_result",
        "A normal answer certifies address-wise normality, unchanged erased term, a normal halt tag, and zero successful contractions.",
        "rootResetNoneResult",
    ),
    (
        "Contract projection equals actual runtime output",
        "PureSFormal.Research.RootResetContractProjection.projection_agrees",
        "The term-valued projection equals the result obtained from the actual invocation halt tag and final erased cursor.",
        "rootResetProjectionAgrees",
    ),
    (
        "Returned target exactly characterizes runtime success",
        "PureSFormal.Research.RootResetContractProjection.some_iff",
        "Returning a target is equivalent to halting as a redex with that exact erased final term.",
        "rootResetSomeIff",
    ),
    (
        "Normal answer exactly characterizes runtime normal halt",
        "PureSFormal.Research.RootResetContractProjection.none_iff",
        "No successor is returned exactly when the actual invocation carries the normal halt tag.",
        "rootResetNoneIff",
    ),
    (
        "Normal answer exactly characterizes normality",
        "PureSFormal.Research.RootResetContractProjection.none_iff_normal",
        "The projected selector rejects a successor exactly for an address-normal pure-S term.",
        "rootResetNoneIffNormal",
    ),
    (
        "Fixed root, finite cover, and invocation bounds",
        "PureSFormal.Research.RootResetContractProjection.invocation_bound",
        "Each invocation has the same root start and finite runtime cover, with successful traversals bounded by moves, microticks, and the contract's linear tree-size bound.",
        "rootResetInvocationBound",
    ),
    (
        "Finite root-reset source trajectory",
        "PureSFormal.Computation.DeterministicTapeRootResetOutput.termAt",
        "The source trajectory iterates the actual finite selector from the certified padded encoder.",
        "rootResetTermAt",
    ),
    (
        "Source trajectory equals the certified output path",
        "PureSFormal.Computation.DeterministicTapeRootResetOutput.termAt_eq_persistent",
        "Every term in root-reset iteration is the corresponding term of the certified literal-output trajectory.",
        "rootResetTermAtEqPersistent",
    ),
    (
        "Root-reset source initialization",
        "PureSFormal.Computation.DeterministicTapeRootResetOutput.termAt_zero",
        "The first source term is exactly the certified padded encoder output.",
        "rootResetTermAtZero",
    ),
    (
        "Root-reset source next-term selection",
        "PureSFormal.Computation.DeterministicTapeRootResetOutput.selected_next",
        "At every source sample, the fixed selector returns the next term of the source trajectory.",
        "rootResetSelectedNext",
    ),
    (
        "Root-reset source edges are pure S",
        "PureSFormal.Computation.DeterministicTapeRootResetOutput.termAt_step",
        "Every adjacent source trajectory term is related by one contextual pure-S contraction.",
        "rootResetTermAtStep",
    ),
    (
        "Root-reset literal-row readback",
        "PureSFormal.Computation.DeterministicTapeRootResetOutput.exists_literalRow_iff",
        "A literal row is observed somewhere on the root-reset trajectory exactly when the source computation reaches it.",
        "rootResetExistsLiteralRowIff",
    ),
    (
        "Root-reset terminal-row readback",
        "PureSFormal.Computation.DeterministicTapeRootResetOutput.exists_terminalRow_iff",
        "A terminal row is observed exactly when it is reachable and has no source successor.",
        "rootResetExistsTerminalRowIff",
    ),
    (
        "Root-reset returned scanned-bit output",
        "PureSFormal.Computation.DeterministicTapeRootResetOutput.exists_scannedOutput_iff",
        "The fixed observer returns a bit on the root-reset trajectory exactly when the source computation returns that bit.",
        "rootResetExistsScannedOutputIff",
    ),
    (
        "Root-reset rejection on nonhalting sources",
        "PureSFormal.Computation.DeterministicTapeRootResetOutput.nonhalting_rejects_terminal",
        "Every sample of a nonhalting source trajectory is rejected by the terminal-row observer.",
        "rootResetOutputNonhaltingRejectsTerminal",
    ),
    (
        "Root-reset Boolean negation example",
        "PureSFormal.Computation.DeterministicTapeRootResetOutput.bitToggle_output_iff",
        "The same fixed endpoint computes Boolean negation for both inputs and excludes incorrect outputs.",
        "rootResetBitToggleOutputIff",
    ),
    (
        "Measured root-reset output agreement",
        "PureSFormal.Computation.DeterministicTapeRootResetOutput.source_output_iff",
        "The measured output implementation returns exactly the source's returned bit on the root-reset trajectory.",
        "rootResetSourceOutputIff",
    ),
    (
        "Complete root-reset headline contract",
        "PureSFormal.RootResetHeadline.HeadlineUniversality",
        "The complete Theorem 1R contract includes generic CTS realization, the fixed operational and resource guarantees, regular-language halting and ordered finite source observations on the same source trajectory.",
        "rootResetHeadlineContract",
    ),
    (
        "Complete root-reset headline theorem",
        "PureSFormal.RootResetHeadline.sCombinatorIsRootResetUniversal",
        "A closed proof of the complete headline contract, with no supplied compiler, selector or observation premise.",
        "rootResetHeadlineUniversality",
    ),
    (
        "Fixed root-reset computation contract",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality",
        "One proposition gathers the fixed finite root-restarted controller, exact all-input computation, measured encoder, literal outputs, and interface resource bounds.",
        "RootResetComputationUniversality",
    ),
    (
        "Fixed root-reset computation universality theorem",
        "PureSFormal.RootResetChallenge.sCombinatorIsRootResetComputationUniversal",
        "The displayed fixed controller and measured interfaces satisfy every field of the root-restarted computation contract without a supplied agreement premise.",
        "sCombinatorIsRootResetComputationUniversal",
    ),
    (
        "Root-reset contract: fixed period",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.programPeriod",
        "The displayed program has period exactly 912.",
        "rootResetProgramPeriod",
    ),
    (
        "Root-reset contract: finite controller cover",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.controllerCoverComplete",
        "Every fixed-controller state belongs to its finite cover, without asserting an enumerated deduplicated state count.",
        "rootResetControllerCoverComplete",
    ),
    (
        "Root-reset contract: textbook controller agreement",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.controllerTextbookAgreement",
        "The controller representation round-trip preserves every local transition.",
        "rootResetControllerTextbookAgreement",
    ),
    (
        "Root-reset contract: fresh root initialization",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.freshRootInitialization",
        "Every invocation begins with the same control and a fresh root cursor.",
        "rootResetFreshRootInitialization",
    ),
    (
        "Root-reset contract: no retained invocation data",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.noInterInvocationState",
        "Changing the unit boundary value leaves the actual invocation unchanged.",
        "rootResetNoInterInvocationState",
    ),
    (
        "Root-reset contract: runtime result projection",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.selectorProjection",
        "The displayed selector is exactly the term-valued projection of the displayed contract.",
        "rootResetSelectorProjection",
    ),
    (
        "Root-reset contract: positive invocation coefficient",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.selectorCoefficientPositive",
        "The fixed invocation-bound coefficient is positive.",
        "rootResetSelectorCoefficientPositive",
    ),
    (
        "Root-reset contract: linear invocation microticks",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.selectorMicroticks",
        "Every finite term satisfies the fixed linear microtick bound.",
        "rootResetSelectorMicroticks",
    ),
    (
        "Root-reset contract: all-input termination",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.selectorTerminates",
        "Every actual invocation reaches a terminal halt tag.",
        "rootResetSelectorTerminates",
    ),
    (
        "Root-reset contract: absorbing terminal controls",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.selectorTerminalAbsorbing",
        "Terminal controls remain stationary for every cursor observation.",
        "rootResetSelectorTerminalAbsorbing",
    ),
    (
        "Root-reset contract: exact normality decision",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.selectorNormality",
        "The selector returns no target exactly when the term is address-normal.",
        "rootResetSelectorNormality",
    ),
    (
        "Root-reset contract: one actual contraction on success",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.successfulInvocation",
        "A successful answer has the exact erased target and exactly one successful focused contraction.",
        "rootResetSuccessfulInvocation",
    ),
    (
        "Root-reset contract: unchanged normal invocation",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.normalInvocation",
        "A normal answer preserves the term and performs no successful contraction.",
        "rootResetNormalInvocation",
    ),
    (
        "Root-reset contract: linear edge traversals",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.selectorEdgeMoves",
        "Successful one-edge traversals satisfy the fixed linear tree-size bound.",
        "rootResetSelectorEdgeMoves",
    ),
    (
        "Root-reset contract: all-input cyclic-tag realization",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.realizesEveryInput",
        "The fixed root-restarted controller realizes every finite Boolean input word.",
        "rootResetRealizesEveryInput",
    ),
    (
        "Root-reset contract: iteration path identity",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.iterationIsCertifiedPath",
        "Bare-term iteration is exactly the certified contraction path.",
        "rootResetIterationIsCertifiedPath",
    ),
    (
        "Root-reset contract: every invocation selects the next term",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.everyInvocationSelectsNext",
        "Every iteration sample is selected from its preceding bare term.",
        "rootResetEveryInvocationSelectsNext",
    ),
    (
        "Root-reset contract: one pure-S step per sample",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.everySampledEdgeIsS",
        "Every adjacent iteration sample is one contextual pure-S contraction.",
        "rootResetEverySampledEdgeIsS",
    ),
    (
        "Root-reset contract: strict checkpoint indices",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.checkpointsStrictlyIncrease",
        "The registered checkpoint contraction indices strictly increase.",
        "rootResetCheckpointsStrictlyIncrease",
    ),
    (
        "Root-reset contract: exact checkpoint decoding",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.exactCTSDecoding",
        "Decoding succeeds exactly at the registered horizon and exact cyclic-tag configuration.",
        "rootResetExactCTSDecoding",
    ),
    (
        "Root-reset contract: padded encoder shape",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.paddedEncoderShape",
        "Every source is encoded by the same generator applied to its certified padded word.",
        "rootResetPaddedEncoderShape",
    ),
    (
        "Root-reset contract: source initialization",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.sourceInitialization",
        "The source trajectory starts at the displayed encoder output.",
        "rootResetSourceInitialization",
    ),
    (
        "Root-reset contract: source iteration by root reset",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.sourceFreshRootIteration",
        "The source trajectory is literal iteration of the same bare-term selector.",
        "rootResetSourceFreshRootIteration",
    ),
    (
        "Root-reset contract: complete measured encoder",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.completeEncoder",
        "The explicit construction execution produces the certified term code within its input-code operation budget.",
        "rootResetCompleteEncoder",
    ),
    (
        "Root-reset contract: primitive-recursive encoder",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.encoderPrimitiveRecursive",
        "The exact all-natural source-code to encoded-term-code map is primitive recursive.",
        "rootResetEncoderPrimitiveRecursive",
    ),
    (
        "Root-reset contract: literal source rows",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.literalRows",
        "Literal row observations exactly match reachable source rows.",
        "rootResetLiteralRows",
    ),
    (
        "Root-reset contract: terminal source rows",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.terminalRows",
        "Terminal row observations exactly match reachable halted source rows.",
        "rootResetTerminalRows",
    ),
    (
        "Root-reset contract: returned output",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.returnedOutput",
        "The fixed observer returns exactly the source computation's returned bit.",
        "rootResetReturnedOutput",
    ),
    (
        "Root-reset contract: nonhalting rejection",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.nonhaltingRejectsTerminal",
        "Nonhalting sources have no accepted terminal observation at any sample.",
        "rootResetNonhaltingRejectsTerminal",
    ),
    (
        "Root-reset contract: nonconstant output example",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.nonconstantOutputExample",
        "The same source table and fixed endpoint compute Boolean negation on both inputs.",
        "rootResetNonconstantOutputExample",
    ),
    (
        "Root-reset contract: measured decoder",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.decoderOperations",
        "The measured decoder agrees with the public decoder and satisfies its quadratic tree-size bound.",
        "rootResetDecoderOperations",
    ),
    (
        "Root-reset contract: measured detector",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.detectorOperations",
        "The measured marked-checkpoint detector agrees with the public detector and satisfies its quadratic tree-size bound.",
        "rootResetDetectorOperations",
    ),
    (
        "Root-reset contract: measured seed readback",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.seedReadbackOperations",
        "The measured seed parser agrees with readback and satisfies its quadratic tree-size bound.",
        "rootResetSeedReadbackOperations",
    ),
    (
        "Root-reset contract: measured complete output",
        "PureSFormal.RootResetChallenge.RootResetComputationUniversality.completeOutputOperations",
        "Literal row, terminal row, and scanned-bit implementations agree with their observers and satisfy the explicit quartic budget.",
        "rootResetCompleteOutputOperations",
    ),
)
SIGNATURES += tuple((heading, declaration, gloss) for heading, declaration, gloss, _ in ROOT_RESET_SIGNATURES)
PUBLIC_ALIASES = {declaration: name for _, declaration, _, name in ROOT_RESET_SIGNATURES}
ROOT_RESET_SIGNATURE_HEADINGS = tuple(heading for heading, _, _, _ in ROOT_RESET_SIGNATURES)

CHRONOLOGY_RESOURCE_SIGNATURES = (
    (
        "Ordered literal source sampling for every defined finite prefix",
        "PureSFormal.Computation.SourceChronologyRootReset.exists_sourceClock",
        "Every defined source prefix has one strictly increasing clock starting at zero that exposes all its literal rows on the actual padded root-restarted path through the fixed bare-term reader. No executable global clock or ordering of every accepted observation is asserted.",
        "sourcePrefixChronology",
    ),
    (
        "Cumulative invocation bound on every native-S path",
        "PureSFormal.Research.RootResetCumulativeResources.path_cumulative_bound",
        "Summing the concrete contract's stopping times through a native-S path gives the displayed exponential tree-growth bound using that contract's own coefficient.",
        "rootResetPathCumulativeBound",
    ),
    (
        "Cumulative fresh-root source microticks",
        "PureSFormal.Research.RootResetCumulativeResources.source_cumulative_bound",
        "The actual fixed root-restarted source path satisfies the cumulative bound with its padded encoder and its own controller coefficient.",
        "rootResetSourceCumulativeBound",
    ),
)
SIGNATURES += tuple((heading, declaration, gloss) for heading, declaration, gloss, _ in CHRONOLOGY_RESOURCE_SIGNATURES)
PUBLIC_ALIASES.update({declaration: name for _, declaration, _, name in CHRONOLOGY_RESOURCE_SIGNATURES})

INFINITE_TAPE_SIGNATURES = (
    ("Infinite-tape initial representation", "initial_represents", "The initial finite row represents an independent integer-head binary tape at origin minus one, with input and head starting at coordinate zero.", "infiniteTapeInitialRepresentation"),
    ("Infinite-tape forward step agreement", "step_forward", "Every defined finite-window step has one conventional infinite-tape step and a represented successor.", "infiniteTapeStepForward"),
    ("Infinite-tape backward step agreement", "step_backward", "Every defined conventional step from a represented configuration has one finite-window step and a represented successor.", "infiniteTapeStepBackward"),
    ("Infinite-tape undefined-step agreement", "undefined_step_iff", "A represented finite row and conventional configuration have undefined steps on exactly the same inputs.", "infiniteTapeUndefinedStep"),
    ("Infinite-tape forward exact-fuel run", "run_forward", "A finite-window run is represented by a conventional run with exactly the same number of steps.", "infiniteTapeRunForward"),
    ("Infinite-tape backward exact-fuel run", "run_backward", "A conventional run from a represented configuration is represented by a finite-window run with exactly the same number of steps.", "infiniteTapeRunBackward"),
    ("Infinite-tape halting agreement", "halts_iff", "Initialized finite-window and independently defined conventional binary-tape machines halt on exactly the same instances.", "infiniteTapeHalts"),
    ("Infinite-tape returned scanned-bit agreement", "returns_iff", "Initialized finite-window and conventional machines have exactly the same terminal scanned Boolean outputs.", "infiniteTapeReturns"),
)
SIGNATURES += tuple((heading, "PureSFormal.Computation.DeterministicTapeInfiniteTape." + declaration, gloss) for heading, declaration, gloss, _ in INFINITE_TAPE_SIGNATURES)
PUBLIC_ALIASES.update({"PureSFormal.Computation.DeterministicTapeInfiniteTape." + declaration: name for _, declaration, _, name in INFINITE_TAPE_SIGNATURES})

REGULAR_EVENT_SIGNATURES = (
    ("Finite bottom-up tree automaton representation",
     "PureSFormal.Research.FiniteTreeAutomatonPowerset.Deterministic",
     "A deterministic tree automaton has an explicit exhaustive finite state cover, leaf state, binary transition and Boolean final test.",
     "FiniteTreeAutomaton"),
    ("Finite marker observer all-input contract",
     "PureSFormal.Research.RootResetFiniteMarkerObserver.observer_all_input",
     "The actual finite marker observer terminates on every finite tree within its linear bound and returns its exact Boolean observation.",
     "finiteMarkerObserverAllInput"),
    ("Finite marker observer makes no contraction",
     "PureSFormal.Research.RootResetFiniteMarkerObserver.observer_readOnly",
     "Every configuration of the marker observer has mutation count zero.",
     "finiteMarkerObserverReadOnly"),
    ("Native S contraction determines its occurrence",
     "PureSFormal.Research.PureSContractionOccurrenceInjectivity.contractAt_address_injective",
     "Two successful native contractions with the same finite source and target trees use the same occurrence address.",
     "nativeContractionOccurrenceUnique"),
    ("Physical fresh-field contraction iff eventual CTS emptiness",
     "PureSFormal.PureS.PhysicalMarkerExclusion.physicalEvent_iff_eventuallyEmpty",
     "A literal fresh halt-field contraction occurs in the actual scheduler exactly when some CTS iterate is empty, without a program-counter registration premise.",
     "physicalMarkerEventIffEmpty"),
    ("Root marker observation iff eventual CTS emptiness",
     "PureSFormal.Research.RootResetMarkerObserverSoundness.root_observed_iff_eventuallyEmpty",
     "The finite observer accepts somewhere on the actual root-restarted trajectory exactly when the CTS empties, including initially empty inputs.",
     "rootMarkerObservationIffEmpty"),
    ("Tree automaton agrees with the finite observer on every tree",
     "PureSFormal.Research.RootResetMarkerTreeAutomaton.automaton_accepts_eq_observer",
     "The explicit bottom-up tree automaton has exactly the same Boolean value as the concrete read-only marker observer on arbitrary finite pure-S terms.",
     "markerAutomatonObserverAgreement"),
    ("Fixed regular halting automaton",
     "PureSFormal.Research.RootResetRegularMarkerLanguage.automaton",
     "One finite deterministic tree automaton is fixed for the period-912 source endpoint before the source instance is supplied.",
     "fixedRegularHaltingAutomaton"),
    ("Fixed regular language detects source halting",
     "PureSFormal.Research.RootResetRegularMarkerLanguage.fixed_language_halting_iff",
     "A source halts exactly when the fixed regular tree language accepts some term of its actual padded, output-preserving root-restarted path.",
     "fixedRegularLanguageHaltingIff"),
)
SIGNATURES += tuple((heading, declaration, gloss) for heading, declaration, gloss, _ in REGULAR_EVENT_SIGNATURES)
PUBLIC_ALIASES.update({declaration: name for _, declaration, _, name in REGULAR_EVENT_SIGNATURES})


# Appendix F uses standard classical logic where its exact axiom report says so.
PUBLIC_IMPORTS += ('PureSFormal.AppendixF.AutonomousObstruction', 'PureSFormal.AppendixF.PathFamilies', 'PureSFormal.AppendixF.RegularAvoidance', 'PureSFormal.AppendixF.CarrierRecognition', 'PureSFormal.AppendixF.CarrierSummaryBound', 'PureSFormal.AppendixF.CallRecognition', 'PureSFormal.AppendixF.HoldAllData', 'PureSFormal.AppendixF.IncomparableBasins', 'PureSFormal.AppendixF.ClassicalSeeds')
APPENDIX_F_SIGNATURES = (('F.1: Autonomous-component obstruction', 'PureSFormal.AppendixF.AutonomousObstruction.autonomous_obstruction', 'A fixed divergent component and a computable payload cannot satisfy the exact every-maximal-path acceptance equivalence for an undecidable source set.', 'appendixFAutonomousObstruction'), ('F.1: Main outer-clock corollary', 'PureSFormal.AppendixF.AutonomousObstruction.clock_encoder_obstruction', 'The obstruction applies to every computable payload behind the literal C0 C0 outer clock.', 'appendixFClockObstruction'), ('F.2.1: Decidable-path obstruction', 'PureSFormal.AppendixF.DecidablePathObstruction.decidable_path_obstruction', 'Closed certificate search converts the promised finite preprocessing and computable continuation analysis into a decision, contradicting source undecidability.', 'appendixFDecidablePathObstruction'), ('F.2.1: Finite unions and normal forms', 'PureSFormal.AppendixF.PathFamilies.finite_union_obstruction', 'The obstruction includes arbitrary finite unions of analyzed continuation families and the normal-form alternative.', 'appendixFFiniteUnionObstruction'), ('F.3.1: Native carrier blocks', 'PureSFormal.AppendixF.Carrier.Configuration.native', 'Every carrier block is a finite trace of literal contextual S contractions with its stated endpoint.', 'appendixFCarrierNative'), ('F.3.1: Infinite native carrier path', 'PureSFormal.AppendixF.Carrier.Configuration.run_step', 'Every adjacent sample of the expanded carrier path is one native S contraction.', 'appendixFCarrierPathStep'), ('F.3.1: Exact carrier observation decision', 'PureSFormal.AppendixF.Carrier.eventuallyAccepts_path_iff', 'The finite executable decision agrees with eventual acceptance on the entire infinite native carrier path.', 'appendixFCarrierObservation'), ('F.3.1: Finite-summary bound', 'PureSFormal.AppendixF.Carrier.Summary.enumeration_bound', 'The explicit summary enumeration has the displayed state-count bound; a duplicate-free cover has length equal to the number of automaton states.', 'appendixFCarrierSummaryBound'), ('F.3: Unique carrier recognition', 'PureSFormal.AppendixF.Carrier.parse_iff', 'The literal carrier parser succeeds exactly on the uniquely represented carrier syntax.', 'appendixFCarrierRecognition'), ('F.3.2: Regular avoidance', 'PureSFormal.AppendixF.Carrier.regular_avoidance', 'An explicit finite tree automaton gives disjointness from the target language, a native continuation, and coverage of globally avoiding carrier occurrences.', 'appendixFRegularAvoidance'), ('F.3.3: AAA boundary', 'PureSFormal.AppendixF.AAABoundary.aaa_boundary', 'Every reduct of the classical AAA seed has a redex and contains no carrier occurrence.', 'appendixFAAABoundary'), ('F.4.1: Native recursive feedback', 'PureSFormal.AppendixF.RecursiveCall.Configuration.native', 'Every internal-data call has the specified native feedback macro in an arbitrary context.', 'appendixFRecursiveNative'), ('F.4.1: Unique-redex hold-only path', 'PureSFormal.AppendixF.RecursiveCall.hold_all_data', 'Every hold-only call, including leaf data and normal extra arguments, has an infinite path with exactly one redex and an all-reduct invariant.', 'appendixFHoldOnlyUnique'), ('F.4.2: Exact context and data update', 'PureSFormal.AppendixF.RecursiveCall.observation_next', 'The finite summaries compute the exact next label, data summary and whole-term context.', 'appendixFRecursiveSummaryNext'), ('F.4.2: Exact intermediate observations', 'PureSFormal.AppendixF.RecursiveCall.observation_accepts', 'The summary acceptance test includes exactly all native terms in a recursive feedback macro.', 'appendixFRecursiveSummaryObservations'), ('F.4.3: Recursive-call observation decision', 'PureSFormal.AppendixF.RecursiveCall.eventuallyAccepts_path_iff', 'The terminating initial phase and finite two-macro orbit decide acceptance on the complete infinite native path.', 'appendixFRecursiveObservation'), ('F.4.4: Incomparable basins', 'PureSFormal.AppendixF.IncomparableBasins.incomparable', 'Explicit witnesses establish both strict differences between the two call-or-normal-form basins.', 'appendixFIncomparableBasins'), ('F.4: Classical seven-contraction example', 'PureSFormal.AppendixF.ClassicalSeeds.pp_seven_steps', 'The displayed PP example reaches the stated recursive call and retained arguments in exactly seven native contractions.', 'appendixFClassicalSevenSteps'), ('F.1: Unique-redex clock', 'PureSFormal.AppendixF.ClockBoundary.clock_one_redex_all', 'Every reduct of the outer C0 C0 clock has exactly one redex and one possible next term.', 'appendixFClockUnique'), ('F.4: Recognition of arbitrary supplied tables', 'PureSFormal.AppendixF.RecursiveCall.parseCall_covers_table', 'The literal call parser covers every admissible program table and internal datum.', 'appendixFCallParserCoverage'), ('F.4: Finite-table extraction', 'PureSFormal.AppendixF.RecursiveCall.recognized_call_has_finite_table', 'A recognized literal call supplies a finite typed program table and internal datum for the observation theorem.', 'appendixFFiniteTableExtraction'), ('F.2: Standard computability of certificate search', 'PureSFormal.AppendixF.ComputabilityCertificates.computable_iff_certificate', 'Primitive-checkable finite computation certificates are equivalent to the existing closed minimization computability model.', 'appendixFComputationCertificates'))
SIGNATURES += tuple((heading, declaration, gloss) for heading, declaration, gloss, _ in APPENDIX_F_SIGNATURES)
PUBLIC_ALIASES.update({declaration: name for _, declaration, _, name in APPENDIX_F_SIGNATURES})


def public_name(declaration: str) -> str:
    return PUBLIC_ALIASES.get(declaration, declaration.rsplit(".", 1)[1])


def validate_root_reset_fields() -> None:
    source = (ROOT / "PureSFormal" / "RootResetChallenge.lean").read_text(encoding="utf-8")
    match = re.search(
        r"structure RootResetComputationUniversality : Prop where\n(.*?)(?=\ntheorem )",
        source, flags=re.DOTALL,
    )
    if match is None:
        raise SystemExit("missing root-reset aggregate structure")
    prefix = "PureSFormal.RootResetChallenge.RootResetComputationUniversality."
    actual = {prefix + name for name in re.findall(r"^  ([A-Za-z_][A-Za-z0-9_']*)\s*:", match.group(1), flags=re.MULTILINE)}
    exported = {declaration for _, declaration, _ in SIGNATURES if declaration.startswith(prefix)}
    if actual != exported:
        raise SystemExit(
            f"root-reset aggregate public fields differ: missing={sorted(actual - exported)}, "
            f"extra={sorted(exported - actual)}"
        )

def lean_source() -> str:
    lines = [*(f"import {module}" for module in PUBLIC_IMPORTS), "",
        "set_option format.width 72", ""]
    for index, (_, declaration, _) in enumerate(SIGNATURES):
        namespace, short_name = declaration.rsplit(".", 1)
        lines.extend(
            (
                f'#eval IO.println "__PUBLIC_SIGNATURE_BEGIN_{index}__"',
                f"namespace {namespace}",
                f"#check {short_name}",
                f"end {namespace}",
                f'#eval IO.println "__PUBLIC_SIGNATURE_END_{index}__"',
                f'#eval IO.println "__PUBLIC_AXIOMS_BEGIN_{index}__"',
                f"#print axioms {declaration}",
                f'#eval IO.println "__PUBLIC_AXIOMS_END_{index}__"',
                "",
            )
        )
    return "\n".join(lines)


def checked_surface(lake: list[str]) -> tuple[list[str], list[tuple[str, ...]]]:
    lake = [absolute_lake(lake[0]), *lake[1:]]
    with temporary_directory(prefix="pure-s-public-signatures-") as tmp:
        source = pathlib.Path(tmp) / "PublicTheoremSignatures.lean"
        source.write_text(lean_source(), encoding="utf-8", newline="\n")
        result = subprocess.run(
            [*lake, "env", "lean", str(source)],
            cwd=ROOT,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
    if result.returncode != 0:
        raise SystemExit("public theorem #check failed:\n" + result.stdout.rstrip())

    signatures: list[str] = []
    axiom_sets: list[tuple[str, ...]] = []
    for index, (_, declaration, _) in enumerate(SIGNATURES):
        begin = f"__PUBLIC_SIGNATURE_BEGIN_{index}__"
        end = f"__PUBLIC_SIGNATURE_END_{index}__"
        if result.stdout.count(begin) != 1 or result.stdout.count(end) != 1:
            raise SystemExit(f"missing or duplicate #check delimiters for {declaration}")
        chunk = result.stdout.split(begin, 1)[1].split(end, 1)[0].strip()
        if declaration not in chunk:
            raise SystemExit(
                f"#check output for {declaration} did not name its declaration:\n{chunk}"
            )
        signatures.append(chunk)

        axiom_begin = f"__PUBLIC_AXIOMS_BEGIN_{index}__"
        axiom_end = f"__PUBLIC_AXIOMS_END_{index}__"
        if result.stdout.count(axiom_begin) != 1 or result.stdout.count(axiom_end) != 1:
            raise SystemExit(f"missing or duplicate axiom delimiters for {declaration}")
        axiom_chunk = result.stdout.split(axiom_begin, 1)[1].split(axiom_end, 1)[0].strip()
        if "does not depend on any axioms" in axiom_chunk:
            axioms: tuple[str, ...] = ()
        else:
            match = re.search(r"depends on axioms:\s*\[([^]]*)\]", axiom_chunk)
            if match is None:
                raise SystemExit(
                    f"could not parse #print axioms output for {declaration}:\n{axiom_chunk}"
                )
            axioms = tuple(
                sorted(
                    item.strip()
                    for item in match.group(1).split(",")
                    if item.strip()
                )
            )
        allowed = {"propext", "Quot.sound"}
        if declaration.startswith("PureSFormal.AppendixF."):
            allowed.add("Classical.choice")
        unexpected = set(axioms) - allowed
        if unexpected:
            raise SystemExit(
                f"public declaration {declaration} has unexpected axioms: "
                + ", ".join(sorted(unexpected))
            )
        axiom_sets.append(axioms)
    return signatures, axiom_sets


def render(entries: list[tuple[tuple[str, str, str], str]]) -> str:
    lines = [
        "<!-- Generated by formalization/scripts/check_public_signatures.py; do not edit. -->",
        "",
        "## Configured kernel-elaborated claim statements",
        "",
        "Each code block below is the pinned Lean 4.33.1 `#check` output. The",
        "following sentence is a non-formal one-line gloss. This is the",
        "selected public theorem ledger; the complete declaration audit is separate.",
        "",
    ]
    for (title, declaration, gloss), signature in entries:
        lines.extend((f"### {title}", "", "```lean", signature, "```", "", gloss, ""))
        if public_name(declaration) != declaration.rsplit(".", 1)[1]:
            lines.extend((f"Public alias: `PureSFormal.Public.{public_name(declaration)}`.", ""))
    return "\n".join(lines).rstrip() + "\n"


def render_public_module() -> str:
    """Render one stable namespace containing exactly the public ledger."""
    grouped: dict[str, list[str]] = {}
    aliases: list[tuple[str, str]] = []
    short_names: set[str] = set()
    for _, declaration, _ in SIGNATURES:
        namespace, short_name = declaration.rsplit(".", 1)
        name = public_name(declaration)
        if name in short_names:
            raise SystemExit(
                f"duplicate name cannot be re-exported through Public: {name}"
            )
        short_names.add(name)
        if name == short_name:
            grouped.setdefault(namespace, []).append(short_name)
        else:
            aliases.append((name, declaration))

    lines = [
        "/- Generated by scripts/check_public_signatures.py; do not edit. -/",
        *(f"import {module}" for module in PUBLIC_IMPORTS),
        "",
        "/-! # Stable public theorem interface",
        "",
        "This namespace re-exports exactly the declarations in the generated",
        "public theorem ledger.  Importers can depend on one versioned module",
        "without traversing the internal proof-module layout.",
        "-/",
        "",
        "namespace PureSFormal.Public",
        "",
        "/-- Version of the checked public re-export surface. -/",
        f"def apiVersion : Nat := {API_VERSION}",
        "",
    ]
    for namespace, names in grouped.items():
        lines.append(f"export {namespace} ({' '.join(names)})")
    lines.append("")
    lines.extend(f"abbrev {name} := @{declaration}" for name, declaration in aliases)
    lines.extend(("", "end PureSFormal.Public", ""))
    return "\n".join(lines)


def render_public_audit() -> str:
    """Audit every generated public export exactly once through one import."""
    names = [public_name(declaration) for _, declaration, _ in SIGNATURES]
    if len(names) != len(set(names)):
        raise SystemExit("duplicate short name in public audit")
    lines = [
        "import PureSFormal.Public",
        "",
        "/-! # Complete stable public-interface axiom audit",
        "",
        "This generated root prints the axiom set of the API version and every",
        "public export exactly once.",
        "-/",
        "",
        "#print axioms PureSFormal.Public.apiVersion",
    ]
    lines.extend(f"#print axioms PureSFormal.Public.{name}" for name in names)
    lines.append("")
    return "\n".join(lines)


def render_public_api(
    entries: list[tuple[tuple[str, str, str], str]],
    axiom_sets: list[tuple[str, ...]],
) -> str:
    """Machine-readable normalized public declarations and exact axiom sets."""
    exports = []
    for ((heading, declaration, gloss), signature), axioms in zip(
        entries, axiom_sets, strict=True
    ):
        entry = {
                "axioms": list(axioms),
                "declaration": declaration,
                "gloss": gloss,
                "heading": heading,
                "normalized_type": " ".join(signature.split()),
            }
        if public_name(declaration) != declaration.rsplit(".", 1)[1]:
            entry["public_declaration"] = f"PureSFormal.Public.{public_name(declaration)}"
        exports.append(entry)
    payload = {
        "api_version": API_VERSION,
        "export_count": len(exports),
        "exports": exports,
    }
    return json.dumps(payload, indent=2, sort_keys=True) + "\n"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--lake", default="lake")
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--write", action="store_true")
    modes.add_argument("--check", action="store_true")
    args = parser.parse_args()

    validate_root_reset_fields()
    public_module = render_public_module()
    public_audit = render_public_audit()
    signatures, axiom_sets = checked_surface(lake_command(args.lake))
    entries = list(zip(SIGNATURES, signatures, strict=True))
    generated = render(entries)
    public_api = render_public_api(entries, axiom_sets)
    if args.write:
        workspace = LocalWorkspace(ROOT.parent)
        for path in (ARTIFACT, API_ARTIFACT, PUBLIC_MODULE, PUBLIC_AUDIT):
            workspace.output(path)
        ARTIFACT.parent.mkdir(parents=True, exist_ok=True)
        ARTIFACT.write_text(generated, encoding="utf-8", newline="\n")
        API_ARTIFACT.write_text(public_api, encoding="utf-8", newline="\n")
        PUBLIC_MODULE.write_text(public_module, encoding="utf-8", newline="\n")
        PUBLIC_AUDIT.write_text(public_audit, encoding="utf-8", newline="\n")
        print(
            f"WROTE {ARTIFACT.relative_to(ROOT)} signatures={len(SIGNATURES)} "
            f"and {PUBLIC_MODULE.relative_to(ROOT)} exports={len(SIGNATURES)}; "
            f"wrote {API_ARTIFACT.relative_to(ROOT)} and complete public audit"
        )
        return

    if args.check:
        for artifact, expected in (
            (ARTIFACT, generated),
            (API_ARTIFACT, public_api),
            (PUBLIC_MODULE, public_module),
            (PUBLIC_AUDIT, public_audit),
        ):
            if not artifact.is_file():
                raise SystemExit(f"missing generated signature artifact: {artifact}")
            committed = artifact.read_text(encoding="utf-8")
            if committed != expected:
                difference = "".join(
                    difflib.unified_diff(
                        committed.splitlines(keepends=True),
                        expected.splitlines(keepends=True),
                        fromfile=str(artifact.relative_to(ROOT)),
                        tofile="fresh Lean #check output",
                    )
                )
                raise SystemExit("public theorem signatures drifted:\n" + difference)
        print(f"PASS public theorem signatures full={len(SIGNATURES)}")
        return

    print(generated, end="")


if __name__ == "__main__":
    main()
