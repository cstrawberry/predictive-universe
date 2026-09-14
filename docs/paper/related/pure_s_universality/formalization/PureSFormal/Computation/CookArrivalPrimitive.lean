import PureSFormal.Computation.CookBoundaryPrimitive

/-!
# Primitive directional-arrival inversion

Arrival selection and exponents use explicit unary comparison, radix-eight
division, subtraction, and counter inversion. The fixed radix and symbol
tables are prepared grammar data. Successful inverse identities account for
the final registered-word guard without reconstructing radix encodings.
-/

namespace PureSFormal.Computation.CookArrivalPrimitive

open PureS PureS.ParserPrimitiveMachine Cook Cook.PassClassification
open PureS.ParserRoutePrimitive (andThen charge andThen_value andThen_operations_le)

def selector (counts : RunCounts) : Result (Option ArrivalDirection) :=
  let head := ParserTerminalPrimitive.equalIndex 1 counts.head
  if head.value then
    let division := ParserNatDivisionPrimitive.divMod 8 counts.left
    match division.value.2 with
    | 0 => ⟨some .right, head.operations + division.operations + 7⟩
    | .succ _ => ⟨some .left, head.operations + division.operations + 7⟩
  else ⟨none, head.operations + 3⟩

theorem selector_value (counts : RunCounts) : (selector counts).value = arrivalOnlySelector counts := by
  unfold selector arrivalOnlySelector
  dsimp only
  by_cases head : counts.head = 1
  · rw [if_pos ((ParserTerminalPrimitive.equalIndex_value _ _).mpr head.symm), if_pos head,
      ParserNatDivisionPrimitive.divMod_value]
    cases counts.left % 8 <;> rfl
  · rw [if_neg (fun accepted => head ((ParserTerminalPrimitive.equalIndex_value _ _).mp accepted).symm),
      if_neg head]

theorem selector_head (counts : RunCounts) (direction : ArrivalDirection)
    (accepted : arrivalOnlySelector counts = some direction) : counts.head = 1 := by
  unfold arrivalOnlySelector at accepted
  split at accepted
  · assumption
  · cases accepted

theorem selector_operations_le (counts : RunCounts) :
    (selector counts).operations ≤ 64 * (counts.left + 1) := by
  have head := ParserTerminalPrimitive.equalIndex_operations_le 1 counts.head
  have division := ParserNatDivisionPrimitive.divMod_operations_le 8 counts.left
  have full := Nat.add_le_add_right (Nat.add_le_add head division) 7
  have bound : 6 + (46 * counts.left + 3) + 7 ≤ 64 * (counts.left + 1) := by
    have numeric := ParserCarrierPrimitive.linear_bound (by decide : 46 ≤ 64) (by decide : 6 + 3 + 7 ≤ 64) counts.left
    simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using numeric
  unfold selector
  dsimp only
  split
  · split <;> exact Nat.le_trans full bound
  · exact Nat.le_trans (Nat.add_le_add_right head 3)
      (Nat.le_trans (by decide : 6 + 3 ≤ 64) (ParserRoutePrimitive.constant_le_scale 64 counts.left))

def exponent (stop count : Nat) : Result (Option (MachineSymbol × List MachineSymbol)) :=
  let division := ParserNatDivisionPrimitive.divMod 8 count
  let remainder := division.value.2
  let selected := CookCounterPrimitive.digit remainder
  let output := andThen selected fun current =>
    let remaining := ParserNatPrimitive.subtract count remainder
    charge remaining.operations (andThen (CookCounterPrimitive.decode stop remaining.value) fun side =>
      ⟨some (current, side), 2⟩)
  ⟨output.value, division.operations + output.operations + 1⟩

theorem exponent_value (stop count : Nat) : (exponent stop count).value = (do
    let current ← Cook.symbolOfDigitWeight? (count % 8)
    let side ← (CookCounterPrimitive.decode stop (count - count % 8)).value
    some (current, side)) := by
  unfold exponent
  dsimp only
  rw [ParserNatDivisionPrimitive.divMod_value, andThen_value, CookCounterPrimitive.digit_value]
  cases Cook.symbolOfDigitWeight? (count % 8) with
  | none => rfl
  | some current =>
      change (andThen (CookCounterPrimitive.decode stop (ParserNatPrimitive.subtract count (count % 8)).value) _).value = _
      rw [ParserNatPrimitive.subtract_value, andThen_value]
      rfl

def leftExponent (count : Nat) : Result (Option (MachineSymbol × List MachineSymbol)) := exponent 8 count
def rightExponent (count : Nat) : Result (Option (MachineSymbol × List MachineSymbol)) := exponent 0 count

