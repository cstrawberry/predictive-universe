import PureSFormal.PureS.ParserWordPrimitive

/-!
# Primitive carrier, environment, and generator parsing

The fixed action wrapper is supplied as an already constructed grammar term.
Tree fields are shared references. Carrier counts use immutable unary natural
numbers: returning a successor allocates one successor node. Constructor
observations, child reads, result constructors, and Boolean branches are counted
in the model of `ParserPrimitiveMachine`; result instrumentation is excluded.
The parsers agree with their public counterparts on every input term.
-/

namespace PureSFormal.PureS.ParserEnvelopePrimitive

open ParserPrimitiveMachine

inductive CarrierView where
  | zero
  | successor (child : Term)
  | invalid

def carrierView : Term → Result CarrierView
  | .s => ⟨.invalid, 1⟩
  | .app .s _ => ⟨.invalid, 4⟩
  | .app (.app (.app _ _) _) _ => ⟨.invalid, 7⟩
  | .app (.app .s .s) child => ⟨.successor child, 8⟩
  | .app (.app .s (.app first second)) tail =>
      match first, second with
      | .s, .s =>
          match tail with
          | .s => ⟨.invalid, 13⟩
          | .app left right =>
              match left, right with
              | .s, .s => ⟨.zero, 17⟩
              | _, _ => ⟨.invalid, 17⟩
      | _, _ => ⟨.invalid, 12⟩

theorem carrierView_operations_le (term : Term) : (carrierView term).operations ≤ 17 := by
  fun_cases carrierView term <;> simp [carrierView]

theorem carrierView_successor {term child : Term}
    (found : (carrierView term).value = .successor child) : term = .app b child := by
  fun_cases carrierView term <;> simp_all [carrierView, b]

theorem carrierView_zero {term : Term} (found : (carrierView term).value = .zero) :
    term = C 0 := by
  fun_cases carrierView term <;> simp_all [carrierView, C, b]

theorem carrierView_invalid {term : Term} (found : (carrierView term).value = .invalid) :
    CheckpointDecoder.parseCarrier? term = none := by
  fun_cases carrierView term <;> simp_all [carrierView, CheckpointDecoder.parseCarrier?]

theorem carrierView_child_lt {term child : Term}
    (found : (carrierView term).value = .successor child) : child.size < term.size := by
  rw [carrierView_successor found]
  exact Nat.lt_succ_of_le (Nat.le_add_left _ _)

def carrier (term : Term) : Result (Option Nat) :=
  let view := carrierView term
  match found : view.value with
  | .zero => ⟨some 0, view.operations + 2⟩
  | .invalid => ⟨none, view.operations + 1⟩
  | .successor child =>
      let parsed := carrier child
      match parsed.value with
      | none => ⟨none, view.operations + parsed.operations + 2⟩
      | some count => ⟨some (.succ count), view.operations + parsed.operations + 3⟩
termination_by term.size
decreasing_by exact carrierView_child_lt found

theorem carrier_value (term : Term) :
    (carrier term).value = CheckpointDecoder.parseCarrier? term := by
  induction term using WellFounded.induction (measure Term.size).wf with
  | h term ih =>
      rw [carrier]
      split
      · next found => rw [carrierView_zero found]; rfl
      · next found => exact (carrierView_invalid found).symm
      · next child found =>
          have inner := ih child (carrierView_child_lt found)
          rw [carrierView_successor found]
          simp only [b, CheckpointDecoder.parseCarrier?]
          rw [← inner]
          cases h : (carrier child).value <;> simp only [h] <;> rfl

theorem carrier_operations_le (term : Term) :
    (carrier term).operations ≤ 24 * (term.size + 1) := by
  induction term using WellFounded.induction (measure Term.size).wf with
  | h term ih =>
      have viewBound := carrierView_operations_le term
      have minimum : 24 ≤ 24 * (term.size + 1) := by
        simpa only [Nat.mul_one] using Nat.mul_le_mul_left 24 (Nat.le_add_left 1 term.size)
      rw [carrier]
      split
      · exact Nat.le_trans (Nat.add_le_add_right viewBound 2)
          (Nat.le_trans (by decide : 17 + 2 ≤ 24) minimum)
      · exact Nat.le_trans (Nat.add_le_add_right viewBound 1)
          (Nat.le_trans (by decide : 17 + 1 ≤ 24) minimum)
      · next child found =>
          have inner := ih child (carrierView_child_lt found)
          have common : (carrierView term).operations + (carrier child).operations + 3 ≤
              24 * (term.size + 1) := by
            have first := Nat.add_le_add_right (Nat.add_le_add viewBound inner) 3
            have overhead : 17 + 24 * (child.size + 1) + 3 ≤
                24 * (child.size + 1) + 24 := by
              have h := Nat.add_le_add_left (by decide : 17 + 3 ≤ 24)
                (24 * (child.size + 1))
              simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using h
            have descend := Nat.mul_le_mul_left 24
              (Nat.add_le_add_right (Nat.succ_le_of_lt (carrierView_child_lt found)) 1)
            exact Nat.le_trans first (Nat.le_trans overhead
              (by simpa only [Nat.mul_add, Nat.mul_one] using! descend))
          dsimp only
          split
          · exact Nat.le_trans (Nat.add_le_add_left (by decide : 2 ≤ 3) _) common
          · exact common

