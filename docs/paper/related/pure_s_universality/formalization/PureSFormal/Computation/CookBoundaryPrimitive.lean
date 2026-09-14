import PureSFormal.Computation.CookRunWordPrimitive

/-!
# Primitive Cook boundary inversion

Unary counter inversion reconstructs the exact accepted number. Consequently
the canonical inverse's final word equality is implied by successful run-word
and counter parsing. The measured inverse uses this identity to return the
parsed configuration without rebuilding its radix counters.
-/

namespace PureSFormal.Computation.CookBoundaryPrimitive

open PureS PureS.ParserPrimitiveMachine Cook Cook.PassClassification
open PureS.ParserRoutePrimitive (andThen charge andThen_value andThen_operations_le)

theorem digit_sound (count : Nat) (symbol : MachineSymbol)
    (accepted : Cook.symbolOfDigitWeight? count = some symbol) : digitWeight symbol = count := by
  fun_cases Cook.symbolOfDigitWeight? count <;> simp_all [Cook.symbolOfDigitWeight?, digitWeight, machineSymbolValue]
  all_goals subst symbol; rfl

theorem head_sound (count : Nat) (symbol : MachineSymbol)
    (accepted : Cook.symbolOfHeadCount? count = some symbol) :
    8 - machineSymbolValue symbol = count := by
  fun_cases Cook.symbolOfHeadCount? count <;> simp_all [Cook.symbolOfHeadCount?, machineSymbolValue]
  all_goals subst symbol; rfl

def radixCode (stop : Nat) : List MachineSymbol → Nat
  | [] => stop
  | symbol :: rest => 8 * (digitWeight symbol + radixCode stop rest)

theorem radixCode_right (side : List MachineSymbol) : radixCode 0 side = rightCounter side := by
  induction side with
  | nil => rfl
  | cons symbol rest ih => exact congrArg (fun n => 8 * (digitWeight symbol + n)) ih

theorem radixCode_left (side : List MachineSymbol) : radixCode 8 side = leftCounter side := by
  induction side with
  | nil => rfl
  | cons symbol rest ih => exact congrArg (fun n => 8 * (digitWeight symbol + n)) ih

theorem length_le_radixCode (stop : Nat) (side : List MachineSymbol) : side.length ≤ radixCode stop side := by
  induction side with
  | nil => exact Nat.zero_le _
  | cons symbol rest ih =>
      change rest.length + 1 ≤ 8 * (digitWeight symbol + radixCode stop rest)
      have first := Nat.add_le_add ih (Nat.le_trans (by decide : 1 ≤ 2) (digitWeight_bounds symbol).1)
      have second := Nat.le_mul_of_pos_left (digitWeight symbol + radixCode stop rest) (by decide : 0 < 8)
      exact Nat.le_trans (by simpa only [Nat.add_comm] using first) second

theorem step_reconstruct (count : Nat) (parsed : MachineSymbol × Nat)
    (accepted : (CookCounterPrimitive.step count).value = some parsed) :
    8 * (digitWeight parsed.1 + parsed.2) = count := by
  rw [CookCounterPrimitive.step_value] at accepted
  unfold CookCounterPrimitive.stepSpec at accepted
  split at accepted
  · next divisible =>
      dsimp only at accepted
      cases selected : Cook.symbolOfDigitWeight? (count / 8 % 8) with
      | none => rw [selected] at accepted; cases accepted
      | some symbol =>
          rw [selected] at accepted
          cases Option.some.inj accepted
          dsimp only
          rw [digit_sound _ _ selected, Nat.add_sub_of_le (Nat.mod_le _ _)]
          have reconstruction := Nat.mod_add_div count 8
          rw [divisible, Nat.zero_add] at reconstruction
          exact reconstruction
  · cases accepted

theorem decode_reconstruct (stop count : Nat) (side : List MachineSymbol)
    (accepted : (CookCounterPrimitive.decode stop count).value = some side) :
    radixCode stop side = count := by
  induction count using WellFounded.induction (measure (fun number : Nat => number)).wf generalizing side with
  | h count ih =>
      rw [CookCounterPrimitive.decode_value_equation] at accepted
      by_cases stopped : count = stop
      · rw [if_pos stopped] at accepted
        cases Option.some.inj accepted
        exact stopped.symm
      · rw [if_neg stopped] at accepted
        by_cases zero : count = 0
        · rw [if_pos zero] at accepted
          cases accepted
        · rw [if_neg zero] at accepted
          cases next : (CookCounterPrimitive.step count).value with
          | none => rw [next] at accepted; cases accepted
          | some parsed =>
              rw [next] at accepted
              dsimp only [Option.bind] at accepted
              cases remaining : (CookCounterPrimitive.decode stop parsed.2).value with
              | none => rw [remaining] at accepted; cases accepted
              | some tail =>
                  rw [remaining] at accepted
                  cases Option.some.inj accepted
                  change 8 * (digitWeight parsed.1 + radixCode stop tail) = count
                  rw [ih parsed.2 (CookCounterPrimitive.step_decrease (Nat.zero_lt_of_ne_zero zero) next)
                    tail remaining]
                  exact step_reconstruct _ _ next

