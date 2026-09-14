import PureSFormal.PureS.ParserBasePrimitive
import PureSFormal.PureS.ParserCellPrimitive

/-!
# Primitive recursive carrier decoding

The context stores the fixed action wrapper and an exact counted local parser.
The executable follows the public classifier order: base, completed local,
immediate cell. Recursive calls follow strictly smaller accumulator or
predecessor occurrences. Live cells copy the returned prefix using the counted
append operation; tombstone audit fields remain uninspected references.
-/

namespace PureSFormal.PureS.ParserCarrierPrimitive

open ParserPrimitiveMachine

structure Context (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  expectedAct : Term
  expectedAct_eq : expectedAct = actCode (compileActions program tree)
  localParser : Term → Result (Option (CheckpointDecoder.LocalView program))
  local_value : ∀ term, (localParser term).value = CheckpointDecoder.parseLocal? program tree term

variable {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}

theorem Context.base_value (context : Context program tree) (term : Term) :
    (ParserBasePrimitive.parse context.expectedAct term).value =
      CheckpointDecoder.parseBase? (compileActions program tree) term := by
  rw [context.expectedAct_eq]
  exact ParserBasePrimitive.parse_value _ _

theorem Context.local_accumulator_lt (context : Context program tree)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (found : (context.localParser term).value = some view) : view.accumulator.size < term.size :=
  CheckpointDecoder.parseLocal?_accumulator_size_lt ((context.local_value term).symm.trans found)

theorem cell_predecessor_lt {term predecessor : Term} {cell : CanonicalStep.CellResult}
    (found : (ParserCellPrimitive.parse term).value = some cell)
    (selected : match cell with
      | .live _ current => current = predecessor
      | .tombstone _ current => current = predecessor) : predecessor.size < term.size := by
  cases cell with
  | live bit current =>
      change current = predecessor at selected
      subst predecessor
      exact CheckpointDecoder.parsedCell_size_lt
        ((ParserCellPrimitive.parse_value term).symm.trans found) rfl
  | tombstone bit current =>
      change current = predecessor at selected
      subst predecessor
      exact CheckpointDecoder.parsedCell_size_lt
        ((ParserCellPrimitive.parse_value term).symm.trans found) rfl

def decode (context : Context program tree) (term : Term) : Result (Option (List Bool)) :=
  let base := ParserBasePrimitive.parse context.expectedAct term
  match hbase : base.value with
  | some view =>
      let queue := ParserCellSpinePrimitive.parse view.queue
      ⟨queue.value, base.operations + 3 + queue.operations⟩
  | none =>
      let localResult := context.localParser term
      match hlocal : localResult.value with
      | some view =>
          let inner := decode context view.accumulator
          ⟨inner.value, base.operations + 1 + localResult.operations + 3 + inner.operations⟩
      | none =>
          let cell := ParserCellPrimitive.parse term
          match hcell : cell.value with
          | none => ⟨none, base.operations + 1 + localResult.operations + 1 + cell.operations + 2⟩
          | some (.live bit predecessor) =>
              let inner := decode context predecessor
              let output := ParserWordPrimitive.extend inner bit
              ⟨output.value,
                base.operations + 1 + localResult.operations + 1 + cell.operations + 5 + output.operations⟩
          | some (.tombstone _ predecessor) =>
              let inner := decode context predecessor
              ⟨inner.value,
                base.operations + 1 + localResult.operations + 1 + cell.operations + 5 + inner.operations⟩
termination_by term.size
decreasing_by
  · exact context.local_accumulator_lt hlocal
  · exact cell_predecessor_lt hcell rfl
  · exact cell_predecessor_lt hcell rfl

theorem decode_value (context : Context program tree) (term : Term) :
    (decode context term).value = CheckpointDecoder.decodeCarrier? program tree term := by
  induction term using WellFounded.induction (measure Term.size).wf with
  | h term ih =>
      rw [decode, CheckpointDecoder.decodeCarrier?]
      rw [← context.base_value]
      cases hbase : (ParserBasePrimitive.parse context.expectedAct term).value with
      | some view => exact ParserCellSpinePrimitive.parse_value view.queue
      | none =>
          dsimp only
          rw [← context.local_value]
          cases hlocal : (context.localParser term).value with
          | some view => exact ih view.accumulator (context.local_accumulator_lt hlocal)
          | none =>
              dsimp only
              rw [← ParserCellPrimitive.parse_value]
              cases hcell : (ParserCellPrimitive.parse term).value with
              | none => rfl
              | some cell =>
                  cases cell with
                  | live bit predecessor =>
                      dsimp only
                      rw [ParserWordPrimitive.extend_value,
                        ih predecessor (cell_predecessor_lt hcell rfl)]
                  | tombstone bit predecessor =>
                      exact ih predecessor (cell_predecessor_lt hcell rfl)

theorem base_queue_lt {actions term : Term} {view : CheckpointDecoder.BaseView}
    (found : CheckpointDecoder.parseBase? actions term = some view) : view.queue.size < term.size := by
  rw [CheckpointDecoder.parseBase?_sound found]
  apply CarrierDecoder.subterm_size_lt
    (direction := .left) (rest := [.right, .left, .left, .right, .right, .right])
  cases view.queue <;> rfl

theorem decoded_length_le {term : Term} {bits : List Bool}
    (decoded : CheckpointDecoder.CarrierDecodes program tree term bits) : bits.length ≤ term.size := by
  induction decoded with
  | base view boundary queue =>
      exact Nat.le_trans (ParserCellSpinePrimitive.decoded_length_le queue)
        (Nat.le_of_lt (base_queue_lt boundary))
  | «local» view notBase boundary inner ih =>
      exact Nat.le_trans ih (Nat.le_of_lt (CheckpointDecoder.parseLocal?_accumulator_size_lt boundary))
  | live bit notBase notLocal boundary inner ih =>
      simp only [List.length_append, List.length_singleton]
      exact Nat.le_trans (Nat.add_le_add_right ih 1)
        (Nat.succ_le_of_lt (CheckpointDecoder.parsedCell_size_lt boundary rfl))
  | tombstone bit notBase notLocal boundary inner ih =>
      exact Nat.le_trans ih (Nat.le_of_lt (CheckpointDecoder.parsedCell_size_lt boundary rfl))

theorem decode_length_le (context : Context program tree) {term : Term} {bits : List Bool}
    (found : (decode context term).value = some bits) : bits.length ≤ term.size :=
  decoded_length_le (CheckpointDecoder.decodeCarrier?_sound program tree
    ((decode_value context term).symm.trans found))

theorem extend_operations_le (parsed : Result (Option (List Bool))) (bit : Bool) (cap : Nat)
    (lengthBound : ∀ bits, parsed.value = some bits → bits.length ≤ cap) :
    (ParserWordPrimitive.extend parsed bit).operations ≤ parsed.operations + 4 * cap + 5 := by
  unfold ParserWordPrimitive.extend
  split
  · exact Nat.le_trans (Nat.add_le_add_left (by decide : 2 ≤ 5) _)
      (Nat.add_le_add_right (Nat.le_add_right _ _) 5)
  · next bits found =>
      have bound := Nat.add_le_add_right
        (Nat.add_le_add_left (Nat.mul_le_mul_left 4 (lengthBound bits found)) parsed.operations) 5
      simpa only [appendBit_operations, show 5 = 2 + 3 by rfl,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def baseCoefficient (context : Context program tree) : Nat := 8 * context.expectedAct.size + 80

def coefficient (context : Context program tree) (localCoefficient : Nat) : Nat :=
  baseCoefficient context + localCoefficient + 432

theorem linear_bound {first constant cap : Nat}
    (firstBound : first ≤ cap) (constantBound : constant ≤ cap) (number : Nat) :
    first * number + constant ≤ cap * (number + 1) := by
  simpa only [Nat.mul_add, Nat.mul_one] using
    Nat.add_le_add (Nat.mul_le_mul_right number firstBound) constantBound

theorem base_overhead_le (context : Context program tree) (term : Term) :
    (ParserBasePrimitive.parse context.expectedAct term).operations + 4 ≤
      baseCoefficient context * (term.size + 1) := by
  have bound := Nat.add_le_add_right (ParserBasePrimitive.parse_operations_le context.expectedAct term) 4
  have first : (ParserBasePrimitive.parse context.expectedAct term).operations + 4 ≤
      4 * term.size + baseCoefficient context := by
    simpa only [baseCoefficient, show 80 = 76 + 4 by rfl, Nat.add_assoc] using bound
  exact Nat.le_trans first (linear_bound
    (Nat.le_trans (by decide : 4 ≤ 80) (Nat.le_add_left _ _)) (Nat.le_refl _) term.size)

theorem coefficient_large (context : Context program tree) (localCoefficient : Nat) :
    129 ≤ coefficient context localCoefficient :=
  Nat.le_trans (by decide : 129 ≤ 432) (Nat.le_add_left _ _)

theorem base_coefficient_le (context : Context program tree) (localCoefficient : Nat) :
    baseCoefficient context ≤ coefficient context localCoefficient :=
  Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _)

theorem local_overhead_le (context : Context program tree) (localCoefficient : Nat)
    (localBound : ∀ term, (context.localParser term).operations ≤ localCoefficient * (term.size + 1))
    (term : Term) :
    (ParserBasePrimitive.parse context.expectedAct term).operations + 1 +
      (context.localParser term).operations + 3 ≤ coefficient context localCoefficient * (term.size + 1) := by
  have first := Nat.add_le_add (base_overhead_le context term) (localBound term)
  have next := Nat.mul_le_mul_right (term.size + 1)
    (Nat.le_add_right (baseCoefficient context + localCoefficient) 432)
  exact Nat.le_trans (by simpa only [Nat.add_mul, show 4 = 1 + 3 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using first) next

theorem cell_overhead_le (context : Context program tree) (localCoefficient : Nat)
    (localBound : ∀ term, (context.localParser term).operations ≤ localCoefficient * (term.size + 1))
    (term : Term) :
    (ParserBasePrimitive.parse context.expectedAct term).operations +
      (context.localParser term).operations + (ParserCellPrimitive.parse term).operations +
        4 * term.size + 12 ≤ coefficient context localCoefficient * (term.size + 1) := by
  have cell := Nat.le_trans (ParserCellPrimitive.parse_operations_le term)
    (linear_bound (by decide : 8 ≤ 280) (by decide : 272 ≤ 280) term.size)
  have append := linear_bound (by decide : 4 ≤ 9) (by decide : 8 ≤ 9) term.size
  have first := Nat.add_le_add
    (Nat.add_le_add (Nat.add_le_add (base_overhead_le context term) (localBound term)) cell) append
  have coefficients : baseCoefficient context + localCoefficient + 280 + 9 ≤
      coefficient context localCoefficient := by
    simpa only [coefficient, Nat.add_assoc] using
      Nat.add_le_add_left (by decide : 280 + 9 ≤ 432) (baseCoefficient context + localCoefficient)
  have second := Nat.mul_le_mul_right (term.size + 1) coefficients
  exact Nat.le_trans (by simpa only [Nat.add_mul, show 12 = 4 + 8 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using first) second

theorem combine_descent {small large weight outer inner : Nat}
    (smaller : small < large) (outerBound : outer ≤ weight * (large + 1))
    (innerBound : inner ≤ weight * (small + 1) ^ 2) :
    outer + inner ≤ weight * (large + 1) ^ 2 := by
  have first := Nat.add_le_add innerBound outerBound
  have second := Nat.mul_le_mul_left weight (ParserWordPrimitive.square_descent smaller)
  exact Nat.le_trans (by simpa only [Nat.mul_add, Nat.add_comm] using first) second

theorem linear_le_square (weight number : Nat) :
    weight * (number + 1) ≤ weight * (number + 1) ^ 2 := by
  have square : number + 1 ≤ (number + 1) ^ 2 := by
    simpa only [Nat.pow_succ, Nat.pow_zero, Nat.one_mul, Nat.mul_one] using
      Nat.mul_le_mul_left (number + 1) (Nat.le_add_left 1 number)
  exact Nat.mul_le_mul_left weight square

theorem decode_operations_le (context : Context program tree) (localCoefficient : Nat)
    (localBound : ∀ term, (context.localParser term).operations ≤ localCoefficient * (term.size + 1))
    (term : Term) :
    (decode context term).operations ≤ coefficient context localCoefficient * (term.size + 1) ^ 2 := by
  induction term using WellFounded.induction (measure Term.size).wf with
  | h term ih =>
      have baseBound := base_overhead_le context term
      have localPrefix := local_overhead_le context localCoefficient localBound term
      have cellPrefix := cell_overhead_le context localCoefficient localBound term
      rw [decode]
      split
      · next view found =>
          have smaller := base_queue_lt ((context.base_value term).symm.trans found)
          have queue := Nat.le_trans (ParserCellSpinePrimitive.parse_operations_le view.queue)
            (Nat.mul_le_mul_right ((view.queue.size + 1) ^ 2) (coefficient_large context localCoefficient))
          have outer := Nat.le_trans
            (Nat.le_trans (Nat.add_le_add_left (by decide : 3 ≤ 4) _) baseBound)
            (Nat.mul_le_mul_right (term.size + 1) (base_coefficient_le context localCoefficient))
          exact combine_descent smaller outer queue
      · dsimp only
        split
        · next view found =>
            exact combine_descent (context.local_accumulator_lt found) localPrefix
              (ih view.accumulator (context.local_accumulator_lt found))
        · split
          · have allowance : 4 ≤ 4 * term.size + 12 :=
              Nat.le_trans (by decide : 4 ≤ 12) (Nat.le_add_left _ _)
            have prefixBound := Nat.add_le_add_left allowance
              ((ParserBasePrimitive.parse context.expectedAct term).operations +
                (context.localParser term).operations + (ParserCellPrimitive.parse term).operations)
            have bound := Nat.le_trans
              (by simpa only [show 4 = 1 + 1 + 2 by rfl,
                Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using prefixBound) cellPrefix
            simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
              Nat.le_trans bound (linear_le_square _ term.size)
          · next bit predecessor found =>
              have smaller := cell_predecessor_lt found rfl
              have inner := ih predecessor smaller
              have append := extend_operations_le (decode context predecessor) bit predecessor.size
                (fun _ success => decode_length_le context success)
              have appendBound := Nat.le_trans append
                (Nat.add_le_add_right (Nat.add_le_add_left
                  (Nat.mul_le_mul_left 4 (Nat.le_of_lt smaller)) _) 5)
              have first := Nat.add_le_add_left appendBound
                ((ParserBasePrimitive.parse context.expectedAct term).operations + 1 +
                  (context.localParser term).operations + 1 +
                    (ParserCellPrimitive.parse term).operations + 5)
              have combined := combine_descent smaller cellPrefix inner
              exact Nat.le_trans first (by simpa only [show 12 = 1 + 1 + 5 + 5 by rfl,
                Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined)
          · next bit predecessor found =>
              have smaller := cell_predecessor_lt found rfl
              have inner := ih predecessor smaller
              have allowance : 7 ≤ 4 * term.size + 12 :=
                Nat.le_trans (by decide : 7 ≤ 12) (Nat.le_add_left _ _)
              have prefixBound := Nat.add_le_add_left allowance
                ((ParserBasePrimitive.parse context.expectedAct term).operations +
                  (context.localParser term).operations + (ParserCellPrimitive.parse term).operations)
              have outer := Nat.le_trans (by simpa only [show 7 = 1 + 1 + 5 by rfl,
                Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using prefixBound) cellPrefix
              simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
                combine_descent smaller outer inner

end PureSFormal.PureS.ParserCarrierPrimitive
