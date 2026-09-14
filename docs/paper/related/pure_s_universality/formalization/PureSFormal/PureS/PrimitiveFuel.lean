import PureSFormal.PureS.PrimitiveScripts

/-!
# Primitive one-cursor fuel expansion

Repeated (A1) steps create one pending frame per unary successor.  The final
(A2) step creates Base.  The controller never counts the fuel: this recursive
trace is a proof of the syntax-driven loop, not runtime state.
-/

namespace PureSFormal.PureS

namespace PrimitiveFuel

open PrimitiveScripts

/-- Full primitive trace from `C_n E B` to the Base entry. -/
def expand : Nat → Script
  | 0 => fuelZero
  | n + 1 => fuelPositive ++ expand n

/-- Exact pending-frame zipper stack at Base entry. -/
def pendingParents (environment continuation : Term) :
    Nat → List ParentFrame → List ParentFrame
  | 0, parents => parents
  | n + 1, parents =>
      pendingParents environment continuation n
        (.right (.app environment continuation) :: parents)

/-- The syntax-driven fuel loop reaches Base beneath exactly `n` frames. -/
theorem run_expand (n : Nat) (environment continuation : Term)
    (parents : List ParentFrame) :
    Script.run (expand n)
      ⟨.app (.app (C n) environment) continuation, parents⟩ =
      some ⟨baseCarrier environment continuation,
        pendingParents environment continuation n parents⟩ := by
  induction n generalizing parents with
  | zero => exact run_fuelZero environment continuation parents
  | succ n ih =>
      rw [expand, Script.run_append, run_fuelPositive]
      change Script.run (expand n)
        ⟨.app (.app (C n) environment) continuation,
          .right (.app environment continuation) :: parents⟩ = _
      exact ih _

/-- Rebuilding the recorded parents is the literal nested-frame term. -/
theorem rebuild_pendingParents (n : Nat) (environment continuation body : Term)
    (parents : List ParentFrame) :
    Cursor.rebuild (pendingParents environment continuation n parents) body =
      Cursor.rebuild parents
        ((fun count =>
          Nat.rec body (fun _ inner => frame environment continuation inner)
            count) n) := by
  induction n generalizing parents with
  | zero => rfl
  | succ n ih =>
      change Cursor.rebuild
          (pendingParents environment continuation n
            (.right (.app environment continuation) :: parents)) body = _
      rw [ih]
      rfl

@[simp]
theorem expand_rdxCount (n : Nat) :
    (expand n).rdxCount = 2 * n + 5 := by
  induction n with
  | zero => rfl
  | succ n ih =>
      simp only [expand, Script.rdxCount_append, fuelPositive_rdxCount, ih,
        Nat.mul_succ]
      simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- Erasing the primitive endpoint recovers equation (C2) exactly. -/
theorem erase_run_expand (n : Nat) (environment continuation : Term) :
    let endpoint :=
      Cursor.mk (baseCarrier environment continuation)
        (pendingParents environment continuation n [])
    endpoint.erase = nestedFrames environment continuation n := by
  induction n with
  | zero => rfl
  | succ n ih =>
      change Cursor.rebuild
        (pendingParents environment continuation n
          [.right (.app environment continuation)])
        (baseCarrier environment continuation) = _
      have lifted := rebuild_pendingParents n environment continuation
        (baseCarrier environment continuation)
        [.right (.app environment continuation)]
      rw [lifted]
      have hbase := rebuild_pendingParents n environment continuation
        (baseCarrier environment continuation) []
      have hrec :
          (Nat.rec (baseCarrier environment continuation)
            (fun _ inner => frame environment continuation inner) n) =
            nestedFrames environment continuation n := by
        exact hbase.symm.trans ih
      simp only [Cursor.rebuild, ParentFrame.fill]
      rw [hrec]
      rfl

end PrimitiveFuel

end PureSFormal.PureS
