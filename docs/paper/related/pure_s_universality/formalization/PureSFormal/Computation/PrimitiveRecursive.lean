import Std

/-!
# Closed primitive-recursive programs

Arity is tracked by the type of a program. The only constructors are zero,
successor, projection, finite arity-indexed composition, and primitive
recursion. Evaluation is a total interpreter; code contains no semantic
function on natural numbers.
-/

namespace PureSFormal.Computation

/-- Closed primitive-recursive code with statically tracked arity. -/
inductive PRCode : Nat → Type where
  | zero (arity : Nat) : PRCode arity
  | successor : PRCode 1
  | projection {arity : Nat} (index : Fin arity) : PRCode arity
  | composition {outerArity inputArity : Nat}
      (outer : PRCode outerArity)
      (inner : Fin outerArity → PRCode inputArity) : PRCode inputArity
  | recursion {arity : Nat}
      (base : PRCode arity) (step : PRCode (arity + 2)) : PRCode (arity + 1)

namespace PRCode

/-- Kernel-reducible semantics. For an ill-sized argument list, a missing
coordinate reads as zero. Public agreement theorems use lists of exact arity. -/
def eval : {arity : Nat} → PRCode arity → List Nat → Nat
  | _, .zero _, _ => 0
  | _, .successor, input => input.getD 0 0 + 1
  | _, .projection index, input => input.getD index.val 0
  | _, .composition outer inner, input =>
      eval outer (List.ofFn (fun index => eval (inner index) input))
  | arity + 1, .recursion base step, input =>
      let parameters := input.take arity
      Nat.rec (eval base parameters)
        (fun next previous => eval step (parameters ++ [next, previous]))
        (input.getD arity 0)

/-- Evaluation of a unary code on its exact argument list. -/
def eval₁ (code : PRCode 1) (input : Nat) : Nat :=
  eval code [input]

/-- Evaluation of a binary code on its exact argument list. -/
def eval₂ (code : PRCode 2) (first second : Nat) : Nat :=
  eval code [first, second]

/-- Unary composition specialized to one inner program. -/
def composeUnary {arity : Nat} (outer : PRCode 1)
    (inner : PRCode arity) : PRCode arity :=
  .composition outer (fun _ => inner)

/-- Binary composition specialized to two inner programs. -/
def composeBinary {arity : Nat} (outer : PRCode 2)
    (first second : PRCode arity) : PRCode arity :=
  .composition outer (Fin.cases first (fun _ => second))

/-- Ternary composition specialized to three inner programs. -/
def composeTernary {arity : Nat} (outer : PRCode 3)
    (first second third : PRCode arity) : PRCode arity :=
  .composition outer
    (Fin.cases first (Fin.cases second (fun _ => third)))

@[simp]
theorem eval_composeUnary {arity : Nat} (outer : PRCode 1)
    (inner : PRCode arity) (input : List Nat) :
    eval (composeUnary outer inner) input = eval outer [eval inner input] :=
  by
    unfold composeUnary
    simp only [eval]
    unfold List.ofFn
    rw [Fin.foldr_succ, Fin.foldr_zero]

@[simp]
theorem eval_composeBinary {arity : Nat} (outer : PRCode 2)
    (first second : PRCode arity) (input : List Nat) :
    eval (composeBinary outer first second) input =
      eval outer [eval first input, eval second input] :=
  by
    unfold composeBinary
    simp only [eval]
    unfold List.ofFn
    rw [Fin.foldr_succ, Fin.foldr_succ, Fin.foldr_zero]
    rfl

@[simp]
theorem eval_composeTernary {arity : Nat} (outer : PRCode 3)
    (first second third : PRCode arity) (input : List Nat) :
    eval (composeTernary outer first second third) input =
      eval outer [eval first input, eval second input, eval third input] :=
  by
    unfold composeTernary
    simp only [eval]
    unfold List.ofFn
    rw [Fin.foldr_succ, Fin.foldr_succ, Fin.foldr_succ, Fin.foldr_zero]
    rfl

/-- Number of constructor nodes in a closed primitive-recursive program. -/
def nodeCount : {arity : Nat} → PRCode arity → Nat
  | _, .zero _ => 1
  | _, .successor => 1
  | _, .projection _ => 1
  | _, .composition outer inner =>
      1 + nodeCount outer + (List.ofFn (fun index => nodeCount (inner index))).sum
  | _, .recursion base step => 1 + nodeCount base + nodeCount step

