#!/usr/bin/env python3
"""Audit every inventoried module's kernel declarations and public axiom queries."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import pathlib
import re
import subprocess
import sys
import tempfile
import tomllib
from typing import NamedTuple


ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.dont_write_bytecode = True
sys.path.insert(0, str(ROOT.parent / "src"))
from local_workspace import LocalWorkspace, lake_command
from lean_axiom_report import axiom_report_lines
PUBLIC_MODULE = ROOT / "PureSFormal" / "Public.lean"
DECLARATION_PREFIX = "PURE_S_ALL_AXIOMS "
SUMMARY_PREFIX = "PURE_S_ALL_AXIOMS_SUMMARY "
MODULE_RE = re.compile(r"[A-Za-z_][A-Za-z0-9_']*(?:\.[A-Za-z_][A-Za-z0-9_']*)*")
IMPORT_COLLISION_RE = re.compile(
    r"import .+ failed, environment already contains '[^']+' from "
)
DeclarationIdentity = tuple[str, str]


class KernelDeclarationAudit(NamedTuple):
    safe: dict[DeclarationIdentity, frozenset[str]]
    runtime: dict[DeclarationIdentity, frozenset[str]]
    groups: tuple[tuple[str, ...], ...]
    partial: frozenset[DeclarationIdentity]
    executable: frozenset[DeclarationIdentity]
    violations: tuple[str, ...]


NONE_RE = re.compile(r"^'([^']+)' does not depend on any axioms$")
SOME_RE = re.compile(r"^'([^']+)' depends on axioms: \[([^]]*)\]$")
EXPORT_RE = re.compile(
    r"^\s*export\s+(?P<namespace>[A-Za-z_][A-Za-z0-9_'.?]*)\s*"
    r"\((?P<names>[^)]*)\)",
    flags=re.MULTILINE,
)
ALLOWED = frozenset({"propext", "Quot.sound"})
EXECUTABLE_ALLOWED = frozenset({"propext", "Quot.sound"})
# Lean 4.33.1's UTF-8 decoding and extraction proofs use Classical.choice.
# These exact command-line declarations reach those standard-library routines;
# the central mathematical development and other executable declarations reject it.
DEMO_STRING_CHOICE_DECLARATIONS = frozenset({
    "PureSDemo.controllerLoop._sunfold", "main", "PureSDemo.parseStateRows._f",
    "PureSDemo.firstMicrotraceLoop._sunfold", "PureSDemo.parseOptions._f",
    "PureSDemo.parseStateRows._sunfold", "PureSDemo.traceOneLine",
    "PureSDemo.firstMicrotraceLoop._f", "PureSDemo.loadWord",
    "PureSDemo.runFirstMicrotrace", "PureSDemo.rootResetCheckLoop._f",
    "PureSDemo.traceFocusedSubtree", "PureSDemo.rootResetCheckLoop",
    "PureSDemo.parseOptions._sunfold", "PureSDemo.parseTapeInstance",
    "PureSDemo.firstMicrotraceLoop", "PureSDemo.parseBits", "PureSDemo.main",
    "PureSDemo.splitFields", "PureSDemo.termPrefix",
    "PureSDemo.rootResetCheckLoop._sunfold", "PureSDemo.parseStateRows",
    "PureSDemo.termPrefixWithNodes", "PureSDemo.parseRule",
    "PureSDemo.controllerLoop._f", "PureSDemo.parseOptions",
    "PureSDemo.runRootResetCheck", "PureSDemo.runProgram", "PureSDemo.controllerLoop",
})


def allowed_declaration_axioms(module: str, declaration: str, executable: bool) -> frozenset[str]:
    allowed = EXECUTABLE_ALLOWED if executable else ALLOWED
    # Only Appendix F and its explicitly prefixed public aliases admit standard choice.
    if module.startswith("PureSFormal.AppendixF.") or (module == "PureSFormal.Public" and declaration.startswith("PureSFormal.Public.appendixF")):
        allowed = allowed | {"Classical.choice"}
    if executable and module == "Demo" and declaration in DEMO_STRING_CHOICE_DECLARATIONS:
        return allowed | {"Classical.choice"}
    return allowed


STANDALONE_EXECUTABLE_ROLES = {
    "scripts.lean_python_differential": "differential-test-emitter",
}
REQUIRED_DECLARATIONS = frozenset(
    {
        "PureSFormal.WeakPathUniversality.finiteCTSUniformCertificate",
        "PureSFormal.WeakPathUniversality.finiteCTSWeakPathUniversality",
        "PureSFormal.WeakPathUniversality.fixedCookWeakPathUniversality",
        "PureSFormal.WeakPathUniversality.finiteCTSNextContractionMicroticks_le_linear",
        "PureSFormal.WeakPathUniversality.finiteCTSCheckpointTime_le_explicit_cubic",
        "PureSFormal.WeakPathUniversality.finiteCTSCheckpointTerm_size_le_explicit",
        "PureSFormal.PureS.FiniteController.machineEquivTextbook",
        "PureSFormal.PureS.generator_size_le_eighteen",
        "PureSFormal.Challenge.ChallengePathUniversality",
        "PureSFormal.Challenge.sCombinatorIsChallengePathUniversal",
        "PureSFormal.Computation.DeterministicTapeThreeCounterCompiler.Execution.halts_iff_threeCounterHalts",
        "PureSFormal.Computation.ThreeCounterTag.Numeric.universalHalts_iff_compileJob",
        "PureSFormal.Computation.DeterministicTapeCounterCompiler.StackCode.decode?_encode",
        "PureSFormal.Computation.DeterministicTapeCounterCompiler.StackCode.encode_of_decode?_eq",
        "PureSFormal.Computation.DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_sound",
        "PureSFormal.Computation.DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_boundaryState_configurationOf",
        "PureSFormal.Computation.DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_compileInitial",
        "PureSFormal.Computation.DeterministicTapeTrajectoryDecoder.exists_decodedPrimitiveBoundary_of_runFor?_eq_some",
        "PureSFormal.Computation.LegacyCompilerGrowth.PrimitiveClock.two_pow_le_rightPopClock_replicate_false",
        "PureSFormal.Computation.LegacyCompilerGrowth.TagMaterialization.two_pow_two_pow_le_dataBlock_of_zero_stack",
        "PureSFormal.Computation.LegacyCompilerGrowth.TagMaterialization.two_pow_two_pow_le_compiled_boundary_encodeState",
        "PureSFormal.Computation.DeterministicTapeCook.halts_iff_fixedCookEmpty",
        "PureSFormal.Computation.DeterministicTapePureS.halts_iff_fixedPureSMarkedSnapshotTermEvent",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotTapeEncoder",
        "PureSFormal.WeakPathUniversality.deterministicTapeHalts_iff_fixedPureSMarkedSnapshotTermEvent",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotTapeEncoder_reducesVia",
        "PureSFormal.WeakPathUniversality.deterministicTapeHalts_manyOne_fixedPureSMarkedSnapshotTermEvent",
        "PureSFormal.PureS.CountedCheckpointDecoder.countedDecode_value",
        "PureSFormal.PureS.CountedCheckpointDecoder.countedDecode_ticks_le",
        "PureSFormal.PureS.CountedCheckpointDecoder.publicDecoder_resource_certificate",
        "PureSFormal.PureS.CountedTermEvent.countedObservesMarkedCheckpoint?_value",
        "PureSFormal.PureS.CountedTermEvent.countedObservesMarkedCheckpoint?_ticks_le",
        "PureSFormal.PureS.CountedTermEvent.detector_resource_certificate",
        "PureSFormal.PureS.TermEvent.eventuallyObservesMarkedCheckpointRaw_iff_eventuallyEmpty",
        "PureSFormal.WeakPathPolynomialCost.checkpointTime_le_of_horizon_le_polynomial",
        "PureSFormal.WeakPathPolynomialCost.checkpointTime_le_of_horizon_le_quadratic_log",
        "PureSFormal.WeakPathPolynomialCost.checkpointTime_le_of_horizon_le_cubic",
        "PureSFormal.WeakPathPolynomialCost.checkpointTime_le_of_horizon_le_cubic_log",
        "PureSFormal.WeakPathPolynomialCost.checkpointTime_le_of_horizon_le_quartic",
        "PureSFormal.WeakPathUniversality.fixedRogozhinPassDecoder",
        "PureSFormal.WeakPathUniversality.fixedRogozhinBareTermDecoder",
        "PureSFormal.WeakPathUniversality.fixedRogozhinBareTermDecoder_eq",
        "PureSFormal.WeakPathUniversality.fixedRogozhinBareTermDecoder_of_decode",
        "PureSFormal.WeakPathUniversality.fixedRogozhinBareTermDecoder_registeredPath_arrival",
        "PureSFormal.WeakPathUniversality.exists_fixedRogozhinDecodedCheckpoint_of_running",
        "PureSFormal.WeakPathUniversality.fixedRogozhinPassDecoder_some_iff_fixedRegisteredBoundary",
        "PureSFormal.WeakPathUniversality.fixedRogozhinPassDecoder_none_iff_no_fixedRegisteredBoundary",
        "PureSFormal.WeakPathUniversality.fixedRegisteredBoundary_machineSteps_unique",
        "PureSFormal.WeakPathUniversality.fixedRogozhinBareTermDecoder_run_some_iff_fixedRegisteredBoundary",
        "PureSFormal.WeakPathUniversality.fixedRogozhinBareTermDecoder_run_none_iff_no_fixedRegisteredBoundary",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotJobEncoder",
        "PureSFormal.WeakPathUniversality.universalAccepts_iff_fixedPureSMarkedSnapshotTermEvent",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotJobEncoder_reducesVia",
        "PureSFormal.WeakPathUniversality.counterProgram_accepts_iff_fixedPureSMarkedSnapshotTermEvent",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotFormulaEncoder",
        "PureSFormal.WeakPathUniversality.encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotTermEvent",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotFormulaEncoder_reducesVia",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotTermEvent_counterMachineHardViaNamedEncoder",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotTermEvent_encodedBoundedWitnessHardViaNamedEncoder",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotTermEvent_exponentialCounterBoundedRunComplete",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotTermEvent_directInputCounterComplete",
        "PureSFormal.WeakPathUniversality.FixedPureSMarkedSnapshotNatLanguage",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotJobCodeEncoder",
        "PureSFormal.WeakPathUniversality.universalAccepts_iff_fixedPureSMarkedSnapshotNatLanguage",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotJobCodeEncoder_reducesVia",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotFormulaCodeEncoder",
        "PureSFormal.WeakPathUniversality.encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotNatLanguage",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotFormulaCodeEncoder_reducesVia",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotNatLanguage_exponentialCounterBoundedRunComplete",
        "PureSFormal.WeakPathUniversality.fixedPureSMarkedSnapshotNatLanguage_directInputCounterComplete",
        "PureSFormal.PureS.Term.contractum_size_succ_eq_redex_size_add_argument",
        "PureSFormal.PureS.Step.target_size_lt_twice_source",
        "PureSFormal.PureS.Step.exists_argument_size_balance",
        "PureSFormal.PureS.StepsN.target_size_le_pow",
        "PureSFormal.CostModel.Term.contractum_height_le_redex_height_add_one",
        "PureSFormal.CostModel.Step.target_height_le_source_add_one",
        "PureSFormal.CostModel.StepsN.address_length_le_initial_size_add_steps",
        "PureSFormal.CostModel.Arena.subterm?_readback",
        "PureSFormal.CostModel.Arena.same_node_occurrences_not_strict_prefix",
        "PureSFormal.CostModel.Arena.readback_steps_develop",
        "PureSFormal.CostModel.Arena.contract_readback_eq_develop",
        "PureSFormal.CostModel.Arena.contract_root_steps",
        "PureSFormal.CostModel.Arena.edgeCopy_rootReadback",
        "PureSFormal.CostModel.Arena.edgeCopy_uniqueIncoming_fresh",
        "PureSFormal.CostModel.Arena.privatize",
        "PureSFormal.CostModel.Arena.lift_addressed_contraction",
        "PureSFormal.CostModel.AddressedPath.toStepsN",
        "PureSFormal.CostModel.AddressedPath.addressMoveCount_le_initial_size",
        "PureSFormal.CostModel.Arena.lift_addressed_path",
        "PureSFormal.CostModel.AllocationRun.target_le_initial_add_twice_moves",
        "PureSFormal.CostModel.sharedCostKernelCertificate",
        "PureSFormal.CostModel.FiniteArena.navigate_value",
        "PureSFormal.CostModel.FiniteArena.navigate_ticks_le",
        "PureSFormal.CostModel.FiniteArena.liveCard_le_retainedCard",
        "PureSFormal.CostModel.FiniteArena.interpreterCertificate",
        "PureSFormal.CostModel.DAGLocalObserver.runTerminalCertificate_value",
        "PureSFormal.CostModel.DAGLocalObserver.runTerminalCertificate_ticks_le",
        "PureSFormal.CostModel.DAGLocalObserver.runTerminalCertificate_ticks_le_retainedLive",
        "PureSFormal.CostModel.DAGLocalObserver.terminalCertificate?_readback",
        "PureSFormal.CostModel.DAGLocalObserver.terminalRecordOnTerm?_eq_true_iff_labelledProjection",
        "PureSFormal.StrongMultiwayUniversality.strongCurrentTermObserverCandidateIff",
        "PureSFormal.StrongMultiwayUniversality.strongVerifiedCandidateReducesViaCurrentTermObserver",
        "PureSFormal.StrongMultiwayUniversality.strongVerifiedCandidateManyOneCurrentTermObserver",
        "PureSFormal.WeakPath.Realizes.checkpoint_term_size_le_pow",
        "PureSFormal.PureS.CheckpointTime.checkpointTime_le_explicit_cubic",
        "PureSFormal.Cook.passDecode?_sound",
        "PureSFormal.PureS.Term.decodeCode?_code",
        "PureSFormal.PureS.Term.code_bijective",
        "PureSFormal.PureS.Term.decodeCode?_isSome",
        "PureSFormal.PureS.Term.code_injective",
        "PureSFormal.PureS.SchedulerControl.canonicalControlStates_nodup",
        "PureSFormal.PureS.SchedulerControl.control_mem_canonicalStates",
        "PureSFormal.PureS.SchedulerControl.machine_states_nodup",
        "PureSFormal.PureS.SchedulerControl.machine_states_length",
        "PureSFormal.PureS.SchedulerControl.cook_runtimeCoverEntryCount",
        "PureSFormal.PureS.FiniteController.seekMutationDelay_spec",
        "PureSFormal.PureS.FiniteController.ProductiveSystem.run_sampleTick",
        "PureSFormal.PureS.FiniteController.ProductiveSystem.runMutationCount_sampleTick",
        "PureSFormal.PureS.FiniteController.ProductiveSystem.sampleTick_strictMono",
        "PureSFormal.PureS.FiniteController.ProductiveSystem.run_erase_eq_countedContractionSample",
        "PureSFormal.PureS.FiniteController.eventually_periodic_of_mutation_free",
        "PureSFormal.Research.RootResetDeletionGadget.source_stepsN_stable",
        "PureSFormal.Research.RootResetDeletionGadget.selectedStep?_source",
        "PureSFormal.Research.RootResetDeletionGadget.selectedStep?_fresh",
        "PureSFormal.Research.RootResetDeletionGadget.ProgressSpine.decode?_fresh_eq_stable",
        "PureSFormal.Research.RootResetBoundedDepthObstruction.no_fixed_depth_sound_complete_selector",
        "PureSFormal.Research.RootResetPersistentInitialBridge.firstPersistentEdge_rootResetAgreement",
        "PureSFormal.Research.RootResetSelectorContract.Contract.halts_within",
        "PureSFormal.Research.RootResetSelectorContract.Contract.moves_le",
        "PureSFormal.Research.RootResetSelectorContract.successfulEdgeMoveCount_eq_one_iff",
        "PureSFormal.Research.RootResetSelectorContract.runSuccessfulEdgeMoveCount_le_runMoveCount_le_ticks",
        "PureSFormal.Research.RootResetSelectorContract.Contract.successfulEdgeMoves_le",
        "PureSFormal.Research.RootResetEulerWalker.rootExecution_ticks_le",
        "PureSFormal.Research.RootResetEulerWalker.rootExecution_moves_le",
        "PureSFormal.Research.RootResetEulerWalker.rootExecution_certificate",
        "PureSFormal.Research.RootResetEulerWalker.selectorContract",
        "PureSFormal.Research.RootResetEulerWalker.compiled_control_state_cardinality",
        "PureSFormal.Research.RootResetEulerWalker.identical_current_terms_same_selection",
        "PureSFormal.Research.RootResetEulerWalker.selector_halts_linear",
        "PureSFormal.Research.RootResetEulerWalker.selector_moves_linear",
        "PureSFormal.Research.RootResetEulerWalker.selector_successfulEdgeMoves_linear",
        "PureSFormal.Research.RootResetCarrierBoundaryGrammar.existsUnique_activeDecomposition",
        "PureSFormal.Research.RootResetStageRegistry.classifyAt_unique",
        "PureSFormal.Research.RootResetStageRegistry.classified_roles_disjoint",
        "PureSFormal.Research.RootResetStageRegistry.classifyAt_sound",
        "PureSFormal.Research.RootResetReachableStageGrammar.existsUnique_markedPrefixDecomposition",
        "PureSFormal.Research.RootResetReachableStageGrammar.peelMarked_history_marked",
        "PureSFormal.Research.RootResetReachableStageGrammar.peelMarked_active_local_is_fresh",
        "PureSFormal.Research.RootResetReachableStageGrammar.parseRouteDetailed_response_subterm",
        "PureSFormal.Research.RootResetReachableStageGrammar.parseFrameR0?_child_subterm",
        "PureSFormal.Research.RootResetReachableStageGrammar.parseFrameR1?_child_subterm",
        "PureSFormal.Research.RootResetReachableStageGrammar.parseFrameR2?_child_subterm",
        "PureSFormal.Research.RootResetReachableStageGrammar.classifyEndpoint_frameR0_priority",
        "PureSFormal.Research.RootResetReachableStageGrammar.classifyEndpoint_frameR1",
        "PureSFormal.Research.RootResetReachableStageGrammar.classifyEndpoint_frameR2",
        "PureSFormal.Research.RootResetReachableStageGrammar.raw_pending_frameR0_overlap",
        "PureSFormal.Research.RootResetDispatcherNodeStages.parseExposed?_sound",
        "PureSFormal.Research.RootResetDispatcherNodeStages.parseForked?_sound",
        "PureSFormal.Research.RootResetDispatcherNodeStages.exposedTerm_ne_forkedTerm",
        "PureSFormal.Research.RootResetDispatcherNodeStages.classifyNode?_sound",
        "PureSFormal.Research.RootResetDispatcherNodeStages.contractAt?_exposedRedexAddress",
        "PureSFormal.Research.RootResetDispatcherNodeStages.forkedChildAddress_contracts",
        "PureSFormal.Research.RootResetDispatcherNodeStages.forked_row_direction_erasure",
        "PureSFormal.Research.RootResetAppenderStages.parseFirstWord?_sound",
        "PureSFormal.Research.RootResetAppenderStages.parseFirstWord?_complete",
        "PureSFormal.Research.RootResetAppenderStages.parseSecondWord?_sound",
        "PureSFormal.Research.RootResetAppenderStages.parseSecondWord?_complete_final",
        "PureSFormal.Research.RootResetAppenderStages.parseSecondWord?_complete_nonfinal",
        "PureSFormal.Research.RootResetAppenderStages.FirstView.position_lt_emitted_length",
        "PureSFormal.Research.RootResetAppenderStages.SecondView.position_lt_emitted_length",
        "PureSFormal.Research.RootResetAppenderStages.parseSecondWord?_none_of_parseFirstWord?_some",
        "PureSFormal.Research.RootResetAppenderStages.parseFirstWord?_none_of_parseSecondWord?_some",
        "PureSFormal.Research.RootResetAppenderStages.FirstView.contracts",
        "PureSFormal.Research.RootResetAppenderStages.SecondView.nonfinal_contracts",
        "PureSFormal.Research.RootResetAppenderStages.contractAt?_pushSecond_final_none",
        "PureSFormal.Research.RootResetAccumulatorClassifier.analyze?_eq_some_iff",
        "PureSFormal.Research.RootResetAccumulatorClassifier.Tracks.openAddress_contracts",
        "PureSFormal.Research.RootResetAccumulatorClassifier.classify?_close_sound",
        "PureSFormal.Research.RootResetWholeStageClassifier.classify_unique",
        "PureSFormal.Research.RootResetWholeStageClassifier.classify_source_eq",
        "PureSFormal.Research.RootResetWholeStageClassifier.classify_history_marked",
        "PureSFormal.Research.RootResetWholeStageClassifier.classifyActive_frameR0",
        "PureSFormal.Research.RootResetWholeStageClassifier.classifyActive_frameR1",
        "PureSFormal.Research.RootResetWholeStageClassifier.classifyActive_frameR2",
        "PureSFormal.Research.RootResetWholeStageClassifier.classifyActive_activatedRoute",
        "PureSFormal.Research.RootResetWholeStageClassifier.classifyActive_activatedRoute_sound",
        "PureSFormal.Research.RootResetWholeStageClassifier.classifyActive_selectedAction",
        "PureSFormal.Research.RootResetWholeStageClassifier.classifyActive_selectedAction_sound",
        "PureSFormal.Research.RootResetWholeStageClassifier.selectedAction_accumulator_subterm",
        "PureSFormal.Research.RootResetWholeStageClassifier.classifyActive_canonicalChildAddress_sound",
        "PureSFormal.Research.RootResetWholeStageClassifier.classify_close_sound",
        "PureSFormal.Research.RootResetWholeStageClassifier.classify_canonicalChildAddress_sound",
        "PureSFormal.Research.RootResetWholeStageClassifier.existsUnique_endpointDecomposition",
        "PureSFormal.Research.RootResetProgressCompleteness.FirstMutation.run_freshRoot_exact",
        "PureSFormal.Research.RootResetProgressCompleteness.FirstMutation.selectStep?_complete",
        "PureSFormal.Research.RootResetProgressCompleteness.FirstMutation.runMutationCount_eq_one",
        "PureSFormal.Research.RootResetProgressCompleteness.FirstMutation.selectStep?_stateBound_complete",
        "PureSFormal.Research.RootResetProgressCompleteness.stateBound_initial_eq",
        "PureSFormal.Research.RootResetProgressTotality.progressFragment_haltsWithin_linear",
        "PureSFormal.Research.RootResetProgressTotality.progressFragment_run_linear_terminal",
        "PureSFormal.Research.RootResetProgressTotality.progressFragment_bare_controller_total",
        "PureSFormal.Research.RootResetProgressTotality.progressFragment_moves_linear",
        "PureSFormal.Research.RootResetProgressEulerSelector.preFallback_transition_ne_reject",
        "PureSFormal.Research.RootResetProgressEulerSelector.armedRoot_verifies_or_aborts",
        "PureSFormal.Research.RootResetProgressEulerSelector.openRight_verifies_or_aborts",
        "PureSFormal.Research.RootResetProgressEulerSelector.run_abort_to_euler_visit",
        "PureSFormal.Research.RootResetProgressEulerSelector.run_abort_then_rootExecution",
        "PureSFormal.Research.RootResetProgressEulerSelector.abort_then_rootExecution_ticks_le",
        "PureSFormal.Research.RootResetProgressEulerSelector.compiled_control_state_cardinality",
        "PureSFormal.Research.RootResetProgressEulerTotality.progressPrefix_haltsWithin_linear",
        "PureSFormal.Research.RootResetProgressEulerTotality.wholeInvocation_haltsWithin_linear",
        "PureSFormal.Research.RootResetProgressEulerTotality.wholeInvocation_run_linear_result",
        "PureSFormal.Research.RootResetProgressEulerTotality.wholeInvocation_bare_controller_total",
        "PureSFormal.Research.RootResetProgressEulerTotality.wholeInvocation_moves_linear",
        "PureSFormal.Research.RootResetProgressEulerContract.redexFlag_run",
        "PureSFormal.Research.RootResetProgressEulerContract.wholeInvocation_mutationCount_eq_redexFlag",
        "PureSFormal.Research.RootResetProgressEulerContract.final_nf_mutationCount",
        "PureSFormal.Research.RootResetProgressEulerContract.final_redex_mutationCount",
        "PureSFormal.Research.RootResetProgressEulerContract.outcome_agrees",
        "PureSFormal.Research.RootResetProgressEulerContract.mutationCount_agrees",
        "PureSFormal.Research.RootResetProgressEulerContract.selectorContract",
        "PureSFormal.Research.RootResetProgressEulerContract.selector_exact_mutation_count",
        "PureSFormal.Research.RootResetProgressEulerContract.selector_halts_linear",
        "PureSFormal.Research.RootResetProgressEulerContract.selector_moves_linear",
        "PureSFormal.Research.RootResetProgressEulerContract.selector_successfulEdgeMoves_linear",
        "PureSFormal.Research.RootResetWholeAppenderStages.parseRow?_sound",
        "PureSFormal.Research.RootResetWholeAppenderStages.parseRow?_complete",
        "PureSFormal.Research.RootResetWholeAppenderStages.parseActive?_sound",
        "PureSFormal.Research.RootResetWholeAppenderStages.parseActive?_complete",
        "PureSFormal.Research.RootResetWholeAppenderStages.parse?_sound",
        "PureSFormal.Research.RootResetWholeAppenderStages.parse?_complete",
        "PureSFormal.Research.RootResetWholeAppenderStages.parse?_unique",
        "PureSFormal.Research.RootResetWholeAppenderStages.parse?_history_marked",
        "PureSFormal.Research.RootResetWholeAppenderStages.View.focus_subterm",
        "PureSFormal.Research.RootResetWholeAppenderStages.View.selected_contracts",
        "PureSFormal.Research.RootResetWholeAppenderStages.View.final_contractAt?_none",
        "PureSFormal.Research.RootResetWholeAppenderStages.View.selectedAddress_none_of_final",
        "PureSFormal.Research.RootResetWholeAppenderStages.parse?_of_markedPrefix_generated",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parseRouteNode?_sound",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parseRouteNode?_complete",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parseRouteNode?_unique",
        "PureSFormal.Research.RootResetWholeDispatcherStages.RouteShape.deterministic",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parseActive?_sound",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parseActive?_complete",
        "PureSFormal.Research.RootResetWholeDispatcherStages.ActiveShape.phase_recovered",
        "PureSFormal.Research.RootResetWholeDispatcherStages.ActiveShape.frontBit_recovered",
        "PureSFormal.Research.RootResetWholeDispatcherStages.ActiveShape.route_split",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parseActive?_shell_audits_opaque",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parse?_sound",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parse?_complete",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parse?_unique",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parse?_history_marked",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parse?_phase_recovered",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parse?_frontBit_recovered",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parse?_route_recovered",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parse?_direction_from_outer_route",
        "PureSFormal.Research.RootResetWholeDispatcherStages.View.redex_subterm",
        "PureSFormal.Research.RootResetWholeDispatcherStages.View.contracts",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parse?_of_markedPrefix_generated",
        "PureSFormal.Research.RootResetWholeDispatcherStages.parse?_exposed_forked_disjoint",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.parseForked?_selected_contracts_exact",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.parseRouteNode?_selectedTarget_left_node",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.parseRouteNode?_selectedTarget_right_node",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.parsedForked_left_node_exact_handoff",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.parsedForked_right_node_exact_handoff",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.parseRouteDetailed_selectedTarget_left_leaf",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.parseRouteDetailed_selectedTarget_right_leaf",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.parsedForked_left_leaf_exact_handoff",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.parsedForked_right_leaf_exact_handoff",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.selectedAction_nonempty_contractRoot?_firstRow",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.parseRow?_selectedAction_nonempty_first",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.selectedAction_nonempty_exact_appender_handoff",
        "PureSFormal.Research.RootResetDispatcherSelectedHandoff.parseActive?_selectedAction_nonempty_first",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.shellDispatcherContext_plug",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.shellDispatcherContext_address",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.parseMarkedLocal?_fresh_openShell_none",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.localContinuationContext_address_of_parseLocal?",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.rewrap_marked_prefix",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.RouteShape.splice_current",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.RouteShape.splice_activated",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.parsedForked_direction_recovered",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.parsedForked_contracts_target",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.parsedForked_contracts_exact",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.parsedForked_selectedNode_exact_handoff",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.parsedForked_selectedLeaf_exact_handoff",
        "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff.parsedForked_selectedLeaf_nonempty_action_to_firstPush",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parseCleanMarkedHistory?_sound",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parseCleanMarkedHistory?_complete",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parseActive?_sound",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parseActive?_complete",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parseActive?_unique",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parse?_sound",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parse?_complete",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parse?_unique",
        "PureSFormal.Research.RootResetResponseBoundaryStages.unique_active_hole_decomposition",
        "PureSFormal.Research.RootResetResponseBoundaryStages.unique_active_fresh_local",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parse?_history_marked",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parse?_history_clean",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parse?_active_fresh",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parse?_recovers_header",
        "PureSFormal.Research.RootResetResponseBoundaryStages.View.close_exact",
        "PureSFormal.Research.RootResetResponseBoundaryStages.View.close_noOpen_crosses_boundary",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parseHandoff?_sound",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parseHandoff?_complete",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parseHandoff?_unique",
        "PureSFormal.Research.RootResetResponseBoundaryStages.View.commit_exact",
        "PureSFormal.Research.RootResetResponseBoundaryStages.View.commit_exact_with_handoff_active",
        "PureSFormal.Research.RootResetResponseBoundaryStages.View.commit_noOpen_crosses_boundary",
        "PureSFormal.Research.RootResetResponseBoundaryStages.parseActive?_shell_audits_opaque",
        "PureSFormal.Research.RootResetResponseBoundaryStages.continuationClean_of_not_marked",
        "PureSFormal.Research.RootResetResponseBoundaryStages.View.commit_exact_to_unmarked_continuation",
        "PureSFormal.Research.RootResetResponseBoundaryStages.View.commit_exact_to_unmarked_continuation_with_handoff_active",
        "PureSFormal.Research.RootResetClockFuelStages.parseClock?_sound",
        "PureSFormal.Research.RootResetClockFuelStages.parseClock?_generated_positive",
        "PureSFormal.Research.RootResetClockFuelStages.parseClock?_generated_zero",
        "PureSFormal.Research.RootResetClockFuelStages.parseClock?_generated_launch",
        "PureSFormal.Research.RootResetClockFuelStages.parseFuelRow?_sound",
        "PureSFormal.Research.RootResetClockFuelStages.FuelRow.contractAt?_eq",
        "PureSFormal.Research.RootResetClockFuelStages.parseFuelActive?_sound",
        "PureSFormal.Research.RootResetClockFuelStages.parseFuelActive?_complete",
        "PureSFormal.Research.RootResetClockFuelStages.FuelView.selected_contracts",
        "PureSFormal.Research.RootResetClockFuelStages.ClockView.residual_pos_of_launch",
        "PureSFormal.Research.RootResetClockFuelStages.ClockView.selected_contracts",
        "PureSFormal.Research.RootResetClockFuelStages.parse?_sound",
        "PureSFormal.Research.RootResetClockFuelStages.parse?_complete",
        "PureSFormal.Research.RootResetClockFuelStages.parse?_unique",
        "PureSFormal.Research.RootResetClockFuelStages.parse?_history_marked",
        "PureSFormal.Research.RootResetClockFuelStages.WholeShape.clock_parse",
        "PureSFormal.Research.RootResetClockFuelStages.WholeShape.fuel_parse",
        "PureSFormal.Research.RootResetClockFuelStages.View.selected_contracts",
        "PureSFormal.Research.RootResetClockFuelStages.FuelView.horizon_eq",
        "PureSFormal.Research.RootResetClockFuelStages.FuelView.horizon_call",
        "PureSFormal.Research.RootResetClockFuelStages.View.canonicalChild_size_lt_of_address_cons",
        "PureSFormal.Research.RootResetClockFuelStages.parseFuelActive?_pending",
        "PureSFormal.Research.RootResetClockFuelStages.pending_payload_opaque",
        "PureSFormal.Research.RootResetClockFuelStages.parseCanonicalZeroRoot?_second",
        "PureSFormal.Research.RootResetClockFuelStages.parseCanonicalZeroRoot?_fourth",
        "PureSFormal.Research.RootResetClockFuelStages.parseCanonicalZeroRoot?_stage",
        "PureSFormal.Research.RootResetClockFuelStages.zeroSecond_term_ne_zeroFourth_term",
        "PureSFormal.Research.RootResetClockFuelStages.parseFuelRow?_generated_zeroSecond",
        "PureSFormal.Research.RootResetClockFuelStages.parseFuelRow?_generated_zeroFourth",
        "PureSFormal.Research.RootResetClockFuelStages.FuelRow.contractAt?_eq_some_target",
        "PureSFormal.Research.RootResetClockFuelStages.openBase_eq_independent",
        "PureSFormal.Research.RootResetClockFuelStages.FuelView.selected_contracts_exact",
        "PureSFormal.Research.RootResetClockFuelStages.ClockView.focus_contractRoot?_eq",
        "PureSFormal.Research.RootResetClockFuelStages.ClockView.contractAt?_eq",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.parseClock?_coordinates",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.parseCanonicalClock?_sound",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.parseCanonicalClock?_complete",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.parseCanonicalFuelRow?_sound",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.parseCanonicalFuelRow?_complete",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.canonicalFuelRow_unique",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.canonicalClock_fuelRow_disjoint",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.ZeroPosition.row_canonical",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.parseCanonicalFuelRow?_zero",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.zeroRow_term_injective",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.canonicalFuelRow_contractAt_eq_target",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.generatedBaseView_canonical",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.parseFuelActive?_canonicalOpenBase",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.parseFuelActive?_canonicalRow",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.canonicalClock_fuel_disjoint",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.CanonicalActive.parseActive",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.parse?_canonical_complete",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.canonicalWhole_unique",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.CanonicalWhole.selected_contracts",
        "PureSFormal.Research.RootResetClockFuelCanonicalGrammar.zeroFuelView_horizon",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.call_target_eq_first",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.first_target_eq_second",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.second_target_eq_third",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.third_target_eq_fourth",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.fourth_target_eq_openBase",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.call_contractAt_eq_first",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.first_contractAt_eq_second",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.second_contractAt_eq_third",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.third_contractAt_eq_fourth",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.fourth_contractAt_eq_openBase",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.zeroScript_parser_trace",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.zeroScript_stepsN_five",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.zeroScript_stepsN_five_baseCarrier",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.markedPrefix_zeroScript_stepsN_five",
        "PureSFormal.Research.RootResetClockFuelCanonicalTransitions.markedPrefix_zeroScript_stepsN_five_baseCarrier",
        "PureSFormal.Research.RootResetCompositeStageRegistry.parseCanonicalFuelActive?_sound",
        "PureSFormal.Research.RootResetCompositeStageRegistry.parseCanonicalFuelActive?_complete",
        "PureSFormal.Research.RootResetCompositeStageRegistry.parseCanonicalClockFuelActive?_unique",
        "PureSFormal.Research.RootResetCompositeStageRegistry.parseClockFuel?_sound",
        "PureSFormal.Research.RootResetCompositeStageRegistry.parseClockFuel?_complete",
        "PureSFormal.Research.RootResetCompositeStageRegistry.parseClockFuel?_unique",
        "PureSFormal.Research.RootResetCompositeStageRegistry.stages_length",
        "PureSFormal.Research.RootResetCompositeStageRegistry.stages_nodup",
        "PureSFormal.Research.RootResetCompositeStageRegistry.parse?_sound",
        "PureSFormal.Research.RootResetCompositeStageRegistry.parse?_complete",
        "PureSFormal.Research.RootResetCompositeStageRegistry.identical_current_terms_same_classification",
        "PureSFormal.Research.RootResetCompositeStageRegistry.parse?_unique",
        "PureSFormal.Research.RootResetCompositeStageRegistry.RegisteredShape.deterministic",
        "PureSFormal.Research.RootResetCompositeStageRegistry.registered_stage_disjoint",
        "PureSFormal.Research.RootResetCompositeStageRegistry.unique_active_hole_decomposition",
        "PureSFormal.Research.RootResetCompositeStageRegistry.unique_stage_focus_selection",
        "PureSFormal.Research.RootResetCompositeStageRegistry.existsUnique_registeredView",
        "PureSFormal.Research.RootResetCompositeStageRegistry.unique_stage_currentAddress",
        "PureSFormal.Research.RootResetCompositeStageRegistry.parse?_history_marked",
        "PureSFormal.Research.RootResetCompositeStageRegistry.View.selected_contracts",
        "PureSFormal.Research.RootResetCompositeStageRegistry.canonical_clock_fuel_disjoint",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.coreStage?_toWholeStage",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.coreStage?_sound",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.coreStage?_none_iff",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.parseCore?_sound",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.parseCore?_complete",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.parseCore?_unique",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.CoreWholeShape.deterministic",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.CoreWholeShape.source_eq",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.CoreWholeShape.history_marked",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.CoreWholeShape.commit_active_fresh",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.CoreWholeShape.accumulatorClose_evidence",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.CoreView.selected_contracts",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.stages_length",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.stages_nodup",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.mem_stages",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.parse?_sound",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.parse?_complete",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.parse?_unique",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.RegisteredShape.deterministic",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.RegisteredShape.source_eq",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.existsUnique_registeredView",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.unique_active_hole_decomposition",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.unique_stage_focus_selection",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.registered_stage_disjoint",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.parse?_history_marked",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.View.selected_contracts",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.response_commit_exact_with_handoff_active",
        "PureSFormal.Research.RootResetTwentySevenStageRegistry.response_commit_exact_to_unmarked_continuation",
        "PureSFormal.Research.ProtectedTrieAlgebra.D_succ_open_six",
        "PureSFormal.Research.ProtectedTrieAlgebra.D_zero_reset_one",
        "PureSFormal.Research.ProtectedTrieAlgebra.D_zero_open_seven",
        "PureSFormal.Research.ProtectedTrieAlgebra.goodPhase_phaseAt",
        "PureSFormal.Research.ProtectedTrieParser.protectedNode_step_cases",
        "PureSFormal.Research.ProtectedTrieParser.parseProtected?_eq_some_iff",
        "PureSFormal.Research.ProtectedTrieParser.openedAt?_steps_mono",
        "PureSFormal.Research.ProtectedTrieParser.anchoredOpenedAt?_step_mono",
        "PureSFormal.Research.ProtectedTrieParser.anchoredOpenedAt?_steps_mono",
        "PureSFormal.Research.ProtectedTrieEnumeration.mem_openedPaths_iff_openedAt?",
        "PureSFormal.Research.ProtectedTrieEnumeration.mem_anchoredOpenedPaths_iff_anchoredOpenedAt?",
        "PureSFormal.Research.ProtectedTrieSingleOpening.ProtectedFieldContext.OpenedAt.singleton_delta",
        "PureSFormal.Research.ProtectedTrieSingleOpening.positiveProper_parser_stutter",
        "PureSFormal.Research.ProtectedTrieSingleOpening.positive_last_step_exact_delta",
        "PureSFormal.Research.ProtectedTrieSingleOpening.positive_final_left_frontier",
        "PureSFormal.Research.ProtectedTrieSingleOpening.zeroProper_parser_stutter",
        "PureSFormal.Research.ProtectedTrieSingleOpening.zero_last_step_exact_delta",
        "PureSFormal.Research.ProtectedTrieSingleOpening.zero_final_right_frontier",
        "PureSFormal.Research.ProtectedTrieBuild.phaseGenerator_steps_buildFrom",
        "PureSFormal.Research.ProtectedTrieBuild.encoder_steps_seededBuild",
        "PureSFormal.Research.ProtectedTrieBuild.anchoredOpenedPaths_seededBuild",
        "PureSFormal.Research.ProtectedTrieBuild.encoder_reaches_exact_tree",
        "PureSFormal.Research.ProtectedTriePrefixBuild.mem_paths_treeOfGenerators_iff",
        "PureSFormal.Research.ProtectedTriePrefixBuild.buildAt_steps_insertPath",
        "PureSFormal.Research.ProtectedTriePrefixBuild.mem_anchoredOpenedPaths_seededPrefixBuild_iff",
        "PureSFormal.Research.ProtectedTriePrefixBuild.encoder_reaches_exact_prefixSet",
        "PureSFormal.Research.ProtectedTrieSeed.N_injective",
        "PureSFormal.Research.ProtectedTrieSeed.N_stepNormal",
        "PureSFormal.Research.ProtectedTrieSeed.encoder_steps_preserves",
        "PureSFormal.Research.ProtectedTrieCertificates.a_prefix_iff",
        "PureSFormal.Research.ProtectedTrieCertificates.a_injective",
        "PureSFormal.Research.ProtectedTrieCertificates.a_not_prefix_router",
        "PureSFormal.Research.ProtectedTrieFinitePrefix.a_contains_certificatePrefixSet_iff",
        "PureSFormal.Research.ProtectedTrieFinitePrefix.a_not_contains_routerPrefixSet",
        "PureSFormal.Research.ProtectedTrieFinitePrefix.a_contains_protectedPrefixSet_iff",
        "PureSFormal.Research.ProtectedTrieFinitePrefix.a_not_contains_candidateProperPrefixSet",
        "PureSFormal.Research.ProtectedTrieFinitePrefix.preparedContains_prefix",
        "PureSFormal.Research.ProtectedTrieFinitePrefix.a_preparedContains_iff",
        "PureSFormal.Research.ProtectedTrieMachineAgreement.step?_eq_some_iff_textbookStep",
        "PureSFormal.Research.ProtectedTrieTableau.verify_sound",
        "PureSFormal.Research.ProtectedTrieTableau.verify_complete",
        "PureSFormal.Research.ProtectedTrieTableau.verify_witness_unique",
        "PureSFormal.Research.ProtectedTrieStrong.strongProjection_step_genuine_batch",
        "PureSFormal.Research.ProtectedTrieStrong.strongCheckpoint_exact",
        "PureSFormal.Research.ProtectedTrieStrong.strong_cofinal_complete",
        "PureSFormal.Research.ProtectedTrieSubdivision.protectedTrie_simple_directed_subdivision",
        "PureSFormal.Research.ProtectedTrieSubdivision.subdivisionSimpleEdgePath_nonempty",
        "PureSFormal.Research.ProtectedTrieSubdivision.protectedTrieFiniteBranchWalk",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.sourceValidity_iff",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strongProjection_contains_valid_on_cone",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strong_frontier_exact_opening",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strongSourceEdgeSimplePath_nonempty",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strong_simple_directed_subdivision",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strong_subdivisionCheckpoint_reachable",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strong_subdivisionCheckpoint_exact",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strongFiniteBranchWalk",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strongInfiniteBranchStep",
        "PureSFormal.Research.ProtectedTrieStrongTheorem.strongWholeMultiwayUniversality",
        "PureSFormal.Research.ProtectedTrieFairStream.addressCompleteCanonicalPath",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.protectedPersistentCertificateEnumeration",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.allEdgeProtectedPathPersistence",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.protectedExactFiniteRange",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.protectedCofinalExtension",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.addressCompleteAdjacentStepPath",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.protectedDirectedSubdivision",
        "PureSFormal.Research.ProtectedTrieCertificateEnumeration.terminalCertificateEquivalence",
        "PureSFormal.Research.ProtectedPrefixGeneratorCalibration.PermanentBinaryPrefixGenerator.allReductPermanence",
        "PureSFormal.Research.ProtectedPrefixGeneratorCalibration.PermanentBinaryPrefixGenerator.persistence_range_cofinality",
        "PureSFormal.Research.ProtectedPrefixGeneratorCalibration.pureS_persistence_range_cofinality",
        "PureSFormal.Research.ProtectedTrieExecutableSchedule.insertPathSchedule_of_frontier",
        "PureSFormal.Research.ProtectedTrieExecutableSchedule.subdivisionEventSchedule_eq_openingSchedule",
        "PureSFormal.Research.ProtectedTrieExecutableSchedule.replayWithTrace_subdivisionEventSchedule",
        "PureSFormal.Research.ProtectedTrieExecutableSchedule.subdivisionEdgeSchedule_executable_certificate",
        "PureSFormal.Research.ProtectedTrieExecutableScheduleStrong.strongSourceEdgeSchedule_executable_certificate",
        "PureSFormal.Research.ProtectedTrieExecutableScheduleStrong.strongExecutableNonvacuity",
        "PureSFormal.Research.ProtectedTrieStrongCompleteness.mem_oneStepResults_iff",
        "PureSFormal.Research.ProtectedTrieStrongCompleteness.steps_mem_some_reductionLayer",
        "PureSFormal.Research.ProtectedTrieStrongCompleteness.eventuallyTerminalObserved_semidecidable",
        "PureSFormal.Research.ProtectedTrieDeterministicCompiler.deterministicHalting_reducesVia_targetTerminalObservation",
        "PureSFormal.Research.ProtectedTrieDeterministicCompiler.deterministicHalting_manyOne_targetTerminalObservation",
        "PureSFormal.Research.ProtectedTrieDeterministicCompiler.deterministicHalting_reducesVia_eventuallyTerminalObserved",
        "PureSFormal.Research.ProtectedTrieDeterministicCompiler.deterministicHalting_manyOne_eventuallyTerminalObserved",
        "PureSFormal.Research.FiniteBranchBinaryMachineCompiler.finiteBranchBinaryMachineFirstReturn",
        "PureSFormal.Research.ProtectedTrieTableauExactResource.runLocalVerifier_resourceCertificate",
        "PureSFormal.Research.ProtectedTrieWholeObserverExactCost.strongEncoder_resource_certificate",
        "PureSFormal.Research.ProtectedTrieWholeObserverExactCost.runWholeLabelledObserver_labels",
        "PureSFormal.Research.ProtectedTrieWholeObserverExactCost.runWholeLabelledObserver_historyIdeal",
        "PureSFormal.Research.ProtectedTrieWholeObserverExactCost.runWholeLabelledObserver_outputCells_le",
        "PureSFormal.Research.ProtectedTrieWholeObserverExactCost.wholeObserver_resource_certificate",
        "PureSFormal.Research.ProtectedTrieLabelledObserver.labelledProjection_literal_final_on_cone",
        "PureSFormal.Research.ProtectedTrieLabelledObserver.labelledProjection_slot_and_terminal_on_cone",
        "PureSFormal.Research.ProtectedTrieLabelledObserver.labelledProjection_history_unique",
        "PureSFormal.Research.ProtectedTrieObserverNecessity.invalidCandidateAcceptance_reachable",
        "PureSFormal.Research.ProtectedTrieObserverNecessity.coneWideLiteralSound_iff_pointwiseRefinesVerifier",
        "PureSFormal.Research.ProtectedTrieObserverNecessity.coneWideLiteralSound_and_complete_iff_pointwiseAgreesWithVerifier",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.candidateAddress_length",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.replay_candidateSchedule",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.runTerminalCandidate_value",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.runTerminalCandidate_ticks_le",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.runTerminalCandidate_peak_le",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.candidateSchedule_length_le",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.candidateSchedule_length_ge_address",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.candidateLiteral_length_le_schedule",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.mem_candidateSchedule_address_length_le",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.candidateSchedule_addressCells_le",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.boundedTerminalCandidate_has_bounded_literals",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.boundedTerminalCandidate_sound",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.sourceBranchHalts_boundedTerminalCandidate",
        "PureSFormal.Research.ProtectedTrieBoundedTerminal.exists_boundedTerminalCandidate_iff",
        "PureSFormal.Research.ProtectedTrieConfluenceObstruction.no_exclusive_fork_decoder",
        "PureSFormal.Research.ProtectedTrieConfluenceObstruction.no_distinct_terminal_fork_decoder",
        "PureSFormal.Research.ProtectedTrieConfluenceObstruction.no_exclusive_fork_decoder_of_confluent",
        "PureSFormal.Research.ProtectedTrieConfluenceObstruction.no_distinct_terminal_fork_decoder_of_confluent",
        "PureSFormal.EvaluatorBounds.selectNext_on_run_halts_within",
        "PureSFormal.EvaluatorBounds.selectNext_total_decision",
        "PureSFormal.EvaluatorBounds.withoutContraction_run_eventuallyPeriodic",
        "PureSFormal.EvaluatorBounds.mutationFree_run_eventuallyPeriodic",
        "PureSFormal.Computation.FixedEndpointUniformity.fixedEndpoint_rawCoverCounts",
        "PureSFormal.Computation.FixedEndpointUniformity.fixedController_states_nodup",
        "PureSFormal.Computation.FixedEndpointUniformity.fixedController_covers",
        "PureSFormal.Computation.FixedEndpointUniformity.fixedController_textbookAgreement",
        "PureSFormal.Computation.FixedEndpointUniformity.fixedEncoder_eq_generator",
        "PureSFormal.StrongMultiwayUniversality.strongInitialProjectionEmpty",
        "PureSFormal.StrongMultiwayUniversality.strongInitialObserverEmpty",
        "PureSFormal.StrongMultiwayUniversality.strongInitialCountedObserverEmpty",
        "PureSFormal.StrongMultiwayUniversality.strongObserverOutputHasLiteralCertificate",
        "PureSFormal.StrongMultiwayUniversality.strongObserverTargetGenerated",
        "PureSFormal.StrongMultiwayUniversality.strongObserverNonconstantOnCone",
        "PureSFormal.StrongMultiwayUniversality.strongInvalidCandidateAcceptanceReachable",
        "PureSFormal.StrongMultiwayUniversality.strongConeWideCandidateObserverSoundIffRefinesVerifier",
        "PureSFormal.StrongMultiwayUniversality.strongConeWideCandidateObserverSoundAndCompleteIffAgreesWithVerifier",
        "PureSFormal.StrongMultiwayUniversality.strongExecutableScheduleNonvacuity",
        "PureSFormal.StrongMultiwayUniversality.strongExecutableEdgeCertificate",
        "PureSFormal.StrongMultiwayUniversality.strongOneStepEnumerationExact",
        "PureSFormal.StrongMultiwayUniversality.strongFiniteReductionEnumerationExact",
        "PureSFormal.StrongMultiwayUniversality.strongTerminalObservationSemidecidable",
        "PureSFormal.StrongMultiwayUniversality.strongDeterministicTapeHaltingReduction",
        "PureSFormal.StrongMultiwayUniversality.strongDeterministicTapeHaltingManyOne",
        "PureSFormal.StrongMultiwayUniversality.strongDeterministicTapeHaltingTermReduction",
        "PureSFormal.StrongMultiwayUniversality.strongDeterministicTapeHaltingTermManyOne",
        "PureSFormal.StrongMultiwayUniversality.strongFiniteBranchBinaryFirstReturn",
        "PureSFormal.StrongMultiwayUniversality.strongWholeMultiwayUniversality",
        "PureSFormal.StrongMultiwayUniversality.strongBoundedTerminalCandidateIff",
    }
)


def parse_axioms(raw: str) -> frozenset[str]:
    if not raw.strip():
        return frozenset()
    return frozenset(part.strip() for part in raw.split(","))


def public_export_declarations() -> tuple[str, ...]:
    """Return every original declaration named by an export or generated alias."""
    source = PUBLIC_MODULE.read_text(encoding="utf-8")
    declarations: list[str] = []
    for match in EXPORT_RE.finditer(source):
        namespace = match.group("namespace")
        declarations.extend(
            f"{namespace}.{name}" for name in match.group("names").split()
        )
    declarations.extend(re.findall(
        r"^abbrev\s+[A-Za-z_][A-Za-z0-9_'.?]*\s*:=\s*@([A-Za-z_][A-Za-z0-9_'.?]*)\s*$",
        source, flags=re.MULTILINE,
    ))
    if not declarations:
        raise SystemExit("no declarations exported by PureSFormal/Public.lean")
    duplicates = sorted(
        {name for name in declarations if declarations.count(name) > 1}
    )
    if duplicates:
        raise SystemExit(f"duplicate declarations exported by Public.lean: {duplicates}")
    return tuple(declarations)


def public_export_audit_source(declarations: tuple[str, ...]) -> str:
    lines = ["import PureSFormal.Public", ""]
    lines.extend(f"#print axioms {declaration}" for declaration in declarations)
    return "\n".join(lines) + "\n"


def inventoried_modules(root: pathlib.Path = ROOT) -> tuple[str, ...]:
    """Include every Lean source in FILES, independent of its namespace or filename."""
    entries = (root / "FILES").read_text(encoding="utf-8").splitlines()
    if entries != sorted(set(entries)):
        raise ValueError("formalization/FILES must have sorted unique entries")
    modules: list[str] = []
    sources: set[str] = set()
    for entry in entries:
        path = pathlib.PurePosixPath(entry)
        if (
            path.is_absolute()
            or path.as_posix() != entry
            or any(part in {".", "..", ".lake", "__pycache__"} for part in path.parts)
        ):
            raise ValueError(f"invalid formalization inventory path: {entry!r}")
        if path.suffix != ".lean":
            continue
        source = root / entry
        if (source.is_symlink() or not source.is_file()
                or not source.resolve().is_relative_to(root.resolve())):
            raise ValueError(f"inventoried Lean source is not a regular file: {entry}")
        module = ".".join(path.with_suffix("").parts)
        if MODULE_RE.fullmatch(module) is None:
            raise ValueError(f"invalid Lean module name from inventory: {entry}")
        sources.add(entry)
        modules.append(module)
    actual = {
        path.relative_to(root).as_posix()
        for path in root.rglob("*.lean")
        if ".lake" not in path.relative_to(root).parts
    }
    if sources != actual:
        raise ValueError(
            "Lean source inventory differs from the tree: "
            f"unlisted={sorted(actual - sources)} missing={sorted(sources - actual)}"
        )
    if not modules:
        raise ValueError("formalization inventory contains no Lean source modules")
    return tuple(modules)


def inventoried_source_snapshot(root: pathlib.Path = ROOT) -> tuple[tuple[str, str], ...]:
    """Hash the inventory and its source inputs independently of generated build objects."""
    entries = (root / "FILES").read_text(encoding="utf-8").splitlines()
    snapshot: list[tuple[str, str]] = []
    for entry in ["FILES", *entries]:
        source = root / entry
        if (source.is_symlink() or not source.is_file()
                or not source.resolve().is_relative_to(root.resolve())):
            raise ValueError(f"snapshot input is not a regular local file: {entry}")
        snapshot.append((entry, hashlib.sha256(source.read_bytes()).hexdigest()))
    return tuple(snapshot)


def executable_support_roles(
    modules: tuple[str, ...], root: pathlib.Path = ROOT,
) -> dict[str, str]:
    """Read explicit executable roots; imported library modules retain the library policy."""
    configuration = tomllib.loads((root / "lakefile.toml").read_text(encoding="utf-8"))
    roles: dict[str, str] = {}
    for executable in configuration.get("lean_exe", []):
        module = executable.get("root", executable["name"])
        if module not in modules:
            raise ValueError(f"Lake executable root is not inventoried: {module}")
        if module in roles:
            raise ValueError(f"duplicate Lake executable root: {module}")
        roles[module] = "lake-executable:" + executable["name"]
    for module, role in STANDALONE_EXECUTABLE_ROLES.items():
        if module not in modules:
            raise ValueError(f"standalone executable is not inventoried: {module}")
        if module in roles:
            raise ValueError(f"duplicate executable role: {module}")
        roles[module] = role
    return roles


def all_declaration_audit_source(modules: tuple[str, ...]) -> str:
    """Select imported kernel constants by Lean's declaration-to-module metadata."""
    if not modules or len(set(modules)) != len(modules):
        raise ValueError("declaration audit needs a nonempty unique module list")
    if any(MODULE_RE.fullmatch(module) is None for module in modules):
        raise ValueError("declaration audit contains an invalid Lean module name")
    imports = "\n".join(f"import {module}" for module in modules)
    names = ", ".join(f"`{module}" for module in modules)
    return f'''import Lean
{imports}

set_option maxHeartbeats 0
set_option maxRecDepth 100000

open Lean Elab Command in
run_cmd do
  let env ← getEnv
  let modules : Array Name := #[{names}]
  for module in modules do
    unless env.header.moduleNames.contains module do
      throwError "inventoried module was not imported: {{module}}"
  let declarations := env.constants.toList.filterMap fun (name, info) => do
    let index ← env.const2ModIdx[name]?
    let module ← env.header.moduleNames[index.toNat]?
    if modules.contains module then some (name, module, info) else none
  let declarations := declarations.mergeSort fun left right =>
    Name.quickLt left.1 right.1
  for (name, module, info) in declarations do
    let axioms ← collectAxioms name
    let record := Json.mkObj [
      ("module", toJson module.toString),
      ("declaration", toJson name.toString),
      ("isUnsafe", toJson info.isUnsafe),
      ("isPartial", toJson info.isPartial),
      ("axioms", toJson (axioms.map Name.toString))]
    liftIO <| IO.println ("{DECLARATION_PREFIX}" ++ record.compress)
  let summary := Json.mkObj [
    ("modules", toJson (modules.map Name.toString)),
    ("declarations", toJson declarations.length)]
  liftIO <| IO.println ("{SUMMARY_PREFIX}" ++ summary.compress)
'''


