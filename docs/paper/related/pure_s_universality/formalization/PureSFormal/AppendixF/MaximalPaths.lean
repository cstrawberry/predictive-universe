import PureSFormal.AppendixF.CarrierPath
import PureSFormal.AppendixF.AutomatonComputability

namespace PureSFormal.AppendixF.MaximalPaths
open PureSFormal.PureS PureSFormal.Computation
open PureSFormal.Research.FiniteTreeAutomatonPowerset

def NormalForm (term : Term) : Prop := ∀ next, ¬ Step term next

/-- Both forms of maximal native reduction; finite observations include the endpoint. -/
inductive Path (start : Term) where
  | infinite (run : Nat → Term) (initial : run 0 = start)
      (native : ∀ n, Step (run n) (run (n + 1)))
  | finite (terms : List Term) (last : Term) (native : Carrier.Trace start terms last)
      (normal : NormalForm last)

def Path.Accepts (a : Deterministic State) : Path start → Prop
  | .infinite run _ _ => ∃ n, a.accepts (run n) = true
  | .finite terms last _ _ => (∃ t ∈ terms, a.accepts t = true) ∨ a.accepts last = true

def Exact (source : Nat → Prop) (encoder : Nat → Term) (a : Deterministic State) : Prop :=
  ∀ x (path : Path (encoder x)), source x ↔ path.Accepts a

/-- Computable decidability, with a closed minimization program as witness. -/
def DecidableSet (predicate : Nat → Prop) : Prop :=
  ∃ decide : Nat → Nat, PartialRecursive.Computable decide ∧ ∀ x, predicate x ↔ decide x = 1

end PureSFormal.AppendixF.MaximalPaths
