import PureSFormal.PureS.ParserEnvelopePrimitive

/-!
# Primitive open-base parsing

The parser reads the five-application shell, compares its two continuation
occurrences and the fixed `b` field, and parses the two environment wrappers.
It preserves the public parser's comparison order. Queue, seed, and beta
payloads are returned by reference; the action wrapper is precompiled input.
-/

namespace PureSFormal.PureS.ParserBasePrimitive

open ParserPrimitiveMachine ParserEnvelopePrimitive

structure Fields where
  outerContinuation : Term
  activeEnvironment : Term
  foundB : Term
  dormantEnvironment : Term
  innerContinuation : Term
  beta : Term

def Fields.term (fields : Fields) : Term :=
  .app (.app fields.outerContinuation
    (.app (.app fields.activeEnvironment (.app fields.foundB fields.dormantEnvironment))
      fields.innerContinuation)) fields.beta

def Fields.weight (fields : Fields) : Nat :=
  fields.outerContinuation.size + fields.activeEnvironment.size + fields.foundB.size +
    fields.dormantEnvironment.size + fields.innerContinuation.size + fields.beta.size

def view : Term → Result (Option Fields)
  | .s => ⟨none, 2⟩
  | .app .s _ => ⟨none, 5⟩
  | .app (.app _ .s) _ => ⟨none, 8⟩
  | .app (.app _ (.app .s _)) _ => ⟨none, 11⟩
  | .app (.app _ (.app (.app _ .s) _)) _ => ⟨none, 14⟩
  | .app (.app outer (.app (.app active (.app foundB dormant)) inner)) beta =>
      ⟨some ⟨outer, active, foundB, dormant, inner, beta⟩, 17⟩

theorem view_operations_le (term : Term) : (view term).operations ≤ 17 := by
  fun_cases view term <;> simp [view]

theorem view_fields {term : Term} {fields : Fields}
    (found : (view term).value = some fields) : term = fields.term := by
  fun_cases view term <;> simp only [view, Option.some.injEq] at found <;>
    cases found <;> rfl

theorem view_weight_le {term : Term} {fields : Fields}
    (found : (view term).value = some fields) : fields.weight ≤ term.size := by
  rw [view_fields found]
  have size : fields.term.size = fields.weight + 5 := by
    rw [show 5 = 1 + 1 + 1 + 1 + 1 by rfl]
    simp only [Fields.term, Fields.weight, Term.size, Nat.succ_eq_add_one,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [size]
  exact Nat.le_add_right _ _

theorem view_none {term : Term} (found : (view term).value = none) (actions : Term) :
    CheckpointDecoder.parseBase? actions term = none := by
  fun_cases view term <;> simp_all [view, CheckpointDecoder.parseBase?]

def payloads (expected : Term) (fields : Fields) : Result (Option CheckpointDecoder.BaseView) :=
  let active := environment expected fields.activeEnvironment
  let dormant := environment expected fields.dormantEnvironment
  match active.value, dormant.value with
  | none, _ => ⟨none, active.operations + dormant.operations + 2⟩
  | some _, none => ⟨none, active.operations + dormant.operations + 3⟩
  | some queue, some seed =>
      ⟨some ⟨queue, fields.outerContinuation, seed, fields.beta⟩,
        active.operations + dormant.operations + 4⟩

theorem payloads_value (actions : Term) (fields : Fields) :
    (payloads (actCode actions) fields).value =
      match CheckpointDecoder.parseEnvironment? actions fields.activeEnvironment,
          CheckpointDecoder.parseEnvironment? actions fields.dormantEnvironment with
      | some queue, some seed => some ⟨queue, fields.outerContinuation, seed, fields.beta⟩
      | _, _ => none := by
  unfold payloads
  dsimp only
  rw [environment_value, environment_value]
  cases CheckpointDecoder.parseEnvironment? actions fields.activeEnvironment with
  | none => rfl
  | some queue => cases CheckpointDecoder.parseEnvironment? actions fields.dormantEnvironment <;> rfl

theorem payloads_operations_le (expected : Term) (fields : Fields) :
    (payloads expected fields).operations ≤
      (20 + 4 * (fields.activeEnvironment.size + expected.size)) +
        (20 + 4 * (fields.dormantEnvironment.size + expected.size)) + 4 := by
  have common := Nat.add_le_add_right
    (Nat.add_le_add (environment_operations_le expected fields.activeEnvironment)
      (environment_operations_le expected fields.dormantEnvironment)) 4
  unfold payloads
  dsimp only
  split
  · exact Nat.le_trans (Nat.add_le_add_left (by decide : 2 ≤ 4) _) common
  · exact Nat.le_trans (Nat.add_le_add_left (by decide : 3 ≤ 4) _) common
  · exact common

def body (expected : Term) (fields : Fields) : Result (Option CheckpointDecoder.BaseView) :=
  let continuation := equal fields.outerContinuation fields.innerContinuation
  if continuation.value then
    let fixed := equal fields.foundB b
    if fixed.value then
      let result := payloads expected fields
      ⟨result.value, continuation.operations + 1 + fixed.operations + 1 + result.operations⟩
    else
      ⟨none, continuation.operations + 1 + fixed.operations + 2⟩
  else
    ⟨none, continuation.operations + 2⟩

theorem body_value (actions : Term) (fields : Fields) :
    (body (actCode actions) fields).value = CheckpointDecoder.parseBase? actions fields.term := by
  unfold body
  simp only [equal_value]
  unfold Fields.term CheckpointDecoder.parseBase?
  dsimp only
  split
  · split
    · exact payloads_value actions fields
    · rfl
  · rfl

theorem body_operations_bound (expected : Term) (fields : Fields) :
    (body expected fields).operations ≤
      4 * (fields.outerContinuation.size + fields.innerContinuation.size) + 1 +
        4 * (fields.foundB.size + b.size) + 1 +
          ((20 + 4 * (fields.activeEnvironment.size + expected.size)) +
            (20 + 4 * (fields.dormantEnvironment.size + expected.size)) + 4) := by
  have continuation := equal_operations_le fields.outerContinuation fields.innerContinuation
  have fixed := equal_operations_le fields.foundB b
  have result := payloads_operations_le expected fields
  have common := Nat.add_le_add
    (Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add_right continuation 1) fixed) 1) result
  unfold body
  dsimp only
  split
  · split
    · exact common
    · have resultPositive : 2 ≤ 1 +
          ((20 + 4 * (fields.activeEnvironment.size + expected.size)) +
            (20 + 4 * (fields.dormantEnvironment.size + expected.size)) + 4) :=
        Nat.le_trans (by decide : 2 ≤ 4)
          (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_left _ _))
      exact Nat.le_trans (Nat.add_le_add_right
        (Nat.add_le_add (Nat.add_le_add_right continuation 1) fixed) 2)
        (by simpa only [Nat.add_assoc] using (Nat.add_le_add_left resultPositive
          (4 * (fields.outerContinuation.size + fields.innerContinuation.size) + 1 +
            4 * (fields.foundB.size + b.size))))
  · have resultPositive : 2 ≤ 1 + 4 * (fields.foundB.size + b.size) + 1 +
        ((20 + 4 * (fields.activeEnvironment.size + expected.size)) +
          (20 + 4 * (fields.dormantEnvironment.size + expected.size)) + 4) :=
      Nat.le_trans (by decide : 2 ≤ 4)
        (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_left _ _))
    exact Nat.le_trans (Nat.add_le_add_right continuation 2)
      (by simpa only [Nat.add_assoc] using (Nat.add_le_add_left resultPositive
        (4 * (fields.outerContinuation.size + fields.innerContinuation.size))))