theorem leftExponent_value (count : Nat) :
    (leftExponent count).value = Cook.decodeLeftArrivalExponent? count := by
  change (exponent 8 count).value = _
  rw [exponent_value]
  unfold Cook.decodeLeftArrivalExponent?
  cases Cook.symbolOfDigitWeight? (count % 8) with
  | none => rfl
  | some current =>
      change ((CookCounterPrimitive.left (count - count % 8)).value.bind _ = _)
      rw [CookCounterPrimitive.left_value]
      rfl

theorem rightExponent_value (count : Nat) :
    (rightExponent count).value = Cook.decodeRightArrivalExponent? count := by
  change (exponent 0 count).value = _
  rw [exponent_value]
  unfold Cook.decodeRightArrivalExponent?
  cases Cook.symbolOfDigitWeight? (count % 8) with
  | none => rfl
  | some current =>
      change ((CookCounterPrimitive.right (count - count % 8)).value.bind _ = _)
      rw [CookCounterPrimitive.right_value]
      rfl

theorem exponent_reconstruct (stop count : Nat) (parsed : MachineSymbol × List MachineSymbol)
    (accepted : (exponent stop count).value = some parsed) :
    digitWeight parsed.1 + CookBoundaryPrimitive.radixCode stop parsed.2 = count := by
  rw [exponent_value] at accepted
  cases selected : Cook.symbolOfDigitWeight? (count % 8) with
  | none => rw [selected] at accepted; cases accepted
  | some current =>
      rw [selected] at accepted
      change (do
        let side ← (CookCounterPrimitive.decode stop (count - count % 8)).value
        some (current, side)) = some parsed at accepted
      cases decoded : (CookCounterPrimitive.decode stop (count - count % 8)).value with
      | none => rw [decoded] at accepted; cases accepted
      | some side =>
          rw [decoded] at accepted
          cases Option.some.inj accepted
          dsimp only
          rw [CookBoundaryPrimitive.digit_sound _ _ selected,
            CookBoundaryPrimitive.decode_reconstruct _ _ _ decoded]
          exact Nat.add_sub_of_le (Nat.mod_le count 8)

theorem leftExponent_reconstruct (count : Nat) (parsed : MachineSymbol × List MachineSymbol)
    (accepted : Cook.decodeLeftArrivalExponent? count = some parsed) :
    digitWeight parsed.1 + leftCounter parsed.2 = count := by
  rw [← leftExponent_value] at accepted
  rw [← CookBoundaryPrimitive.radixCode_left]
  exact exponent_reconstruct 8 count parsed accepted

theorem rightExponent_reconstruct (count : Nat) (parsed : MachineSymbol × List MachineSymbol)
    (accepted : Cook.decodeRightArrivalExponent? count = some parsed) :
    digitWeight parsed.1 + rightCounter parsed.2 = count := by
  rw [← rightExponent_value] at accepted
  rw [← CookBoundaryPrimitive.radixCode_right]
  exact exponent_reconstruct 0 count parsed accepted

