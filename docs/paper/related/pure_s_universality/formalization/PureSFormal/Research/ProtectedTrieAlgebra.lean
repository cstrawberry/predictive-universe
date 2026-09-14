import PureSFormal.PureS.ClosedTerms

set_option backward.isDefEq.respectTransparency false

/-!
# Protected-trie opening algebra

This local Research module checks the finite pure-`S` algebra used by the
protected binary-trie proposal.  It proves only the literal generator
openings, protected-node syntax, and the elementary phase invariant.  It does
not formalize the anchored parser, confluence, certificates, or the claimed
whole-multiway theorem.

The positive theorem is indexed as `D (m + 1) (n + 2)`: positivity of the
first clock and the lower bound two on the second clock are therefore visible
in the syntax of the statement and require no side-condition arithmetic.
-/

namespace PureSFormal.Research.ProtectedTrieAlgebra

open PureSFormal.PureS

/-- The changing finite trie generator `D_m,n = (C_m C_n) S`. -/
def D (m n : Nat) : Term :=
  .app (.app (C m) (C n)) .s

/-- A passive two-argument `S` record. -/
def passive (left right : Term) : Term :=
  .app (.app .s left) right

/-- The protected node `F(L,R,J) = S L (S R J)`. -/
def protectedNode (left right junk : Term) : Term :=
  passive left (passive right junk)

/-- The child generator produced by the positive opening with offsets `m,n`. -/
def openingChild (m n : Nat) : Term :=
  D m (n + 2)

/-- The ignored third field produced by the positive opening. -/
def openingJunk (m n : Nat) : Term :=
  .app (.app (C n) .s) (openingChild m n)

/-- The exact protected endpoint of the six-step positive opening. -/
def opened (m n : Nat) : Term :=
  protectedNode (openingChild m n) (openingChild m n) (openingJunk m n)

/-! ## Literal protected syntax -/

/-- A passive record has exactly two head-spine arguments. -/
@[simp]
theorem passive_headArity (left right : Term) :
    (passive left right).headArity = 2 :=
  rfl

/-- A passive record is not itself a saturated `S` redex. -/
@[simp]
theorem passive_contractRoot? (left right : Term) :
    (passive left right).contractRoot? = none :=
  rfl

/-- A protected node has exactly two outer head-spine arguments. -/
@[simp]
theorem protectedNode_headArity (left right junk : Term) :
    (protectedNode left right junk).headArity = 2 :=
  rfl

/-- The protected node's inner passive record also has arity two. -/
@[simp]
theorem protectedNode_inner_headArity (right junk : Term) :
    (passive right junk).headArity = 2 :=
  rfl

/-- A protected node is not itself a saturated `S` redex. -/
@[simp]
theorem protectedNode_contractRoot? (left right junk : Term) :
    (protectedNode left right junk).contractRoot? = none :=
  rfl

/-- Literal lookup of the left child at `LR`. -/
@[simp]
theorem protectedNode_LR (left right junk : Term) :
    (protectedNode left right junk).subterm?
        [.left, .right] = some left :=
  by
    cases left <;> rfl

/-- Literal lookup of the right child at `RLR`. -/
@[simp]
theorem protectedNode_RLR (left right junk : Term) :
    (protectedNode left right junk).subterm?
        [.right, .left, .right] = some right :=
  by
    cases right <;> rfl

/-- Both carrier terms `C_n` have exactly two head-spine arguments. -/
@[simp]
theorem C_headArity (n : Nat) : (C n).headArity = 2 := by
  cases n <;> rfl

/-- `D_m,n` is oversaturated: its outer head spine has four arguments. -/
@[simp]
theorem D_headArity (m n : Nat) : (D m n).headArity = 4 := by
  change Nat.succ (Nat.succ (C m).headArity) = 4
  rw [C_headArity]

/-- In particular the root of `D_m,n` is not a redex; opening begins at `L`. -/
@[simp]
theorem D_contractRoot? (m n : Nat) : (D m n).contractRoot? = none := by
  cases m <;> rfl

/-! ## Exact six- and seven-contraction openings -/

