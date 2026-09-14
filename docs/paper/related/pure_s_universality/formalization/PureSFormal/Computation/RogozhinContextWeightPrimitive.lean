import PureSFormal.Computation.RogozhinFramePrimitiveSize
import PureSFormal.Computation.RogozhinInputConstructionMachine
import PureSFormal.Computation.DeletionTwoReadbackPrimitive

/-!
# Primitive seed weight and label recovery

The runtime inputs are the literal immutable seed and a unary data width.
Frame reversal, bounded lookup, subtraction, comparison, and the finite
alphabet scan are charged through their primitive implementations. Large
requested labels and widths do not trigger unbounded search beyond the frames.

`seedLabel_value` agrees on every bitword with the seed-derived label codec;
`seedLabel_operations_le` bounds its work by `5213 * (bits.length + 1)^2`.
This is one component of the source-output reader. It does not certify the
remaining data-region validation or the complete source-output observer.
-/
namespace PureSFormal.Computation.RogozhinContextWeightPrimitive

open PureS.ParserPrimitiveMachine PureS.ParserNatPrimitive
open RogozhinFramePrimitiveSize
open RogozhinInputConstructionMachine (lookup lookup_value)

theorem exponentSize_append (left right : List Nat) :
    exponentSize (left ++ right) = exponentSize left + exponentSize right := by
  induction left with
  | nil => exact (Nat.zero_add _).symm
  | cons first rest ih => simp only [List.cons_append, exponentSize, ih, Nat.add_assoc]

theorem exponentSize_reverse (row : List Nat) : exponentSize row.reverse = exponentSize row := by
  induction row with
  | nil => rfl
  | cons first rest ih =>
      rw [List.reverse_cons, exponentSize_append, ih]
      simp only [exponentSize, Nat.add_zero, Nat.zero_add, Nat.add_comm]