def parse_declaration_audit(
    output: str, modules: tuple[str, ...], *, enforce_policy: bool = True,
    executable_modules: frozenset[str] = frozenset(),
) -> KernelDeclarationAudit:
    """Require complete, unique metadata records and the exact axiom allowlist."""
    inventory: dict[DeclarationIdentity, frozenset[str]] = {}
    runtime: dict[DeclarationIdentity, frozenset[str]] = {}
    summaries: list[dict] = []
    failures: list[str] = []
    partial: set[DeclarationIdentity] = set()
    executable: set[DeclarationIdentity] = set()
    violations: list[str] = []
    for line in output.splitlines():
        if line.startswith(SUMMARY_PREFIX):
            summaries.append(json.loads(line[len(SUMMARY_PREFIX):]))
        elif line.startswith(DECLARATION_PREFIX):
            record = json.loads(line[len(DECLARATION_PREFIX):])
            declaration = record["declaration"]
            module = record["module"]
            axioms = record["axioms"]
            if not isinstance(declaration, str) or not declaration:
                raise ValueError("kernel declaration audit contains an invalid name")
            if not isinstance(module, str) or module not in modules:
                raise ValueError(f"declaration outside inventoried modules: {declaration}")
            identity = (module, declaration)
            if module in executable_modules:
                executable.add(identity)
            if not isinstance(axioms, list) or any(not isinstance(name, str) for name in axioms):
                raise ValueError(f"invalid kernel axiom list: {declaration}")
            if type(record["isUnsafe"]) is not bool or type(record["isPartial"]) is not bool:
                raise ValueError(f"invalid kernel safety metadata: {declaration}")
            if identity in inventory or identity in runtime:
                failures.append(f"duplicate kernel declaration record: {module}:{declaration}")
            if record["isPartial"] and record["isUnsafe"]:
                failures.append(f"conflicting kernel safety metadata: {module}:{declaration}")
            if record["isPartial"]:
                partial.add(identity)
            if record["isUnsafe"] or record["isPartial"]:
                runtime[identity] = frozenset(axioms)
            else:
                inventory[identity] = frozenset(axioms)
                allowed = allowed_declaration_axioms(module, declaration, module in executable_modules)
                unexpected = inventory[identity] - allowed
                if unexpected:
                    violations.append(f"{module}:{declaration}: unexpected axioms {sorted(unexpected)}")
    if len(summaries) != 1:
        failures.append(f"expected one kernel declaration summary, found {len(summaries)}")
    else:
        summary = summaries[0]
        if summary["modules"] != list(modules):
            failures.append("kernel declaration summary differs from inventoried modules")
        if summary["declarations"] != len(inventory) + len(runtime):
            failures.append("kernel declaration summary differs from emitted record count")
    if failures:
        raise ValueError("kernel declaration audit failed:\n" + "\n".join(failures))
    discovery = KernelDeclarationAudit(
        inventory, runtime, (modules,), frozenset(partial), frozenset(executable),
        tuple(violations)
    )
    return require_axiom_policy(discovery) if enforce_policy else discovery


