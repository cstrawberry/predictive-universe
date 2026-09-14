import PureSFormal.CostModel.EdgeCopy

/-!
# Exact path privatization

The construction copies every node reached at a nonempty prefix of a supplied
root address.  Since the identifier type changes at every allocation,
`CopySteps` is deliberately heterogeneous: its indices expose the exact
sequence of concrete `edgeCopy` arenas to Lean's kernel.
-/

namespace PureSFormal.CostModel

open PureSFormal.PureS

/-- An exact heterogeneous trace of concrete one-allocation edge copies. -/
inductive CopySteps :
    (ι : Type) → Arena ι → (κ : Type) → Arena κ → Nat → Prop
  | refl (arena : Arena ι) : CopySteps ι arena ι arena 0
  | cons {arena : Arena ι} [DecidableEq ι]
      {parent child : ι} (edge : IncomingEdge arena parent child)
      {finalArena : Arena κ} {steps : Nat}
      (tail : CopySteps (CopyId ι) (arena.edgeCopy parent child edge)
        κ finalArena steps) :
      CopySteps ι arena κ finalArena (steps + 1)

/-- Exact propositional result of privatizing `address` with `copies`
concrete edge-copy allocations. -/
def PrivatizationResult
    (before : Arena ι) (address : Address) (copies : Nat) : Prop :=
  ∃ (Node : Type) (nodeDecEq : DecidableEq Node)
    (arena : Arena Node) (target : Node),
    CopySteps ι before Node arena copies ∧
    arena.rootReadback = before.rootReadback ∧
    arena.follow? arena.root address = some target ∧
    (∀ otherAddress,
      arena.follow? arena.root otherAddress = some target →
        otherAddress = address)

namespace Arena

variable {ι : Type} [DecidableEq ι]

/-- The root of an acyclic arena occurs only at the empty address. -/
theorem root_occurrence_unique
    (arena : Arena ι) (address : Address)
    (walk : arena.follow? arena.root address = some arena.root) :
    address = [] := by
  cases address with
  | nil => rfl
  | cons direction rest =>
      have decrease := arena.rank_lt_of_follow?_cons walk
      exact (Nat.lt_irrefl _ decrease).elim

