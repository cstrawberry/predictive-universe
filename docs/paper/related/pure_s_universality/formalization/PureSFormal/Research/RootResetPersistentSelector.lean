import PureSFormal.Research.RootResetPersistentRouteAFuel

/-!
# Total bare-term selector for the persistent-route grammar

The selector parses the registered active path from the whole bare term and
contracts the verified innermost saturated node returned by the composite
route classifier.  Its input contains no controller state or retained cursor.
-/

namespace PureSFormal.Research.RootResetPersistentSelector

open PureSFormal.PureS

abbrev Selection := RootResetPersistentRouteAFuel.Selection

/-- The verified root-relative selection record reconstructed from a bare term. -/
def selection?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Selection :=
  (RootResetPersistentRouteAFuel.classifyHandoff program layout term).selected?

/-- Root-relative address reconstructed from a bare term. -/
def selectAddress?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Address :=
  (selection? program layout term).map (fun selection => selection.address)

/-- Exact contractum reconstructed from a bare term. -/
def selectStep?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Term :=
  (selection? program layout term).map (fun selection => selection.target)

/-- Every returned record is the literal address-level contraction it names. -/
theorem selection?_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {source : Term} {selection : Selection}
    (selected : selection? program layout source = some selection) :
    source.contractAt? selection.address = some selection.target := by
  exact RootResetPersistentRouteAFuel.classifyHandoff_selected_contracts selected

/-- Every selected successor is one strict contextual pure-S contraction. -/
theorem selectStep?_sound
    {program : CTS.Program} {layout : ActionDispatcher program}
    {source target : Term}
    (selected : selectStep? program layout source = some target) :
    Step source target := by
  unfold selectStep? at selected
  cases selectionEq : selection? program layout source with
  | none => simp [selectionEq] at selected
  | some selection =>
      have targetEq : selection.target = target :=
        Option.some.inj (by simpa [selectionEq] using selected)
      subst target
      exact Term.contractAt?_sound (selection?_contracts selectionEq)

/-- Successful selection exposes its unique address and exact contractum. -/
theorem selectStep?_eq_some_iff
    {program : CTS.Program} {layout : ActionDispatcher program}
    {source target : Term} :
    selectStep? program layout source = some target ↔
      ∃ selection : Selection,
        selection? program layout source = some selection ∧
        selection.target = target ∧
        source.contractAt? selection.address = some target := by
  constructor
  · intro selected
    unfold selectStep? at selected
    cases selectionEq : selection? program layout source with
    | none => simp [selectionEq] at selected
    | some selection =>
        have targetEq : selection.target = target :=
          Option.some.inj (by simpa [selectionEq] using selected)
        refine ⟨selection, rfl, targetEq, ?_⟩
        simpa [targetEq] using selection?_contracts selectionEq
  · rintro ⟨selection, selectionEq, targetEq, contracts⟩
    unfold selectStep?
    rw [selectionEq]
    exact congrArg some targetEq

end PureSFormal.Research.RootResetPersistentSelector
