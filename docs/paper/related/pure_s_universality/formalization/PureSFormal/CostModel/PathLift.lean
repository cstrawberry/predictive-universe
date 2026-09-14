import PureSFormal.CostModel.Privatization

/-!
# Iterated supplied-address path lift

`AddressedPath` records an ordinary reduction together with the exact address
chosen at each step.  `StorePathLift` records the heterogeneous sequence of
privatized arenas and concrete shared contractions.  Its numeric index counts
one graph move per concrete edge copy and one per shared contraction.
-/

namespace PureSFormal.CostModel

open PureSFormal.PureS

/-- An ordinary pure-S path with every contracted occurrence address
supplied explicitly. -/
inductive AddressedPath : List Address → PureS.Term → PureS.Term → Prop where
  | refl (term : PureS.Term) : AddressedPath [] term term
  | cons {addresses : List Address} {source middle target : PureS.Term}
      {address : Address}
      (head : source.contractAt? address = some middle)
      (tail : AddressedPath addresses middle target) :
      AddressedPath (address :: addresses) source target

/-- Exact number of charged graph mutations used by the canonical lift:
one copy per address edge and one contraction per ordinary step. -/
@[simp]
def addressMoveCount : List Address → Nat
  | [] => 0
  | address :: rest => address.length + 1 + addressMoveCount rest

namespace AddressedPath

/-- Forgetting supplied addresses yields an exact-length ordinary reduction. -/
theorem toStepsN
    {addresses : List Address} {source target : PureS.Term}
    (path : AddressedPath addresses source target) :
    PureS.StepsN addresses.length source target := by
  induction path with
  | refl => exact PureS.StepsN.refl _
  | cons head tail ih =>
      have first := PureS.StepsN.single (PureS.Term.contractAt?_sound head)
      simpa [Nat.add_comm] using first.trans ih

/-- Recursive triangular number `0 + 1 + ⋯ + (steps - 1)`. -/
@[simp]
def triangular : Nat → Nat
  | 0 => 0
  | steps + 1 => triangular steps + steps