theorem exponent_operations_le (stop count : Nat) :
    (exponent stop count).operations ≤ (4 * stop + 512) * (count + 1) ^ 2 := by
  let division := ParserNatDivisionPrimitive.divMod 8 count
  let remainder := division.value.2
  let remaining := ParserNatPrimitive.subtract count remainder
  have remainderBound : remainder ≤ 8 :=
    Nat.le_of_lt (ParserNatDivisionPrimitive.remainder_lt 8 (by decide) count)
  have remainingBound : remaining.value ≤ count := by
    rw [ParserNatPrimitive.subtract_value]
    exact Nat.sub_le _ _
  have subtraction : remaining.operations ≤ 34 := Nat.le_trans (ParserNatPrimitive.subtract_operations_le _ _)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 4 remainderBound) 2)
  have counter := Nat.le_trans (CookCounterPrimitive.decode_operations_le stop remaining.value)
    (Nat.mul_le_mul_left (CookCounterPrimitive.coefficient stop) (ParserPositivePrimitive.square_mono remainingBound))
  have inner current : (charge remaining.operations
      (andThen (CookCounterPrimitive.decode stop remaining.value) fun side =>
        (⟨some (current, side), 2⟩ : Result (Option (MachineSymbol × List MachineSymbol))))).operations ≤
      CookCounterPrimitive.coefficient stop * (count + 1) ^ 2 + 38 := by
    change remaining.operations + (andThen _ _).operations ≤ _
    have first := Nat.add_le_add subtraction (andThen_operations_le
      (CookCounterPrimitive.decode stop remaining.value)
      (fun side => (⟨some (current, side), 2⟩ : Result (Option (MachineSymbol × List MachineSymbol))))
      2 (fun _ _ => Nat.le_refl _))
    apply Nat.le_trans first
    have second := Nat.add_le_add_left (Nat.add_le_add_right (Nat.add_le_add_right counter 2) 2) 34
    apply Nat.le_trans second
    simp only [show 38 = 34 + 2 + 2 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.le_refl]
  have outer := andThen_operations_le (CookCounterPrimitive.digit remainder)
    (fun current => charge remaining.operations (andThen (CookCounterPrimitive.decode stop remaining.value) fun side =>
      (⟨some (current, side), 2⟩ : Result (Option (MachineSymbol × List MachineSymbol)))))
    (CookCounterPrimitive.coefficient stop * (count + 1) ^ 2 + 38) (fun current _ => inner current)
  have selected := CookCounterPrimitive.digit_operations_le remainder
  change division.operations + (andThen (CookCounterPrimitive.digit remainder) _).operations + 1 ≤ _
  apply Nat.le_trans (Nat.add_le_add_right (Nat.add_le_add (ParserNatDivisionPrimitive.divMod_operations_le 8 count) outer) 1)
  apply Nat.le_trans (Nat.add_le_add_right (Nat.add_le_add_left
    (Nat.add_le_add_right (Nat.add_le_add_right selected 2)
      (CookCounterPrimitive.coefficient stop * (count + 1) ^ 2 + 38)) (46 * count + 3)) 1)
  have overhead := Nat.le_trans
    (ParserCarrierPrimitive.linear_bound (by decide : 46 ≤ 256) (by decide : 3 + 36 + 2 + 38 + 1 ≤ 256) count)
    (ParserCarrierPrimitive.linear_le_square 256 count)
  have combined := Nat.add_le_add_left overhead (CookCounterPrimitive.coefficient stop * (count + 1) ^ 2)
  calc
    _ ≤ CookCounterPrimitive.coefficient stop * (count + 1) ^ 2 + 256 * (count + 1) ^ 2 := by
      simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined
    _ = _ := by
      rw [← Nat.add_mul]
      rfl

def leftSpec (state : MachineState) (counts : RunCounts) : Option DecodedArrival := do
  let right ← Cook.decodeRightCounter? counts.right
  if counts.left = 1 then
    some ⟨.left, .periodicTail, ⟨state, .s4, [], right⟩⟩
  else do
    let (current, left) ← Cook.decodeLeftArrivalExponent? counts.left
    some ⟨.left, .representedCell, ⟨state, current, left, right⟩⟩

def rightSpec (state : MachineState) (counts : RunCounts) : Option DecodedArrival := do
  let left ← Cook.decodeLeftCounter? counts.left
  if counts.right = 0 then
    some ⟨.right, .periodicTail, ⟨state, .s4, left, []⟩⟩
  else do
    let (current, right) ← Cook.decodeRightArrivalExponent? counts.right
    some ⟨.right, .representedCell, ⟨state, current, left, right⟩⟩

theorem counts_eq (state : MachineState) (counts : RunCounts) :
    Cook.decodeArrivalCounts? state counts = (arrivalOnlySelector counts).bind (fun direction =>
      match direction with
      | .left => leftSpec state counts
      | .right => rightSpec state counts) := rfl

theorem leftSpec_reconstruct (state : MachineState) (counts : RunCounts) (decoded : DecodedArrival)
    (head : counts.head = 1) (accepted : leftSpec state counts = some decoded) :
    decoded.config.state = state ∧ arrivalCounts decoded.direction decoded.origin decoded.config = counts := by
  unfold leftSpec at accepted
  cases right : Cook.decodeRightCounter? counts.right with
  | none => rw [right] at accepted; cases accepted
  | some rightSide =>
      rw [right] at accepted
      change (if counts.left = 1 then some _ else _) = some decoded at accepted
      by_cases periodic : counts.left = 1
      · rw [if_pos periodic] at accepted
        cases Option.some.inj accepted
        constructor
        · rfl
        · change RunCounts.mk 1 1 (rightCounter rightSide) = counts
          rw [CookBoundaryPrimitive.right_reconstruct _ _ right]
          cases counts with
          | mk h l r =>
              dsimp only at head periodic
              cases head
              cases periodic
              rfl
      · rw [if_neg periodic] at accepted
        cases exponent : Cook.decodeLeftArrivalExponent? counts.left with
        | none => rw [exponent] at accepted; cases accepted
        | some parsed =>
            cases parsed with
            | mk current leftSide =>
                rw [exponent] at accepted
                cases Option.some.inj accepted
                constructor
                · rfl
                · change RunCounts.mk 1 (digitWeight current + leftCounter leftSide) (rightCounter rightSide) = counts
                  rw [← head, leftExponent_reconstruct _ _ exponent, CookBoundaryPrimitive.right_reconstruct _ _ right]

