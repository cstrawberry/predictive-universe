import PureSFormal.Computation.DeterministicTapeOutputPrimitive

/-!
# Explicit quartic bound for every bare-term source-output observer

The polynomial syntax below is proof support, never observer runtime data.
Its evaluation is definitionally the composed operation budget. Structural
majorization supplies a compact quartic bound without an assumed scan meter.
-/

namespace PureSFormal.Computation.DeterministicTapeOutputQuartic

set_option maxRecDepth 8192

inductive Polynomial where
  | constant : Nat → Polynomial
  | input : Polynomial
  | add : Polynomial → Polynomial → Polynomial
  | mul : Polynomial → Polynomial → Polynomial

namespace Polynomial

def eval (input : Nat) : Polynomial → Nat
  | .constant value => value
  | .input => input
  | .add first second => eval input first + eval input second
  | .mul first second => eval input first * eval input second

def degree : Polynomial → Nat
  | .constant _ => 0
  | .input => 1
  | .add first second => max (degree first) (degree second)
  | .mul first second => degree first + degree second

theorem majorant (expression : Polynomial) (input : Nat) :
    eval input expression ≤ eval 1 expression * (input + 1) ^ degree expression := by
  induction expression with
  | constant value => simp only [eval, degree, Nat.pow_zero, Nat.mul_one, Nat.le_refl]
  | input => simpa only [eval, degree, Nat.pow_one, Nat.one_mul] using Nat.le_succ input
  | add first second ihFirst ihSecond =>
      have left := Nat.le_trans ihFirst (Nat.mul_le_mul_left (eval 1 first)
        (Nat.pow_le_pow_right (Nat.succ_pos input) (Nat.le_max_left (degree first) (degree second))))
      have right := Nat.le_trans ihSecond (Nat.mul_le_mul_left (eval 1 second)
        (Nat.pow_le_pow_right (Nat.succ_pos input) (Nat.le_max_right (degree first) (degree second))))
      simpa only [eval, degree, Nat.add_mul] using Nat.add_le_add left right
  | mul first second ihFirst ihSecond =>
      simpa only [eval, degree, Nat.pow_add, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
        using Nat.mul_le_mul ihFirst ihSecond

instance (number : Nat) : OfNat Polynomial number where ofNat := .constant number
instance : Add Polynomial where add := .add
instance : Mul Polynomial where mul := .mul

end Polynomial

def seedCost : Polynomial :=
  let n : Polynomial := .input
  let cells := n + 2
  let mass := n * cells
  let symbol := (4 * (30 * n + 2) + 2) +
    (((180 * (3 * n) + 20) + 3) * 10 + (87 * (3 * n) + 5) + 1) + 3
  let counter := (19 * mass + 12) + 5 + (cells * (4 * (3 * mass + 2) + 18) + 2) +
    (22 * cells + 3) + ((cells + 1) * (22 * cells + 18)) + 10
  let reencode := 10 * n + 3 * (30 * (cells + 1) + 19 * mass + 22) + 29
  let live := (5 * n + 3) + ((3 * counter + 6) + reencode + (4 * mass + 18 * cells + 3) + 6) + 8
  let numeric := (164 * n + 16) + (cells * (symbol + 5) + 2) + live + 6
  let codec := (84 * n + 34) + (4 * n + 1) + numeric + 4
  let data := 6 * (n + 1) + ((n + 1) + 1) *
    (85 * ((n + 1) * (n + 1)) + 40 * n + 137) + 18
  let boundary := 44 * n + 4 * n + data + 76
  let tag := 6144 * ((n + 1) * (n + 1)) + 2 + boundary
  let ordinary := tag + 2 + (4 * n + 12 + (36 * n + 104) * ((n + 2) + 1))
  let pass := ordinary + 2 + codec
  let cap := n * (n + 2) + (n + 3)
  let terminal := 640 * ((cap + 1) * (cap + 1)) +
    (85 * ((n + 1) * (n + 1)) + 232 * n + 515 * cap + 5 * (cap + cap) + 172) + 5
  let scanned := terminal + 10 * cap + 9
  5124 * ((n + 1) * (n + 1)) + 2 + (pass + 2 + scanned)

theorem seedCost_value (input : Nat) : seedCost.eval input =
    CookSeedOutputPrimitive.seedBudget CookSeedOutputPrimitive.scannedBudget input input := by
  simp only [seedCost, Polynomial.eval, HAdd.hAdd, Add.add, HMul.hMul, Mul.mul, OfNat.ofNat,
    CookSeedOutputPrimitive.seedBudget, CookSeedOutputPrimitive.scannedBudget,
    CookSeedOutputPrimitive.passCounterBudget, CookSeedOutputPrimitive.fieldCap,
    CookSeedOrdinaryPrimitive.passOrdinaryBudget, CookSeedOrdinaryPrimitive.ordinaryBudget,
    RogozhinContextBoundaryPrimitive.passTagBudget, RogozhinContextBoundaryPrimitive.boundaryBudget,
    RogozhinContextDataPrimitive.dataBudget, ThreeCounterCookReadbackPrimitive.contextBudget,
    ThreeCounterCookReadbackPrimitive.decodeBudget, ThreeCounterCookReadbackPrimitive.symbolBudget,
    ThreeCounterTagNumericConstructionMachine.decodeBudget, ThreeCounterTagNumericConstructionMachine.blockBudget,
    ThreeCounterLiveReadbackPrimitive.decodeBudget, ThreeCounterLiveReadbackPrimitive.validationBudget,
    ThreeCounterLiveReadbackPrimitive.counterBudget, ThreeCounterLiveReadbackPrimitive.reencodeBudget,
    CookDecodedRowPrimitive.scannedBudget, CookDecodedRowPrimitive.terminalBudget,
    CookSeedTerminalPrimitive.terminalBudget, Nat.pow_two]

theorem seedCost_degree : seedCost.degree = 4 := by decide

theorem seedCost_coefficient : seedCost.eval 1 = 114010 := by decide

theorem seedCost_operations_le (size : Nat) :
    CookSeedOutputPrimitive.seedBudget CookSeedOutputPrimitive.scannedBudget size size ≤
      114010 * (size + 1)^4 := by
  have bound := Polynomial.majorant seedCost size
  rw [seedCost_value, seedCost_degree, seedCost_coefficient] at bound
  exact bound

def coefficient : Nat := DeterministicTapeOutputPrimitive.coefficient + 114018

def budget (size : Nat) : Nat :=
  DeterministicTapeOutputPrimitive.coefficient * (size + 1)^4 +
    114010 * (size + 1)^4 + 8 * (size + 1)^4

theorem sum_quartic (parserCoefficient size : Nat) :
    parserCoefficient * (size + 1)^2 +
      CookSeedOutputPrimitive.seedBudget CookSeedOutputPrimitive.scannedBudget size size + 8 ≤
        parserCoefficient * (size + 1)^4 + 114010 * (size + 1)^4 + 8 * (size + 1)^4 := by
  have exponent := Nat.pow_le_pow_right (Nat.succ_pos size) (by decide : 2 ≤ 4)
  have parser := Nat.mul_le_mul_left parserCoefficient exponent
  have overhead : 8 ≤ 8 * (size + 1)^4 := by
    simpa only [Nat.pow_zero, Nat.mul_one] using Nat.mul_le_mul_left 8
      (Nat.pow_le_pow_right (Nat.succ_pos size) (by decide : 0 ≤ 4))
  exact Nat.add_le_add (Nat.add_le_add parser (seedCost_operations_le size)) overhead

theorem scannedBudget_le (size : Nat) :
    DeterministicTapeOutputPrimitive.scannedBudget size ≤ budget size :=
  sum_quartic DeterministicTapeOutputPrimitive.coefficient size

theorem rowSuffix_le_terminal (size cap : Nat) :
    640 * (cap + 1)^2 ≤ CookDecodedRowPrimitive.terminalBudget size cap :=
  Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _)