theorem right_reconstruct (count : Nat) (side : List MachineSymbol)
    (accepted : Cook.decodeRightCounter? count = some side) : rightCounter side = count := by
  rw [← CookCounterPrimitive.right_value] at accepted
  exact (radixCode_right side).symm.trans (decode_reconstruct 0 count side accepted)

theorem left_reconstruct (count : Nat) (side : List MachineSymbol)
    (accepted : Cook.decodeLeftCounter? count = some side) : leftCounter side = count := by
  rw [← CookCounterPrimitive.left_value] at accepted
  exact (radixCode_left side).symm.trans (decode_reconstruct 8 count side accepted)

theorem run_reconstruct (word : List TagSymbol) (answer : MachineState × RunCounts)
    (accepted : Cook.parseRunWord? word = some answer) : word = runWord answer.1 answer.2 := by
  cases word with
  | nil => cases accepted
  | cons first rest =>
      cases first <;> try contradiction
      rename_i state
      unfold Cook.parseRunWord? at accepted
      dsimp only at accepted
      split at accepted
      · next equal =>
          cases Option.some.inj accepted
          exact equal
      · cases accepted

theorem canonicalRaw_reconstruct (word : List TagSymbol) (config : MachineConfig)
    (accepted : Cook.decodeCanonicalRaw? word = some config) : word = canonicalWord config := by
  unfold Cook.decodeCanonicalRaw? at accepted
  cases parsed : Cook.parseRunWord? word with
  | none => rw [parsed] at accepted; cases accepted
  | some result =>
      cases result with
      | mk state counts =>
          rw [parsed] at accepted
          change (do
            let current ← Cook.symbolOfHeadCount? counts.head
            let left ← Cook.decodeLeftCounter? counts.left
            let right ← Cook.decodeRightCounter? counts.right
            some (Rogozhin46.Config.mk state current left right)) = some config at accepted
          cases head : Cook.symbolOfHeadCount? counts.head with
          | none => rw [head] at accepted; cases accepted
          | some current =>
              rw [head] at accepted
              change (do
                let left ← Cook.decodeLeftCounter? counts.left
                let right ← Cook.decodeRightCounter? counts.right
                some (Rogozhin46.Config.mk state current left right)) = some config at accepted
              cases left : Cook.decodeLeftCounter? counts.left with
              | none => rw [left] at accepted; cases accepted
              | some leftSide =>
                  rw [left] at accepted
                  change (do
                    let right ← Cook.decodeRightCounter? counts.right
                    some (Rogozhin46.Config.mk state current leftSide right)) = some config at accepted
                  cases right : Cook.decodeRightCounter? counts.right with
                  | none => rw [right] at accepted; cases accepted
                  | some rightSide =>
                      rw [right] at accepted
                      cases Option.some.inj accepted
                      unfold canonicalWord canonicalCounts
                      dsimp only
                      rw [head_sound _ _ head, left_reconstruct _ _ left, right_reconstruct _ _ right]
                      exact run_reconstruct _ _ parsed

theorem canonical_eq_raw (word : List TagSymbol) :
    Cook.decodeCanonical? word = Cook.decodeCanonicalRaw? word := by
  unfold Cook.decodeCanonical?
  cases accepted : Cook.decodeCanonicalRaw? word with
  | none => rfl
  | some config => exact if_pos (canonicalRaw_reconstruct _ _ accepted)

def headTable : List (Option MachineSymbol) :=
  [none, none, none, some .s5, some .s4, some .s3, some .s2, some .s1, some .s0]

def head (count : Nat) : Result (Option MachineSymbol) :=
  let selected := CookWordPrimitive.lookup headTable count
  match selected.value with
  | none => ⟨none, selected.operations + 2⟩
  | some symbol => ⟨symbol, selected.operations + 2⟩

theorem head_value (count : Nat) : (head count).value = Cook.symbolOfHeadCount? count := by
  cases count with
  | zero => rfl
  | succ count =>
      cases count with
      | zero => rfl
      | succ count =>
          cases count with
          | zero => rfl
          | succ count =>
              cases count with
              | zero => rfl
              | succ count =>
                  cases count with
                  | zero => rfl
                  | succ count =>
                      cases count with
                      | zero => rfl
                      | succ count =>
                          cases count with
                          | zero => rfl
                          | succ count =>
                              cases count with
                              | zero => rfl
                              | succ count => cases count <;> rfl

