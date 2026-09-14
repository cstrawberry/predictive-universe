PYTHON ?= python3 -B
LAKE ?= lake

.PHONY: dependencies inventory-build build strong audit public-signatures public-signatures-update

dependencies:
	$(PYTHON) scripts/check_toolchain.py --lake "$(LAKE)"

inventory-build:
	$(PYTHON) scripts/build_inventory.py --lake "$(LAKE)"

build: inventory-build
	$(LAKE) build PureSFormal PureSFormal.Compatibility \
		PureSFormal.ChallengeAudit \
		PureSFormal.PublicAudit \
		PureSFormal.Research.RootResetDeletionGadgetAudit \
		PureSFormal.Research.RootResetBoundedDepthObstructionAudit \
		PureSFormal.Research.RootResetEulerWalkerAudit \
		PureSFormal.Research.RootResetCarrierBoundaryGrammarAudit \
		PureSFormal.Research.RootResetStageRegistryAudit \
		PureSFormal.Research.RootResetReachableStageGrammarAudit \
		PureSFormal.Research.RootResetDispatcherNodeStagesAudit \
		PureSFormal.Research.RootResetAppenderStagesAudit \
		PureSFormal.Research.RootResetAccumulatorClassifierAudit \
		PureSFormal.Research.RootResetWholeStageClassifierAudit \
		PureSFormal.Research.RootResetWholeAppenderStagesAudit \
		PureSFormal.Research.RootResetWholeDispatcherStagesAudit \
		PureSFormal.Research.RootResetDispatcherSelectedHandoffAudit \
		PureSFormal.Research.RootResetWholeDispatcherSelectedHandoffAudit \
		PureSFormal.Research.RootResetResponseBoundaryStagesAudit \
		PureSFormal.Research.RootResetClockFuelStagesAudit \
		PureSFormal.Research.RootResetClockFuelCanonicalGrammarAudit \
		PureSFormal.Research.RootResetClockFuelCanonicalTransitionsAudit \
		PureSFormal.Research.RootResetCompositeStageRegistryAudit \
		PureSFormal.Research.RootResetTwentySevenStageRegistryAudit \
		PureSFormal.Research.RootResetProgressWalkerAudit \
		PureSFormal.Research.RootResetProgressTotalityAudit \
		PureSFormal.Research.RootResetProgressEulerSelectorAudit \
		PureSFormal.Research.RootResetProgressEulerTotalityAudit \
		PureSFormal.Research.RootResetProgressEulerContractAudit \
		PureSFormal.Research.RootResetSuccessfulEdgeMovesAudit \
		PureSFormal.Research.ProtectedTrieObserverNecessityAudit \
		PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessityAudit \
		PureSFormal.Research.ProtectedTrieObserverBoundaryAudit \
		PureSFormal.Research.ProtectedTrieFairnessAudit \
		PureSFormal.Research.ProtectedTrieFairStreamAudit \
		PureSFormal.Research.ProtectedTrieCertificateEnumerationAudit \
		PureSFormal.Research.ProtectedPrefixGeneratorCalibrationAudit \
		PureSFormal.CostModel.SharedCostTheoremAudit \
		PureSFormal.CostModel.UnifiedResourceLedgerAudit \
		PureSFormal.CostModel.PointerWordCostAudit \
		PureSFormal.CostModel.SharedImplementationAudit \
		PureSFormal.CostModel.SharedImplementationTest \
		PureSFormal.Research.ProtectedTrieBoundedTerminalAudit \
		PureSFormal.Research.ProtectedTrieExecutableScheduleFixture \
		Demo

strong:
	$(LAKE) build PureSFormal.StrongMultiwayUniversalityAudit \
		PureSFormal.WeakPathUniversalityAudit \
		PureSFormal.Computation.DeterministicTapeCounterCompilerAudit \
		PureSFormal.Computation.DeterministicTapeTrajectoryDecoderAudit \
		PureSFormal.Computation.DeterministicTapeThreeCounterCompilerAudit \
		PureSFormal.Computation.ThreeCounterTagAudit \
		PureSFormal.Computation.LegacyCompilerGrowthAudit \
		PureSFormal.Computation.DeterministicTapeCookAudit \
		PureSFormal.Computation.DeterministicTapePureSAudit \
		PureSFormal.Computation.DeterministicTapePureSComputabilityAudit \
		PureSFormal.PureS.ParentLinkedControllerAudit \
		PureSFormal.Research.RootResetProgressCompletenessAudit \
		PureSFormal.WeakPathPolynomialCostAudit

audit: dependencies build strong
	$(PYTHON) scripts/audit_sources.py
	$(PYTHON) scripts/audit_axioms.py --lake "$(LAKE)"
	$(PYTHON) scripts/audit_all_axioms.py --lake "$(LAKE)"
	$(PYTHON) scripts/audit_public_declarations.py --lake "$(LAKE)"
	$(PYTHON) scripts/check_public_signatures.py --lake "$(LAKE)" --check

public-signatures:
	$(PYTHON) scripts/check_public_signatures.py --lake "$(LAKE)" --check

public-signatures-update:
	$(PYTHON) scripts/check_public_signatures.py --lake "$(LAKE)" --write