theorem length_le_exponentSize (row : List Nat) : row.length ≤ exponentSize row := by
  induction row with
  | nil => exact Nat.le_refl _
  | cons first rest ih =>
      exact Nat.le_trans (Nat.succ_le_succ ih)
        (by simpa only [exponentSize, Nat.succ_eq_add_one, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
          using Nat.le_add_left (exponentSize rest + 1) first)

theorem contextSize_append (left right : List (List Nat)) :
    contextSize (left ++ right) = contextSize left + contextSize right := by
  induction left with
  | nil => exact (Nat.zero_add _).symm
  | cons first rest ih => simp only [List.cons_append, contextSize, ih, Nat.add_assoc]

theorem contextSize_reverse (rows : List (List Nat)) : contextSize rows.reverse = contextSize rows := by
  induction rows with
  | nil => rfl
  | cons first rest ih =>
      rw [List.reverse_cons, contextSize_append, ih]
      simp only [contextSize, Nat.add_zero, Nat.zero_add, Nat.add_comm]

theorem length_le_contextSize (rows : List (List Nat)) : rows.length ≤ contextSize rows := by
  induction rows with
  | nil => exact Nat.le_refl _
  | cons first rest ih =>
      have bound := Nat.le_trans (Nat.succ_le_succ ih)
        (Nat.le_add_left (contextSize rest + 1) (exponentSize first))
      simpa only [contextSize, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using! bound

theorem lookup_operations_le_length {α : Type} (fallback : α) (rows : List α) (index : Nat) :
    (lookup fallback rows index).operations ≤ 5 * rows.length + 3 := by
  induction rows generalizing index with
  | nil => exact (by decide : 2 ≤ 3)
  | cons first rest ih =>
      cases index with
      | zero => exact Nat.le_add_left _ _
      | succ index =>
          have bound := Nat.add_le_add_left (ih index) 5
          simpa only [lookup, List.length_cons, Nat.mul_succ, Nat.add_assoc,
            Nat.add_comm, Nat.add_left_comm] using bound

theorem lookup_size (rows : List (List Nat)) (index : Nat) :
    exponentSize (lookup [] rows index).value ≤ contextSize rows := by
  induction rows generalizing index with
  | nil => exact Nat.le_refl _
  | cons first rest ih =>
      cases index with
      | zero =>
          exact Nat.le_trans (Nat.le_add_left (exponentSize first) 1) (Nat.le_add_right _ _)
      | succ index => exact Nat.le_trans (ih index) (Nat.le_add_left _ _)

def difference : List Nat → Result Nat
  | gap :: maximum :: _ =>
      let subtracted := subtract maximum gap
      ⟨subtracted.value, subtracted.operations + 6⟩
  | [] => ⟨0, 1⟩
  | [_] => ⟨0, 3⟩

theorem difference_operations_le (row : List Nat) :
    (difference row).operations ≤ 4 * exponentSize row + 8 := by
  cases row with
  | nil => exact (by decide : 1 ≤ 8)
  | cons gap rest =>
      cases rest with
      | nil => exact Nat.le_trans (by decide : 3 ≤ 8) (Nat.le_add_left _ _)
      | cons maximum rest =>
          have gapBound : gap ≤ exponentSize (gap :: maximum :: rest) :=
            Nat.le_trans (Nat.le_succ _) (Nat.le_add_right _ _)
          have counted := Nat.add_le_add_right (subtract_operations_le maximum gap) 6
          exact Nat.le_trans counted (by
            simpa only [difference, Nat.add_assoc] using
              Nat.add_le_add_right (Nat.mul_le_mul_left 4 gapBound) 8)

def frameWeight (row : List Nat) : Result Nat :=
  let reversed := RogozhinSeedPrimitive.reverse row
  let decoded := difference reversed.value
  ⟨decoded.value, reversed.operations + decoded.operations + 1⟩

theorem frameWeight_value (row : List Nat) :
    (frameWeight row).value = CookSeedReadbackContext.frameWeight row := by
  change (difference (RogozhinSeedPrimitive.reverse row).value).value = _
  unfold CookSeedReadbackContext.frameWeight
  rw [RogozhinSeedPrimitive.reverse_value]
  cases row.reverse with
  | nil => rfl
  | cons gap rest => cases rest with
    | nil => rfl
    | cons maximum rest => exact subtract_value maximum gap

theorem frameWeight_operations_le (row : List Nat) :
    (frameWeight row).operations ≤ 8 * exponentSize row + 16 := by
  have reversal := RogozhinSeedPrimitive.reverse_operations row
  have differenceBound := difference_operations_le (RogozhinSeedPrimitive.reverse row).value
  rw [RogozhinSeedPrimitive.reverse_value, exponentSize_reverse] at differenceBound
  have reverseBound : (RogozhinSeedPrimitive.reverse row).operations ≤ 4 * exponentSize row + 2 := by
    rw [reversal]
    exact Nat.add_le_add_right (Nat.mul_le_mul_left 4 (length_le_exponentSize row)) 2
  have counted := Nat.add_le_add_right (Nat.add_le_add reverseBound differenceBound) 1
  change (RogozhinSeedPrimitive.reverse row).operations +
    (difference (RogozhinSeedPrimitive.reverse row).value).operations + 1 ≤ _
  rw [RogozhinSeedPrimitive.reverse_value]
  apply Nat.le_trans counted
  change (4 * exponentSize row + 2) + (4 * exponentSize row + 8) + 1 ≤ _
  have expanded : (4 * exponentSize row + 2) + (4 * exponentSize row + 8) + 1 =
      8 * exponentSize row + 11 := by
    rw [show 8 * exponentSize row = 4 * exponentSize row + 4 * exponentSize row from Nat.add_mul 4 4 (exponentSize row)]
    simp only [show 11 = 2 + 8 + 1 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [expanded]
  exact Nat.add_le_add_left (by decide : 11 ≤ 16) _

def nonhaltingWeight (context : CookSeedReadbackContext.Context) (label : Nat) : Result Nat :=
  let reversed := RogozhinSeedPrimitive.reverse context.frames
  let selected := lookup [] reversed.value label
  let decoded := frameWeight selected.value
  ⟨decoded.value, reversed.operations + selected.operations + decoded.operations + 3⟩

theorem nonhaltingWeight_value (context : CookSeedReadbackContext.Context) (label : Nat) :
    (nonhaltingWeight context label).value = context.nonhaltingWeight label := by
  unfold nonhaltingWeight CookSeedReadbackContext.Context.nonhaltingWeight
  rw [frameWeight_value, lookup_value, RogozhinSeedPrimitive.reverse_value]

theorem nonhaltingWeight_operations_le (context : CookSeedReadbackContext.Context) (label : Nat) :
    (nonhaltingWeight context label).operations ≤ 17 * contextSize context.frames + 24 := by
  have reversedLength : (RogozhinSeedPrimitive.reverse context.frames).value.length = context.frames.length := by
    rw [RogozhinSeedPrimitive.reverse_value, List.length_reverse]
  have reverseBound : (RogozhinSeedPrimitive.reverse context.frames).operations ≤
      4 * contextSize context.frames + 2 := by
    rw [RogozhinSeedPrimitive.reverse_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul_left 4 (length_le_contextSize context.frames)) 2
  have lookupBound := lookup_operations_le_length ([] : List Nat)
    (RogozhinSeedPrimitive.reverse context.frames).value label
  rw [reversedLength] at lookupBound
  have lookupBound' := Nat.le_trans lookupBound
    (Nat.add_le_add_right (Nat.mul_le_mul_left 5 (length_le_contextSize context.frames)) 3)
  have sizeBound := lookup_size (RogozhinSeedPrimitive.reverse context.frames).value label
  rw [RogozhinSeedPrimitive.reverse_value, contextSize_reverse] at sizeBound
  have decodedBound := Nat.le_trans (frameWeight_operations_le _)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 8 sizeBound) 16)
  have counted := Nat.add_le_add_right
    (Nat.add_le_add (Nat.add_le_add reverseBound lookupBound') decodedBound) 3
  rw [RogozhinSeedPrimitive.reverse_value] at counted
  change (RogozhinSeedPrimitive.reverse context.frames).operations +
    (lookup [] (RogozhinSeedPrimitive.reverse context.frames).value label).operations +
    (frameWeight (lookup [] (RogozhinSeedPrimitive.reverse context.frames).value label).value).operations + 3 ≤ _
  rw [RogozhinSeedPrimitive.reverse_value]
  apply Nat.le_trans counted
  apply Nat.le_of_eq
  rw [show 17 = 4 + 5 + 8 by rfl, Nat.add_mul, Nat.add_mul]
  simp only [show 24 = 2 + 3 + 16 + 3 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem difference_value_le (row : List Nat) :
    (difference row).value ≤ exponentSize row := by
  cases row with
  | nil => exact Nat.le_refl _
  | cons gap rest => cases rest with
    | nil => exact Nat.zero_le _
    | cons maximum rest =>
        change (subtract maximum gap).value ≤ _
        rw [subtract_value]
        exact Nat.le_trans (Nat.sub_le maximum gap)
          (Nat.le_trans (Nat.le_succ maximum)
            (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_left _ _)))

theorem frameWeight_value_le (row : List Nat) :
    (frameWeight row).value ≤ exponentSize row := by
  have bound := difference_value_le (RogozhinSeedPrimitive.reverse row).value
  rw [RogozhinSeedPrimitive.reverse_value, exponentSize_reverse] at bound
  simpa only [frameWeight, RogozhinSeedPrimitive.reverse_value] using bound

theorem nonhaltingWeight_value_le (context : CookSeedReadbackContext.Context) (label : Nat) :
    (nonhaltingWeight context label).value ≤ contextSize context.frames := by
  have bound := Nat.le_trans (frameWeight_value_le _)
    (lookup_size (RogozhinSeedPrimitive.reverse context.frames).value label)
  rw [RogozhinSeedPrimitive.reverse_value, contextSize_reverse] at bound
  simpa only [nonhaltingWeight, RogozhinSeedPrimitive.reverse_value] using bound

def beyond (context : CookSeedReadbackContext.Context) (count : Nat) : Result Nat :=
  let previous := subtract count 1
  let inner := nonhaltingWeight context previous.value
  let result := add 4 inner.value
  ⟨result.value, previous.operations + inner.operations + result.operations + 2⟩

theorem beyond_value (context : CookSeedReadbackContext.Context) (count : Nat) :
    (beyond context count).value = context.nonhaltingWeight (count - 1) + 4 := by
  change (add 4 (nonhaltingWeight context (subtract count 1).value).value).value = _
  rw [add_value, nonhaltingWeight_value, subtract_value, Nat.add_comm]

theorem beyond_operations_le (context : CookSeedReadbackContext.Context) (count : Nat) :
    (beyond context count).operations ≤ 17 * contextSize context.frames + 49 := by
  have bound := Nat.add_le_add_right
    (Nat.add_le_add (Nat.add_le_add (subtract_operations_le count 1)
      (nonhaltingWeight_operations_le context (subtract count 1).value))
      (Nat.le_refl (4 * 4 + 1))) 2
  simpa only [beyond, add_operations, show 4 * 1 + 2 = 6 by rfl,
    show 4 * 4 + 1 = 17 by rfl, show 49 = 6 + 24 + 17 + 2 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def choose (context : CookSeedReadbackContext.Context) (label count : Nat) (inside : Bool) : Result Nat :=
  if inside then nonhaltingWeight context label else beyond context count

theorem choose_operations_le (context : CookSeedReadbackContext.Context)
    (label count : Nat) (inside : Bool) :
    (choose context label count inside).operations ≤ 17 * contextSize context.frames + 49 := by
  cases inside with
  | false => exact beyond_operations_le context count
  | true =>
    exact Nat.le_trans (nonhaltingWeight_operations_le context label)
      (Nat.add_le_add_left (by decide : 24 ≤ 49) _)

/-- Includes context-field access, successor allocation, and the range-result branch. -/
def weight (context : CookSeedReadbackContext.Context) (label : Nat) : Result Nat :=
  let count := RogozhinInputConstructionMachine.length context.frames
  let inside := DeletionTwoReadbackPrimitive.atMost (Nat.succ label) count.value
  let decoded := choose context label count.value inside.value
  ⟨decoded.value, count.operations + inside.operations + decoded.operations + 4⟩

theorem weight_value (context : CookSeedReadbackContext.Context) (label : Nat) :
    (weight context label).value = context.weight label := by
  change (choose context label (RogozhinInputConstructionMachine.length context.frames).value
    (DeletionTwoReadbackPrimitive.atMost (Nat.succ label)
      (RogozhinInputConstructionMachine.length context.frames).value).value).value = _
  rw [RogozhinInputConstructionMachine.length_value]
  unfold CookSeedReadbackContext.Context.weight CookSeedReadbackContext.Context.symbolCount choose
  by_cases inside : label < context.frames.length
  · rw [(DeletionTwoReadbackPrimitive.atMost_value (Nat.succ label) context.frames.length).mpr inside]
    simp only [↓reduceIte, if_pos inside, nonhaltingWeight_value]
  · have outside : (DeletionTwoReadbackPrimitive.atMost (Nat.succ label) context.frames.length).value = false := by
      cases found : (DeletionTwoReadbackPrimitive.atMost (Nat.succ label) context.frames.length).value with
      | false => rfl
      | true => exact False.elim (inside ((DeletionTwoReadbackPrimitive.atMost_value _ _).mp found))
    rw [outside]
    simp only [Bool.false_eq_true, ↓reduceIte, if_neg inside, beyond_value]

theorem weight_operations_le (context : CookSeedReadbackContext.Context) (label : Nat) :
    (weight context label).operations ≤ 25 * contextSize context.frames + 57 := by
  have rowsBound := length_le_contextSize context.frames
  have countBound : (RogozhinInputConstructionMachine.length context.frames).operations ≤
      4 * contextSize context.frames + 2 := by
    rw [RogozhinInputConstructionMachine.length_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul_left 4 rowsBound) 2
  have checkBound := DeletionTwoReadbackPrimitive.atMost_operations_le (Nat.succ label)
    (RogozhinInputConstructionMachine.length context.frames).value
  rw [RogozhinInputConstructionMachine.length_value] at checkBound
  have checkBound' := Nat.le_trans checkBound
    (Nat.add_le_add_right (Nat.mul_le_mul_left 4 rowsBound) 2)
  have bodyBound := choose_operations_le context label context.frames.length
    (DeletionTwoReadbackPrimitive.atMost (Nat.succ label) context.frames.length).value
  have bound := Nat.add_le_add_right
    (Nat.add_le_add (Nat.add_le_add countBound checkBound') bodyBound) 4
  have sumEq : (4 * contextSize context.frames + 2) + (4 * contextSize context.frames + 2) +
      (17 * contextSize context.frames + 49) + 4 = 25 * contextSize context.frames + 57 := by
    rw [show 25 = 4 + 4 + 17 by rfl, Nat.add_mul, Nat.add_mul]
    simp only [show 57 = 2 + 2 + 49 + 4 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [sumEq] at bound
  simpa only [weight, RogozhinInputConstructionMachine.length_value] using bound

theorem weight_value_le (context : CookSeedReadbackContext.Context) (label : Nat) :
    (weight context label).value ≤ contextSize context.frames + 4 := by
  rw [weight_value]
  unfold CookSeedReadbackContext.Context.weight
  split
  · next inside =>
    exact Nat.le_trans
      (by rw [← nonhaltingWeight_value]; exact nonhaltingWeight_value_le context label)
      (Nat.le_add_right _ _)
  · rw [← nonhaltingWeight_value]
    exact Nat.add_le_add_right (nonhaltingWeight_value_le context _) 4

def labelForWeight (context : CookSeedReadbackContext.Context) : Nat → Nat → Result Nat
  | 0, _ => ⟨0, 2⟩
  | limit + 1, width =>
      let actual := weight context limit
      let same := PureS.ParserTerminalPrimitive.equalIndex actual.value width
      let found := if same.value then (⟨limit, 2⟩ : Result Nat)
        else labelForWeight context limit width
      ⟨found.value, actual.operations + same.operations + found.operations + 4⟩

theorem labelForWeight_value (context : CookSeedReadbackContext.Context) (limit width : Nat) :
    (labelForWeight context limit width).value = context.labelForWeight limit width := by
  induction limit with
  | zero => rfl
  | succ limit ih =>
      dsimp only [labelForWeight]
      rw [weight_value, CookSeedReadbackContext.Context.labelForWeight]
      cases same : (PureS.ParserTerminalPrimitive.equalIndex (context.weight limit) width).value with
      | false =>
          have different : context.weight limit ≠ width := by
            intro eq
            have positive := (PureS.ParserTerminalPrimitive.equalIndex_value _ _).mpr eq
            rw [same] at positive
            cases positive
          simp only [Bool.false_eq_true, ↓reduceIte, if_neg different, ih]
      | true =>
          have eq := (PureS.ParserTerminalPrimitive.equalIndex_value _ _).mp same
          simp only [↓reduceIte, if_pos eq]

theorem labelForWeight_operations_le (context : CookSeedReadbackContext.Context)
    (limit width : Nat) :
    (labelForWeight context limit width).operations ≤
      limit * (29 * contextSize context.frames + 79) + 2 := by
  induction limit with
  | zero => simp only [labelForWeight, Nat.zero_mul, Nat.zero_add, Nat.le_refl]
  | succ limit ih =>
      have weightBound := weight_operations_le context limit
      have sameBound := Nat.le_trans
        (PureS.ParserTerminalPrimitive.equalIndex_operations_le (weight context limit).value width)
        (Nat.add_le_add_right (Nat.mul_le_mul_left 4 (weight_value_le context limit)) 2)
      have foundBound :
          (if (PureS.ParserTerminalPrimitive.equalIndex (weight context limit).value width).value then
            (⟨limit, 2⟩ : Result Nat) else labelForWeight context limit width).operations ≤
            limit * (29 * contextSize context.frames + 79) + 2 := by
        split
        · exact Nat.le_add_left _ _
        · exact ih
      have bound := Nat.add_le_add_right
        (Nat.add_le_add (Nat.add_le_add weightBound sameBound) foundBound) 4
      have sumEq : (25 * contextSize context.frames + 57) +
          (4 * (contextSize context.frames + 4) + 2) +
          (limit * (29 * contextSize context.frames + 79) + 2) + 4 =
          (limit + 1) * (29 * contextSize context.frames + 79) + 2 := by
        rw [Nat.add_mul, Nat.one_mul,
          show 29 * contextSize context.frames =
            25 * contextSize context.frames + 4 * contextSize context.frames from
            Nat.add_mul 25 4 _, Nat.mul_add]
        simp only [show 79 = 57 + (4 * 4 + 2) + 4 by rfl,
          Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      rw [sumEq] at bound
      exact bound

theorem labelForWeight_value_le (context : CookSeedReadbackContext.Context)
    (limit width : Nat) : (labelForWeight context limit width).value ≤ limit := by
  induction limit with
  | zero => exact Nat.le_refl _
  | succ limit ih =>
      dsimp only [labelForWeight]
      split
      · exact Nat.le_succ _
      · exact Nat.le_trans ih (Nat.le_succ _)

def label (context : CookSeedReadbackContext.Context) (width : Nat) : Result Nat :=
  let count := RogozhinInputConstructionMachine.length context.frames
  let found := labelForWeight context (Nat.succ count.value) width
  ⟨found.value, count.operations + found.operations + 2⟩

theorem label_value (context : CookSeedReadbackContext.Context) (width : Nat) :
    (label context width).value = context.labelForWeight (context.symbolCount + 1) width := by
  simp only [label, RogozhinInputConstructionMachine.length_value, labelForWeight_value,
    CookSeedReadbackContext.Context.symbolCount, Nat.succ_eq_add_one]

theorem label_operations_le (context : CookSeedReadbackContext.Context) (width : Nat) :
    (label context width).operations ≤
      4 * contextSize context.frames +
        (contextSize context.frames + 1) * (29 * contextSize context.frames + 79) + 6 := by
  have rowsBound := length_le_contextSize context.frames
  have countBound : (RogozhinInputConstructionMachine.length context.frames).operations ≤
      4 * contextSize context.frames + 2 := by
    rw [RogozhinInputConstructionMachine.length_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul_left 4 rowsBound) 2
  have searchBound := labelForWeight_operations_le context (Nat.succ context.frames.length) width
  have searchBound' := Nat.le_trans searchBound (Nat.add_le_add_right
    (Nat.mul_le_mul_right _ (Nat.add_le_add_right rowsBound 1)) 2)
  have bound := Nat.add_le_add_right (Nat.add_le_add countBound searchBound') 2
  simpa only [label, RogozhinInputConstructionMachine.length_value,
    show 6 = 2 + 2 + 2 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem label_cost_bound (size : Nat) :
    4 * size + (size + 1) * (29 * size + 79) + 6 ≤ 85 * (size + 1) ^ 2 := by
  have linear : 4 * size + 6 ≤ 6 * (size + 1) := by
    rw [Nat.mul_add, Nat.mul_one]
    exact Nat.add_le_add_right (Nat.mul_le_mul_right size (by decide : 4 ≤ 6)) 6
  have factor : 29 * size + 79 ≤ 79 * (size + 1) := by
    rw [Nat.mul_add, Nat.mul_one]
    exact Nat.add_le_add_right (Nat.mul_le_mul_right size (by decide : 29 ≤ 79)) 79
  have quadratic := Nat.mul_le_mul_left (size + 1) factor
  have linear' := Nat.le_trans linear (PureS.ParserCarrierPrimitive.linear_le_square 6 size)
  have bound := Nat.add_le_add linear' quadratic
  simpa only [Nat.pow_succ, Nat.pow_zero, Nat.one_mul,
    show 85 = 6 + 79 by rfl, Nat.add_mul, Nat.mul_add, Nat.mul_assoc, Nat.mul_comm,
    Nat.mul_left_comm, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem label_operations_le_quadratic (context : CookSeedReadbackContext.Context) (width : Nat) :
    (label context width).operations ≤ 85 * (contextSize context.frames + 1) ^ 2 :=
  Nat.le_trans (label_operations_le context width) (label_cost_bound _)

def seedLabel (bits : List Bool) (width : Nat) : Result (Option Nat) :=
  PureS.ParserRoutePrimitive.andThen (RogozhinSeedPrimitive.context bits) fun context =>
    let found := label context width
    ⟨some found.value, found.operations + 2⟩

theorem seedLabel_value (bits : List Bool) (width : Nat) :
    (seedLabel bits width).value =
      (CookSeedReadbackContext.decodeContext? bits).map
        (fun context => context.labelForWeight (context.symbolCount + 1) width) := by
  rw [seedLabel, PureS.ParserRoutePrimitive.andThen_value]
  cases found : (RogozhinSeedPrimitive.context bits).value with
  | none =>
      have parsed := RogozhinSeedPrimitive.context_value bits
      rw [found] at parsed
      rw [← parsed]
      rfl
  | some context =>
      have parsed := RogozhinSeedPrimitive.context_value bits
      rw [found] at parsed
      rw [← parsed]
      change some (label context width).value =
        some (context.labelForWeight (context.symbolCount + 1) width)
      rw [label_value]

set_option maxRecDepth 8192 in
theorem seedLabel_operations_le (bits : List Bool) (width : Nat) :
    (seedLabel bits width).operations ≤ 5213 * (bits.length + 1) ^ 2 := by
  have labelBound (context : CookSeedReadbackContext.Context)
      (accepted : (RogozhinSeedPrimitive.context bits).value = some context) :
      (label context width).operations + 2 ≤ 85 * (bits.length + 1) ^ 2 + 2 := by
    exact Nat.add_le_add_right (Nat.le_trans (label_operations_le_quadratic context width)
      (Nat.mul_le_mul_left 85 (PureS.ParserPositivePrimitive.square_mono
        (context_size bits context accepted)))) 2
  have bound := PureS.ParserRoutePrimitive.andThen_operations_le
    (RogozhinSeedPrimitive.context bits)
    (fun context => (⟨some (label context width).value, (label context width).operations + 2⟩ :
      Result (Option Nat))) (85 * (bits.length + 1) ^ 2 + 2) labelBound
  apply Nat.le_trans bound
  have contextBound := Nat.add_le_add_right
    (Nat.add_le_add_right (RogozhinSeedPrimitive.context_operations_le bits) 2)
    (85 * (bits.length + 1) ^ 2 + 2)
  apply Nat.le_trans contextBound
  calc
    _ = (5124 * (bits.length + 1) ^ 2 + 85 * (bits.length + 1) ^ 2) + 4 := by
      simp only [show 4 = 2 + 2 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    _ ≤ (5124 * (bits.length + 1) ^ 2 + 85 * (bits.length + 1) ^ 2) +
        4 * (bits.length + 1) ^ 2 :=
      Nat.add_le_add_left (PureS.ParserPositivePrimitive.constant_le_square 4 bits.length) _
    _ = _ := by rw [← Nat.add_mul, ← Nat.add_mul]

end PureSFormal.Computation.RogozhinContextWeightPrimitive
