import PureSFormal.AppendixF.Carrier
import PureSFormal.DefinitionAgreement

/-! A finite invariant for every reduct of AAA. The six Boolean coordinates
are grammar states. Root preservation and monotonicity lift to every context. -/
namespace PureSFormal.AppendixF.AAABoundary
open PureSFormal.PureS
local infixl:70 " ⊙ " => Term.app
set_option maxHeartbeats 5000000
set_option maxRecDepth 10000

def atom : Term := .s ⊙ .s ⊙ .s
def seed : Term := atom ⊙ atom ⊙ atom

inductive Grammar : Term → Prop where
  | atom : Grammar atom
  | app {u v} : Grammar u → Grammar v → Grammar (u ⊙ v)
  | fork {u v} : Grammar u → Grammar v → Grammar (.s ⊙ u ⊙ v)
  | unary {u v} : Grammar u → Grammar v → Grammar (.s ⊙ u ⊙ (.s ⊙ v))

structure State where
  s : Bool
  ss : Bool
  d : Bool
  sd : Bool
  g : Bool
  hot : Bool
  deriving DecidableEq, Repr

def leaf : State := ⟨true, false, false, false, false, false⟩

def branch (left right : State) : State where
  s := false
  ss := left.s && right.s
  d := (left.ss && right.s) || (left.d && right.d) ||
    (left.sd && (right.d || right.sd))
  sd := left.s && right.d
  g := (left.d && right.d) || (left.sd && (right.d || right.sd))
  hot := left.g && right.d

def eval : Term → State
  | .s => leaf
  | .app left right => branch (eval left) (eval right)

def Below (a b : State) : Prop :=
  (a.s = true → b.s = true) ∧ (a.ss = true → b.ss = true) ∧
  (a.d = true → b.d = true) ∧ (a.sd = true → b.sd = true) ∧
  (a.g = true → b.g = true) ∧ (a.hot = true → b.hot = true)

theorem Below.refl (a : State) : Below a a := ⟨id, id, id, id, id, id⟩
theorem Below.trans {a b c : State} (ab : Below a b) (bc : Below b c) : Below a c :=
  ⟨bc.1 ∘ ab.1, bc.2.1 ∘ ab.2.1, bc.2.2.1 ∘ ab.2.2.1,
   bc.2.2.2.1 ∘ ab.2.2.2.1, bc.2.2.2.2.1 ∘ ab.2.2.2.2.1,
   bc.2.2.2.2.2 ∘ ab.2.2.2.2.2⟩

theorem branch_monotone {a b x y : State} (ab : Below a b) (xy : Below x y) :
    Below (branch a x) (branch b y) := by
  rcases ab with ⟨hs, hss, hd, hsd, hg, hh⟩
  rcases xy with ⟨xs, xss, xd, xsd, xg, xh⟩
  simp only [Below, branch, Bool.and_eq_true, Bool.or_eq_true, Bool.false_eq_true,
    false_implies, true_and]
  constructor
  · rintro ⟨a, x⟩; exact ⟨hs a, xs x⟩
  constructor
  · intro h
    rcases h with (⟨a, x⟩ | ⟨a, x⟩) | ⟨a, x | x⟩
    · exact Or.inl (Or.inl ⟨hss a, xs x⟩)
    · exact Or.inl (Or.inr ⟨hd a, xd x⟩)
    · exact Or.inr ⟨hsd a, Or.inl (xd x)⟩
    · exact Or.inr ⟨hsd a, Or.inr (xsd x)⟩
  constructor
  · rintro ⟨a, x⟩; exact ⟨hs a, xd x⟩
  constructor
  · intro h
    rcases h with ⟨a, x⟩ | ⟨a, x | x⟩
    · exact Or.inl ⟨hd a, xd x⟩
    · exact Or.inr ⟨hsd a, Or.inl (xd x)⟩
    · exact Or.inr ⟨hsd a, Or.inr (xsd x)⟩
  · rintro ⟨a, x⟩; exact ⟨hg a, xd x⟩

theorem root_preserves (x y z : State) :
    Below (branch (branch (branch leaf x) y) z) (branch (branch x z) (branch y z)) := by
  cases xs : x.s <;> cases xd : x.d <;> cases ys : y.s <;>
    cases yd : y.d <;> cases ysd : y.sd <;> cases zd : z.d <;>
    simp_all [Below, branch, leaf]

