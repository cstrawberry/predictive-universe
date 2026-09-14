import PureSFormal.PureS.Pattern
import PureSFormal.PureS.Cursor

/-!
# Origin-restoring bounded probes

A probe uses only the two local observations (node kind and incoming side)
and one-edge cursor moves.  Every ordinary success or mismatch restores the
origin.  `none` represents the controller's `Reject` target; the compiler
proved here never reaches it for a well-formed finite pattern walk.
-/

namespace PureSFormal.PureS

namespace Probe

/-- The current node's only scheduler-visible structural observation. -/
inductive NodeKind where
  | s
  | app
  deriving BEq, DecidableEq, Inhabited, Repr

/-- The incoming-edge observation, including the root case. -/
inductive Incoming where
  | root
  | left
  | right
  deriving BEq, DecidableEq, Inhabited, Repr

def observeNode (cursor : Cursor) : NodeKind :=
  match cursor.focus with
  | .s => .s
  | .app _ _ => .app

def observeIncoming (cursor : Cursor) : Incoming :=
  match cursor.incomingSide with
  | none => .root
  | some .left => .left
  | some .right => .right

@[simp]
theorem observeNode_s (parents : List ParentFrame) :
    observeNode ⟨.s, parents⟩ = .s :=
  rfl

@[simp]
theorem observeNode_app (fn arg : Term) (parents : List ParentFrame) :
    observeNode ⟨.app fn arg, parents⟩ = .app :=
  rfl

@[simp]
theorem observeIncoming_root (focus : Term) :
    observeIncoming ⟨focus, []⟩ = .root :=
  rfl

@[simp]
theorem observeIncoming_left
    (focus sibling : Term) (parents : List ParentFrame) :
    observeIncoming ⟨focus, .left sibling :: parents⟩ = .left :=
  rfl

@[simp]
theorem observeIncoming_right
    (focus sibling : Term) (parents : List ParentFrame) :
    observeIncoming ⟨focus, .right sibling :: parents⟩ = .right :=
  rfl

/--
Run a finite pattern probe.  The result Boolean distinguishes match from
ordinary mismatch; `none` is reserved for an undefined move (`Reject`).
-/
def run : Pattern → Cursor → Option (Bool × Cursor)
  | .hole, origin => some (true, origin)
  | .s, origin =>
      match observeNode origin with
      | .s => some (true, origin)
      | .app => some (false, origin)
  | .app fnPattern argPattern, origin =>
      match observeNode origin with
      | .s => some (false, origin)
      | .app =>
          match origin.left? with
          | none => none
          | some leftChild =>
              match run fnPattern leftChild with
              | none => none
              | some (fnMatches, leftRestored) =>
                  match leftRestored.up? with
                  | none => none
                  | some afterLeft =>
                      if !fnMatches then
                        some (false, afterLeft)
                      else
                        match afterLeft.right? with
                        | none => none
                        | some rightChild =>
                            match run argPattern rightChild with
                            | none => none
                            | some (argMatches, rightRestored) =>
                                match rightRestored.up? with
                                | none => none
                                | some afterRight =>
                                    some (argMatches, afterRight)

/--
The compiled walk neither rejects nor moves its origin, and its Boolean is
exactly the executable structural matcher.
-/
theorem run_spec (pattern : Pattern) (origin : Cursor) :
    run pattern origin =
      some (Pattern.matchesBool pattern origin.focus, origin) := by
  induction pattern generalizing origin with
  | hole => rfl
  | s =>
      cases origin with
      | mk focus parents => cases focus <;> rfl
  | app fnPattern argPattern fnIH argIH =>
      cases origin with
      | mk focus parents =>
          cases focus with
          | s => rfl
          | app fn arg =>
              simp only [run, observeNode, Cursor.left?_app, fnIH,
                Cursor.up?_left, Pattern.matchesBool]
              cases hfn : Pattern.matchesBool fnPattern fn with
              | false => rfl
              | true =>
                  simp only [Bool.not_true, Bool.false_eq_true, ↓reduceIte,
                    Cursor.right?_app, argIH, Cursor.up?_right, Bool.true_and]

/-- Every bounded probe has an ordinary result and never enters `Reject`. -/
theorem run_ne_none (pattern : Pattern) (origin : Cursor) :
    run pattern origin ≠ none := by
  rw [run_spec]
  intro h
  cases h

/-- Both success and ordinary mismatch restore the exact input cursor. -/
theorem run_restores
    {pattern : Pattern} {origin returned : Cursor} {accepted : Bool}
    (h : run pattern origin = some (accepted, returned)) :
    returned = origin := by
  rw [run_spec] at h
  exact (Prod.mk.inj (Option.some.inj h)).2.symm

