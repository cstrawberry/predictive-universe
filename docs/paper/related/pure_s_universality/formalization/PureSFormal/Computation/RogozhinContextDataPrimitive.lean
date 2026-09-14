import PureSFormal.Computation.RogozhinContextWeightPrimitive

/-!
# Primitive literal data-region validation

This reader counts literal unary widths, recovers labels from immutable seed
frames, reconstructs their data code, and compares every required cell. It
agrees with `Context.decodeData?` on all symbol lists, including malformed ones.

For context mass S and N input cells, `decode_operations_le` proves the bound
`6*N + (N+1)*(85*(S+1)^2 + 40*S + 137) + 18`. Accepted outputs contain at most
N+1 labels. These are primitive operation counts; the surrounding program-region
check and complete source-output observer are outside this module's scope.
-/

namespace PureSFormal.Computation.RogozhinContextDataPrimitive

open PureS.ParserPrimitiveMachine RogozhinFramePrimitiveSize
open RogozhinContextWeightPrimitive (weight weight_value weight_operations_le weight_value_le
  label label_value label_operations_le_quadratic)
open CookWordConstructionMachine (replicateOnto replicateOnto_value replicateOnto_operations)
open Rogozhin46 (Symbol)

def widths (width : Nat) : List Symbol → Result (List Nat)
  | [] => ⟨[width], 3⟩
  | .s0 :: rest =>
      let found := widths (Nat.succ width) rest
      ⟨found.value, found.operations + 6⟩
  | .s5 :: rest =>
      let found := widths 0 rest
      ⟨width :: found.value, found.operations + 6⟩
  | _ :: _ => ⟨[], 6⟩

theorem widths_value (width : Nat) (cells : List Symbol) :
    (widths width cells).value = RogozhinT2BoundaryReadback.readWidthsAux width cells := by
  induction cells generalizing width with
  | nil => rfl
  | cons head rest ih => cases head <;> simp only [widths,
      RogozhinT2BoundaryReadback.readWidthsAux, ih, Nat.succ_eq_add_one]

