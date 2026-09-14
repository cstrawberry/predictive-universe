import PureSFormal.PureS.CountedReduction

/-!
# Closed terms from Section 0

The definitions below are literal unshared pure-`S` syntax trees.  The
counted theorems prove the two branches of (C1), the front-innermost word
orientation (C3), and live-cell deletion (C4) using only contextual instances
of the single pure-`S` rule.
-/

namespace PureSFormal.PureS

/-- `b = S S`. -/
def b : Term := .app .s .s

/-- `p = S b`. -/
def p : Term := .app .s b

/-- Unary carrier numerals: `C₀ = S b b` and `Cₙ₊₁ = b Cₙ`. -/
def C : Nat → Term
  | 0 => .app (.app .s b) b
  | n + 1 => .app b (C n)

/-- The closed tag `v₀ = S C₀`. -/
def v0 : Term := .app .s (C 0)

/-- The closed tag `v₁ = S (S C₀)`. -/
def v1 : Term := .app .s (.app .s (C 0))

/-- Select the reserved closed value tag belonging to a binary symbol. -/
def valueTag : Bool → Term
  | false => v0
  | true => v1

/-- The live-cell constructor `Lᵢ = b vᵢ`. -/
def live (bit : Bool) : Term := .app b (valueTag bit)

/-- The queue sentinel `Omega = S`. -/
def omega : Term := .s

/--
Encode a binary word with its logical front innermost.  Folding from the left
makes every later bit an outer live cell:
`word [a₁, ..., aₘ] = L_aₘ (... (L_a₁ Omega) ...)`.
-/
def word (bits : List Bool) : Term :=
  bits.foldl (fun acc bit => .app (live bit) acc) omega

@[simp]
theorem word_nil : word [] = omega :=
  rfl

/-- Splitting a word continues wrapping the suffix outside the initial part. -/
theorem word_append (initial suffix : List Bool) :
    word (initial ++ suffix) =
      suffix.foldl (fun acc bit => .app (live bit) acc) (word initial) := by
  have fold : ∀ (before : List Bool) (start : Term),
      (before ++ suffix).foldl (fun acc bit => .app (live bit) acc) start =
        suffix.foldl (fun acc bit => .app (live bit) acc)
          (before.foldl (fun acc bit => .app (live bit) acc) start) := by
    intro before
    induction before with
    | nil => intro start; rfl
    | cons bit rest ih =>
        intro start
        exact ih (.app (live bit) start)
  exact fold initial omega

/-- Appending a rear bit adds exactly one outer live-cell constructor. -/
@[simp]
theorem word_append_singleton (bits : List Bool) (bit : Bool) :
    word (bits ++ [bit]) = .app (live bit) (word bits) := by
  rw [word_append]
  rfl

@[simp]
theorem word_singleton (bit : Bool) :
    word [bit] = .app (live bit) omega :=
  rfl

/-- A concrete two-symbol statement of the front-innermost orientation. -/
theorem word_pair (front rear : Bool) :
    word [front, rear] = .app (live rear) (.app (live front) omega) :=
  rfl

/--
The successor-carrier branch of (C1): for arbitrary terms `X,Y`,
`C_(n+1) X Y` reaches `X Y (C_n X Y)` in exactly two contractions.
-/
theorem C1_succ (n : Nat) (x y : Term) :
    StepsN 2 (.app (.app (C (n + 1)) x) y)
      (.app (.app x y) (.app (.app (C n) x) y)) := by
  let middle : Term := .app (.app (.app .s x) (.app (C n) x)) y
  have first : Step (.app (.app (C (n + 1)) x) y) middle := by
    simpa [middle, C, b, Term.redex, Term.contractum] using
      Step.appLeft (Step.root (.s : Term) (C n) x) y
  have second :
      Step middle (.app (.app x y) (.app (.app (C n) x) y)) := by
    simpa [middle, Term.redex, Term.contractum] using
      Step.root x (.app (C n) x) y
  exact StepsN.tail (StepsN.single first) second