theorem rightSpec_reconstruct (state : MachineState) (counts : RunCounts) (decoded : DecodedArrival)
    (head : counts.head = 1) (accepted : rightSpec state counts = some decoded) :
    decoded.config.state = state ∧ arrivalCounts decoded.direction decoded.origin decoded.config = counts := by
  unfold rightSpec at accepted
  cases left : Cook.decodeLeftCounter? counts.left with
  | none => rw [left] at accepted; cases accepted
  | some leftSide =>
      rw [left] at accepted
      change (if counts.right = 0 then some _ else _) = some decoded at accepted
      by_cases periodic : counts.right = 0
      · rw [if_pos periodic] at accepted
        cases Option.some.inj accepted
        constructor
        · rfl
        · change RunCounts.mk 1 (leftCounter leftSide) 0 = counts
          rw [← head, ← periodic, CookBoundaryPrimitive.left_reconstruct _ _ left]
      · rw [if_neg periodic] at accepted
        cases exponent : Cook.decodeRightArrivalExponent? counts.right with
        | none => rw [exponent] at accepted; cases accepted
        | some parsed =>
            cases parsed with
            | mk current rightSide =>
                rw [exponent] at accepted
                cases Option.some.inj accepted
                constructor
                · rfl
                · change RunCounts.mk 1 (leftCounter leftSide) (digitWeight current + rightCounter rightSide) = counts
                  rw [← head, rightExponent_reconstruct _ _ exponent, CookBoundaryPrimitive.left_reconstruct _ _ left]

theorem counts_reconstruct (state : MachineState) (counts : RunCounts) (decoded : DecodedArrival)
    (accepted : Cook.decodeArrivalCounts? state counts = some decoded) :
    decoded.config.state = state ∧ arrivalCounts decoded.direction decoded.origin decoded.config = counts := by
  rw [counts_eq] at accepted
  cases direction : arrivalOnlySelector counts with
  | none => rw [direction] at accepted; cases accepted
  | some selected =>
      rw [direction] at accepted
      cases selected with
      | left => exact leftSpec_reconstruct state counts decoded (selector_head _ _ direction) accepted
      | right => exact rightSpec_reconstruct state counts decoded (selector_head _ _ direction) accepted

theorem raw_reconstruct (word : List TagSymbol) (decoded : DecodedArrival)
    (accepted : Cook.decodeArrivalRaw? word = some decoded) :
    word = arrivalWord decoded.direction decoded.origin decoded.config := by
  unfold Cook.decodeArrivalRaw? at accepted
  cases parsed : Cook.parseRunWord? word with
  | none => rw [parsed] at accepted; cases accepted
  | some result =>
      rw [parsed] at accepted
      have fields := counts_reconstruct result.1 result.2 decoded accepted
      unfold arrivalWord
      rw [fields.1, fields.2]
      exact CookBoundaryPrimitive.run_reconstruct _ _ parsed

theorem arrival_eq_raw (word : List TagSymbol) : Cook.decodeArrival? word = Cook.decodeArrivalRaw? word := by
  unfold Cook.decodeArrival?
  cases accepted : Cook.decodeArrivalRaw? word with
  | none => rfl
  | some decoded => exact if_pos (raw_reconstruct _ _ accepted)

def leftFinish (state : MachineState) (count : Nat) (right : List MachineSymbol) :
    Result (Option DecodedArrival) :=
  let periodic := ParserTerminalPrimitive.equalIndex 1 count
  if periodic.value then
    ⟨some ⟨.left, .periodicTail, ⟨state, .s4, [], right⟩⟩, periodic.operations + 8⟩
  else
    let decoded := andThen (leftExponent count) fun parsed =>
      ⟨some ⟨.left, .representedCell, ⟨state, parsed.1, parsed.2, right⟩⟩, 7⟩
    ⟨decoded.value, periodic.operations + decoded.operations + 1⟩

