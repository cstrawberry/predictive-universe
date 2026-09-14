import PureSFormal.Research.ProtectedTrieSingleOpening

/-!
# A monotone leaf measure for protected-trie macroedge separation

This Research module supplies the numerical invariant used to distinguish
canonical opening-path interiors.  `sLeaves` counts literal `S` occurrences.
One pure-`S` contraction duplicates its third argument, so the count never
decreases and increases strictly whenever that argument contains at least two
`S` leaves.

The first contraction of every positive six-step generator opening has the
clock `C (n + 2)` as its duplicated argument.  Its leaf count is strictly
larger than one.  Consequently no nonempty proper prefix of that opening can
return to its source term.  The same conclusion holds after the reset edge of
the seven-step zero branch.
-/

namespace PureSFormal.PureS

namespace Term

/-- Number of literal `S` leaves in an unshared pure-`S` syntax tree. -/
@[simp]
def sLeaves : Term -> Nat
  | .s => 1
  | .app fn arg => fn.sLeaves + arg.sLeaves

/-- Every closed pure-`S` term contains at least one `S` leaf. -/
theorem sLeaves_pos (term : Term) : 0 < term.sLeaves := by
  induction term with
  | s => decide
  | app fn arg ihFn ihArg =>
      exact Nat.add_pos_left ihFn _