/--
The zero-carrier branch of (C1): for arbitrary terms `X,Y`, `C₀ X Y`
reaches the displayed base expression in exactly five contractions.
-/
theorem C1_zero (x y : Term) :
    StepsN 5 (.app (.app (C 0) x) y)
      (.app
        (.app y (.app (.app x (.app b x)) y))
        (.app (.app x y) (.app (.app x (.app b x)) y))) := by
  let bx : Term := .app b x
  let q : Term := .app (.app x bx) y
  let t1 : Term := .app (.app bx bx) y
  let t2 : Term := .app (.app (.app .s bx) (.app x bx)) y
  let t3 : Term := .app (.app bx y) q
  let t4 : Term := .app (.app (.app .s y) (.app x y)) q

  have h1 : Step (.app (.app (C 0) x) y) t1 := by
    simpa [t1, bx, C, Term.redex, Term.contractum] using
      Step.appLeft (Step.root b b x) y
  have h2 : Step t1 t2 := by
    simpa [t1, t2, bx, b, Term.redex, Term.contractum] using
      Step.appLeft (Step.root (.s : Term) x bx) y
  have h3 : Step t2 t3 := by
    simpa [t2, t3, q, Term.redex, Term.contractum] using
      Step.root bx (.app x bx) y
  have h4 : Step t3 t4 := by
    simpa [t3, t4, bx, b, Term.redex, Term.contractum] using
      Step.appLeft (Step.root (.s : Term) x y) q
  have h5 :
      Step t4
        (.app
          (.app y (.app (.app x (.app b x)) y))
          (.app (.app x y) (.app (.app x (.app b x)) y))) := by
    simpa [t4, q, bx, Term.redex, Term.contractum] using
      Step.root y (.app x y) q

  exact StepsN.tail
    (StepsN.tail
      (StepsN.tail
        (StepsN.tail (StepsN.single h1) h2)
        h3)
      h4)
    h5

/-- The direct alpha field `alpha = (E (b E)) B` of the base carrier. -/
def baseAlpha (e continuation : Term) : Term :=
  .app (.app e (.app b e)) continuation

/-- The second base field `beta = (E B) alpha`. -/
def baseBeta (e continuation : Term) : Term :=
  .app (.app e continuation) (baseAlpha e continuation)

/-- The literal base carrier `Base_B = B alpha beta`. -/
def baseCarrier (e continuation : Term) : Term :=
  .app (.app continuation (baseAlpha e continuation))
    (baseBeta e continuation)

/-- One pending frame `E B [-]`. -/
def frame (e continuation body : Term) : Term :=
  .app (.app e continuation) body

/-- Exactly `n` nested pending frames around the literal base carrier. -/
def nestedFrames (e continuation : Term) : Nat → Term
  | 0 => baseCarrier e continuation
  | n + 1 => frame e continuation (nestedFrames e continuation n)

@[simp]
theorem nestedFrames_zero (e continuation : Term) :
    nestedFrames e continuation 0 = baseCarrier e continuation :=
  rfl

@[simp]
theorem nestedFrames_succ (e continuation : Term) (n : Nat) :
    nestedFrames e continuation (n + 1) =
      frame e continuation (nestedFrames e continuation n) :=
  rfl

/--
Equation (C2), with its exact contraction count: `C_n E B` expands to `n`
literal `E B [-]` frames around `Base_B` in exactly `2*n+5` contractions.
-/
theorem C2_frames (n : Nat) (e continuation : Term) :
    StepsN (2 * n + 5) (.app (.app (C n) e) continuation)
      (nestedFrames e continuation n) := by
  induction n with
  | zero =>
      simpa [nestedFrames, baseCarrier, baseBeta, baseAlpha, frame] using
        C1_zero e continuation
  | succ n ih =>
      have first :
          StepsN 2 (.app (.app (C (n + 1)) e) continuation)
            (frame e continuation (.app (.app (C n) e) continuation)) := by
        simpa [frame] using C1_succ n e continuation
      have inside :
          StepsN (2 * n + 5)
            (frame e continuation (.app (.app (C n) e) continuation))
            (frame e continuation (nestedFrames e continuation n)) := by
        simpa [frame] using
          StepsN.appRight (.app e continuation) ih
      have combined := StepsN.trans first inside
      have hcount : 2 * (n + 1) + 5 = 2 + (2 * n + 5) := by
        simp [Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      rw [hcount]
      exact combined

/--
The live-cell law (C4): `L_i W` becomes the transparent tombstone
`S W (v_i W)` in exactly one contraction, uniformly in `W`.
-/
theorem C4_live_delete (bit : Bool) (w : Term) :
    StepsN 1 (.app (live bit) w)
      (.app (.app .s w) (.app (valueTag bit) w)) := by
  apply StepsN.single
  simpa [live, b, Term.redex, Term.contractum] using
    Step.root (.s : Term) (valueTag bit) w

@[simp] theorem size_b : b.size = 3 := rfl
@[simp] theorem size_p : p.size = 5 := rfl
@[simp] theorem size_C_zero : (C 0).size = 9 := rfl

theorem size_C (n : Nat) : (C n).size = 9 + 4 * n := by
  induction n with
  | zero => rfl
  | succ n ih =>
      simp [C, b, ih, Nat.mul_succ, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm]
      rw [← Nat.add_assoc]

@[simp] theorem size_v0 : v0.size = 11 := rfl
@[simp] theorem size_v1 : v1.size = 13 := rfl
@[simp] theorem size_live_false : (live false).size = 15 := rfl
@[simp] theorem size_live_true : (live true).size = 17 := rfl
@[simp] theorem size_omega : omega.size = 1 := rfl

end PureSFormal.PureS
