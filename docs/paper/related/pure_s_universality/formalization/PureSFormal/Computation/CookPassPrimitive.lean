import PureSFormal.Computation.CookArrivalPrimitive

/-!
# Primitive horizon-aware Cook readback

The registered-boundary observer tests the phase and horizon by observing
their unary constructors. It decodes the complete bitword and then selects
the canonical or directional-arrival inverse. All costs include failed
parses; no traversal of the supplied horizon is required.
-/

namespace PureSFormal.Computation.CookPassPrimitive

open PureS PureS.ParserPrimitiveMachine Cook Cook.PassClassification
open PureS.ParserRoutePrimitive (andThen charge andThen_value andThen_operations_le)

theorem word_length_le (bits : List Bool) (word : List TagSymbol)
    (accepted : (CookWordPrimitive.parse bits).value = some word) : word.length ≤ bits.length := by
  rw [CookWordPrimitive.parse_sound accepted, Cook.encodeWord_length]
  exact Nat.le_mul_of_pos_left word.length (by decide : 0 < Cook.alphabetSize)

def atHorizon : Nat → List TagSymbol → Result (Option MachineConfig)
  | 0, word => charge 1 (CookBoundaryPrimitive.canonical word)
  | .succ _, word => charge 1 (andThen (CookArrivalPrimitive.arrival word) fun decoded =>
      ⟨some decoded.config, 2⟩)

def parse (horizon : Nat) (snapshot : CTS.Config rogozhinCookProgram) : Result (Option MachineConfig) :=
  match snapshot.phase.val with
  | 0 => charge 4 (andThen (CookWordPrimitive.parse snapshot.data) (atHorizon horizon))
  | .succ _ => ⟨none, 4⟩

theorem atHorizon_value (horizon : Nat) (word : List TagSymbol) :
    (atHorizon horizon word).value =
      (if horizon = 0 then Cook.decodeCanonical? word else
        match Cook.decodeArrival? word with
        | none => none
        | some decoded => some decoded.config) := by
  cases horizon with
  | zero => exact CookBoundaryPrimitive.canonical_value word
  | succ horizon =>
      rw [if_neg (Nat.succ_ne_zero horizon)]
      change (andThen (CookArrivalPrimitive.arrival word) _).value = _
      rw [andThen_value, CookArrivalPrimitive.arrival_value]
      cases Cook.decodeArrival? word <;> rfl

theorem parse_value (horizon : Nat) (snapshot : CTS.Config rogozhinCookProgram) :
    (parse horizon snapshot).value = Cook.passDecode? horizon snapshot := by
  unfold parse Cook.passDecode?
  cases phase : snapshot.phase.val with
  | zero =>
      rw [if_pos rfl]
      change (andThen (CookWordPrimitive.parse snapshot.data) _).value = _
      rw [andThen_value, CookWordPrimitive.parse_value]
      cases Cook.decodeWord? snapshot.data with
      | none => rfl
      | some word => exact atHorizon_value horizon word
  | succ phase => rfl

theorem atHorizon_operations_le (horizon : Nat) (word : List TagSymbol) :
    (atHorizon horizon word).operations ≤ 1280 * (word.length + 1) ^ 2 + 5 := by
  cases horizon with
  | zero =>
      change 1 + (CookBoundaryPrimitive.canonical word).operations ≤ _
      rw [Nat.add_comm 1]
      exact Nat.add_le_add
        (Nat.le_trans (CookBoundaryPrimitive.canonical_operations_le word)
          (Nat.mul_le_mul_right _ (by decide : 768 ≤ 1280))) (by decide : 1 ≤ 5)
  | succ horizon =>
      change 1 + (andThen (CookArrivalPrimitive.arrival word) _).operations ≤ _
      rw [Nat.add_comm 1]
      have inner := andThen_operations_le (CookArrivalPrimitive.arrival word)
        (fun decoded => (⟨some decoded.config, 2⟩ : Result (Option MachineConfig)))
        2 (fun _ _ => Nat.le_refl _)
      apply Nat.le_trans (Nat.add_le_add_right inner 1)
      simpa only [Nat.add_assoc] using Nat.add_le_add_right
        (CookArrivalPrimitive.arrival_operations_le word) 5