/-- Internal form of path privatization, starting from a node already known
to have the unique root-relative address `pathHead`. -/
theorem privatizeFrom
    (arena : Arena ι) (parent : ι)
    (pathHead suffix : Address) (selected : PureS.Term)
    (parentAt : arena.follow? arena.root pathHead = some parent)
    (parentUnique : ∀ otherAddress,
      arena.follow? arena.root otherAddress = some parent →
        otherAddress = pathHead)
    (selectedAt : (arena.readback parent).subterm? suffix = some selected) :
    PrivatizationResult arena (pathHead ++ suffix) suffix.length := by
  induction suffix generalizing ι arena parent pathHead with
  | nil =>
      refine ⟨ι, inferInstance, arena, parent, CopySteps.refl arena, rfl, ?_, ?_⟩
      · simpa using parentAt
      · intro otherAddress walk
        simpa using parentUnique otherAddress walk
  | cons direction rest ih =>
      cases parentCell : arena.cell parent with
      | s =>
          rw [arena.readback_of_cell_s parentCell] at selectedAt
          cases direction <;> simp [PureS.Term.subterm?] at selectedAt
      | app fn arg =>
          rw [arena.readback_of_cell_app parentCell] at selectedAt
          cases direction with
          | left =>
              have childSelected :
                  (arena.readback fn).subterm? rest = some selected := by
                simpa only [PureS.Term.subterm?] using selectedAt
              let edge : IncomingEdge arena parent fn := .left arg parentCell
              let copied := arena.edgeCopy parent fn edge
              have parentAtCopied :
                  copied.follow? copied.root pathHead = some (.inl parent) := by
                exact arena.edgeCopy_follow_parent parent fn edge pathHead parentAt
              have parentUniqueCopied : ∀ otherAddress,
                  copied.follow? copied.root otherAddress = some (.inl parent) →
                    otherAddress = pathHead := by
                intro otherAddress walk
                exact parentUnique otherAddress
                  (arena.edgeCopy_follow_parent_reflect parent fn edge
                    otherAddress walk)
              have freshAt :
                  copied.follow? copied.root
                    (pathHead ++ [Direction.left]) = some (.inr ()) := by
                simpa [edge, IncomingEdge.direction] using
                  arena.edgeCopy_follow_fresh parent fn edge pathHead parentAt
              have freshUnique : ∀ otherAddress,
                  copied.follow? copied.root otherAddress = some (.inr ()) →
                    otherAddress = pathHead ++ [Direction.left] := by
                intro otherAddress walk
                have incoming := arena.edgeCopy_uniqueIncoming_fresh parent fn edge
                simpa [edge, IncomingEdge.direction] using
                  incoming.child_occurrence_unique pathHead parentUniqueCopied
                    otherAddress walk
              have copiedSelected :
                  (copied.readback (.inr ())).subterm? rest = some selected := by
                rw [arena.edgeCopy_readback_fresh parent fn edge]
                exact childSelected
              letI : DecidableEq (CopyId ι) := inferInstance
              have recursive := ih copied (.inr ())
                (pathHead ++ [Direction.left]) freshAt freshUnique copiedSelected
              rcases recursive with
                ⟨Node, nodeDecEq, finalArena, target, tailCopies,
                  finalReadback, targetAt, targetUnique⟩
              refine ⟨Node, nodeDecEq, finalArena, target, ?_, ?_, ?_, ?_⟩
              · exact CopySteps.cons edge tailCopies
              · exact finalReadback.trans
                  (arena.edgeCopy_rootReadback parent fn edge)
              · simpa [List.append_assoc] using targetAt
              · intro otherAddress walk
                simpa [List.append_assoc] using targetUnique otherAddress walk
          | right =>
              have childSelected :
                  (arena.readback arg).subterm? rest = some selected := by
                simpa only [PureS.Term.subterm?] using selectedAt
              let edge : IncomingEdge arena parent arg := .right fn parentCell
              let copied := arena.edgeCopy parent arg edge
              have parentAtCopied :
                  copied.follow? copied.root pathHead = some (.inl parent) := by
                exact arena.edgeCopy_follow_parent parent arg edge pathHead parentAt
              have parentUniqueCopied : ∀ otherAddress,
                  copied.follow? copied.root otherAddress = some (.inl parent) →
                    otherAddress = pathHead := by
                intro otherAddress walk
                exact parentUnique otherAddress
                  (arena.edgeCopy_follow_parent_reflect parent arg edge
                    otherAddress walk)
              have freshAt :
                  copied.follow? copied.root
                    (pathHead ++ [Direction.right]) = some (.inr ()) := by
                simpa [edge, IncomingEdge.direction] using
                  arena.edgeCopy_follow_fresh parent arg edge pathHead parentAt
              have freshUnique : ∀ otherAddress,
                  copied.follow? copied.root otherAddress = some (.inr ()) →
                    otherAddress = pathHead ++ [Direction.right] := by
                intro otherAddress walk
                have incoming := arena.edgeCopy_uniqueIncoming_fresh parent arg edge
                simpa [edge, IncomingEdge.direction] using
                  incoming.child_occurrence_unique pathHead parentUniqueCopied
                    otherAddress walk
              have copiedSelected :
                  (copied.readback (.inr ())).subterm? rest = some selected := by
                rw [arena.edgeCopy_readback_fresh parent arg edge]
                exact childSelected
              letI : DecidableEq (CopyId ι) := inferInstance
              have recursive := ih copied (.inr ())
                (pathHead ++ [Direction.right]) freshAt freshUnique copiedSelected
              rcases recursive with
                ⟨Node, nodeDecEq, finalArena, target, tailCopies,
                  finalReadback, targetAt, targetUnique⟩
              refine ⟨Node, nodeDecEq, finalArena, target, ?_, ?_, ?_, ?_⟩
              · exact CopySteps.cons edge tailCopies
              · exact finalReadback.trans
                  (arena.edgeCopy_rootReadback parent arg edge)
              · simpa [List.append_assoc] using targetAt
              · intro otherAddress walk
                simpa [List.append_assoc] using targetUnique otherAddress walk

