import PureSFormal.CostModel.SharedArena

/-!
# Shared contraction as complete development

`develop` replaces every occurrence of one arena node by the contractum of a
fixed graph-redex view.  Because child ranks decrease, this is a finite term.
The central theorem proves that this simultaneous readback transformation is
reachable by ordinary contextual pure-S contractions.  A second theorem
shows that any well-founded arena mutation with exactly this one-node effect
has `develop` as its readback.
-/

namespace PureSFormal.CostModel

open PureSFormal.PureS

namespace Arena

variable {ι : Type} [DecidableEq ι]

/-- Simultaneously contract every occurrence of `redexNode` below `node`. -/
def develop
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) (node : ι) : PureS.Term :=
  if node = redexNode then
    view.contractum
  else
    match h : arena.cell node with
    | .s => .s
    | .app fn arg =>
        .app (develop arena redexNode view fn)
          (develop arena redexNode view arg)
termination_by arena.rank node
decreasing_by
  · exact (arena.rank_decreases h).1
  · exact (arena.rank_decreases h).2

@[simp]
theorem develop_at_redex
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) :
    arena.develop redexNode view redexNode = view.contractum := by
  simp [develop]

/-- The recursive simultaneous development is an ordinary finite pure-S
reduction. -/
theorem readback_steps_develop
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) (node : ι) :
    PureS.Steps (arena.readback node) (arena.develop redexNode view node) := by
  by_cases atRedex : node = redexNode
  · subst node
    rw [view.readback_eq_redex]
    rw [develop_at_redex]
    exact PureS.Steps.single (PureS.Step.root _ _ _)
  · rw [develop]
    simp only [atRedex, ↓reduceIte]
    cases hcell : arena.cell node with
    | s =>
        rw [arena.readback_of_cell_s hcell]
        exact .refl _
    | app fn arg =>
        rw [arena.readback_of_cell_app hcell]
        have leftSteps := arena.readback_steps_develop redexNode view fn
        have rightSteps := arena.readback_steps_develop redexNode view arg
        have first :
            PureS.Steps
              (.app (arena.readback fn) (arena.readback arg))
              (.app (arena.develop redexNode view fn) (arena.readback arg)) :=
          leftSteps.inContext (.appLeft .hole (arena.readback arg))
        have second :
            PureS.Steps
              (.app (arena.develop redexNode view fn) (arena.readback arg))
              (.app (arena.develop redexNode view fn)
                (arena.develop redexNode view arg)) :=
          rightSteps.inContext (.appRight (arena.develop redexNode view fn) .hole)
        exact first.trans second
termination_by arena.rank node
decreasing_by
  · exact (arena.rank_decreases hcell).1
  · exact (arena.rank_decreases hcell).2

/-- A node of lower rank than the selected redex cannot contain an occurrence
of that redex.  Its simultaneous development is therefore unchanged. -/
theorem develop_eq_readback_of_rank_lt
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) (node : ι)
    (lower : arena.rank node < arena.rank redexNode) :
    arena.develop redexNode view node = arena.readback node := by
  have notRedex : node ≠ redexNode := by
    intro same
    subst node
    exact Nat.lt_irrefl _ lower
  rw [develop]
  simp only [notRedex, ↓reduceIte]
  cases hcell : arena.cell node with
  | s => rw [arena.readback_of_cell_s hcell]
  | app fn arg =>
      rw [arena.readback_of_cell_app hcell]
      have decreases := arena.rank_decreases hcell
      change PureS.Term.app (arena.develop redexNode view fn)
        (arena.develop redexNode view arg) =
          PureS.Term.app (arena.readback fn) (arena.readback arg)
      rw [arena.develop_eq_readback_of_rank_lt redexNode view fn
          (Nat.lt_trans decreases.1 lower),
        arena.develop_eq_readback_of_rank_lt redexNode view arg
          (Nat.lt_trans decreases.2 lower)]
termination_by arena.rank node
decreasing_by
  · exact (arena.rank_decreases hcell).1
  · exact (arena.rank_decreases hcell).2

/-- Observable contract for a concrete shared contraction.  Every cell except
the selected one retains its two outgoing edges, while the selected node's
new readback is the contractum.  Fresh allocation and rank maintenance can be
verified separately by an implementation and then discharged through this
interface. -/
structure ContractionResult
    (before after : Arena ι) (redexNode : ι)
    (view : RedexView before redexNode) : Prop where
  sameRoot : after.root = before.root
  unchanged : ∀ node, node ≠ redexNode → after.cell node = before.cell node
  contracted : after.readback redexNode = view.contractum

namespace ContractionResult

/-- Readback at every node after a shared contraction is exactly the
simultaneous development of all its old occurrences. -/
theorem readback_eq_develop
    {before after : Arena ι} {redexNode : ι}
    {view : RedexView before redexNode}
    (result : ContractionResult before after redexNode view)
    (node : ι) :
    after.readback node = before.develop redexNode view node := by
  by_cases atRedex : node = redexNode
  · subst node
    rw [develop_at_redex]
    exact result.contracted
  · rw [develop]
    simp only [atRedex, ↓reduceIte]
    cases hcell : before.cell node with
    | s =>
        have afterCell : after.cell node = .s := by
          rw [result.unchanged node atRedex, hcell]
        rw [after.readback_of_cell_s afterCell]
    | app fn arg =>
        have afterCell : after.cell node = .app fn arg := by
          rw [result.unchanged node atRedex, hcell]
        rw [after.readback_of_cell_app afterCell]
        rw [result.readback_eq_develop fn, result.readback_eq_develop arg]
termination_by before.rank node
decreasing_by
  · exact (before.rank_decreases hcell).1
  · exact (before.rank_decreases hcell).2

/-- Whole-store readback after a shared contraction is a finite ordinary
pure-S development of whole-store readback before it. -/
theorem root_steps
    {before after : Arena ι} {redexNode : ι}
    {view : RedexView before redexNode}
    (result : ContractionResult before after redexNode view) :
    PureS.Steps before.rootReadback after.rootReadback := by
  have development := before.readback_steps_develop redexNode view before.root
  have readbackEquality :
      after.rootReadback = before.develop redexNode view before.root := by
    rw [rootReadback, result.sameRoot]
    exact result.readback_eq_develop before.root
  rw [readbackEquality]
  exact development

end ContractionResult

end Arena

end PureSFormal.CostModel