inductive EnvironmentView where
  | fields (action payload : Term)
  | invalid

def environmentView : Term → Result EnvironmentView
  | .s => ⟨.invalid, 1⟩
  | .app (.app _ _) _ => ⟨.invalid, 4⟩
  | .app .s .s => ⟨.invalid, 5⟩
  | .app .s (.app .s _) => ⟨.invalid, 8⟩
  | .app .s (.app (.app (.app _ _) _) _) => ⟨.invalid, 11⟩
  | .app .s (.app (.app .s _) .s) => ⟨.invalid, 12⟩
  | .app .s (.app (.app .s _) (.app (.app _ _) _)) => ⟨.invalid, 15⟩
  | .app .s (.app (.app .s action) (.app .s payload)) =>
      ⟨.fields action payload, 15⟩

theorem environmentView_operations_le (term : Term) :
    (environmentView term).operations ≤ 15 := by
  fun_cases environmentView term <;> simp [environmentView]

theorem environmentView_fields {term action payload : Term}
    (found : (environmentView term).value = .fields action payload) :
    term = .app .s (.app (.app .s action) (.app .s payload)) := by
  fun_cases environmentView term <;> simp_all [environmentView]

theorem environmentView_action_le {term action payload : Term}
    (found : (environmentView term).value = .fields action payload) : action.size ≤ term.size := by
  rw [environmentView_fields found]
  exact Nat.le_trans (Nat.le_add_left _ _)
    (Nat.le_trans (Nat.le_add_right _ 1)
      (Nat.le_trans (Nat.le_add_right _ _)
        (Nat.le_trans (Nat.le_add_right _ 1)
          (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ 1)))))

theorem environmentView_payload_lt {term action payload : Term}
    (found : (environmentView term).value = .fields action payload) : payload.size < term.size := by
  rw [environmentView_fields found]
  exact Nat.lt_trans (Nat.lt_succ_of_le (Nat.le_add_left _ _))
    (Nat.lt_trans (Nat.lt_succ_of_le (Nat.le_add_left _ _))
      (Nat.lt_succ_of_le (Nat.le_add_left _ _)))

theorem environmentView_invalid {term : Term}
    (found : (environmentView term).value = .invalid) (actions : Term) :
    CheckpointDecoder.parseEnvironment? actions term = none := by
  fun_cases environmentView term <;> simp_all [environmentView, CheckpointDecoder.parseEnvironment?]

/-- The expected action wrapper is an input reference, constructed once with the grammar. -/
def environment (expected term : Term) : Result (Option Term) :=
  let view := environmentView term
  match view.value with
  | .invalid => ⟨none, view.operations + 1⟩
  | .fields action payload =>
      let checked := equal action expected
      if checked.value then
        ⟨some payload, view.operations + checked.operations + 2⟩
      else
        ⟨none, view.operations + checked.operations + 2⟩

theorem environment_value (actions term : Term) :
    (environment (actCode actions) term).value =
      CheckpointDecoder.parseEnvironment? actions term := by
  rw [environment]
  split
  · next found => exact (environmentView_invalid found actions).symm
  · next action payload found =>
      rw [environmentView_fields found]
      simp only [CheckpointDecoder.parseEnvironment?, equal_value]
      split <;> simp_all only [Result.value, ↓reduceIte]

theorem environment_operations_le (expected term : Term) :
    (environment expected term).operations ≤ 20 + 4 * (term.size + expected.size) := by
  have viewBound := environmentView_operations_le term
  rw [environment]
  split
  · exact Nat.le_trans (Nat.add_le_add_right viewBound 1)
      (Nat.le_trans (by decide : 15 + 1 ≤ 20) (Nat.le_add_right _ _))
  · next action payload found =>
      have equalityBound := Nat.le_trans (equal_operations_le action expected)
        (Nat.mul_le_mul_left 4 (Nat.add_le_add_right (environmentView_action_le found) _))
      have common := Nat.add_le_add_right (Nat.add_le_add viewBound equalityBound) 2
      have ceiling := Nat.add_le_add_right (by decide : 15 + 2 ≤ 20)
        (4 * (term.size + expected.size))
      dsimp only
      split <;> exact Nat.le_trans common
        (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using ceiling)

