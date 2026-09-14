import PureSFormal.PureS.CountedReduction
import PureSFormal.PureS.TermGrowth

/-!
# Structural bounds for addressed pure-S reduction

This module records the bounds needed by a shared-store implementation.
Height counts nodes on a longest root-to-leaf path.  A single pure-S
contraction raises whole-term height by at most one.  Consequently every
address occurring after `steps` contractions from `source` has length at
most `source.size + steps`.
-/

namespace PureSFormal.CostModel

open PureSFormal.PureS

namespace Term

/-- Number of nodes on a longest root-to-leaf path. -/
@[simp]
def height : PureS.Term → Nat
  | .s => 1
  | .app fn arg => Nat.succ (max (height fn) (height arg))

theorem height_pos (term : PureS.Term) : 0 < height term := by
  cases term <;> simp [height]

/-- Height never exceeds ordinary unfolded syntax-tree size. -/
theorem height_le_size (term : PureS.Term) : height term ≤ term.size := by
  induction term with
  | s => simp [height, PureS.Term.size]
  | app fn arg ihFn ihArg =>
      simp only [height, PureS.Term.size]
      have leftBound : height fn ≤ fn.size + arg.size :=
        Nat.le_trans ihFn (Nat.le_add_right fn.size arg.size)
      have rightBound : height arg ≤ fn.size + arg.size :=
        Nat.le_trans ihArg (Nat.le_add_left arg.size fn.size)
      exact Nat.succ_le_succ
        (Nat.max_le.mpr ⟨leftBound, rightBound⟩)

/-- The root contractum raises height by at most one. -/
theorem contractum_height_le_redex_height_add_one
    (x y z : PureS.Term) :
    height (PureS.Term.contractum x y z) ≤
      height (PureS.Term.redex x y z) + 1 := by
  simp only [PureS.Term.contractum, PureS.Term.redex, height]
  apply Nat.succ_le_succ
  refine (Nat.max_le).2 ⟨?_, ?_⟩
  · apply Nat.succ_le_succ
    refine (Nat.max_le).2 ⟨?_, ?_⟩
    · exact Nat.le_trans
        (Nat.le_trans (Nat.le_max_right 1 (height x))
          (Nat.le_succ (max 1 (height x))))
        (Nat.le_trans
          (Nat.le_trans
            (Nat.le_max_left (max 1 (height x) + 1) (height y))
            (Nat.le_succ _))
          (Nat.le_max_left _ (height z)))
    · exact Nat.le_max_right _ (height z)
  · apply Nat.succ_le_succ
    refine (Nat.max_le).2 ⟨?_, ?_⟩
    · exact Nat.le_trans
        (Nat.le_trans
          (Nat.le_max_right (max 1 (height x) + 1) (height y))
          (Nat.le_succ _))
        (Nat.le_max_left _ (height z))
    · exact Nat.le_max_right _ (height z)

/-- A successful lookup consumes one unit of height per traversed edge. -/
theorem address_length_add_height_le
    {term found : PureS.Term} {address : Address}
    (lookup : term.subterm? address = some found) :
    address.length + height found ≤ height term := by
  induction address generalizing term with
  | nil =>
      have same : term = found := by
        simpa only [PureS.Term.subterm?, Option.some.injEq] using lookup
      subst found
      simp
  | cons direction rest ih =>
      cases term with
      | s =>
          cases direction <;> simp [PureS.Term.subterm?] at lookup
      | app fn arg =>
          cases direction with
          | left =>
              have child : fn.subterm? rest = some found := by
                simpa only [PureS.Term.subterm?] using lookup
              have bound := ih child
              simp only [List.length_cons, height]
              have branch := Nat.le_trans bound (Nat.le_max_left (height fn) (height arg))
              simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
                Nat.succ_le_succ branch
          | right =>
              have child : arg.subterm? rest = some found := by
                simpa only [PureS.Term.subterm?] using lookup
              have bound := ih child
              simp only [List.length_cons, height]
              have branch := Nat.le_trans bound (Nat.le_max_right (height fn) (height arg))
              simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
                Nat.succ_le_succ branch

