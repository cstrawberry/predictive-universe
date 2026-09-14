import PureSFormal.CostModel.TreeBounds

/-!
# Well-founded shared arenas and readback

An arena stores either `S` or an application of two node identifiers.  A
natural-valued rank decreases along every child edge; this is the executable
acyclicity certificate used by readback.  Sharing is literal: two application
fields may contain the same identifier.
-/

namespace PureSFormal.CostModel

open PureSFormal.PureS

/-- Contents of one arena node. -/
inductive Cell (ι : Type) where
  | s
  | app (fn arg : ι)
  deriving Repr

/-- A rooted acyclic arena.  `rank_decreases` is exactly the local
well-foundedness obligation required by recursive readback. -/
structure Arena (ι : Type) where
  root : ι
  cell : ι → Cell ι
  rank : ι → Nat
  rank_decreases : ∀ {node fn arg}, cell node = .app fn arg →
    rank fn < rank node ∧ rank arg < rank node

namespace Arena

variable {ι : Type}

/-- Unfold a node into the ordinary occurrence tree. -/
def readback (arena : Arena ι) (node : ι) : PureS.Term :=
  match h : arena.cell node with
  | .s => .s
  | .app fn arg => .app (readback arena fn) (readback arena arg)
termination_by arena.rank node
decreasing_by
  · exact (arena.rank_decreases h).1
  · exact (arena.rank_decreases h).2

/-- Unfold the distinguished root. -/
def rootReadback (arena : Arena ι) : PureS.Term := arena.readback arena.root

theorem readback_of_cell_s
    (arena : Arena ι) {node : ι} (cell : arena.cell node = .s) :
    arena.readback node = .s := by
  rw [readback]
  rw [cell]

theorem readback_of_cell_app
    (arena : Arena ι) {node fn arg : ι}
    (cell : arena.cell node = .app fn arg) :
    arena.readback node = .app (arena.readback fn) (arena.readback arg) := by
  rw [readback]
  rw [cell]

/-- Follow a root-relative address through arena edges. -/
def follow? (arena : Arena ι) (node : ι) : Address → Option ι
  | [] => some node
  | .left :: rest =>
      match arena.cell node with
      | .s => none
      | .app fn _ => arena.follow? fn rest
  | .right :: rest =>
      match arena.cell node with
      | .s => none
      | .app _ arg => arena.follow? arg rest

@[simp]
theorem follow?_nil (arena : Arena ι) (node : ι) :
    arena.follow? node [] = some node := rfl

/-- Following a concatenated address factors through the intermediate node. -/
theorem follow?_append
    (arena : Arena ι) (node : ι) (pathPrefix suffix : Address) :
    arena.follow? node (pathPrefix ++ suffix) =
      (arena.follow? node pathPrefix).bind (fun middle => arena.follow? middle suffix) := by
  induction pathPrefix generalizing node with
  | nil => rfl
  | cons direction rest ih =>
      cases direction <;> cases h : arena.cell node <;>
        simp [follow?, h, ih]

/-- Address lookup in readback agrees exactly with following arena edges. -/
theorem subterm?_readback
    (arena : Arena ι) (node : ι) (address : Address) :
    (arena.readback node).subterm? address =
      (arena.follow? node address).map arena.readback := by
  induction address generalizing node with
  | nil =>
      rw [PureS.Term.subterm?_root]
      rw [follow?_nil]
      rfl
  | cons direction rest ih =>
      cases direction with
      | left =>
          cases hcell : arena.cell node with
          | s =>
              rw [arena.readback_of_cell_s hcell]
              change none = Option.map arena.readback
                (match arena.cell node with
                | .s => none
                | .app fn _ => arena.follow? fn rest)
              rw [hcell]
              rfl
          | app fn arg =>
              rw [arena.readback_of_cell_app hcell]
              change (arena.readback fn).subterm? rest = Option.map arena.readback
                (match arena.cell node with
                | .s => none
                | .app child _ => arena.follow? child rest)
              rw [hcell]
              exact ih fn
      | right =>
          cases hcell : arena.cell node with
          | s =>
              rw [arena.readback_of_cell_s hcell]
              change none = Option.map arena.readback
                (match arena.cell node with
                | .s => none
                | .app _ arg => arena.follow? arg rest)
              rw [hcell]
              rfl
          | app fn arg =>
              rw [arena.readback_of_cell_app hcell]
              change (arena.readback arg).subterm? rest = Option.map arena.readback
                (match arena.cell node with
                | .s => none
                | .app _ child => arena.follow? child rest)
              rw [hcell]
              exact ih arg

