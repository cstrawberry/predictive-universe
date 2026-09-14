import PureSFormal.CostModel.SharedCostTheorem

/-!
# Counted finite shared-arena execution

This module adds the finite-store layer that is deliberately absent from the
abstract arena interface.  A `FiniteArena` carries a duplicate-free complete
list of retained identifiers.  Navigation is an executable one-edge-at-a-time
interpreter, with one charged tick per inspected edge.  Concrete edge copying
and shared contraction reuse the kernel-checked arena operations and extend
the retained store by exactly one and two records respectively.

The `reachableNodes` traversal is bounded by the root rank.  Strict rank
decrease makes that bound complete for the root-reachable part of the arena;
`liveNodes` filters the duplicate-free retained identifiers by membership in
that bounded traversal. Thus retained and live
cardinalities are finite executable quantities, including in arenas with high
fan-in sharing.
-/

namespace PureSFormal.CostModel

open PureSFormal.PureS

/-- A finite presentation of an arena.  `retained` contains every identifier
exactly once, including unreachable records retained by the store. -/
structure FiniteArena (ι : Type) where
  arena : Arena ι
  retained : List ι
  retained_nodup : retained.Nodup
  retained_complete : ∀ node : ι, node ∈ retained

namespace FiniteArena

variable {ι : Type} [DecidableEq ι]

/-- Number of records retained by the finite store. -/
def retainedCard (store : FiniteArena ι) : Nat := store.retained.length

/-- One metered result.  `ticks` counts primitive arena-edge inspections. -/
structure Metered (α : Type) where
  value : α
  ticks : Nat
  deriving Repr

/-- Follow one root-relative address, charging exactly one tick for every edge
actually inspected.  Failure stops at the first `S` leaf. -/
def navigateFrom (store : FiniteArena ι) : ι → Address → Metered (Option ι)
  | node, [] => ⟨some node, 0⟩
  | node, direction :: rest =>
      match store.arena.cell node with
      | .s => ⟨none, 1⟩
      | .app fn arg =>
          let next := match direction with
            | .left => fn
            | .right => arg
          let result := navigateFrom store next rest
          ⟨result.value, result.ticks + 1⟩

/-- Root-relative metered navigation. -/
def navigate (store : FiniteArena ι) (address : Address) :
    Metered (Option ι) :=
  store.navigateFrom store.arena.root address

@[simp]
theorem navigateFrom_value (store : FiniteArena ι) (node : ι)
    (address : Address) :
    (store.navigateFrom node address).value =
      store.arena.follow? node address := by
  induction address generalizing node with
  | nil => rfl
  | cons direction rest ih =>
      cases hcell : store.arena.cell node with
      | s => cases direction <;> simp [navigateFrom, Arena.follow?, hcell]
      | app fn arg =>
          cases direction <;>
            simp [navigateFrom, Arena.follow?, hcell, ih]

@[simp]
theorem navigate_value (store : FiniteArena ι) (address : Address) :
    (store.navigate address).value =
      store.arena.follow? store.arena.root address :=
  store.navigateFrom_value store.arena.root address

/-- Navigation never charges more than the supplied address length.  A failed
lookup may inspect one leaf after traversing a strict prefix, so the bound is
`length + 1`. -/
theorem navigateFrom_ticks_le (store : FiniteArena ι) (node : ι)
    (address : Address) :
    (store.navigateFrom node address).ticks ≤ address.length + 1 := by
  induction address generalizing node with
  | nil => simp [navigateFrom]
  | cons direction rest ih =>
      cases hcell : store.arena.cell node with
      | s => simp [navigateFrom, hcell]
      | app fn arg =>
          cases direction <;>
            simp only [navigateFrom, hcell, Metered.ticks, List.length_cons]
          · exact Nat.add_le_add_right (ih fn) 1
          · exact Nat.add_le_add_right (ih arg) 1

theorem navigate_ticks_le (store : FiniteArena ι) (address : Address) :
    (store.navigate address).ticks ≤ address.length + 1 :=
  store.navigateFrom_ticks_le store.arena.root address

