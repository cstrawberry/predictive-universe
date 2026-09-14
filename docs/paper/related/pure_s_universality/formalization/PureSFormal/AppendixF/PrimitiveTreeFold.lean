import PureSFormal.Computation.PrimitiveRecursiveListCode
import PureSFormal.Computation.PartialRecursive

/-! Closed primitive-recursive compilation of folds over Cantor-coded trees. -/
namespace PureSFormal.AppendixF.PrimitiveTreeFold
open PureSFormal.PureS PureSFormal.Computation
open PrimitiveRecursiveListCode (encode decode)
open PrimitiveRecursiveListCode.Program
open DeterministicTapeCode
set_option maxHeartbeats 1000000

def value (leaf : Nat) (branch : PRCode 2) : Term → Nat
  | .s => leaf
  | .app left right => branch.eval₂ (value leaf branch left) (value leaf branch right)

def history (leaf : Nat) (branch : PRCode 2) : Nat → List Nat
  | 0 => [leaf]
  | n + 1 =>
    let old := history leaf branch n
    branch.eval₂ (old.getD (n - (Term.unpair n).1) 0)
      (old.getD (n - (Term.unpair n).2) 0) :: old

theorem history_correct (leaf : Nat) (branch : PRCode 2) (n : Nat) (term : Term)
    (bound : term.code ≤ n) :
    (history leaf branch n).getD (n - term.code) 0 = value leaf branch term := by
  induction n generalizing term with
  | zero =>
    cases term with
    | s => rfl
    | app l r => simp only [Term.code] at bound; omega
  | succ n ih =>
    by_cases earlier : term.code ≤ n
    · have offset : n + 1 - term.code = (n - term.code) + 1 := by omega
      simp only [history, offset, List.getD_cons_succ]
      exact ih term earlier
    · have current : term.code = n + 1 := by omega
      rw [current, Nat.sub_self]
      simp only [history, List.getD_cons_zero]
      cases term with
      | s => simp only [Term.code] at current; omega
      | app l r =>
        have pairEq : Term.pair l.code r.code = n := by
          simp only [Term.code] at current
          omega
        rw [← pairEq, Term.unpair_pair]
        rw [pairEq, ih l (by have := Term.code_left_lt_app l r; omega),
          ih r (by have := Term.code_right_lt_app l r; omega)]
        rfl

def historyStep (branch : PRCode 2) : PRCode 2 :=
  let child (projection : PRCode 1) := PRCode.composeBinary lookup (.projection 1)
    (PRCode.composeBinary PRCode.truncatedSubtraction (.projection 0)
      (PRCode.composeUnary projection (.projection 0)))
  PRCode.composeBinary cons (PRCode.composeBinary branch (child PRCode.cantorLeft)
    (child PRCode.cantorRight)) (.projection 1)

theorem historyStep_correct (branch : PRCode 2) (n : Nat) (old : List Nat) :
    (historyStep branch).eval₂ n (encode old) =
      encode (branch.eval₂ (old.getD (n - (Term.unpair n).1) 0)
        (old.getD (n - (Term.unpair n).2) 0) :: old) := by
  simp only [historyStep, eval₂_composeBinary, eval₂_composeUnary,
    eval₂_projection_zero, eval₂_projection_one, PRCode.eval₂_truncatedSubtraction,
    eval₁_cantorLeft_eq_unpair_fst, eval₁_cantorRight_eq_unpair_snd, eval_lookup,
    PrimitiveRecursiveListCode.decode_encode, eval_cons, PrimitiveRecursiveListCode.encode_cons]

def historyProgram (leaf : Nat) (branch : PRCode 2) : PRCode 1 :=
  .recursion (PRCode.constant 0 (encode [leaf])) (historyStep branch)

theorem historyProgram_correct (leaf : Nat) (branch : PRCode 2) (n : Nat) :
    (historyProgram leaf branch).eval₁ n = encode (history leaf branch n) := by
  induction n with
  | zero => exact PRCode.eval_constant _ _ _
  | succ n ih =>
    change (historyStep branch).eval₂ n ((historyProgram leaf branch).eval₁ n) = _
    rw [ih, historyStep_correct]
    rfl

def program (leaf : Nat) (branch : PRCode 2) : PRCode 1 :=
  PRCode.composeUnary head (historyProgram leaf branch)

theorem program_correct (leaf : Nat) (branch : PRCode 2) (term : Term) :
    (program leaf branch).eval₁ term.code = value leaf branch term := by
  rw [program, eval₁_composeUnary, historyProgram_correct, eval_head_encode]
  have correct := history_correct leaf branch term.code term (Nat.le_refl _)
  simp only [Nat.sub_self] at correct
  cases h : history leaf branch term.code <;> simpa [h] using correct

end PureSFormal.AppendixF.PrimitiveTreeFold
