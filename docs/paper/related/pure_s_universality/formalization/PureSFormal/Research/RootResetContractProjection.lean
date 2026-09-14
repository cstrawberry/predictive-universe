import PureSFormal.Research.RootResetSelectorContract

/-! The term-valued projection of a selector contract is the result of its
actual fixed-root invocation. Successful answers perform exactly one focused
contraction; normal answers preserve the term and perform none. -/
namespace PureSFormal.Research.RootResetContractProjection
open PureSFormal.PureS
open FiniteController RootResetSelectorContract

def projectedStep? (contract : Contract) (source : Term) : Option Term :=
  match contract.select source with
  | .nf _ => none
  | .redex _ target _ => some target

theorem some_result (contract : Contract) (boundary : contract.InterInvocationState)
    (source target : Term) (selected : projectedStep? contract source = some target) :
    let final := contract.invokeRun boundary source
    runtimeHaltKind contract.haltKind final.control = some .redex ∧
      final.cursor.erase = target ∧
      runMutationCount contract.machine (contract.stoppingTime source) (contract.initial source) = 1 ∧
      source.contractAt? (cursorAddress final.cursor) = some target := by
  have agrees := contract.outcome_agrees source
  change (match contract.select source with
    | .nf _ => runtimeHaltKind contract.haltKind (contract.invokeRun boundary source).control = some .nf ∧
        (contract.invokeRun boundary source).cursor.erase = source
    | .redex address value _ => runtimeHaltKind contract.haltKind (contract.invokeRun boundary source).control = some .redex ∧
        cursorAddress (contract.invokeRun boundary source).cursor = address ∧
        (contract.invokeRun boundary source).cursor.erase = value) at agrees
  have mutations := contract.exact_mutation_count source
  cases answer : contract.select source with
  | nf normal =>
      rw [projectedStep?, answer] at selected
      cases selected
  | redex address value contracts =>
      rw [projectedStep?, answer] at selected
      have equal := Option.some.inj selected
      subst target
      rw [answer] at agrees mutations
      exact ⟨agrees.1, agrees.2.2, mutations, agrees.2.1 ▸ contracts⟩

theorem none_result (contract : Contract) (boundary : contract.InterInvocationState)
    (source : Term) (selected : projectedStep? contract source = none) :
    let final := contract.invokeRun boundary source
    runtimeHaltKind contract.haltKind final.control = some .nf ∧
      AddressNormal source ∧ final.cursor.erase = source ∧
      runMutationCount contract.machine (contract.stoppingTime source) (contract.initial source) = 0 := by
  have agrees := contract.outcome_agrees source
  change (match contract.select source with
    | .nf _ => runtimeHaltKind contract.haltKind (contract.invokeRun boundary source).control = some .nf ∧
        (contract.invokeRun boundary source).cursor.erase = source
    | .redex address value _ => runtimeHaltKind contract.haltKind (contract.invokeRun boundary source).control = some .redex ∧
        cursorAddress (contract.invokeRun boundary source).cursor = address ∧
        (contract.invokeRun boundary source).cursor.erase = value) at agrees
  have mutations := contract.exact_mutation_count source
  cases answer : contract.select source with
  | nf normal =>
      rw [answer] at agrees mutations
      exact ⟨agrees.1, normal, agrees.2, mutations⟩
  | redex address value contracts =>
      rw [projectedStep?, answer] at selected
      cases selected

/-- Projection agrees with the halt tag and erased cursor of the machine,
with no source-dependent control value or external result oracle. -/
theorem projection_agrees (contract : Contract) (boundary : contract.InterInvocationState) (source : Term) :
    projectedStep? contract source =
      match runtimeHaltKind contract.haltKind (contract.invokeRun boundary source).control with
      | some .redex => some (contract.invokeRun boundary source).cursor.erase
      | _ => none := by
  cases selected : projectedStep? contract source with
  | none =>
      rw [(none_result contract boundary source selected).1]
  | some target =>
      have facts := some_result contract boundary source target selected
      rw [facts.1, facts.2.1]

theorem some_iff (contract : Contract) (boundary : contract.InterInvocationState) (source target : Term) :
    projectedStep? contract source = some target ↔
      runtimeHaltKind contract.haltKind (contract.invokeRun boundary source).control = some .redex ∧
      (contract.invokeRun boundary source).cursor.erase = target := by
  constructor
  · intro selected
    have facts := some_result contract boundary source target selected
    exact ⟨facts.1, facts.2.1⟩
  · intro result
    rw [projection_agrees contract boundary source, result.1, result.2]

theorem none_iff (contract : Contract) (boundary : contract.InterInvocationState) (source : Term) :
    projectedStep? contract source = none ↔
      runtimeHaltKind contract.haltKind (contract.invokeRun boundary source).control = some .nf := by
  constructor
  · intro selected
    exact (none_result contract boundary source selected).1
  · intro result
    rw [projection_agrees contract boundary source, result]

theorem none_iff_normal (contract : Contract) (source : Term) :
    projectedStep? contract source = none ↔ AddressNormal source := by
  constructor
  · intro selected
    exact (none_result contract () source selected).2.1
  · intro normal
    cases selected : projectedStep? contract source with
    | none => rfl
    | some target =>
        have contracted := (some_result contract () source target selected).2.2.2
        rw [normal] at contracted
        cases contracted

/-- Every invocation uses the same root start and finite runtime cover.
Successful traversals and issued moves are bounded by microticks, whose
linear coefficient belongs to the fixed contract. -/
theorem invocation_bound (contract : Contract) (source : Term) :
    contract.initial source = ⟨some contract.start, Cursor.atRoot source⟩ ∧
      (∀ state : RuntimeControl contract.Control, state ∈ runtimeStates contract.machine) ∧
      runSuccessfulEdgeMoveCount contract.machine (contract.stoppingTime source) (contract.initial source) ≤
        runMoveCount contract.machine (contract.stoppingTime source) (contract.initial source) ∧
      runMoveCount contract.machine (contract.stoppingTime source) (contract.initial source) ≤ contract.stoppingTime source ∧
      contract.stoppingTime source ≤ contract.coefficient * (source.size + 1) :=
  ⟨rfl, mem_runtimeStates contract.machine,
    runSuccessfulEdgeMoveCount_le_runMoveCount contract.machine _ _, runMoveCount_le_ticks contract.machine _ _,
    contract.stoppingTime_le source⟩

end PureSFormal.Research.RootResetContractProjection
