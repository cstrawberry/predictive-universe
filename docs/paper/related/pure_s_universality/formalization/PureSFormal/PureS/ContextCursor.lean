import PureSFormal.PureS.CanonicalTraversal
import PureSFormal.PureS.PrimitiveScripts

/-!
# Cursor execution along a one-hole context

Every proof-level context address has a literal primitive descent and a
literal parent-only return.  This module supplies the exact zipper endpoint;
later scheduler invariants identify their repeated finite-control DOWN/UP
loops with these walks without placing the address in controller state.
-/

namespace PureSFormal.PureS

namespace ContextCursor

open CanonicalTraversal

/-- One cursor primitive for a context edge. -/
def edge : Direction → Primitive
  | .left => .L
  | .right => .R

/-- Literal root-to-hole cursor script. -/
def down : Context → Script
  | .hole => []
  | .appLeft inner _ => .L :: down inner
  | .appRight _ inner => .R :: down inner

/-- Literal hole-to-root return script. -/
def up : Context → Script
  | .hole => []
  | .appLeft inner _ => up inner ++ [.U]
  | .appRight _ inner => up inner ++ [.U]

/-- Exact zipper stack at the hole of a context. -/
def frames : Context → Term → List ParentFrame → List ParentFrame
  | .hole, _, parents => parents
  | .appLeft inner argument, term, parents =>
      frames inner term (.left argument :: parents)
  | .appRight function inner, term, parents =>
      frames inner term (.right function :: parents)

/-- Parent-link shape depends on the context, not on the term in its hole. -/
theorem frames_term_irrelevant (context : Context) (first second : Term)
    (parents : List ParentFrame) :
    frames context first parents = frames context second parents := by
  induction context generalizing parents with
  | hole => rfl
  | appLeft inner argument ih => exact ih _
  | appRight function inner ih => exact ih _

@[simp] theorem down_length (context : Context) :
    (down context).length = (contextAddress context).length := by
  induction context with
  | hole => rfl
  | appLeft inner argument ih => simp [down, contextAddress, ih]
  | appRight function inner ih => simp [down, contextAddress, ih]

@[simp] theorem up_length (context : Context) :
    (up context).length = (contextAddress context).length := by
  induction context with
  | hole => rfl
  | appLeft inner argument ih => simp [up, contextAddress, ih]
  | appRight function inner ih => simp [up, contextAddress, ih]

/-- The descent script reaches precisely the context hole. -/
theorem run_down (context : Context) (term : Term)
    (parents : List ParentFrame) :
    Script.run (down context) ⟨context.plug term, parents⟩ =
      some ⟨term, frames context term parents⟩ := by
  induction context generalizing parents with
  | hole => rfl
  | appLeft inner argument ih =>
      change Script.run (down inner)
        ⟨inner.plug term, .left argument :: parents⟩ = _
      exact ih _
  | appRight function inner ih =>
      change Script.run (down inner)
        ⟨inner.plug term, .right function :: parents⟩ = _
      exact ih _

/-- The return script restores precisely the context root. -/
theorem run_up (context : Context) (term : Term)
    (parents : List ParentFrame) :
    Script.run (up context) ⟨term, frames context term parents⟩ =
      some ⟨context.plug term, parents⟩ := by
  induction context generalizing parents with
  | hole => rfl
  | appLeft inner argument ih =>
      rw [up, Script.run_append]
      simp only [frames]
      rw [ih (parents := .left argument :: parents)]
      rfl
  | appRight function inner ih =>
      rw [up, Script.run_append]
      simp only [frames]
      rw [ih (parents := .right function :: parents)]
      rfl

/-- A complete context round trip restores the exact input cursor. -/
theorem run_roundTrip (context : Context) (term : Term)
    (parents : List ParentFrame) :
    Script.run (down context ++ up context)
      ⟨context.plug term, parents⟩ =
      some ⟨context.plug term, parents⟩ := by
  rw [Script.run_append, run_down]
  change Script.run (up context) ⟨term, frames context term parents⟩ = _
  exact run_up context term parents

/-- Descend to a context hole, contract once, and restore the context root. -/
def contractAt (context : Context) : Script :=
  down context ++ [.Rdx] ++ up context

/--
The canonical live-front certificate compiles to an exact primitive cursor
walk.  Its only mutation is the selected C4 contraction.
-/
theorem run_contractFront
    {source target : Term} {bit : Bool} {suffix : List Bool}
    {predecessor : Term} {outerContext : Context}
    (certificate : CanonicalTraversal.FrontCertificate source target bit suffix
      predecessor outerContext)
    (parents : List ParentFrame) :
    Script.run (contractAt outerContext) ⟨source, parents⟩ =
      some ⟨target, parents⟩ := by
  rw [certificate.source_eq, certificate.target_eq]
  unfold contractAt
  rw [Script.run_append, Script.run_append, run_down]
  change Script.run (up outerContext)
    ⟨Carrier.tombstone bit predecessor predecessor,
      frames outerContext (.app (live bit) predecessor) parents⟩ = _
  have hframes :
      frames outerContext (.app (live bit) predecessor) parents =
        frames outerContext (Carrier.tombstone bit predecessor predecessor)
          parents := by
    exact frames_term_irrelevant outerContext _ _ parents
  rw [hframes]
  exact run_up outerContext _ parents

/-- Both traversals are cursor-only. -/
theorem down_cursorOnly (context : Context) :
    Script.CursorOnly (down context) := by
  induction context with
  | hole => trivial
  | appLeft inner argument ih => exact ih
  | appRight function inner ih => exact ih

theorem up_cursorOnly (context : Context) :
    Script.CursorOnly (up context) := by
  induction context with
  | hole => trivial
  | appLeft inner argument ih =>
      exact PrimitiveScripts.cursorOnly_append_up _ ih
  | appRight function inner ih =>
      exact PrimitiveScripts.cursorOnly_append_up _ ih

@[simp] theorem down_rdxCount (context : Context) :
    (down context).rdxCount = 0 :=
  Script.rdxCount_eq_zero_of_cursorOnly (down_cursorOnly context)

@[simp] theorem up_rdxCount (context : Context) :
    (up context).rdxCount = 0 :=
  Script.rdxCount_eq_zero_of_cursorOnly (up_cursorOnly context)

@[simp]
theorem contractAt_rdxCount (context : Context) :
    (contractAt context).rdxCount = 1 := by
  simp only [contractAt, Script.rdxCount_append, down_rdxCount,
    Script.rdxCount, up_rdxCount, Nat.zero_add, Nat.add_zero]

end ContextCursor

end PureSFormal.PureS
