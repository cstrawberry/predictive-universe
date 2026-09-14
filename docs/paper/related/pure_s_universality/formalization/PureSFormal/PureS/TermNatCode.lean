import PureSFormal.PureS.Term

/-!
# Cantor natural codes for bare pure-S terms

This module formalizes the natural coding displayed in the manuscript.  Its
pairing function is Cantor's diagonal enumeration, proved equal to

`(a + b) * (a + b + 1) / 2 + b`.

The single leaf has code zero and an application has one plus the pairing of
its child codes.  An executable diagonal unpairing function drives a
fuel-bounded term decoder.  The public decoder validates its result by
re-encoding.  The coding is proved bijective, so although the decoder exposes
an `Option` interface, it succeeds on every natural number.
-/

namespace PureSFormal.PureS

namespace Term

/-! ## Cantor pairing -/

/-- Triangular numbers, in recurrence form convenient for kernel proofs. -/
def triangle : Nat → Nat
  | 0 => 0
  | n + 1 => triangle n + n + 1

@[simp]
theorem triangle_succ (n : Nat) :
    triangle (n + 1) = triangle n + n + 1 := rfl

/-- Twice the recursive triangular number is the consecutive product. -/
theorem two_mul_triangle (n : Nat) :
    2 * triangle n = n * (n + 1) := by
  induction n with
  | zero => rfl
  | succ n ih =>
      calc
        2 * triangle (n + 1) = 2 * (triangle n + (n + 1)) := by
          rw [triangle_succ, Nat.add_assoc]
        _ = 2 * triangle n + 2 * (n + 1) := Nat.mul_add 2 _ _
        _ = n * (n + 1) + 2 * (n + 1) := by rw [ih]
        _ = (n + 2) * (n + 1) := (Nat.add_mul n 2 (n + 1)).symm
        _ = (n + 1) * ((n + 1) + 1) := by
          rw [Nat.mul_comm]

/-- Closed form for the recursive triangular-number definition. -/
theorem triangle_closed (n : Nat) :
    triangle n = n * (n + 1) / 2 := by
  have divided := congrArg (fun value : Nat => value / 2)
    (two_mul_triangle n)
  simpa only [Nat.mul_div_cancel_left _ (by decide : 0 < 2)] using divided

theorem self_le_triangle (n : Nat) : n ≤ triangle n := by
  induction n with
  | zero => exact Nat.le_refl 0
  | succ n ih =>
      rw [triangle_succ, Nat.add_assoc]
      exact Nat.le_add_left (n + 1) (triangle n)

/-- Cantor's pairing function, enumerated diagonal by diagonal. -/
def pair (a b : Nat) : Nat :=
  triangle (a + b) + b

/-- The pairing function is exactly the manuscript's displayed closed form. -/
theorem pair_closed (a b : Nat) :
    pair a b = (a + b) * (a + b + 1) / 2 + b := by
  simp only [pair, triangle_closed]

theorem sum_le_pair (a b : Nat) : a + b ≤ pair a b := by
  exact Nat.le_trans (self_le_triangle (a + b))
    (Nat.le_add_right _ b)

theorem left_lt_pair_succ (a b : Nat) : a < pair a b + 1 := by
  exact Nat.lt_succ_of_le
    (Nat.le_trans (Nat.le_add_right a b) (sum_le_pair a b))

theorem right_lt_pair_succ (a b : Nat) : b < pair a b + 1 := by
  exact Nat.lt_succ_of_le
    (Nat.le_trans (Nat.le_add_left b a) (sum_le_pair a b))

/-! ## Executable inverse pairing -/

/-- Advance once in Cantor's diagonal enumeration. -/
def nextPair : Nat × Nat → Nat × Nat
  | (0, b) => (b + 1, 0)
  | (a + 1, b) => (a, b + 1)

/-- The pair at a natural index, computed by diagonal enumeration. -/
def unpair : Nat → Nat × Nat
  | 0 => (0, 0)
  | n + 1 => nextPair (unpair n)

@[simp]
theorem pair_zero_zero : pair 0 0 = 0 := rfl

theorem pair_diagonal_start (n : Nat) :
    pair (n + 1) 0 = pair 0 n + 1 := by
  simp only [pair, Nat.add_zero, Nat.zero_add, triangle_succ]

theorem pair_diagonal_succ (a b : Nat) :
    pair a (b + 1) = pair (a + 1) b + 1 := by
  simp only [pair]
  have sums : a + (b + 1) = (a + 1) + b := by
    simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [sums]
  exact (Nat.add_assoc _ b 1).symm