theorem nodeCount_positive {arity : Nat} (code : PRCode arity) :
    0 < nodeCount code := by
  cases code with
  | zero arity => exact Nat.zero_lt_succ 0
  | successor => exact Nat.zero_lt_succ 0
  | projection index => exact Nat.zero_lt_succ 0
  | composition outer inner =>
      have onePositive : 0 < 1 := Nat.zero_lt_succ 0
      exact Nat.lt_of_lt_of_le onePositive
        (by
          simpa only [nodeCount, Nat.add_assoc] using
            Nat.le_add_right 1
              (nodeCount outer +
                (List.ofFn (fun index => nodeCount (inner index))).sum))
  | recursion base step =>
      have onePositive : 0 < 1 := Nat.zero_lt_succ 0
      exact Nat.lt_of_lt_of_le onePositive
        (by
          simpa only [nodeCount, Nat.add_assoc] using
            Nat.le_add_right 1 (nodeCount base + nodeCount step))

@[simp]
theorem eval₁_recursion (base : PRCode 0) (step : PRCode 2) (input : Nat) :
    eval₁ (.recursion base step) input =
      Nat.rec (eval base []) (fun next previous => eval step [next, previous]) input :=
  rfl

@[simp]
theorem eval₂_recursion (base : PRCode 1) (step : PRCode 3)
    (first second : Nat) :
    eval₂ (.recursion base step) first second =
      Nat.rec (eval base [first])
        (fun next previous => eval step [first, next, previous]) second :=
  rfl

/-- A code realizes a function on exact-arity argument lists. -/
def Realizes {arity : Nat} (code : PRCode arity)
    (function : (Fin arity → Nat) → Nat) : Prop :=
  ∀ input, eval code (List.ofFn input) = function input

/-- The unique unary projection. -/
def identity : PRCode 1 := .projection 0

@[simp]
theorem eval_identity (input : Nat) : eval₁ identity input = input := rfl

/-- A constant program, constructed from zero, successor, and composition. -/
def constant (arity : Nat) : Nat → PRCode arity
  | 0 => .zero arity
  | value + 1 => .composition .successor (fun _ => constant arity value)

@[simp]
theorem eval_constant (arity value : Nat) (input : List Nat) :
    eval (constant arity value) input = value := by
  induction value with
  | zero => cases arity <;> rfl
  | succ value ih =>
      cases arity with
      | zero =>
          change eval (constant 0 value) input + 1 = value + 1
          exact congrArg (fun number => number + 1) ih
      | succ arity =>
          change eval (constant (arity + 1) value) input + 1 = value + 1
          exact congrArg (fun number => number + 1) ih

/-- Predecessor, with predecessor of zero equal to zero. -/
def predecessor : PRCode 1 :=
  .recursion (.zero 0) (.projection 0)

@[simp]
theorem eval₁_predecessor (input : Nat) :
    eval₁ predecessor input = input - 1 := by
  cases input <;> rfl

/-- Addition, recursing over the second argument. -/
def addition : PRCode 2 :=
  .recursion (.projection 0)
    (.composition .successor (fun _ => .projection 2))

@[simp]
theorem eval₂_addition (first second : Nat) :
    eval₂ addition first second = first + second := by
  induction second with
  | zero => rfl
  | succ second ih =>
      change eval₂ addition first second + 1 = first + (second + 1)
      rw [ih]
      exact (Nat.add_succ first second).symm

/-- Multiplication, recursing over the second argument. -/
def multiplication : PRCode 2 :=
  .recursion (.zero 1)
    (.composition addition (Fin.cases (.projection 0) (fun _ => .projection 2)))

@[simp]
theorem eval₂_multiplication (first second : Nat) :
    eval₂ multiplication first second = first * second := by
  induction second with
  | zero => rfl
  | succ second ih =>
      change eval₂ addition first (eval₂ multiplication first second) =
        first * (second + 1)
      rw [eval₂_addition, ih]
      rw [Nat.mul_succ, Nat.add_comm]

/-- Truncated subtraction, recursing over the second argument. -/
def truncatedSubtraction : PRCode 2 :=
  .recursion (.projection 0)
    (.composition predecessor (fun _ => .projection 2))

