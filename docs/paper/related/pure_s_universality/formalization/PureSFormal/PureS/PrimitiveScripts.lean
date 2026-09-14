import PureSFormal.PureS.Frame
import PureSFormal.PureS.Activation
import PureSFormal.PureS.Script

/-!
# Primitive scheduler scripts

The displayed Appendix-A scripts are executed here by the literal one-cursor
semantics.  These results strengthen the corresponding bare-term reductions:
they certify the exact final cursor occurrence and parent-link stack as well
as the erased reduct.
-/

namespace PureSFormal.PureS

namespace PrimitiveScripts

/-- Appendix A script (A1), one positive fuel layer. -/
def fuelPositive : Script := [.L, .Rdx, .U, .Rdx, .R]

/-- Appendix A script (A2), the five-contraction zero-carrier expansion. -/
def fuelZero : Script :=
  [.L, .Rdx, .U, .L, .Rdx, .U, .Rdx, .L, .Rdx, .U, .Rdx]

/-- Appendix A script (A3), the three-contraction frame prefix. -/
def framePrefixScript : Script :=
  [.Rdx, .L, .Rdx, .U, .L, .L, .Rdx, .R]

/-- Appendix A script (A4), selecting the left child of a wrapped node. -/
def nodeLeft : Script := [.Rdx, .R, .Rdx, .L]

/-- Appendix A script (A4), selecting the right child of a wrapped node. -/
def nodeRight : Script := [.Rdx, .R, .Rdx, .R]

/-- Wrapped-leaf activation and entry into the selected action field. -/
def leaf : Script := [.Rdx, .R]

/-- Appendix A script (A6), marking a fresh Local halt field. -/
def mark : Script := [.L, .L, .L, .Rdx, .U, .U, .U]

@[simp] theorem fuelPositive_rdxCount : fuelPositive.rdxCount = 2 := rfl
@[simp] theorem fuelZero_rdxCount : fuelZero.rdxCount = 5 := rfl
@[simp] theorem framePrefixScript_rdxCount : framePrefixScript.rdxCount = 3 := rfl
@[simp] theorem nodeLeft_rdxCount : nodeLeft.rdxCount = 2 := rfl
@[simp] theorem nodeRight_rdxCount : nodeRight.rdxCount = 2 := rfl
@[simp] theorem leaf_rdxCount : leaf.rdxCount = 1 := rfl
@[simp] theorem mark_rdxCount : mark.rdxCount = 1 := rfl

/-- (A1) creates one literal pending frame and enters its rightmost child. -/
theorem run_fuelPositive (n : Nat) (environment continuation : Term)
    (parents : List ParentFrame) :
    Script.run fuelPositive
      ⟨.app (.app (C (n + 1)) environment) continuation, parents⟩ =
      some ⟨.app (.app (C n) environment) continuation,
        .right (.app environment continuation) :: parents⟩ := by
  rfl

/-- (A2) reaches the literal Base root without changing cursor depth. -/
theorem run_fuelZero (environment continuation : Term)
    (parents : List ParentFrame) :
    Script.run fuelZero
      ⟨.app (.app (C 0) environment) continuation, parents⟩ =
      some ⟨baseCarrier environment continuation, parents⟩ := by
  rfl

