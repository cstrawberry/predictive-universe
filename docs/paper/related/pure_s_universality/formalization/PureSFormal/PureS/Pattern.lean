import PureSFormal.PureS.Term

/-!
# Bounded term patterns

Patterns are the declarative shape tests used by the bounded-probe layer.
Every occurrence of `hole` is an independent wildcard: matching records no
term at a hole and never compares the subtrees accepted by two holes.

This module specifies matching only.  Turning a fixed pattern into primitive
cursor movement and node tests belongs to the later probe compiler.
-/

namespace PureSFormal.PureS

/-- A finite binary pattern with independent wildcard holes. -/
inductive Pattern where
  | hole
  | s
  | app (fn arg : Pattern)
  deriving BEq, DecidableEq, Inhabited, Repr

namespace Pattern

/-- Number of pattern constructors, including wildcard holes. -/
@[simp]
def size : Pattern → Nat
  | .hole => 1
  | .s => 1
  | .app fn arg => Nat.succ (fn.size + arg.size)

theorem size_pos (pattern : Pattern) : 0 < pattern.size := by
  cases pattern <;> exact Nat.zero_lt_succ _

/-- Maximum number of pattern edges below the root. -/
@[simp]
def depth : Pattern → Nat
  | .hole => 0
  | .s => 0
  | .app fn arg => Nat.succ (Nat.max fn.depth arg.depth)

/-- Structural pattern matching as a proposition. -/
inductive Matches : Pattern → Term → Prop where
  | hole (term : Term) : Matches .hole term
  | s : Matches .s .s
  | app {fnPattern argPattern : Pattern} {fn arg : Term} :
      Matches fnPattern fn → Matches argPattern arg →
        Matches (.app fnPattern argPattern) (.app fn arg)

/-- Executable structural pattern matcher. -/
def matchesBool : Pattern → Term → Bool
  | .hole, _ => true
  | .s, .s => true
  | .app fnPattern argPattern, .app fn arg =>
      matchesBool fnPattern fn && matchesBool argPattern arg
  | _, _ => false

@[simp]
theorem matchesBool_hole (term : Term) : matchesBool .hole term = true := rfl

@[simp]
theorem matches_hole (term : Term) : Matches .hole term := .hole term

/-- Boolean acceptance implies propositional structural matching. -/
theorem matchesBool_sound {pattern : Pattern} {term : Term}
    (h : matchesBool pattern term = true) : Matches pattern term := by
  induction pattern generalizing term with
  | hole => exact .hole term
  | s =>
      cases term with
      | s => exact .s
      | app fn arg => simp [matchesBool] at h
  | app fnPattern argPattern fnIH argIH =>
      cases term with
      | s => simp [matchesBool] at h
      | app fn arg =>
          have hparts :
              matchesBool fnPattern fn = true ∧
              matchesBool argPattern arg = true := by
            simpa only [matchesBool, Bool.and_eq_true] using h
          exact .app (fnIH hparts.1) (argIH hparts.2)

/-- Propositional structural matching is accepted by the Boolean matcher. -/
theorem matchesBool_complete {pattern : Pattern} {term : Term}
    (h : Matches pattern term) : matchesBool pattern term = true := by
  induction h with
  | hole => rfl
  | s => rfl
  | app hfn harg fnIH argIH =>
      simp only [matchesBool, fnIH, argIH, Bool.true_and]

/-- The executable and propositional matchers agree exactly. -/
theorem matchesBool_eq_true_iff (pattern : Pattern) (term : Term) :
    matchesBool pattern term = true ↔ Matches pattern term :=
  ⟨matchesBool_sound, matchesBool_complete⟩

theorem matches_s_iff (term : Term) : Matches .s term ↔ term = .s := by
  constructor
  · intro h
    cases h
    rfl
  · intro h
    subst term
    exact .s

theorem matches_app_iff
    (fnPattern argPattern : Pattern) (term : Term) :
    Matches (.app fnPattern argPattern) term ↔
      ∃ fn arg,
        term = .app fn arg ∧ Matches fnPattern fn ∧ Matches argPattern arg := by
  constructor
  · intro h
    cases h with
    | app hfn harg => exact ⟨_, _, rfl, hfn, harg⟩
  · rintro ⟨fn, arg, rfl, hfn, harg⟩
    exact .app hfn harg

/--
Two occurrences of `hole` accept arbitrary and independently chosen
subtrees; in particular, no equality between `left` and `right` is needed.
-/
theorem independent_holes (left right : Term) :
    Matches (.app .hole .hole) (.app left right) := by
  exact .app (.hole left) (.hole right)

@[simp]
theorem matchesBool_independent_holes (left right : Term) :
    matchesBool (.app .hole .hole) (.app left right) = true := rfl

end Pattern

end PureSFormal.PureS