theorem environment_payload_lt {expected term payload : Term}
    (found : (environment expected term).value = some payload) : payload.size < term.size := by
  rw [environment] at found
  split at found
  · cases found
  · next action seed view =>
      dsimp only at found
      split at found
      · have same := Option.some.inj found
        subst payload
        exact environmentView_payload_lt view
      · cases found

def seedWord (expected term : Term) : Result (Option (List Bool)) :=
  let parsed := environment expected term
  match parsed.value with
  | none => ⟨none, parsed.operations + 2⟩
  | some payload =>
      let output := ParserWordPrimitive.parse payload
      ⟨output.value, parsed.operations + 1 + output.operations⟩

theorem seedWord_value (actions term : Term) :
    (seedWord (actCode actions) term).value =
      match CheckpointDecoder.parseEnvironment? actions term with
      | none => none
      | some payload => CheckpointDecoder.parseWord? payload := by
  simp only [seedWord, environment_value]
  cases CheckpointDecoder.parseEnvironment? actions term with
  | none => rfl
  | some payload => exact ParserWordPrimitive.parse_value payload

theorem seedWord_operations_le (expected term : Term) :
    (seedWord expected term).operations ≤
      20 + 4 * (term.size + expected.size) + 2 + 128 * (term.size + 1) ^ 2 := by
  have envBound := environment_operations_le expected term
  simp only [seedWord]
  split
  · exact Nat.le_trans (Nat.add_le_add_right envBound 2) (Nat.le_add_right _ _)
  · next payload found =>
      have payloadBound := Nat.le_of_lt (environment_payload_lt found)
      have wordBound := Nat.le_trans (ParserWordPrimitive.parse_operations_le payload)
        (Nat.mul_le_mul_left 128
          (Nat.pow_le_pow_left (Nat.add_le_add_right payloadBound 1) 2))
      exact Nat.add_le_add
        (Nat.add_le_add envBound (by decide : 1 ≤ 2)) wordBound

/-- The continuation is invoked only after a successfully decoded zero count. -/
def zeroThen {α : Type} (parsed : Result (Option Nat))
    (next : Unit → Result (Option α)) : Result (Option α) :=
  match parsed.value with
  | none => ⟨none, parsed.operations + 2⟩
  | some 0 =>
      let output := next ()
      ⟨output.value, parsed.operations + 2 + output.operations⟩
  | some (.succ _) => ⟨none, parsed.operations + 3⟩

theorem zeroThen_value {α : Type} (parsed : Result (Option Nat))
    (next : Unit → Result (Option α)) :
    (zeroThen parsed next).value =
      match parsed.value with
      | some 0 => (next ()).value
      | _ => none := by
  cases found : parsed.value with
  | none => simp only [zeroThen, found]
  | some count => cases count <;> simp only [zeroThen, found]

theorem zeroThen_operations_le {α : Type} (parsed : Result (Option Nat))
    (next : Unit → Result (Option α)) {bound : Nat}
    (nextBound : (next ()).operations ≤ bound) :
    (zeroThen parsed next).operations ≤ parsed.operations + 3 + bound := by
  cases found : parsed.value with
  | none =>
      simp only [zeroThen, found]
      exact Nat.le_trans (Nat.add_le_add_left (by decide : 2 ≤ 3) _)
        (Nat.le_add_right _ _)
  | some count =>
      cases count with
      | zero =>
          simp only [zeroThen, found]
          exact Nat.add_le_add (Nat.add_le_add_left (by decide : 2 ≤ 3) _) nextBound
      | succ count =>
          simp only [zeroThen, found]
          exact Nat.le_add_right _ _

inductive GeneratorView where
  | fields (left right environment : Term)
  | invalid

def generatorView : Term → Result GeneratorView
  | .s => ⟨.invalid, 1⟩
  | .app .s _ => ⟨.invalid, 4⟩
  | .app (.app left right) environment => ⟨.fields left right environment, 6⟩

theorem generatorView_operations_le (term : Term) : (generatorView term).operations ≤ 6 := by
  fun_cases generatorView term <;> simp [generatorView]

theorem generatorView_fields {term left right env : Term}
    (found : (generatorView term).value = .fields left right env) :
    term = .app (.app left right) env := by
  fun_cases generatorView term <;> simp_all [generatorView]