def rightFinish (state : MachineState) (count : Nat) (left : List MachineSymbol) :
    Result (Option DecodedArrival) :=
  let periodic := ParserTerminalPrimitive.equalIndex 0 count
  if periodic.value then
    ⟨some ⟨.right, .periodicTail, ⟨state, .s4, left, []⟩⟩, periodic.operations + 8⟩
  else
    let decoded := andThen (rightExponent count) fun parsed =>
      ⟨some ⟨.right, .representedCell, ⟨state, parsed.1, left, parsed.2⟩⟩, 7⟩
    ⟨decoded.value, periodic.operations + decoded.operations + 1⟩

def leftBody (state : MachineState) (counts : RunCounts) : Result (Option DecodedArrival) :=
  charge 2 (andThen (CookCounterPrimitive.right counts.right) (leftFinish state counts.left))

def rightBody (state : MachineState) (counts : RunCounts) : Result (Option DecodedArrival) :=
  charge 2 (andThen (CookCounterPrimitive.left counts.left) (rightFinish state counts.right))

def body (state : MachineState) (counts : RunCounts) : Result (Option DecodedArrival) :=
  andThen (selector counts) fun direction =>
    charge 1 (match direction with
      | .left => leftBody state counts
      | .right => rightBody state counts)

def arrival (word : List TagSymbol) : Result (Option DecodedArrival) :=
  andThen (CookRunWordPrimitive.parse word) fun parsed => charge 2 (body parsed.1 parsed.2)

theorem leftFinish_value (state : MachineState) (count : Nat) (right : List MachineSymbol) :
    (leftFinish state count right).value =
      (if count = 1 then some (DecodedArrival.mk .left .periodicTail ⟨state, .s4, [], right⟩)
      else do
        let (current, left) ← Cook.decodeLeftArrivalExponent? count
        some (DecodedArrival.mk .left .representedCell ⟨state, current, left, right⟩)) := by
  unfold leftFinish
  dsimp only
  by_cases periodic : count = 1
  · rw [if_pos ((ParserTerminalPrimitive.equalIndex_value _ _).mpr periodic.symm), if_pos periodic]
  · rw [if_neg (fun accepted => periodic ((ParserTerminalPrimitive.equalIndex_value _ _).mp accepted).symm),
      if_neg periodic]
    dsimp only
    rw [andThen_value, leftExponent_value]
    rfl

theorem rightFinish_value (state : MachineState) (count : Nat) (left : List MachineSymbol) :
    (rightFinish state count left).value =
      (if count = 0 then some (DecodedArrival.mk .right .periodicTail ⟨state, .s4, left, []⟩)
      else do
        let (current, right) ← Cook.decodeRightArrivalExponent? count
        some (DecodedArrival.mk .right .representedCell ⟨state, current, left, right⟩)) := by
  unfold rightFinish
  dsimp only
  by_cases periodic : count = 0
  · rw [if_pos ((ParserTerminalPrimitive.equalIndex_value _ _).mpr periodic.symm), if_pos periodic]
  · rw [if_neg (fun accepted => periodic ((ParserTerminalPrimitive.equalIndex_value _ _).mp accepted).symm),
      if_neg periodic]
    dsimp only
    rw [andThen_value, rightExponent_value]
    rfl

theorem leftBody_value (state : MachineState) (counts : RunCounts) :
    (leftBody state counts).value = leftSpec state counts := by
  change (andThen (CookCounterPrimitive.right counts.right) _).value = _
  rw [andThen_value, CookCounterPrimitive.right_value]
  unfold leftSpec
  cases Cook.decodeRightCounter? counts.right with
  | none => rfl
  | some right => exact leftFinish_value state counts.left right

theorem rightBody_value (state : MachineState) (counts : RunCounts) :
    (rightBody state counts).value = rightSpec state counts := by
  change (andThen (CookCounterPrimitive.left counts.left) _).value = _
  rw [andThen_value, CookCounterPrimitive.left_value]
  unfold rightSpec
  cases Cook.decodeLeftCounter? counts.left with
  | none => rfl
  | some left => exact rightFinish_value state counts.right left

theorem body_value (state : MachineState) (counts : RunCounts) :
    (body state counts).value = Cook.decodeArrivalCounts? state counts := by
  unfold body
  rw [andThen_value, selector_value, counts_eq]
  cases arrivalOnlySelector counts with
  | none => rfl
  | some direction =>
      cases direction with
      | left => exact leftBody_value state counts
      | right => exact rightBody_value state counts

