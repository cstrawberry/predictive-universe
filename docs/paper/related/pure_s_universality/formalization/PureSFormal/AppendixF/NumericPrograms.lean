import PureSFormal.AppendixF.AutomatonComputability

namespace PureSFormal.AppendixF.NumericPrograms
open PureSFormal.PureS PureSFormal.Computation
open PrimitiveRecursiveListCode (encode decode)
open PrimitiveRecursiveListCode.Program
open DeterministicTapeCode

def lit (n : Nat) : PRCode arity := PRCode.constant arity n
def add (a b : PRCode arity) := PRCode.composeBinary PRCode.addition a b
def sub (a b : PRCode arity) := PRCode.composeBinary PRCode.truncatedSubtraction a b
def mul (a b : PRCode arity) := PRCode.composeBinary PRCode.multiplication a b
def pair (a b : PRCode arity) := PRCode.composeBinary PRCode.cantorPair a b
def left (a : PRCode arity) := PRCode.composeUnary PRCode.cantorLeft a
def right (a : PRCode arity) := PRCode.composeUnary PRCode.cantorRight a
def pred (a : PRCode arity) := PRCode.composeUnary PRCode.predecessor a
def pos (a : PRCode arity) := PRCode.composeUnary PRCode.positive a
def eqn (a b : PRCode arity) := PRCode.composeBinary PRCode.equal a b
def ifZero (test yes no : PRCode arity) := PRCode.composeTernary PRCode.branchIfZero yes no test
def cell (a b : PRCode arity) := add (pair a b) (lit 1)
def get (xs i : PRCode arity) := PRCode.composeBinary lookup xs i
def app1 (p : PRCode 1) (x : PRCode arity) := PRCode.composeUnary p x
def app2 (p : PRCode 2) (x y : PRCode arity) := PRCode.composeBinary p x y
def app3 (p : PRCode 3) (x y z : PRCode arity) := PRCode.composeTernary p x y z

@[simp] theorem eval_lit (n : Nat) (args : List Nat) : (lit (arity := arity) n).eval args = n :=
  PRCode.eval_constant _ _ _
@[simp] theorem eval_add (a b : PRCode arity) (args : List Nat) :
    (add a b).eval args = a.eval args + b.eval args := by
  simp only [add, PRCode.eval_composeBinary]; exact PRCode.eval₂_addition _ _
@[simp] theorem eval_sub (a b : PRCode arity) (args : List Nat) :
    (sub a b).eval args = a.eval args - b.eval args := by
  simp only [sub, PRCode.eval_composeBinary]; exact PRCode.eval₂_truncatedSubtraction _ _
@[simp] theorem eval_mul (a b : PRCode arity) (args : List Nat) :
    (mul a b).eval args = a.eval args * b.eval args := by
  simp only [mul, PRCode.eval_composeBinary]; exact PRCode.eval₂_multiplication _ _
@[simp] theorem eval_pair (a b : PRCode arity) (args : List Nat) :
    (pair a b).eval args = Term.pair (a.eval args) (b.eval args) := by
  simp only [pair, PRCode.eval_composeBinary]; exact eval₂_cantorPair_eq_termPair _ _
@[simp] theorem eval_left (a : PRCode arity) (args : List Nat) :
    (left a).eval args = (Term.unpair (a.eval args)).1 := by
  simp only [left, PRCode.eval_composeUnary]; exact eval₁_cantorLeft_eq_unpair_fst _
@[simp] theorem eval_right (a : PRCode arity) (args : List Nat) :
    (right a).eval args = (Term.unpair (a.eval args)).2 := by
  simp only [right, PRCode.eval_composeUnary]; exact eval₁_cantorRight_eq_unpair_snd _
@[simp] theorem eval_pred (a : PRCode arity) (args : List Nat) :
    (pred a).eval args = a.eval args - 1 := by
  simp only [pred, PRCode.eval_composeUnary]; exact PRCode.eval₁_predecessor _
@[simp] theorem eval_pos (a : PRCode arity) (args : List Nat) :
    (pos a).eval args = if a.eval args = 0 then 0 else 1 := by
  simp only [pos, PRCode.eval_composeUnary]; exact PRCode.eval₁_positive _
@[simp] theorem eval_eqn (a b : PRCode arity) (args : List Nat) :
    (eqn a b).eval args = if a.eval args = b.eval args then 1 else 0 := by
  simp only [eqn, PRCode.eval_composeBinary]; exact PRCode.eval₂_equal _ _
@[simp] theorem eval_ifZero (test yes no : PRCode arity) (args : List Nat) :
    (ifZero test yes no).eval args = if test.eval args = 0 then yes.eval args else no.eval args := by
  simp only [ifZero, PRCode.eval_composeTernary]; exact PRCode.eval_branchIfZero _ _ _
@[simp] theorem eval_cell (a b : PRCode arity) (args : List Nat) :
    (cell a b).eval args = Term.pair (a.eval args) (b.eval args) + 1 := by
  simp only [cell, eval_add, eval_pair, eval_lit]
@[simp] theorem eval_get (xs i : PRCode arity) (args : List Nat) :
    (get xs i).eval args = (decode (xs.eval args)).getD (i.eval args) 0 := by
  simp only [get, PRCode.eval_composeBinary]; exact eval_lookup _ _
@[simp] theorem eval_app1 (p : PRCode 1) (x : PRCode arity) (args : List Nat) :
    (app1 p x).eval args = p.eval₁ (x.eval args) := PRCode.eval_composeUnary _ _ _
@[simp] theorem eval_app2 (p : PRCode 2) (x y : PRCode arity) (args : List Nat) :
    (app2 p x y).eval args = p.eval₂ (x.eval args) (y.eval args) := PRCode.eval_composeBinary _ _ _ _
@[simp] theorem eval_app3 (p : PRCode 3) (x y z : PRCode arity) (args : List Nat) :
    (app3 p x y z).eval args = p.eval [x.eval args, y.eval args, z.eval args] :=
  PRCode.eval_composeTernary _ _ _ _ _

end PureSFormal.AppendixF.NumericPrograms
