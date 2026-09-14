#!/usr/bin/env python3
"""Validate the public paper, source inventory, artifacts and exact-source proof evidence."""

from __future__ import annotations

import argparse
import ast
from datetime import datetime, timezone
import hashlib
import importlib.metadata
import json
import os
import re
import shutil
import struct
import subprocess
import sys
import xml.etree.ElementTree as ET
from pathlib import Path, PurePosixPath

sys.dont_write_bytecode = True
from build_paper import (
    PAPER_TITLE,
    PAPER_PDF,
    PDF_SUBJECT,
    PDF_ATTRIBUTION,
    REFERENCE_SOURCE,
    SOURCE_DATE_EPOCH,
    UNIFIED_MARKDOWN,
    UNIFIED_TEMPLATE,
    assert_tagged_pdf,
    unified_markdown_manuscript,
)
from check_paper_claims import (
    REQUIRED_HEADINGS as REQUIRED_PAPER_HEADINGS,
    main as check_paper_claims,
)
from toolchain_lock import parse_lock
from local_workspace import LocalWorkspace
from replay_scope import complete_public_replay_scope


ROOT = Path(__file__).resolve().parents[1]
PACKAGE_TITLE = PAPER_TITLE
PACKAGE_REPOSITORY = (
    "https://github.com/cstrawberry/predictive-universe/tree/main/"
    "docs/paper/related/pure_s_universality"
)
REQUIREMENTS = ROOT / "requirements.txt"
DIGEST_MANIFEST = ROOT / "SHA256SUMS"
FORMALIZATION_ROOT = ROOT / "formalization"
FORMALIZATION_INVENTORY = FORMALIZATION_ROOT / "FILES"
FORMALIZATION_EVIDENCE_LOGS = frozenset(
    {"BUILD_LOG.txt", "KERNEL_REPLAY_LOG.txt", "LEAN4LEAN_REPLAY_LOG.txt"}
)

LEAN4CHECKER_FRESH_ROOTS = (
    "Demo",
    "PureSFormal.AxiomAudit",
    "PureSFormal.StrongMultiwayUniversalityAudit",
    "PureSFormal.WeakPathUniversalityAudit",
    "PureSFormal.EvaluatorBoundsAudit",
    "PureSFormal.ChallengeAudit",
    "PureSFormal.RootResetChallengeAudit",
    "PureSFormal.PureS.CheckpointExclusionAudit",
    "PureSFormal.PureS.CountedCheckpointDecoderAudit",
    "PureSFormal.PureS.ControllerTrajectoryAudit",
    "PureSFormal.PureS.EncoderSizeAudit",
    "PureSFormal.PureS.SchedulerStageAssemblyAudit",
    "PureSFormal.PureS.ControllerProjectionAudit",
    "PureSFormal.Cook.CTSAudit",
    "PureSFormal.Computation.DeterministicTapeCounterCompilerAudit",
    "PureSFormal.Computation.DeterministicTapeTrajectoryDecoderAudit",
    "PureSFormal.Computation.DeterministicTapeThreeCounterCompilerAudit",
    "PureSFormal.Computation.ThreeCounterTagAudit",
    "PureSFormal.Computation.LegacyCompilerGrowthAudit",
    "PureSFormal.Computation.DeterministicTapeCookAudit",
    "PureSFormal.Computation.DeterministicTapeCodeAudit",
    "PureSFormal.Computation.DeterministicTapePureSAudit",
    "PureSFormal.Computation.DeterministicTapePureSComputabilityAudit",
    "PureSFormal.Computation.FixedEndpointUniformityAudit",
    "PureSFormal.Computation.PartialRecursiveAudit",
    "PureSFormal.Computation.PrimitiveRecursiveAudit",
    "PureSFormal.Computation.RogozhinT2CorrectnessAudit",
    "PureSFormal.PureS.ParentLinkedControllerAudit",
    "PureSFormal.Research.RootResetDeletionGadgetAudit",
    "PureSFormal.Research.RootResetEulerWalkerAudit",
    "PureSFormal.Research.RootResetCarrierBoundaryGrammarAudit",
    "PureSFormal.Research.RootResetStageRegistryAudit",
    "PureSFormal.Research.RootResetDispatcherNodeStagesAudit",
    "PureSFormal.Research.RootResetAppenderStagesAudit",
    "PureSFormal.Research.RootResetReachableStageGrammarAudit",
    "PureSFormal.Research.RootResetAccumulatorClassifierAudit",
    "PureSFormal.Research.RootResetWholeStageClassifierAudit",
    "PureSFormal.Research.RootResetWholeAppenderStagesAudit",
    "PureSFormal.Research.RootResetWholeDispatcherStagesAudit",
    "PureSFormal.Research.RootResetDispatcherSelectedHandoffAudit",
    "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoffAudit",
    "PureSFormal.Research.RootResetResponseBoundaryStagesAudit",
    "PureSFormal.Research.RootResetClockFuelStagesAudit",
    "PureSFormal.Research.RootResetClockFuelCanonicalGrammarAudit",
    "PureSFormal.Research.RootResetClockFuelCanonicalTransitionsAudit",
    "PureSFormal.Research.RootResetCompositeStageRegistryAudit",
    "PureSFormal.Research.RootResetTwentySevenStageRegistryAudit",
    "PureSFormal.Research.RootResetProgressWalkerAudit",
    "PureSFormal.Research.RootResetProgressCompletenessAudit",
    "PureSFormal.Research.RootResetProgressTotalityAudit",
    "PureSFormal.Research.RootResetProgressEulerSelectorAudit",
    "PureSFormal.Research.RootResetProgressEulerTotalityAudit",
    "PureSFormal.Research.RootResetProgressEulerContractAudit",
    "PureSFormal.Research.RootResetSuccessfulEdgeMovesAudit",
    "PureSFormal.Research.RootResetPersistentInitialBridgeAudit",
    "PureSFormal.CostModel.SharedCostTheoremAudit",
    "PureSFormal.CostModel.UnifiedResourceLedgerAudit",
    "PureSFormal.CostModel.PointerWordCostAudit",
    "PureSFormal.CostModel.SharedImplementationAudit",
    "PureSFormal.Research.ProtectedTrieBoundedTerminalAudit",
    "PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessityAudit",
    "PureSFormal.Research.ProtectedTrieObserverBoundaryAudit",
    "PureSFormal.Research.ProtectedTrieFairnessAudit",
    "PureSFormal.Research.ProtectedTrieFairStreamAudit",
    "PureSFormal.Research.ProtectedTrieCertificateEnumerationAudit",
    "PureSFormal.Research.ProtectedTrieConfluenceObstructionAudit",
    "PureSFormal.Research.ProtectedPrefixGeneratorCalibrationAudit",
    "PureSFormal.PublicAudit",
    "PureSFormal.DefinitionAgreementAudit",
    "PureSFormal.DefinitionAgreement",
    "PureSFormal.Compatibility",
)

LEAN4LEAN_SCOPED_MODULES = (
    "PureSFormal.StrongMultiwayUniversality",
    "PureSFormal.WeakPathUniversality",
    "PureSFormal.EvaluatorBounds",
    "PureSFormal.Challenge",
    "PureSFormal.Computation.DeterministicTapeCounterCompiler",
    "PureSFormal.Computation.DeterministicTapeTrajectoryDecoder",
    "PureSFormal.Computation.ThreeCounter",
    "PureSFormal.Computation.DeterministicTapeThreeCounterCompiler",
    "PureSFormal.Computation.ThreeCounterTag",
    "PureSFormal.Computation.LegacyCompilerGrowth",
    "PureSFormal.Computation.DeterministicTapeCook",
    "PureSFormal.Computation.DeterministicTapeCode",
    "PureSFormal.Computation.DeterministicTapePureS",
    "PureSFormal.Computation.DeterministicTapePureSComputability",
    "PureSFormal.Computation.FixedEndpointUniformity",
    "PureSFormal.Computation.PartialRecursive",
    "PureSFormal.Computation.PrimitiveRecursive",
    "PureSFormal.PureS.CountedCheckpointDecoder",
    "PureSFormal.PureS.EncoderSize",
    "PureSFormal.PureS.ParentLinkedController",
    "PureSFormal.Research.RootResetSelectorContract",
    "PureSFormal.Research.RootResetEulerWalker",
    "PureSFormal.Research.RootResetCarrierBoundaryGrammar",
    "PureSFormal.Research.RootResetStageRegistry",
    "PureSFormal.Research.RootResetDispatcherNodeStages",
    "PureSFormal.Research.RootResetAppenderStages",
    "PureSFormal.Research.RootResetReachableStageGrammar",
    "PureSFormal.Research.RootResetAccumulatorClassifier",
    "PureSFormal.Research.RootResetWholeStageClassifier",
    "PureSFormal.Research.RootResetWholeAppenderStages",
    "PureSFormal.Research.RootResetWholeDispatcherStages",
    "PureSFormal.Research.RootResetDispatcherSelectedHandoff",
    "PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff",
    "PureSFormal.Research.RootResetResponseBoundaryStages",
    "PureSFormal.Research.RootResetClockFuelStages",
    "PureSFormal.Research.RootResetClockFuelCanonicalGrammar",
    "PureSFormal.Research.RootResetClockFuelCanonicalTransitions",
    "PureSFormal.Research.RootResetCompositeStageRegistry",
    "PureSFormal.Research.RootResetTwentySevenStageRegistry",
    "PureSFormal.Research.RootResetProgressWalker",
    "PureSFormal.Research.RootResetProgressCompleteness",
    "PureSFormal.Research.RootResetProgressTotality",
    "PureSFormal.Research.RootResetProgressEulerSelector",
    "PureSFormal.Research.RootResetProgressEulerTotality",
    "PureSFormal.Research.RootResetProgressEulerContract",
    "PureSFormal.Research.RootResetSuccessfulEdgeMoves",
    "PureSFormal.Research.RootResetPersistentInitialBridge",
    "PureSFormal.Research.ProtectedTrieStrongTheorem",
    "PureSFormal.Research.ProtectedTrieSimplePath",
    "PureSFormal.Research.ProtectedTrieSubdivision",
    "PureSFormal.Research.ProtectedTrieWholeObserverExactCost",
    "PureSFormal.Research.ProtectedTrieTableauExactCost",
    "PureSFormal.Research.ProtectedTrieTableauExactResource",
    "PureSFormal.Research.ProtectedTrieMachineAgreement",
    "PureSFormal.Research.ProtectedTrieConfluence",
    "PureSFormal.Research.ProtectedTrieConfluenceObstruction",
    "PureSFormal.CostModel.SharedCostTheorem",
    "PureSFormal.CostModel.UnifiedResourceLedger",
    "PureSFormal.CostModel.PointerWordCost",
    "PureSFormal.CostModel.FiniteArenaMachine",
    "PureSFormal.CostModel.DAGLocalObserver",
    "PureSFormal.Research.ProtectedTrieBoundedTerminal",
    "PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity",
    "PureSFormal.Research.ProtectedTrieObserverBoundary",
    "PureSFormal.Research.ProtectedTrieFairness",
    "PureSFormal.Research.ProtectedTrieFairStream",
    "PureSFormal.Research.ProtectedTrieCertificateEnumeration",
    "PureSFormal.Research.ProtectedPrefixGeneratorCalibration",
    "PureSFormal.Public",
    "PureSFormal.DefinitionAgreement",
)

# Inventory generation must be able to register a newly imported public module
# before resolving its replay closure. All checking/import modes still require
# the existing inventory; the write-only branch validates the new closure below.
if not (__name__ == "__main__" and "--write-formalization-inventory" in sys.argv):
    LEAN4CHECKER_FRESH_ROOTS, LEAN4LEAN_SCOPED_MODULES = complete_public_replay_scope(
        FORMALIZATION_ROOT,
        tuple(FORMALIZATION_INVENTORY.read_text(encoding="utf-8").splitlines()),
        LEAN4CHECKER_FRESH_ROOTS,
        LEAN4LEAN_SCOPED_MODULES,
    )