theorem terminalSuffix_le_scanned (size cap : Nat) :
    CookDecodedRowPrimitive.terminalBudget size cap ≤ CookDecodedRowPrimitive.scannedBudget size cap :=
  Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _)

theorem rowBudget_le_terminal (size : Nat) :
    DeterministicTapeOutputPrimitive.rowBudget size ≤ DeterministicTapeOutputPrimitive.terminalBudget size :=
  Nat.add_le_add_right (Nat.add_le_add_left (Nat.add_le_add_left
    (Nat.add_le_add_left (rowSuffix_le_terminal size (CookSeedOutputPrimitive.fieldCap size size)) _) _) _) 8

theorem terminalBudget_le_scanned (size : Nat) :
    DeterministicTapeOutputPrimitive.terminalBudget size ≤ DeterministicTapeOutputPrimitive.scannedBudget size :=
  Nat.add_le_add_right (Nat.add_le_add_left (Nat.add_le_add_left
    (Nat.add_le_add_left (terminalSuffix_le_scanned size (CookSeedOutputPrimitive.fieldCap size size)) _) _) _) 8

theorem row_operations_le (term : PureS.Term) :
    (DeterministicTapeOutputPrimitive.row term).operations ≤ budget term.size :=
  Nat.le_trans (DeterministicTapeOutputPrimitive.row_operations_le term)
    (Nat.le_trans (rowBudget_le_terminal term.size)
      (Nat.le_trans (terminalBudget_le_scanned term.size) (scannedBudget_le term.size)))

theorem terminal_operations_le (term : PureS.Term) :
    (DeterministicTapeOutputPrimitive.terminal term).operations ≤ budget term.size :=
  Nat.le_trans (DeterministicTapeOutputPrimitive.terminal_operations_le term)
    (Nat.le_trans (terminalBudget_le_scanned term.size) (scannedBudget_le term.size))

theorem scanned_operations_le (term : PureS.Term) :
    (DeterministicTapeOutputPrimitive.scanned term).operations ≤ budget term.size :=
  Nat.le_trans (DeterministicTapeOutputPrimitive.scanned_operations_le term) (scannedBudget_le term.size)

theorem complete_output_resource_certificate (term : PureS.Term) :
    ((DeterministicTapeOutputPrimitive.row term).value = DeterministicTapePureSOutput.decodeRow? term ∧
      (DeterministicTapeOutputPrimitive.row term).operations ≤ budget term.size) ∧
    ((DeterministicTapeOutputPrimitive.terminal term).value = DeterministicTapePureSOutput.decodeTerminalRow? term ∧
      (DeterministicTapeOutputPrimitive.terminal term).operations ≤ budget term.size) ∧
    ((DeterministicTapeOutputPrimitive.scanned term).value = DeterministicTapePureSOutput.decodeScannedOutput? term ∧
      (DeterministicTapeOutputPrimitive.scanned term).operations ≤ budget term.size) :=
  ⟨⟨DeterministicTapeOutputPrimitive.row_value term, row_operations_le term⟩,
    ⟨DeterministicTapeOutputPrimitive.terminal_value term, terminal_operations_le term⟩,
    ⟨DeterministicTapeOutputPrimitive.scanned_value term, scanned_operations_le term⟩⟩

end PureSFormal.Computation.DeterministicTapeOutputQuartic