@[simp]
theorem eval₂_truncatedSubtraction (first second : Nat) :
    eval₂ truncatedSubtraction first second = first - second := by
  induction second with
  | zero => rfl
  | succ second ih =>
      change eval₁ predecessor (eval₂ truncatedSubtraction first second) =
        first - (second + 1)
      rw [eval₁_predecessor, ih, Nat.sub_succ]
      simp [Nat.pred_eq_sub_one]
      rw [Nat.sub_sub]

/-- Characteristic function of zero. -/
def isZero : PRCode 1 :=
  .recursion (constant 0 1) (constant 2 0)

@[simp]
theorem eval₁_isZero (input : Nat) :
    eval₁ isZero input = if input = 0 then 1 else 0 := by
  cases input <;> rfl

/-- Characteristic function of positive naturals. -/
def positive : PRCode 1 :=
  .recursion (.zero 0) (constant 2 1)

@[simp]
theorem eval₁_positive (input : Nat) :
    eval₁ positive input = if input = 0 then 0 else 1 := by
  cases input <;> rfl

/-- Less-than-or-equal comparison, returning zero or one. -/
def lessEqual : PRCode 2 :=
  .composition isZero (fun _ => truncatedSubtraction)

@[simp]
theorem eval₂_lessEqual (first second : Nat) :
    eval₂ lessEqual first second = if first ≤ second then 1 else 0 := by
  change eval₁ isZero (eval₂ truncatedSubtraction first second) = _
  rw [eval₂_truncatedSubtraction, eval₁_isZero]
  by_cases order : first ≤ second
  · simp [order, Nat.sub_eq_zero_of_le order]
  · have nonzero : first - second ≠ 0 := by
      intro zero
      exact order (Nat.le_of_sub_eq_zero zero)
    simp [order, nonzero]

/-- Reverse the two inputs of a binary program. -/
def swap (program : PRCode 2) : PRCode 2 :=
  .composition program
    (Fin.cases (.projection 1) (fun _ => .projection 0))

@[simp]
theorem eval₂_swap (program : PRCode 2) (first second : Nat) :
    eval₂ (swap program) first second = eval₂ program second first :=
  rfl

/-- Equality comparison, returning zero or one. -/
def equal : PRCode 2 :=
  .composition isZero (fun _ =>
    .composition addition
      (Fin.cases truncatedSubtraction
        (fun _ => swap truncatedSubtraction)))

@[simp]
theorem eval₂_equal (first second : Nat) :
    eval₂ equal first second = if first = second then 1 else 0 := by
  change eval₁ isZero
    (eval₂ addition (eval₂ truncatedSubtraction first second)
      (eval₂ truncatedSubtraction second first)) = _
  rw [eval₂_addition, eval₂_truncatedSubtraction,
    eval₂_truncatedSubtraction, eval₁_isZero]
  by_cases same : first = second
  · subst second
    simp
  · have nonzero : first - second + (second - first) ≠ 0 := by
      intro zero
      have firstSub : first - second = 0 :=
        Nat.eq_zero_of_add_eq_zero_right zero
      have secondSub : second - first = 0 :=
        Nat.eq_zero_of_add_eq_zero_left zero
      exact same (Nat.le_antisymm
        (Nat.le_of_sub_eq_zero firstSub)
        (Nat.le_of_sub_eq_zero secondSub))
    rw [if_neg nonzero, if_neg same]

/-- Branch on whether the third argument is zero. -/
def branchIfZero : PRCode 3 :=
  .recursion (.projection 0) (.projection 1)

@[simp]
theorem eval_branchIfZero (whenZero whenPositive test : Nat) :
    eval branchIfZero [whenZero, whenPositive, test] =
      if test = 0 then whenZero else whenPositive := by
  induction test with
  | zero => rfl
  | succ test ih => rfl

/-- Primitive-recursion step for remainder, with inputs divisor, current
index, and the previous remainder. -/
def moduloStep : PRCode 3 :=
  let next := composeUnary .successor (.projection 2)
  let hit := composeBinary equal next (.projection 0)
  composeTernary branchIfZero next (.zero 3) hit

@[simp]
theorem eval_moduloStep (divisor index previous : Nat) :
    eval moduloStep [divisor, index, previous] =
      if previous + 1 = divisor then 0 else previous + 1 := by
  have equalEval : eval equal [previous + 1, divisor] =
      if previous + 1 = divisor then 1 else 0 :=
    eval₂_equal (previous + 1) divisor
  unfold moduloStep
  simp only [eval_composeTernary, eval_composeBinary, eval_composeUnary]
  change eval branchIfZero
    [previous + 1, 0, eval equal [previous + 1, divisor]] = _
  rw [equalEval, eval_branchIfZero]
  by_cases hit : previous + 1 = divisor <;> simp [hit]

