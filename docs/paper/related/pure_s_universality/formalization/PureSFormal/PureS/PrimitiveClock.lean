import PureSFormal.PureS.PrimitiveScripts
import PureSFormal.PureS.Clock

/-!
# Primitive one-cursor clock growth

The clock loop stores no numeral.  Successor and zero guards repeatedly run
the two displayed scripts until syntax reaches `C₀`; this module proves the
whole finite trace for an arbitrary unary carrier and the exact wrapper
return.
-/

namespace PureSFormal.PureS

namespace PrimitiveClock

open PrimitiveScripts

/-- Syntax-driven growth trace for `C_m C_n`. -/
def grow : Nat → Script
  | 0 => [.Rdx]
  | m + 1 => [.Rdx, .R] ++ grow m

/-- One parent move for every wrapper created by `grow`. -/
def growUp : Nat → Script
  | 0 => []
  | m + 1 => growUp m ++ [.U]

/-- Exact wrapper parent stack around the terminal carrier pair. -/
def wrapperParents (n : Nat) : Nat → List ParentFrame → List ParentFrame
  | 0, parents => parents
  | m + 1, parents =>
      wrapperParents n m (.right (.app .s (C n)) :: parents)

/-- The growth loop reaches `C_(n+1) C_(n+1)` at exact wrapper depth `m`. -/
theorem run_grow (n m : Nat) (parents : List ParentFrame) :
    Script.run (grow m) ⟨.app (C m) (C n), parents⟩ =
      some ⟨clockBase n, wrapperParents n m parents⟩ := by
  induction m generalizing parents with
  | zero => rfl
  | succ m ih =>
      rw [grow, Script.run_append]
      change (match some
        ⟨.app (C m) (C n), .right (.app .s (C n)) :: parents⟩ with
      | none => none
      | some middle => Script.run (grow m) middle) = _
      simp only
      exact ih _

/-- The wrapper return restores the whole clock expansion at its root. -/
theorem run_growUp (n m : Nat) (parents : List ParentFrame) :
    Script.run (growUp m) ⟨clockBase n, wrapperParents n m parents⟩ =
      some ⟨clockWrappers n m, parents⟩ := by
  induction m generalizing parents with
  | zero => rfl
  | succ m ih =>
      rw [growUp, Script.run_append]
      simp only [wrapperParents, clockWrappers]
      rw [ih (parents := .right (.app .s (C n)) :: parents)]
      rfl

/-- Complete growth and wrapper return, entirely at one cursor. -/
theorem run_growthRoundTrip (n m : Nat) (parents : List ParentFrame) :
    Script.run (grow m ++ growUp m) ⟨.app (C m) (C n), parents⟩ =
      some ⟨clockWrappers n m, parents⟩ := by
  rw [Script.run_append, run_grow]
  change Script.run (growUp m)
    ⟨clockBase n, wrapperParents n m parents⟩ = _
  exact run_growUp n m parents

@[simp]
theorem grow_rdxCount (m : Nat) : (grow m).rdxCount = m + 1 := by
  induction m with
  | zero => rfl
  | succ m ih =>
      simp only [grow, Script.rdxCount_append, Script.rdxCount, ih]
      rw [← Nat.add_assoc, Nat.add_comm 1 m, Nat.add_assoc]

theorem growUp_cursorOnly (m : Nat) : Script.CursorOnly (growUp m) := by
  induction m with
  | zero => trivial
  | succ m ih =>
      exact PrimitiveScripts.cursorOnly_append_up _ ih

@[simp]
theorem growUp_rdxCount (m : Nat) : (growUp m).rdxCount = 0 :=
  Script.rdxCount_eq_zero_of_cursorOnly (growUp_cursorOnly m)

@[simp]
theorem growthRoundTrip_rdxCount (m : Nat) :
    (grow m ++ growUp m).rdxCount = m + 1 := by
  rw [Script.rdxCount_append, grow_rdxCount, growUp_rdxCount, Nat.add_zero]

/-- Enter a clock pair from its application to the registered environment. -/
def enterGrowth (m : Nat) : Script := .L :: grow m ++ growUp m

theorem run_enterGrowth (n m : Nat) (environment : Term)
    (parents : List ParentFrame) :
    Script.run (enterGrowth m)
      ⟨.app (.app (C m) (C n)) environment, parents⟩ =
      some ⟨clockWrappers n m,
        .left environment :: parents⟩ := by
  change Script.run (grow m ++ growUp m)
    ⟨.app (C m) (C n), .left environment :: parents⟩ = _
  exact run_growthRoundTrip n m _

end PrimitiveClock

end PureSFormal.PureS
