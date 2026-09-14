import PureSFormal.AppendixF.CodeGraph

namespace PureSFormal.AppendixF.GraphCertificates
open PureSFormal.PureS PureSFormal.Computation PartialRecursive
open PrimitiveRecursiveListCode (encode decode)
open PrimitiveRecursiveListCode.Program
open NumericPrograms IndexedCertificates CodeGraph
set_option maxHeartbeats 200000
attribute [-simp] PrimitiveRecursiveListCode.Program.eval_unary PrimitiveRecursiveListCode.Program.eval_binary

theorem eval_p0 (a b c : Nat) : (PRCode.projection (0 : Fin 3)).eval [a,b,c] = a := rfl
theorem eval_p1 (a b c : Nat) : (PRCode.projection (1 : Fin 3)).eval [a,b,c] = b := rfl
theorem eval_p2 (a b c : Nat) : (PRCode.projection (2 : Fin 3)).eval [a,b,c] = c := rfl

def mismatch (a b : PRCode arity) := sub (lit 1) (eqn a b)

@[simp] theorem mismatch_zero (a b : PRCode arity) (args : List Nat) :
    (mismatch a b).eval args = 0 ↔ a.eval args = b.eval args := by
  simp only [mismatch, eval_sub, eval_lit, eval_eqn]
  split <;> simp_all

def primitiveCheck (p : PRCode arity) : PRCode 3 := mismatch (app1 (readProgram p) (.projection 0)) (.projection 1)

theorem primitiveCheck_correct (p : PRCode arity) (args : List Nat) (size : args.length = arity)
    (result cert : Nat) : (primitiveCheck p).eval [encode args, result, cert] = 0 ↔ p.eval args = result := by
  rw [primitiveCheck, mismatch_zero, eval_app1]
  change (readProgram p).eval₁ (encode args) = result ↔ _
  rw [readProgram_correct p args size]

def composeCheck (outer inner : PRCode 3) : PRCode 3 :=
  add (app3 inner (.projection 0) (left (.projection 2)) (left (right (.projection 2))))
    (app3 outer (cell (left (.projection 2)) (lit 0)) (.projection 1) (right (right (.projection 2))))

theorem composeCheck_correct (outer inner : PRCode 3) (args result cert : Nat) :
    (composeCheck outer inner).eval [args, result, cert] = 0 ↔
      inner.eval [args, (Term.unpair cert).1, (Term.unpair (Term.unpair cert).2).1] = 0 ∧
      outer.eval [encode [(Term.unpair cert).1], result, (Term.unpair (Term.unpair cert).2).2] = 0 := by
  simp only [composeCheck, eval_add, eval_app3, eval_left, eval_right, eval_cell, eval_lit,
    eval_projection, Nat.add_eq_zero_iff]
  rfl

def minStep (body : PRCode 3) : PRCode 3 :=
  add (app3 body (app2 append (left (.projection 0)) (cell (.projection 1) (lit 0)))
      (left (.projection 2)) (right (.projection 2)))
    (ifZero (eqn (.projection 1) (right (.projection 0)))
      (mismatch (pos (left (.projection 2))) (lit 1)) (left (.projection 2)))

theorem minStep_correct (body : PRCode 3) (args : List Nat) (result index item : Nat) :
    (minStep body).eval [Term.pair (encode args) result, index, item] = 0 ↔
      body.eval [encode (args ++ [index]), (Term.unpair item).1, (Term.unpair item).2] = 0 ∧
      (if index = result then (Term.unpair item).1 = 0 else (Term.unpair item).1 ≠ 0) := by
  simp only [minStep, eval_add, Nat.add_eq_zero_iff, eval_app3, eval_app2, eval_left, eval_right,
    eval_cell, eval_lit, eval_ifZero, eval_eqn, eval_p0, eval_p1, eval_p2, Term.unpair_pair]
  change ((body.eval [append.eval₂ (encode args) (encode [index]), (Term.unpair item).1,
    (Term.unpair item).2] = 0) ∧
      (if (if index = result then 1 else 0) = 0 then
        (mismatch (pos (left (.projection 2))) (lit 1)).eval [Term.pair (encode args) result, index, item]
        else (Term.unpair item).1) = 0) ↔ _
  rw [eval_append, PrimitiveRecursiveListCode.decode_encode, PrimitiveRecursiveListCode.decode_encode]
  by_cases same : index = result
  · simp [same]
  · simp only [same, if_false, if_true]
    rw [mismatch_zero]
    simp only [eval_pos, eval_left, eval_projection]
    change (_ ∧ (if (Term.unpair item).1 = 0 then 0 else 1) = 1) ↔ _
    by_cases zero : (Term.unpair item).1 = 0 <;> simp [zero]

def minimizeCheck (body : PRCode 3) : PRCode 3 :=
  add (mismatch (app1 length (.projection 2)) (add (.projection 1) (lit 1)))
    (app3 (allProgram (minStep body)) (pair (.projection 0) (.projection 1)) (.projection 2) (lit 0))