/-- Remainder with the divisor first, so primitive recursion can run over the
second argument. -/
def moduloReversed : PRCode 2 :=
  .recursion (.zero 1) moduloStep

/-- Primitive-recursive remainder in the conventional dividend/divisor
argument order. -/
def modulus : PRCode 2 := swap moduloReversed

/-- Recurrence computed by `moduloReversed`. -/
def moduloValue (divisor : Nat) : Nat → Nat
  | 0 => 0
  | number + 1 =>
      if moduloValue divisor number + 1 = divisor then 0
      else moduloValue divisor number + 1

@[simp]
theorem eval₂_moduloReversed (divisor dividend : Nat) :
    eval₂ moduloReversed divisor dividend = moduloValue divisor dividend := by
  induction dividend with
  | zero => rfl
  | succ dividend ih =>
      change eval moduloStep
        [divisor, dividend, eval₂ moduloReversed divisor dividend] =
          moduloValue divisor (dividend + 1)
      rw [eval_moduloStep, ih]
      rfl

/-- Successor recurrence for natural remainder, including divisor zero. -/
theorem succ_mod_recurrence (number divisor : Nat) :
    (number + 1) % divisor =
      if number % divisor + 1 = divisor then 0
      else number % divisor + 1 := by
  cases divisor with
  | zero => simp
  | succ divisor =>
      let remainder := number % (divisor + 1)
      have remainderLt : remainder < divisor + 1 :=
        Nat.mod_lt number (Nat.zero_lt_succ divisor)
      by_cases hit : remainder + 1 = divisor + 1
      · rw [if_pos hit]
        apply Nat.succ_mod_succ_eq_zero_iff.mpr
        exact Nat.add_right_cancel hit
      · rw [if_neg hit]
        have remainderSuccLe : remainder + 1 ≤ divisor + 1 :=
          Nat.succ_le_of_lt remainderLt
        have remainderSuccLt : remainder + 1 < divisor + 1 :=
          Nat.lt_of_le_of_ne remainderSuccLe hit
        have split := Nat.mod_add_div number (divisor + 1)
        have represented :
            (divisor + 1) * (number / (divisor + 1)) + (remainder + 1) =
              number + 1 := by
          calc
            (divisor + 1) * (number / (divisor + 1)) + (remainder + 1) =
                (remainder + (divisor + 1) * (number / (divisor + 1))) + 1 := by
              simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
            _ = number + 1 := congrArg (fun value => value + 1) split
        calc
          (number + 1) % (divisor + 1) =
              ((divisor + 1) * (number / (divisor + 1)) +
                (remainder + 1)) % (divisor + 1) := by
                rw [represented]
          _ = (remainder + 1) % (divisor + 1) :=
            Nat.mul_add_mod_self_left _ _ _
          _ = remainder + 1 := Nat.mod_eq_of_lt remainderSuccLt

theorem moduloValue_eq_mod (divisor dividend : Nat) :
    moduloValue divisor dividend = dividend % divisor := by
  induction dividend with
  | zero => simp [moduloValue]
  | succ dividend ih =>
      rw [moduloValue, ih, succ_mod_recurrence]

@[simp]
theorem eval₂_modulus (dividend divisor : Nat) :
    eval₂ modulus dividend divisor = dividend % divisor := by
  rw [modulus, eval₂_swap, eval₂_moduloReversed,
    moduloValue_eq_mod]

/-- Primitive-recursion step for quotient, with inputs divisor, current
index, and the previous quotient. -/
def divisionStep : PRCode 3 :=
  let nextDividend := composeUnary .successor (.projection 1)
  let remainder := composeBinary modulus nextDividend (.projection 0)
  let divisible := composeUnary isZero remainder
  let nextQuotient := composeUnary .successor (.projection 2)
  composeTernary branchIfZero (.projection 2) nextQuotient divisible

