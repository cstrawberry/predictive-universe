import PureSFormal.CostModel.Allocation

/-!
# Public shared-store kernel certificate

This module packages the kernel-checked core of the shared pure-S cost model.
It covers structural address growth, well-founded arena readback, separation
of shared occurrences, concrete one-node edge copying, exact path
privatization, exact complete-development semantics for the concrete two-node
shared contraction, exact supplied-address path lifting, and the allocation
ceiling.
-/

namespace PureSFormal.CostModel

open PureSFormal.PureS

/-- Kernel-checked core shared-store contract. -/
structure SharedCostKernelCertificate : Prop where
  stepHeight :
    ∀ {source target : PureS.Term}, PureS.Step source target →
      Term.height target ≤ Term.height source + 1
  addressedHeight :
    ∀ {steps : Nat} {source target found : PureS.Term} {address : Address},
      PureS.StepsN steps source target →
      target.subterm? address = some found →
      address.length ≤ source.size + steps
  occurrenceSeparation :
    ∀ (ι : Type) (arena : Arena ι) {node : ι}
      {first second suffix : Address},
      arena.follow? arena.root first = some node →
      arena.follow? arena.root second = some node →
      suffix ≠ [] → second ≠ first ++ suffix
  concreteContractionSound :
    ∀ (ι : Type) [DecidableEq ι] (arena : Arena ι)
      (redexNode : ι) (view : Arena.RedexView arena redexNode),
      PureS.Steps arena.rootReadback
        (arena.contract redexNode view).rootReadback
  exactCompleteDevelopment :
    ∀ (ι : Type) [DecidableEq ι] (arena : Arena ι)
      (redexNode : ι) (view : Arena.RedexView arena redexNode) (node : ι),
      (arena.contract redexNode view).readback (.inl node) =
        arena.develop redexNode view node
  edgeCopyPreservesReadback :
    ∀ (ι : Type) [DecidableEq ι] (arena : Arena ι)
      (parent child : ι) (edge : IncomingEdge arena parent child),
      (arena.edgeCopy parent child edge).rootReadback = arena.rootReadback
  exactPrivatization :
    ∀ (ι : Type) [DecidableEq ι] (arena : Arena ι)
      (address : Address) (selected : PureS.Term),
      arena.rootReadback.subterm? address = some selected →
        PrivatizationResult arena address address.length
  exactAddressedContraction :
    ∀ (ι : Type) [DecidableEq ι] (arena : Arena ι)
      (address : Address) (target : PureS.Term),
      arena.rootReadback.contractAt? address = some target →
        Arena.AddressedContractionLift arena address target
  suppliedPathLift :
    ∀ (ι : Type) [DecidableEq ι] (arena : Arena ι)
      (addresses : List Address) (source target : PureS.Term),
      arena.rootReadback = source →
      AddressedPath addresses source target →
      ∃ (Final : Type) (finalDecEq : DecidableEq Final)
        (finalArena : Arena Final),
        StorePathLift ι arena addresses Final finalArena
            (addressMoveCount addresses) ∧
          finalArena.rootReadback = target
  suppliedPathMoveBound :
    ∀ (addresses : List Address) (source target : PureS.Term),
      AddressedPath addresses source target →
      addressMoveCount addresses ≤
        addresses.length * source.size +
          addresses.length * (addresses.length - 1) / 2
  allocationCeiling :
    ∀ {moves initial target : Nat},
      AllocationRun moves initial target →
      target ≤ initial + 2 * moves

/-- Every clause of the public shared-store kernel contract is inhabited by
the concrete definitions in this directory. -/
theorem sharedCostKernelCertificate : SharedCostKernelCertificate where
  stepHeight := Step.target_height_le_source_add_one
  addressedHeight := StepsN.address_length_le_initial_size_add_steps
  occurrenceSeparation := by
    intro ι arena node first second suffix firstOccurrence secondOccurrence
      suffixNonempty
    exact arena.same_node_occurrences_not_strict_prefix firstOccurrence
      secondOccurrence suffixNonempty
  concreteContractionSound := by
    intro ι inst arena redexNode view
    exact arena.contract_root_steps redexNode view
  exactCompleteDevelopment := by
    intro ι inst arena redexNode view node
    exact arena.contract_readback_eq_develop redexNode view node
  edgeCopyPreservesReadback := by
    intro ι inst arena parent child edge
    exact arena.edgeCopy_rootReadback parent child edge
  exactPrivatization := by
    intro ι inst arena address selected selectedAt
    exact arena.privatize address selected selectedAt
  exactAddressedContraction := by
    intro ι inst arena address target step
    exact arena.lift_addressed_contraction address target step
  suppliedPathLift := by
    intro ι inst arena addresses source target rootReadbackEq path
    exact arena.lift_addressed_path rootReadbackEq path
  suppliedPathMoveBound := by
    intro addresses source target path
    exact path.addressMoveCount_le_initial_size
  allocationCeiling := by
    intro moves initial target run
    exact run.target_le_initial_add_twice_moves

end PureSFormal.CostModel