def require_axiom_policy(discovery: KernelDeclarationAudit) -> KernelDeclarationAudit:
    if any("Demo" in group for group in discovery.groups):
        observed = {name for (module, name), axioms in discovery.safe.items()
                    if module == "Demo" and "Classical.choice" in axioms}
        if observed != DEMO_STRING_CHOICE_DECLARATIONS:
            raise ValueError("Demo string axiom profile changed: " + repr(sorted(
                observed ^ DEMO_STRING_CHOICE_DECLARATIONS)))
    if discovery.violations:
        module_count = sum(len(group) for group in discovery.groups)
        executable_safe = discovery.safe.keys() & discovery.executable
        raise ValueError(
            f"kernel declaration audit failed after census of {module_count} modules "
            f"in {len(discovery.groups)} import groups: "
            f"safe_library={len(discovery.safe) - len(executable_safe)} "
            f"safe_executable={len(executable_safe)} "
            f"unsafe_runtime={len(discovery.runtime) - len(discovery.partial)} "
            f"partial_runtime={len(discovery.partial)} "
            f"violations={len(discovery.violations)}\n" + "\n".join(discovery.violations)
        )
    return discovery


def declaration_name_index(
    discovery: KernelDeclarationAudit,
) -> tuple[dict[str, frozenset[str]], dict[str, tuple[str, ...]]]:
    """Index unique safe names for authored queries without merging distinct origins."""
    origins: dict[str, list[str]] = {}
    for module, declaration in (*discovery.safe, *discovery.runtime):
        origins.setdefault(declaration, []).append(module)
    collisions = {
        declaration: tuple(sorted(modules))
        for declaration, modules in origins.items() if len(modules) > 1
    }
    unique = {
        declaration: axioms for (_, declaration), axioms in discovery.safe.items()
        if declaration not in collisions
    }
    return unique, collisions


