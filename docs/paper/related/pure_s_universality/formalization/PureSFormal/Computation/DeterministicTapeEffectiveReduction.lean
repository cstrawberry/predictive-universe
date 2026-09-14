import PureSFormal.Computation.CookEncodingComputability
import PureSFormal.WeakPathUniversality

/-!
# Effective reduction to the fixed marked-path event

Both predicates use the established total bijective natural numberings.
The reduction map is the literal existing tape-instance encoder, with its
closed primitive-recursive program and pointwise halting equivalence joined
in one statement. Its target is the marked event on the persistent-cursor
path, not a normal-form predicate.
-/

namespace PureSFormal.Computation.DeterministicTapeEffectiveReduction

open PureS
open Research.ProtectedTrieDeterministicCompiler

def sourcePredicate (number : Nat) : Prop :=
  DeterministicTape.Halts (DeterministicTapeCode.instanceDecodeCode number)

def targetPredicate (number : Nat) : Prop :=
  WeakPathUniversality.FixedPureSMarkedSnapshotTermEvent (Term.decodeCodeTotal number)

def encoder (number : Nat) : Nat :=
  (DeterministicTapePureS.encodeTerm (DeterministicTapeCode.instanceDecodeCode number)).code

theorem encoder_primitiveRecursive : PrimitiveRecursive encoder :=
  CookEncodingComputability.sourceTerm_primitiveRecursive

theorem encoder_reducesVia : ReducesVia encoder sourcePredicate targetPredicate := by
  intro number
  unfold sourcePredicate targetPredicate encoder
  rw [Term.decodeCodeTotal_code]
  exact WeakPathUniversality.deterministicTapeHalts_iff_fixedPureSMarkedSnapshotTermEvent _

theorem effectiveReduction :
    PartialRecursive.Computable encoder ∧ ReducesVia encoder sourcePredicate targetPredicate :=
  ⟨PrimitiveRecursive.computable encoder_primitiveRecursive, encoder_reducesVia⟩

/-- The same reduction in the standard composable computable-reduction interface. -/
def computableManyOneReduction : ComputableManyOneReduces sourcePredicate targetPredicate where
  reduction := encoder
  computable := effectiveReduction.1
  correct := effectiveReduction.2

theorem computableManyOneReduction_map (number : Nat) :
    computableManyOneReduction.reduction number = encoder number := rfl

theorem closedProgramReduction :
    ∀ number, PRCode.eval₁ CookEncodingComputability.Program.sourceTerm number = encoder number ∧
      (sourcePredicate number ↔ targetPredicate
        (PRCode.eval₁ CookEncodingComputability.Program.sourceTerm number)) := by
  intro number
  have computes := CookEncodingComputability.Program.eval_sourceTerm number
  refine ⟨computes, ?_⟩
  rw [computes]
  exact encoder_reducesVia number

end PureSFormal.Computation.DeterministicTapeEffectiveReduction