/--
For positive first clock and second clock at least two, the canonical
contractions at relative positions `L, root, L, root, RL, R` expose the
protected node in exactly six pure-`S` contractions.
-/
theorem D_succ_open_six (m n : Nat) :
    StepsN 6 (D (m + 1) (n + 2)) (opened m n) := by
  let child : Term := openingChild m n
  let q : Term := .app (C m) (C (n + 2))
  let t1 : Term := .app (.app (.app .s (C (n + 2))) q) .s
  let t2 : Term := .app (.app (C (n + 2)) .s) child
  let t3 : Term :=
    .app (.app b (.app (C (n + 1)) .s)) child
  let t4 : Term :=
    .app (.app .s child) (.app (.app (C (n + 1)) .s) child)
  let t5 : Term :=
    .app (.app .s child)
      (.app (.app b (.app (C n) .s)) child)

  have h1 : Step (D (m + 1) (n + 2)) t1 := by
    simpa [D, t1, q, C, b, Term.redex, Term.contractum] using
      Step.appLeft (Step.root (.s : Term) (C m) (C (n + 2))) (.s : Term)
  have h2 : Step t1 t2 := by
    simpa [t1, t2, q, child, openingChild, D, Term.redex,
      Term.contractum] using
      Step.root (C (n + 2)) q (.s : Term)
  have h3 : Step t2 t3 := by
    simpa [t2, t3, child, C, b, Term.redex, Term.contractum] using
      Step.appLeft
        (Step.root (.s : Term) (C (n + 1)) (.s : Term)) child
  have h4 : Step t3 t4 := by
    simpa [t3, t4, b, Term.redex, Term.contractum] using
      Step.root (.s : Term) (.app (C (n + 1)) .s) child
  have h5 : Step t4 t5 := by
    have hlocal :
        Step
          (.app (.app (C (n + 1)) .s) child)
          (.app (.app b (.app (C n) .s)) child) := by
      simpa [C, b, Term.redex, Term.contractum] using
        Step.appLeft (Step.root (.s : Term) (C n) (.s : Term)) child
    simpa [t4, t5] using Step.appRight (.app .s child) hlocal
  have h6 : Step t5 (opened m n) := by
    have hlocal :
        Step
          (.app (.app b (.app (C n) .s)) child)
          (passive child (.app (.app (C n) .s) child)) := by
      simpa [passive, b, Term.redex, Term.contractum] using
        Step.root (.s : Term) (.app (C n) .s) child
    simpa [t5, opened, protectedNode, openingJunk, child] using!
      Step.appRight (.app .s child) hlocal

  exact StepsN.tail
    (StepsN.tail
      (StepsN.tail
        (StepsN.tail
          (StepsN.tail (StepsN.single h1) h2)
          h3)
        h4)
      h5)
    h6

/-- The zero first clock resets in one left-child contraction. -/
theorem D_zero_reset_one (n : Nat) :
    StepsN 1 (D 0 n) (D (n + 1) (n + 1)) := by
  apply StepsN.single
  simpa [D, C, b, Term.redex, Term.contractum] using
    Step.appLeft (Step.root b b (C n)) (.s : Term)

/-- The zero branch resets once and then opens in six further contractions. -/
theorem D_zero_open_seven (n : Nat) :
    StepsN 7 (D 0 (n + 2)) (opened (n + 2) (n + 1)) := by
  have reset := D_zero_reset_one (n + 2)
  have hopen := D_succ_open_six (n + 2) (n + 1)
  simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
    StepsN.trans reset hopen

/-- The six-step endpoint contains its child literally at `LR`. -/
@[simp]
theorem opened_LR (m n : Nat) :
    (opened m n).subterm? [.left, .right] =
      some (openingChild m n) :=
  rfl

/-- The six-step endpoint contains the second literal child at `RLR`. -/
@[simp]
theorem opened_RLR (m n : Nat) :
    (opened m n).subterm? [.right, .left, .right] =
      some (openingChild m n) :=
  rfl

/-! ## Clock phase -/

/-- The child phase produced by one completed opening. -/
def nextPhase : Nat × Nat → Nat × Nat
  | (0, n) => (n, n + 1)
  | (m + 1, n) => (m, n)

@[simp]
theorem nextPhase_zero (n : Nat) : nextPhase (0, n) = (n, n + 1) :=
  rfl

@[simp]
theorem nextPhase_succ (m n : Nat) : nextPhase (m + 1, n) = (m, n) :=
  rfl

/-- The elementary invariant used by the generator: `n ≥ 2` and `m ≤ n`. -/
def GoodPhase (phase : Nat × Nat) : Prop :=
  2 ≤ phase.2 ∧ phase.1 ≤ phase.2

/-- The initial generator `D_2,2` has a good phase. -/
theorem goodPhase_initial : GoodPhase (2, 2) := by
  exact ⟨by decide, by decide⟩

/-- A completed opening preserves the elementary phase invariant. -/
theorem GoodPhase.next {phase : Nat × Nat} (h : GoodPhase phase) :
    GoodPhase (nextPhase phase) := by
  rcases phase with ⟨m, n⟩
  rcases h with ⟨hn, hmn⟩
  cases m with
  | zero =>
      exact ⟨Nat.le_trans hn (Nat.le_succ n), Nat.le_succ n⟩
  | succ m =>
      exact ⟨hn, Nat.le_trans (Nat.le_succ m) hmn⟩

/-- The phase reached after a fixed trie depth. -/
def phaseAt : Nat → Nat × Nat
  | 0 => (2, 2)
  | depth + 1 => nextPhase (phaseAt depth)

/-- Every finite-depth generator retains the phase invariant. -/
theorem goodPhase_phaseAt (depth : Nat) : GoodPhase (phaseAt depth) := by
  induction depth with
  | zero => exact goodPhase_initial
  | succ depth ih => exact ih.next

/-- In particular, every finite-depth generator keeps second index at least two. -/
theorem phaseAt_second_ge_two (depth : Nat) : 2 ≤ (phaseAt depth).2 :=
  (goodPhase_phaseAt depth).1

end PureSFormal.Research.ProtectedTrieAlgebra