theorem arrival_value (word : List TagSymbol) : (arrival word).value = Cook.decodeArrival? word := by
  rw [arrival_eq_raw]
  unfold arrival Cook.decodeArrivalRaw?
  rw [andThen_value, CookRunWordPrimitive.parse_value]
  cases Cook.parseRunWord? word with
  | none => rfl
  | some parsed => exact body_value parsed.1 parsed.2

theorem finish_cost_bound (count comparisonCost exponentCost : Nat)
    (comparison : comparisonCost ≤ 6) (inverse : exponentCost ≤ 544 * (count + 1) ^ 2) :
    comparisonCost + (exponentCost + 2 + 7) + 1 ≤ 576 * (count + 1) ^ 2 := by
  apply Nat.le_trans (Nat.add_le_add_right
    (Nat.add_le_add comparison (Nat.add_le_add_right (Nat.add_le_add_right inverse 2) 7)) 1)
  have constantBound := ParserPositivePrimitive.constant_le_square 32 count
  calc
    _ ≤ 544 * (count + 1) ^ 2 + 32 := by
      simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
        Nat.add_le_add_left (by decide : 6 + 2 + 7 + 1 ≤ 32) (544 * (count + 1) ^ 2)
    _ ≤ (544 + 32) * (count + 1) ^ 2 := by
      rw [Nat.add_mul]
      exact Nat.add_le_add_left constantBound _
    _ = _ := rfl

theorem leftFinish_operations_le (state : MachineState) (count : Nat) (right : List MachineSymbol) :
    (leftFinish state count right).operations ≤ 576 * (count + 1) ^ 2 := by
  have comparison := ParserTerminalPrimitive.equalIndex_operations_le 1 count
  have inverse : (leftExponent count).operations ≤ 544 * (count + 1) ^ 2 := exponent_operations_le 8 count
  unfold leftFinish
  dsimp only
  split
  · exact Nat.le_trans (Nat.add_le_add_right comparison 8)
      (Nat.le_trans (by decide : 6 + 8 ≤ 576) (ParserPositivePrimitive.constant_le_square 576 count))
  · have next := andThen_operations_le (leftExponent count)
      (fun parsed => (⟨some ⟨.left, .representedCell, ⟨state, parsed.1, parsed.2, right⟩⟩, 7⟩ : Result (Option DecodedArrival)))
      7 (fun _ _ => Nat.le_refl _)
    exact Nat.le_trans (Nat.add_le_add_right (Nat.add_le_add_left next _) 1)
      (finish_cost_bound count _ _ comparison inverse)

theorem rightFinish_operations_le (state : MachineState) (count : Nat) (left : List MachineSymbol) :
    (rightFinish state count left).operations ≤ 576 * (count + 1) ^ 2 := by
  have comparison : (ParserTerminalPrimitive.equalIndex 0 count).operations ≤ 6 :=
    Nat.le_trans (ParserTerminalPrimitive.equalIndex_operations_le 0 count) (by decide : 2 ≤ 6)
  have inverse : (rightExponent count).operations ≤ 544 * (count + 1) ^ 2 :=
    Nat.le_trans (exponent_operations_le 0 count) (Nat.mul_le_mul_right _ (by decide : 512 ≤ 544))
  unfold rightFinish
  dsimp only
  split
  · exact Nat.le_trans (Nat.add_le_add_right comparison 8)
      (Nat.le_trans (by decide : 6 + 8 ≤ 576) (ParserPositivePrimitive.constant_le_square 576 count))
  · have next := andThen_operations_le (rightExponent count)
      (fun parsed => (⟨some ⟨.right, .representedCell, ⟨state, parsed.1, left, parsed.2⟩⟩, 7⟩ : Result (Option DecodedArrival)))
      7 (fun _ _ => Nat.le_refl _)
    exact Nat.le_trans (Nat.add_le_add_right (Nat.add_le_add_left next _) 1)
      (finish_cost_bound count _ _ comparison inverse)

theorem branch_cost_bound (size counterCost : Nat) (counter : counterCost ≤ 288 * (size + 1) ^ 2) :
    2 + (counterCost + 2 + 576 * (size + 1) ^ 2) ≤ 896 * (size + 1) ^ 2 := by
  apply Nat.le_trans (Nat.add_le_add_left (Nat.add_le_add_right (Nat.add_le_add_right counter 2)
    (576 * (size + 1) ^ 2)) 2)
  calc
    _ ≤ 288 * (size + 1) ^ 2 + 576 * (size + 1) ^ 2 + 32 := by
      simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
        Nat.add_le_add_left (by decide : 2 + 2 ≤ 32) (288 * (size + 1) ^ 2 + 576 * (size + 1) ^ 2)
    _ ≤ (288 + 576 + 32) * (size + 1) ^ 2 := by
      rw [Nat.add_mul, Nat.add_mul]
      exact Nat.add_le_add_left (ParserPositivePrimitive.constant_le_square 32 size) _
    _ = _ := rfl

