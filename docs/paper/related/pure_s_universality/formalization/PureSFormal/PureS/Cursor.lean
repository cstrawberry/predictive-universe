import PureSFormal.PureS.Reduction

/-!
# One-occurrence cursor semantics

A `Cursor` is a one-focus zipper.  Its `parents` list stores the siblings and
incoming sides needed to represent the surrounding occurrence tree and its
parent links in a purely functional datatype.  It is therefore representation
data for the sole current occurrence, not a path word, stack, or other field
of the finite controller.  A machine configuration pairs one `Cursor`
with a separately finite control value.

`left?`, `right?`, and `up?` only move that focus.  `rdx?` is the sole
mutating primitive and succeeds only when the focused occurrence itself is
exactly `(((S X) Y) Z)`.
-/

namespace PureSFormal.PureS

/--
One parent-link frame.  `left right` says that the focus is the left child
and records its right sibling; `right left` is the symmetric case.
-/
inductive ParentFrame where
  | left (rightSibling : Term)
  | right (leftSibling : Term)
  deriving BEq, DecidableEq, Inhabited, Repr

namespace ParentFrame

/-- Rebuild the immediate parent represented by one frame. -/
@[simp]
def fill : ParentFrame → Term → Term
  | .left rightSibling, focus => .app focus rightSibling
  | .right leftSibling, focus => .app leftSibling focus

/-- The incoming orientation represented by a frame. -/
@[simp]
def side : ParentFrame → Direction
  | .left _ => .left
  | .right _ => .right

end ParentFrame

/--
A pure-S occurrence tree with exactly one current focus.  The nearest parent
frame is at the head of `parents`.
-/
structure Cursor where
  focus : Term
  parents : List ParentFrame
  deriving BEq, DecidableEq, Inhabited, Repr

namespace Cursor

/-- Rebuild all parent frames around a focus. -/
def rebuild : List ParentFrame → Term → Term
  | [], focus => focus
  | frame :: parents, focus => rebuild parents (frame.fill focus)

/-- Erase cursor/parent-link metadata and recover the ordinary bare term. -/
def erase (cursor : Cursor) : Term := rebuild cursor.parents cursor.focus

/-- A cursor focused at the root of a bare term. -/
def atRoot (term : Term) : Cursor := ⟨term, []⟩

@[simp]
theorem erase_atRoot (term : Term) : (atRoot term).erase = term := rfl

/-- Cursor depth in the represented occurrence tree. -/
def depth (cursor : Cursor) : Nat := cursor.parents.length

/-- Incoming side of the focus, or `none` at the root. -/
def incomingSide : Cursor → Option Direction
  | ⟨_, []⟩ => none
  | ⟨_, frame :: _⟩ => some frame.side

/-- Move to the left child, failing at an `S` leaf. -/
def left? : Cursor → Option Cursor
  | ⟨.app fn arg, parents⟩ => some ⟨fn, .left arg :: parents⟩
  | ⟨.s, _⟩ => none

/-- Move to the right child, failing at an `S` leaf. -/
def right? : Cursor → Option Cursor
  | ⟨.app fn arg, parents⟩ => some ⟨arg, .right fn :: parents⟩
  | ⟨.s, _⟩ => none

/-- Move to the parent, failing when the focus is already the root. -/
def up? : Cursor → Option Cursor
  | ⟨_, []⟩ => none
  | ⟨focus, frame :: parents⟩ => some ⟨frame.fill focus, parents⟩

/-- Contract exactly one S redex rooted at the current focus. -/
def rdx? (cursor : Cursor) : Option Cursor :=
  match cursor.focus.contractRoot? with
  | none => none
  | some replacement => some { cursor with focus := replacement }

@[simp]
theorem left?_app (fn arg : Term) (parents : List ParentFrame) :
    (Cursor.mk (.app fn arg) parents).left? =
      some (Cursor.mk fn (.left arg :: parents)) := rfl

@[simp]
theorem right?_app (fn arg : Term) (parents : List ParentFrame) :
    (Cursor.mk (.app fn arg) parents).right? =
      some (Cursor.mk arg (.right fn :: parents)) := rfl

@[simp]
theorem up?_left (focus rightSibling : Term) (parents : List ParentFrame) :
    (Cursor.mk focus (.left rightSibling :: parents)).up? =
      some (Cursor.mk (.app focus rightSibling) parents) := rfl

@[simp]
theorem up?_right (focus leftSibling : Term) (parents : List ParentFrame) :
    (Cursor.mk focus (.right leftSibling :: parents)).up? =
      some (Cursor.mk (.app leftSibling focus) parents) := rfl