/-- Copy every node at a nonempty prefix of a supplied successful root
address.  The result uses exactly `address.length` concrete one-allocation
copies, preserves root readback, and gives the endpoint exactly one reachable
occurrence, at that address.  At the empty address the construction performs
zero copies and selects the root. -/
theorem privatize
    (arena : Arena ι) (address : Address) (selected : PureS.Term)
    (selectedAt : arena.rootReadback.subterm? address = some selected) :
    PrivatizationResult arena address address.length := by
  have rootAt : arena.follow? arena.root [] = some arena.root := rfl
  have rootUnique : ∀ otherAddress,
      arena.follow? arena.root otherAddress = some arena.root →
        otherAddress = [] := by
    intro otherAddress walk
    exact arena.root_occurrence_unique otherAddress walk
  simpa [rootReadback] using arena.privatizeFrom arena.root [] address selected
    rootAt rootUnique selectedAt

/-- If a node's unfolded subtree contains no occurrence of `redexNode`, its
complete development at that arena node is unchanged. -/
theorem develop_eq_readback_of_no_occurrence
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) (node : ι)
    (absent : ∀ address,
      arena.follow? node address ≠ some redexNode) :
    arena.develop redexNode view node = arena.readback node := by
  have nodeNe : node ≠ redexNode := by
    intro same
    subst node
    exact absent [] rfl
  rw [develop]
  simp only [nodeNe, ↓reduceIte]
  cases hcell : arena.cell node with
  | s => rw [arena.readback_of_cell_s hcell]
  | app fn arg =>
      rw [arena.readback_of_cell_app hcell]
      change PureS.Term.app (arena.develop redexNode view fn)
        (arena.develop redexNode view arg) =
          PureS.Term.app (arena.readback fn) (arena.readback arg)
      rw [arena.develop_eq_readback_of_no_occurrence redexNode view fn (by
          intro address walk
          exact absent (.left :: address) (by
            simpa only [follow?, hcell] using walk)),
        arena.develop_eq_readback_of_no_occurrence redexNode view arg (by
          intro address walk
          exact absent (.right :: address) (by
            simpa only [follow?, hcell] using walk))]
termination_by arena.rank node
decreasing_by
  · exact (arena.rank_decreases hcell).1
  · exact (arena.rank_decreases hcell).2