theorem step_preserves {source target : Term} (step : Step source target) : Below (eval source) (eval target) := by
  have textbook := (step_iff_textbookStep source target).mp step
  clear step
  induction textbook with
  | contract x y z => exact root_preserves (eval x) (eval y) (eval z)
  | appLeft step right ih => exact branch_monotone ih (Below.refl _)
  | appRight left step ih => exact branch_monotone (Below.refl _) ih

theorem steps_preserve {source target : Term} (steps : Steps source target) : Below (eval source) (eval target) := by
  induction steps with
  | refl => exact Below.refl _
  | tail _ edge ih => exact ih.trans (step_preserves edge)

theorem eval_s_iff (t : Term) : (eval t).s = true ↔ t = .s := by
  cases t <;> simp [eval, leaf, branch]

theorem eval_ss_iff (t : Term) : (eval t).ss = true ↔ t = .s ⊙ .s := by
  cases t with
  | s => simp [eval, leaf]
  | app left right =>
    simp only [eval, branch, Bool.and_eq_true, eval_s_iff, Term.app.injEq]

theorem grammar_sound (t : Term) :
    ((eval t).d = true → Grammar t) ∧
    ((eval t).sd = true → ∃ u, Grammar u ∧ t = .s ⊙ u) := by
  induction t with
  | s => simp [eval, leaf]
  | app left right ihl ihr =>
    constructor
    · intro h
      change ((eval left).ss && (eval right).s || (eval left).d && (eval right).d ||
        (eval left).sd && ((eval right).d || (eval right).sd)) = true at h
      simp only [Bool.or_eq_true, Bool.and_eq_true] at h
      rcases h with (⟨l, r⟩ | ⟨l, r⟩) | ⟨l, r | r⟩
      · rw [(eval_ss_iff left).mp l, (eval_s_iff right).mp r]
        exact Grammar.atom
      · exact .app (ihl.1 l) (ihr.1 r)
      · obtain ⟨u, gu, eq⟩ := ihl.2 l
        rw [eq]
        exact .fork gu (ihr.1 r)
      · obtain ⟨u, gu, eql⟩ := ihl.2 l
        obtain ⟨v, gv, eqr⟩ := ihr.2 r
        rw [eql, eqr]
        exact .unary gu gv
    · intro h
      change ((eval left).s && (eval right).d) = true at h
      obtain ⟨l, r⟩ := (Bool.and_eq_true _ _).mp h
      exact ⟨right, ihr.1 r, by rw [(eval_s_iff left).mp l]⟩

theorem Grammar.arity {t : Term} (h : Grammar t) : 2 ≤ t.headArity := by
  induction h with
  | atom => exact Nat.le_refl _
  | app u v ihu ihv => change 2 ≤ _ + 1; omega
  | fork => exact Nat.le_refl _
  | unary => exact Nat.le_refl _

def Safe : Term → Prop
  | .s => True
  | .app left right => Safe left ∧ Safe right ∧ ∀ u, .app left right ≠ .s ⊙ (.s ⊙ u)

theorem safe_application {left right : Term} (hl : Safe left) (hr : Safe right)
    (notS : left ≠ .s) : Safe (left ⊙ right) :=
  ⟨hl, hr, fun _ eq => notS (Term.app.inj eq).1⟩

theorem safe_prefix {t : Term} (h : Safe t) (arity : 2 ≤ t.headArity) : Safe (.s ⊙ t) := by
  refine ⟨True.intro, h, ?_⟩
  intro u eq
  have same := congrArg Term.headArity (Term.app.inj eq).2
  simp only [Term.headArity] at same
  omega

theorem Grammar.safe {t : Term} (h : Grammar t) : Safe t := by
  induction h with
  | atom => simp [AAABoundary.atom, Safe]
  | @app u v hu hv ihu ihv =>
    apply safe_application ihu ihv
    intro eq
    have arity := hu.arity
    simp [eq] at arity
  | fork hu hv ihu ihv =>
    exact safe_application (safe_prefix ihu hu.arity) ihv (by intro eq; cases eq)
  | unary hu hv ihu ihv =>
    exact safe_application (safe_prefix ihu hu.arity) (safe_prefix ihv hv.arity) (by intro eq; cases eq)

theorem Safe.inner {t : Term} (context : Context) (safe : Safe (context.plug t)) : Safe t := by
  induction context with
  | hole => exact safe
  | appLeft context right ih => exact ih safe.1
  | appRight left context ih => exact ih safe.2.1