/-- Executable unpairing is a left inverse of Cantor pairing. -/
@[simp]
theorem unpair_pair (a b : Nat) : unpair (pair a b) = (a, b) := by
  have diagonal : ∀ n a b,
      a + b = n → unpair (pair a b) = (a, b) := by
    intro n
    induction n with
    | zero =>
        intro a b sumZero
        have bothZero := Nat.add_eq_zero_iff.mp sumZero
        have aZero : a = 0 := bothZero.1
        have bZero : b = 0 := bothZero.2
        subst a
        subst b
        rfl
    | succ n diagonalIH =>
        have start : unpair (pair (n + 1) 0) = (n + 1, 0) := by
          rw [pair_diagonal_start, unpair]
          rw [diagonalIH 0 n (Nat.zero_add n)]
          rfl
        intro a b sumSucc
        induction b generalizing a with
        | zero =>
            have aEq : a = n + 1 := by
              simpa only [Nat.add_zero] using sumSucc
            subst a
            exact start
        | succ b pointIH =>
            have predecessorSum : (a + 1) + b = n + 1 := by
              calc
                (a + 1) + b = a + (b + 1) := by
                  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
                _ = n + 1 := sumSucc
            rw [pair_diagonal_succ, unpair]
            rw [pointIH (a + 1) predecessorSum]
            rfl
  exact diagonal (a + b) a b rfl

/-- Executable unpairing is also a right inverse of Cantor pairing. -/
@[simp]
theorem pair_unpair (number : Nat) :
    pair (unpair number).1 (unpair number).2 = number := by
  induction number with
  | zero => rfl
  | succ number ih =>
      simp only [unpair]
      cases equation : unpair number with
      | mk a b =>
          cases a with
          | zero =>
              simp only [nextPair, Prod.fst, Prod.snd]
              have current : pair 0 b = number := by
                simpa [equation] using ih
              rw [pair_diagonal_start, current]
          | succ a =>
              simp only [nextPair, Prod.fst, Prod.snd]
              have current : pair (a + 1) b = number := by
                simpa [equation] using ih
              rw [pair_diagonal_succ, current]

/-- Cantor pairing is injective in both coordinates. -/
theorem pair_injective {a b c d : Nat} (equalPairs : pair a b = pair c d) :
    a = c ∧ b = d := by
  have equalUnpairs := congrArg unpair equalPairs
  simpa only [unpair_pair, Prod.mk.injEq] using equalUnpairs

/-! ## Term codes and their inverse -/

/--
The manuscript's natural code: `S` is zero and application is one plus the
Cantor pair of its child codes.
-/
def code : Term → Nat
  | .s => 0
  | .app fn arg => Nat.succ (pair (code fn) (code arg))

@[simp]
theorem code_s : code .s = 0 := rfl

@[simp]
theorem code_app (fn arg : Term) :
    code (.app fn arg) = 1 + pair fn.code arg.code := by
  simp only [code, Nat.succ_eq_add_one, Nat.add_comm]

/-- Child codes are strictly smaller than their enclosing application code. -/
theorem code_left_lt_app (fn arg : Term) :
    code fn < code (.app fn arg) :=
  left_lt_pair_succ (code fn) (code arg)

/-- Child codes are strictly smaller than their enclosing application code. -/
theorem code_right_lt_app (fn arg : Term) :
    code arg < code (.app fn arg) :=
  right_lt_pair_succ (code fn) (code arg)

/-- A simple fuel bound for decoding a canonical code. -/
theorem size_le_two_code_add_one (term : Term) :
    term.size ≤ 2 * term.code + 1 := by
  induction term with
  | s => exact Nat.le_refl 1
  | app fn arg fnIH argIH =>
      have sumLe := sum_le_pair fn.code arg.code
      have children := Nat.add_le_add fnIH argIH
      have withRoot := Nat.succ_le_succ children
      have scaled := Nat.mul_le_mul_left 2 sumLe
      have padded := Nat.add_le_add_right scaled 3
      have rearrange :
          Nat.succ ((2 * fn.code + 1) + (2 * arg.code + 1)) =
            2 * (fn.code + arg.code) + 3 := by
        calc
          Nat.succ ((2 * fn.code + 1) + (2 * arg.code + 1)) =
              (((2 * fn.code + 2 * arg.code) + 1) + 1) + 1 := by
            simp only [Nat.succ_eq_add_one]
            simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
          _ = 2 * (fn.code + arg.code) + 3 := by
            rw [Nat.mul_add]
      calc
        (Term.app fn arg).size = Nat.succ (fn.size + arg.size) := rfl
        _ ≤ Nat.succ ((2 * fn.code + 1) + (2 * arg.code + 1)) :=
          withRoot
        _ = 2 * (fn.code + arg.code) + 3 := rearrange
        _ ≤ 2 * pair fn.code arg.code + 3 := padded
        _ = 2 * code (.app fn arg) + 1 := by
          simp only [code, Nat.succ_eq_add_one, Nat.mul_add]

