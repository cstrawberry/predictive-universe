import PureSFormal.PureS.ParserEnvelopePrimitive

/-!
# Primitive terminal-envelope parsing

Carrier indices are immutable unary natural numbers. Equality reads their
constructors in lockstep, and the positive predecessor test returns an existing
predecessor reference. The fixed action wrapper is precompiled grammar input.
All tree parsing uses the counted envelope primitives, including failed parses.
-/

namespace PureSFormal.PureS.ParserTerminalPrimitive

open ParserPrimitiveMachine ParserEnvelopePrimitive

def equalIndex : Nat → Nat → Result Bool
  | 0, 0 => ⟨true, 2⟩
  | 0, .succ _ => ⟨false, 2⟩
  | .succ _, 0 => ⟨false, 2⟩
  | .succ left, .succ right =>
      let rest := equalIndex left right
      ⟨rest.value, 4 + rest.operations⟩

theorem equalIndex_value (left right : Nat) :
    (equalIndex left right).value = true ↔ left = right := by
  induction left generalizing right with
  | zero =>
      cases right with
      | zero => exact ⟨fun _ => rfl, fun _ => rfl⟩
      | succ right => constructor <;> intro impossible <;> cases impossible
  | succ left ih =>
      cases right with
      | zero => constructor <;> intro impossible <;> cases impossible
      | succ right =>
          change (equalIndex left right).value = true ↔ left.succ = right.succ
          exact (ih right).trans ⟨congrArg Nat.succ, Nat.succ.inj⟩