theorem carrier_not_safe (c : Carrier.Code) : ¬ Safe c.term := by
  induction c with
  | base u v =>
    intro h
    exact h.1.2.2 u rfl
  | tag p rest ih =>
    intro h
    exact ih h.2.1

/-- Every reduct of AAA excludes every carrier occurrence, including below
arbitrary application contexts. This is the carrier-boundary half of F.3.3. -/
theorem no_carrier_reduct (t : Term) (reachable : Steps seed t) (context : Context) (c : Carrier.Code) :
    t ≠ context.plug c.term := by
  have monotone := steps_preserve reachable
  have initial : (eval seed).d = true := rfl
  have safe := ((grammar_sound t).1 (monotone.2.2.1 initial)).safe
  intro eq
  rw [eq] at safe
  exact carrier_not_safe c (Safe.inner context safe)

theorem g_implies_d (t : Term) (h : (eval t).g = true) : (eval t).d = true := by
  cases t with
  | s => cases h
  | app left right =>
    simp only [eval, branch, Bool.or_eq_true] at h ⊢
    cases h with
    | inl yes => exact Or.inl (Or.inr yes)
    | inr yes => exact Or.inr yes

theorem hot_arity (t : Term) (h : (eval t).hot = true) : 3 ≤ t.headArity := by
  cases t with
  | s => cases h
  | app left right =>
    obtain ⟨hl, _⟩ := (Bool.and_eq_true _ _).mp h
    have bound := ((grammar_sound left).1 (g_implies_d left hl)).arity
    change 3 ≤ left.headArity + 1
    omega

theorem head_redex (t : Term) (bound : 3 ≤ t.headArity) : ∃ target, Step t target := by
  induction t with
  | s => simp [Term.headArity] at bound
  | app left right ih _ =>
    by_cases inner : 3 ≤ left.headArity
    · obtain ⟨target, step⟩ := ih inner
      exact ⟨target ⊙ right, step.appLeft right⟩
    · have count : left.headArity = 2 := by change 3 ≤ left.headArity + 1 at bound; omega
      cases left with
      | s => cases count
      | app fn y =>
        cases fn with
        | s => cases count
        | app head x =>
          cases head with
          | s => exact ⟨_, Step.root x y right⟩
          | app f a => simp only [Term.headArity] at count; omega

theorem no_normal_reduct (t : Term) (reachable : Steps seed t) : ∃ target, Step t target := by
  have monotone := steps_preserve reachable
  have initial : (eval seed).hot = true := rfl
  exact head_redex t (hot_arity t (monotone.2.2.2.2.2 initial))

def State.encode (s : State) := (s.s, s.ss, s.d, s.sd, s.g, s.hot)
def State.decode (t : Bool × Bool × Bool × Bool × Bool × Bool) : State :=
  ⟨t.1, t.2.1, t.2.2.1, t.2.2.2.1, t.2.2.2.2.1, t.2.2.2.2.2⟩
theorem State.inverse (s : State) : State.decode s.encode = s := by cases s; rfl

def states : FiniteTables.Enumeration State :=
  let b := FiniteTables.boolean
  FiniteTables.transport (FiniteTables.product b (FiniteTables.product b
    (FiniteTables.product b (FiniteTables.product b (FiniteTables.product b b)))))
      State.encode State.decode State.inverse

/-- A concrete finite tree automaton for the divergent regular invariant. -/
def automaton : PureSFormal.Research.FiniteTreeAutomatonPowerset.Deterministic State where
  cover := states.values
  covers := states.covers
  leaf := leaf
  branch := branch
  final := State.hot

theorem automaton_eval (t : Term) : automaton.eval t = eval t := by
  induction t with
  | s => rfl
  | app left right ihl ihr =>
    change branch (automaton.eval left) (automaton.eval right) = branch (eval left) (eval right)
    rw [ihl, ihr]

/-- Proposition F.3.3, quantified over every finite native reduction path. -/
theorem aaa_boundary (t : Term) (reachable : Steps seed t) :
    (∃ target, Step t target) ∧ ∀ (context : Context) (c : Carrier.Code), t ≠ context.plug c.term :=
  ⟨no_normal_reduct t reachable, no_carrier_reduct t reachable⟩

end PureSFormal.AppendixF.AAABoundary