theorem head_operations_le (count : Nat) : (head count).operations ≤ 40 := by
  have bound := Nat.add_le_add_right (CookWordPrimitive.lookup_operations_le headTable count) 2
  unfold head
  dsimp only
  split <;> exact bound

def canonicalSides (state : MachineState) (current : MachineSymbol) (counts : RunCounts) :
    Result (Option MachineConfig) :=
  charge 2 (andThen (CookCounterPrimitive.left counts.left) fun left =>
    andThen (CookCounterPrimitive.right counts.right) fun right =>
      ⟨some ⟨state, current, left, right⟩, 2⟩)

def canonicalBody (state : MachineState) (counts : RunCounts) : Result (Option MachineConfig) :=
  charge 1 (andThen (head counts.head) fun current => canonicalSides state current counts)

def canonical (word : List TagSymbol) : Result (Option MachineConfig) :=
  andThen (CookRunWordPrimitive.parse word) fun parsed => charge 2 (canonicalBody parsed.1 parsed.2)

theorem canonicalSides_value (state : MachineState) (current : MachineSymbol) (counts : RunCounts) :
    (canonicalSides state current counts).value = (do
      let left ← Cook.decodeLeftCounter? counts.left
      let right ← Cook.decodeRightCounter? counts.right
      some (Rogozhin46.Config.mk state current left right)) := by
  change (andThen (CookCounterPrimitive.left counts.left) _).value = _
  rw [andThen_value, CookCounterPrimitive.left_value]
  cases Cook.decodeLeftCounter? counts.left with
  | none => rfl
  | some left =>
      change (andThen (CookCounterPrimitive.right counts.right) _).value = _
      rw [andThen_value, CookCounterPrimitive.right_value]
      rfl

theorem canonicalBody_value (state : MachineState) (counts : RunCounts) :
    (canonicalBody state counts).value = (do
      let current ← Cook.symbolOfHeadCount? counts.head
      let left ← Cook.decodeLeftCounter? counts.left
      let right ← Cook.decodeRightCounter? counts.right
      some (Rogozhin46.Config.mk state current left right)) := by
  change (andThen (head counts.head) _).value = _
  rw [andThen_value, head_value]
  cases Cook.symbolOfHeadCount? counts.head with
  | none => rfl
  | some current => exact canonicalSides_value state current counts

theorem canonical_value (word : List TagSymbol) : (canonical word).value = Cook.decodeCanonical? word := by
  rw [canonical_eq_raw]
  unfold canonical Cook.decodeCanonicalRaw?
  rw [andThen_value, CookRunWordPrimitive.parse_value]
  cases Cook.parseRunWord? word with
  | none => rfl
  | some parsed => exact canonicalBody_value parsed.1 parsed.2

theorem canonicalSides_operations_le (state : MachineState) (current : MachineSymbol)
    (counts : RunCounts) (size : Nat) (left : counts.left ≤ size) (right : counts.right ≤ size) :
    (canonicalSides state current counts).operations ≤ 552 * (size + 1) ^ 2 := by
  have leftBound := Nat.le_trans (CookCounterPrimitive.left_operations_le counts.left)
    (Nat.mul_le_mul_left 288 (ParserPositivePrimitive.square_mono left))
  have rightBound := Nat.le_trans (CookCounterPrimitive.right_operations_le counts.right)
    (Nat.mul_le_mul_left 256 (ParserPositivePrimitive.square_mono right))
  have inner (leftSide : List MachineSymbol) :
      (andThen (CookCounterPrimitive.right counts.right) fun rightSide =>
        (⟨some (Rogozhin46.Config.mk state current leftSide rightSide), 2⟩ : Result (Option MachineConfig))).operations ≤
          256 * (size + 1) ^ 2 + 4 := by
    exact Nat.le_trans (andThen_operations_le _ _ 2 (fun _ _ => Nat.le_refl _))
      (by simpa only [Nat.add_assoc] using Nat.add_le_add_right rightBound 4)
  have outer := andThen_operations_le (CookCounterPrimitive.left counts.left)
    (fun leftSide => andThen (CookCounterPrimitive.right counts.right) fun rightSide =>
      (⟨some (Rogozhin46.Config.mk state current leftSide rightSide), 2⟩ : Result (Option MachineConfig)))
    (256 * (size + 1) ^ 2 + 4) (fun leftSide _ => inner leftSide)
  change 2 + (andThen (CookCounterPrimitive.left counts.left) _).operations ≤ _
  rw [Nat.add_comm 2]
  apply Nat.le_trans (Nat.add_le_add_right outer 2)
  calc
    _ ≤ 288 * (size + 1) ^ 2 + 256 * (size + 1) ^ 2 + 8 := by
      apply Nat.le_trans (Nat.add_le_add_right
        (Nat.add_le_add_right (Nat.add_le_add_right leftBound 2) (256 * (size + 1) ^ 2 + 4)) 2)
      simp only [show 8 = 2 + 4 + 2 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.le_refl]
    _ ≤ (288 + 256 + 8) * (size + 1) ^ 2 := by
      rw [Nat.add_mul, Nat.add_mul]
      exact Nat.add_le_add_left (ParserPositivePrimitive.constant_le_square 8 size) _
    _ = _ := rfl

