import PureSFormal.Research.ProtectedTrieTableauExactCost

/-!
# Constructive resource certificate for the exact local tableau verifier

This module bounds the *actual* `Meter` evaluation in
`ProtectedTrieTableauExactCost`.  No separately postulated phase allowance is
used.  The counted operations include literal tableau parsing, canonical
re-encoding, list and row equality, the initial-row check, source-table and
tape lookup, replacement and padded movement, and every adjacent-row check.
-/

namespace PureSFormal.Research.ProtectedTrieTableauExactResource

open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieTableau
open PureSFormal.Research.ProtectedTrieTableauExactCost

/-! ## Small constructive arithmetic combinators -/

theorem one_le_succ (number : Nat) : 1 <= number + 1 :=
  Nat.succ_le_succ (Nat.zero_le number)

theorem add_le_add3 {a b c x y z : Nat}
    (ha : a <= x) (hb : b <= y) (hc : c <= z) :
    a + b + c <= x + y + z :=
  Nat.add_le_add (Nat.add_le_add ha hb) hc

theorem add_le_add4 {a b c d w x y z : Nat}
    (ha : a <= w) (hb : b <= x) (hc : c <= y) (hd : d <= z) :
    a + b + c + d <= w + x + y + z :=
  Nat.add_le_add (add_le_add3 ha hb hc) hd

theorem add_le_add6 {a b c d e f u v w x y z : Nat}
    (ha : a <= u) (hb : b <= v) (hc : c <= w)
    (hd : d <= x) (he : e <= y) (hf : f <= z) :
    a + b + c + d + e + f <= u + v + w + x + y + z :=
  Nat.add_le_add (Nat.add_le_add (add_le_add4 ha hb hc hd) he) hf

theorem mul_le_mul_constructive {a b c d : Nat}
    (ha : a <= c) (hb : b <= d) : a * b <= c * d :=
  Nat.mul_le_mul ha hb

theorem coeff14 (number : Nat) :
    number + number + 9 * number + number + number + number =
      14 * number := by
  simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add]
  simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem coeff18 (number : Nat) :
    16 * number + number + number = 18 * number := by
  simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add]

theorem coeff9 (number : Nat) : 8 * number + number = 9 * number := by
  simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add]

theorem coeff39 (number : Nat) :
    number + 18 * (2 * number) + number + number = 39 * number := by
  simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add]
  simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem self_le_mul64 (number : Nat) : number <= 64 * number := by
  calc
    number = 1 * number := (Nat.one_mul number).symm
    _ <= 64 * number := Nat.mul_le_mul_right number (by decide : 1 <= 64)

theorem nat_pow_two (number : Nat) : number ^ 2 = number * number := by
  simp [Nat.pow_succ]

theorem self_le_square {number : Nat} (hone : 1 <= number) :
    number <= number * number := by
  have h := Nat.mul_le_mul_left number hone
  simpa only [Nat.mul_one] using h

theorem unit_le_factor (count unit : Nat) :
    unit <= (count + 1) * unit := by
  have hcoeff : 1 <= count + 1 := one_le_succ count
  have h := Nat.mul_le_mul_right unit hcoeff
  simpa only [Nat.one_mul] using h

theorem succ_factor (count unit : Nat) :
    (count + 2) * unit = unit + (count + 1) * unit := by
  change (count + 1 + 1) * unit = _
  calc
    (count + 1 + 1) * unit = (count + 1) * unit + unit :=
      Nat.succ_mul (count + 1) unit
    _ = unit + (count + 1) * unit := Nat.add_comm _ _

theorem self_le_mul16 (number : Nat) : number <= 16 * number := by
  have h := Nat.mul_le_mul_right number (by decide : 1 <= 16)
  simpa only [Nat.one_mul] using h

theorem one_add_two_add (number : Nat) :
    1 + (2 + number) = number + 3 := by
  calc
    1 + (2 + number) = (2 + number) + 1 :=
      Nat.add_comm _ _
    _ = (number + 2) + 1 :=
      congrArg (fun value => value + 1) (Nat.add_comm 2 number)
    _ = number + (2 + 1) := Nat.add_assoc _ _ _
    _ = number + 3 := rfl

theorem one_add_add_two (number : Nat) :
    1 + (number + 2) = number + 3 := by
  calc
    1 + (number + 2) = (number + 2) + 1 := Nat.add_comm _ _
    _ = number + (2 + 1) := Nat.add_assoc _ _ _
    _ = number + 3 := rfl

/-! ## Equality costs can be charged to the literal right operand -/

theorem natEqM_ticks_le_right (left right : Nat) :
    (natEqM left right).ticks <= right + 1 := by
  induction right generalizing left with
  | zero => cases left <;> exact Nat.le_refl 1
  | succ right ih =>
      cases left with
      | zero => exact one_le_succ (right + 1)
      | succ left =>
          change (natEqM left right).ticks + 1 <= (right + 1) + 1
          exact Nat.add_le_add_right (ih left) 1

theorem natEqM_peak_le_right (left right : Nat) :
    (natEqM left right).peak <= right + 1 := by
  induction right generalizing left with
  | zero => cases left <;> exact Nat.le_refl 1
  | succ right ih =>
      cases left with
      | zero => exact one_le_succ (right + 1)
      | succ left =>
          change (natEqM left right).peak + 1 <= (right + 1) + 1
          exact Nat.add_le_add_right (ih left) 1

theorem bitsEqM_ticks_le_right (left right : BitWord) :
    (bitsEqM left right).ticks <= right.length + 1 := by
  induction right generalizing left with
  | nil => cases left <;> exact Nat.le_refl 1
  | cons y ys ih =>
      cases left with
      | nil => exact one_le_succ (ys.length + 1)
      | cons x xs =>
          cases hxy : (x == y) with
          | false =>
              simp only [bitsEqM, hxy, Bool.false_eq_true, ↓reduceIte,
                Meter.ticks, List.length_cons]
              change 1 <= (ys.length + 1) + 1
              exact one_le_succ (ys.length + 1)
          | true =>
              simp only [bitsEqM, hxy, ↓reduceIte, Meter.ticks,
                List.length_cons]
              change (bitsEqM xs ys).ticks + 1 <=
                (ys.length + 1) + 1
              exact Nat.add_le_add_right (ih xs) 1

theorem bitsEqM_peak_le_right (left right : BitWord) :
    (bitsEqM left right).peak <= right.length + 1 := by
  induction right generalizing left with
  | nil => cases left <;> exact Nat.le_refl 1
  | cons y ys ih =>
      cases left with
      | nil => exact one_le_succ (ys.length + 1)
      | cons x xs =>
          cases hxy : (x == y) with
          | false =>
              simp only [bitsEqM, hxy, Bool.false_eq_true, ↓reduceIte,
                Meter.peak, List.length_cons]
              change 1 <= (ys.length + 1) + 1
              exact one_le_succ (ys.length + 1)
          | true =>
              simp only [bitsEqM, hxy, ↓reduceIte, Meter.peak,
                List.length_cons]
              change (bitsEqM xs ys).peak + 1 <=
                (ys.length + 1) + 1
              exact Nat.add_le_add_right (ih xs) 1

def rowMass (row : Row) : Nat :=
  row.state + row.head + row.tape.length + 3

theorem rowEqM_ticks_le_right (left right : Row) :
    (rowEqM left right).ticks <= rowMass right := by
  unfold rowEqM rowMass
  have hsum :=
    add_le_add3 (natEqM_ticks_le_right left.state right.state)
      (natEqM_ticks_le_right left.head right.head)
      (bitsEqM_ticks_le_right left.tape right.tape)
  have heq : (right.state + 1) + (right.head + 1) +
      (right.tape.length + 1) =
      right.state + right.head + right.tape.length + 3 := by
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [← heq]
  exact hsum

theorem rowEqM_peak_le_right (left right : Row) :
    (rowEqM left right).peak <= rowMass right := by
  unfold rowEqM rowMass
  let stateBound := right.state + 1
  let headBound := right.head + 1
  let tapeBound := right.tape.length + 1
  have htotal : stateBound + headBound + tapeBound =
      right.state + right.head + right.tape.length + 3 := by
    simp [stateBound, headBound, tapeBound, Nat.add_assoc,
      Nat.add_comm, Nat.add_left_comm]
  apply (Nat.max_le).2
  constructor
  · exact Nat.le_trans (natEqM_peak_le_right _ _)
      (by
        change stateBound <= _
        rw [← htotal]
        exact Nat.le_trans (Nat.le_add_right stateBound headBound)
          (Nat.le_add_right (stateBound + headBound) tapeBound))
  · apply (Nat.max_le).2
    constructor
    · exact Nat.le_trans (natEqM_peak_le_right _ _)
        (by
          change headBound <= _
          rw [← htotal]
          exact Nat.le_trans (Nat.le_add_left _ stateBound)
            (Nat.le_add_right _ tapeBound))
    · exact Nat.le_trans (bitsEqM_peak_le_right _ _)
        (by
          change tapeBound <= _
          rw [← htotal]
          exact Nat.le_add_left _ (stateBound + headBound))

/-! ## Literal row mass -/

def rowsMass : List Row -> Nat
  | [] => 0
  | row :: rows => rowMass row + rowsMass rows