/-- Every valid address is strictly shorter than the containing term's height. -/
theorem address_length_lt_height
    {term found : PureS.Term} {address : Address}
    (lookup : term.subterm? address = some found) :
    address.length < height term := by
  have bound := address_length_add_height_le lookup
  have positive := height_pos found
  have oneLe : 1 ≤ height found := positive
  have raised : address.length + 1 ≤ address.length + height found :=
    Nat.add_le_add_left oneLe address.length
  exact Nat.lt_of_lt_of_le (Nat.lt_succ_self address.length)
    (Nat.le_trans raised bound)

end Term

namespace Context

/-- Replacing a context hole by a term whose height rises by at most one
raises the filled term's height by at most one. -/
theorem plug_height_le_add_one
    (context : PureS.Context) {before after : PureS.Term}
    (hlocal : Term.height after ≤ Term.height before + 1) :
    Term.height (context.plug after) ≤
      Term.height (context.plug before) + 1 := by
  induction context with
  | hole => simpa only [PureS.Context.plug] using hlocal
  | appLeft context right ih =>
      simp only [PureS.Context.plug, Term.height]
      have lifted := ih
      apply Nat.succ_le_succ
      refine (Nat.max_le).2 ⟨?_, ?_⟩
      · exact Nat.le_trans lifted
          (Nat.add_le_add_right
            (Nat.le_max_left (Term.height (context.plug before))
              (Term.height right)) 1)
      · exact Nat.le_trans
          (Nat.le_max_right (Term.height (context.plug before))
            (Term.height right))
          (Nat.le_add_right _ 1)
  | appRight left context ih =>
      simp only [PureS.Context.plug, Term.height]
      have lifted := ih
      apply Nat.succ_le_succ
      refine (Nat.max_le).2 ⟨?_, ?_⟩
      · exact Nat.le_trans
          (Nat.le_max_left (Term.height left)
            (Term.height (context.plug before)))
          (Nat.le_add_right _ 1)
      · exact Nat.le_trans lifted
          (Nat.add_le_add_right
            (Nat.le_max_right (Term.height left)
              (Term.height (context.plug before))) 1)

end Context

namespace Step

/-- One contextual pure-S contraction raises whole-term height by at most one. -/
theorem target_height_le_source_add_one
    {source target : PureS.Term} (step : PureS.Step source target) :
    Term.height target ≤ Term.height source + 1 := by
  obtain ⟨context, x, y, z, rfl, rfl⟩ := step
  exact Context.plug_height_le_add_one context
    (Term.contractum_height_le_redex_height_add_one x y z)

end Step

namespace StepsN

/-- An exact `steps`-contraction reduction raises height by at most `steps`. -/
theorem target_height_le_source_add_steps
    {steps : Nat} {source target : PureS.Term}
    (reduction : PureS.StepsN steps source target) :
    Term.height target ≤ Term.height source + steps := by
  induction reduction with
  | refl => simp
  | @tail steps source middle target hprefix hlast ih =>
      have lastBound := Step.target_height_le_source_add_one hlast
      exact Nat.le_trans lastBound <| by
        simpa [Nat.add_assoc] using Nat.add_le_add_right ih 1

/-- Every valid occurrence address after `steps` contractions has length at
most `source.size + steps`. -/
theorem address_length_le_initial_size_add_steps
    {steps : Nat} {source target found : PureS.Term} {address : Address}
    (reduction : PureS.StepsN steps source target)
    (lookup : target.subterm? address = some found) :
    address.length ≤ source.size + steps := by
  have addressBound := Nat.le_of_lt (Term.address_length_lt_height lookup)
  have heightBound := target_height_le_source_add_steps reduction
  have initialBound := Term.height_le_size source
  exact Nat.le_trans addressBound <|
    Nat.le_trans heightBound (Nat.add_le_add_right initialBound steps)

end StepsN

end PureSFormal.CostModel