/-- Fuel-bounded structural decoder driven by executable Cantor unpairing. -/
def decodeCodeAux : Nat → Nat → Option Term
  | 0, _ => none
  | _ + 1, 0 => some .s
  | fuel + 1, number + 1 =>
      let codes := unpair number
      match decodeCodeAux fuel codes.1 with
      | none => none
      | some fn =>
          match decodeCodeAux fuel codes.2 with
          | none => none
          | some arg => some (.app fn arg)

/-- One successful recursive decode of each child decodes their application. -/
theorem decodeCodeAux_app (fn arg : Term) (fuel : Nat)
    (fnDecoded : decodeCodeAux fuel fn.code = some fn)
    (argDecoded : decodeCodeAux fuel arg.code = some arg) :
    decodeCodeAux (fuel + 1) (Term.app fn arg).code =
      some (Term.app fn arg) := by
  change
    (match decodeCodeAux fuel (unpair (pair fn.code arg.code)).1 with
    | none => none
    | some parsedFn =>
        match decodeCodeAux fuel (unpair (pair fn.code arg.code)).2 with
        | none => none
        | some parsedArg => some (Term.app parsedFn parsedArg)) =
      some (Term.app fn arg)
  rw [unpair_pair]
  change
    (match decodeCodeAux fuel fn.code with
    | none => none
    | some parsedFn =>
        match decodeCodeAux fuel arg.code with
        | none => none
        | some parsedArg => some (Term.app parsedFn parsedArg)) =
      some (Term.app fn arg)
  rw [fnDecoded, argDecoded]

/-- Sufficient fuel decodes every canonical term code. -/
theorem decodeCodeAux_code (term : Term) (fuel : Nat)
    (enough : term.size ≤ fuel) :
    decodeCodeAux fuel term.code = some term := by
  induction term generalizing fuel with
  | s =>
      cases fuel with
      | zero => exact False.elim (Nat.not_succ_le_zero 0 enough)
      | succ fuel => rfl
  | app fn arg fnIH argIH =>
      cases fuel with
      | zero =>
          exact False.elim
            (Nat.not_succ_le_zero (fn.size + arg.size) enough)
      | succ fuel =>
          have fnEnough : fn.size ≤ fuel := by
            exact Nat.le_trans (Nat.le_add_right fn.size arg.size)
              (Nat.le_of_succ_le_succ enough)
          have argEnough : arg.size ≤ fuel := by
            exact Nat.le_trans (Nat.le_add_left arg.size fn.size)
              (Nat.le_of_succ_le_succ enough)
          exact decodeCodeAux_app fn arg fuel
            (fnIH fuel fnEnough) (argIH fuel argEnough)

/--
Option-valued inverse of `code`.  The structural decoder is run with the
proved canonical fuel bound, and a final re-encoding check rejects any
unsuccessful parse.  Totality for the exact Cantor coding is proved below.
-/
def decodeCode? (number : Nat) : Option Term :=
  match decodeCodeAux (2 * number + 1) number with
  | none => none
  | some term => if term.code = number then some term else none

/-- Canonical term codes round-trip through the inverse. -/
@[simp]
theorem decodeCode?_code (term : Term) : decodeCode? term.code = some term := by
  simp only [decodeCode?]
  rw [decodeCodeAux_code term (2 * term.code + 1)
    (size_le_two_code_add_one term)]
  simp only [↓reduceIte]

/-- Every successful decode re-encodes to the numeral that was supplied. -/
theorem code_eq_of_decodeCode?_eq_some {number : Nat} {term : Term}
    (decoded : decodeCode? number = some term) : term.code = number := by
  cases haux : decodeCodeAux (2 * number + 1) number with
  | none => simp [decodeCode?, haux] at decoded
  | some parsed =>
      by_cases hcode : parsed.code = number
      · simp [decodeCode?, haux, hcode] at decoded
        cases decoded
        exact hcode
      · simp [decodeCode?, haux, hcode] at decoded

/-- Exact graph of the inverse. -/
theorem decodeCode?_eq_some_iff {number : Nat} {term : Term} :
    decodeCode? number = some term ↔ term.code = number := by
  constructor
  · exact code_eq_of_decodeCode?_eq_some
  · intro encoded
    subst number
    exact decodeCode?_code term