theorem minimizeCheck_correct (body : PRCode 3) (args : List Nat) (result cert : Nat) :
    (minimizeCheck body).eval [encode args, result, cert] = 0 ↔
      (decode cert).length = result + 1 ∧ ∀ i, i < (decode cert).length →
        body.eval [encode (args ++ [i]), (Term.unpair ((decode cert).getD i 0)).1,
          (Term.unpair ((decode cert).getD i 0)).2] = 0 ∧
        (if i = result then (Term.unpair ((decode cert).getD i 0)).1 = 0
          else (Term.unpair ((decode cert).getD i 0)).1 ≠ 0) := by
  rw [minimizeCheck, eval_add, Nat.add_eq_zero_iff, mismatch_zero, eval_app1, eval_add,
    eval_lit, eval_app3, eval_pair, eval_lit]
  change (length.eval₁ cert = result + 1 ∧
    (allProgram (minStep body)).eval [Term.pair (encode args) result, cert, 0] = 0) ↔ _
  rw [eval_length, ← PrimitiveRecursiveListCode.encode_decode cert, allProgram_correct,
    PrimitiveRecursiveListCode.decode_encode, sumFrom_zero_iff]
  simp only [Nat.zero_add, minStep_correct]

def program : {arity : Nat} → Code arity → PRCode 3
  | _, .primitive p => primitiveCheck p
  | _, .composeUnary outer inner => composeCheck (program outer) (program inner)
  | _, .minimize body => minimizeCheck (program body)

theorem program_correct (p : Code arity) (args : List Nat) (size : args.length = arity) (result : Nat) :
    Evaluates p args result ↔ ∃ cert, (program p).eval [encode args, result, cert] = 0 := by
  induction p generalizing args result with
  | primitive p =>
    change p.eval args = result ↔ ∃ cert, (primitiveCheck p).eval [encode args, result, cert] = 0
    simp only [primitiveCheck_correct p args size]
    constructor
    · intro h; exact ⟨0, h⟩
    · rintro ⟨_, h⟩; exact h
  | composeUnary outer inner outerIH innerIH =>
    constructor
    · rintro ⟨middle, innerGraph, outerGraph⟩
      obtain ⟨icert, ivalid⟩ := (innerIH args size middle).mp innerGraph
      obtain ⟨ocert, ovalid⟩ := (outerIH [middle] rfl result).mp outerGraph
      refine ⟨Term.pair middle (Term.pair icert ocert), ?_⟩
      change (composeCheck (program outer) (program inner)).eval _ = 0
      rw [composeCheck_correct]
      simpa only [Term.unpair_pair] using And.intro ivalid ovalid
    · rintro ⟨cert, valid⟩
      obtain ⟨ivalid, ovalid⟩ := (composeCheck_correct _ _ _ _ _).mp valid
      exact ⟨(Term.unpair cert).1, (innerIH args size _).mpr ⟨_, ivalid⟩,
        (outerIH [_] rfl result).mpr ⟨_, ovalid⟩⟩
  | @minimize arity body bodyIH =>
    have take : args.take arity = args := List.take_of_length_le (by omega)
    have argSize : ∀ i, (args ++ [i]).length = arity + 1 := by intro i; simp [size]
    constructor
    · rintro ⟨current, before⟩
      rw [take] at current before
      have witnesses : ∀ i, i < result + 1 → ∃ item,
          (minStep (program body)).eval [Term.pair (encode args) result, i, item] = 0 := by
        intro i hi
        by_cases same : i = result
        · subst i
          obtain ⟨cert, valid⟩ := (bodyIH _ (argSize result) 0).mp current
          refine ⟨Term.pair 0 cert, (minStep_correct _ _ _ _ _).mpr ?_⟩
          simpa using And.intro valid (show (0 : Nat) = 0 from rfl)
        · obtain ⟨value, nonzero, graph⟩ := before i (by omega)
          obtain ⟨cert, valid⟩ := (bodyIH _ (argSize i) value).mp graph
          refine ⟨Term.pair value cert, (minStep_correct _ _ _ _ _).mpr ?_⟩
          simpa only [Term.unpair_pair, if_neg same] using And.intro valid nonzero
      obtain ⟨items, itemSize, valid⟩ := finite_witnesses _ (result + 1) witnesses
      refine ⟨encode items, (minimizeCheck_correct _ _ _ _).mpr ?_⟩
      rw [PrimitiveRecursiveListCode.decode_encode]
      refine ⟨itemSize, ?_⟩
      intro i hi
      exact (minStep_correct _ _ _ _ _).mp (valid i (by omega))
    · rintro ⟨cert, checked⟩
      obtain ⟨len, valid⟩ := (minimizeCheck_correct _ _ _ _).mp checked
      change Evaluates body (args.take arity ++ [result]) 0 ∧ _
      rw [take]
      refine ⟨?_, ?_⟩
      · obtain ⟨bodyValid, zero⟩ := valid result (by omega)
        have same : (Term.unpair ((decode cert).getD result 0)).1 = 0 := by simpa using zero
        apply (bodyIH _ (argSize result) 0).mpr
        exact ⟨_, same ▸ bodyValid⟩
      · intro i hi
        obtain ⟨bodyValid, nonzero⟩ := valid i (by omega)
        exact ⟨_, by simpa [show i ≠ result by omega] using nonzero,
          (bodyIH _ (argSize i) _).mpr ⟨_, bodyValid⟩⟩

end PureSFormal.AppendixF.GraphCertificates