REQUIRED_FORMALIZATION_FILES = (
    "BUILD_LOG.txt",
    "KERNEL_REPLAY_LOG.txt",
    "LEAN4LEAN_REPLAY_LOG.txt",
    "Makefile",
    "Demo.lean",
    "PureSFormal.lean",
    "PureSFormal/Compatibility.lean",
    "PureSFormal/StrongMultiwayUniversality.lean",
    "PureSFormal/StrongMultiwayUniversalityAudit.lean",
    "PureSFormal/WeakPathUniversality.lean",
    "PureSFormal/WeakPathUniversalityAudit.lean",
    "PureSFormal/EvaluatorBounds.lean",
    "PureSFormal/EvaluatorBoundsAudit.lean",
    "PureSFormal/Challenge.lean",
    "PureSFormal/ChallengeAudit.lean",
    "PureSFormal/RootResetChallenge.lean",
    "PureSFormal/RootResetChallengeAudit.lean",
    "PureSFormal/Computation/PrimitiveRecursive.lean",
    "PureSFormal/Computation/PrimitiveRecursiveAudit.lean",
    "PureSFormal/Computation/PartialRecursive.lean",
    "PureSFormal/Computation/PartialRecursiveAudit.lean",
    "PureSFormal/Computation/DeterministicTapeCode.lean",
    "PureSFormal/Computation/DeterministicTapeCodeAudit.lean",
    "PureSFormal/Computation/FixedEndpointUniformity.lean",
    "PureSFormal/Computation/FixedEndpointUniformityAudit.lean",
    "PureSFormal/Computation/DeterministicTapeCounterCompiler.lean",
    "PureSFormal/Computation/DeterministicTapeCounterCompilerAudit.lean",
    "PureSFormal/Computation/DeterministicTapeTrajectoryDecoder.lean",
    "PureSFormal/Computation/DeterministicTapeTrajectoryDecoderAudit.lean",
    "PureSFormal/Computation/ThreeCounter.lean",
    "PureSFormal/Computation/DeterministicTapeThreeCounterCompiler.lean",
    "PureSFormal/Computation/DeterministicTapeThreeCounterCompilerAudit.lean",
    "PureSFormal/Computation/ThreeCounterTag.lean",
    "PureSFormal/Computation/ThreeCounterTagAudit.lean",
    "PureSFormal/Computation/LegacyCompilerGrowth.lean",
    "PureSFormal/Computation/LegacyCompilerGrowthAudit.lean",
    "PureSFormal/Computation/DeterministicTapeCook.lean",
    "PureSFormal/Computation/DeterministicTapeCookAudit.lean",
    "PureSFormal/Computation/DeterministicTapePureS.lean",
    "PureSFormal/Computation/DeterministicTapePureSAudit.lean",
    "PureSFormal/Computation/DeterministicTapePureSComputability.lean",
    "PureSFormal/Computation/DeterministicTapePureSComputabilityAudit.lean",
    "PureSFormal/PureS/ParentLinkedController.lean",
    "PureSFormal/PureS/ParentLinkedControllerAudit.lean",
    "PureSFormal/PureS/CountedCheckpointDecoder.lean",
    "PureSFormal/PureS/CountedCheckpointDecoderAudit.lean",
    "PureSFormal/PureS/EncoderSize.lean",
    "PureSFormal/PureS/EncoderSizeAudit.lean",
    "PureSFormal/Public.lean",
    "PureSFormal/PublicAudit.lean",
    "PureSFormal/CostModel/TreeBounds.lean",
    "PureSFormal/CostModel/SharedArena.lean",
    "PureSFormal/CostModel/SharedDevelopment.lean",
    "PureSFormal/CostModel/ConcreteContraction.lean",
    "PureSFormal/CostModel/EdgeCopy.lean",
    "PureSFormal/CostModel/Privatization.lean",
    "PureSFormal/CostModel/PathLift.lean",
    "PureSFormal/CostModel/Allocation.lean",
    "PureSFormal/CostModel/SharedCostTheorem.lean",
    "PureSFormal/CostModel/SharedCostTheoremAudit.lean",
    "PureSFormal/CostModel/UnifiedResourceLedger.lean",
    "PureSFormal/CostModel/UnifiedResourceLedgerAudit.lean",
    "PureSFormal/CostModel/PointerWordCost.lean",
    "PureSFormal/CostModel/PointerWordCostAudit.lean",
    "PureSFormal/CostModel/FiniteArenaMachine.lean",
    "PureSFormal/CostModel/DAGLocalObserver.lean",
    "PureSFormal/CostModel/SharedImplementationAudit.lean",
    "PureSFormal/CostModel/SharedImplementationTest.lean",
    "PureSFormal/Research/RootResetDeletionGadget.lean",
    "PureSFormal/Research/RootResetDeletionGadgetAudit.lean",
    "PureSFormal/Research/RootResetSelectorContract.lean",
    "PureSFormal/Research/RootResetEulerWalker.lean",
    "PureSFormal/Research/RootResetEulerWalkerAudit.lean",
    "PureSFormal/Research/RootResetProgressRoles.lean",
    "PureSFormal/Research/RootResetProgressSpine.lean",
    "PureSFormal/Research/RootResetProgressWalker.lean",
    "PureSFormal/Research/RootResetProgressWalkerAudit.lean",
    "PureSFormal/Research/RootResetProgressCompleteness.lean",
    "PureSFormal/Research/RootResetProgressCompletenessAudit.lean",
    "PureSFormal/Research/RootResetProgressTotality.lean",
    "PureSFormal/Research/RootResetProgressTotalityAudit.lean",
    "PureSFormal/Research/RootResetProgressEulerSelector.lean",
    "PureSFormal/Research/RootResetProgressEulerSelectorAudit.lean",
    "PureSFormal/Research/RootResetProgressEulerTotality.lean",
    "PureSFormal/Research/RootResetProgressEulerTotalityAudit.lean",
    "PureSFormal/Research/RootResetProgressEulerContract.lean",
    "PureSFormal/Research/RootResetProgressEulerContractAudit.lean",
    "PureSFormal/Research/RootResetSuccessfulEdgeMoves.lean",
    "PureSFormal/Research/RootResetSuccessfulEdgeMovesAudit.lean",
    "PureSFormal/Research/RootResetPersistentInitialBridge.lean",
    "PureSFormal/Research/RootResetPersistentInitialBridgeAudit.lean",
    "PureSFormal/Research/RootResetBoundedDepthObstruction.lean",
    "PureSFormal/Research/RootResetBoundedDepthObstructionAudit.lean",
    "PureSFormal/Research/RootResetCarrierBoundaryGrammar.lean",
    "PureSFormal/Research/RootResetCarrierBoundaryGrammarAudit.lean",
    "PureSFormal/Research/RootResetStageRegistry.lean",
    "PureSFormal/Research/RootResetStageRegistryAudit.lean",
    "PureSFormal/Research/RootResetDispatcherNodeStages.lean",
    "PureSFormal/Research/RootResetDispatcherNodeStagesAudit.lean",
    "PureSFormal/Research/RootResetAppenderStages.lean",
    "PureSFormal/Research/RootResetAppenderStagesAudit.lean",
    "PureSFormal/Research/RootResetReachableStageGrammar.lean",
    "PureSFormal/Research/RootResetReachableStageGrammarAudit.lean",
    "PureSFormal/Research/RootResetAccumulatorClassifier.lean",
    "PureSFormal/Research/RootResetAccumulatorClassifierAudit.lean",
    "PureSFormal/Research/RootResetWholeStageClassifier.lean",
    "PureSFormal/Research/RootResetWholeStageClassifierAudit.lean",
    "PureSFormal/Research/RootResetWholeAppenderStages.lean",
    "PureSFormal/Research/RootResetWholeAppenderStagesAudit.lean",
    "PureSFormal/Research/RootResetWholeDispatcherStages.lean",
    "PureSFormal/Research/RootResetWholeDispatcherStagesAudit.lean",
    "PureSFormal/Research/RootResetDispatcherSelectedHandoff.lean",
    "PureSFormal/Research/RootResetDispatcherSelectedHandoffAudit.lean",
    "PureSFormal/Research/RootResetWholeDispatcherSelectedHandoff.lean",
    "PureSFormal/Research/RootResetWholeDispatcherSelectedHandoffAudit.lean",
    "PureSFormal/Research/RootResetResponseBoundaryStages.lean",
    "PureSFormal/Research/RootResetResponseBoundaryStagesAudit.lean",
    "PureSFormal/Research/RootResetClockFuelStages.lean",
    "PureSFormal/Research/RootResetClockFuelStagesAudit.lean",
    "PureSFormal/Research/RootResetClockFuelCanonicalGrammar.lean",
    "PureSFormal/Research/RootResetClockFuelCanonicalGrammarAudit.lean",
    "PureSFormal/Research/RootResetClockFuelCanonicalTransitions.lean",
    "PureSFormal/Research/RootResetClockFuelCanonicalTransitionsAudit.lean",
    "PureSFormal/Research/RootResetCompositeStageRegistry.lean",
    "PureSFormal/Research/RootResetCompositeStageRegistryAudit.lean",
    "PureSFormal/Research/RootResetTwentySevenStageRegistry.lean",
    "PureSFormal/Research/RootResetTwentySevenStageRegistryAudit.lean",
    "PureSFormal/WeakPathPolynomialCost.lean",
    "PureSFormal/WeakPathPolynomialCostAudit.lean",
    "PureSFormal/Research/ProtectedTrieAlgebra.lean",
    "PureSFormal/Research/ProtectedTrieParser.lean",
    "PureSFormal/Research/ProtectedTrieEnumeration.lean",
    "PureSFormal/Research/ProtectedTrieSingleOpening.lean",
    "PureSFormal/Research/ProtectedTrieBuild.lean",
    "PureSFormal/Research/ProtectedTrieCertificates.lean",
    "PureSFormal/Research/ProtectedTrieConfluence.lean",
    "PureSFormal/Research/ProtectedTrieConfluenceObstruction.lean",
    "PureSFormal/Research/ProtectedTrieConfluenceObstructionAudit.lean",
    "PureSFormal/Research/ProtectedTrieConfigurationQuotient.lean",
    "PureSFormal/Research/ProtectedTrieCurrentTermObserverNecessity.lean",
    "PureSFormal/Research/ProtectedTrieCurrentTermObserverNecessityAudit.lean",
    "PureSFormal/Research/ProtectedTrieObserverBoundary.lean",
    "PureSFormal/Research/ProtectedTrieObserverBoundaryAudit.lean",
    "PureSFormal/Research/ProtectedTrieFairness.lean",
    "PureSFormal/Research/ProtectedTrieFairnessAudit.lean",
    "PureSFormal/Research/ProtectedTrieFairStream.lean",
    "PureSFormal/Research/ProtectedTrieFairStreamAudit.lean",
    "PureSFormal/Research/ProtectedTrieCertificateEnumeration.lean",
    "PureSFormal/Research/ProtectedTrieCertificateEnumerationAudit.lean",
    "PureSFormal/Research/ProtectedPrefixGeneratorCalibration.lean",
    "PureSFormal/Research/ProtectedPrefixGeneratorCalibrationAudit.lean",
    "PureSFormal/Research/ProtectedTrieDeterministicCompiler.lean",
    "PureSFormal/Research/ProtectedTrieExecutableSchedule.lean",
    "PureSFormal/Research/ProtectedTrieExecutableScheduleAudit.lean",
    "PureSFormal/Research/ProtectedTrieExecutableScheduleFixture.lean",
    "PureSFormal/Research/ProtectedTrieExecutableScheduleStrong.lean",
    "PureSFormal/Research/ProtectedTrieExecutableScheduleStrongAudit.lean",
    "PureSFormal/Research/ProtectedTrieBoundedTerminal.lean",
    "PureSFormal/Research/ProtectedTrieBoundedTerminalAudit.lean",
    "PureSFormal/Research/ProtectedTrieLabelSemantics.lean",
    "PureSFormal/Research/ProtectedTrieSemanticBridgeAudit.lean",
    "PureSFormal/Research/ProtectedTrieStrongCompleteness.lean",
    "PureSFormal/Research/FiniteBranchBinaryCompiler.lean",
    "PureSFormal/Research/FiniteBranchBinaryMachineCompiler.lean",
    "PureSFormal/Research/ProtectedTrieEncoderSize.lean",
    "PureSFormal/Research/ProtectedTrieFinitePrefix.lean",
    "PureSFormal/Research/ProtectedTrieLabelledObserver.lean",
    "PureSFormal/Research/ProtectedTrieObserverNecessity.lean",
    "PureSFormal/Research/ProtectedTrieObserverNecessityAudit.lean",
    "PureSFormal/Research/ProtectedTrieMachine.lean",
    "PureSFormal/Research/ProtectedTrieMachineAgreement.lean",
    "PureSFormal/Research/ProtectedTrieMachineCode.lean",
    "PureSFormal/Research/ProtectedTrieMonotoneBuild.lean",
    "PureSFormal/Research/ProtectedTriePrefixBuild.lean",
    "PureSFormal/Research/ProtectedTrieProjection.lean",
    "PureSFormal/Research/ProtectedTrieSeed.lean",
    "PureSFormal/Research/ProtectedTrieSimplePath.lean",
    "PureSFormal/Research/ProtectedTrieStrong.lean",
    "PureSFormal/Research/ProtectedTrieStrongTheorem.lean",
    "PureSFormal/Research/ProtectedTrieStrongTheoremAudit.lean",
    "PureSFormal/Research/ProtectedTrieSubdivision.lean",
    "PureSFormal/Research/ProtectedTrieSubdivisionMeasure.lean",
    "PureSFormal/Research/ProtectedTrieTableau.lean",
    "PureSFormal/Research/ProtectedTrieTableauExactCost.lean",
    "PureSFormal/Research/ProtectedTrieTableauExactCostAudit.lean",
    "PureSFormal/Research/ProtectedTrieTableauExactResource.lean",
    "PureSFormal/Research/ProtectedTrieTableauExactResourceAudit.lean",
    "PureSFormal/Research/ProtectedTrieTableauLabel.lean",
    "PureSFormal/Research/ProtectedTrieTableauLabelAudit.lean",
    "PureSFormal/Research/ProtectedTrieWholeObserverExactCost.lean",
    "PureSFormal/PureS/MutationFreePeriodicity.lean",
    "PureSFormal/PureS/MutationFreePeriodicityAudit.lean",
    "generated/public_theorem_signatures.md",
    "lake-manifest.json",
    "lakefile.toml",
    "lean-toolchain",
    "scripts/audit_all_axioms.py",
    "scripts/audit_axioms.py",
    "scripts/audit_public_declarations.py",
    "scripts/audit_sources.py",
    "scripts/check_public_signatures.py",
    "scripts/check_toolchain.py",
    "scripts/run_audit.py",
    "scripts/lean_python_differential.lean",
)
FORBIDDEN_FORMALIZATION_PARTS = frozenset(
    {".git", ".lake", "__pycache__", "lake-packages"}
)
FORBIDDEN_FORMALIZATION_SUFFIXES = frozenset(
    {".a", ".c", ".ilean", ".o", ".olean", ".pyc", ".pyo", ".so"}
)
FORBIDDEN_PACKAGE_PARTS = frozenset(
    {
        ".agents",
        ".codex",
        ".git",
        ".lake",
        ".work",
        "research",
        "review-evidence",
        "verification-evidence",
        "sidecars",
        ".mypy_cache",
        ".pytest_cache",
        ".ruff_cache",
        ".venv",
        "__pycache__",
        "node_modules",
    }
)
FORBIDDEN_PACKAGE_NAMES = frozenset({".DS_Store", "Thumbs.db", "CHALLENGE_COMPLETION_PLAN.md", "LIVE_STATUS.md"})
FORBIDDEN_PACKAGE_SUFFIXES = frozenset(
    {
        ".7z",
        ".a",
        ".bz2",
        ".gz",
        ".ilean",
        ".o",
        ".olean",
        ".pyc",
        ".pyo",
        ".rar",
        ".so",
        ".swo",
        ".swp",
        ".tar",
        ".temp",
        ".tgz",
        ".tmp",
        ".xz",
        ".zip",
    }
)


