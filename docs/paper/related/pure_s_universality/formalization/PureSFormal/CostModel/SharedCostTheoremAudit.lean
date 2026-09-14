import PureSFormal.CostModel.SharedCostTheorem

/-! Public axiom inventory for the shared-store kernel certificate. -/

#print axioms PureSFormal.CostModel.Term.height
#print axioms PureSFormal.CostModel.Term.height_pos
#print axioms PureSFormal.CostModel.Term.height_le_size
#print axioms PureSFormal.CostModel.Term.contractum_height_le_redex_height_add_one
#print axioms PureSFormal.CostModel.Step.target_height_le_source_add_one
#print axioms PureSFormal.CostModel.StepsN.address_length_le_initial_size_add_steps
#print axioms PureSFormal.CostModel.Arena.subterm?_readback
#print axioms PureSFormal.CostModel.Arena.same_node_occurrences_not_strict_prefix
#print axioms PureSFormal.CostModel.Arena.readback_steps_develop
#print axioms PureSFormal.CostModel.Arena.contract_readback_of_rank_lt
#print axioms PureSFormal.CostModel.Arena.contract_readback_at_redex
#print axioms PureSFormal.CostModel.Arena.contract_readback_eq_develop
#print axioms PureSFormal.CostModel.Arena.contract_root_steps
#print axioms PureSFormal.CostModel.Arena.edgeCopy_readback_old
#print axioms PureSFormal.CostModel.Arena.edgeCopy_readback_fresh
#print axioms PureSFormal.CostModel.Arena.edgeCopy_rootReadback
#print axioms PureSFormal.CostModel.Arena.edgeCopy_follow_fresh
#print axioms PureSFormal.CostModel.Arena.edgeCopy_uniqueIncoming_fresh
#print axioms PureSFormal.CostModel.Arena.privatize
#print axioms PureSFormal.CostModel.Arena.replace?_develop_of_unique_occurrence
#print axioms PureSFormal.CostModel.Arena.lift_addressed_contraction
#print axioms PureSFormal.CostModel.AddressedPath.toStepsN
#print axioms PureSFormal.CostModel.AddressedPath.twice_triangular
#print axioms PureSFormal.CostModel.AddressedPath.triangular_eq_mul_div_two
#print axioms PureSFormal.CostModel.AddressedPath.addressMoveCount_le_height_add_triangular
#print axioms PureSFormal.CostModel.AddressedPath.addressMoveCount_le_initial_size
#print axioms PureSFormal.CostModel.AddressedPath.twice_addressMoveCount_le_initial_size
#print axioms PureSFormal.CostModel.Arena.lift_addressed_path
#print axioms PureSFormal.CostModel.AllocationRun.target_le_initial_add_twice_moves
#print axioms PureSFormal.CostModel.sharedCostKernelCertificate