theorem equalIndex_operations_le (left right : Nat) :
    (equalIndex left right).operations ≤ 4 * left + 2 := by
  induction left generalizing right with
  | zero => cases right <;> exact Nat.le_refl _
  | succ left ih =>
      cases right with
      | zero => exact Nat.le_add_left _ _
      | succ right =>
          simpa only [equalIndex, Nat.succ_eq_add_one, Nat.mul_add, Nat.mul_one,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
            Nat.add_le_add_left (ih right) 4

def positivePredecessor : Nat → Result (Option Nat)
  | 0 => ⟨none, 2⟩
  | .succ 0 => ⟨none, 4⟩
  | .succ predecessor@(.succ _) => ⟨some predecessor, 4⟩

theorem positivePredecessor_value (count : Nat) :
    (positivePredecessor count).value = if 2 ≤ count then some (count - 1) else none := by
  cases count with
  | zero => rfl
  | succ count =>
      cases count with
      | zero => rfl
      | succ count =>
          change some (count + 1) = if 2 ≤ count + 2 then some (count + 2 - 1) else none
          rw [if_pos (Nat.le_add_left 2 count)]
          rfl

theorem positivePredecessor_operations_le (count : Nat) :
    (positivePredecessor count).operations ≤ 4 := by
  cases count with
  | zero => decide
  | succ count => cases count <;> exact Nat.le_refl _

theorem carrier_count_size (count : Nat) : count ≤ (C count).size := by
  induction count with
  | zero => exact Nat.zero_le _
  | succ count ih =>
      exact Nat.add_le_add_right (Nat.le_trans ih (Nat.le_add_left _ _)) 1

theorem carrier_count_le {term : Term} {count : Nat}
    (found : (carrier term).value = some count) : count ≤ term.size := by
  have shape := CheckpointDecoder.parseCarrier?_sound ((carrier_value term).symm.trans found)
  rw [shape]
  exact carrier_count_size count

def terminalFields (left right : Result (Option Nat)) (environment : Result (Option Term)) :
    Result (Option CheckpointDecoder.TerminalView) :=
  let cost := left.operations + right.operations + environment.operations
  match left.value, right.value, environment.value with
  | none, _, _ => ⟨none, cost + 2⟩
  | some _, none, _ => ⟨none, cost + 3⟩
  | some _, some _, none => ⟨none, cost + 4⟩
  | some leftIndex, some rightIndex, some seedPayload =>
      let same := equalIndex leftIndex rightIndex
      if same.value then
        let horizon := positivePredecessor leftIndex
        match horizon.value with
        | none => ⟨none, cost + same.operations + horizon.operations + 6⟩
        | some count =>
            ⟨some ⟨count, seedPayload⟩, cost + same.operations + horizon.operations + 7⟩
      else
        ⟨none, cost + same.operations + 5⟩

theorem terminalFields_value (left right : Result (Option Nat))
    (environment : Result (Option Term)) :
    (terminalFields left right environment).value =
      match left.value, right.value, environment.value with
      | some leftIndex, some rightIndex, some seedPayload =>
          if leftIndex = rightIndex then
            if 2 ≤ leftIndex then some ⟨leftIndex - 1, seedPayload⟩ else none
          else none
      | _, _, _ => none := by
  unfold terminalFields
  cases hleft : left.value with
  | none => rfl
  | some leftIndex =>
      cases hright : right.value with
      | none => rfl
      | some rightIndex =>
          cases henv : environment.value with
          | none => rfl
          | some seedPayload =>
              simp only [equalIndex_value]
              split
              · rw [positivePredecessor_value]
                by_cases positive : 2 ≤ leftIndex <;> simp only [positive, ↓reduceIte]
              · rfl

theorem terminalFields_operations_le (left right : Result (Option Nat))
    (environment : Result (Option Term)) (cap : Nat)
    (leftBound : ∀ count, left.value = some count → count ≤ cap) :
    (terminalFields left right environment).operations ≤
      left.operations + right.operations + environment.operations + 4 * cap + 16 := by
  let base := left.operations + right.operations + environment.operations
  have allowance (amount : Nat) (h : amount ≤ 16) :
      base + amount ≤ base + 4 * cap + 16 :=
    Nat.le_trans (Nat.add_le_add_left h base)
      (Nat.add_le_add_right (Nat.le_add_right _ _) 16)
  unfold terminalFields
  cases hleft : left.value with
  | none => exact allowance 2 (by decide)
  | some leftIndex =>
      cases hright : right.value with
      | none => exact allowance 3 (by decide)
      | some rightIndex =>
          cases henv : environment.value with
          | none => exact allowance 4 (by decide)
          | some seedPayload =>
              have indexBound := Nat.le_trans (equalIndex_operations_le leftIndex rightIndex)
                (Nat.add_le_add_right (Nat.mul_le_mul_left 4 (leftBound leftIndex hleft)) 2)
              have predBound := positivePredecessor_operations_le leftIndex
              have common : base + (equalIndex leftIndex rightIndex).operations +
                  (positivePredecessor leftIndex).operations + 7 ≤ base + 4 * cap + 16 := by
                have first := Nat.add_le_add_right
                  (Nat.add_le_add (Nat.add_le_add_left indexBound base) predBound) 7
                have second := Nat.add_le_add_left (by decide : 2 + 4 + 7 ≤ 16)
                  (base + 4 * cap)
                exact Nat.le_trans first
                  (by simpa only [Nat.add_assoc] using second)
              dsimp only
              split
              · split
                · exact Nat.le_trans (Nat.add_le_add_left (by decide : 6 ≤ 7) _) common
                · exact common
              · have first := Nat.add_le_add
                  (Nat.le_add_right (base + (equalIndex leftIndex rightIndex).operations)
                    (positivePredecessor leftIndex).operations) (by decide : 5 ≤ 7)
                exact Nat.le_trans first common

def parse (expected term : Term) : Result (Option CheckpointDecoder.TerminalView) :=
  let view := generatorView term
  match view.value with
  | .invalid => ⟨none, view.operations + 1⟩
  | .fields left right env =>
      let result := terminalFields (carrier left) (carrier right) (environment expected env)
      ⟨result.value, view.operations + result.operations⟩

theorem parse_value (actions term : Term) :
    (parse (actCode actions) term).value = CheckpointDecoder.parseTerminal? actions term := by
  rw [parse]
  split
  · next found =>
      fun_cases generatorView term <;> simp_all [generatorView, CheckpointDecoder.parseTerminal?]
  · next left right env found =>
      rw [generatorView_fields found]
      dsimp only
      rw [terminalFields_value, carrier_value, carrier_value, environment_value]
      rfl

theorem parse_operations_bound (expected term : Term) :
    (parse expected term).operations ≤
      6 + (24 * (term.size + 1) + 24 * (term.size + 1) +
        (20 + 4 * (term.size + expected.size)) + 4 * term.size + 16) := by
  have viewBound := generatorView_operations_le term
  rw [parse]
  split
  · have first := Nat.add_le_add_right viewBound 1
    have second : 1 ≤ 24 * (term.size + 1) + 24 * (term.size + 1) +
        (20 + 4 * (term.size + expected.size)) + 4 * term.size + 16 :=
      Nat.le_trans (by decide : 1 ≤ 16) (Nat.le_add_left _ _)
    exact Nat.le_trans first (Nat.add_le_add_left second 6)
  · next left right env found =>
      obtain ⟨leftSize, rightSize, envSize⟩ := generatorView_fields_le found
      have leftCost := Nat.le_trans (carrier_operations_le left)
        (Nat.mul_le_mul_left 24 (Nat.add_le_add_right leftSize 1))
      have rightCost := Nat.le_trans (carrier_operations_le right)
        (Nat.mul_le_mul_left 24 (Nat.add_le_add_right rightSize 1))
      have envCost := Nat.le_trans (environment_operations_le expected env)
        (Nat.add_le_add_left (Nat.mul_le_mul_left 4
          (Nat.add_le_add_right envSize expected.size)) 20)
      have body := terminalFields_operations_le (carrier left) (carrier right)
        (environment expected env) term.size
        (fun _ success => Nat.le_trans (carrier_count_le success) leftSize)
      have total := Nat.le_trans body (Nat.add_le_add_right
        (Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add leftCost rightCost) envCost) _) 16)
      exact Nat.add_le_add viewBound total

theorem parse_operations_le (expected term : Term) :
    (parse expected term).operations ≤ 56 * term.size + 4 * expected.size + 90 := by
  have bound := parse_operations_bound expected term
  rw [show 56 = 24 + 24 + 4 + 4 by rfl, show 90 = 6 + 24 + 24 + 20 + 16 by rfl]
  simpa only [Nat.mul_add, Nat.add_mul, Nat.mul_one,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

end PureSFormal.PureS.ParserTerminalPrimitive
