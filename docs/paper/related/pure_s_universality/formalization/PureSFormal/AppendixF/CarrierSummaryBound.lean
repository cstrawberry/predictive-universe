import PureSFormal.AppendixF.Carrier

namespace PureSFormal.AppendixF.FiniteTables

theorem flatMap_length_constant (xs : List A) (f : A → List B) (n : Nat)
    (size : ∀ x ∈ xs, (f x).length = n) : (xs.flatMap f).length = xs.length * n := by
  induction xs with
  | nil => simp
  | cons first rest ih =>
    rw [List.flatMap_cons, List.length_append, size first (List.Mem.head _),
      ih (fun x mem => size x (List.Mem.tail _ mem)), List.length_cons]
    simp [Nat.add_mul, Nat.add_comm]

theorem assignments_length [DecidableEq A] (fallback : B) (codomain : List B) (domain : List A) :
    (assignments fallback codomain domain).length = codomain.length ^ domain.length := by
  induction domain with
  | nil => simp [assignments]
  | cons first rest ih =>
    rw [assignments, flatMap_length_constant _ _ (codomain.length ^ rest.length)
      (fun b _ => by simp only [List.length_map, ih]), List.length_cons, Nat.pow_succ]
    exact Nat.mul_comm _ _

theorem functions_length [DecidableEq A] (domain : Enumeration A) (codomain : Enumeration B) (fallback : B) :
    (functions domain codomain fallback).values.length = codomain.values.length ^ domain.values.length :=
  assignments_length _ _ _

theorem product_length (left : Enumeration A) (right : Enumeration B) :
    (product left right).values.length = left.values.length * right.values.length :=
  flatMap_length_constant _ _ _ (fun _ _ => List.length_map _)

theorem transport_length (enumeration : Enumeration B) (encode : A → B) (decode : B → A)
    (inverse : ∀ a, decode (encode a) = a) :
    (transport enumeration encode decode inverse).values.length = enumeration.values.length := List.length_map _

end PureSFormal.AppendixF.FiniteTables

namespace PureSFormal.AppendixF.Carrier
open PureSFormal.Research.FiniteTreeAutomatonPowerset

/-- The displayed F.3.1 bound. With a duplicate-free cover, its length is |Q|.
    The executable enumeration also works with repeated states. -/
theorem Summary.enumeration_bound [DecidableEq State] (a : Deterministic State) :
    (Summary.enumeration a).values.length =
      a.cover.length ^ (3 + a.cover.length ^ 2) * 2 ^ (a.cover.length ^ 2) := by
  simp only [Summary.enumeration, FiniteTables.transport_length, FiniteTables.product_length,
    FiniteTables.functions_length]
  change a.cover.length * (a.cover.length * (a.cover.length *
    ((a.cover.length ^ a.cover.length) ^ a.cover.length * (2 ^ a.cover.length) ^ a.cover.length))) = _
  rw [← Nat.pow_mul, ← Nat.pow_mul, Nat.pow_two, Nat.pow_add]
  simp [Nat.pow_succ, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]

end PureSFormal.AppendixF.Carrier