theorem body_operations_le (expected : Term) (fields : Fields) :
    (body expected fields).operations ≤ 4 * fields.weight + 8 * expected.size + 58 := by
  have bound := body_operations_bound expected fields
  have extended := Nat.le_trans bound (Nat.le_add_right _ (4 * fields.beta.size))
  rw [show b.size = 3 by rfl] at extended
  rw [show 8 = 4 + 4 by rfl, show 58 = 1 + 4 * 3 + 1 + 20 + 20 + 4 by rfl]
  simpa only [Fields.weight, Nat.mul_add, Nat.add_mul,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using extended

def parse (expected term : Term) : Result (Option CheckpointDecoder.BaseView) :=
  let shell := view term
  match shell.value with
  | none => ⟨none, shell.operations + 2⟩
  | some fields =>
      let parsed := body expected fields
      ⟨parsed.value, shell.operations + 1 + parsed.operations⟩

theorem parse_value (actions term : Term) :
    (parse (actCode actions) term).value = CheckpointDecoder.parseBase? actions term := by
  rw [parse]
  split
  · next found => exact (view_none found actions).symm
  · next fields found => rw [view_fields found]; exact body_value actions fields

theorem parse_operations_le (expected term : Term) :
    (parse expected term).operations ≤ 4 * term.size + 8 * expected.size + 76 := by
  have shell := view_operations_le term
  rw [parse]
  split
  · exact Nat.le_trans (Nat.add_le_add_right shell 2)
      (Nat.le_trans (by decide : 17 + 2 ≤ 76) (Nat.le_add_left _ _))
  · next fields found =>
      have bodyBound := Nat.le_trans (body_operations_le expected fields)
        (Nat.add_le_add_right (Nat.add_le_add_right
          (Nat.mul_le_mul_left 4 (view_weight_le found)) _) 58)
      have combined := Nat.add_le_add (Nat.add_le_add_right shell 1) bodyBound
      rw [show 76 = 17 + 1 + 58 by rfl]
      simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined

end PureSFormal.PureS.ParserBasePrimitive