theorem leftBody_operations_le (state : MachineState) (counts : RunCounts) (size : Nat)
    (left : counts.left ≤ size) (right : counts.right ≤ size) :
    (leftBody state counts).operations ≤ 896 * (size + 1) ^ 2 := by
  have finish rightSide := Nat.le_trans (leftFinish_operations_le state counts.left rightSide)
    (Nat.mul_le_mul_left 576 (ParserPositivePrimitive.square_mono left))
  have inverse : (CookCounterPrimitive.right counts.right).operations ≤ 288 * (size + 1) ^ 2 :=
    Nat.le_trans (CookCounterPrimitive.right_operations_le counts.right)
      (Nat.mul_le_mul (by decide : 256 ≤ 288) (ParserPositivePrimitive.square_mono right))
  have inner := andThen_operations_le (CookCounterPrimitive.right counts.right)
    (leftFinish state counts.left) (576 * (size + 1) ^ 2) (fun rightSide _ => finish rightSide)
  exact Nat.le_trans (Nat.add_le_add_left inner 2) (branch_cost_bound size _ inverse)

theorem rightBody_operations_le (state : MachineState) (counts : RunCounts) (size : Nat)
    (left : counts.left ≤ size) (right : counts.right ≤ size) :
    (rightBody state counts).operations ≤ 896 * (size + 1) ^ 2 := by
  have finish leftSide := Nat.le_trans (rightFinish_operations_le state counts.right leftSide)
    (Nat.mul_le_mul_left 576 (ParserPositivePrimitive.square_mono right))
  have inverse := Nat.le_trans (CookCounterPrimitive.left_operations_le counts.left)
    (Nat.mul_le_mul_left 288 (ParserPositivePrimitive.square_mono left))
  have inner := andThen_operations_le (CookCounterPrimitive.left counts.left)
    (rightFinish state counts.right) (576 * (size + 1) ^ 2) (fun leftSide _ => finish leftSide)
  exact Nat.le_trans (Nat.add_le_add_left inner 2) (branch_cost_bound size _ inverse)

theorem body_operations_le (state : MachineState) (counts : RunCounts) (size : Nat)
    (left : counts.left ≤ size) (right : counts.right ≤ size) :
    (body state counts).operations ≤ 1024 * (size + 1) ^ 2 := by
  have selected := Nat.le_trans (selector_operations_le counts)
    (Nat.le_trans (Nat.mul_le_mul_left 64 (Nat.add_le_add_right left 1))
      (ParserCarrierPrimitive.linear_le_square 64 size))
  have branches (direction : ArrivalDirection) :
      (charge 1 (match direction with
        | .left => leftBody state counts
        | .right => rightBody state counts)).operations ≤ 896 * (size + 1) ^ 2 + 1 := by
    cases direction with
    | left =>
        change 1 + (leftBody state counts).operations ≤ _
        rw [Nat.add_comm 1]
        exact Nat.add_le_add_right (leftBody_operations_le state counts size left right) 1
    | right =>
        change 1 + (rightBody state counts).operations ≤ _
        rw [Nat.add_comm 1]
        exact Nat.add_le_add_right (rightBody_operations_le state counts size left right) 1
  have inner := andThen_operations_le (selector counts)
    (fun direction => charge 1 (match direction with
      | .left => leftBody state counts
      | .right => rightBody state counts)) (896 * (size + 1) ^ 2 + 1) (fun direction _ => branches direction)
  apply Nat.le_trans inner
  apply Nat.le_trans (Nat.add_le_add_right (Nat.add_le_add_right selected 2) (896 * (size + 1) ^ 2 + 1))
  calc
    _ ≤ 64 * (size + 1) ^ 2 + 896 * (size + 1) ^ 2 + 64 := by
      simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
        Nat.add_le_add_left (by decide : 2 + 1 ≤ 64) (64 * (size + 1) ^ 2 + 896 * (size + 1) ^ 2)
    _ ≤ (64 + 896 + 64) * (size + 1) ^ 2 := by
      rw [Nat.add_mul, Nat.add_mul]
      exact Nat.add_le_add_left (ParserPositivePrimitive.constant_le_square 64 size) _
    _ = _ := rfl