theorem generatorView_fields_le {term left right env : Term}
    (found : (generatorView term).value = .fields left right env) :
    left.size ≤ term.size ∧ right.size ≤ term.size ∧ env.size ≤ term.size := by
  rw [generatorView_fields found]
  exact ⟨Nat.le_trans (Nat.le_add_right _ _)
      (Nat.le_trans (Nat.le_add_right _ 1)
        (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ 1))),
    Nat.le_trans (Nat.le_add_left _ _)
      (Nat.le_trans (Nat.le_add_right _ 1)
        (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ 1))),
    Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ 1)⟩

def generator (expected term : Term) : Result (Option (List Bool)) :=
  let view := generatorView term
  match view.value with
  | .invalid => ⟨none, view.operations + 1⟩
  | .fields left right env =>
      let output := zeroThen (carrier left) (fun _ =>
        zeroThen (carrier right) (fun _ => seedWord expected env))
      ⟨output.value, view.operations + output.operations⟩

theorem generator_value (actions term : Term) :
    (generator (actCode actions) term).value = CheckpointDecoder.parseGenerator? actions term := by
  rw [generator]
  split
  · next found =>
      fun_cases generatorView term <;> simp_all [generatorView, CheckpointDecoder.parseGenerator?]
  · next left right env found =>
      rw [generatorView_fields found]
      dsimp only
      rw [zeroThen_value, carrier_value]
      simp only [CheckpointDecoder.parseGenerator?]
      cases hleft : CheckpointDecoder.parseCarrier? left with
      | none => rfl
      | some count =>
          cases count with
          | succ count => rfl
          | zero =>
              rw [zeroThen_value, carrier_value]
              cases hright : CheckpointDecoder.parseCarrier? right with
              | none => rfl
              | some count =>
                  cases count with
                  | succ count => rfl
                  | zero =>
                      rw [seedWord_value]
                      cases CheckpointDecoder.parseEnvironment? actions env <;> rfl

theorem generator_operations_bound (expected term : Term) :
    (generator expected term).operations ≤
      6 + (24 * (term.size + 1) + 3 +
        (24 * (term.size + 1) + 3 +
          (20 + 4 * (term.size + expected.size) + 2 + 128 * (term.size + 1) ^ 2))) := by
  have viewBound := generatorView_operations_le term
  rw [generator]
  split
  · have first := Nat.add_le_add_right viewBound 1
    have tail : 1 ≤ 24 * (term.size + 1) + 3 +
        (24 * (term.size + 1) + 3 +
          (20 + 4 * (term.size + expected.size) + 2 + 128 * (term.size + 1) ^ 2)) :=
      Nat.le_trans (by decide : 1 ≤ 3)
        (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ _))
    exact Nat.le_trans first (Nat.add_le_add_left tail 6)
  · next left right env found =>
      obtain ⟨leftSize, rightSize, envSize⟩ := generatorView_fields_le found
      have leftBound := Nat.le_trans (carrier_operations_le left)
        (Nat.mul_le_mul_left 24 (Nat.add_le_add_right leftSize 1))
      have rightBound := Nat.le_trans (carrier_operations_le right)
        (Nat.mul_le_mul_left 24 (Nat.add_le_add_right rightSize 1))
      have seedBound := Nat.le_trans (seedWord_operations_le expected env)
        (Nat.add_le_add
          (Nat.add_le_add_right
            (Nat.add_le_add_left
              (Nat.mul_le_mul_left 4 (Nat.add_le_add_right envSize expected.size)) 20) 2)
          (Nat.mul_le_mul_left 128 (Nat.pow_le_pow_left (Nat.add_le_add_right envSize 1) 2)))
      have rightRun := zeroThen_operations_le (carrier right) (fun _ => seedWord expected env) seedBound
      have rightTotal := Nat.le_trans rightRun
        (Nat.add_le_add_right (Nat.add_le_add_right rightBound 3) _)
      have leftRun := zeroThen_operations_le (carrier left)
        (fun _ => zeroThen (carrier right) (fun _ => seedWord expected env)) rightTotal
      have leftTotal := Nat.le_trans leftRun
        (Nat.add_le_add_right (Nat.add_le_add_right leftBound 3) _)
      exact Nat.add_le_add viewBound leftTotal

theorem generator_operations_le (expected term : Term) :
    (generator expected term).operations ≤
      128 * (term.size + 1) ^ 2 + 52 * term.size + 4 * expected.size + 82 := by
  have bound := generator_operations_bound expected term
  rw [show 52 = 24 + 24 + 4 by rfl, show 82 = 6 + 24 + 3 + 24 + 3 + 20 + 2 by rfl]
  simpa only [Nat.mul_add, Nat.add_mul, Nat.mul_one,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

end PureSFormal.PureS.ParserEnvelopePrimitive
