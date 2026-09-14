import PureSFormal.PureS.ClosedTerms

/-!
# Exact appenders and retained histories

This file formalizes (C5)--(C6).  The appender for
`[a₁, ..., aₖ]` is the literal reverse construction

`Push_(L_a₁) (Push_(L_a₂) ... (Push_(L_aₖ) p) ...)`.

Executing it advances the canonical accumulator in the forward word order.
Every duplication history is retained as an explicit argument on the final
left-associated `p` spine; no field is erased or hidden behind an existential.
-/

namespace PureSFormal.PureS

/-- `Push_J(N) = S (S N) J`. -/
def push (j next : Term) : Term :=
  .app (.app .s (.app .s next)) j

/--
Equation (C5): `Push_J(N) X` reaches
`N (J X) (X (J X))` in exactly two root contractions.
-/
theorem C5_push (j next x : Term) :
    StepsN 2 (.app (push j next) x)
      (.app (.app next (.app j x)) (.app x (.app j x))) := by
  let jx : Term := .app j x
  let middle : Term := .app (.app (.app .s next) x) jx
  have first : Step (.app (push j next) x) middle := by
    simpa [push, middle, jx, Term.redex, Term.contractum] using
      Step.root (.app .s next) j x
  have second :
      Step middle (.app (.app next (.app j x)) (.app x (.app j x))) := by
    simpa [middle, jx, Term.redex, Term.contractum] using
      Step.root next x jx
  exact StepsN.tail (StepsN.single first) second

/-- Add one live cell outside the current canonical accumulator. -/
def extendAccumulator (bit : Bool) (before : Term) : Term :=
  .app (live bit) before

/-- The exact history made while extending `before` by `bit`. -/
def pushHistory (bit : Bool) (before : Term) : Term :=
  .app before (extendAccumulator bit before)

/--
The bit-list appender.  `foldr` makes the last input bit the first wrapper
constructed around `p`, and the first input bit the outermost `Push`.
-/
def appender (bits : List Bool) : Term :=
  bits.foldr (fun bit next => push (live bit) next) p

@[simp]
theorem appender_nil : appender [] = p :=
  rfl

@[simp]
theorem appender_cons (bit : Bool) (bits : List Bool) :
    appender (bit :: bits) = push (live bit) (appender bits) :=
  rfl

/--
The canonical accumulator.  For `[a₁,...,aₖ]` this is literally
`L_aₖ (... (L_a₁ V) ...)`.
-/
def appenderAccumulator (bits : List Bool) (initial : Term) : Term :=
  bits.foldl (fun before bit => extendAccumulator bit before) initial

@[simp]
theorem appenderAccumulator_nil (initial : Term) :
    appenderAccumulator [] initial = initial :=
  rfl

@[simp]
theorem appenderAccumulator_cons (bit : Bool) (bits : List Bool)
    (initial : Term) :
    appenderAccumulator (bit :: bits) initial =
      appenderAccumulator bits (extendAccumulator bit initial) :=
  rfl

theorem appenderAccumulator_append (first second : List Bool) (initial : Term) :
    appenderAccumulator (first ++ second) initial =
      appenderAccumulator second (appenderAccumulator first initial) := by
  induction first generalizing initial with
  | nil => rfl
  | cons bit rest ih => exact ih (extendAccumulator bit initial)

/-- Appending one final bit makes it the new outermost accumulator cell. -/
@[simp]
theorem appenderAccumulator_append_singleton
    (bits : List Bool) (bit : Bool) (initial : Term) :
    appenderAccumulator (bits ++ [bit]) initial =
      extendAccumulator bit (appenderAccumulator bits initial) := by
  rw [appenderAccumulator_append]
  rfl

/--
Histories in their literal final argument order.  A later push history occurs
closer to the initial `p accumulator` prefix, so the chronological history
made by the current outer `Push` is appended at the end.
-/
def retainedHistories : List Bool → Term → List Term
  | [], _ => []
  | bit :: bits, initial =>
      let next := extendAccumulator bit initial
      retainedHistories bits next ++ [pushHistory bit initial]

@[simp]
theorem retainedHistories_nil (initial : Term) :
    retainedHistories [] initial = [] :=
  rfl

@[simp]
theorem retainedHistories_cons (bit : Bool) (bits : List Bool)
    (initial : Term) :
    retainedHistories (bit :: bits) initial =
      retainedHistories bits (extendAccumulator bit initial) ++
        [pushHistory bit initial] :=
  rfl

/-- There is exactly one retained history field per appended bit. -/
theorem retainedHistories_length (bits : List Bool) (initial : Term) :
    (retainedHistories bits initial).length = bits.length := by
  induction bits generalizing initial with
  | nil => rfl
  | cons bit bits ih =>
      simp [retainedHistories, ih]

/--
The complete C6 endpoint: a left-associated `p`, the explicit canonical
accumulator, and every retained history term as a separate argument.
-/
def appenderResult (bits : List Bool) (initial : Term) : Term :=
  Term.applyArgs (.app p (appenderAccumulator bits initial))
    (retainedHistories bits initial)

@[simp]
theorem appenderResult_nil (initial : Term) :
    appenderResult [] initial = .app p initial :=
  rfl

@[simp]
theorem appenderResult_cons (bit : Bool) (bits : List Bool)
    (initial : Term) :
    appenderResult (bit :: bits) initial =
      .app (appenderResult bits (extendAccumulator bit initial))
        (pushHistory bit initial) := by
  simp [appenderResult, retainedHistories, appenderAccumulator,
    Term.applyArgs_append]

/--
Equation (C6), structurally and with its exact count.  The target is the
fully explicit `appenderResult`, so both its canonical accumulator and all
history fields remain present in the syntax tree.
-/
theorem C6_appender (bits : List Bool) (initial : Term) :
    StepsN (2 * bits.length) (.app (appender bits) initial)
      (appenderResult bits initial) := by
  induction bits generalizing initial with
  | nil =>
      exact StepsN.refl _
  | cons bit bits ih =>
      let next : Term := extendAccumulator bit initial
      let history : Term := pushHistory bit initial
      have first :
          StepsN 2 (.app (appender (bit :: bits)) initial)
            (.app (.app (appender bits) next) history) := by
        simpa [appender, next, history, extendAccumulator, pushHistory] using
          C5_push (live bit) (appender bits) initial
      have remaining :
          StepsN (2 * bits.length)
            (.app (.app (appender bits) next) history)
            (.app (appenderResult bits next) history) := by
        exact StepsN.appLeft (ih next) history
      have combined := StepsN.trans first remaining
      have hcount :
          2 * (bit :: bits).length = 2 + 2 * bits.length := by
        simp only [List.length_cons, Nat.mul_succ]
        exact Nat.add_comm _ _
      rw [hcount]
      simpa [next, history] using combined

end PureSFormal.PureS