theorem state_succ_le_encodeRow_length (row : Row) :
    row.state + 1 <= (encodeRow row).length := by
  rw [encodeRow_length]
  have heq : (row.state + 1) +
      (row.head + 2 * row.tape.length + 2) =
      row.state + row.head + 2 * row.tape.length + 3 := by
    calc
      (row.state + 1) + (row.head + 2 * row.tape.length + 2) =
          row.state + (1 + (row.head + (2 * row.tape.length + 2))) := by
            rw [Nat.add_assoc row.state 1,
              Nat.add_assoc row.head (2 * row.tape.length) 2]
      _ = row.state + (row.head + (1 + (2 * row.tape.length + 2))) := by
            rw [Nat.add_left_comm 1 row.head]
      _ = row.state + (row.head + (2 * row.tape.length + 3)) := by
            rw [one_add_add_two]
      _ = row.state + row.head + 2 * row.tape.length + 3 := by
            rw [← Nat.add_assoc row.head (2 * row.tape.length) 3,
              ← Nat.add_assoc row.state
                (row.head + 2 * row.tape.length) 3,
              ← Nat.add_assoc row.state row.head (2 * row.tape.length)]
  rw [← heq]
  exact Nat.le_add_right _ _

theorem head_succ_le_encodeRow_length (row : Row) :
    row.head + 1 <= (encodeRow row).length := by
  rw [encodeRow_length]
  have heq : row.state + (row.head + 1) +
      (2 * row.tape.length + 2) =
      row.state + row.head + 2 * row.tape.length + 3 := by
    calc
      row.state + (row.head + 1) + (2 * row.tape.length + 2) =
          row.state + (row.head + (1 + (2 * row.tape.length + 2))) := by
            rw [Nat.add_assoc row.state (row.head + 1),
              Nat.add_assoc row.head 1]
      _ = row.state + (row.head + (2 * row.tape.length + 3)) := by
            rw [one_add_add_two]
      _ = row.state + row.head + 2 * row.tape.length + 3 := by
            rw [← Nat.add_assoc row.head (2 * row.tape.length) 3,
              ← Nat.add_assoc row.state
                (row.head + 2 * row.tape.length) 3,
              ← Nat.add_assoc row.state row.head (2 * row.tape.length)]
  rw [← heq]
  exact Nat.le_trans (Nat.le_add_left _ row.state)
    (Nat.le_add_right _ _)