def canonical_json(value: object) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def pinned_python_dependencies() -> dict[str, str]:
    require(REQUIREMENTS.is_file(), "requirements.txt is missing")
    lock = parse_lock()
    dependencies: dict[str, str] = {}
    for line_number, raw_line in enumerate(
        REQUIREMENTS.read_text(encoding="utf-8").splitlines(), start=1
    ):
        line = raw_line.split("#", 1)[0].strip()
        if not line:
            continue
        match = re.fullmatch(
            r"([A-Za-z0-9_.-]+)==([^\s]+) --hash=sha256:([0-9a-f]{64})",
            line,
        )
        require(match is not None,
            f"requirements.txt:{line_number} must be an exact name==version pin "
            "with one lowercase SHA-256 wheel hash")
        assert match is not None
        name, version, wheel_digest = match.groups()
        require(
            name == name.strip()
            and version == version.strip()
            and bool(name)
            and bool(version),
            f"requirements.txt:{line_number} has an empty pin",
        )
        require(name not in dependencies, f"duplicate dependency pin: {name}")
        dependencies[name] = version
        if name.casefold() == "pypdf":
            require(version == lock["pypdf"],
                "requirements.txt pypdf version differs from TOOLCHAIN.lock")
            require(wheel_digest == lock["pypdf-wheel-sha256"],
                "requirements.txt pypdf wheel hash differs from TOOLCHAIN.lock")
    require(dependencies, "requirements.txt contains no dependency pins")
    return dependencies


def required_tex_resources() -> tuple[str, ...]:
    core = {
        "amsmath.sty",
        "amssymb.sty",
        "array.sty",
        "babel.sty",
        "booktabs.sty",
        "calc.sty",
        "etoolbox.sty",
        "fancyvrb.sty",
        "geometry.sty",
        "iftex.sty",
        "lmodern.sty",
        "longtable.sty",
        "unicode-math.sty",
        "xcolor.sty",
    }
    header = (ROOT / "paper" / "header.tex").read_text(encoding="utf-8")
    for match in re.finditer(r"\\usepackage(?:\[[^]]*\])?\{([^}]+)\}", header):
        core.update(f"{name.strip()}.sty" for name in match.group(1).split(","))
    return tuple(sorted(core))


def dependency_errors(*, python_packages: bool, build_tools: bool) -> list[str]:
    errors: list[str] = []
    if not __debug__:
        errors.append(
            "Python assertions are disabled; verification requires an interpreter "
            "without -O or PYTHONOPTIMIZE"
        )
    if sys.version_info < (3, 11):
        errors.append(
            f"Python 3.11 or later is required; found {sys.version.split()[0]}"
        )

    if python_packages:
        for name, expected in pinned_python_dependencies().items():
            try:
                installed = importlib.metadata.version(name)
            except importlib.metadata.PackageNotFoundError:
                errors.append(
                    f"Python package {name}=={expected} is not installed"
                )
                continue
            if installed != expected:
                errors.append(
                    f"Python package {name}=={expected} is required; found {installed}"
                )

    if build_tools:
        for command in ("pandoc", "kpsewhich"):
            if shutil.which(command) is None:
                errors.append(f"required executable is not on PATH: {command}")

        if shutil.which("xelatex") is None and shutil.which("xetex") is None:
            errors.append("required executable is not on PATH: xelatex or xetex")

        if shutil.which("kpsewhich") is not None:
            format_path = subprocess.run(
                ["kpsewhich", "xelatex.fmt"],
                check=False,
                capture_output=True,
                text=True,
            ).stdout.strip()
            if not format_path and shutil.which("xetex") is None:
                errors.append(
                    "xelatex.fmt is absent and the xetex fallback executable "
                    "is not on PATH"
                )
            tex_roots = (
                Path("/usr/share/texlive/texmf-dist/tex"),
                Path("/usr/share/texmf/tex"),
            )
            for resource in required_tex_resources():
                found = subprocess.run(
                    ["kpsewhich", resource],
                    check=False,
                    capture_output=True,
                    text=True,
                ).stdout.strip()
                if not found:
                    found = next(
                        (
                            str(candidate)
                            for root in tex_roots
                            if root.is_dir()
                            for candidate in root.rglob(resource)
                        ),
                        "",
                    )
                if not found:
                    errors.append(f"required TeX resource was not found: {resource}")
    return errors


def check_dependencies(*, python_packages: bool, build_tools: bool) -> None:
    errors = dependency_errors(
        python_packages=python_packages, build_tools=build_tools
    )
    if errors:
        details = "\n".join(f"  - {error}" for error in errors)
        install = (
            "\nInstall the pinned Python packages with "
            "`python3 -m pip install -r requirements.txt` and install the "
            "listed system tools."
        )
        raise SystemExit(f"FAIL dependency preflight:\n{details}{install}")


def check_authored_source_policy() -> None:
    """Run the existing source-form policy without compiling Lean."""
    subprocess.run(
        [sys.executable, "-B", str(FORMALIZATION_ROOT / "scripts/audit_sources.py")],
        cwd=FORMALIZATION_ROOT,
        check=True,
    )


def validate_formalization_entry(entry: str) -> None:
    path = PurePosixPath(entry)
    require(
        entry and entry == entry.strip(),
        "formalization inventory contains an empty or whitespace-padded entry",
    )
    require(
        re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9._/-]*", entry) is not None,
        f"nonportable formalization inventory path: {entry!r}",
    )
    require(
        not path.is_absolute()
        and path.as_posix() == entry
        and "\\" not in entry
        and all(part not in {"", ".", ".."} for part in path.parts),
        f"unsafe or noncanonical formalization inventory path: {entry!r}",
    )
    require(entry != "FILES", "formalization/FILES must not list itself")
    require(
        not FORBIDDEN_FORMALIZATION_PARTS.intersection(path.parts),
        f"generated or private path is forbidden in formalization/FILES: {entry}",
    )
    require(
        path.suffix not in FORBIDDEN_FORMALIZATION_SUFFIXES,
        f"generated binary is forbidden in formalization/FILES: {entry}",
    )
    require(
        entry != "PLAN.md",
        "formalization/PLAN.md is operational material and must not be published",
    )


def formalization_source_entries(*, require_clean: bool = False) -> tuple[str, ...]:
    require(
        FORMALIZATION_ROOT.is_dir(),
        "formalization source directory is missing",
    )
    build_root = FORMALIZATION_ROOT / ".lake"
    if require_clean:
        require(
            not build_root.exists() and not build_root.is_symlink(),
            "formalization/.lake is a generated cache and must be absent from "
            "the published directory",
        )
    symlinks = [
        path.relative_to(FORMALIZATION_ROOT).as_posix()
        for path in FORMALIZATION_ROOT.rglob("*")
        if path.is_symlink()
        and (
            require_clean
            or not FORBIDDEN_FORMALIZATION_PARTS.intersection(
                path.relative_to(FORMALIZATION_ROOT).parts
            )
        )
    ]
    require(not symlinks, f"formalization contains symbolic links: {symlinks}")

    entries = tuple(
        sorted(
            path.relative_to(FORMALIZATION_ROOT).as_posix()
            for path in FORMALIZATION_ROOT.rglob("*")
            if path.is_file()
            and path != FORMALIZATION_INVENTORY
            and not FORBIDDEN_FORMALIZATION_PARTS.intersection(
                path.relative_to(FORMALIZATION_ROOT).parts
            )
        )
    )
    for entry in entries:
        validate_formalization_entry(entry)
    return entries


def validate_required_formalization_files(entries: tuple[str, ...]) -> None:
    missing_required = set(REQUIRED_FORMALIZATION_FILES) - set(entries)
    require(
        not missing_required,
        "formalization omits required public files: "
        f"{sorted(missing_required)}",
    )
    require(
        any(entry.endswith(".lean") for entry in entries),
        "formalization contains no Lean source",
    )


def formalization_inventory_entries() -> tuple[str, ...]:
    require(
        FORMALIZATION_INVENTORY.is_file(),
        "formalization/FILES is missing; install the public Lean source tree "
        "and its exact inventory before checking the package",
    )
    payload = FORMALIZATION_INVENTORY.read_text(encoding="utf-8")
    require(payload.endswith("\n"), "formalization/FILES needs a final newline")
    entries = tuple(payload.splitlines())
    require(entries, "formalization/FILES is empty")
    require(
        all(entry and entry == entry.strip() for entry in entries),
        "formalization/FILES contains an empty or whitespace-padded entry",
    )
    require(
        entries == tuple(sorted(entries)),
        "formalization/FILES is not bytewise sorted",
    )
    require(
        len(entries) == len(set(entries)),
        "formalization/FILES contains duplicate entries",
    )

    for entry in entries:
        validate_formalization_entry(entry)
    validate_required_formalization_files(entries)
    return entries


