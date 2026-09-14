import PureSFormal.AppendixF.CertificateSearch

namespace PureSFormal.AppendixF.IndexedCertificates
open PureSFormal.PureS PureSFormal.Computation
open PrimitiveRecursiveListCode (encode decode)
open PrimitiveRecursiveListCode.Program
open NumericPrograms
set_option maxHeartbeats 1000000

theorem getD_at (xs : List Nat) (i : Nat) (bound : i < xs.length) : xs.getD i 0 = xs[i] := by
  simp only [List.getD, List.getElem?_eq_getElem bound, Option.getD_some]

theorem ofFn_getD (xs : List Nat) (n : Nat) (size : xs.length = n) :
    (List.ofFn (fun i : Fin n => xs.getD i.val 0)) = xs := by
  subst n
  have same : (fun i : Fin xs.length => xs.getD i.val 0) = (fun i : Fin xs.length => xs[i.val]) :=
    funext (fun i => getD_at xs i.val i.isLt)
  rw [same]
  exact List.ofFn_getElem

def readProgram (p : PRCode arity) : PRCode 1 :=
  .composition p (fun i => get (.projection 0) (lit i.val))

theorem readProgram_correct (p : PRCode arity) (args : List Nat) (size : args.length = arity) :
    (readProgram p).eval₁ (encode args) = p.eval args := by
  change p.eval (List.ofFn (fun i => (get (.projection 0) (lit i.val)).eval [encode args])) = _
  simp only [eval_get, eval_lit, eval_projection]
  change p.eval (List.ofFn (fun i : Fin arity => (decode (encode args)).getD i.val 0)) = _
  rw [PrimitiveRecursiveListCode.decode_encode, ofFn_getD args arity size]

def sumFrom (test : Nat → Nat → Nat) : Nat → List Nat → Nat
  | _, [] => 0
  | index, first :: rest => test index first + sumFrom test (index + 1) rest

theorem sumFrom_zero_iff (test : Nat → Nat → Nat) (xs : List Nat) (start : Nat) :
    sumFrom test start xs = 0 ↔ ∀ i, i < xs.length → test (start + i) (xs.getD i 0) = 0 := by
  induction xs generalizing start with
  | nil => simp [sumFrom]
  | cons first rest ih =>
    rw [sumFrom, Nat.add_eq_zero_iff, ih]
    constructor
    · rintro ⟨head, tail⟩ i bound
      cases i with
      | zero => simpa only [Nat.add_zero, List.getD_cons_zero] using head
      | succ i =>
        simpa only [List.getD_cons_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
          tail i (by simpa using bound)
    · intro all
      refine ⟨?_, ?_⟩
      · simpa only [Nat.add_zero, List.getD_cons_zero] using all 0 (by simp)
      · intro i bound
        simpa only [List.getD_cons_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
          all (i + 1) (by simpa using bound)

def indexedStep (test : PRCode 3) : PRCode 3 :=
  pair (add (left (.projection 1)) (lit 1))
    (add (right (.projection 1)) (app3 test (.projection 0) (left (.projection 1)) (.projection 2)))

theorem indexedStep_correct (test : PRCode 3) (parameter index accumulated item : Nat) :
    (indexedStep test).eval [parameter, Term.pair index accumulated, item] =
      Term.pair (index + 1) (accumulated + test.eval [parameter, index, item]) := by
  simp [indexedStep, eval_pair, eval_add, eval_left, eval_right, eval_lit, eval_app3,
    eval_projection, List.getD_cons_zero, List.getD_cons_succ, Term.unpair_pair]

theorem indexed_fold (test : PRCode 3) (parameter : Nat) (xs : List Nat) (index accumulated : Nat) :
    xs.foldl (fun acc item => (indexedStep test).eval [parameter, acc, item])
      (Term.pair index accumulated) =
    Term.pair (index + xs.length)
      (accumulated + sumFrom (fun i item => test.eval [parameter, i, item]) index xs) := by
  induction xs generalizing index accumulated with
  | nil => simp [sumFrom]
  | cons first rest ih =>
    rw [List.foldl_cons, indexedStep_correct, ih]
    simp only [List.length_cons, sumFrom]
    congr 1 <;> omega

def allProgram (test : PRCode 3) : PRCode 3 :=
  right (app3 (foldWithParameter (indexedStep test)) (.projection 1) (.projection 0)
    (pair (.projection 2) (lit 0)))

theorem allProgram_correct (test : PRCode 3) (parameter start : Nat) (xs : List Nat) :
    (allProgram test).eval [parameter, encode xs, start] =
      sumFrom (fun i item => test.eval [parameter, i, item]) start xs := by
  simp [allProgram, eval_right, eval_app3, eval_pair, eval_lit, eval_projection,
    List.getD_cons_zero, List.getD_cons_succ, eval_foldWithParameter,
    PrimitiveRecursiveListCode.decode_encode, indexed_fold, Term.unpair_pair, Nat.zero_add]

theorem finite_witnesses (predicate : Nat → Nat → Prop) (count : Nat)
    (witnesses : ∀ i, i < count → ∃ value, predicate i value) :
    ∃ values : List Nat, values.length = count ∧ ∀ i, i < count → predicate i (values.getD i 0) := by
  induction count with
  | zero => exact ⟨[], rfl, by intro i h; omega⟩
  | succ count ih =>
    obtain ⟨values, size, valid⟩ := ih (fun i hi => witnesses i (by omega))
    obtain ⟨last, lastValid⟩ := witnesses count (by omega)
    refine ⟨values ++ [last], by simp [size], ?_⟩
    intro i bound
    by_cases earlier : i < count
    · have before : i < values.length := by omega
      rw [getD_at _ _ (by simp; omega), List.getElem_append_left before, ← getD_at values i before]
      exact valid i earlier
    · have same : i = count := by omega
      subst i
      rw [getD_at _ _ (by simp; omega), List.getElem_append_right (by omega)]
      simpa only [size, Nat.sub_self, List.getElem_cons_zero] using lastValid

end PureSFormal.AppendixF.IndexedCertificates