/-- When the selected arena node has exactly one occurrence below `node`,
complete development is exactly ordinary single-occurrence replacement at
that address. -/
theorem replace?_develop_of_unique_occurrence
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) (node : ι)
    (address : Address)
    (atAddress : arena.follow? node address = some redexNode)
    (unique : ∀ otherAddress,
      arena.follow? node otherAddress = some redexNode →
        otherAddress = address) :
    (arena.readback node).replace? address view.contractum =
      some (arena.develop redexNode view node) := by
  induction address generalizing node with
  | nil =>
      simp only [follow?_nil, Option.some.injEq] at atAddress
      subst node
      simp [PureS.Term.replace?, develop_at_redex]
  | cons direction rest ih =>
      cases hcell : arena.cell node with
      | s => cases direction <;> simp [follow?, hcell] at atAddress
      | app fn arg =>
          have nodeNe : node ≠ redexNode := by
            intro same
            subst node
            have rootOccurrence : arena.follow? redexNode [] = some redexNode := rfl
            have impossible := unique [] rootOccurrence
            simp at impossible
          rw [arena.readback_of_cell_app hcell]
          rw [develop]
          simp only [nodeNe, ↓reduceIte, hcell]
          rw [hcell]
          cases direction with
          | left =>
              have childAt : arena.follow? fn rest = some redexNode := by
                simpa only [follow?, hcell] using atAddress
              have childUnique : ∀ otherAddress,
                  arena.follow? fn otherAddress = some redexNode →
                    otherAddress = rest := by
                intro otherAddress walk
                have rootWalk :
                    arena.follow? node (.left :: otherAddress) =
                      some redexNode := by
                  simpa only [follow?, hcell] using walk
                exact (List.cons.inj (unique (.left :: otherAddress) rootWalk)).2
              have otherAbsent : ∀ otherAddress,
                  arena.follow? arg otherAddress ≠ some redexNode := by
                intro otherAddress walk
                have rootWalk :
                    arena.follow? node (.right :: otherAddress) =
                      some redexNode := by
                  simpa only [follow?, hcell] using walk
                have impossible := unique (.right :: otherAddress) rootWalk
                simp at impossible
              have replaced := ih fn childAt childUnique
              have unchanged := arena.develop_eq_readback_of_no_occurrence
                redexNode view arg otherAbsent
              change (do
                let fn' ← (arena.readback fn).replace? rest view.contractum
                pure (PureS.Term.app fn' (arena.readback arg))) =
                  some (PureS.Term.app (arena.develop redexNode view fn)
                    (arena.develop redexNode view arg))
              rw [replaced, unchanged]
              rfl
          | right =>
              have childAt : arena.follow? arg rest = some redexNode := by
                simpa only [follow?, hcell] using atAddress
              have childUnique : ∀ otherAddress,
                  arena.follow? arg otherAddress = some redexNode →
                    otherAddress = rest := by
                intro otherAddress walk
                have rootWalk :
                    arena.follow? node (.right :: otherAddress) =
                      some redexNode := by
                  simpa only [follow?, hcell] using walk
                exact (List.cons.inj (unique (.right :: otherAddress) rootWalk)).2
              have otherAbsent : ∀ otherAddress,
                  arena.follow? fn otherAddress ≠ some redexNode := by
                intro otherAddress walk
                have rootWalk :
                    arena.follow? node (.left :: otherAddress) =
                      some redexNode := by
                  simpa only [follow?, hcell] using walk
                have impossible := unique (.left :: otherAddress) rootWalk
                simp at impossible
              have replaced := ih arg childAt childUnique
              have unchanged := arena.develop_eq_readback_of_no_occurrence
                redexNode view fn otherAbsent
              change (do
                let arg' ← (arena.readback arg).replace? rest view.contractum
                pure (PureS.Term.app (arena.readback fn) arg')) =
                  some (PureS.Term.app (arena.develop redexNode view fn)
                    (arena.develop redexNode view arg))
              rw [replaced, unchanged]
              rfl

/-- A redex-shaped unfolded node exposes the corresponding four graph cells. -/
theorem exists_redexView_of_readback_eq_redex
    (arena : Arena ι) (node : ι) (x y z : PureS.Term)
    (readbackEq : arena.readback node = PureS.Term.redex x y z) :
    ∃ view : RedexView arena node,
      view.contractum = PureS.Term.contractum x y z := by
  cases rootCell : arena.cell node with
  | s =>
      rw [arena.readback_of_cell_s rootCell] at readbackEq
      contradiction
  | app secondSpine zNode =>
      rw [arena.readback_of_cell_app rootCell] at readbackEq
      injection readbackEq with secondEq zEq
      cases secondCell : arena.cell secondSpine with
      | s =>
          rw [arena.readback_of_cell_s secondCell] at secondEq
          contradiction
      | app firstSpine yNode =>
          rw [arena.readback_of_cell_app secondCell] at secondEq
          injection secondEq with firstEq yEq
          cases firstCell : arena.cell firstSpine with
          | s =>
              rw [arena.readback_of_cell_s firstCell] at firstEq
              contradiction
          | app sNode xNode =>
              rw [arena.readback_of_cell_app firstCell] at firstEq
              injection firstEq with sEq xEq
              cases sCell : arena.cell sNode with
              | s =>
                  refine ⟨{
                    sNode := sNode
                    firstSpine := firstSpine
                    secondSpine := secondSpine
                    x := xNode
                    y := yNode
                    z := zNode
                    atRoot := rootCell
                    atSecond := secondCell
                    atFirst := firstCell
                    atS := sCell
                  }, ?_⟩
                  simp [RedexView.contractum, xEq, yEq, zEq]
              | app sFn sArg =>
                  rw [arena.readback_of_cell_app sCell] at sEq
                  contradiction

/-- Exact graph witness for one supplied address-level ordinary contraction.
The copy prefix has length `address.length`; the following concrete shared
contraction is the one additional graph mutation. -/
def AddressedContractionLift
    (before : Arena ι) (address : Address) (targetTerm : PureS.Term) : Prop :=
  ∃ (Node : Type) (nodeDecEq : DecidableEq Node)
    (copied : Arena Node) (redexNode : Node)
    (view : RedexView copied redexNode),
    CopySteps ι before Node copied address.length ∧
    copied.rootReadback = before.rootReadback ∧
    copied.follow? copied.root address = some redexNode ∧
    (∀ otherAddress,
      copied.follow? copied.root otherAddress = some redexNode →
        otherAddress = address) ∧
    (copied.contract redexNode view).rootReadback = targetTerm

/-- Privatization followed by the concrete two-allocation shared contraction
lifts exactly one supplied ordinary address contraction. -/
theorem lift_addressed_contraction
    (before : Arena ι) (address : Address) (targetTerm : PureS.Term)
    (step : before.rootReadback.contractAt? address = some targetTerm) :
    AddressedContractionLift before address targetTerm := by
  obtain ⟨selected, replacement, selectedAt, rootStep, replacedAt⟩ :=
    PureS.Term.contractAt?_spec step
  obtain ⟨Node, nodeDecEq, copied, redexNode, copySteps,
    copiedReadback, targetAtAddress, targetUnique⟩ :=
      before.privatize address selected selectedAt
  letI : DecidableEq Node := nodeDecEq
  have selectedReadback :
      copied.readback redexNode = selected := by
    have lookup := copied.subterm?_readback copied.root address
    rw [targetAtAddress] at lookup
    change copied.rootReadback.subterm? address =
      some (copied.readback redexNode) at lookup
    rw [copiedReadback, selectedAt] at lookup
    exact (Option.some.inj lookup).symm
  cases selected with
  | s => simp [PureS.Term.contractRoot?] at rootStep
  | app selectedFn z =>
      cases selectedFn with
      | s => simp [PureS.Term.contractRoot?] at rootStep
      | app selectedFnTwo y =>
          cases selectedFnTwo with
          | s => simp [PureS.Term.contractRoot?] at rootStep
          | app head x =>
              cases head with
              | app headFn headArg =>
                  simp [PureS.Term.contractRoot?] at rootStep
              | s =>
                  simp only [PureS.Term.contractRoot?, Option.some.injEq] at rootStep
                  subst replacement
                  obtain ⟨view, viewContractum⟩ :=
                    copied.exists_redexView_of_readback_eq_redex
                      redexNode x y z selectedReadback
                  have developedReplacement :=
                    copied.replace?_develop_of_unique_occurrence
                      redexNode view copied.root address
                      targetAtAddress targetUnique
                  have copiedReplacement :
                      copied.rootReadback.replace? address
                          view.contractum =
                        some targetTerm := by
                    rw [copiedReadback, viewContractum]
                    exact replacedAt
                  have developedEq :
                      copied.develop redexNode view copied.root = targetTerm := by
                    exact PureS.Term.replace?_deterministic
                      developedReplacement copiedReplacement
                  refine ⟨Node, nodeDecEq, copied, redexNode, view,
                    copySteps, copiedReadback, targetAtAddress, targetUnique, ?_⟩
                  change
                    (copied.contract redexNode view).readback
                        (Sum.inl copied.root) = targetTerm
                  rw [copied.contract_readback_eq_develop
                    redexNode view copied.root]
                  exact developedEq

end Arena

end PureSFormal.CostModel