def write_formalization_inventory() -> tuple[str, ...]:
    entries = formalization_source_entries()
    validate_required_formalization_files(entries)
    payload = "".join(f"{entry}\n" for entry in entries)
    LocalWorkspace(ROOT).output(FORMALIZATION_INVENTORY).write_text(
        payload, encoding="utf-8", newline="\n"
    )
    return entries


def check_formalization_inventory(*, require_clean: bool = False) -> tuple[str, ...]:
    entries = formalization_inventory_entries()
    expected = set(entries)
    actual = set(formalization_source_entries(require_clean=require_clean))
    missing = expected - actual
    unexpected = actual - expected
    require(not missing, f"missing formalization files: {sorted(missing)}")
    require(not unexpected, f"unlisted formalization files: {sorted(unexpected)}")

    lock = parse_lock()
    require(
        (FORMALIZATION_ROOT / "lean-toolchain").read_text(encoding="utf-8")
        == lock["lean-toolchain"] + "\n",
        "formalization/lean-toolchain differs from TOOLCHAIN.lock",
    )
    lake_manifest = json.loads(
        (FORMALIZATION_ROOT / "lake-manifest.json").read_text(encoding="utf-8")
    )
    require(
        lake_manifest.get("packages") == [],
        "formalization/lake-manifest.json declares external Lake packages",
    )
    require(
        lake_manifest.get("name") == "pure_s_universality",
        "unexpected formalization Lake package name",
    )
    for source in sorted((FORMALIZATION_ROOT / "scripts").glob("*.py")):
        ast.parse(source.read_text(encoding="utf-8"), filename=str(source))
    return entries


def formalization_source_tree_digest(
    entries: tuple[str, ...] | None = None,
) -> str:
    """Digest every replay input while excluding the three output transcripts."""
    if entries is None:
        entries = formalization_inventory_entries()
    digest = hashlib.sha256()
    digest.update(b"formalization-source-tree-v1\0")
    digest.update(FORMALIZATION_INVENTORY.read_bytes())
    digest.update(b"\0")
    for entry in entries:
        if entry in FORMALIZATION_EVIDENCE_LOGS:
            continue
        digest.update(entry.encode("utf-8"))
        digest.update(b"\0")
        digest.update((FORMALIZATION_ROOT / entry).read_bytes())
        digest.update(b"\0")
    return digest.hexdigest()


def package_paths(*, post_verification: bool = False,
                  repository: bool = False) -> tuple[Path, ...]:
    """Scan public files with explicit, root-relative local-output exclusions."""
    require(not ROOT.is_symlink() and not getattr(ROOT, "is_junction", lambda: False)(),
            "publication root is a symbolic link or junction")
    excluded_directories: set[str] = set()
    excluded_files: set[str] = set()
    if post_verification:
        excluded_directories.update({".work", "formalization/.lake"})
    if repository:
        excluded_directories.update({".git", ".work"})
        excluded_files.update({".git", "pure_s_universality_submission.zip"})
    paths: list[Path] = []
    for directory, directories, files in os.walk(ROOT, topdown=True, followlinks=False):
        parent = Path(directory)
        for entry in tuple(directories):
            path = parent / entry
            require(not path.is_symlink() and not getattr(path, "is_junction", lambda: False)(),
                    f"symbolic link or junction in publication tree: {path.relative_to(ROOT)}")
            if path.relative_to(ROOT).as_posix() in excluded_directories:
                directories.remove(entry)
            else:
                paths.append(path)
        for entry in files:
            path = parent / entry
            require(not path.is_symlink() and not getattr(path, "is_junction", lambda: False)(),
                    f"symbolic link or junction in publication tree: {path.relative_to(ROOT)}")
            if path.relative_to(ROOT).as_posix() not in excluded_files:
                paths.append(path)
    return tuple(paths)


def actual_package_files(*, post_verification: bool = False,
                         repository: bool = False) -> set[str]:
    return {
        path.relative_to(ROOT).as_posix()
        for path in package_paths(post_verification=post_verification, repository=repository)
        if path.is_file()
    }


def package_files(*, allow_missing_manifest: bool = False,
                  post_verification: bool = False,
                  repository: bool = False) -> tuple[str, ...]:
    """Return the complete live publication inventory.

    `formalization/FILES` separately pins the formal source subtree.  The
    package-level SHA manifest pins every public regular file, including
    the technical proof transcripts.
    """
    files = tuple(sorted(actual_package_files(
        post_verification=post_verification, repository=repository)))
    check_formalization_inventory(require_clean=not post_verification)
    if not allow_missing_manifest:
        require("SHA256SUMS" in files, "SHA256SUMS is missing")
    return files


PUBLIC_REQUIRED_FILES = frozenset({
        "CITATION.cff",
        "Dockerfile",
        "Makefile",
        "README.md",
        "TOOLCHAIN.lock",
        "TRUSTED_DEFINITIONS.md",
        "VERIFICATION.md",
        "paper.md",
        "paper/unified_template.md",
        "paper/references.md",
        "paper/table_layout.lua",
        "requirements.txt",
        "artifacts/demo_tape_instance.txt",
        "src/checker_provenance.py",
        "src/local_workspace.py",
        "src/check_environment.py",
        "src/replay_receipt.py",
        "src/toolchain_lock.py",
        "src/verify_demo_trace.py",
        "src/verify_root_reset_worked_trace.py",
        "src/verify_deterministic_tape_examples.py",
        "tests/lean/RootResetWorkedTrace.lean",
        "tests/lean/DeterministicTapeSourceExamples.lean",
        "tests/__init__.py",
        "formalization/PureSFormal/StrongMultiwayUniversality.lean",
        "formalization/PureSFormal/StrongMultiwayUniversalityAudit.lean",
        "formalization/PureSFormal/WeakPathUniversality.lean",
        "formalization/PureSFormal/WeakPathUniversalityAudit.lean",
        "formalization/PureSFormal/Challenge.lean",
        "formalization/PureSFormal/ChallengeAudit.lean",
        "formalization/PureSFormal/Computation/DeterministicTapeCounterCompiler.lean",
        "formalization/PureSFormal/Computation/DeterministicTapeCounterCompilerAudit.lean",
        "formalization/PureSFormal/Computation/DeterministicTapeTrajectoryDecoder.lean",
        "formalization/PureSFormal/Computation/DeterministicTapeTrajectoryDecoderAudit.lean",
        "formalization/PureSFormal/Computation/ThreeCounter.lean",
        "formalization/PureSFormal/Computation/DeterministicTapeThreeCounterCompiler.lean",
        "formalization/PureSFormal/Computation/DeterministicTapeThreeCounterCompilerAudit.lean",
        "formalization/PureSFormal/Computation/ThreeCounterTag.lean",
        "formalization/PureSFormal/Computation/ThreeCounterTagAudit.lean",
        "formalization/PureSFormal/Computation/LegacyCompilerGrowth.lean",
        "formalization/PureSFormal/Computation/LegacyCompilerGrowthAudit.lean",
        "formalization/PureSFormal/Computation/DeterministicTapeCook.lean",
        "formalization/PureSFormal/Computation/DeterministicTapeCookAudit.lean",
        "formalization/PureSFormal/Computation/DeterministicTapePureS.lean",
        "formalization/PureSFormal/Computation/DeterministicTapePureSAudit.lean",
        "formalization/PureSFormal/Computation/DeterministicTapePureSComputability.lean",
        "formalization/PureSFormal/Computation/DeterministicTapePureSComputabilityAudit.lean",
        "formalization/PureSFormal/PureS/ParentLinkedController.lean",
        "formalization/PureSFormal/PureS/ParentLinkedControllerAudit.lean",
        "formalization/PureSFormal/CostModel/TreeBounds.lean",
        "formalization/PureSFormal/CostModel/SharedArena.lean",
        "formalization/PureSFormal/CostModel/SharedDevelopment.lean",
        "formalization/PureSFormal/CostModel/ConcreteContraction.lean",
        "formalization/PureSFormal/CostModel/EdgeCopy.lean",
        "formalization/PureSFormal/CostModel/Privatization.lean",
        "formalization/PureSFormal/CostModel/PathLift.lean",
        "formalization/PureSFormal/CostModel/Allocation.lean",
        "formalization/PureSFormal/CostModel/SharedCostTheorem.lean",
        "formalization/PureSFormal/CostModel/SharedCostTheoremAudit.lean",
        "formalization/PureSFormal/CostModel/FiniteArenaMachine.lean",
        "formalization/PureSFormal/CostModel/DAGLocalObserver.lean",
        "formalization/PureSFormal/CostModel/SharedImplementationAudit.lean",
        "formalization/PureSFormal/CostModel/SharedImplementationTest.lean",
        "formalization/PureSFormal/Research/ProtectedTrieConfluenceObstruction.lean",
        "formalization/PureSFormal/Research/RootResetBoundedDepthObstruction.lean",
        "formalization/PureSFormal/Research/RootResetBoundedDepthObstructionAudit.lean",
        "formalization/PureSFormal/Research/RootResetSelectorContract.lean",
        "formalization/PureSFormal/Research/RootResetEulerWalker.lean",
        "formalization/PureSFormal/Research/RootResetEulerWalkerAudit.lean",
        "formalization/PureSFormal/Research/RootResetCarrierBoundaryGrammar.lean",
        "formalization/PureSFormal/Research/RootResetCarrierBoundaryGrammarAudit.lean",
        "formalization/PureSFormal/Research/RootResetStageRegistry.lean",
        "formalization/PureSFormal/Research/RootResetStageRegistryAudit.lean",
        "formalization/PureSFormal/Research/RootResetDispatcherNodeStages.lean",
        "formalization/PureSFormal/Research/RootResetDispatcherNodeStagesAudit.lean",
        "formalization/PureSFormal/Research/RootResetAppenderStages.lean",
        "formalization/PureSFormal/Research/RootResetAppenderStagesAudit.lean",
        "formalization/PureSFormal/Research/RootResetReachableStageGrammar.lean",
        "formalization/PureSFormal/Research/RootResetReachableStageGrammarAudit.lean",
        "formalization/PureSFormal/Research/RootResetAccumulatorClassifier.lean",
        "formalization/PureSFormal/Research/RootResetAccumulatorClassifierAudit.lean",
        "formalization/PureSFormal/Research/RootResetWholeStageClassifier.lean",
        "formalization/PureSFormal/Research/RootResetWholeStageClassifierAudit.lean",
        "formalization/PureSFormal/Research/RootResetWholeAppenderStages.lean",
        "formalization/PureSFormal/Research/RootResetWholeAppenderStagesAudit.lean",
        "formalization/PureSFormal/Research/RootResetWholeDispatcherStages.lean",
        "formalization/PureSFormal/Research/RootResetWholeDispatcherStagesAudit.lean",
        "formalization/PureSFormal/Research/RootResetDispatcherSelectedHandoff.lean",
        "formalization/PureSFormal/Research/RootResetDispatcherSelectedHandoffAudit.lean",
        "formalization/PureSFormal/Research/RootResetWholeDispatcherSelectedHandoff.lean",
        "formalization/PureSFormal/Research/RootResetWholeDispatcherSelectedHandoffAudit.lean",
        "formalization/PureSFormal/Research/RootResetResponseBoundaryStages.lean",
        "formalization/PureSFormal/Research/RootResetResponseBoundaryStagesAudit.lean",
        "formalization/PureSFormal/Research/RootResetClockFuelStages.lean",
        "formalization/PureSFormal/Research/RootResetClockFuelStagesAudit.lean",
        "formalization/PureSFormal/Research/RootResetClockFuelCanonicalGrammar.lean",
        "formalization/PureSFormal/Research/RootResetClockFuelCanonicalGrammarAudit.lean",
        "formalization/PureSFormal/Research/RootResetClockFuelCanonicalTransitions.lean",
        "formalization/PureSFormal/Research/RootResetClockFuelCanonicalTransitionsAudit.lean",
        "formalization/PureSFormal/Research/RootResetCompositeStageRegistry.lean",
        "formalization/PureSFormal/Research/RootResetCompositeStageRegistryAudit.lean",
        "formalization/PureSFormal/Research/RootResetTwentySevenStageRegistry.lean",
        "formalization/PureSFormal/Research/RootResetTwentySevenStageRegistryAudit.lean",
        "formalization/PureSFormal/Research/RootResetProgressCompleteness.lean",
        "formalization/PureSFormal/Research/RootResetProgressCompletenessAudit.lean",
        "formalization/PureSFormal/Research/RootResetProgressTotality.lean",
        "formalization/PureSFormal/Research/RootResetProgressTotalityAudit.lean",
        "formalization/PureSFormal/Research/RootResetProgressEulerSelector.lean",
        "formalization/PureSFormal/Research/RootResetProgressEulerSelectorAudit.lean",
        "formalization/PureSFormal/Research/RootResetProgressEulerTotality.lean",
        "formalization/PureSFormal/Research/RootResetProgressEulerTotalityAudit.lean",
        "formalization/PureSFormal/Research/RootResetProgressEulerContract.lean",
        "formalization/PureSFormal/Research/RootResetProgressEulerContractAudit.lean",
        "formalization/PureSFormal/Research/RootResetSuccessfulEdgeMoves.lean",
        "formalization/PureSFormal/Research/RootResetSuccessfulEdgeMovesAudit.lean",
        "formalization/PureSFormal/WeakPathPolynomialCost.lean",
        "formalization/PureSFormal/WeakPathPolynomialCostAudit.lean",
        "formalization/PureSFormal/Research/ProtectedTrieConfigurationQuotient.lean",
        "formalization/PureSFormal/Research/ProtectedTrieCertificateEnumeration.lean",
        "formalization/PureSFormal/Research/ProtectedTrieCertificateEnumerationAudit.lean",
        "formalization/PureSFormal/Research/ProtectedPrefixGeneratorCalibration.lean",
        "formalization/PureSFormal/Research/ProtectedPrefixGeneratorCalibrationAudit.lean",
        "formalization/PureSFormal/Research/ProtectedTrieCurrentTermObserverNecessity.lean",
        "formalization/PureSFormal/Research/ProtectedTrieCurrentTermObserverNecessityAudit.lean",
        "formalization/PureSFormal/Research/ProtectedTrieDeterministicCompiler.lean",
        "formalization/PureSFormal/Research/ProtectedTrieExecutableSchedule.lean",
        "formalization/PureSFormal/Research/ProtectedTrieExecutableScheduleStrong.lean",
        "formalization/PureSFormal/Research/ProtectedTrieExecutableScheduleStrongAudit.lean",
        "formalization/PureSFormal/Research/ProtectedTrieFairStream.lean",
        "formalization/PureSFormal/Research/ProtectedTrieFairStreamAudit.lean",
        "formalization/PureSFormal/Research/ProtectedTrieBoundedTerminal.lean",
        "formalization/PureSFormal/Research/ProtectedTrieBoundedTerminalAudit.lean",
        "formalization/PureSFormal/Research/ProtectedTrieLabelSemantics.lean",
        "formalization/PureSFormal/Research/ProtectedTrieSemanticBridgeAudit.lean",
        "formalization/PureSFormal/Research/ProtectedTrieStrongCompleteness.lean",
        "formalization/PureSFormal/Research/FiniteBranchBinaryCompiler.lean",
        "formalization/PureSFormal/Research/FiniteBranchBinaryMachineCompiler.lean",
        "formalization/PureSFormal/Research/ProtectedTrieLabelledObserver.lean",
        "formalization/PureSFormal/Research/ProtectedTrieObserverNecessity.lean",
        "formalization/PureSFormal/Research/ProtectedTrieObserverNecessityAudit.lean",
        "formalization/PureSFormal/Research/ProtectedTrieMachineAgreement.lean",
        "formalization/PureSFormal/Research/ProtectedTrieSimplePath.lean",
        "formalization/PureSFormal/Research/ProtectedTrieStrongTheorem.lean",
        "formalization/PureSFormal/Research/ProtectedTrieStrongTheoremAudit.lean",
        "formalization/PureSFormal/Research/ProtectedTrieSubdivision.lean",
        "formalization/PureSFormal/Research/ProtectedTrieTableauExactCost.lean",
        "formalization/PureSFormal/Research/ProtectedTrieTableauExactResource.lean",
        "formalization/PureSFormal/Research/ProtectedTrieTableauExactResourceAudit.lean",
        "formalization/PureSFormal/Research/ProtectedTrieWholeObserverExactCost.lean",
        "formalization/generated/public_theorem_signatures.md",
        "output/pdf/pure_s_universality.pdf",
        ".dockerignore",
    "verify_files.py",
    "src/build_paper.py",
    "src/check_package.py",
    "src/check_paper_claims.py",
    "src/check_runtime_evidence.py",
    "src/check_formal_continuity.py",
    "src/checker_canary.py",
    "src/grouped_replay.py",
    "src/replay_scope.py",
    "src/verification_runtime.py",
    "src/strict_occurrence.py",
    "src/verify_macros.py",
    "src/verify_focused_cts_macros.py",
    "src/verify_strict_occurrence.py",
    "src/verify_rogozhin_source.py",
    "src/verify_universal_endpoint.py",
    "src/generate_rogozhin46_cts.py",
    "src/lean_runtime_checks.py",
    "src/windows_verification.py",
    "src/run_formalization.py",
    "tests/test_public_package.py",
    "tests/test_paper_navigation.py",
    "tests/test_runtime_evidence.py",
    "tests/test_formal_continuity.py",
    "evidence/runtime/index.json",
    "evidence/formal/delivery-comparison.json",
    "tests/lean/RootResetRuntimeDifferential.lean",
    "tests/lean/RootResetArbitraryRuntime.lean",
    "tests/lean/RootResetOutputRuntime.lean",
    "artifacts/checkpoint_grammar.json",
    "artifacts/rogozhin46_cook_cts.json",
    "artifacts/rogozhin46_scheduler.json",
})