/-- A successful lookup charges exactly one tick per traversed edge. -/
theorem navigateFrom_ticks_eq_length_of_some
    (store : FiniteArena ι) (node target : ι) (address : Address)
    (found : (store.navigateFrom node address).value = some target) :
    (store.navigateFrom node address).ticks = address.length := by
  induction address generalizing node with
  | nil => rfl
  | cons direction rest ih =>
      cases hcell : store.arena.cell node with
      | s =>
          cases direction <;>
            simp [navigateFrom, hcell] at found
      | app fn arg =>
          cases direction with
          | left =>
              have tailFound :
                  (store.navigateFrom fn rest).value = some target := by
                simpa [navigateFrom, hcell] using found
              simpa [navigateFrom, hcell, ih fn tailFound]
          | right =>
              have tailFound :
                  (store.navigateFrom arg rest).value = some target := by
                simpa [navigateFrom, hcell] using found
              simpa [navigateFrom, hcell, ih arg tailFound]

theorem navigate_ticks_eq_length_of_some
    (store : FiniteArena ι) (target : ι) (address : Address)
    (found : (store.navigate address).value = some target) :
    (store.navigate address).ticks = address.length :=
  store.navigateFrom_ticks_eq_length_of_some store.arena.root target address found

/-! ## Finite root-reachable enumeration -/

/-- Nodes reached by all walks of at most `fuel` edges from `node`.  Duplicate
identifiers are retained here so the recursion is definitionally simple. -/
def reachableNodesFrom (store : FiniteArena ι) : Nat → ι → List ι
  | 0, node => [node]
  | fuel + 1, node =>
      node :: match store.arena.cell node with
        | .s => []
        | .app fn arg =>
            reachableNodesFrom store fuel fn ++
              reachableNodesFrom store fuel arg

/-- Root-reachable nodes, with aliases removed.  Rank decrease implies that
`rank root` edge levels are enough to cover every root-relative occurrence. -/
def liveNodes (store : FiniteArena ι) : List ι :=
  store.retained.filter (fun node =>
    (store.reachableNodesFrom (store.arena.rank store.arena.root)
      store.arena.root).contains node)

/-- Executable root-reachable cardinality. -/
def liveCard (store : FiniteArena ι) : Nat := store.liveNodes.length

theorem mem_reachableNodesFrom_retained
    (store : FiniteArena ι) {fuel : Nat} {start node : ι}
    (membership : node ∈ store.reachableNodesFrom fuel start) :
    node ∈ store.retained :=
  store.retained_complete node

theorem liveNodes_subset_retained (store : FiniteArena ι) :
    ∀ {node : ι}, node ∈ store.liveNodes → node ∈ store.retained := by
  intro node membership
  exact store.retained_complete node

theorem liveNodes_nodup (store : FiniteArena ι) : store.liveNodes.Nodup :=
  store.retained_nodup.filter _

/-- Live records never outnumber retained records. -/
theorem liveCard_le_retainedCard (store : FiniteArena ι) :
    store.liveCard ≤ store.retainedCard := by
  unfold liveCard retainedCard liveNodes
  let predicate := fun node =>
    (store.reachableNodesFrom (store.arena.rank store.arena.root)
      store.arena.root).contains node
  have filterLength : ∀ values : List ι,
      (values.filter predicate).length ≤ values.length := by
    intro values
    induction values with
    | nil => exact Nat.le_refl 0
    | cons first rest ih =>
      simp only [List.filter_cons]
      split
      · simp only [List.length_cons]
        exact Nat.succ_le_succ ih
      · exact Nat.le_trans ih (Nat.le_succ _)
  exact filterLength store.retained

/-! ## Exact finite-store mutation cardinalities -/

/-- The retained identifier list after one edge copy. -/
def copiedRetained (store : FiniteArena ι) : List (CopyId ι) :=
  store.retained.map Sum.inl ++ [.inr ()]

private theorem mem_map_clean_intro (function : α → β) {value : α} :
    (values : List α) → value ∈ values → function value ∈ values.map function
  | _ :: _, .head _ => .head _
  | _ :: rest, .tail _ membership =>
      .tail _ (mem_map_clean_intro function rest membership)

private theorem mem_map_clean_elim (function : α → β) {target : β} :
    (values : List α) → target ∈ values.map function →
      ∃ value, value ∈ values ∧ function value = target
  | _ :: _, .head _ => ⟨_, .head _, rfl⟩
  | _ :: rest, .tail _ membership => by
      obtain ⟨value, source, equality⟩ :=
        mem_map_clean_elim function rest membership
      exact ⟨value, .tail _ source, equality⟩