theorem parse_overhead_bound (first second : Nat) :
    4 + (first + 2 + (second + 5)) ≤ first + second + 864 := by
  simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
    Nat.add_le_add_left (by decide : 4 + 2 + 5 ≤ 864) (first + second)

theorem parse_operations_le (horizon : Nat) (snapshot : CTS.Config rogozhinCookProgram) :
    (parse horizon snapshot).operations ≤ 6144 * (snapshot.data.length + 1) ^ 2 := by
  have boundary (word : List TagSymbol) (accepted : (CookWordPrimitive.parse snapshot.data).value = some word) :
      (atHorizon horizon word).operations ≤ 1280 * (snapshot.data.length + 1) ^ 2 + 5 :=
    Nat.le_trans (atHorizon_operations_le horizon word) (Nat.add_le_add_right
      (Nat.mul_le_mul_left 1280 (ParserPositivePrimitive.square_mono (word_length_le _ _ accepted))) 5)
  have inner := andThen_operations_le (CookWordPrimitive.parse snapshot.data) (atHorizon horizon)
    (1280 * (snapshot.data.length + 1) ^ 2 + 5) boundary
  have wordBound := Nat.le_trans (CookWordPrimitive.parse_operations_le snapshot.data)
    (ParserCarrierPrimitive.linear_le_square 4000 snapshot.data.length)
  unfold parse
  split
  · change 4 + (andThen _ _).operations ≤ _
    apply Nat.le_trans (Nat.add_le_add_left inner 4)
    apply Nat.le_trans (Nat.add_le_add_left (Nat.add_le_add_right (Nat.add_le_add_right wordBound 2)
      (1280 * (snapshot.data.length + 1) ^ 2 + 5)) 4)
    calc
      _ ≤ 4000 * (snapshot.data.length + 1) ^ 2 + 1280 * (snapshot.data.length + 1) ^ 2 + 864 := by
        exact parse_overhead_bound _ _
      _ ≤ (4000 + 1280 + 864) * (snapshot.data.length + 1) ^ 2 := by
        rw [Nat.add_mul, Nat.add_mul]
        exact Nat.add_le_add_left (ParserPositivePrimitive.constant_le_square 864 snapshot.data.length) _
      _ = _ := rfl
  · exact Nat.le_trans (by decide : 4 ≤ 6144) (ParserPositivePrimitive.constant_le_square 6144 snapshot.data.length)

theorem atHorizon_fields (horizon : Nat) (word : List TagSymbol) (config : MachineConfig)
    (accepted : (atHorizon horizon word).value = some config) :
    config.left.length ≤ word.length ∧ config.right.length ≤ word.length := by
  cases horizon with
  | zero => exact CookBoundaryPrimitive.canonical_fields word config accepted
  | succ horizon =>
      change (andThen (CookArrivalPrimitive.arrival word) _).value = some config at accepted
      rw [andThen_value] at accepted
      cases found : (CookArrivalPrimitive.arrival word).value with
      | none => rw [found] at accepted; cases accepted
      | some decoded =>
          rw [found] at accepted
          cases Option.some.inj accepted
          exact CookArrivalPrimitive.arrival_fields word decoded found

theorem parse_fields (horizon : Nat) (snapshot : CTS.Config rogozhinCookProgram) (config : MachineConfig)
    (accepted : (parse horizon snapshot).value = some config) :
    config.left.length ≤ snapshot.data.length ∧ config.right.length ≤ snapshot.data.length := by
  unfold parse at accepted
  split at accepted
  · change (andThen (CookWordPrimitive.parse snapshot.data) _).value = some config at accepted
    rw [andThen_value] at accepted
    cases found : (CookWordPrimitive.parse snapshot.data).value with
    | none => rw [found] at accepted; cases accepted
    | some word =>
        rw [found] at accepted
        have fields := atHorizon_fields horizon word config accepted
        have length := word_length_le _ _ found
        exact ⟨Nat.le_trans fields.1 length, Nat.le_trans fields.2 length⟩
  · cases accepted

end PureSFormal.Computation.CookPassPrimitive