@[simp]
theorem rdx?_redex (x y z : Term) (parents : List ParentFrame) :
    (Cursor.mk (Term.redex x y z) parents).rdx? =
      some (Cursor.mk (Term.contractum x y z) parents) := rfl

/--
Strictness at the focus: adding a trailing argument puts the saturated redex
in the left child, so `Rdx` at the displayed root must reject it.
-/
@[simp]
theorem rdx?_rejects_trailing_argument
    (x y z trailing : Term) (parents : List ParentFrame) :
    (Cursor.mk (.app (Term.redex x y z) trailing) parents).rdx? = none := rfl

/-- Rebuilding the surrounding parent frames preserves a one-step relation. -/
theorem rebuild_step {source target : Term} (parents : List ParentFrame)
    (h : Step source target) :
    Step (rebuild parents source) (rebuild parents target) := by
  induction parents generalizing source target with
  | nil => exact h
  | cons frame parents ih =>
      cases frame with
      | left rightSibling =>
          exact ih (h.appLeft rightSibling)
      | right leftSibling =>
          exact ih (h.appRight leftSibling)

/-- Every successful left move preserves the erased bare term. -/
theorem left?_preserves_erase {before after : Cursor}
    (h : before.left? = some after) : after.erase = before.erase := by
  cases before with
  | mk focus parents =>
      cases focus with
      | s =>
          simp [left?] at h
      | app fn arg =>
          cases h
          rfl

/-- Every successful right move preserves the erased bare term. -/
theorem right?_preserves_erase {before after : Cursor}
    (h : before.right? = some after) : after.erase = before.erase := by
  cases before with
  | mk focus parents =>
      cases focus with
      | s =>
          simp [right?] at h
      | app fn arg =>
          cases h
          rfl

/-- Every successful parent move preserves the erased bare term. -/
theorem up?_preserves_erase {before after : Cursor}
    (h : before.up? = some after) : after.erase = before.erase := by
  cases before with
  | mk focus parents =>
      cases parents with
      | nil =>
          simp [up?] at h
      | cons frame parents =>
          cases frame <;> cases h <;> rfl

/-- A successful focused `Rdx` projects to exactly one contextual S-step. -/
theorem rdx?_sound {before after : Cursor}
    (h : before.rdx? = some after) : Step before.erase after.erase := by
  cases before with
  | mk focus parents =>
      unfold rdx? at h
      generalize hroot : focus.contractRoot? = replacement? at h
      cases replacement? with
      | none =>
          contradiction
      | some replacement =>
          cases h
          exact rebuild_step parents (Term.contractRoot?_sound hroot)

/-- Descending left and immediately moving up returns to the same cursor. -/
theorem left?_then_up? {parent child : Cursor}
    (h : parent.left? = some child) : child.up? = some parent := by
  cases parent with
  | mk focus parents =>
      cases focus with
      | s =>
          simp [left?] at h
      | app fn arg =>
          cases h
          rfl

/-- Descending right and immediately moving up returns to the same cursor. -/
theorem right?_then_up? {parent child : Cursor}
    (h : parent.right? = some child) : child.up? = some parent := by
  cases parent with
  | mk focus parents =>
      cases focus with
      | s =>
          simp [right?] at h
      | app fn arg =>
          cases h
          rfl

/-- Moving up from a left-child frame is inverted by moving left. -/
theorem up?_then_left?
    (focus rightSibling : Term) (parents : List ParentFrame) :
    let child := Cursor.mk focus (.left rightSibling :: parents)
    let parent := Cursor.mk (.app focus rightSibling) parents
    child.up? = some parent ∧ parent.left? = some child := by
  exact ⟨rfl, rfl⟩

/-- Moving up from a right-child frame is inverted by moving right. -/
theorem up?_then_right?
    (focus leftSibling : Term) (parents : List ParentFrame) :
    let child := Cursor.mk focus (.right leftSibling :: parents)
    let parent := Cursor.mk (.app leftSibling focus) parents
    child.up? = some parent ∧ parent.right? = some child := by
  exact ⟨rfl, rfl⟩

end Cursor

/-- The four occurrence-level evaluator primitives. -/
inductive Primitive where
  | L
  | R
  | U
  | Rdx
  deriving BEq, DecidableEq, Inhabited, Repr

namespace Primitive

/-- Execute one cursor primitive. -/
def exec : Primitive → Cursor → Option Cursor
  | .L, cursor => cursor.left?
  | .R, cursor => cursor.right?
  | .U, cursor => cursor.up?
  | .Rdx, cursor => cursor.rdx?

end Primitive

end PureSFormal.PureS
