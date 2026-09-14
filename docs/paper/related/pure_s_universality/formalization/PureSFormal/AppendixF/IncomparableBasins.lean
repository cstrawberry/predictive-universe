import PureSFormal.AppendixF.ClockBoundary

/-! Explicit witnesses for both strict differences in Proposition F.4.4. -/
namespace PureSFormal.AppendixF.IncomparableBasins
open PureSFormal.PureS
open PureSFormal.AppendixF.RecursiveCall
open PureSFormal.AppendixF.HeadInvariant
local infixl:70 " ⊙ " => Term.app

def NormalForm (term : Term) : Prop := ∀ next, ¬ Step term next

def CarrierBasin (term : Term) : Prop :=
  (∃ target, Steps term target ∧ NormalForm target) ∨
  ∃ target, Steps term target ∧ ∃ (context : Context) (left right : Carrier.Code),
    target = context.plug (left.term ⊙ right.term)

/-- Tables are finite, but neither their sizes nor their program lengths are
bounded globally. A witness retains the actual table and literal internal data. -/
def RecursiveBasin (term : Term) : Prop :=
  (∃ target, Steps term target ∧ NormalForm target) ∨
  ∃ target, Steps term target ∧ ∃ (n : Nat) (table : Fin n → Admissible)
    (label : Fin n) (data : Data (Fin n)) (context : Context),
    data.internal = true ∧ target = context.plug ((table label).term ⊙ data.term table)

def witnessTable : Fin 1 → Admissible := fun _ => .holds 0
def witnessLeaf : Data (Fin 1) := .leaf 0
def witnessData : Data (Fin 1) := .node witnessLeaf witnessLeaf
def recursiveWitness : Term := (Admissible.holds 0).term ⊙ witnessData.term witnessTable
def clockWitness : Term := C 0 ⊙ C 0

theorem recursiveWitness_in : RecursiveBasin recursiveWitness :=
  Or.inr ⟨recursiveWitness, .refl _, 1, witnessTable, 0, witnessData, .hole, rfl, rfl⟩

theorem recursiveWitness_out : ¬ CarrierBasin recursiveWitness := by
  let c : InternalConfiguration (Fin 1) := ⟨⟨0, witnessData, .hole⟩, rfl⟩
  have all (t : Term) (reachable : Steps recursiveWitness t) : OneRedex t ∧ NoPairs t :=
    hold_all_reducts witnessTable (fun _ => 0) (fun _ => rfl) c .hole t reachable
  intro basin
  cases basin with
  | inl normal =>
    obtain ⟨target, reachable, normal⟩ := normal
    obtain ⟨next, step⟩ := AAABoundary.head_redex target (all target reachable).1.arity
    exact normal next step
  | inr carrier =>
    obtain ⟨target, reachable, context, left, right, same⟩ := carrier
    exact (all target reachable).2.excludes context left right same

theorem clockWitness_in : CarrierBasin clockWitness :=
  Or.inr ⟨clockWitness, .refl _, .hole, .base .s .s, .base .s .s, rfl⟩

theorem clockWitness_out : ¬ RecursiveBasin clockWitness := by
  have all (t : Term) (reachable : Steps clockWitness t) : ClockBoundary.Clock t :=
    (ClockBoundary.Clock.pair 0 0).reachable reachable
  intro basin
  cases basin with
  | inl normal =>
    obtain ⟨target, reachable, normal⟩ := normal
    obtain ⟨next, step⟩ := (all target reachable).has_step
    exact normal next step
  | inr recursive =>
    obtain ⟨target, reachable, n, table, label, data, context, internal, same⟩ := recursive
    exact (all target reachable).noCalls.excludes context (table label) (data.term table) same

/-- The exact two witnesses of Proposition F.4.4. -/
theorem incomparable :
    (RecursiveBasin recursiveWitness ∧ ¬ CarrierBasin recursiveWitness) ∧
    (CarrierBasin clockWitness ∧ ¬ RecursiveBasin clockWitness) :=
  ⟨⟨recursiveWitness_in, recursiveWitness_out⟩, ⟨clockWitness_in, clockWitness_out⟩⟩

end PureSFormal.AppendixF.IncomparableBasins