theorem tape_succ_le_encodeRow_length (row : Row) :
    row.tape.length + 1 <= (encodeRow row).length := by
  rw [encodeRow_length]
  have heq : (row.state + row.head) +
      ((row.tape.length + 1) + (row.tape.length + 2)) =
      row.state + row.head + 2 * row.tape.length + 3 := by
    simp [Nat.two_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [← heq]
  exact Nat.le_trans (Nat.le_add_right _ (row.tape.length + 2))
    (Nat.le_add_left _ (row.state + row.head))

theorem rowMass_le_encodeRow_length (row : Row) :
    rowMass row <= (encodeRow row).length := by
  unfold rowMass
  rw [encodeRow_length]
  have hdouble := Nat.le_add_right row.tape.length row.tape.length
  have hdouble' : row.tape.length <= 2 * row.tape.length := by
    simpa [Nat.two_mul] using hdouble
  exact Nat.add_le_add_right
    (Nat.add_le_add_left hdouble' (row.state + row.head)) 3

theorem rowsMass_le_encodeRowData_length (rows : List Row) :
    rowsMass rows <= (encodeRowData rows).length := by
  induction rows with
  | nil => exact Nat.le_refl 0
  | cons row rows ih =>
      change rowMass row + rowsMass rows <=
        (encodeRow row ++ encodeRowData rows).length
      rw [List.length_append]
      exact Nat.add_le_add (rowMass_le_encodeRow_length row) ih

theorem rows_length_le_encodeTableau_length (rows : List Row) :
    rows.length <= (encodeTableau rows).length := by
  simp only [encodeTableau, List.length_append, encodeNat_length]
  exact Nat.le_trans (Nat.le_add_right rows.length 1)
    (Nat.le_add_right (rows.length + 1) (encodeRowData rows).length)

theorem rowsMass_le_encodeTableau_length (rows : List Row) :
    rowsMass rows <= (encodeTableau rows).length := by
  simp only [encodeTableau, List.length_append]
  exact Nat.le_trans (rowsMass_le_encodeRowData_length rows)
    (Nat.le_add_left _ (encodeNat rows.length).length)

/-! ## The canonical encoder is linearly charged to its literal output -/

theorem encodeRowM_ticks_le_linear (row : Row) :
    (encodeRowM row).ticks <= 16 * ((encodeRow row).length + 1) := by
  let width := (encodeRow row).length + 1
  have hwidth : 1 <= width := by
    exact Nat.le_trans (one_le_succ (encodeRow row).length)
      (Nat.le_refl width)
  have hstate : row.state + 1 <= width :=
    Nat.le_trans (state_succ_le_encodeRow_length row)
      (Nat.le_succ _)
  have hhead : row.head + 1 <= width :=
    Nat.le_trans (head_succ_le_encodeRow_length row)
      (Nat.le_succ _)
  have htapeLen : row.tape.length <= width :=
    Nat.le_trans (Nat.le_succ row.tape.length)
      (Nat.le_trans (tape_succ_le_encodeRow_length row)
        (Nat.le_succ _))
  have hfour := Nat.mul_le_mul_left 4 htapeLen
  have hfive := Nat.mul_le_mul_left 5 hwidth
  have htapeRaw : 4 * row.tape.length + 5 <= 9 * width := by
    calc
      4 * row.tape.length + 5 <= 4 * width + 5 * width :=
        Nat.add_le_add hfour hfive
      _ = (4 + 5) * width := (Nat.add_mul 4 5 width).symm
      _ = 9 * width := rfl
  have htape : (encodeBitsM row.tape).ticks <= 9 * width :=
    Nat.le_trans (encodeBitsM_ticks_le row.tape) htapeRaw
  have hheadAppend : (encodeNat row.head).length + 1 <= width := by
    rw [encodeNat_length]
    exact Nat.add_le_add_right
      (head_succ_le_encodeRow_length row) 1
  have hstateAppend : (encodeNat row.state).length + 1 <= width := by
    rw [encodeNat_length]
    exact Nat.add_le_add_right
      (state_succ_le_encodeRow_length row) 1
  unfold encodeRowM
  simp only [encodeNatM_ticks, encodeBitsM_value, encodeNatM_value,
    appendM_ticks]
  have hsum := add_le_add6 hstate hhead htape hheadAppend
    hstateAppend hwidth
  exact Nat.le_trans hsum (by
    rw [coeff14]
    exact Nat.mul_le_mul_right width (by decide : 14 <= 16))

theorem encodeRowM_peak_le_linear (row : Row) :
    (encodeRowM row).peak <= 16 * ((encodeRow row).length + 1) := by
  let width := (encodeRow row).length + 1
  have hstate : row.state + 1 <= width :=
    Nat.le_trans (state_succ_le_encodeRow_length row) (Nat.le_succ _)
  have hhead : row.head + 1 <= width :=
    Nat.le_trans (head_succ_le_encodeRow_length row) (Nat.le_succ _)
  have htape : (encodeBitsM row.tape).peak <= width := by
    have h := encodeBitsM_peak_le row.tape
    have hfield := Nat.add_le_add_right
      (tape_succ_le_encodeRow_length row) 1
    exact Nat.le_trans h hfield
  have hheadAppend : (encodeNat row.head).length + 1 <= width := by
    rw [encodeNat_length]
    exact Nat.add_le_add_right
      (head_succ_le_encodeRow_length row) 1
  have hstateAppend : (encodeNat row.state).length + 1 <= width := by
    rw [encodeNat_length]
    exact Nat.add_le_add_right
      (state_succ_le_encodeRow_length row) 1
  have hwidth16 : width <= 16 * width := by
    calc
      width = 1 * width := (Nat.one_mul width).symm
      _ <= 16 * width := Nat.mul_le_mul_right width (by decide : 1 <= 16)
  unfold encodeRowM
  simp only [encodeNatM_peak, encodeBitsM_value, encodeNatM_value,
    appendM_peak]
  apply (Nat.max_le).2
  refine ⟨Nat.le_trans hstate hwidth16, (Nat.max_le).2
    ⟨Nat.le_trans hhead hwidth16, (Nat.max_le).2
      ⟨Nat.le_trans htape hwidth16, (Nat.max_le).2
        ⟨Nat.le_trans hheadAppend hwidth16,
          Nat.le_trans hstateAppend hwidth16⟩⟩⟩⟩

def rowsLiteralMass (rows : List Row) : Nat :=
  (encodeRowData rows).length + rows.length + 1

theorem encodeRowsM_ticks_le_linear (rows : List Row) :
    (encodeRowsM rows).ticks <= 18 * rowsLiteralMass rows := by
  induction rows with
  | nil => exact one_le_succ 17
  | cons row rows ih =>
      unfold encodeRowsM rowsLiteralMass
      simp only [encodeRowsM_value, encodeRowM_value, appendM_ticks,
        encodeRowData, List.length_append, List.length_cons]
      have hrow := encodeRowM_ticks_le_linear row
      have hone : 1 <= (encodeRow row).length + 1 :=
        one_le_succ _
      have hjoin : (encodeRow row).length + 1 <=
          (encodeRow row).length + 1 := Nat.le_refl _
      have hsum := add_le_add4 hrow ih hjoin hone
      let rowUnit := (encodeRow row).length + 1
      let tailUnit := (encodeRowData rows).length + rows.length + 1
      have hcurrent' : 16 * rowUnit + rowUnit + rowUnit <=
          18 * rowUnit := Nat.le_of_eq (coeff18 rowUnit)
      have htail : (encodeRowsM rows).ticks <= 18 * tailUnit := by
        simpa only [tailUnit, rowsLiteralMass] using ih
      exact Nat.le_trans hsum (by
        change 16 * rowUnit + 18 * tailUnit + rowUnit + rowUnit <= _
        have hreorder : 16 * rowUnit + 18 * tailUnit + rowUnit + rowUnit =
            (16 * rowUnit + rowUnit + rowUnit) + 18 * tailUnit := by
          simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        rw [hreorder]
        have hmass : (encodeRow row).length +
            (encodeRowData rows).length + (rows.length + 1) + 1 =
            rowUnit + tailUnit := by
          simp [rowUnit, tailUnit,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        rw [hmass]
        rw [Nat.mul_add 18 rowUnit tailUnit]
        change 16 * rowUnit + rowUnit + rowUnit + 18 * tailUnit <=
          18 * rowUnit + 18 * tailUnit
        exact Nat.add_le_add hcurrent' (Nat.le_refl _))

theorem encodeRowsM_peak_le_linear (rows : List Row) :
    (encodeRowsM rows).peak <= 18 * rowsLiteralMass rows := by
  induction rows with
  | nil => exact one_le_succ 17
  | cons row rows ih =>
      unfold encodeRowsM rowsLiteralMass
      simp only [encodeRowsM_value, encodeRowM_value, appendM_peak,
        encodeRowData, List.length_append, List.length_cons]
      let rowUnit := (encodeRow row).length + 1
      let tailUnit := (encodeRowData rows).length + rows.length + 1
      have hmass : (encodeRow row).length +
          (encodeRowData rows).length + (rows.length + 1) + 1 =
          rowUnit + tailUnit := by
        simp [rowUnit, tailUnit,
          Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      rw [hmass, Nat.mul_add]
      apply (Nat.max_le).2
      constructor
      · exact Nat.le_trans (encodeRowM_peak_le_linear row)
          (Nat.le_trans
            (Nat.mul_le_mul_right rowUnit (by decide : 16 <= 18))
            (Nat.le_add_right _ _))
      · apply (Nat.max_le).2
        constructor
        · exact Nat.le_trans ih (Nat.le_add_left _ _)
        · exact Nat.le_trans
            (calc
              (encodeRow row).length + 1 = 1 * rowUnit := by
                simp [rowUnit]
              _ <= 18 * rowUnit :=
                Nat.mul_le_mul_right rowUnit (by decide : 1 <= 18))
            (Nat.le_add_right _ _)

theorem encodeTableauM_ticks_le_linear (rows : List Row) :
    (encodeTableauM rows).ticks <=
      64 * ((encodeTableau rows).length + 1) := by
  unfold encodeTableauM
  simp only [encodeNatM_ticks, encodeRowsM_value, encodeNatM_value,
    appendM_ticks]
  have hrows := encodeRowsM_ticks_le_linear rows
  unfold rowsLiteralMass at hrows
  have hcount : rows.length + 1 <= (encodeTableau rows).length + 1 :=
    Nat.le_trans (Nat.add_le_add_right
      (rows_length_le_encodeTableau_length rows) 1) (Nat.le_refl _)
  have hdata : (encodeRowData rows).length <=
      (encodeTableau rows).length := by
    simp only [encodeTableau, List.length_append]
    exact Nat.le_add_left _ _
  have hmass : (encodeRowData rows).length + rows.length + 1 <=
      2 * ((encodeTableau rows).length + 1) := by
    have hsum := Nat.add_le_add hdata hcount
    exact Nat.le_trans hsum (by
      rw [Nat.two_mul]
      exact Nat.add_le_add_right (Nat.le_succ _) _)
  have hrows' := Nat.le_trans hrows (Nat.mul_le_mul_left 18 hmass)
  have hjoin : (encodeNat rows.length).length + 1 <=
      (encodeTableau rows).length + 1 := by
    simp only [encodeTableau, List.length_append]
    exact Nat.add_le_add_right
      (Nat.le_add_right _ (encodeRowData rows).length) 1
  have hone : 1 <= (encodeTableau rows).length + 1 := one_le_succ _
  have hsum := add_le_add4 hcount hrows' hjoin hone
  exact Nat.le_trans hsum (by
    let width := (encodeTableau rows).length + 1
    change width + 18 * (2 * width) + width + width <= 64 * width
    rw [coeff39]
    exact Nat.mul_le_mul_right width (by decide : 39 <= 64))

theorem encodeTableauM_peak_le_linear (rows : List Row) :
    (encodeTableauM rows).peak <=
      64 * ((encodeTableau rows).length + 1) := by
  unfold encodeTableauM
  simp only [encodeNatM_peak, encodeRowsM_value, encodeNatM_value,
    appendM_peak]
  let width := (encodeTableau rows).length + 1
  have hcount : rows.length + 1 <= width :=
    Nat.add_le_add_right (rows_length_le_encodeTableau_length rows) 1
  have hdata : (encodeRowData rows).length <=
      (encodeTableau rows).length := by
    simp only [encodeTableau, List.length_append]
    exact Nat.le_add_left _ _
  have hmass : rowsLiteralMass rows <= 2 * width := by
    unfold rowsLiteralMass
    have hsum := Nat.add_le_add hdata hcount
    exact Nat.le_trans hsum (by
      change (encodeTableau rows).length + width <= 2 * width
      have hleft : (encodeTableau rows).length <= width := Nat.le_succ _
      exact Nat.le_trans (Nat.add_le_add_right hleft width) (by
        rw [Nat.two_mul]
        exact Nat.le_refl _))
  have hrows : (encodeRowsM rows).peak <= 36 * width :=
    Nat.le_trans (encodeRowsM_peak_le_linear rows)
      (Nat.le_trans (Nat.mul_le_mul_left 18 hmass) (by
        change 18 * (2 * width) <= 36 * width
        have heq : 18 * (2 * width) = 36 * width := by
          simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add]
          simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        exact Nat.le_of_eq heq))
  have hrows64 : (encodeRowsM rows).peak <= 64 * width :=
    Nat.le_trans hrows
      (Nat.mul_le_mul_right width (by decide : 36 <= 64))
  have hcount64 : rows.length + 1 <= 64 * width :=
    Nat.le_trans hcount (self_le_mul64 width)
  have hjoin : (encodeNat rows.length).length + 1 <= width := by
    rw [encodeNat_length]
    change rows.length + 1 + 1 <= (encodeTableau rows).length + 1
    have hbase := Nat.add_le_add_right
      (Nat.le_add_right (rows.length + 1) (encodeRowData rows).length) 1
    simpa only [encodeTableau, List.length_append, encodeNat_length,
      Nat.add_assoc] using hbase
  have hjoin64 := Nat.le_trans hjoin (self_le_mul64 width)
  apply (Nat.max_le).2
  constructor
  · exact hcount64
  · apply (Nat.max_le).2
    constructor
    · exact hrows64
    · exact hjoin64

/-! ## Parser bounds -/

theorem decodeNat?_number_succ_le_length {payload tail : BitWord}
    {number : Nat} (hdecode : decodeNat? payload = some (number, tail)) :
    number + 1 <= payload.length := by
  have hreconstruct := decodeNat?_reconstruct hdecode
  have hlength := congrArg List.length hreconstruct
  simp only [List.length_append, encodeNat_length] at hlength
  rw [hlength]
  exact Nat.le_add_right _ _

theorem decodeRow?_tail_length_le {payload tail : BitWord} {row : Row}
    (hdecode : decodeRow? payload = some (row, tail)) :
    tail.length <= payload.length := by
  have hreconstruct := decodeRow?_reconstruct hdecode
  have hlength := congrArg List.length hreconstruct
  simp only [List.length_append] at hlength
  rw [hlength]
  exact Nat.le_add_left _ _

theorem decodeRowsN?_tail_length_le {count : Nat} {payload tail : BitWord}
    {rows : List Row}
    (hdecode : decodeRowsN? count payload = some (rows, tail)) :
    tail.length <= payload.length := by
  have hreconstruct := decodeRowsN?_reconstruct hdecode
  have hlength := congrArg List.length hreconstruct
  simp only [List.length_append] at hlength
  rw [hlength]
  exact Nat.le_add_left _ _

theorem decodeBitsM?_ticks_le_width {payload : BitWord} {width : Nat}
    (hwidth : payload.length + 1 <= width) :
    (decodeBitsM? payload).ticks <= 5 * width := by
  have hraw := decodeBitsM?_ticks_le payload
  have hlen : payload.length <= width :=
    Nat.le_trans (Nat.le_succ _) hwidth
  have htwo := Nat.mul_le_mul_left 2 hlen
  have hthree' : 3 <= 3 * width := by
    exact Nat.mul_le_mul_left 3
      (Nat.le_trans (one_le_succ payload.length) hwidth)
  exact Nat.le_trans hraw (by
    have hsum := Nat.add_le_add htwo hthree'
    exact Nat.le_trans hsum (by
      have heq : 2 * width + 3 * width = 5 * width :=
        (Nat.add_mul 2 3 width).symm
      rw [heq]
      exact Nat.le_refl _))

theorem decodeRowM?_ticks_le (payload : BitWord) :
    (decodeRowM? payload).ticks <= 8 * (payload.length + 1) := by
  let width := payload.length + 1
  have hone : 1 <= width := one_le_succ _
  unfold decodeRowM?
  cases hstate : (decodeNatM? payload).value with
  | none =>
      simp only [hstate]
      have hsum := Nat.add_le_add_right (decodeNatM?_ticks_le payload) 1
      exact Nat.le_trans hsum (by
        have htwo : width + 1 <= 2 * width :=
          (by rw [Nat.two_mul]; exact Nat.add_le_add_left hone width)
        exact Nat.le_trans htwo
          (Nat.mul_le_mul_right width (by decide : 2 <= 8)))
  | some statePair =>
      rcases statePair with ⟨state, rest⟩
      have hstateSemantic : decodeNat? payload = some (state, rest) := by
        rw [← decodeNatM?_value]
        exact hstate
      have hrest : rest.length + 1 <= width :=
        Nat.le_trans (decodeNat?_tail_length_lt hstateSemantic)
          (Nat.le_succ _)
      cases hhead : (decodeNatM? rest).value with
      | none =>
          simp only [hstate, hhead]
          have hsum := add_le_add3 (decodeNatM?_ticks_le payload)
            (Nat.le_trans (decodeNatM?_ticks_le rest) hrest) hone
          exact Nat.le_trans hsum (by
            have heq : width + width + width = 3 * width := by
              simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add]
            rw [heq]
            exact Nat.mul_le_mul_right width (by decide : 3 <= 8))
      | some headPair =>
          rcases headPair with ⟨head, tail⟩
          have hheadSemantic : decodeNat? rest = some (head, tail) := by
            rw [← decodeNatM?_value]
            exact hhead
          have htailRest : tail.length + 1 <= rest.length :=
            decodeNat?_tail_length_lt hheadSemantic
          have htail : tail.length + 1 <= width :=
            Nat.le_trans htailRest
              (Nat.le_trans (Nat.le_succ rest.length) hrest)
          simp only [hstate, hhead]
          have htape := decodeBitsM?_ticks_le_width htail
          have hsum := add_le_add4 (decodeNatM?_ticks_le payload)
            (Nat.le_trans (decodeNatM?_ticks_le rest) hrest) htape hone
          exact Nat.le_trans hsum (by
            have heq : width + width + 5 * width + width = 8 * width := by
              simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add]
              simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
            rw [heq]
            exact Nat.le_refl _)

theorem decodeRowM?_peak_le (payload : BitWord) :
    (decodeRowM? payload).peak <= payload.length + 1 := by
  let width := payload.length + 1
  unfold decodeRowM?
  cases hstate : (decodeNatM? payload).value with
  | none =>
      simp only [hstate]
      exact decodeNatM?_peak_le payload
  | some statePair =>
      rcases statePair with ⟨state, rest⟩
      have hstateSemantic : decodeNat? payload = some (state, rest) := by
        rw [← decodeNatM?_value]
        exact hstate
      have hrest : rest.length + 1 <= width :=
        Nat.le_trans (decodeNat?_tail_length_lt hstateSemantic)
          (Nat.le_succ _)
      cases hhead : (decodeNatM? rest).value with
      | none =>
          simp only [hstate, hhead]
          apply (Nat.max_le).2
          exact ⟨decodeNatM?_peak_le payload,
            Nat.le_trans (decodeNatM?_peak_le rest) hrest⟩
      | some headPair =>
          rcases headPair with ⟨head, tail⟩
          have hheadSemantic : decodeNat? rest = some (head, tail) := by
            rw [← decodeNatM?_value]
            exact hhead
          have htail : tail.length + 1 <= width :=
            Nat.le_trans (decodeNat?_tail_length_lt hheadSemantic)
              (Nat.le_trans (Nat.le_succ rest.length) hrest)
          simp only [hstate, hhead]
          apply (Nat.max_le).2
          refine ⟨decodeNatM?_peak_le payload, (Nat.max_le).2
            ⟨Nat.le_trans (decodeNatM?_peak_le rest) hrest, ?_⟩⟩
          exact Nat.le_trans (decodeBitsM?_peak_le tail) htail

theorem decodeRowsNM?_ticks_le (count : Nat) (payload : BitWord) :
    (decodeRowsNM? count payload).ticks <=
      (count + 1) * (9 * (payload.length + 1)) := by
  induction count generalizing payload with
  | zero =>
      change 1 <= 1 * (9 * (payload.length + 1))
      rw [Nat.one_mul]
      have hcoeff : 1 <= 9 := by decide
      have hmul := Nat.mul_le_mul_right (payload.length + 1) hcoeff
      exact Nat.le_trans (one_le_succ payload.length)
        (by simpa only [Nat.one_mul] using hmul)
  | succ count ih =>
      let width := payload.length + 1
      have hone : 1 <= width := one_le_succ _
      unfold decodeRowsNM?
      cases hrow : (decodeRowM? payload).value with
      | none =>
          simp only [hrow]
          have hcurrent := Nat.add_le_add_right
            (decodeRowM?_ticks_le payload) 1
          have hunit : (decodeRowM? payload).ticks + 1 <= 9 * width :=
            Nat.le_trans hcurrent (by
              have hsum := Nat.add_le_add_left hone (8 * width)
              rw [coeff9] at hsum
              exact hsum)
          change (decodeRowM? payload).ticks + 1 <=
            (count + 2) * (9 * width)
          exact Nat.le_trans hunit (unit_le_factor (count + 1) _)
      | some rowPair =>
          rcases rowPair with ⟨row, rest⟩
          simp only [hrow]
          have hsemantic : decodeRow? payload = some (row, rest) := by
            rw [← decodeRowM?_value]
            exact hrow
          have hrest : rest.length + 1 <= width :=
            Nat.add_le_add_right (decodeRow?_tail_length_le hsemantic) 1
          have htailRaw := ih rest
          have htailWidth : 9 * (rest.length + 1) <= 9 * width :=
            Nat.mul_le_mul_left 9 hrest
          have htail : (decodeRowsNM? count rest).ticks <=
              (count + 1) * (9 * width) :=
            Nat.le_trans htailRaw
              (Nat.mul_le_mul_left (count + 1) htailWidth)
          have hcurrent := Nat.add_le_add_right
            (decodeRowM?_ticks_le payload) 1
          have hunit : (decodeRowM? payload).ticks + 1 <= 9 * width :=
            Nat.le_trans hcurrent (by
              have hsum := Nat.add_le_add_left hone (8 * width)
              rw [coeff9] at hsum
              exact hsum)
          have hsum := Nat.add_le_add hunit htail
          have hreorder : (decodeRowM? payload).ticks +
              (decodeRowsNM? count rest).ticks + 1 =
              ((decodeRowM? payload).ticks + 1) +
                (decodeRowsNM? count rest).ticks := by
            simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
          rw [hreorder]
          change ((decodeRowM? payload).ticks + 1) +
              (decodeRowsNM? count rest).ticks <=
            (count + 2) * (9 * width)
          exact Nat.le_trans hsum (by
            exact Nat.le_of_eq (succ_factor count (9 * width)).symm)

theorem decodeRowsNM?_peak_le (count : Nat) (payload : BitWord) :
    (decodeRowsNM? count payload).peak <=
      (count + 1) * (2 * (payload.length + 1)) := by
  induction count generalizing payload with
  | zero =>
      change 1 <= 1 * (2 * (payload.length + 1))
      rw [Nat.one_mul]
      have hcoeff : 1 <= 2 := by decide
      have hmul := Nat.mul_le_mul_right (payload.length + 1) hcoeff
      exact Nat.le_trans (one_le_succ payload.length)
        (by simpa only [Nat.one_mul] using hmul)
  | succ count ih =>
      let width := payload.length + 1
      unfold decodeRowsNM?
      cases hrow : (decodeRowM? payload).value with
      | none =>
          simp only [hrow]
          change (decodeRowM? payload).peak <=
            (count + 2) * (2 * width)
          exact Nat.le_trans (decodeRowM?_peak_le payload)
            (Nat.le_trans (by simpa only [Nat.one_mul] using
              Nat.mul_le_mul_right width (by decide : 1 <= 2))
              (unit_le_factor (count + 1) _))
      | some rowPair =>
          rcases rowPair with ⟨row, rest⟩
          simp only [hrow]
          have hsemantic : decodeRow? payload = some (row, rest) := by
            rw [← decodeRowM?_value]
            exact hrow
          have hrest : rest.length + 1 <= width :=
            Nat.add_le_add_right (decodeRow?_tail_length_le hsemantic) 1
          have htailRaw := ih rest
          have htailWidth : 2 * (rest.length + 1) <= 2 * width :=
            Nat.mul_le_mul_left 2 hrest
          have htail : (decodeRowsNM? count rest).peak <=
              (count + 1) * (2 * width) :=
            Nat.le_trans htailRaw
              (Nat.mul_le_mul_left (count + 1) htailWidth)
          apply (Nat.max_le).2
          constructor
          · exact Nat.le_trans (decodeRowM?_peak_le payload) (by
              change width <= (count + 2) * (2 * width)
              exact Nat.le_trans
                (by simpa only [Nat.one_mul] using
                  Nat.mul_le_mul_right width (by decide : 1 <= 2))
                (unit_le_factor (count + 1) _))
          · have hplus := Nat.add_le_add_right htail 1
            change (decodeRowsNM? count rest).peak + 1 <=
              (count + 2) * (2 * width)
            exact Nat.le_trans hplus (by
              have hone : 1 <= 2 * width :=
                Nat.le_trans (one_le_succ payload.length)
                  (by simpa only [Nat.one_mul] using
                    Nat.mul_le_mul_right width (by decide : 1 <= 2))
              have h := Nat.add_le_add_left hone
                ((count + 1) * (2 * width))
              exact Nat.le_trans (by
                simpa only [Nat.add_comm] using h)
                (Nat.le_of_eq (succ_factor count (2 * width)).symm))

theorem decodeTableauM?_ticks_le_quadratic (payload : BitWord) :
    (decodeTableauM? payload).ticks <=
      16 * (payload.length + 1) ^ 2 := by
  let width := payload.length + 1
  unfold decodeTableauM?
  cases hcount : (decodeNatM? payload).value with
  | none =>
      simp only [hcount]
      have hsum := Nat.add_le_add_right (decodeNatM?_ticks_le payload) 1
      exact Nat.le_trans hsum (by
        have htwo : width + 1 <= 2 * width :=
          (by rw [Nat.two_mul]
              exact Nat.add_le_add_left (one_le_succ payload.length) width)
        have h2w := Nat.le_trans htwo
          (Nat.mul_le_mul_right width (by decide : 2 <= 16))
        exact Nat.le_trans h2w (by
          rw [nat_pow_two]
          exact Nat.mul_le_mul_left 16
            (self_le_square (one_le_succ payload.length))))
  | some countPair =>
      rcases countPair with ⟨count, rest⟩
      have hsemantic : decodeNat? payload = some (count, rest) := by
        rw [← decodeNatM?_value]
        exact hcount
      have hcountLe : count + 1 <= width :=
        Nat.le_trans (decodeNat?_number_succ_le_length hsemantic)
          (Nat.le_succ _)
      have hrest : rest.length + 1 <= width :=
        Nat.le_trans (decodeNat?_tail_length_lt hsemantic)
          (Nat.le_succ _)
      have hrowsRaw := decodeRowsNM?_ticks_le count rest
      have hrowUnit : 9 * (rest.length + 1) <= 9 * width :=
        Nat.mul_le_mul_left 9 hrest
      have hrows : (decodeRowsNM? count rest).ticks <=
          width * (9 * width) :=
        Nat.le_trans hrowsRaw
          (Nat.mul_le_mul hcountLe hrowUnit)
      have hw := self_le_square (one_le_succ payload.length)
      have hrowsSq : (decodeRowsNM? count rest).ticks <=
          9 * (width * width) := Nat.le_trans hrows (by
        have heq : width * (9 * width) = 9 * (width * width) := by
          simp [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
        rw [heq]
        exact Nat.le_refl _)
      have hsum := add_le_add3
        (Nat.le_trans (decodeNatM?_ticks_le payload) hw)
        hrowsSq (Nat.le_trans (one_le_succ payload.length) hw)
      have hfinal : (decodeNatM? payload).ticks +
          (decodeRowsNM? count rest).ticks + 1 <=
          16 * (payload.length + 1) ^ 2 := by
        rw [nat_pow_two]
        exact Nat.le_trans hsum (by
          have heq : width * width + 9 * (width * width) +
              width * width = 11 * (width * width) := by
            simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add]
            simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
          rw [heq]
          exact Nat.mul_le_mul_right _ (by decide : 11 <= 16))
      cases hresult : (decodeRowsNM? count rest).value with
      | none => simp only [hcount, hresult]; exact hfinal
      | some pair =>
          rcases pair with ⟨rows, suffix⟩
          cases suffix with
          | nil => simp only [hcount, hresult]; exact hfinal
          | cons bit suffix => simp only [hcount, hresult]; exact hfinal

theorem decodeTableauM?_peak_le_quadratic (payload : BitWord) :
    (decodeTableauM? payload).peak <=
      16 * (payload.length + 1) ^ 2 := by
  let width := payload.length + 1
  unfold decodeTableauM?
  cases hcount : (decodeNatM? payload).value with
  | none =>
      simp only [hcount]
      exact Nat.le_trans (decodeNatM?_peak_le payload) (by
        rw [nat_pow_two]
        exact Nat.le_trans (self_le_square (one_le_succ payload.length))
          (self_le_mul16 _))
  | some countPair =>
      rcases countPair with ⟨count, rest⟩
      have hsemantic : decodeNat? payload = some (count, rest) := by
        rw [← decodeNatM?_value]
        exact hcount
      have hcountLe : count + 1 <= width :=
        Nat.le_trans (decodeNat?_number_succ_le_length hsemantic)
          (Nat.le_succ _)
      have hrest : rest.length + 1 <= width :=
        Nat.le_trans (decodeNat?_tail_length_lt hsemantic)
          (Nat.le_succ _)
      have hrowsRaw := decodeRowsNM?_peak_le count rest
      have hrows : (decodeRowsNM? count rest).peak <=
          width * (2 * width) :=
        Nat.le_trans hrowsRaw
          (Nat.mul_le_mul hcountLe (Nat.mul_le_mul_left 2 hrest))
      have hw := self_le_square (one_le_succ payload.length)
      have hcountFinal : (decodeNatM? payload).peak <=
          16 * (payload.length + 1) ^ 2 := by
        rw [nat_pow_two]
        exact Nat.le_trans (Nat.le_trans (decodeNatM?_peak_le payload) hw)
          (self_le_mul16 _)
      have hrowsFinal : (decodeRowsNM? count rest).peak <=
          16 * (payload.length + 1) ^ 2 := by
        rw [nat_pow_two]
        exact Nat.le_trans hrows (by
          have heq : width * (2 * width) = 2 * (width * width) := by
            simp [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
          rw [heq]
          exact Nat.mul_le_mul_right _ (by decide : 2 <= 16))
      have hfinal := (Nat.max_le).2 ⟨hcountFinal, hrowsFinal⟩
      cases hresult : (decodeRowsNM? count rest).value with
      | none => simp only [hcount, hresult]; exact hfinal
      | some pair =>
          rcases pair with ⟨rows, suffix⟩
          cases suffix with
          | nil => simp only [hcount, hresult]; exact hfinal
          | cons bit suffix => simp only [hcount, hresult]; exact hfinal

/-! ## Transition-trace bounds -/

def tapeMass : List Row -> Nat
  | [] => 0
  | row :: rows => row.tape.length + tapeMass rows

def traceBound (machine : Machine) (row : Row)
    (history : BitWord) (rows : List Row) : Nat :=
  (history.length + 1) * (machine.states.length + 13) +
    4 * (row.tape.length + tapeMass rows) + rowsMass rows

theorem one_le_traceBound (machine : Machine) (row : Row)
    (history : BitWord) (rows : List Row) :
    1 <= traceBound machine row history rows := by
  unfold traceBound
  have hfactor : 1 <= machine.states.length + 13 := by
    exact Nat.le_trans (by decide : 1 <= 13)
      (Nat.le_add_left 13 machine.states.length)
  have hcount : 1 <= history.length + 1 := one_le_succ _
  have hproduct : 1 <=
      (history.length + 1) * (machine.states.length + 13) := by
    have h := Nat.mul_le_mul hcount hfactor
    simpa only [Nat.one_mul] using h
  exact Nat.le_trans hproduct (by
    have h := Nat.le_add_right
      ((history.length + 1) * (machine.states.length + 13))
      (4 * (row.tape.length + tapeMass rows) + rowsMass rows)
    simpa only [Nat.add_assoc] using h)

theorem trace_step_chunk_le (machine : Machine) (row actual next : Row)
    (slot : Bool) :
    (stepM? machine row slot).ticks + (rowEqM actual next).ticks + 1 <=
      (machine.states.length + 13) + 4 * row.tape.length +
        rowMass next := by
  have hstep := stepM?_ticks_le machine row slot
  have heq := rowEqM_ticks_le_right actual next
  have hsum := add_le_add3 hstep heq (Nat.le_refl 1)
  exact Nat.le_trans hsum (by
    have hequality :
        (machine.states.length + 4 * row.tape.length + 12) +
            rowMass next + 1 =
          (machine.states.length + 13) + 4 * row.tape.length +
            rowMass next := by
      calc
        (machine.states.length + 4 * row.tape.length + 12) +
              rowMass next + 1 =
            machine.states.length + 4 * row.tape.length +
              (12 + 1) + rowMass next := by
                rw [Nat.add_assoc
                  (machine.states.length + 4 * row.tape.length + 12)
                  (rowMass next) 1,
                  Nat.add_comm (rowMass next) 1,
                  ← Nat.add_assoc
                    (machine.states.length + 4 * row.tape.length + 12)
                    1 (rowMass next),
                  Nat.add_assoc
                    (machine.states.length + 4 * row.tape.length) 12 1]
        _ = machine.states.length + 4 * row.tape.length +
              13 + rowMass next := rfl
        _ = (machine.states.length + 13) +
              4 * row.tape.length + rowMass next := by
                rw [Nat.add_assoc machine.states.length
                    (4 * row.tape.length) 13,
                  Nat.add_comm (4 * row.tape.length) 13,
                  ← Nat.add_assoc machine.states.length 13
                    (4 * row.tape.length)]
    rw [hequality]
    exact Nat.le_refl _)

theorem trace_bound_cons_identity (machine : Machine) (row next : Row)
    (slot : Bool) (history : BitWord) (rows : List Row) :
    (machine.states.length + 13 + 4 * row.tape.length + rowMass next) +
        traceBound machine next history rows =
      traceBound machine row (slot :: history) (next :: rows) := by
  simp only [traceBound, tapeMass, rowsMass, List.length_cons]
  rw [Nat.succ_mul]
  simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add]
  simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem checkTraceM_ticks_le_traceBound (machine : Machine) (row : Row)
    (history : BitWord) (rows : List Row) :
    (checkTraceM machine row history rows).ticks <=
      traceBound machine row history rows := by
  induction history generalizing row rows with
  | nil =>
      cases rows with
      | nil => exact one_le_traceBound machine row [] []
      | cons next rows => exact one_le_traceBound machine row [] (next :: rows)
  | cons slot history ih =>
      cases rows with
      | nil => exact one_le_traceBound machine row (slot :: history) []
      | cons next rows =>
          unfold checkTraceM
          cases hstep : (stepM? machine row slot).value with
          | none =>
              simp only [hstep]
              have hraw := Nat.add_le_add_right
                (stepM?_ticks_le machine row slot) 1
              have hchunk : (stepM? machine row slot).ticks + 1 <=
                  machine.states.length + 13 + 4 * row.tape.length := by
                exact Nat.le_trans hraw (by
                  have heq : machine.states.length +
                      4 * row.tape.length + 12 + 1 =
                      machine.states.length + 13 +
                        4 * row.tape.length := by
                    calc
                      machine.states.length + 4 * row.tape.length +
                            12 + 1 =
                          machine.states.length + 4 * row.tape.length +
                            (12 + 1) := by rw [Nat.add_assoc]
                      _ = machine.states.length + 4 * row.tape.length +
                            13 := rfl
                      _ = machine.states.length + 13 +
                            4 * row.tape.length := by
                              simp [Nat.add_assoc, Nat.add_comm,
                                Nat.add_left_comm]
                  rw [heq]
                  exact Nat.le_refl _)
              have hpad := Nat.le_add_right
                (machine.states.length + 13 + 4 * row.tape.length)
                (rowMass next)
              have hwithRow := Nat.le_trans hchunk hpad
              exact Nat.le_trans hwithRow (by
                have hid := trace_bound_cons_identity machine row next slot history rows
                rw [← hid]
                exact Nat.le_add_right _ _)
          | some actual =>
              cases hequal : (rowEqM actual next).value with
              | false =>
                  simp only [hstep, hequal, Bool.false_eq_true, ↓reduceIte]
                  have hchunk := trace_step_chunk_le machine row actual next slot
                  exact Nat.le_trans hchunk (by
                    have hid := trace_bound_cons_identity machine row next slot history rows
                    rw [← hid]
                    exact Nat.le_add_right _ _)
              | true =>
                  simp only [hstep, hequal, ↓reduceIte]
                  have hchunk := trace_step_chunk_le machine row actual next slot
                  have htail := ih next rows
                  have hsum := Nat.add_le_add hchunk htail
                  have hreorder :
                      (stepM? machine row slot).ticks +
                          (rowEqM actual next).ticks +
                          (checkTraceM machine next history rows).ticks + 1 =
                        ((stepM? machine row slot).ticks +
                          (rowEqM actual next).ticks + 1) +
                          (checkTraceM machine next history rows).ticks := by
                    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
                  rw [hreorder]
                  exact Nat.le_trans hsum (by
                    rw [trace_bound_cons_identity machine row next slot]
                    exact Nat.le_refl _)

theorem trace_step_peak_le_chunk (machine : Machine) (row next : Row)
    (slot : Bool) :
    (stepM? machine row slot).peak <=
      machine.states.length + 13 + 4 * row.tape.length + rowMass next := by
  have hraw := stepM?_peak_le machine row slot
  exact Nat.le_trans hraw (by
    have htape : row.tape.length <= 4 * row.tape.length := by
      have h := Nat.mul_le_mul_right row.tape.length (by decide : 1 <= 4)
      simpa only [Nat.one_mul] using h
    have htwo : 2 <= 13 + rowMass next :=
      Nat.le_trans (by decide : 2 <= 13) (Nat.le_add_right _ _)
    have hsum := add_le_add3 (Nat.le_refl machine.states.length) htape htwo
    simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hsum)

theorem trace_eq_peak_le_chunk (machine : Machine) (row actual next : Row) :
    (rowEqM actual next).peak <=
      machine.states.length + 13 + 4 * row.tape.length + rowMass next := by
  exact Nat.le_trans (rowEqM_peak_le_right actual next)
    (Nat.le_add_left _
      (machine.states.length + 13 + 4 * row.tape.length))

theorem one_le_trace_chunk (machine : Machine) (row next : Row) :
    1 <= machine.states.length + 13 + 4 * row.tape.length + rowMass next := by
  exact Nat.le_trans (by decide : 1 <= 13)
    (Nat.le_trans (Nat.le_add_left 13 machine.states.length)
      (Nat.le_trans (Nat.le_add_right _ (4 * row.tape.length))
        (Nat.le_add_right _ (rowMass next))))

theorem checkTraceM_peak_le_traceBound (machine : Machine) (row : Row)
    (history : BitWord) (rows : List Row) :
    (checkTraceM machine row history rows).peak <=
      traceBound machine row history rows := by
  induction history generalizing row rows with
  | nil =>
      cases rows with
      | nil => exact one_le_traceBound machine row [] []
      | cons next rows => exact one_le_traceBound machine row [] (next :: rows)
  | cons slot history ih =>
      cases rows with
      | nil => exact one_le_traceBound machine row (slot :: history) []
      | cons next rows =>
          unfold checkTraceM
          cases hstep : (stepM? machine row slot).value with
          | none =>
              simp only [hstep]
              exact Nat.le_trans (trace_step_peak_le_chunk machine row next slot)
                (by
                  have hid := trace_bound_cons_identity
                    machine row next slot history rows
                  rw [← hid]
                  exact Nat.le_add_right _ _)
          | some actual =>
              cases hequal : (rowEqM actual next).value with
              | false =>
                  simp only [hstep, hequal, Bool.false_eq_true, ↓reduceIte]
                  apply (Nat.max_le).2
                  constructor
                  · exact Nat.le_trans
                      (trace_step_peak_le_chunk machine row next slot) (by
                        have hid := trace_bound_cons_identity
                          machine row next slot history rows
                        rw [← hid]
                        exact Nat.le_add_right _ _)
                  · exact Nat.le_trans
                      (trace_eq_peak_le_chunk machine row actual next) (by
                        have hid := trace_bound_cons_identity
                          machine row next slot history rows
                        rw [← hid]
                        exact Nat.le_add_right _ _)
              | true =>
                  simp only [hstep, hequal, ↓reduceIte]
                  apply (Nat.max_le).2
                  constructor
                  · exact Nat.le_trans
                      (trace_step_peak_le_chunk machine row next slot) (by
                        have hid := trace_bound_cons_identity
                          machine row next slot history rows
                        rw [← hid]
                        exact Nat.le_add_right _ _)
                  · apply (Nat.max_le).2
                    constructor
                    · exact Nat.le_trans
                        (trace_eq_peak_le_chunk machine row actual next) (by
                          have hid := trace_bound_cons_identity
                            machine row next slot history rows
                          rw [← hid]
                          exact Nat.le_add_right _ _)
                    · have htail := ih next rows
                      have hplus := Nat.add_le_add_right htail 1
                      have hone := one_le_trace_chunk machine row next
                      have hgrow := Nat.add_le_add_left hone
                        (traceBound machine next history rows)
                      have hreorder : traceBound machine next history rows +
                            (machine.states.length + 13 +
                              4 * row.tape.length + rowMass next) =
                          (machine.states.length + 13 +
                              4 * row.tape.length + rowMass next) +
                            traceBound machine next history rows :=
                        Nat.add_comm _ _
                      exact Nat.le_trans hplus (Nat.le_trans hgrow (by
                        rw [hreorder,
                          trace_bound_cons_identity machine row next slot]
                        exact Nat.le_refl _))

/-! ## Initial-row and full row-verifier bounds -/

/--
The exact charge for checking a nonempty parsed tableau: build the literal
initial row, compare it with the supplied first row, and check every supplied
adjacent row.  This is a bound on `verifyRowsM` itself, not a phase allowance.
-/
def verifyRowsBound (source : Instance) (history : BitWord)
    (tailRows : List Row) : Nat :=
  source.input.length + 3 + rowMass (initialRow source) +
    traceBound source.machine (initialRow source) history tailRows + 1

theorem one_le_verifyRowsBound (source : Instance) (history : BitWord)
    (rows : List Row) :
    1 <= verifyRowsBound source history rows := by
  unfold verifyRowsBound
  exact Nat.le_trans (one_le_succ source.input.length)
    (Nat.le_trans (Nat.le_add_right _ 2)
      (Nat.le_trans (Nat.le_add_right _ (rowMass (initialRow source)))
        (Nat.le_trans
          (Nat.le_add_right _
            (traceBound source.machine (initialRow source) history rows))
          (Nat.le_succ _))))

theorem verifyRowsM_ticks_le_bound (source : Instance) (history : BitWord)
    (rows : List Row) :
    (verifyRowsM source history rows).ticks <=
      match rows with
      | [] => verifyRowsBound source history []
      | _ :: tailRows => verifyRowsBound source history tailRows := by
  cases rows with
  | nil => exact one_le_verifyRowsBound source history []
  | cons row rows =>
      unfold verifyRowsM
      cases hequal : (rowEqM row (initialRowM source).value).value with
      | false =>
          simp only [hequal, Bool.false_eq_true, ↓reduceIte]
          have hinitial : (initialRowM source).ticks <=
              source.input.length + 3 := by
            rw [initialRowM_ticks]
            exact Nat.le_refl _
          have heq :
              (rowEqM row (initialRowM source).value).ticks <=
                rowMass (initialRow source) := by
            rw [initialRowM_value]
            exact rowEqM_ticks_le_right _ _
          have hsum := add_le_add3 hinitial heq (Nat.le_refl 1)
          exact Nat.le_trans hsum (by
            unfold verifyRowsBound
            exact Nat.add_le_add_right
              (Nat.le_add_right
                (source.input.length + 3 + rowMass (initialRow source))
                (traceBound source.machine (initialRow source) history rows)) 1)
      | true =>
          simp only [hequal, ↓reduceIte]
          have hinitial : (initialRowM source).ticks <=
              source.input.length + 3 := by
            rw [initialRowM_ticks]
            exact Nat.le_refl _
          have heq :
              (rowEqM row (initialRowM source).value).ticks <=
                rowMass (initialRow source) := by
            rw [initialRowM_value]
            exact rowEqM_ticks_le_right _ _
          have hrow : row = initialRow source := by
            rw [initialRowM_value, rowEqM_value] at hequal
            simpa only [beq_iff_eq] using hequal
          have htrace :
              (checkTraceM source.machine row history rows).ticks <=
                traceBound source.machine (initialRow source) history rows := by
            rw [hrow]
            exact checkTraceM_ticks_le_traceBound _ _ _ _
          exact add_le_add4 hinitial heq htrace (Nat.le_refl 1)

theorem verifyRowsM_peak_le_bound (source : Instance) (history : BitWord)
    (rows : List Row) :
    (verifyRowsM source history rows).peak <=
      match rows with
      | [] => verifyRowsBound source history []
      | _ :: tailRows => verifyRowsBound source history tailRows := by
  cases rows with
  | nil => exact one_le_verifyRowsBound source history []
  | cons row rows =>
      unfold verifyRowsM
      cases hequal : (rowEqM row (initialRowM source).value).value with
      | false =>
          simp only [hequal, Bool.false_eq_true, ↓reduceIte]
          apply (Nat.max_le).2
          constructor
          · rw [initialRowM_peak]
            unfold verifyRowsBound
            exact Nat.le_trans (Nat.le_add_right _ 1)
              (Nat.le_trans
                (Nat.le_add_right _ (rowMass (initialRow source)))
                (Nat.le_trans
                  (Nat.le_add_right _
                    (traceBound source.machine (initialRow source) history rows))
                  (Nat.le_succ _)))
          · rw [initialRowM_value]
            exact Nat.le_trans (rowEqM_peak_le_right _ _) (by
              unfold verifyRowsBound
              exact Nat.le_trans
                (Nat.le_add_left _ (source.input.length + 3))
                (Nat.le_trans
                  (Nat.le_add_right _
                    (traceBound source.machine (initialRow source) history rows))
                  (Nat.le_succ _)))
      | true =>
          simp only [hequal, ↓reduceIte]
          have hrow : row = initialRow source := by
            rw [initialRowM_value, rowEqM_value] at hequal
            simpa only [beq_iff_eq] using hequal
          apply (Nat.max_le).2
          constructor
          · rw [initialRowM_peak]
            unfold verifyRowsBound
            exact Nat.le_trans (Nat.le_add_right _ 1)
              (Nat.le_trans
                (Nat.le_add_right _ (rowMass (initialRow source)))
                (Nat.le_trans
                  (Nat.le_add_right _
                    (traceBound source.machine (initialRow source) history rows))
                  (Nat.le_succ _)))
          · apply (Nat.max_le).2
            constructor
            · rw [initialRowM_value]
              exact Nat.le_trans (rowEqM_peak_le_right _ _) (by
                unfold verifyRowsBound
                exact Nat.le_trans
                  (Nat.le_add_left _ (source.input.length + 3))
                  (Nat.le_trans
                    (Nat.le_add_right _
                      (traceBound source.machine (initialRow source) history rows))
                    (Nat.le_succ _)))
            · rw [hrow]
              exact Nat.le_trans
                (checkTraceM_peak_le_traceBound _ _ _ _) (by
                  unfold verifyRowsBound
                  exact Nat.le_trans
                    (Nat.le_add_left _
                      (source.input.length + 3 +
                        rowMass (initialRow source)))
                    (Nat.le_succ _))

/-! ## Input-only resource bounds for the complete local verifier -/

theorem tapeMass_le_rowsMass (rows : List Row) :
    tapeMass rows <= rowsMass rows := by
  induction rows with
  | nil => exact Nat.le_refl 0
  | cons row rows ih =>
      change row.tape.length + tapeMass rows <= rowMass row + rowsMass rows
      exact Nat.add_le_add (by
        unfold rowMass
        exact Nat.le_trans
          (Nat.le_add_left row.tape.length (row.state + row.head))
          (Nat.le_add_right _ 3)) ih

theorem tailRowsMass_le_payload {payload : BitWord} {row : Row}
    {rows : List Row} (hdecode : decodeTableau? payload = some (row :: rows)) :
    rowsMass rows <= payload.length := by
  rw [decodeTableau?_reconstruct hdecode]
  exact Nat.le_trans (Nat.le_add_left (rowsMass rows) (rowMass row))
    (rowsMass_le_encodeTableau_length (row :: rows))

/-- Input-only upper bound for every actual adjacent-row operation. -/
def localTraceBound (source : Instance) (history payload : BitWord) : Nat :=
  (history.length + 1) * (source.machine.states.length + 13) +
    4 * (source.input.length + 2 + payload.length) + payload.length

theorem traceBound_le_localTraceBound (source : Instance)
    (history payload : BitWord) (rows : List Row)
    (hmass : rowsMass rows <= payload.length) :
    traceBound source.machine (initialRow source) history rows <=
      localTraceBound source history payload := by
  unfold traceBound localTraceBound
  have htape : tapeMass rows <= payload.length :=
    Nat.le_trans (tapeMass_le_rowsMass rows) hmass
  have hwindow : (initialRow source).tape.length + tapeMass rows <=
      source.input.length + 2 + payload.length := by
    rw [initialRow_tape_length]
    exact Nat.add_le_add_left htape (source.input.length + 2)
  exact add_le_add3 (Nat.le_refl _)
    (Nat.mul_le_mul_left 4 hwindow) hmass

/--
An explicit polynomial in the literal source/history/payload lengths that
bounds the actual counted local verifier.  Its summands charge respectively
the parser, canonical re-encoder, literal equality, initial-row/trace check,
and the final control branch.
-/
def localVerifierTimeBound (source : Instance) (history payload : BitWord) : Nat :=
  16 * (payload.length + 1) ^ 2 +
    64 * (payload.length + 1) +
    (payload.length + 1) +
    (source.input.length + 3 + rowMass (initialRow source) +
      localTraceBound source history payload + 1) + 1

/-- Peak live auxiliary data is bounded by the same explicit quadratic. -/
def localVerifierSpaceBound (source : Instance) (history payload : BitWord) : Nat :=
  localVerifierTimeBound source history payload

theorem verifyRowsBound_le_input (source : Instance) (history payload : BitWord)
    (rows : List Row) (hmass : rowsMass rows <= payload.length) :
    verifyRowsBound source history rows <=
      source.input.length + 3 + rowMass (initialRow source) +
        localTraceBound source history payload + 1 := by
  unfold verifyRowsBound
  exact add_le_add4 (Nat.le_refl _) (Nat.le_refl _)
    (traceBound_le_localTraceBound source history payload rows hmass)
    (Nat.le_refl 1)

theorem runLocalVerifier_ticks_le (source : Instance)
    (history payload : BitWord) :
    (runLocalVerifier source history payload).ticks <=
      localVerifierTimeBound source history payload := by
  unfold runLocalVerifier
  cases hparsed : (decodeTableauM? payload).value with
  | none =>
      simp only [hparsed]
      have hparse := decodeTableauM?_ticks_le_quadratic payload
      have hstep := Nat.add_le_add_right hparse 1
      exact Nat.le_trans hstep (by
        unfold localVerifierTimeBound
        calc
          16 * (payload.length + 1) ^ 2 + 1 <=
              (16 * (payload.length + 1) ^ 2 +
                (64 * (payload.length + 1) + (payload.length + 1) +
                  (source.input.length + 3 + rowMass (initialRow source) +
                    localTraceBound source history payload + 1))) + 1 :=
            Nat.add_le_add_right (Nat.le_add_right _ _) 1
          _ = _ := by
            simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm])
  | some rows =>
      have hsemantic : decodeTableau? payload = some rows := by
        rw [← decodeTableauM?_value]
        exact hparsed
      have hreconstruct := decodeTableau?_reconstruct hsemantic
      have hequal :
          (bitsEqM payload (encodeTableauM rows).value).value = true := by
        rw [bitsEqM_value, encodeTableauM_value, ← hreconstruct]
        exact beq_self_eq_true payload
      simp only [hparsed, hequal, ↓reduceIte]
      have hparse := decodeTableauM?_ticks_le_quadratic payload
      have hencodeRaw := encodeTableauM_ticks_le_linear rows
      have hencode : (encodeTableauM rows).ticks <=
          64 * (payload.length + 1) := by
        rw [hreconstruct]
        exact hencodeRaw
      have heqRaw := bitsEqM_ticks_le_right payload (encodeTableauM rows).value
      have heq : (bitsEqM payload (encodeTableauM rows).value).ticks <=
          payload.length + 1 := by
        have hvalue : (encodeTableauM rows).value = payload := by
          rw [encodeTableauM_value]
          exact hreconstruct.symm
        simpa only [hvalue] using heqRaw
      have hchecked : (verifyRowsM source history rows).ticks <=
          source.input.length + 3 + rowMass (initialRow source) +
            localTraceBound source history payload + 1 := by
        cases rows with
        | nil =>
            exact Nat.le_trans
              (verifyRowsM_ticks_le_bound source history [])
              (verifyRowsBound_le_input source history payload []
                (Nat.zero_le _))
        | cons row rows =>
            exact Nat.le_trans
              (verifyRowsM_ticks_le_bound source history (row :: rows))
              (verifyRowsBound_le_input source history payload rows
                (tailRowsMass_le_payload hsemantic))
      have hsum := Nat.add_le_add
        (Nat.add_le_add (Nat.add_le_add hparse hencode) heq) hchecked
      exact Nat.add_le_add_right hsum 1

theorem runLocalVerifier_peak_le (source : Instance)
    (history payload : BitWord) :
    (runLocalVerifier source history payload).peak <=
      localVerifierSpaceBound source history payload := by
  unfold runLocalVerifier
  cases hparsed : (decodeTableauM? payload).value with
  | none =>
      simp only [hparsed]
      exact Nat.le_trans (decodeTableauM?_peak_le_quadratic payload) (by
        unfold localVerifierSpaceBound localVerifierTimeBound
        calc
          16 * (payload.length + 1) ^ 2 <=
              16 * (payload.length + 1) ^ 2 +
                (64 * (payload.length + 1) + (payload.length + 1) +
                  (source.input.length + 3 + rowMass (initialRow source) +
                    localTraceBound source history payload + 1)) :=
            Nat.le_add_right _ _
          _ <= (16 * (payload.length + 1) ^ 2 +
                (64 * (payload.length + 1) + (payload.length + 1) +
                  (source.input.length + 3 + rowMass (initialRow source) +
                    localTraceBound source history payload + 1))) + 1 :=
            Nat.le_succ _
          _ = _ := by
            simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm])
  | some rows =>
      have hsemantic : decodeTableau? payload = some rows := by
        rw [← decodeTableauM?_value]
        exact hparsed
      have hreconstruct := decodeTableau?_reconstruct hsemantic
      have hequal :
          (bitsEqM payload (encodeTableauM rows).value).value = true := by
        rw [bitsEqM_value, encodeTableauM_value, ← hreconstruct]
        exact beq_self_eq_true payload
      simp only [hparsed, hequal, ↓reduceIte]
      have hparse : (decodeTableauM? payload).peak <=
          localVerifierSpaceBound source history payload :=
        Nat.le_trans (decodeTableauM?_peak_le_quadratic payload) (by
          unfold localVerifierSpaceBound localVerifierTimeBound
          calc
            16 * (payload.length + 1) ^ 2 <=
                16 * (payload.length + 1) ^ 2 +
                  (64 * (payload.length + 1) + (payload.length + 1) +
                    (source.input.length + 3 + rowMass (initialRow source) +
                      localTraceBound source history payload + 1)) :=
              Nat.le_add_right _ _
            _ <= (16 * (payload.length + 1) ^ 2 +
                  (64 * (payload.length + 1) + (payload.length + 1) +
                    (source.input.length + 3 + rowMass (initialRow source) +
                      localTraceBound source history payload + 1))) + 1 :=
              Nat.le_succ _
            _ = _ := by
              simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm])
      have hencode : (encodeTableauM rows).peak <=
          localVerifierSpaceBound source history payload := by
        have hraw := encodeTableauM_peak_le_linear rows
        rw [← hreconstruct] at hraw
        exact Nat.le_trans hraw (by
          unfold localVerifierSpaceBound localVerifierTimeBound
          calc
            64 * (payload.length + 1) <=
                16 * (payload.length + 1) ^ 2 +
                  64 * (payload.length + 1) := Nat.le_add_left _ _
            _ <= (16 * (payload.length + 1) ^ 2 +
                  64 * (payload.length + 1)) +
                ((payload.length + 1) +
                  (source.input.length + 3 + rowMass (initialRow source) +
                    localTraceBound source history payload + 1) + 1) :=
              Nat.le_add_right _ _
            _ = _ := by
              simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm])
      have heq : (bitsEqM payload (encodeTableauM rows).value).peak <=
          localVerifierSpaceBound source history payload := by
        have hraw := bitsEqM_peak_le_right payload (encodeTableauM rows).value
        have hvalue : (encodeTableauM rows).value = payload := by
          rw [encodeTableauM_value]
          exact hreconstruct.symm
        have hraw' : (bitsEqM payload (encodeTableauM rows).value).peak <=
            payload.length + 1 := by
          simpa only [hvalue] using hraw
        exact Nat.le_trans hraw' (by
          unfold localVerifierSpaceBound localVerifierTimeBound
          exact Nat.le_trans
            (Nat.le_add_left _
              (16 * (payload.length + 1) ^ 2 + 64 * (payload.length + 1)))
            (Nat.le_add_right _
              ((source.input.length + 3 + rowMass (initialRow source) +
                localTraceBound source history payload + 1) + 1)))
      have hchecked : (verifyRowsM source history rows).peak <=
          localVerifierSpaceBound source history payload := by
        have hbase : (verifyRowsM source history rows).peak <=
            source.input.length + 3 + rowMass (initialRow source) +
              localTraceBound source history payload + 1 := by
          cases rows with
          | nil =>
              exact Nat.le_trans
                (verifyRowsM_peak_le_bound source history [])
                (verifyRowsBound_le_input source history payload []
                  (Nat.zero_le _))
          | cons row rows =>
              exact Nat.le_trans
                (verifyRowsM_peak_le_bound source history (row :: rows))
                (verifyRowsBound_le_input source history payload rows
                  (tailRowsMass_le_payload hsemantic))
        exact Nat.le_trans hbase (by
          unfold localVerifierSpaceBound localVerifierTimeBound
          exact Nat.le_trans
            (Nat.le_add_left _
              (16 * (payload.length + 1) ^ 2 +
                64 * (payload.length + 1) + (payload.length + 1)))
            (Nat.le_succ _))
      exact (Nat.max_le).2
        ⟨hparse, (Nat.max_le).2 ⟨hencode, (Nat.max_le).2 ⟨heq, hchecked⟩⟩⟩

/-- One stable package carrying value agreement and both actual resource bounds. -/
structure LocalVerifierResourceCertificate (source : Instance)
    (history payload : BitWord) : Prop where
  value_eq : (runLocalVerifier source history payload).value =
    verify source history payload
  ticks_le : (runLocalVerifier source history payload).ticks <=
    localVerifierTimeBound source history payload
  peak_le : (runLocalVerifier source history payload).peak <=
    localVerifierSpaceBound source history payload

theorem runLocalVerifier_resourceCertificate (source : Instance)
    (history payload : BitWord) :
    LocalVerifierResourceCertificate source history payload :=
  ⟨runLocalVerifier_value source history payload,
    runLocalVerifier_ticks_le source history payload,
    runLocalVerifier_peak_le source history payload⟩

end PureSFormal.Research.ProtectedTrieTableauExactResource