/--
(A3) creates the fresh Local and leaves the cursor at `Actions* V`, with the
three exact Local ancestors recorded in the zipper.
-/
theorem run_framePrefix (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Script.run framePrefixScript
      ⟨frame (environmentCode actions bits) continuation carrier, parents⟩ =
      some ⟨.app actions carrier,
        .right (freshHField carrier) ::
        .left (.app (seedCode bits) carrier) ::
        .left (.app continuation carrier) :: parents⟩ := by
  rfl

/-- (A4) activates an internal node and enters its selected left child. -/
theorem run_nodeLeft (left right carrier : Term)
    (parents : List ParentFrame) :
    Script.run nodeLeft
      ⟨.app (nodeCode left right) carrier, parents⟩ =
      some ⟨.app left carrier,
        .left (.app right carrier) ::
        .right (.app .s carrier) :: parents⟩ := by
  rfl

/-- (A4) activates an internal node and enters its selected right child. -/
theorem run_nodeRight (left right carrier : Term)
    (parents : List ParentFrame) :
    Script.run nodeRight
      ⟨.app (nodeCode left right) carrier, parents⟩ =
      some ⟨.app right carrier,
        .right (.app left carrier) ::
        .right (.app .s carrier) :: parents⟩ := by
  rfl

/-- Wrapped-leaf activation enters precisely `function carrier`. -/
theorem run_leaf (function carrier : Term) (parents : List ParentFrame) :
    Script.run leaf ⟨.app (leafCode function) carrier, parents⟩ =
      some ⟨.app function carrier,
        .right (.app .s carrier) :: parents⟩ := by
  rfl

/-! ## Strict appender walk (A5) -/

/--
The action half of (A5).  Every non-final push layer performs `Rdx Rdx L`;
the final layer performs `Rdx Rdx` and leaves the cursor below the retained
history spine.
-/
def actionDescent : List Bool → Script
  | [] => []
  | [_] => [.Rdx, .Rdx]
  | _ :: next :: rest =>
      [.Rdx, .Rdx, .L] ++ actionDescent (next :: rest)

/-- The fixed return from the action endpoint, one `U` per retained ancestor. -/
def actionReturn : List Bool → Script
  | [] => []
  | [_] => []
  | _ :: next :: rest => actionReturn (next :: rest) ++ [.U]

/-- Complete operational action script, including its fixed return ascent. -/
def action (bits : List Bool) : Script :=
  actionDescent bits ++ actionReturn bits

/-- Focus left after executing the contraction part of (A5). -/
def actionFocus : List Bool → Term → Term
  | [], initial => .app p initial
  | [bit], initial => appenderResult [bit] initial
  | bit :: next :: rest, initial =>
      actionFocus (next :: rest) (extendAccumulator bit initial)

/-- Exact retained-history parent stack at the end of the contraction part. -/
def actionParents : List Bool → Term → List ParentFrame → List ParentFrame
  | [], _, parents => parents
  | [_], _, parents => parents
  | bit :: next :: rest, initial, parents =>
      actionParents (next :: rest) (extendAccumulator bit initial)
        (.left (pushHistory bit initial) :: parents)

/-- The contraction half of (A5) reaches its exact nested cursor position. -/
theorem run_actionDescent (bits : List Bool) (initial : Term)
    (parents : List ParentFrame) :
    Script.run (actionDescent bits)
      ⟨.app (appender bits) initial, parents⟩ =
      some ⟨actionFocus bits initial, actionParents bits initial parents⟩ := by
  induction bits generalizing initial parents with
  | nil => rfl
  | cons bit bits ih =>
      cases bits with
      | nil => rfl
      | cons next rest =>
          change Script.run (actionDescent (next :: rest))
            ⟨.app (appender (next :: rest)) (extendAccumulator bit initial),
              .left (pushHistory bit initial) :: parents⟩ =
            some
              ⟨actionFocus (next :: rest) (extendAccumulator bit initial),
                actionParents (next :: rest) (extendAccumulator bit initial)
                  (.left (pushHistory bit initial) :: parents)⟩
          exact ih (initial := extendAccumulator bit initial)
            (parents := .left (pushHistory bit initial) :: parents)

/-- The return half of (A5) restores the complete action root exactly. -/
theorem run_actionReturn (bits : List Bool) (initial : Term)
    (parents : List ParentFrame) :
    Script.run (actionReturn bits)
      ⟨actionFocus bits initial, actionParents bits initial parents⟩ =
      some ⟨appenderResult bits initial, parents⟩ := by
  induction bits generalizing initial parents with
  | nil => rfl
  | cons bit bits ih =>
      cases bits with
      | nil => rfl
      | cons next rest =>
          rw [actionReturn, Script.run_append]
          simp only [actionFocus, actionParents]
          rw [ih (initial := extendAccumulator bit initial)
            (parents := .left (pushHistory bit initial) :: parents)]
          simp only [Script.run, Primitive.exec, Cursor.up?_left]
          exact congrArg some (congrArg (fun term => Cursor.mk term parents)
            (appenderResult_cons bit (next :: rest) initial).symm)

/-- (A5), including the fixed `U` return, restores the complete action root. -/
theorem run_action (bits : List Bool) (initial : Term)
    (parents : List ParentFrame) :
    Script.run (action bits) ⟨.app (appender bits) initial, parents⟩ =
      some ⟨appenderResult bits initial, parents⟩ := by
  rw [action, Script.run_append, run_actionDescent]
  change Script.run (actionReturn bits)
    ⟨actionFocus bits initial, actionParents bits initial parents⟩ = _
  exact run_actionReturn bits initial parents

/-- The contraction half contains exactly two `Rdx` rows per appendant bit. -/
theorem actionDescent_rdxCount (bits : List Bool) :
    (actionDescent bits).rdxCount = 2 * bits.length := by
  induction bits with
  | nil => rfl
  | cons bit bits ih =>
      cases bits with
      | nil => rfl
      | cons next rest =>
          simp only [actionDescent, Script.rdxCount_append,
            Script.rdxCount, List.length_cons]
          have htail := ih
          simp only [List.length_cons] at htail
          rw [htail]
          simp [Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- Appending one upward move preserves the cursor-only property. -/
theorem cursorOnly_append_up (script : Script)
    (h : Script.CursorOnly script) :
    Script.CursorOnly (script ++ [.U]) := by
  induction script with
  | nil => trivial
  | cons operation script ih =>
      cases operation with
      | L =>
          simp only [List.cons_append, Script.CursorOnly] at h ⊢
          exact ih h
      | R =>
          simp only [List.cons_append, Script.CursorOnly] at h ⊢
          exact ih h
      | U =>
          simp only [List.cons_append, Script.CursorOnly] at h ⊢
          exact ih h
      | Rdx => contradiction

/-- The return half is cursor-only. -/
theorem actionReturn_cursorOnly (bits : List Bool) :
    Script.CursorOnly (actionReturn bits) := by
  induction bits with
  | nil => trivial
  | cons bit bits ih =>
      cases bits with
      | nil => trivial
      | cons next rest =>
          exact cursorOnly_append_up _ ih

/-- The complete (A5) script performs exactly the intended contractions. -/
@[simp]
theorem action_rdxCount (bits : List Bool) :
    (action bits).rdxCount = 2 * bits.length := by
  rw [action, Script.rdxCount_append, actionDescent_rdxCount,
    Script.rdxCount_eq_zero_of_cursorOnly (actionReturn_cursorOnly bits),
    Nat.add_zero]

/-- (A6) changes only the registered fresh halt field and restores the root. -/
theorem run_mark (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Script.run mark
      ⟨freshLocal actions bits continuation carrier, parents⟩ =
      some ⟨markedLocal actions bits continuation carrier, parents⟩ := by
  rfl

end PrimitiveScripts

end PureSFormal.PureS