/-- A nonempty successful walk strictly decreases rank. -/
theorem rank_lt_of_follow?_cons
    (arena : Arena ι) {start finish : ι}
    {direction : Direction} {rest : Address}
    (walk : arena.follow? start (direction :: rest) = some finish) :
    arena.rank finish < arena.rank start := by
  cases direction with
  | left =>
      cases hcell : arena.cell start with
      | s => simp [follow?, hcell] at walk
      | app fn arg =>
          have firstDecrease := (arena.rank_decreases hcell).1
          cases rest with
          | nil =>
              simp [follow?, hcell] at walk
              subst finish
              exact firstDecrease
          | cons next remaining =>
              have tailWalk :
                  arena.follow? fn (next :: remaining) = some finish := by
                simpa only [follow?, hcell] using walk
              exact Nat.lt_trans (arena.rank_lt_of_follow?_cons tailWalk) firstDecrease
  | right =>
      cases hcell : arena.cell start with
      | s => simp [follow?, hcell] at walk
      | app fn arg =>
          have firstDecrease := (arena.rank_decreases hcell).2
          cases rest with
          | nil =>
              simp [follow?, hcell] at walk
              subst finish
              exact firstDecrease
          | cons next remaining =>
              have tailWalk :
                  arena.follow? arg (next :: remaining) = some finish := by
                simpa only [follow?, hcell] using walk
              exact Nat.lt_trans (arena.rank_lt_of_follow?_cons tailWalk) firstDecrease
termination_by rest.length

/-- Two occurrences of one arena node cannot stand in a strict-prefix
relation.  Otherwise a nonempty edge walk would return to the same node,
contradicting the rank certificate. -/
theorem same_node_occurrences_not_strict_prefix
    (arena : Arena ι) {node : ι} {first second suffix : Address}
    (firstOccurrence : arena.follow? arena.root first = some node)
    (secondOccurrence : arena.follow? arena.root second = some node)
    (suffixNonempty : suffix ≠ []) :
    second ≠ first ++ suffix := by
  intro same
  subst second
  rw [arena.follow?_append] at secondOccurrence
  simp only [firstOccurrence, Option.bind_some] at secondOccurrence
  cases suffix with
  | nil => exact suffixNonempty rfl
  | cons direction rest =>
      have decrease := arena.rank_lt_of_follow?_cons secondOccurrence
      exact (Nat.lt_irrefl _ decrease)

/-- A graph-redex view exposes the four arena cells making
`app(app(app(S,x),y),z)`. -/
structure RedexView (arena : Arena ι) (redexNode : ι) where
  sNode : ι
  firstSpine : ι
  secondSpine : ι
  x : ι
  y : ι
  z : ι
  atRoot : arena.cell redexNode = .app secondSpine z
  atSecond : arena.cell secondSpine = .app firstSpine y
  atFirst : arena.cell firstSpine = .app sNode x
  atS : arena.cell sNode = .s

namespace RedexView

theorem x_rank_lt_redex
    (view : RedexView arena redexNode) :
    arena.rank view.x < arena.rank redexNode := by
  have first := (arena.rank_decreases view.atFirst).2
  have second := (arena.rank_decreases view.atSecond).1
  have third := (arena.rank_decreases view.atRoot).1
  exact Nat.lt_trans (Nat.lt_trans first second) third

theorem y_rank_lt_redex
    (view : RedexView arena redexNode) :
    arena.rank view.y < arena.rank redexNode := by
  have second := (arena.rank_decreases view.atSecond).2
  have third := (arena.rank_decreases view.atRoot).1
  exact Nat.lt_trans second third

theorem z_rank_lt_redex
    (view : RedexView arena redexNode) :
    arena.rank view.z < arena.rank redexNode :=
  (arena.rank_decreases view.atRoot).2

/-- Readback of a graph redex is the ordinary pure-S redex. -/
theorem readback_eq_redex
    (view : RedexView arena redexNode) :
    arena.readback redexNode =
      PureS.Term.redex (arena.readback view.x)
        (arena.readback view.y) (arena.readback view.z) := by
  rw [arena.readback_of_cell_app view.atRoot,
    arena.readback_of_cell_app view.atSecond,
    arena.readback_of_cell_app view.atFirst,
    arena.readback_of_cell_s view.atS]
  rfl

/-- The contractum belonging to this graph-redex view. -/
def contractum (view : RedexView arena redexNode) : PureS.Term :=
  PureS.Term.contractum (arena.readback view.x)
    (arena.readback view.y) (arena.readback view.z)

end RedexView

end Arena

end PureSFormal.CostModel