def check_public_required_files(actual: set[str], *, require_manifest: bool) -> None:
    """Require the shipped public interfaces and their concrete inputs."""
    required = PUBLIC_REQUIRED_FILES | ({"SHA256SUMS"} if require_manifest else set())
    if not require_manifest:
        required -= {"evidence/runtime/index.json", "evidence/formal/delivery-comparison.json"}
    missing = sorted(required - actual)
    require(not missing, f"missing public package files: {missing}")


def check_tree(
    *, allow_missing_manifest: bool = False, evidence_integrity: bool = False,
    windows_profile: Path | None = None,
    post_verification: bool = False,
    repository: bool = False,
) -> None:
    """Validate the paper surface, and source-bound evidence when requested."""
    paths = package_paths(post_verification=post_verification, repository=repository)
    actual = {path.relative_to(ROOT).as_posix() for path in paths if path.is_file()}
    check_public_required_files(actual, require_manifest=evidence_integrity and not allow_missing_manifest)

    check_formalization_inventory(require_clean=evidence_integrity and not post_verification)
    symlinks = [
        path.relative_to(ROOT).as_posix()
        for path in paths
        if path.is_symlink()
        and (
            evidence_integrity
            or not FORBIDDEN_PACKAGE_PARTS.intersection(
                path.relative_to(ROOT).parts
            )
        )
    ]
    require(not symlinks, f"symbolic links must not be packaged: {symlinks}")

    forbidden: list[str] = []
    for path in paths:
        relative = path.relative_to(ROOT)
        if (
            FORBIDDEN_PACKAGE_PARTS.intersection(relative.parts)
            or path.name in FORBIDDEN_PACKAGE_NAMES
            or path.name.endswith("~")
            or (path.is_file() and path.suffix.lower() in FORBIDDEN_PACKAGE_SUFFIXES)
        ):
            forbidden.append(relative.as_posix())
    if evidence_integrity:
        require(not forbidden,
            f"cache, compiled, compressed-bundle, or editor paths must not be published: {forbidden}")

    for source in sorted((ROOT / "src").glob("*.py")):
        ast.parse(source.read_text(encoding="utf-8"), filename=str(source))
    for source in sorted((FORMALIZATION_ROOT / "scripts").glob("*.py")):
        ast.parse(source.read_text(encoding="utf-8"), filename=str(source))

    for stem in ("simulation_pipeline", "carrier_paths"):
        svg = ROOT / "paper" / "figures" / f"{stem}.svg"
        svg_root = ET.fromstring(svg.read_text(encoding="utf-8"))
        require(svg_root.tag.endswith("svg"), f"invalid SVG root: {svg.name}")
        require(svg_root.get("role") == "img", f"missing SVG image role: {svg.name}")
        children = tuple(child.tag.rsplit("}", 1)[-1] for child in svg_root)
        require("title" in children and "desc" in children,
            f"missing SVG text alternative: {svg.name}")
        png = (ROOT / "paper" / "figures" / f"{stem}.png").read_bytes()
        require(png.startswith(b"\x89PNG\r\n\x1a\n"), f"invalid PNG: {stem}.png")
        width, height = struct.unpack(">II", png[16:24])
        require(width >= 1600 and height >= 900, f"undersized PNG: {stem}.png")
        if stem == "simulation_pipeline":
            view_box = tuple(int(value) for value in svg_root.attrib["viewBox"].split())
            require(len(view_box) == 4 and view_box[:2] == (0, 0)
                    and view_box[2] > 0 and view_box[3] > 0,
                "compiler-chain SVG must have a positive origin-zero viewBox")
            require(width * view_box[3] == height * view_box[2],
                "compiler-chain PNG must preserve the SVG viewBox aspect ratio")
            boxes = [node for node in svg_root.iter()
                     if node.tag.rsplit("}", 1)[-1] == "rect" and node.get("rx")]
            rows: dict[int, set[int]] = {}
            for box in boxes:
                rows.setdefault(int(box.attrib["y"]), set()).add(int(box.attrib["x"]))
            require(len(boxes) == 6 and len(rows) == 2
                    and all(len(columns) == 3 for columns in rows.values())
                    and len({tuple(sorted(columns)) for columns in rows.values()}) == 1,
                "compiler-chain SVG must retain two matching rows of three nodes")

    template = UNIFIED_TEMPLATE.read_text(encoding="utf-8")
    paper = UNIFIED_MARKDOWN.read_text(encoding="utf-8")
    require(
        UNIFIED_MARKDOWN.read_bytes()
        == unified_markdown_manuscript().encode("utf-8"),
        "paper.md is stale; run `python3 -B src/build_paper.py --markdown-only`",
    )
    require(template.startswith(f"# {PAPER_TITLE}\n"),
        "unified_template.md has lost the prize-paper title")
    require(paper.startswith(f"# {PAPER_TITLE}\n"),
        "paper.md has lost the prize-paper title")
    require(len(re.findall(r"^# ", paper, flags=re.MULTILINE)) == 1,
        "paper.md must have exactly one level-one title")
    require(re.search(r"\{\{[A-Z0-9_]+\}\}", paper) is None,
        "paper.md retains an assembly token")
    for token in (
        "{{SIG_THEOREM_1}}",
        "{{SIG_THEOREM_2}}",
        "{{SIG_THEOREM_3}}",
        "{{SIG_THEOREM_4}}",
        "{{SIG_THEOREM_5}}",
        "{{PUBLIC_THEOREM_SIGNATURES}}",
        "{{REFERENCES}}",
    ):
        require(template.count(token) == 1,
            f"unified_template.md must contain one assembly slot: {token}")
    for heading in (
        *REQUIRED_PAPER_HEADINGS,
        "### 2.2 Finite selection from the current term",
        "### 4.5 The persistent scheduler used in the proof",
        "### Theorem 1. Exact cyclic-tag trajectories under a fixed persistent-cursor evaluator",
        "### Theorem 1R. Exact computation by a fixed root-restarted finite controller",
        "### Theorem 2. One fixed pure-S endpoint for deterministic Turing-machine halting",
        "### Theorem 3. Exact observation and explicit structural bounds",
        "### 7.2 What the interfaces do",
        "### Theorem 4. Confluence obstruction to exclusive functional decoding",
        "### Theorem 5. Persistent exposure and enumeration of observer-verified histories",
        "### C.9 Observer boundary and resources",
    ):
        require(heading in template,
            f"unified_template.md is missing section: {heading}")
    template_prose = " ".join(template.split())
    for phrase in (
        "| Challenge element | Result in this paper |",
        "| Entry | Notion | Pure-$\\mathbf S$ status |",
        "| Question | Exact status |",
        "| Resource and scope | Unconditional bound |",
        "1,550,394,329",
        "1,140,681,565",
        "indices 18--48:",
        "| 22 | 1 | $(1,011)$ | $(1,011)$ | 17,057 |",
        "no constant-time lookup claim",
        "makes no reachability claim",
        "observer determines which payloads are valid source histories",
        "The cursor path may grow without bound",
        "in a fixed state but does not restart there between contractions.",
        "Every invocation starts at the root in the same initial control",
        "Its temporary control and cursor are discarded.",
        "It receives neither control state nor cursor",
    ):
        require(phrase in template_prose,
            f"unified_template.md is missing required content: {phrase}")
    for declaration in (
        "sCombinatorIsChallengePathUniversal",
        "sCombinatorIsRootResetComputationUniversal",
        "finiteCTSWeakPathUniversality",
        "deterministicTapeHalts_iff_fixedPureSMarkedSnapshotTermEvent",
        "protectedPersistentCertificateEnumeration",
    ):
        require(
            declaration in paper,
            f"assembled paper is missing public declaration: {declaration}",
        )
    for obsolete in (
        "encoded_term = checkpoint_term_0:",
        "tick state  addr   observation command       focus",
        "We found no earlier result establishing",
        "computes `Term.size` incrementally",
        "source-time route has no polynomial upper bound",
        "implementation checks use a shared arena",
        "| start the horizon-one job | 4 |",
        "| build the working term | 7 |",
    ):
        require(obsolete not in template,
            f"unified_template.md retains presentation-heavy text: {obsolete}")
    builder = (ROOT / "src" / "build_paper.py").read_text(encoding="utf-8")
    require('"--toc"' not in builder and '"--table-of-contents"' not in builder,
        "paper build must keep the initial model comparison ahead of any contents list")

    readme = (ROOT / "README.md").read_text(encoding="utf-8")
    require(len(readme.splitlines()) <= 120, "README.md exceeds 120 lines")
    for phrase in (
        PAPER_TITLE,
        "RootResetChallenge.sCombinatorIsRootResetComputationUniversal",
        "python3 -B src/check_package.py",
        "PureSFormal/Public.lean",
    ):
        require(phrase in readme, f"README.md is missing: {phrase}")

    citation = (ROOT / "CITATION.cff").read_text(encoding="utf-8")
    require(f'title: "{PACKAGE_TITLE}"' in citation, "citation title is stale")
    require(
        f'repository-code: "{PACKAGE_REPOSITORY}"' in citation,
        "citation repository-code does not identify the nested package",
    )
    require("date-released: 2026-09-13" in citation,
        "citation publication date is stale")

    toolchain = parse_lock()
    native_profile = None
    if windows_profile is not None:
        from windows_verification import parse_profile
        native_profile = parse_profile(windows_profile, toolchain)
    def checker_identity(name: str, field: str) -> str:
        if native_profile is None:
            return toolchain[f"{name}-{field}"]
        return native_profile.values["checkers"][name][
            "recipe_sha256" if field == "build-recipe-sha256" else "binary_sha256"]
    # The unchanged toolchain epoch pins tool builds; the manuscript has its
    # own later, deterministic publication date, sealed through CITATION.cff.
    publication_date = re.search(r"^date-released: (\d{4}-\d{2}-\d{2})$", citation, re.MULTILINE)
    require(publication_date is not None, "citation has no exact publication date")
    publication_epoch = str(int(datetime.fromisoformat(publication_date.group(1)).replace(tzinfo=timezone.utc).timestamp()))
    require(SOURCE_DATE_EPOCH == publication_epoch,
        "paper builder timestamp differs from the sealed citation date")
    dockerfile = (ROOT / "Dockerfile").read_text(encoding="utf-8")
    for phrase in (
        f"FROM {toolchain['container-base']}@{toolchain['container-base-index-digest']}",
        f"SOURCE_DATE_EPOCH={toolchain['source-date-epoch']}",
        f"ARG LEAN4CHECKER_COMMIT={toolchain['lean4checker-commit']}",
        f"ARG LEAN4LEAN_COMMIT={toolchain['lean4lean-commit']}",
        f"ARG BATTERIES_COMMIT={toolchain['lean4lean-batteries-commit']}",
        f"ARG PYTHON_SOURCE_URL={toolchain['verification-python-source-url']}",
        f"ARG PYTHON_SOURCE_SHA256={toolchain['verification-python-source-sha256']}",
        "PURE_S_CANONICAL_CONTAINER=1",
        "python3 -m pip install --require-hashes",
        "USER verifier",
    ):
        require(phrase in dockerfile,
            f"Dockerfile differs from the strict lock or execution model: {phrase}")
    require("lake build lean4checker" not in dockerfile
            and "lake build lean4lean" not in dockerfile,
        "Dockerfile must retain pristine checker sources, not caller-selectable builds")
    require(toolchain["verification-python"] == "3.12.13",
        "canonical Python version changed")
    require(toolchain["verification-pandoc"] == "3.1.3",
        "canonical Pandoc version changed")
    require(toolchain["verification-pandoc-lua"] == "5.4",
        "canonical Pandoc Lua version changed")
    require(toolchain["verification-xetex"] == "3.141592653-2.6-0.999995",
        "canonical XeTeX version changed")
    require(toolchain["source-date-epoch"] == "1788220800",
        "canonical SOURCE_DATE_EPOCH changed")

    makefile = (ROOT / "Makefile").read_text(encoding="utf-8")
    require("all: check" in makefile and "check:" in makefile
            and "src/check_package.py" in makefile,
        "Makefile must expose the strict public package check by default")
    require("formalization/scripts/run_audit.py" in makefile,
        "Makefile lacks the complete formal audit command")
    require("src/lean_runtime_checks.py" in makefile
            and "src/verify_root_reset_worked_trace.py" in makefile
            and "src/verify_deterministic_tape_examples.py" in makefile,
        "Makefile lacks the public executable examples")
    require("src/build_paper.py --check-pdf" in makefile,
        "Makefile lacks PDF reproduction checking")
    lakefile = (FORMALIZATION_ROOT / "lakefile.toml").read_text(encoding="utf-8")
    require('name = "pure-s-demo"' in lakefile and 'root = "Demo"' in lakefile,
        "formalization/lakefile.toml lacks the pure-s-demo executable")
    docker_commands = re.findall(r"^CMD (.+)$", dockerfile, flags=re.MULTILINE)
    require(len(docker_commands) == 1, "Dockerfile must have one default command")
    require(json.loads(docker_commands[0]) == [
        "python3", "-B", "src/run_formalization.py", "--lake",
        "/opt/elan/toolchains/leanprover--lean4---v4.19.0/bin/lake",
        "--lean4checker-source", "/opt/checker-sources/lean4checker",
        "--lean4lean-source", "/opt/checker-sources/lean4lean",
        "--batteries-source", "/opt/checker-sources/batteries",
    ], "Dockerfile default must perform the full formal build and both supplemental checks")
    runner = (ROOT / "src" / "run_formalization.py").read_text(encoding="utf-8")
    for phrase in (
        "Identifier: verification-cache-free",
        "Identifier: verification-lean4checker-fresh",
        "named verification ",
        "Identifier: verification-lean4lean-scoped",
    ):
        require(phrase in runner,
            f"run_formalization.py is missing verification label: {phrase}")
    for phrase in (
        "--lean4checker-source",
        "--lean4lean-source",
        "--batteries-source",
        "Negative canary: rejected",
        "canonical_receipt_line",
        "ACTIVE_REPLAY_SUMMARY",
        "Checker binary SHA-256 before:",
        "Checker binary SHA-256 after:",
    ):
        require(phrase in runner,
            f"run_formalization.py lacks locked-source provenance: {phrase}")
    if not evidence_integrity:
        return

    source_digest = formalization_source_tree_digest(
        formalization_inventory_entries()
    )
    build_log = (FORMALIZATION_ROOT / "BUILD_LOG.txt").read_text(
        encoding="utf-8"
    )
    for phrase in (
        "Cache-free formalization audit transcript",
        "Precondition: the temporary source copy contained no .lake directory.",
        "Built PureSFormal.CostModel.SharedCostTheoremAudit",
        "Built PureSFormal.CostModel.UnifiedResourceLedgerAudit",
        "Built PureSFormal.CostModel.PointerWordCostAudit",
        "Built PureSFormal.CostModel.SharedImplementationAudit",
        "Built PureSFormal.Research.RootResetProgressWalkerAudit",
        "Built PureSFormal.Research.ProtectedTrieObserverBoundaryAudit",
        "Built PureSFormal.Research.ProtectedTrieFairnessAudit",
        "Built PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessityAudit",
        "Built PureSFormal.Research.ProtectedTrieBoundedTerminalAudit",
        "Built PureSFormal.ChallengeAudit",
        "Built PureSFormal.PublicAudit",
        "Built PureSFormal.Computation.DeterministicTapeCounterCompilerAudit",
        "Built PureSFormal.Computation.DeterministicTapeThreeCounterCompilerAudit",
        "Built PureSFormal.Computation.ThreeCounterTagAudit",
        "Built PureSFormal.Computation.DeterministicTapeCookAudit",
        "Built PureSFormal.Computation.DeterministicTapePureSAudit",
        "Built PureSFormal.Computation.DeterministicTapePureSComputabilityAudit",
        "Built PureSFormal.StrongMultiwayUniversalityAudit",
        "Built Demo",
        "PASS cache-free formalization replay in temporary storage",
    ):
        require(phrase in build_log,
            f"formalization/BUILD_LOG.txt is missing: {phrase}")

    kernel_log = (FORMALIZATION_ROOT / "KERNEL_REPLAY_LOG.txt").read_text(
        encoding="utf-8"
    )
    for phrase in (
        "Lean environment replay transcript",
        f"Checker source commit: {toolchain['lean4checker-commit']}",
        f"Checker source tree: {toolchain['lean4checker-tree']}",
        f"Checker source SHA-256: {toolchain['lean4checker-source-sha256']}",
        f"Checker build-recipe SHA-256: {checker_identity('lean4checker', 'build-recipe-sha256')}",
        "Checker build: clean private export of the locked Git object",
        "Negative canary: rejected",
        f"Checker binary SHA-256 before: {checker_identity('lean4checker', 'binary-sha256')}",
        f"Checker binary SHA-256 after: {checker_identity('lean4checker', 'binary-sha256')}",
        f"Method: fresh-replay {len(LEAN4CHECKER_FRESH_ROOTS)} named verification roots",
        "Each --fresh invocation replays both imported and locally defined declarations",
    ):
        require(phrase in kernel_log,
            f"formalization/KERNEL_REPLAY_LOG.txt is missing: {phrase}")
    if native_profile is None:
        for root in LEAN4CHECKER_FRESH_ROOTS:
            for phase in ("REPLAY", "PASS"):
                phrase = f"{phase} lean4checker --fresh {root}"
                require(phrase in kernel_log,
                    f"formalization/KERNEL_REPLAY_LOG.txt is missing: {phrase}")
        replayed_roots = tuple(re.findall(
            r"^REPLAY lean4checker --fresh (\S+)$", kernel_log, flags=re.MULTILINE
        ))
        passed_roots = tuple(re.findall(
            r"^PASS lean4checker --fresh (\S+)$", kernel_log, flags=re.MULTILINE
        ))
        require(replayed_roots == LEAN4CHECKER_FRESH_ROOTS,
            "kernel replay root inventory or order differs from the verification scope")
        require(passed_roots == LEAN4CHECKER_FRESH_ROOTS,
            "kernel replay PASS inventory or order differs from the verification scope")
    else:
        covered_roots = tuple(re.findall(r"^COVERED lean4checker (\S+)$", kernel_log, re.MULTILINE))
        require(covered_roots == LEAN4CHECKER_FRESH_ROOTS,
                "native grouped replay original coverage or order differs")
        require(re.search(r"^(?:REPLAY|PASS) lean4checker --fresh ", kernel_log, re.MULTILINE) is None,
                "native grouped coverage must not claim separate per-root invocations")
    alternate_log = (
        FORMALIZATION_ROOT / "LEAN4LEAN_REPLAY_LOG.txt"
    ).read_text(encoding="utf-8")
    for module in LEAN4LEAN_SCOPED_MODULES:
        for phase in ("RECHECK", "PASS"):
            phrase = f"{phase} lean4lean {module}"
            require(phrase in alternate_log,
                f"alternate-kernel replay log is missing: {phrase}")
    rechecked_modules = tuple(re.findall(
        r"^RECHECK lean4lean (\S+)$", alternate_log, flags=re.MULTILINE
    ))
    passed_modules = tuple(re.findall(
        r"^PASS lean4lean (\S+)$", alternate_log, flags=re.MULTILINE
    ))
    require(rechecked_modules == LEAN4LEAN_SCOPED_MODULES,
        "alternate replay module inventory or order differs from the verification scope")
    require(passed_modules == LEAN4LEAN_SCOPED_MODULES,
        "alternate replay PASS inventory or order differs from the verification scope")
    for phrase in (
        "Scoped alternate-kernel replay transcript",
        f"Checker source commit: {toolchain['lean4lean-commit']}",
        f"Checker source tree: {toolchain['lean4lean-tree']}",
        f"Checker source SHA-256: {toolchain['lean4lean-source-sha256']}",
        f"Checker dependency commit: {toolchain['lean4lean-batteries-commit']}",
        f"Checker dependency tree: {toolchain['lean4lean-batteries-tree']}",
        f"Checker dependency SHA-256: {toolchain['lean4lean-batteries-source-sha256']}",
        f"Checker build-recipe SHA-256: {checker_identity('lean4lean', 'build-recipe-sha256')}",
        "Checker build: clean private export of the locked Git objects",
        "Negative canary: rejected",
        f"Checker binary SHA-256 before: {checker_identity('lean4lean', 'binary-sha256')}",
        f"Checker binary SHA-256 after: {checker_identity('lean4lean', 'binary-sha256')}",
        f"Method: recheck declarations defined in {len(LEAN4LEAN_SCOPED_MODULES)} named modules",
        "does not claim a fresh replay of every dependency",
    ):
        require(phrase in alternate_log,
            f"formalization/LEAN4LEAN_REPLAY_LOG.txt is missing: {phrase}")
    from replay_receipt import parse_active_replay_receipt
    def parse_receipt(transcript: str, **arguments) -> dict:
        if native_profile is None:
            return parse_active_replay_receipt(transcript, **arguments)
        from windows_verification import parse_receipt as parse_native_receipt
        from replay_scope import project_import_graph
        return parse_native_receipt(transcript, profile=native_profile,
            project_imports=project_import_graph(FORMALIZATION_ROOT, formalization_inventory_entries()), **arguments)

    structured_receipts = tuple(
        parse_receipt(
            transcript,
            lock=toolchain,
            source_sha256=source_digest,
            lean4checker_roots=LEAN4CHECKER_FRESH_ROOTS,
            lean4lean_modules=LEAN4LEAN_SCOPED_MODULES,
        )
        for transcript in (build_log, kernel_log, alternate_log)
    )
    require(
        structured_receipts[0] == structured_receipts[1]
        == structured_receipts[2],
        "build and checker transcripts carry different active replay receipts",
    )
    if native_profile is None:
        from replay_receipt import parse_invalid_proof_canary_receipts
        canary_receipts = tuple(
            parse_invalid_proof_canary_receipts(transcript, active_receipt=receipt)
            for transcript, receipt in zip(
                (build_log, kernel_log, alternate_log), structured_receipts
            )
        )
        require(canary_receipts[0] == canary_receipts[1] == canary_receipts[2],
                "build and checker transcripts carry different invalid-proof canary receipts")
    if native_profile is not None:
        groups = tuple(structured_receipts[0]["checkers"]["lean4checker"]["grouped_replay"]["actual_invocation_modules"])
        for phase in ("REPLAY_GROUP", "PASS_GROUP"):
            actual = tuple(re.findall(rf"^{phase} lean4checker --fresh (\S+)$", kernel_log, re.MULTILINE))
            require(actual == groups, "native actual group invocation log differs from its receipt")
    for label, transcript in (
        ("build", build_log),
        ("kernel replay", kernel_log),
        ("alternate-kernel replay", alternate_log),
    ):
        for field in (
            "Identifier:",
            "UTC timestamp:",
            "Runtime: Python ",
            "Command:",
            "Exit status: 0",
            "Evidence digest: SHA256SUMS entry for ",
            f"TOOLCHAIN_LOCK_SHA256 {toolchain.sha256}",
            "ENVIRONMENT_FINGERPRINT_SHA256 ",
        ):
            require(field in transcript,
                f"{label} transcript lacks replication field: {field}")
        require(
            re.search(
                r"UTC timestamp: \d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\+00:00",
                transcript,
            ) is not None,
            f"{label} transcript lacks a machine-readable UTC timestamp",
        )
        runtime_suffix = (r"platform Linux-[^;]+; machine x86_64; execution context container$"
                          if native_profile is None else
                          r"platform Windows-[^;]+; machine (?:AMD64|x86_64); execution context native/non-container$")
        expected_python = (toolchain["verification-python"] if native_profile is None
                           else native_profile.values["python"]["version"])
        require(re.search(rf"^Runtime: Python {re.escape(expected_python)}; " + runtime_suffix,
                          transcript, re.MULTILINE) is not None,
                f"{label} transcript was not produced in the explicitly selected locked runtime")
        require(
            re.search(r"^ENVIRONMENT_FINGERPRINT_SHA256 [0-9a-f]{64}$", transcript, re.MULTILINE)
            is not None,
            f"{label} transcript lacks a structured environment fingerprint",
        )
        require(
            re.search(r"(?:^|\s)/(?:home|tmp|Users|mnt)/", transcript) is None,
            f"{label} transcript exposes an absolute host path",
        )
        match = re.search(r"FORMAL_SOURCE_TREE_SHA256 ([0-9a-f]{64})", transcript)
        require(match is not None,
            f"{label} transcript lacks FORMAL_SOURCE_TREE_SHA256")
        require(match.group(1) == source_digest,
            f"{label} transcript is not bound to the published formal source tree")