/-- Probe success is equivalent to the declarative independent-hole match. -/
theorem run_success_iff (pattern : Pattern) (origin : Cursor) :
    run pattern origin = some (true, origin) ↔
      Pattern.Matches pattern origin.focus := by
  rw [run_spec, Option.some.injEq, Prod.mk.injEq,
    Pattern.matchesBool_eq_true_iff]
  simp

/-- Probe mismatch is exactly failure of the declarative pattern. -/
theorem run_mismatch_iff (pattern : Pattern) (origin : Cursor) :
    run pattern origin = some (false, origin) ↔
      ¬ Pattern.Matches pattern origin.focus := by
  rw [run_spec, Option.some.injEq, Prod.mk.injEq]
  simp only [and_true]
  rw [← Pattern.matchesBool_eq_true_iff]
  cases Pattern.matchesBool pattern origin.focus <;> simp

/-! ## Parent probes -/

/--
The Boolean specification for a parent probe.  A wrong incoming side is an
ordinary mismatch; on the requested side, the displayed pattern is matched
against the immediate parent occurrence.
-/
def parentMatches (side : Direction) (pattern : Pattern) (origin : Cursor) :
    Bool :=
  match side, origin.parents with
  | .left, .left sibling :: _ =>
      Pattern.matchesBool pattern (.app origin.focus sibling)
  | .right, .right sibling :: _ =>
      Pattern.matchesBool pattern (.app sibling origin.focus)
  | _, _ => false

/--
Probe the immediate parent and return through the known incoming edge.  Both
success and ordinary mismatch restore the child occurrence exactly.
-/
def runParent (side : Direction) (pattern : Pattern) (origin : Cursor) :
    Option (Bool × Cursor) :=
  match side, origin.parents with
  | .left, .left _ :: _ =>
      match origin.up? with
      | none => none
      | some parent =>
          match run pattern parent with
          | none => none
          | some (accepted, restoredParent) =>
              match restoredParent.left? with
              | none => none
              | some restoredChild => some (accepted, restoredChild)
  | .right, .right _ :: _ =>
      match origin.up? with
      | none => none
      | some parent =>
          match run pattern parent with
          | none => none
          | some (accepted, restoredParent) =>
              match restoredParent.right? with
              | none => none
              | some restoredChild => some (accepted, restoredChild)
  | _, _ => some (false, origin)

/-- Parent probes implement their Boolean specification and restore origin. -/
theorem runParent_spec (side : Direction) (pattern : Pattern) (origin : Cursor) :
    runParent side pattern origin = some (parentMatches side pattern origin,
      origin) := by
  cases origin with
  | mk focus parents =>
      cases parents with
      | nil => cases side <;> rfl
      | cons frame parents =>
          cases frame with
          | left sibling =>
              cases side with
              | left => simp [runParent, parentMatches, run_spec]
              | right => rfl
          | right sibling =>
              cases side with
              | left => rfl
              | right => simp [runParent, parentMatches, run_spec]

theorem runParent_ne_none
    (side : Direction) (pattern : Pattern) (origin : Cursor) :
    runParent side pattern origin ≠ none := by
  rw [runParent_spec]
  intro h
  cases h

theorem runParent_restores
    {side : Direction} {pattern : Pattern} {origin returned : Cursor}
    {accepted : Bool}
    (h : runParent side pattern origin = some (accepted, returned)) :
    returned = origin := by
  rw [runParent_spec] at h
  exact (Prod.mk.inj (Option.some.inj h)).2.symm

theorem runParent_success_iff
    (side : Direction) (pattern : Pattern) (origin : Cursor) :
    runParent side pattern origin = some (true, origin) ↔
      parentMatches side pattern origin = true := by
  rw [runParent_spec, Option.some.injEq, Prod.mk.injEq]
  simp

/-- A finite upper bound on observation and one-edge-move microstates. -/
def stateBound : Pattern → Nat
  | .hole => 1
  | .s => 1
  | .app fnPattern argPattern =>
      6 + stateBound fnPattern + stateBound argPattern

theorem stateBound_pos (pattern : Pattern) : 0 < stateBound pattern := by
  cases pattern with
  | hole => exact Nat.zero_lt_succ 0
  | s => exact Nat.zero_lt_succ 0
  | app fnPattern argPattern =>
      exact Nat.add_pos_left
        (Nat.add_pos_left (Nat.zero_lt_succ 5) _) _

end Probe

end PureSFormal.PureS