theorem canonicalBody_operations_le (state : MachineState) (counts : RunCounts) (size : Nat)
    (left : counts.left ≤ size) (right : counts.right ≤ size) :
    (canonicalBody state counts).operations ≤ 600 * (size + 1) ^ 2 := by
  have sides current := canonicalSides_operations_le state current counts size left right
  have outer := andThen_operations_le (head counts.head) (fun current => canonicalSides state current counts)
    (552 * (size + 1) ^ 2) (fun current _ => sides current)
  change 1 + (andThen (head counts.head) _).operations ≤ _
  rw [Nat.add_comm 1]
  apply Nat.le_trans (Nat.add_le_add_right outer 1)
  have first := Nat.add_le_add_right (Nat.add_le_add_right
    (Nat.add_le_add_right (head_operations_le counts.head) 2) (552 * (size + 1) ^ 2)) 1
  have constantBound := ParserPositivePrimitive.constant_le_square 48 size
  calc
    _ ≤ 552 * (size + 1) ^ 2 + 48 := by
      apply Nat.le_trans first
      simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
        Nat.add_le_add_left (by decide : 40 + 2 + 1 ≤ 48) (552 * (size + 1) ^ 2)
    _ ≤ (552 + 48) * (size + 1) ^ 2 := by
      rw [Nat.add_mul]
      exact Nat.add_le_add_left constantBound _
    _ = _ := rfl

theorem canonical_operations_le (word : List TagSymbol) :
    (canonical word).operations ≤ 768 * (word.length + 1) ^ 2 := by
  have body (parsed : MachineState × RunCounts) (accepted : (CookRunWordPrimitive.parse word).value = some parsed) :
      (charge 2 (canonicalBody parsed.1 parsed.2)).operations ≤ 600 * (word.length + 1) ^ 2 + 2 := by
    have fields := CookRunWordPrimitive.parse_counts_le word parsed accepted
    change 2 + (canonicalBody parsed.1 parsed.2).operations ≤ _
    rw [Nat.add_comm 2]
    exact Nat.add_le_add_right (canonicalBody_operations_le parsed.1 parsed.2 word.length fields.2.1 fields.2.2) 2
  have outer := andThen_operations_le (CookRunWordPrimitive.parse word)
    (fun parsed => charge 2 (canonicalBody parsed.1 parsed.2)) (600 * (word.length + 1) ^ 2 + 2) body
  apply Nat.le_trans outer
  have parser := Nat.le_trans (CookRunWordPrimitive.parse_operations_le word)
    (ParserCarrierPrimitive.linear_le_square 128 word.length)
  calc
    _ ≤ 128 * (word.length + 1) ^ 2 + 600 * (word.length + 1) ^ 2 + 40 := by
      have first := Nat.add_le_add_right (Nat.add_le_add_right parser 2) (600 * (word.length + 1) ^ 2 + 2)
      apply Nat.le_trans first
      simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
        Nat.add_le_add_left (by decide : 2 + 2 ≤ 40) (128 * (word.length + 1) ^ 2 + 600 * (word.length + 1) ^ 2)
    _ ≤ (128 + 600 + 40) * (word.length + 1) ^ 2 := by
      rw [Nat.add_mul, Nat.add_mul]
      exact Nat.add_le_add_left (ParserPositivePrimitive.constant_le_square 40 word.length) _
    _ = _ := rfl

theorem canonical_fields (word : List TagSymbol) (config : MachineConfig)
    (accepted : (canonical word).value = some config) :
    config.left.length ≤ word.length ∧ config.right.length ≤ word.length := by
  rw [canonical_value] at accepted
  have encoded := Cook.decodeCanonical?_sound accepted
  rw [encoded]
  simp only [canonicalWord, runWord, List.length_append, List.length_replicate, canonicalCounts]
  have leftBound : config.left.length ≤ leftCounter config.left := by
    rw [← radixCode_left]
    exact length_le_radixCode 8 config.left
  have rightBound : config.right.length ≤ rightCounter config.right := by
    rw [← radixCode_right]
    exact length_le_radixCode 0 config.right
  exact ⟨Nat.le_trans leftBound (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ _)),
    Nat.le_trans rightBound (Nat.le_add_left _ _)⟩

end PureSFormal.Computation.CookBoundaryPrimitive