private theorem mappedInl_nodup : ∀ (values : List ι), values.Nodup →
    (values.map (Sum.inl : ι → CopyId ι)).Nodup
  | [], _ => .nil
  | first :: rest, nodup => by
      have split := List.nodup_cons.mp nodup
      rw [List.map_cons, List.nodup_cons]
      constructor
      · intro membership
        obtain ⟨value, source, equality⟩ :=
          mem_map_clean_elim (Sum.inl : ι → CopyId ι) rest membership
        exact split.1 (Sum.inl.inj equality.symm ▸ source)
      · exact mappedInl_nodup rest split.2

private theorem inl_not_mem_unit {value : ι} :
    ¬ (Sum.inl value : CopyId ι) ∈ [.inr ()] := by
  intro membership
  cases membership with
  | tail _ impossible => cases impossible

private theorem inr_unit_not_mem_mappedInl (values : List ι) :
    ¬ (Sum.inr () : CopyId ι) ∈ values.map Sum.inl := by
  intro membership
  obtain ⟨value, _, equality⟩ :=
    mem_map_clean_elim (Sum.inl : ι → CopyId ι) values membership
  contradiction

private theorem copiedList_nodup (values : List ι) (nodup : values.Nodup) :
    (values.map (Sum.inl : ι → CopyId ι) ++
      [(Sum.inr () : CopyId ι)]).Nodup := by
  induction values with
  | nil =>
      rw [List.map_nil, List.nil_append, List.nodup_cons]
      constructor
      · intro membership
        cases membership
      · exact .nil
  | cons first rest ih =>
      have split := List.nodup_cons.mp nodup
      rw [List.map_cons, List.cons_append, List.nodup_cons]
      constructor
      · intro membership
        rcases List.mem_append.mp membership with mapped | fresh
        · obtain ⟨value, source, equality⟩ :=
            mem_map_clean_elim (Sum.inl : ι → CopyId ι) rest mapped
          exact split.1 (Sum.inl.inj equality.symm ▸ source)
        · exact inl_not_mem_unit fresh
      · exact ih split.2

theorem copiedRetained_nodup (store : FiniteArena ι) :
    store.copiedRetained.Nodup := by
  unfold copiedRetained
  exact copiedList_nodup store.retained store.retained_nodup

theorem copiedRetained_complete (store : FiniteArena ι) :
    ∀ node : CopyId ι, node ∈ store.copiedRetained := by
  intro node
  cases node with
  | inl old =>
      unfold copiedRetained
      apply List.mem_append_left
      exact mem_map_clean_intro (Sum.inl : ι → CopyId ι) store.retained
        (store.retained_complete old)
  | inr fresh =>
      cases fresh
      unfold copiedRetained
      exact List.mem_append_right _ (List.Mem.head [])

/-- Concrete finite-store edge copy, charged as one mutation. -/
def edgeCopyM (store : FiniteArena ι) (parent child : ι)
    (edge : IncomingEdge store.arena parent child) :
    Metered (FiniteArena (CopyId ι)) :=
  ⟨{
      arena := store.arena.edgeCopy parent child edge
      retained := store.copiedRetained
      retained_nodup := store.copiedRetained_nodup
      retained_complete := store.copiedRetained_complete
    }, 1⟩

@[simp]
theorem edgeCopyM_retainedCard (store : FiniteArena ι)
    (parent child : ι) (edge : IncomingEdge store.arena parent child) :
    (store.edgeCopyM parent child edge).value.retainedCard =
      store.retainedCard + 1 := by
  simp [edgeCopyM, retainedCard, copiedRetained]

@[simp]
theorem edgeCopyM_ticks (store : FiniteArena ι)
    (parent child : ι) (edge : IncomingEdge store.arena parent child) :
    (store.edgeCopyM parent child edge).ticks = 1 := rfl

/-- The retained identifier list after one shared contraction. -/
def contractedRetained (store : FiniteArena ι) : List (ContractId ι) :=
  store.retained.map Sum.inl ++ [.inr false, .inr true]

private theorem mappedContractInl_nodup : ∀ (values : List ι), values.Nodup →
    (values.map (Sum.inl : ι → ContractId ι)).Nodup
  | [], _ => .nil
  | first :: rest, nodup => by
      have split := List.nodup_cons.mp nodup
      rw [List.map_cons, List.nodup_cons]
      constructor
      · intro membership
        obtain ⟨value, source, equality⟩ :=
          mem_map_clean_elim (Sum.inl : ι → ContractId ι) rest membership
        exact split.1 (Sum.inl.inj equality.symm ▸ source)
      · exact mappedContractInl_nodup rest split.2