def digest_manifest_bytes(*, post_verification: bool = False,
                          repository: bool = False) -> bytes:
    lines = []
    digested_files = (
        name
        for name in package_files(allow_missing_manifest=True,
                                  post_verification=post_verification, repository=repository)
        if name != "SHA256SUMS"
    )
    for name in sorted(digested_files):
        digest = hashlib.sha256((ROOT / name).read_bytes()).hexdigest()
        lines.append(f"{digest}  {name}\n")
    return "".join(lines).encode("utf-8")


def parse_digest_manifest_bytes(
    payload: bytes, *, root: Path = ROOT, require_files: bool = True
) -> tuple[tuple[str, str], ...]:
    """Strictly parse the portable package manifest.

    Only sorted, unique, canonical relative paths to regular non-symlink files
    are accepted.  The manifest may not name itself.
    """
    try:
        text = payload.decode("utf-8")
    except UnicodeDecodeError as error:
        raise AssertionError("SHA256SUMS is not UTF-8") from error
    require(text.endswith("\n"), "SHA256SUMS must end with one newline")
    require("\r" not in text, "SHA256SUMS must use LF line endings")
    records: list[tuple[str, str]] = []
    seen: set[str] = set()
    # Dotfiles such as `.dockerignore` and paths below `.github/` are valid
    # portable package members.  Parsed-component checks below still reject
    # `.`, `..`, absolute paths, backslashes, and traversal.
    pattern = re.compile(r"([0-9a-f]{64})  ([A-Za-z0-9.][A-Za-z0-9._/+ -]*)")
    for number, line in enumerate(text.splitlines(), start=1):
        match = pattern.fullmatch(line)
        require(match is not None, f"SHA256SUMS:{number}: malformed record")
        assert match is not None
        digest, name = match.groups()
        path = PurePosixPath(name)
        require(
            not path.is_absolute()
            and path.as_posix() == name
            and "\\" not in name
            and all(part not in {"", ".", ".."} for part in path.parts),
            f"SHA256SUMS:{number}: unsafe or noncanonical path {name!r}",
        )
        require(
            name == name.strip()
            and all(part == part.strip() and not part.endswith(".") for part in path.parts),
            f"SHA256SUMS:{number}: nonportable path {name!r}",
        )
        require(name != "SHA256SUMS", "SHA256SUMS must not name itself")
        require(name not in seen, f"SHA256SUMS:{number}: duplicate path {name!r}")
        seen.add(name)
        if require_files:
            target = root / name
            require(target.is_file() and not target.is_symlink(),
                f"SHA256SUMS:{number}: target is not a regular non-symlink file: {name}")
        records.append((name, digest))
    require(records, "SHA256SUMS is empty")
    names = tuple(name for name, _ in records)
    require(names == tuple(sorted(names)), "SHA256SUMS paths are not bytewise sorted")
    return tuple(records)