@[simp]
theorem eval_divisionStep (divisor index previous : Nat) :
    eval divisionStep [divisor, index, previous] =
      if (index + 1) % divisor = 0 then previous + 1 else previous := by
  have remainderEval : eval modulus [index + 1, divisor] =
      (index + 1) % divisor :=
    eval₂_modulus (index + 1) divisor
  have zeroEval : eval isZero [(index + 1) % divisor] =
      if (index + 1) % divisor = 0 then 1 else 0 :=
    eval₁_isZero ((index + 1) % divisor)
  unfold divisionStep
  simp only [eval_composeTernary, eval_composeBinary, eval_composeUnary]
  change eval branchIfZero
    [previous, previous + 1,
      eval isZero [eval modulus [index + 1, divisor]]] = _
  rw [remainderEval, zeroEval, eval_branchIfZero]
  by_cases divisible : (index + 1) % divisor = 0 <;> simp [divisible]

/-- Quotient with the divisor first, so primitive recursion can run over the
second argument. -/
def divisionReversed : PRCode 2 :=
  .recursion (.zero 1) divisionStep

/-- Primitive-recursive natural quotient in dividend/divisor order. -/
def division : PRCode 2 := swap divisionReversed

/-- Recurrence computed by `divisionReversed`. -/
def divisionValue (divisor : Nat) : Nat → Nat
  | 0 => 0
  | number + 1 =>
      if (number + 1) % divisor = 0 then divisionValue divisor number + 1
      else divisionValue divisor number

@[simp]
theorem eval₂_divisionReversed (divisor dividend : Nat) :
    eval₂ divisionReversed divisor dividend = divisionValue divisor dividend := by
  induction dividend with
  | zero => rfl
  | succ dividend ih =>
      change eval divisionStep
        [divisor, dividend, eval₂ divisionReversed divisor dividend] =
          divisionValue divisor (dividend + 1)
      rw [eval_divisionStep, ih]
      rfl