theorem arrival_operations_le (word : List TagSymbol) :
    (arrival word).operations ≤ 1280 * (word.length + 1) ^ 2 := by
  have branches (parsed : MachineState × RunCounts) (accepted : (CookRunWordPrimitive.parse word).value = some parsed) :
      (charge 2 (body parsed.1 parsed.2)).operations ≤ 1024 * (word.length + 1) ^ 2 + 2 := by
    have fields := CookRunWordPrimitive.parse_counts_le word parsed accepted
    change 2 + (body parsed.1 parsed.2).operations ≤ _
    rw [Nat.add_comm 2]
    exact Nat.add_le_add_right (body_operations_le parsed.1 parsed.2 word.length fields.2.1 fields.2.2) 2
  have inner := andThen_operations_le (CookRunWordPrimitive.parse word)
    (fun parsed => charge 2 (body parsed.1 parsed.2)) (1024 * (word.length + 1) ^ 2 + 2) branches
  apply Nat.le_trans inner
  have parsed := Nat.le_trans (CookRunWordPrimitive.parse_operations_le word)
    (ParserCarrierPrimitive.linear_le_square 128 word.length)
  apply Nat.le_trans (Nat.add_le_add_right (Nat.add_le_add_right parsed 2) (1024 * (word.length + 1) ^ 2 + 2))
  calc
    _ ≤ 128 * (word.length + 1) ^ 2 + 1024 * (word.length + 1) ^ 2 + 128 := by
      simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
        Nat.add_le_add_left (by decide : 2 + 2 ≤ 128) (128 * (word.length + 1) ^ 2 + 1024 * (word.length + 1) ^ 2)
    _ ≤ (128 + 1024 + 128) * (word.length + 1) ^ 2 := by
      rw [Nat.add_mul, Nat.add_mul]
      exact Nat.add_le_add_left (ParserPositivePrimitive.constant_le_square 128 word.length) _
    _ = _ := rfl

theorem normalized_fields (direction : ArrivalDirection) (origin : ArrivalOrigin) (config : MachineConfig) :
    (Cook.normalizeArrivalConfig direction origin config).left.length ≤ (arrivalCounts direction origin config).left ∧
    (Cook.normalizeArrivalConfig direction origin config).right.length ≤ (arrivalCounts direction origin config).right := by
  have left : config.left.length ≤ leftCounter config.left := by
    rw [← CookBoundaryPrimitive.radixCode_left]
    exact CookBoundaryPrimitive.length_le_radixCode 8 config.left
  have right : config.right.length ≤ rightCounter config.right := by
    rw [← CookBoundaryPrimitive.radixCode_right]
    exact CookBoundaryPrimitive.length_le_radixCode 0 config.right
  cases direction with
  | left =>
      cases origin with
      | periodicTail => exact ⟨Nat.zero_le _, right⟩
      | representedCell => exact ⟨Nat.le_trans left (Nat.le_add_left _ _), right⟩
  | right =>
      cases origin with
      | periodicTail => exact ⟨left, Nat.zero_le _⟩
      | representedCell => exact ⟨left, Nat.le_trans right (Nat.le_add_left _ _)⟩

theorem arrival_fields (word : List TagSymbol) (decoded : DecodedArrival)
    (accepted : (arrival word).value = some decoded) :
    decoded.config.left.length ≤ word.length ∧ decoded.config.right.length ≤ word.length := by
  rw [arrival_value] at accepted
  have encoded := Cook.decodeArrival?_sound accepted
  have roundTrip := Cook.decodeArrival?_arrivalWord decoded.direction decoded.origin decoded.config
  rw [← encoded, accepted] at roundTrip
  have normalized : decoded.config = Cook.normalizeArrivalConfig decoded.direction decoded.origin decoded.config :=
    congrArg DecodedArrival.config (Option.some.inj roundTrip)
  have fields := normalized_fields decoded.direction decoded.origin decoded.config
  have leftBound : decoded.config.left.length ≤ (arrivalCounts decoded.direction decoded.origin decoded.config).left := by
    rw [congrArg (fun config : MachineConfig => config.left.length) normalized]
    exact fields.1
  have rightBound : decoded.config.right.length ≤ (arrivalCounts decoded.direction decoded.origin decoded.config).right := by
    rw [congrArg (fun config : MachineConfig => config.right.length) normalized]
    exact fields.2
  rw [encoded]
  simp only [arrivalWord, runWord, List.length_append, List.length_replicate]
  exact ⟨Nat.le_trans leftBound (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ _)),
    Nat.le_trans rightBound (Nat.le_add_left _ _)⟩

end PureSFormal.Computation.CookArrivalPrimitive