def check_digest_manifest(*, post_verification: bool = False,
                          repository: bool = False) -> None:
    require(DIGEST_MANIFEST.is_file(), "SHA256SUMS is missing")
    actual = DIGEST_MANIFEST.read_bytes()
    parse_digest_manifest_bytes(actual, root=ROOT)
    expected = digest_manifest_bytes(post_verification=post_verification, repository=repository)
    if actual == expected:
        return

    line_pattern = re.compile(r"^([0-9a-f]{64})  (.+)$")

    def entries(payload: bytes) -> tuple[dict[str, str], list[str]]:
        parsed: dict[str, str] = {}
        malformed: list[str] = []
        for line in payload.decode("utf-8", errors="replace").splitlines():
            match = line_pattern.fullmatch(line)
            if match is None or match.group(2) in parsed:
                malformed.append(line)
            else:
                parsed[match.group(2)] = match.group(1)
        return parsed, malformed

    actual_entries, malformed = entries(actual)
    expected_entries, _ = entries(expected)
    differing = sorted(
        name
        for name in set(actual_entries) | set(expected_entries)
        if actual_entries.get(name) != expected_entries.get(name)
    )
    details = []
    if differing:
        details.append(f"differing entries: {differing}")
    if malformed:
        details.append(f"malformed or duplicate lines: {malformed}")
    if not details:
        details.append("entry order or final-newline format differs")
    raise AssertionError(
        "SHA256SUMS does not match the package ("
        + "; ".join(details)
        + "); inspect the files and run `python3 -B src/check_package.py "
        + ("--repository " if repository else "")
        + "--write-evidence-manifest`"
    )


def write_digest_manifest(*, repository: bool = False) -> None:
    LocalWorkspace(ROOT).output(DIGEST_MANIFEST).write_bytes(
        digest_manifest_bytes(repository=repository))


