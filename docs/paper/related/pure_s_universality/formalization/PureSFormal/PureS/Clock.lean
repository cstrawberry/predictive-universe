import PureSFormal.PureS.Frame

/-!
# Outer clock algebra

This module proves equations (17) and (18) with exact contraction counts.
The more general expansion theorem keeps the final carrier index and the
number of wrappers separate; the paper's diagonal identity is its `m = n`
instance.
-/

namespace PureSFormal.PureS

/-- The terminal carrier pair `C_(n+1) C_(n+1)` of clock stage `n`. -/
def clockBase (n : Nat) : Term :=
  .app (C (n + 1)) (C (n + 1))

/--
`r` literal clock wrappers `S C_n [-]` around the terminal carrier pair.
-/
def clockWrappers (n : Nat) : Nat → Term
  | 0 => clockBase n
  | r + 1 => .app (.app .s (C n)) (clockWrappers n r)

@[simp] theorem clockWrappers_zero (n : Nat) :
    clockWrappers n 0 = clockBase n :=
  rfl

@[simp] theorem clockWrappers_succ (n r : Nat) :
    clockWrappers n (r + 1) =
      .app (.app .s (C n)) (clockWrappers n r) :=
  rfl

/-- The final `C₀ C_n` clock contraction creates the terminal carrier pair. -/
theorem clock_zero (n : Nat) :
    StepsN 1 (.app (C 0) (C n)) (clockBase n) := by
  apply StepsN.single
  simpa [C, b, clockBase, Term.redex, Term.contractum] using
    Step.root b b (C n)

/--
General clock expansion: `C_m C_n` creates `m` wrappers carrying `C_n`, then
the pair `C_(n+1) C_(n+1)`, in exactly `m+1` contractions.
-/
theorem clock_expand (n m : Nat) :
    StepsN (m + 1) (.app (C m) (C n)) (clockWrappers n m) := by
  induction m with
  | zero => exact clock_zero n
  | succ m ih =>
      let exposed : Term :=
        .app (.app .s (C n)) (.app (C m) (C n))
      have first : StepsN 1 (.app (C (m + 1)) (C n)) exposed := by
        apply StepsN.single
        simpa [exposed, C, b, Term.redex, Term.contractum] using
          Step.root (.s : Term) (C m) (C n)
      have inside : StepsN (m + 1) exposed (clockWrappers n (m + 1)) := by
        simpa [exposed] using
          StepsN.appRight (.app .s (C n)) ih
      have combined := StepsN.trans first inside
      have count : 1 + (m + 1) = (m + 1) + 1 :=
        Nat.add_comm _ _
      rw [count] at combined
      exact combined

/-- Equation (17), including its exact `n+1` contraction count. -/
theorem clock_diagonal (n : Nat) :
    StepsN (n + 1) (.app (C n) (C n)) (clockWrappers n n) :=
  clock_expand n n

/--
Equation (18): every nonterminal wrapper launches one bound-`n` job in one
contraction and retains the remaining wrapper chain as its literal right
continuation.
-/
theorem clockWrapper_launch (n r : Nat) (environment : Term) :
    StepsN 1
      (.app (clockWrappers n (r + 1)) environment)
      (.app
        (.app (C n) environment)
        (.app (clockWrappers n r) environment)) := by
  apply StepsN.single
  simpa [clockWrappers, Term.redex, Term.contractum] using
    Step.root (C n) (clockWrappers n r) environment

/-- The ground outer generator `(C₀ C₀) E_w`. -/
def generator (actions : Term) (bits : List Bool) : Term :=
  .app (.app (C 0) (C 0)) (environmentCode actions bits)

/-- The first clock contraction produces only the arity-four staging term. -/
theorem generator_staging (actions : Term) (bits : List Bool) :
    StepsN 1 (generator actions bits)
      (.app (clockBase 0) (environmentCode actions bits)) := by
  simpa [generator] using
    StepsN.appLeft (clock_zero 0) (environmentCode actions bits)

@[simp] theorem headArity_clockBase (n : Nat) :
    (clockBase n).headArity = 3 := by
  simp [clockBase, Term.headArity_app_eq, C]

@[simp] theorem headArity_clockWrappers_succ (n r : Nat) :
    (clockWrappers n (r + 1)).headArity = 2 :=
  rfl

/-- A terminal continuation `(C_(n+1) C_(n+1)) E` has arity four. -/
@[simp] theorem headArity_clockExit_terminal (n : Nat) (environment : Term) :
    (Term.app (clockWrappers n 0) environment).headArity = 4 := by
  simp [clockWrappers]

/-- An intermediate wrapper continuation `U_(r+1) E` has arity three. -/
@[simp] theorem headArity_clockExit_wrapper
    (n r : Nat) (environment : Term) :
    (Term.app (clockWrappers n (r + 1)) environment).headArity = 3 :=
  rfl

end PureSFormal.PureS