private theorem contractInl_not_mem_fresh {value : ι} :
    ¬ (Sum.inl value : ContractId ι) ∈ [.inr false, .inr true] := by
  intro membership
  cases membership with
  | tail _ remaining =>
      cases remaining with
      | tail _ impossible => cases impossible

private theorem contractedList_nodup (values : List ι) (nodup : values.Nodup) :
    (values.map (Sum.inl : ι → ContractId ι) ++
      [(Sum.inr false : ContractId ι),
        (Sum.inr true : ContractId ι)]).Nodup := by
  induction values with
  | nil =>
      rw [List.map_nil, List.nil_append, List.nodup_cons]
      constructor
      · intro membership
        cases membership with
        | tail _ impossible => cases impossible
      · rw [List.nodup_cons]
        constructor
        · intro membership
          cases membership
        · exact .nil
  | cons first rest ih =>
      have split := List.nodup_cons.mp nodup
      rw [List.map_cons, List.cons_append, List.nodup_cons]
      constructor
      · intro membership
        rcases List.mem_append.mp membership with mapped | fresh
        · obtain ⟨value, source, equality⟩ :=
            mem_map_clean_elim (Sum.inl : ι → ContractId ι) rest mapped
          exact split.1 (Sum.inl.inj equality.symm ▸ source)
        · exact contractInl_not_mem_fresh fresh
      · exact ih split.2

theorem contractedRetained_nodup (store : FiniteArena ι) :
    store.contractedRetained.Nodup := by
  unfold contractedRetained
  exact contractedList_nodup store.retained store.retained_nodup

theorem contractedRetained_complete (store : FiniteArena ι) :
    ∀ node : ContractId ι, node ∈ store.contractedRetained := by
  intro node
  cases node with
  | inl old =>
      unfold contractedRetained
      apply List.mem_append_left
      exact mem_map_clean_intro (Sum.inl : ι → ContractId ι) store.retained
        (store.retained_complete old)
  | inr fresh =>
      cases fresh with
      | false =>
          unfold contractedRetained
          exact List.mem_append_right _ (List.Mem.head _)
      | true =>
          unfold contractedRetained
          exact List.mem_append_right _
            (List.Mem.tail _ (List.Mem.head []))

/-- Concrete finite-store shared contraction, charged as one mutation. -/
def contractM (store : FiniteArena ι) (redexNode : ι)
    (view : Arena.RedexView store.arena redexNode) :
    Metered (FiniteArena (ContractId ι)) :=
  ⟨{
      arena := store.arena.contract redexNode view
      retained := store.contractedRetained
      retained_nodup := store.contractedRetained_nodup
      retained_complete := store.contractedRetained_complete
    }, 1⟩

@[simp]
theorem contractM_retainedCard (store : FiniteArena ι)
    (redexNode : ι) (view : Arena.RedexView store.arena redexNode) :
    (store.contractM redexNode view).value.retainedCard =
      store.retainedCard + 2 := by
  simp [contractM, retainedCard, contractedRetained]

@[simp]
theorem contractM_ticks (store : FiniteArena ι)
    (redexNode : ι) (view : Arena.RedexView store.arena redexNode) :
    (store.contractM redexNode view).ticks = 1 := rfl

/-- Public counted finite-arena implementation contract. -/
structure InterpreterCertificate : Prop where
  navigationValue : ∀ (store : FiniteArena ι) (address : Address),
    (store.navigate address).value =
      store.arena.follow? store.arena.root address
  navigationBound : ∀ (store : FiniteArena ι) (address : Address),
    (store.navigate address).ticks ≤ address.length + 1
  liveBound : ∀ (store : FiniteArena ι),
    store.liveCard ≤ store.retainedCard
  copyCard : ∀ (store : FiniteArena ι) (parent child : ι)
      (edge : IncomingEdge store.arena parent child),
    (store.edgeCopyM parent child edge).value.retainedCard =
      store.retainedCard + 1
  contractionCard : ∀ (store : FiniteArena ι) (redexNode : ι)
      (view : Arena.RedexView store.arena redexNode),
    (store.contractM redexNode view).value.retainedCard =
      store.retainedCard + 2

theorem interpreterCertificate : InterpreterCertificate (ι := ι) where
  navigationValue := navigate_value
  navigationBound := navigate_ticks_le
  liveBound := liveCard_le_retainedCard
  copyCard := edgeCopyM_retainedCard
  contractionCard := contractM_retainedCard

end FiniteArena

end PureSFormal.CostModel