def audit_temporary_root() -> pathlib.Path:
    workspace = LocalWorkspace(ROOT.parent)
    workspace.activate()
    return workspace.directory("tmp")


def audit_all_declarations(
    lean: list[str],
    modules: tuple[str, ...],
    *,
    cwd: pathlib.Path = ROOT,
    temporary_root: pathlib.Path | None = None,
    environment: dict[str, str] | None = None,
    executable_modules: frozenset[str] = frozenset(),
    report_progress: bool = False,
    _defer_policy_failures: bool = False,
) -> KernelDeclarationAudit:
    """Audit compatible import groups, partitioning only explicit Lean name collisions."""
    with tempfile.TemporaryDirectory(
        prefix="pure-s-kernel-declarations-",
        dir=temporary_root if temporary_root is not None else audit_temporary_root(),
    ) as temporary:
        source = pathlib.Path(temporary) / "AllDeclarationAxioms.lean"
        source.write_text(all_declaration_audit_source(modules), encoding="utf-8")
        result = subprocess.run(
            [*lean, str(source)],
            cwd=cwd,
            env=environment,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
    if result.returncode != 0:
        if len(modules) > 1 and IMPORT_COLLISION_RE.search(result.stdout):
            middle = len(modules) // 2
            groups = [audit_all_declarations(
                lean, group, cwd=cwd, temporary_root=temporary_root,
                environment=environment, _defer_policy_failures=True,
                executable_modules=executable_modules,
                report_progress=report_progress,
            ) for group in (modules[:middle], modules[middle:])]
            safe: dict[DeclarationIdentity, frozenset[str]] = {}
            runtime: dict[DeclarationIdentity, frozenset[str]] = {}
            for group in groups:
                overlap = (safe.keys() | runtime.keys()) & (group.safe.keys() | group.runtime.keys())
                if overlap:
                    raise ValueError(f"duplicate declarations across import groups: {sorted(overlap)}")
                safe.update(group.safe)
                runtime.update(group.runtime)
            discovery = KernelDeclarationAudit(
                safe, runtime, tuple(part for group in groups for part in group.groups),
                frozenset(identity for group in groups for identity in group.partial),
                frozenset(identity for group in groups for identity in group.executable),
                tuple(violation for group in groups for violation in group.violations),
            )
            return discovery if _defer_policy_failures else require_axiom_policy(discovery)
        raise ValueError("kernel declaration discovery failed:\n" + result.stdout.rstrip())
    discovery = parse_declaration_audit(
        result.stdout, modules, enforce_policy=False,
        executable_modules=executable_modules,
    )
    if report_progress:
        executable_safe = discovery.safe.keys() & discovery.executable
        print(
            f"CENSUS_PARTITION modules={len(modules)} "
            f"safe_library={len(discovery.safe) - len(executable_safe)} "
            f"safe_executable={len(executable_safe)} "
            f"unsafe_runtime={len(discovery.runtime) - len(discovery.partial)} "
            f"partial_runtime={len(discovery.partial)} "
            f"violations={len(discovery.violations)}", flush=True,
        )
    return discovery if _defer_policy_failures else require_axiom_policy(discovery)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--lake", default="lake")
    parser.add_argument("--output-json", type=pathlib.Path)
    args = parser.parse_args()
    lake = lake_command(args.lake)
    snapshot = inventoried_source_snapshot()
    public_exports = public_export_declarations()
    modules = inventoried_modules()
    executable_roles = executable_support_roles(modules)
    subprocess.run([sys.executable, "-B", str(ROOT / "scripts" / "audit_sources.py")],
                   cwd=ROOT, check=True)
    subprocess.run(
        [sys.executable, "-B", str(ROOT / "scripts" / "build_inventory.py"),
         "--lake", lake[0]], cwd=ROOT, check=True,
    )
    print(f"Checking kernel declarations from {len(modules)} inventoried modules", flush=True)
    discovery = audit_all_declarations(
        [*lake, "env", "lean"], modules,
        executable_modules=frozenset(executable_roles),
        report_progress=True,
    )
    inventory, name_collisions = declaration_name_index(discovery)
    origin_by_name = {declaration: module for module, declaration in discovery.safe}
    discovered_count = len(discovery.safe)

    audit_paths = [
        path
        for path in sorted(ROOT.glob("PureSFormal/**/*Audit.lean"))
        if "#print axioms" in path.read_text(encoding="utf-8")
    ]
    if not audit_paths:
        raise SystemExit("no Lean axiom-audit modules found")

    failures: list[str] = []
    for path in audit_paths:
        result = subprocess.run(
            [*lake, "env", "lean", "-Dformat.width=1000000", str(path.relative_to(ROOT))],
            cwd=ROOT,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        if result.returncode != 0:
            failures.append(
                f"{path.relative_to(ROOT)} failed:\n{result.stdout.rstrip()}"
            )
            continue

        found = 0
        for line in axiom_report_lines(result.stdout):
            none = NONE_RE.match(line)
            some = SOME_RE.match(line)
            if none:
                declaration, axioms = none.group(1), frozenset()
            elif some:
                declaration, axioms = some.group(1), parse_axioms(some.group(2))
            else:
                continue
            found += 1
            if declaration in name_collisions:
                failures.append(
                    f"ambiguous authored axiom query {declaration}: "
                    f"origins={name_collisions[declaration]}"
                )
                continue
            previous = inventory.get(declaration)
            if previous is not None and previous != axioms:
                failures.append(
                    f"conflicting inventories for {declaration}: "
                    f"{sorted(previous)} versus {sorted(axioms)}"
                )
            inventory[declaration] = axioms
            origin = origin_by_name.get(declaration, "")
            unexpected = axioms - allowed_declaration_axioms(origin, declaration, origin in executable_roles)
            if unexpected:
                failures.append(
                    f"{declaration}: unexpected axioms {sorted(unexpected)}"
                )
        if found == 0:
            failures.append(
                f"{path.relative_to(ROOT)} emitted no #print axioms inventory"
            )

    with tempfile.TemporaryDirectory(
        prefix="pure-s-public-export-axioms-", dir=audit_temporary_root()
    ) as tmp:
        source = pathlib.Path(tmp) / "PublicExportAxioms.lean"
        source.write_text(
            public_export_audit_source(public_exports),
            encoding="utf-8",
            newline="\n",
        )
        result = subprocess.run(
            [*lake, "env", "lean", "-Dformat.width=1000000", str(source)],
            cwd=ROOT,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
    if result.returncode != 0:
        failures.append(
            "generated Public.lean export audit failed:\n" + result.stdout.rstrip()
        )
    else:
        found_public: set[str] = set()
        for line in axiom_report_lines(result.stdout):
            none = NONE_RE.match(line)
            some = SOME_RE.match(line)
            if none:
                declaration, axioms = none.group(1), frozenset()
            elif some:
                declaration, axioms = some.group(1), parse_axioms(some.group(2))
            else:
                continue
            found_public.add(declaration)
            if declaration in name_collisions:
                failures.append(
                    f"ambiguous public axiom query {declaration}: "
                    f"origins={name_collisions[declaration]}"
                )
                continue
            previous = inventory.get(declaration)
            if previous is not None and previous != axioms:
                failures.append(
                    f"conflicting inventories for {declaration}: "
                    f"{sorted(previous)} versus {sorted(axioms)}"
                )
            inventory[declaration] = axioms
            origin = origin_by_name.get(declaration, "")
            unexpected = axioms - allowed_declaration_axioms(origin, declaration, origin in executable_roles)
            if unexpected:
                failures.append(
                    f"{declaration}: unexpected axioms {sorted(unexpected)}"
                )
        missing_public = sorted(set(public_exports) - found_public)
        extra_public = sorted(found_public - set(public_exports))
        if missing_public:
            failures.append(
                "no axiom output for Public.lean exports: " + repr(missing_public)
            )
        if extra_public:
            failures.append(
                "unexpected Public.lean export axiom output: " + repr(extra_public)
            )

    missing_required = sorted(REQUIRED_DECLARATIONS - inventory.keys())
    if missing_required:
        failures.append(
            "missing required public declarations: " + repr(missing_required)
        )

    if inventoried_source_snapshot() != snapshot or inventoried_modules() != modules:
        failures.append("inventoried source inputs changed during build or axiom audit")

    if failures:
        raise SystemExit("axiom audit failed:\n" + "\n".join(failures))

    if args.output_json is not None:
        destination = LocalWorkspace(ROOT.parent).output(args.output_json)
        destination.parent.mkdir(parents=True, exist_ok=True)
        records = []
        for safety, items in (("safe", discovery.safe), ("runtime", discovery.runtime)):
            for (module, declaration), axioms in sorted(items.items()):
                records.append({"module": module, "declaration": declaration,
                    "safety": "partial" if (module, declaration) in discovery.partial else safety,
                    "axioms": sorted(axioms)})
        destination.write_text(json.dumps({"allowed_axioms": sorted(ALLOWED),
            "appendix_f_additional_axioms": ["Classical.choice"],
            "demo_string_choice_declarations": sorted(DEMO_STRING_CHOICE_DECLARATIONS),
            "source_modules": modules, "import_groups": discovery.groups,
            "declarations": records}, indent=2) + "\n", encoding="utf-8")

    empty = sum(not axioms for axioms in discovery.safe.values())
    propext = sum(axioms == frozenset({"propext"}) for axioms in discovery.safe.values())
    executable_safe = discovery.safe.keys() & discovery.executable
    for module, role in sorted(executable_roles.items()):
        profiles: dict[tuple[str, tuple[str, ...]], int] = {}
        for identity in sorted(discovery.executable):
            if identity[0] != module:
                continue
            if identity in discovery.safe:
                safety, axioms = "safe", discovery.safe[identity]
            else:
                safety = "partial" if identity in discovery.partial else "unsafe"
                axioms = discovery.runtime[identity]
            profile = (safety, tuple(sorted(axioms)))
            profiles[profile] = profiles.get(profile, 0) + 1
        print("EXECUTABLE_SUPPORT_ROLE " + json.dumps({
            "module": module, "role": role,
            "profiles": [{"safety": safety, "axioms": axioms, "declarations": count}
                         for (safety, axioms), count in sorted(profiles.items())],
        }, sort_keys=True, separators=(",", ":")))
    for index, group in enumerate(discovery.groups, 1):
        print("KERNEL_IMPORT_GROUP " + json.dumps({
            "group": index, "modules": group,
        }, sort_keys=True, separators=(",", ":")))
    for declaration, origins in sorted(name_collisions.items()):
        print("KERNEL_NAME_COLLISION " + json.dumps({
            "declaration": declaration, "modules": origins,
        }, sort_keys=True, separators=(",", ":")))
    runtime_profiles: dict[tuple[str, tuple[str, ...]], int] = {}
    for identity, axioms in discovery.runtime.items():
        safety = "partial" if identity in discovery.partial else "unsafe"
        profile = (safety, tuple(sorted(axioms)))
        runtime_profiles[profile] = runtime_profiles.get(profile, 0) + 1
    for (safety, axioms), count in sorted(runtime_profiles.items()):
        print("RUNTIME_AXIOM_PROFILE " + json.dumps({
            "safety": safety, "axioms": axioms, "declarations": count,
        }, sort_keys=True, separators=(",", ":")))
    print(
        "PASS complete Lean axiom audit "
        f"source_modules={len(modules)} "
        f"import_groups={len(discovery.groups)} "
        f"name_collisions={len(name_collisions)} "
        f"kernel_declarations={discovered_count + len(discovery.runtime)} "
        f"safe_declarations={discovered_count} "
        f"safe_library_declarations={discovered_count - len(executable_safe)} "
        f"safe_executable_declarations={len(executable_safe)} "
        f"runtime_declarations={len(discovery.runtime)} "
        f"partial_runtime_declarations={len(discovery.partial)} "
        f"unsafe_runtime_declarations={len(discovery.runtime) - len(discovery.partial)} "
        f"modules={len(audit_paths)} declarations={len(inventory)} "
        f"empty={empty} propext_only={propext} "
        f"quotient_dependent={sum('Quot.sound' in a for a in discovery.safe.values())} "
        f"required={len(REQUIRED_DECLARATIONS)} "
        f"public_exports={len(public_exports)}"
    )


if __name__ == "__main__":
    try:
        main()
    except (KeyError, OSError, ValueError, subprocess.CalledProcessError) as error:
        raise SystemExit(f"axiom audit failed: {error}") from None