/-- Division-free exact identity for the recursive triangular number. -/
theorem twice_triangular (steps : Nat) :
    2 * triangular steps = steps * (steps - 1) := by
  induction steps with
  | zero => rfl
  | succ steps ih =>
      rw [triangular, Nat.mul_add, ih]
      cases steps with
      | zero => rfl
      | succ previous =>
          simp only [Nat.succ_sub_one]
          simp [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- Closed form of the recursive triangular number. -/
theorem triangular_eq_mul_div_two (steps : Nat) :
    triangular steps = steps * (steps - 1) / 2 := by
  rw [← twice_triangular]
  simp

/-- Exact supplied-address cost is bounded by initial height times the step
count plus the triangular height-growth allowance. -/
theorem addressMoveCount_le_height_add_triangular
    {addresses : List Address} {source target : PureS.Term}
    (path : AddressedPath addresses source target) :
    addressMoveCount addresses ≤
      addresses.length * Term.height source + triangular addresses.length := by
  induction path with
  | refl => simp
  | @cons addresses source middle target address head tail ih =>
      obtain ⟨selected, replacement, selectedAt, rootStep, replacedAt⟩ :=
        PureS.Term.contractAt?_spec head
      have headCost : address.length + 1 ≤ Term.height source :=
        Nat.succ_le_of_lt (Term.address_length_lt_height selectedAt)
      have heightGrowth : Term.height middle ≤ Term.height source + 1 :=
        Step.target_height_le_source_add_one
          (PureS.Term.contractAt?_sound head)
      calc
        addressMoveCount (address :: addresses) =
            address.length + 1 + addressMoveCount addresses := rfl
        _ ≤ Term.height source +
              (addresses.length * Term.height middle +
                triangular addresses.length) :=
          Nat.add_le_add headCost ih
        _ ≤ Term.height source +
              (addresses.length * (Term.height source + 1) +
                triangular addresses.length) := by
          exact Nat.add_le_add_left
            (Nat.add_le_add_right
              (Nat.mul_le_mul_left addresses.length heightGrowth) _)
            _
        _ = (address :: addresses).length * Term.height source +
              triangular (address :: addresses).length := by
          simp [triangular, Nat.mul_add, Nat.add_mul,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- Literal closed form of the supplied-path move bound. -/
theorem addressMoveCount_le_initial_size
    {addresses : List Address} {source target : PureS.Term}
    (path : AddressedPath addresses source target) :
    addressMoveCount addresses ≤
      addresses.length * source.size +
        addresses.length * (addresses.length - 1) / 2 := by
  calc
    addressMoveCount addresses ≤
        addresses.length * Term.height source + triangular addresses.length :=
      addressMoveCount_le_height_add_triangular path
    _ ≤ addresses.length * source.size + triangular addresses.length := by
      exact Nat.add_le_add_right
        (Nat.mul_le_mul_left addresses.length (Term.height_le_size source)) _
    _ = addresses.length * source.size +
        addresses.length * (addresses.length - 1) / 2 := by
      rw [triangular_eq_mul_div_two]

/-- Closed division-free form of the Appendix path-lifting bound.  The right
side is twice `t * initialSize + t*(t-1)/2`, with
`t = addresses.length`. -/
theorem twice_addressMoveCount_le_initial_size
    {addresses : List Address} {source target : PureS.Term}
    (path : AddressedPath addresses source target) :
    2 * addressMoveCount addresses ≤
      2 * addresses.length * source.size +
        addresses.length * (addresses.length - 1) := by
  have heightBound := addressMoveCount_le_height_add_triangular path
  have doubled := Nat.mul_le_mul_left 2 heightBound
  have initialHeight := Term.height_le_size source
  calc
    2 * addressMoveCount addresses ≤
        2 * (addresses.length * Term.height source +
          triangular addresses.length) := doubled
    _ = 2 * addresses.length * Term.height source +
          addresses.length * (addresses.length - 1) := by
      rw [Nat.mul_add, twice_triangular]
      simp [Nat.mul_assoc]
    _ ≤ 2 * addresses.length * source.size +
          addresses.length * (addresses.length - 1) := by
      exact Nat.add_le_add_right
        (Nat.mul_le_mul_left (2 * addresses.length) initialHeight) _

end AddressedPath

/-- Heterogeneous graph trace lifting a supplied sequence of ordinary
addresses.  Every constructor exposes the exact concrete copy prefix,
singleton endpoint, concrete contraction, and remaining trace. -/
inductive StorePathLift :
    (ι : Type) → Arena ι → List Address →
      (κ : Type) → Arena κ → Nat → Prop
  | refl (arena : Arena ι) : StorePathLift ι arena [] ι arena 0
  | cons {before : Arena ι} {address : Address}
      {addresses : List Address} {Node : Type} [DecidableEq Node]
      {copied : Arena Node} {redexNode : Node}
      {view : Arena.RedexView copied redexNode}
      {Final : Type} {finalArena : Arena Final} {tailMoves : Nat}
      (copies : CopySteps ι before Node copied address.length)
      (copiedReadback : copied.rootReadback = before.rootReadback)
      (atAddress : copied.follow? copied.root address = some redexNode)
      (unique : ∀ otherAddress,
        copied.follow? copied.root otherAddress = some redexNode →
          otherAddress = address)
      (tail : StorePathLift (ContractId Node)
        (copied.contract redexNode view) addresses
        Final finalArena tailMoves) :
      StorePathLift ι before (address :: addresses)
        Final finalArena (address.length + 1 + tailMoves)

namespace Arena

variable {ι : Type} [DecidableEq ι]

/-- Every supplied ordinary address path has a concrete heterogeneous store
trace with the same final readback and exactly `addressMoveCount` graph
mutations. -/
theorem lift_addressed_path
    (arena : Arena ι) {addresses : List Address}
    {source target : PureS.Term}
    (rootReadbackEq : arena.rootReadback = source)
    (path : AddressedPath addresses source target) :
    ∃ (Final : Type) (finalDecEq : DecidableEq Final)
      (finalArena : Arena Final),
      StorePathLift ι arena addresses Final finalArena
          (addressMoveCount addresses) ∧
        finalArena.rootReadback = target := by
  induction path generalizing ι arena with
  | refl =>
      refine ⟨ι, inferInstance, arena, ?_, rootReadbackEq⟩
      exact StorePathLift.refl arena
  | @cons addresses source middle target address head tail ih =>
      have addressedStep :
          arena.rootReadback.contractAt? address = some middle := by
        rw [rootReadbackEq]
        exact head
      obtain ⟨Node, nodeDecEq, copied, redexNode, view,
        copies, copiedReadback, atAddress, unique, contractedReadback⟩ :=
          arena.lift_addressed_contraction address middle addressedStep
      letI : DecidableEq Node := nodeDecEq
      obtain ⟨Final, finalDecEq, finalArena, tailTrace, finalReadback⟩ :=
        ih (copied.contract redexNode view) contractedReadback
      refine ⟨Final, finalDecEq, finalArena, ?_, finalReadback⟩
      exact StorePathLift.cons copies copiedReadback atAddress unique tailTrace

end Arena

end PureSFormal.CostModel