/-- The manuscript's natural coding of bare pure-`S` terms is injective. -/
theorem code_injective : ∀ {first second : Term},
    first.code = second.code → first = second := by
  intro first second equalCodes
  have decodedEqual := congrArg decodeCode? equalCodes
  simpa only [decodeCode?_code, Option.some.injEq] using decodedEqual

/-- Every natural number is the manuscript code of a bare pure-`S` term. -/
theorem exists_term_code_eq (number : Nat) :
    ∃ term : Term, term.code = number := by
  induction number using Nat.strongRecOn with
  | ind number ih =>
      cases number with
      | zero =>
          exact ⟨.s, rfl⟩
      | succ index =>
          have paired :
              pair (unpair index).1 (unpair index).2 = index :=
            pair_unpair index
          have leftLt : (unpair index).1 < index + 1 := by
            exact Nat.lt_of_lt_of_eq
              (left_lt_pair_succ (unpair index).1 (unpair index).2)
              (congrArg (fun value => value + 1) paired)
          have rightLt : (unpair index).2 < index + 1 := by
            exact Nat.lt_of_lt_of_eq
              (right_lt_pair_succ (unpair index).1 (unpair index).2)
              (congrArg (fun value => value + 1) paired)
          rcases ih (unpair index).1 leftLt with ⟨fn, fnCode⟩
          rcases ih (unpair index).2 rightLt with ⟨arg, argCode⟩
          refine ⟨.app fn arg, ?_⟩
          calc
            code (.app fn arg) = 1 + pair fn.code arg.code :=
              code_app fn arg
            _ = 1 + pair (unpair index).1 (unpair index).2 := by
              rw [fnCode, argCode]
            _ = 1 + index := by rw [paired]
            _ = index + 1 := Nat.add_comm 1 index

/-- The manuscript term coding is surjective onto natural numbers. -/
theorem code_surjective : ∀ number, ∃ term, code term = number :=
  exists_term_code_eq

/-- The manuscript term coding is a bijection with natural numbers. -/
theorem code_bijective :
    (∀ {first second}, code first = code second → first = second) ∧
    (∀ number, ∃ term, code term = number) :=
  ⟨code_injective, code_surjective⟩

/--
At a successor code the total decoder returns an application whose child
codes are exactly the two coordinates obtained by Cantor unpairing.
-/
theorem decodeCode?_eq_some_unpair (number : Nat) :
    ∃ fn arg : Term,
      decodeCode? (number + 1) = some (.app fn arg) ∧
      fn.code = (unpair number).1 ∧
      arg.code = (unpair number).2 := by
  rcases exists_term_code_eq (unpair number).1 with ⟨fn, fnCode⟩
  rcases exists_term_code_eq (unpair number).2 with ⟨arg, argCode⟩
  refine ⟨fn, arg, ?_, fnCode, argCode⟩
  apply decodeCode?_eq_some_iff.mpr
  calc
    code (.app fn arg) = 1 + pair fn.code arg.code := code_app fn arg
    _ = 1 + pair (unpair number).1 (unpair number).2 := by
      rw [fnCode, argCode]
    _ = 1 + number := by rw [pair_unpair]
    _ = number + 1 := Nat.add_comm 1 number

/-- The `Option`-valued decoder returns a term at every natural number. -/
theorem exists_decodeCode?_eq_some (number : Nat) :
    ∃ term : Term, decodeCode? number = some term := by
  rcases exists_term_code_eq number with ⟨term, encoded⟩
  exact ⟨term, decodeCode?_eq_some_iff.mpr encoded⟩

/-- The `Option` interface is total for the exact Cantor term coding. -/
@[simp]
theorem decodeCode?_isSome (number : Nat) :
    (decodeCode? number).isSome = true := by
  rcases exists_decodeCode?_eq_some number with ⟨term, decoded⟩
  rw [decoded]
  rfl

/-! ## Predicates transported to natural codes -/

/--
A predicate on terms transported through the total, `Option`-valued decoder.
The `none` branch makes the interface robust but is unreachable for this code.
-/
def CodedLanguage (predicate : Term → Prop) (number : Nat) : Prop :=
  match decodeCode? number with
  | none => False
  | some term => predicate term

/-- The generic rejection branch is false; totality makes its premise impossible. -/
theorem not_codedLanguage_of_decodeCode?_eq_none
    (predicate : Term → Prop) {number : Nat}
    (invalid : decodeCode? number = none) :
    ¬ CodedLanguage predicate number := by
  simp [CodedLanguage, invalid]

@[simp]
theorem codedLanguage_code_iff (predicate : Term → Prop) (term : Term) :
    CodedLanguage predicate term.code ↔ predicate term := by
  simp [CodedLanguage]

end Term

end PureSFormal.PureS