/-- Successor recurrence for natural division. -/
theorem succ_div_recurrence (number divisor : Nat) :
    (number + 1) / divisor =
      if (number + 1) % divisor = 0 then number / divisor + 1
      else number / divisor := by
  cases divisor with
  | zero => simp
  | succ predecessor =>
      let divisor := predecessor + 1
      let quotient := number / divisor
      let remainder := number % divisor
      have divisorPositive : 0 < divisor := Nat.zero_lt_succ predecessor
      have remainderLt : remainder < divisor :=
        Nat.mod_lt number divisorPositive
      have split : remainder + divisor * quotient = number :=
        Nat.mod_add_div number divisor
      by_cases divisible : (number + 1) % divisor = 0
      · rw [if_pos divisible]
        have remainderEq : remainder = predecessor := by
          exact Nat.succ_mod_succ_eq_zero_iff.mp divisible
        have represented : number + 1 = divisor * (quotient + 1) := by
          calc
            number + 1 = (remainder + divisor * quotient) + 1 := by
              rw [split]
            _ = (predecessor + divisor * quotient) + 1 := by
              rw [remainderEq]
            _ = divisor * (quotient + 1) := by
              simp only [divisor, Nat.mul_add, Nat.mul_one,
                Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        exact Nat.div_eq_of_eq_mul_right divisorPositive represented
      · rw [if_neg divisible]
        have remainderNe : remainder ≠ predecessor := by
          intro equal
          exact divisible (Nat.succ_mod_succ_eq_zero_iff.mpr equal)
        have remainderLe : remainder ≤ predecessor :=
          Nat.le_of_lt_succ remainderLt
        have remainderLtPred : remainder < predecessor :=
          Nat.lt_of_le_of_ne remainderLe remainderNe
        have nextRemainderLt : remainder + 1 < divisor := by
          exact Nat.lt_succ_of_le (Nat.succ_le_of_lt remainderLtPred)
        have represented :
            (remainder + 1) + divisor * quotient = number + 1 := by
          calc
            (remainder + 1) + divisor * quotient =
                (remainder + divisor * quotient) + 1 := by
              simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
            _ = number + 1 := congrArg (fun value => value + 1) split
        calc
          (number + 1) / divisor =
              ((remainder + 1) + divisor * quotient) / divisor := by
            rw [represented]
          _ = (remainder + 1) / divisor + quotient :=
            Nat.add_mul_div_left _ _ divisorPositive
          _ = 0 + quotient := by rw [Nat.div_eq_of_lt nextRemainderLt]
          _ = number / divisor := Nat.zero_add quotient

theorem divisionValue_eq_div (divisor dividend : Nat) :
    divisionValue divisor dividend = dividend / divisor := by
  induction dividend with
  | zero => simp [divisionValue]
  | succ dividend ih =>
      rw [divisionValue, ih, succ_div_recurrence]

@[simp]
theorem eval₂_division (dividend divisor : Nat) :
    eval₂ division dividend divisor = dividend / divisor := by
  rw [division, eval₂_swap, eval₂_divisionReversed,
    divisionValue_eq_div]

/-- Exponentiation, recursing over the exponent. -/
def power : PRCode 2 :=
  .recursion (constant 1 1)
    (.composition multiplication
      (Fin.cases (.projection 0) (fun _ => .projection 2)))

@[simp]
theorem eval₂_power (base exponent : Nat) :
    eval₂ power base exponent = base ^ exponent := by
  induction exponent with
  | zero => rfl
  | succ exponent ih =>
      change eval₂ multiplication base (eval₂ power base exponent) =
        base ^ (exponent + 1)
      rw [eval₂_multiplication, ih, Nat.pow_succ]
      rw [Nat.mul_comm]

/-- Triangular numbers in recurrence form. -/
def triangular : PRCode 1 :=
  .recursion (.zero 0)
    (.composition addition
      (Fin.cases (.composition .successor (fun _ => .projection 0))
        (fun _ => .projection 1)))

/-- Mathematical triangular numbers matching `triangular`. -/
def triangularValue : Nat → Nat
  | 0 => 0
  | value + 1 => triangularValue value + value + 1

@[simp]
theorem eval₁_triangular (input : Nat) :
    eval₁ triangular input = triangularValue input := by
  induction input with
  | zero => rfl
  | succ input ih =>
      change eval₂ addition (input + 1) (eval₁ triangular input) =
        triangularValue (input + 1)
      rw [eval₂_addition, ih]
      simp [triangularValue, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem triangularValue_le_succ (number : Nat) :
    triangularValue number ≤ triangularValue (number + 1) := by
  rw [triangularValue]
  exact Nat.le_trans (Nat.le_add_right _ number) (Nat.le_add_right _ 1)

theorem triangularValue_lt_succ (number : Nat) :
    triangularValue number < triangularValue (number + 1) := by
  rw [triangularValue]
  exact Nat.lt_succ_of_le (Nat.le_add_right _ number)

theorem triangularValue_mono {first second : Nat} (order : first ≤ second) :
    triangularValue first ≤ triangularValue second := by
  induction second generalizing first with
  | zero =>
      have firstZero : first = 0 := Nat.eq_zero_of_le_zero order
      subst first
      exact Nat.le_refl _
  | succ second ih =>
      rcases Nat.eq_or_lt_of_le order with same | strict
      · subst first
        exact Nat.le_refl _
      · exact Nat.le_trans (ih (Nat.le_of_lt_succ strict))
          (triangularValue_le_succ second)

/-- Step of the diagonal-number program used for Cantor unpairing. -/
def cantorDiagonalStep : PRCode 2 :=
  let nextIndex := composeUnary .successor (.projection 0)
  let nextDiagonal := composeUnary .successor (.projection 1)
  let nextTriangle := composeUnary triangular nextDiagonal
  let advance := composeBinary lessEqual nextTriangle nextIndex
  composeTernary branchIfZero (.projection 1) nextDiagonal advance

@[simp]
theorem eval_cantorDiagonalStep (index previous : Nat) :
    eval cantorDiagonalStep [index, previous] =
      if triangularValue (previous + 1) ≤ index + 1
      then previous + 1 else previous := by
  have triangleEval : eval triangular [previous + 1] =
      triangularValue (previous + 1) :=
    eval₁_triangular (previous + 1)
  have compareEval :
      eval lessEqual [triangularValue (previous + 1), index + 1] =
        if triangularValue (previous + 1) ≤ index + 1 then 1 else 0 :=
    eval₂_lessEqual (triangularValue (previous + 1)) (index + 1)
  unfold cantorDiagonalStep
  simp only [eval_composeTernary, eval_composeBinary, eval_composeUnary]
  change eval branchIfZero
    [previous, previous + 1,
      eval lessEqual [eval triangular [previous + 1], index + 1]] = _
  rw [triangleEval, compareEval, eval_branchIfZero]
  by_cases advance : triangularValue (previous + 1) ≤ index + 1 <;>
    simp [advance]

/-- Closed code computing the Cantor diagonal containing an index. -/
def cantorDiagonal : PRCode 1 :=
  .recursion (.zero 0) cantorDiagonalStep

/-- Recurrence implemented by `cantorDiagonal`. -/
def cantorDiagonalValue : Nat → Nat
  | 0 => 0
  | index + 1 =>
      if triangularValue (cantorDiagonalValue index + 1) ≤ index + 1
      then cantorDiagonalValue index + 1
      else cantorDiagonalValue index

@[simp]
theorem eval₁_cantorDiagonal (index : Nat) :
    eval₁ cantorDiagonal index = cantorDiagonalValue index := by
  induction index with
  | zero => rfl
  | succ index ih =>
      change eval cantorDiagonalStep
        [index, eval₁ cantorDiagonal index] = cantorDiagonalValue (index + 1)
      rw [eval_cantorDiagonalStep, ih]
      rfl

/-- The computed diagonal is the unique diagonal whose triangular interval
contains the index. -/
theorem cantorDiagonalValue_bounds (index : Nat) :
    triangularValue (cantorDiagonalValue index) ≤ index ∧
    index < triangularValue (cantorDiagonalValue index + 1) := by
  induction index with
  | zero => decide
  | succ index ih =>
      rw [cantorDiagonalValue]
      by_cases advance :
          triangularValue (cantorDiagonalValue index + 1) ≤ index + 1
      · rw [if_pos advance]
        have boundary :
            triangularValue (cantorDiagonalValue index + 1) = index + 1 :=
          Nat.le_antisymm advance (Nat.succ_le_of_lt ih.2)
        exact ⟨advance, by
          rw [← boundary]
          exact triangularValue_lt_succ (cantorDiagonalValue index + 1)⟩
      · rw [if_neg advance]
        exact ⟨Nat.le_trans ih.1 (Nat.le_succ index),
          Nat.lt_of_not_ge advance⟩

/-- Uniqueness of a Cantor diagonal from its triangular interval. -/
theorem cantorDiagonal_unique {index first second : Nat}
    (firstLower : triangularValue first ≤ index)
    (firstUpper : index < triangularValue (first + 1))
    (secondLower : triangularValue second ≤ index)
    (secondUpper : index < triangularValue (second + 1)) :
    first = second := by
  apply Nat.le_antisymm
  · apply Nat.le_of_not_lt
    intro secondLtFirst
    have secondSuccLeFirst : second + 1 ≤ first :=
      Nat.succ_le_of_lt secondLtFirst
    have triangleOrder := triangularValue_mono secondSuccLeFirst
    exact Nat.not_le_of_lt secondUpper
      (Nat.le_trans triangleOrder firstLower)
  · apply Nat.le_of_not_lt
    intro firstLtSecond
    have firstSuccLeSecond : first + 1 ≤ second :=
      Nat.succ_le_of_lt firstLtSecond
    have triangleOrder := triangularValue_mono firstSuccLeSecond
    exact Nat.not_le_of_lt firstUpper
      (Nat.le_trans triangleOrder secondLower)

/-- Right coordinate of Cantor unpairing. -/
def cantorRight : PRCode 1 :=
  composeBinary truncatedSubtraction identity
    (composeUnary triangular cantorDiagonal)

/-- Left coordinate of Cantor unpairing. -/
def cantorLeft : PRCode 1 :=
  composeBinary truncatedSubtraction cantorDiagonal cantorRight

@[simp]
theorem eval₁_cantorRight (index : Nat) :
    eval₁ cantorRight index =
      index - triangularValue (cantorDiagonalValue index) := by
  unfold cantorRight eval₁
  rw [eval_composeBinary, eval_composeUnary]
  change eval₂ truncatedSubtraction index
    (eval₁ triangular (eval₁ cantorDiagonal index)) = _
  rw [eval₂_truncatedSubtraction, eval₁_triangular,
    eval₁_cantorDiagonal]

@[simp]
theorem eval₁_cantorLeft (index : Nat) :
    eval₁ cantorLeft index =
      cantorDiagonalValue index -
        (index - triangularValue (cantorDiagonalValue index)) := by
  unfold cantorLeft eval₁
  rw [eval_composeBinary]
  change eval₂ truncatedSubtraction
    (eval₁ cantorDiagonal index) (eval₁ cantorRight index) = _
  rw [eval₂_truncatedSubtraction, eval₁_cantorDiagonal,
    eval₁_cantorRight]

/-- Cantor pairing, computed as `triangular (a+b) + b`. -/
def cantorPair : PRCode 2 :=
  .composition addition
    (Fin.cases
      (.composition triangular (fun _ => addition))
      (fun _ => .projection 1))

@[simp]
theorem eval₂_cantorPair (first second : Nat) :
    eval₂ cantorPair first second =
      triangularValue (first + second) + second := by
  change eval₂ addition (eval₁ triangular (eval₂ addition first second))
    second = triangularValue (first + second) + second
  rw [eval₂_addition, eval₁_triangular, eval₂_addition]

end PRCode

/-- A unary function is primitive recursive when a closed code evaluates to
it on every natural input. -/
def PrimitiveRecursive (function : Nat → Nat) : Prop :=
  ∃ code : PRCode 1, ∀ input, code.eval₁ input = function input

/-- Constructive certificate carrying both closed code and its equation. -/
structure PrimitiveRecursiveMap (function : Nat → Nat) where
  program : PRCode 1
  correct : ∀ input, program.eval₁ input = function input

/-- A binary function is primitive recursive when a closed binary code
evaluates to it on every pair of natural inputs. -/
def PrimitiveRecursive₂ (function : Nat → Nat → Nat) : Prop :=
  ∃ code : PRCode 2, ∀ first second,
    code.eval₂ first second = function first second

/-- Constructive certificate for a binary primitive-recursive map. -/
structure PrimitiveRecursiveMap₂ (function : Nat → Nat → Nat) where
  program : PRCode 2
  correct : ∀ first second, program.eval₂ first second = function first second

namespace PrimitiveRecursive

theorem identity : PrimitiveRecursive id :=
  ⟨PRCode.identity, fun _ => rfl⟩

theorem successor : PrimitiveRecursive (fun input => input + 1) :=
  ⟨PRCode.successor, fun _ => rfl⟩

theorem constant (value : Nat) : PrimitiveRecursive (fun _ => value) :=
  ⟨PRCode.constant 1 value, fun input => PRCode.eval_constant 1 value [input]⟩

theorem comp {outer inner : Nat → Nat}
    (outerPR : PrimitiveRecursive outer)
    (innerPR : PrimitiveRecursive inner) :
    PrimitiveRecursive (fun input => outer (inner input)) := by
  rcases outerPR with ⟨outerCode, outerCorrect⟩
  rcases innerPR with ⟨innerCode, innerCorrect⟩
  refine ⟨PRCode.composition outerCode (fun _ => innerCode), ?_⟩
  intro input
  change outerCode.eval₁ (innerCode.eval₁ input) = outer (inner input)
  rw [innerCorrect, outerCorrect]

theorem addition : PrimitiveRecursive₂ Nat.add :=
  ⟨PRCode.addition, PRCode.eval₂_addition⟩

theorem multiplication : PrimitiveRecursive₂ Nat.mul :=
  ⟨PRCode.multiplication, PRCode.eval₂_multiplication⟩

theorem truncatedSubtraction :
    PrimitiveRecursive₂ Nat.sub :=
  ⟨PRCode.truncatedSubtraction, PRCode.eval₂_truncatedSubtraction⟩

theorem power : PrimitiveRecursive₂ Nat.pow :=
  ⟨PRCode.power, PRCode.eval₂_power⟩

theorem modulus : PrimitiveRecursive₂ Nat.mod :=
  ⟨PRCode.modulus, PRCode.eval₂_modulus⟩

theorem division : PrimitiveRecursive₂ Nat.div :=
  ⟨PRCode.division, PRCode.eval₂_division⟩

end PrimitiveRecursive

namespace PrimitiveRecursiveMap

/-- Forget the code-bearing certificate to the proposition. -/
theorem primitiveRecursive {function : Nat → Nat}
    (certificate : PrimitiveRecursiveMap function) :
    PrimitiveRecursive function :=
  ⟨certificate.program, certificate.correct⟩

/-- Constructive composition of code-bearing certificates. -/
def comp {outer inner : Nat → Nat}
    (outerMap : PrimitiveRecursiveMap outer)
    (innerMap : PrimitiveRecursiveMap inner) :
    PrimitiveRecursiveMap (fun input => outer (inner input)) where
  program := .composition outerMap.program (fun _ => innerMap.program)
  correct := by
    intro input
    change outerMap.program.eval₁ (innerMap.program.eval₁ input) =
      outer (inner input)
    rw [innerMap.correct, outerMap.correct]

end PrimitiveRecursiveMap

end PureSFormal.Computation