theorem widths_operations_le (width : Nat) (cells : List Symbol) :
    (widths width cells).operations ≤ 6 * cells.length + 3 := by
  induction cells generalizing width with
  | nil => exact Nat.le_refl _
  | cons head rest ih =>
      have bound := Nat.add_le_add_right (ih (Nat.succ width)) 6
      have reset := Nat.add_le_add_right (ih 0) 6
      have bad : 6 ≤ 6 * (rest.length + 1) + 3 := by
        exact Nat.le_trans (Nat.mul_le_mul_left 6 (Nat.succ_le_succ (Nat.zero_le _)))
          (Nat.le_add_right _ _)
      cases head with
      | s0 => simpa only [widths, List.length_cons, Nat.mul_add, Nat.mul_one,
          Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound
      | s5 => simpa only [widths, List.length_cons, Nat.mul_add, Nat.mul_one,
          Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using reset
      | s1 | s2 | s3 | s4 => exact bad

theorem widths_length_le (width : Nat) (cells : List Symbol) :
    (widths width cells).value.length ≤ cells.length + 1 := by
  induction cells generalizing width with
  | nil => exact Nat.le_refl _
  | cons head rest ih =>
      cases head with
      | s0 => exact Nat.le_trans (ih _) (Nat.le_succ _)
      | s5 => exact Nat.succ_le_succ (ih 0)
      | s1 | s2 | s3 | s4 => exact Nat.zero_le _

def labels (context : CookSeedReadbackContext.Context) : List Nat → Result (List Nat)
  | [] => ⟨[], 2⟩
  | width :: rest =>
      let following := labels context rest
      let first := label context width
      ⟨first.value :: following.value, first.operations + following.operations + 4⟩

theorem labels_value (context : CookSeedReadbackContext.Context) (widths : List Nat) :
    (labels context widths).value =
      widths.map (context.labelForWeight (context.symbolCount + 1)) := by
  induction widths with
  | nil => rfl
  | cons first rest ih =>
      change (label context first).value :: (labels context rest).value = _
      rw [label_value, ih]
      rfl

theorem labels_length (context : CookSeedReadbackContext.Context) (widths : List Nat) :
    (labels context widths).value.length = widths.length := by
  induction widths with
  | nil => rfl
  | cons first rest ih => exact congrArg Nat.succ ih

theorem labels_operations_le (context : CookSeedReadbackContext.Context) (widths : List Nat) :
    (labels context widths).operations ≤
      widths.length * (85 * (contextSize context.frames + 1) ^ 2 + 4) + 2 := by
  induction widths with
  | nil => simp only [labels, List.length_nil, Nat.zero_mul, Nat.zero_add, Nat.le_refl]
  | cons first rest ih =>
      have bound := Nat.add_le_add_right
        (Nat.add_le_add (label_operations_le_quadratic context first) ih) 4
      simpa only [labels, List.length_cons, Nat.add_mul, Nat.one_mul,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def dataTail (context : CookSeedReadbackContext.Context) : List Nat → Result (List Symbol)
  | [] => ⟨[], 2⟩
  | first :: rest =>
      let following := dataTail context rest
      let count := weight context first
      let cells := replicateOnto Symbol.s0 count.value following.value
      ⟨.s5 :: cells.value, following.operations + count.operations + cells.operations + 4⟩

theorem dataTail_value (context : CookSeedReadbackContext.Context) (word : List Nat) :
    (dataTail context word).value = context.dataTail word := by
  induction word with
  | nil => rfl
  | cons first rest ih =>
      simp only [dataTail, replicateOnto_value, weight_value, ih,
        CookSeedReadbackContext.Context.dataTail, RogozhinTagInput.ones]

theorem dataTail_operations_le (context : CookSeedReadbackContext.Context) (word : List Nat) :
    (dataTail context word).operations ≤ word.length * (29 * contextSize context.frames + 78) + 2 := by
  induction word with
  | nil => simp only [dataTail, List.length_nil, Nat.zero_mul, Nat.zero_add, Nat.le_refl]
  | cons first rest ih =>
      have countBound := weight_operations_le context first
      have copied : (replicateOnto Symbol.s0 (weight context first).value
          (dataTail context rest).value).operations ≤ 4 * (contextSize context.frames + 4) + 1 := by
        rw [replicateOnto_operations]
        exact Nat.add_le_add_right (Nat.mul_le_mul_left 4 (weight_value_le context first)) 1
      have bound := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add ih countBound) copied) 4
      simpa only [dataTail, List.length_cons, Nat.add_mul, Nat.one_mul, Nat.mul_add,
        show 29 = 25 + 4 by rfl, show 78 = 57 + (4 * 4 + 1) + 4 by rfl,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem dataTail_length_le (context : CookSeedReadbackContext.Context) (word : List Nat) :
    (dataTail context word).value.length ≤ word.length * (contextSize context.frames + 5) := by
  induction word with
  | nil => simp only [dataTail, List.length_nil, Nat.zero_mul, Nat.le_refl]
  | cons first rest ih =>
      have bound := Nat.succ_le_succ (Nat.add_le_add (weight_value_le context first) ih)
      simpa only [dataTail, replicateOnto_value, List.length_cons, List.length_append,
        List.length_replicate, Nat.add_mul, Nat.one_mul, Nat.succ_eq_add_one, show 5 = 4 + 1 by rfl,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def dataCode (context : CookSeedReadbackContext.Context) : List Nat → Result (List Symbol)
  | [] => ⟨[], 2⟩
  | first :: rest =>
      let following := dataTail context rest
      let count := weight context first
      let cells := replicateOnto Symbol.s0 count.value following.value
      ⟨cells.value, following.operations + count.operations + cells.operations + 4⟩

theorem dataCode_value (context : CookSeedReadbackContext.Context) (word : List Nat) :
    (dataCode context word).value = context.dataCode word := by
  cases word with
  | nil => rfl
  | cons first rest =>
      simp only [dataCode, replicateOnto_value, weight_value, dataTail_value,
        CookSeedReadbackContext.Context.dataCode, RogozhinTagInput.ones]

theorem dataCode_operations_le (context : CookSeedReadbackContext.Context) (word : List Nat) :
    (dataCode context word).operations ≤ word.length * (29 * contextSize context.frames + 78) + 2 := by
  cases word with
  | nil => simp only [dataCode, List.length_nil, Nat.zero_mul, Nat.zero_add, Nat.le_refl]
  | cons first rest => exact dataTail_operations_le context (first :: rest)

theorem dataCode_length_le (context : CookSeedReadbackContext.Context) (word : List Nat) :
    (dataCode context word).value.length ≤ word.length * (contextSize context.frames + 5) := by
  cases word with
  | nil => simp only [dataCode, List.length_nil, Nat.zero_mul, Nat.le_refl]
  | cons first rest => exact Nat.le_trans (Nat.le_succ _) (dataTail_length_le context (first :: rest))

/-- Two symbol-constructor observations and the equality branch. -/
def symbolEqual : Symbol → Symbol → Result Bool
  | .s0, .s0 | .s1, .s1 | .s2, .s2 | .s3, .s3 | .s4, .s4 | .s5, .s5 => ⟨true, 3⟩
  | _, _ => ⟨false, 3⟩

theorem symbolEqual_value (left right : Symbol) :
    (symbolEqual left right).value = true ↔ left = right := by
  cases left <;> cases right <;> decide

theorem symbolEqual_operations (left right : Symbol) : (symbolEqual left right).operations = 3 := by
  cases left <;> cases right <;> rfl

/-- A cons pair reads two tags and four fields; constructor dispatch and the
symbol-result test take one branch each, giving eight surrounding operations. -/
def equalCells : List Symbol → List Symbol → Result Bool
  | [], [] => ⟨true, 3⟩
  | [], _ :: _ | _ :: _, [] => ⟨false, 3⟩
  | left :: lefts, right :: rights =>
      let same := symbolEqual left right
      let following := if same.value then equalCells lefts rights else ⟨false, 2⟩
      ⟨following.value, same.operations + following.operations + 8⟩

theorem equalCells_value (left right : List Symbol) :
    (equalCells left right).value = true ↔ left = right := by
  induction left generalizing right with
  | nil =>
      cases right with
      | nil => exact ⟨fun _ => rfl, fun _ => rfl⟩
      | cons right rights => constructor <;> intro impossible <;> cases impossible
  | cons left lefts ih =>
      cases right with
      | nil => constructor <;> intro impossible <;> cases impossible
      | cons right rights =>
          dsimp only [equalCells]
          cases same : (symbolEqual left right).value with
          | false =>
              simp only [Bool.false_eq_true, ↓reduceIte]
              constructor
              · intro impossible; cases impossible
              · intro eq
                have headEq := (List.cons.inj eq).1
                have yes := (symbolEqual_value left right).mpr headEq
                rw [same] at yes
                cases yes
          | true =>
              simp only [↓reduceIte]
              have headEq := (symbolEqual_value left right).mp same
              constructor
              · intro tailEq
                rw [headEq, (ih rights).mp tailEq]
              · intro eq
                exact (ih rights).mpr (List.cons.inj eq).2

theorem equalCells_operations_le (left right : List Symbol) :
    (equalCells left right).operations ≤ 11 * left.length + 3 := by
  induction left generalizing right with
  | nil => cases right <;> exact Nat.le_refl _
  | cons left lefts ih =>
      cases right with
      | nil => exact Nat.le_add_left _ _
      | cons right rights =>
          dsimp only [equalCells]
          rw [symbolEqual_operations]
          split
          · have bound := Nat.add_le_add_right (Nat.add_le_add_left (ih rights) 3) 8
            simpa only [List.length_cons, Nat.mul_add, Nat.mul_one,
              show 11 = 3 + 8 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound
          · have bound := Nat.le_trans (by decide : 13 ≤ 14) (Nat.le_add_left 14 (11 * lefts.length))
            simpa only [List.length_cons, Nat.mul_add, Nat.mul_one,
              show 14 = 11 + 3 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def decodeNonempty (context : CookSeedReadbackContext.Context) (cells : List Symbol) :
    Result (Option (List Nat)) :=
  let measured := widths 0 cells
  let candidate := labels context measured.value
  let printed := dataCode context candidate.value
  let same := equalCells printed.value cells
  ⟨if same.value then some candidate.value else none,
    measured.operations + candidate.operations + printed.operations + same.operations + 6⟩

theorem decodeNonempty_value (context : CookSeedReadbackContext.Context) (cells : List Symbol) :
    (decodeNonempty context cells).value =
      let candidate := (RogozhinT2BoundaryReadback.readWidthsAux 0 cells).map
        (context.labelForWeight (context.symbolCount + 1))
      if context.dataCode candidate = cells then some candidate else none := by
  dsimp only [decodeNonempty]
  rw [widths_value, labels_value, dataCode_value]
  cases same : (equalCells
      (context.dataCode ((RogozhinT2BoundaryReadback.readWidthsAux 0 cells).map
        (context.labelForWeight (context.symbolCount + 1)))) cells).value with
  | true =>
      have eq := (equalCells_value _ _).mp same
      exact (if_pos eq).symm
  | false =>
      have different : context.dataCode ((RogozhinT2BoundaryReadback.readWidthsAux 0 cells).map
          (context.labelForWeight (context.symbolCount + 1))) ≠ cells := by
        intro eq
        have yes := (equalCells_value _ _).mpr eq
        rw [same] at yes
        cases yes
      exact (if_neg different).symm

def decode (context : CookSeedReadbackContext.Context) : List Symbol → Result (Option (List Nat))
  | [] => ⟨some [], 2⟩
  | first :: rest =>
      let found := decodeNonempty context (first :: rest)
      ⟨found.value, found.operations + 2⟩

theorem decode_value (context : CookSeedReadbackContext.Context) (cells : List Symbol) :
    (decode context cells).value = context.decodeData? cells := by
  cases cells with
  | nil => rfl
  | cons first rest =>
      rw [CookSeedReadbackContext.Context.decodeData?, if_neg (List.cons_ne_nil first rest)]
      exact decodeNonempty_value context (first :: rest)

def dataBudget (size cells : Nat) : Nat :=
  6 * cells + (cells + 1) * (85 * (size + 1) ^ 2 + 40 * size + 137) + 18

theorem dataBudget_sum_eq (size cells : Nat) :
    (6 * cells + 3) + ((cells + 1) * (85 * (size + 1) ^ 2 + 4) + 2) +
      ((cells + 1) * (29 * size + 78) + 2) +
      (11 * ((cells + 1) * (size + 5)) + 3) + 6 + 2 = dataBudget size cells := by
  simp only [dataBudget, show 40 = 29 + 11 by rfl, show 137 = 4 + 78 + 11 * 5 by rfl,
    show 18 = 3 + 2 + 2 + 3 + 6 + 2 by rfl, Nat.add_mul, Nat.mul_add,
    Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem decodeNonempty_operations_le (context : CookSeedReadbackContext.Context) (cells : List Symbol) :
    (decodeNonempty context cells).operations + 2 ≤ dataBudget (contextSize context.frames) cells.length := by
  have candidateLength : (labels context (widths 0 cells).value).value.length ≤ cells.length + 1 := by
    rw [labels_length]
    exact widths_length_le 0 cells
  have candidateBound := Nat.le_trans (labels_operations_le context (widths 0 cells).value)
    (Nat.add_le_add_right (Nat.mul_le_mul_right _ (widths_length_le 0 cells)) 2)
  have printedBound := Nat.le_trans
    (dataCode_operations_le context (labels context (widths 0 cells).value).value)
    (Nat.add_le_add_right (Nat.mul_le_mul_right _ candidateLength) 2)
  have printedLength := Nat.le_trans
    (dataCode_length_le context (labels context (widths 0 cells).value).value)
    (Nat.mul_le_mul_right _ candidateLength)
  have sameBound := Nat.le_trans
    (equalCells_operations_le (dataCode context (labels context (widths 0 cells).value).value).value cells)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 11 printedLength) 3)
  have bound := Nat.add_le_add_right (Nat.add_le_add_right
    (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add (widths_operations_le 0 cells)
      candidateBound) printedBound) sameBound) 6) 2
  rw [dataBudget_sum_eq] at bound
  exact bound

theorem decode_operations_le (context : CookSeedReadbackContext.Context) (cells : List Symbol) :
    (decode context cells).operations ≤ dataBudget (contextSize context.frames) cells.length := by
  cases cells with
  | nil =>
      exact Nat.le_trans (by decide : 2 ≤ 18) (Nat.le_add_left _ _)
  | cons first rest => exact decodeNonempty_operations_le context (first :: rest)

theorem decode_length_le (context : CookSeedReadbackContext.Context) (cells : List Symbol)
    (word : List Nat) (accepted : (decode context cells).value = some word) :
    word.length ≤ cells.length + 1 := by
  cases cells with
  | nil => cases accepted; exact Nat.zero_le _
  | cons first rest =>
      change (decodeNonempty context (first :: rest)).value = some word at accepted
      unfold decodeNonempty at accepted
      dsimp only at accepted
      split at accepted
      · cases accepted
        rw [labels_length]
        exact widths_length_le 0 (first :: rest)
      · cases accepted

end PureSFormal.Computation.RogozhinContextDataPrimitive