@[simp]
theorem redex_sLeaves (x y z : Term) :
    (Term.redex x y z).sLeaves = 1 + x.sLeaves + y.sLeaves + z.sLeaves := by
  simp [Term.redex, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

@[simp]
theorem contractum_sLeaves (x y z : Term) :
    (Term.contractum x y z).sLeaves =
      x.sLeaves + y.sLeaves + z.sLeaves + z.sLeaves := by
  simp [Term.contractum, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- A root contraction cannot decrease the literal `S`-leaf count. -/
theorem redex_sLeaves_le_contractum (x y z : Term) :
    (Term.redex x y z).sLeaves <= (Term.contractum x y z).sLeaves := by
  rw [redex_sLeaves, contractum_sLeaves]
  have hz : 1 <= z.sLeaves := z.sLeaves_pos
  simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
    Nat.add_le_add_left hz (x.sLeaves + y.sLeaves + z.sLeaves)

/-- A root contraction strictly increases the count when `z` is nontrivial. -/
theorem redex_sLeaves_lt_contractum_of_one_lt (x y z : Term)
    (hz : 1 < z.sLeaves) :
    (Term.redex x y z).sLeaves < (Term.contractum x y z).sLeaves := by
  rw [redex_sLeaves, contractum_sLeaves]
  simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
    Nat.add_lt_add_left hz (x.sLeaves + y.sLeaves + z.sLeaves)

end Term

namespace Context

/-- Literal `S` leaves contributed by a context outside its unique hole. -/
def sLeavesOverhead : Context -> Nat
  | .hole => 0
  | .appLeft context right => context.sLeavesOverhead + right.sLeaves
  | .appRight left context => left.sLeaves + context.sLeavesOverhead

@[simp]
theorem plug_sLeaves (context : Context) (term : Term) :
    (context.plug term).sLeaves = context.sLeavesOverhead + term.sLeaves := by
  induction context with
  | hole => simp [Context.plug, sLeavesOverhead]
  | appLeft context right ih =>
      simp [Context.plug, sLeavesOverhead, ih, Nat.add_assoc,
        Nat.add_comm, Nat.add_left_comm]
  | appRight left context ih =>
      simp [Context.plug, sLeavesOverhead, ih, Nat.add_assoc,
        Nat.add_comm, Nat.add_left_comm]

end Context

namespace Step

/-- Every contextual pure-`S` contraction is monotone in literal leaves. -/
theorem sLeaves_mono {source target : Term} (step : Step source target) :
    source.sLeaves <= target.sLeaves := by
  obtain ⟨context, x, y, z, rfl, rfl⟩ := step
  rw [Context.plug_sLeaves, Context.plug_sLeaves]
  exact Nat.add_le_add_left (Term.redex_sLeaves_le_contractum x y z) _

end Step

namespace Steps

/-- Every finite pure-`S` reduction is monotone in literal leaves. -/
theorem sLeaves_mono {source target : Term} (steps : Steps source target) :
    source.sLeaves <= target.sLeaves := by
  induction steps with
  | refl => exact Nat.le_refl _
  | tail hprefix hlast ih => exact Nat.le_trans ih hlast.sLeaves_mono

end Steps

namespace StepsN

/-- Exact-length reductions inherit literal-leaf monotonicity. -/
theorem sLeaves_mono {count : Nat} {source target : Term}
    (steps : StepsN count source target) : source.sLeaves <= target.sLeaves := by
  induction steps with
  | refl => exact Nat.le_refl _
  | tail hprefix hlast ih => exact Nat.le_trans ih hlast.sLeaves_mono

end StepsN

end PureSFormal.PureS

namespace PureSFormal.Research.ProtectedTrieSubdivisionMeasure

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieSingleOpening

namespace ProtectedFieldContext

/-- Filling a fixed protected-field context is injective in its focus. -/
theorem plug_injective {path : List Bool}
    (context : ProtectedFieldContext path) {first second : Term}
    (heq : context.plug first = context.plug second) : first = second := by
  have hlookup := congrArg (fun term => term.subterm? context.address) heq
  have hfirst : (context.plug first).subterm? context.address = some first := by
    simpa using context.subterm?_plug_append first []
  have hsecond : (context.plug second).subterm? context.address = some second := by
    simpa using context.subterm?_plug_append second []
  change (context.plug first).subterm? context.address =
    (context.plug second).subterm? context.address at hlookup
  rw [hfirst, hsecond] at hlookup
  exact Option.some.inj hlookup

/--
Work begun in the left and right fields of one protected node cannot meet at
an interior term while the worked left field differs from the untouched
generator.  No assumption about the right-hand work term is needed.
-/
theorem left_right_interior_ne {path : List Bool}
    (context : ProtectedFieldContext path)
    (source leftWork rightWork junk : Term) (hleft : leftWork ≠ source) :
    (context.extendLeft source junk).plug leftWork ≠
      (context.extendRight source junk).plug rightWork := by
  intro heq
  rw [context.plug_extendLeft, context.plug_extendRight] at heq
  have hlocal := plug_injective context heq
  simp only [protectedNode, passive, Term.app.injEq] at hlocal
  exact hleft hlocal.1.2

end ProtectedFieldContext

/-! ## Closed clock counts -/

@[simp]
theorem b_sLeaves : b.sLeaves = 2 := rfl

/-- The unary carrier clock has an exact literal-leaf count. -/
theorem C_sLeaves (n : Nat) : (C n).sLeaves = 5 + 2 * n := by
  induction n with
  | zero => rfl
  | succ n ih =>
      simp [C, b, ih, Nat.mul_succ, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm]

/-- Every carrier clock duplicated by a positive opening is nontrivial. -/
theorem one_lt_C_sLeaves (n : Nat) : 1 < (C n).sLeaves := by
  rw [C_sLeaves]
  exact Nat.lt_of_lt_of_le (by decide : 1 < 5) (Nat.le_add_right 5 (2 * n))

/-! ## Strict first-edge separation -/

/-- The first positive opening edge strictly increases literal leaves. -/
theorem positive_first_sLeaves_strict (m n : Nat) :
    (positive0 m n).sLeaves < (positive1 m n).sLeaves := by
  have strict := Term.redex_sLeaves_lt_contractum_of_one_lt
    .s (C m) (C (n + 2)) (one_lt_C_sLeaves (n + 2))
  simpa only [positive0, positive1, D, C, b, Term.redex, Term.contractum,
    Term.sLeaves] using Nat.add_lt_add_right strict 1

/-- The zero-reset edge is nondecreasing. -/
theorem zero_reset_sLeaves_mono (n : Nat) :
    (D 0 (n + 2)).sLeaves <= (positive0 (n + 2) (n + 1)).sLeaves :=
  (zeroProper_step n .source).sLeaves_mono

/-- The first edge after zero reset strictly increases literal leaves. -/
theorem zero_positive_first_sLeaves_strict (n : Nat) :
    (positive0 (n + 2) (n + 1)).sLeaves <
      (positive1 (n + 2) (n + 1)).sLeaves :=
  positive_first_sLeaves_strict (n + 2) (n + 1)

/-- Every nonzero proper positive stage is distinct from its generator source. -/
theorem positiveProper_ne_source (m n : Nat) (stage : PositiveProperStage)
    (hstage : stage ≠ .zero) :
    positiveProperTerm m n stage ≠ positive0 m n := by
  intro heq
  have hfirst :
      (positive0 m n).sLeaves < (positive1 m n).sLeaves :=
    positive_first_sLeaves_strict m n
  cases stage with
  | zero => exact hstage rfl
  | one =>
      have hne : positive1 m n ≠ positive0 m n := by
        intro h
        exact (Nat.ne_of_lt hfirst) (congrArg Term.sLeaves h).symm
      apply hne
      simpa [positiveProperTerm] using heq
  | two =>
      have hmono := (StepsN.single (positive_step12 m n)).sLeaves_mono
      have hterm : positive2 m n = positive0 m n := by
        simpa [positiveProperTerm] using heq
      rw [hterm] at hmono
      exact (Nat.not_le_of_lt hfirst) hmono
  | three =>
      have hmono := (StepsN.tail (StepsN.single (positive_step12 m n))
        (positive_step23 m n)).sLeaves_mono
      have hterm : positive3 m n = positive0 m n := by
        simpa [positiveProperTerm] using heq
      rw [hterm] at hmono
      exact (Nat.not_le_of_lt hfirst) hmono
  | four =>
      have hmono := (StepsN.tail
        (StepsN.tail (StepsN.single (positive_step12 m n))
          (positive_step23 m n))
        (positive_step34 m n)).sLeaves_mono
      have hterm : positive4 m n = positive0 m n := by
        simpa [positiveProperTerm] using heq
      rw [hterm] at hmono
      exact (Nat.not_le_of_lt hfirst) hmono
  | five =>
      have hmono := (StepsN.tail
        (StepsN.tail
          (StepsN.tail (StepsN.single (positive_step12 m n))
            (positive_step23 m n))
          (positive_step34 m n))
        (positive_step45 m n)).sLeaves_mono
      have hterm : positive5 m n = positive0 m n := by
        simpa [positiveProperTerm] using heq
      rw [hterm] at hmono
      exact (Nat.not_le_of_lt hfirst) hmono

end PureSFormal.Research.ProtectedTrieSubdivisionMeasure