def check_artifacts() -> None:
    endpoint_path = ROOT / "artifacts" / "rogozhin46_cook_cts.json"
    endpoint_raw = endpoint_path.read_bytes()
    endpoint = json.loads(endpoint_raw)
    require(endpoint_raw == canonical_json(endpoint), "endpoint JSON is not canonical")
    require(
        endpoint.get("schema") == "ROGOZHIN46_COOK_DELETION1_CTS_V1",
        "unexpected endpoint schema",
    )
    transitions = endpoint["machine"]["transitions"]
    require(
        len(transitions) == 6
        and all(
            set(row) == {"read", "entries"} and len(row["entries"]) == 4
            for row in transitions
        ),
        "machine table is incomplete",
    )
    require(len(endpoint["tag_productions"]) == 114, "tag table is incomplete")
    require(len(endpoint["cts_appendants"]) == 912, "CTS period is not 912")
    require(
        hashlib.sha256(endpoint_raw).hexdigest()
        == "6a25246ca4d3c04fce206376fd83c4336cce29cae226cdf9bc30b778adea0ccc",
        "endpoint digest changed",
    )

    scheduler_path = ROOT / "artifacts" / "rogozhin46_scheduler.json"
    scheduler_raw = scheduler_path.read_bytes()
    scheduler = json.loads(scheduler_raw)
    require(scheduler_raw == canonical_json(scheduler), "scheduler JSON is not canonical")
    require(
        scheduler.get("schema") == "PURE_S_ROGOZHIN46_DISPATCH_CERTIFICATE_V1",
        "unexpected scheduler schema",
    )
    require(scheduler["dispatcher"]["leaf_count"] == 1824, "dispatcher is incomplete")
    table = scheduler["expanded_microtable"]
    require(table["state_count"] == 1_344_412, "microprogram state count changed")
    require(
        table["sha256"]
        == "1b5a078e8c2663bd1ac7cb44123ce148ad40723f8159ca4bacf938e425a8825d",
        "microprogram digest changed",
    )
    controller = scheduler.get("full_controller")
    require(isinstance(controller, dict), "full scheduler controller is missing")
    require(
        controller.get("schema") == "PURE_S_ONE_CURSOR_FULL_CONTROLLER_V1",
        "unexpected full scheduler schema",
    )
    expansion = controller.get("canonical_expansion")
    require(isinstance(expansion, dict), "full scheduler expansion is missing")
    require(
        expansion.get("state_count") == 1_658_922,
        "full scheduler macro-row count changed",
    )
    require(
        expansion.get("sha256")
        == "8b2ca50c322ee51923b1e029ca692cf1b71f9f1cdbad7582fe85c1084b6702a2",
        "full scheduler digest changed",
    )
    require(
        expansion.get("definition_sha256")
        == "005cacacfb904dd5de0d6327568ee883294e65dbdd8ec71678b8813913446a92",
        "full scheduler definition digest changed",
    )
    require(expansion.get("all_targets_resolved") is True, "unresolved target")
    require(
        expansion.get("return_placeholder_count") == 0,
        "full scheduler contains a return placeholder",
    )
    probes = controller.get("primitive_probe_expansion")
    require(isinstance(probes, dict), "primitive probe expansion is missing")
    require(
        probes.get("guard_invocation_count") == 1_835,
        "probe guard count changed",
    )
    require(
        probes.get("state_count") == 471_920,
        "primitive probe row count changed",
    )
    require(
        probes.get("sha256")
        == "b77f8718b400b41efd8f9f7d0eb0ed29355e432306be57c610fe83658ae882a0",
        "primitive probe digest changed",
    )
    require(
        probes.get("undefined_cursor_target") == "Reject",
        "probe cursor failures are not closed",
    )
    require(
        probes.get("opaque_subtree_equality_tests") == 0,
        "probe uses opaque-subtree equality",
    )
    primitive = controller.get("probe_expanded_controller")
    require(isinstance(primitive, dict), "probe-expanded controller is missing")
    require(
        primitive.get("state_count") == 2_129_007,
        "probe-expanded row count changed",
    )
    require(
        primitive.get("sha256")
        == "8640482bdc568d69194a7d9327dfa1cf9997c4a461bbfa94c48e4c2bbcee6a5e",
        "probe-expanded controller digest changed",
    )
    for field in (
        "all_targets_resolved",
        "all_cursor_failures_reject",
        "all_observations_total",
    ):
        require(primitive.get(field) is True, f"probe-expanded controller failed {field}")
    require(
        primitive.get("return_placeholder_count") == 0,
        "probe-expanded controller contains a return placeholder",
    )


def pdf_with_pypdf(
    path: Path,
) -> tuple[int, str, str, str, str, tuple[str, ...], tuple[str, ...]]:
    try:
        from pypdf import PdfReader
    except ImportError as error:
        raise AssertionError(
            "the exactly pinned pypdf dependency is required for PDF validation"
        ) from error

    reader = PdfReader(path, strict=True)
    metadata = reader.metadata or {}
    title = str(metadata.get("/Title", ""))
    author = str(metadata.get("/Author", ""))
    subject = str(metadata.get("/Subject", ""))
    page_text: list[str] = []
    link_uris: list[str] = []
    for page in reader.pages:
        page_text.append(page.extract_text() or "")
        for reference in page.get("/Annots") or ():
            annotation = reference.get_object()
            action = annotation.get("/A")
            if action is not None and action.get("/S") == "/URI":
                uri = action.get("/URI")
                if uri is not None:
                    link_uris.append(str(uri))
    text = "\n".join(page_text)
    outline_titles: list[str] = []

    def collect_outline(items: list[object]) -> None:
        for item in items:
            if isinstance(item, list):
                collect_outline(item)
            else:
                outline_titles.append(str(getattr(item, "title", item)))

    collect_outline(reader.outline)
    return (
        len(reader.pages), title, text, author, subject,
        tuple(outline_titles), tuple(link_uris),
    )


def markdown_doi_destinations(markdown: str) -> set[str]:
    """Read explicit inline DOI link targets regardless of their visible label.

    Unbracketed destinations may contain balanced, nested parentheses; angle
    brackets delimit the other form used by the reference source.
    """
    targets: set[str] = set()
    opening = re.compile(r"(?<![!\\])\[[^\]\n]*\]\(\s*(?P<angle><)?(?P<target>https://doi\.org/)")
    closing = re.compile(r'''\s*(?:"(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*'|\((?:\\.|[^)\\])*\))?\s*\)''')
    for match in opening.finditer(markdown):
        angle = match.group("angle") is not None
        end = match.end()
        depth = 0
        while end < len(markdown):
            char = markdown[end]
            if char == "\\" and end + 1 < len(markdown):
                end += 2
                continue
            if char.isspace() or (angle and char == ">"):
                break
            if not angle:
                if char == "(":
                    depth += 1
                elif char == ")":
                    if depth == 0:
                        break
                    depth -= 1
            end += 1
        if end == len(markdown) or depth or (angle and markdown[end] != ">"):
            continue
        if closing.match(markdown, end + int(angle)) is None:
            continue
        target = markdown[match.start("target"):end]
        target = re.sub(r"\\([\\()<>])", r"\1", target)
        if target != "https://doi.org/":
            targets.add(target)
    return targets


def check_pdf_doi_links(references: str, link_uris: tuple[str, ...]) -> None:
    """Require exactly the reference source's DOI destinations in the PDF."""
    expected_doi_uris = markdown_doi_destinations(references)
    actual_doi_uris = {
        uri for uri in link_uris if uri.startswith("https://doi.org/")
    }
    require(expected_doi_uris,
        "reference source contains no recognized DOI links")
    require(
        actual_doi_uris == expected_doi_uris,
        "PDF DOI annotations differ from the reference source: "
        f"missing={sorted(expected_doi_uris - actual_doi_uris)!r}; "
        f"unexpected={sorted(actual_doi_uris - expected_doi_uris)!r}",
    )


def check_derived_pdfs() -> None:
    """Validate the single universality-first publication PDF."""
    path = PAPER_PDF
    require(path.read_bytes().startswith(b"%PDF-"), f"{path.name} is not a PDF")
    try:
        assert_tagged_pdf(path)
    except RuntimeError as error:
        raise AssertionError(str(error)) from error
    pages, title, text, author, subject, outline_titles, link_uris = pdf_with_pypdf(
        path
    )
    require(author == PDF_ATTRIBUTION, f"unexpected attribution in {path.name}")
    require(subject == PDF_SUBJECT, f"unexpected subject in {path.name}")
    require(pages > 0, f"{path.name} has no pages")
    require(title == PAPER_TITLE, f"unexpected title in {path.name}")
    require(len(outline_titles) >= 12, f"{path.name} has no useful outline")
    pdf_sections = tuple(
        re.sub(r"^## (?:[0-9]+\. |Appendix [A-Z]\. )?", "", heading)
        for heading in REQUIRED_PAPER_HEADINGS
    )
    pdf_prose = " ".join(text.split())
    for phrase in (
        *pdf_sections,
        "Finite selection from the current term",
        "The persistent scheduler used in the proof",
        "Theorem 1. Exact cyclic-tag trajectories under a fixed persistent-cursor",
        "Theorem 1R. Exact computation by a fixed root-restarted finite controller",
        "Theorem 2. One fixed pure-S endpoint for deterministic Turing-machine",
        "Theorem 3. Exact observation and explicit structural bounds",
        "What the interfaces do",
        "Theorem 4. Confluence obstruction to exclusive functional decoding",
        "Theorem 5. Persistent exposure and enumeration of observer-verified histories",
        "Observer boundary and resources",
    ):
        require(phrase in pdf_prose, f"{path.name} is missing: {phrase}")
    require(re.search(r"\{\{[A-Z0-9_]+\}\}", text) is None,
        f"{path.name} retains an assembly token")
    check_pdf_doi_links(REFERENCE_SOURCE.read_text(encoding="utf-8"), link_uris)


def main() -> None:
    if (ROOT / "TOOLCHAIN.lock").read_text(encoding="utf-8").startswith("verification-profile: "):
        from release_verification import main as check_current_release
        check_current_release()
        return
    parser = argparse.ArgumentParser()
    parser.add_argument("--windows-profile", type=Path,
                        help="validate native evidence against an explicit strict Windows profile")
    parser.add_argument("--repository", action="store_true",
                        help="exclude only root .git, .work and pure_s_universality_submission.zip from public-file checks")
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--check-dependencies", action="store_true")
    modes.add_argument("--check-build-dependencies", action="store_true")
    modes.add_argument("--check-formalization-inventory", action="store_true")
    modes.add_argument("--check-public-structure", action="store_true",
                       help="check public inputs and manuscript without claiming proof-receipt or PDF verification")
    modes.add_argument("--write-formalization-inventory", action="store_true")
    modes.add_argument("--check-evidence-integrity", action="store_true")
    modes.add_argument("--write-evidence-manifest", action="store_true")
    modes.add_argument("--post-verification", action="store_true",
                       help="recheck sealed evidence after execution; permit only the two declared output directories")
    args = parser.parse_args()

    if args.check_dependencies:
        check_dependencies(python_packages=True, build_tools=False)
        print("PASS Python and PDF-validator dependency preflight")
        return
    if args.check_build_dependencies:
        check_dependencies(python_packages=False, build_tools=True)
        print("PASS paper-build dependency preflight")
        return
    if args.check_formalization_inventory:
        entries = check_formalization_inventory()
        print(
            "PASS exact public formalization inventory "
            f"files={len(entries)} lean_sources="
            f"{sum(name.endswith('.lean') for name in entries)}"
        )
        return
    if args.write_formalization_inventory:
        entries = write_formalization_inventory()
        checked = check_formalization_inventory()
        require(entries == checked, "formalization inventory write did not stabilize")
        complete_public_replay_scope(FORMALIZATION_ROOT, entries,
                                     LEAN4CHECKER_FRESH_ROOTS, LEAN4LEAN_SCOPED_MODULES)
        print(
            "wrote exact public formalization inventory "
            f"files={len(entries)} lean_sources="
            f"{sum(name.endswith('.lean') for name in entries)}"
        )
        return

    if args.check_public_structure:
        check_dependencies(python_packages=False, build_tools=False)
        check_tree(allow_missing_manifest=True, evidence_integrity=False,
                   repository=args.repository)
        check_authored_source_policy()
        check_paper_claims()
        check_artifacts()
        print("PASS public structure, manuscript claims and scientific artifacts; proof receipts and PDF not checked")
        return

    check_dependencies(python_packages=True, build_tools=False)
    evidence_integrity = True
    check_tree(
        allow_missing_manifest=args.write_evidence_manifest,
        evidence_integrity=evidence_integrity,
        windows_profile=args.windows_profile,
        post_verification=args.post_verification,
        repository=args.repository,
    )
    check_authored_source_policy()
    check_paper_claims()
    check_artifacts()
    from check_runtime_evidence import check_runtime_evidence
    from check_formal_continuity import check_formal_continuity
    check_runtime_evidence(ROOT)
    check_formal_continuity(ROOT)
    check_derived_pdfs()
    if args.write_evidence_manifest:
        write_digest_manifest(repository=args.repository)
        print("wrote SHA256SUMS for every evidence file except the manifest itself")
    if evidence_integrity:
        check_digest_manifest(post_verification=args.post_verification,
                              repository=args.repository)
        print(
            "PASS evidence integrity including Lean sources, synchronized unified "
            "paper, canonical artifacts, digest manifest, and theorem PDF"
        )
    else:
        print(
            "PASS unified paper surface, Lean source inventory, canonical "
            "artifacts, and theorem PDF"
        )


if __name__ == "__main__":
    try:
        main()
    except (
        AssertionError,
        FileNotFoundError,
        KeyError,
        OSError,
        subprocess.CalledProcessError,
        ValueError,
    ) as error:
        raise SystemExit(f"FAIL package verification: {error}") from None
