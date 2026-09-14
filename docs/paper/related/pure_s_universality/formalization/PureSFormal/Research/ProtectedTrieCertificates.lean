import Std

/-!
# Protected-trie certificate addresses

This local Research module formalizes only the finite bitstring coding used
by the protected-trie certificate proposal.  Histories and payloads are both
literal Boolean words.  There is no machine model, tableau verifier, or
claim about pure-`S` reduction in this file.

For a history bit `b`, the route code emits the pair `1b`.  A certificate
then emits a `0` separator and the self-delimiting payload
`1^|x| 0 x`.  The main result says that two complete certificate addresses
can be prefix-related only when both their histories and payloads agree.
-/

namespace PureSFormal.Research.ProtectedTrieCertificates

/-- Literal bit words used for histories, routes, and certificate payloads. -/
abbrev BitWord := List Bool

/-- `WordPrefix xs ys` means that `xs` is an initial segment of `ys`. -/
inductive WordPrefix : BitWord → BitWord → Prop where
  | nil (ys : BitWord) : WordPrefix [] ys
  | cons (bit : Bool) {xs ys : BitWord} :
      WordPrefix xs ys → WordPrefix (bit :: xs) (bit :: ys)

namespace WordPrefix

/-- Every word is a prefix of itself. -/
theorem refl (xs : BitWord) : WordPrefix xs xs := by
  induction xs with
  | nil => exact .nil []
  | cons bit xs ih => exact .cons bit ih

/-- Cancel a common leading bit from a prefix proof. -/
theorem tail {bit : Bool} {xs ys : BitWord}
    (h : WordPrefix (bit :: xs) (bit :: ys)) : WordPrefix xs ys := by
  cases h with
  | cons _ htail => exact htail

/-- Prefix-related nonempty words have the same leading bit. -/
theorem head_eq {leftBit rightBit : Bool} {xs ys : BitWord}
    (h : WordPrefix (leftBit :: xs) (rightBit :: ys)) :
    leftBit = rightBit := by
  cases h
  rfl

/-- A nonempty word cannot prefix the empty word. -/
theorem not_cons_nil (bit : Bool) (xs : BitWord) :
    ¬ WordPrefix (bit :: xs) [] := by
  intro h
  cases h

/-- Words with different leading bits cannot be prefix-related. -/
theorem not_false_true (xs ys : BitWord) :
    ¬ WordPrefix (false :: xs) (true :: ys) := by
  intro h
  cases h

/-- Words with different leading bits cannot be prefix-related. -/
theorem not_true_false (xs ys : BitWord) :
    ¬ WordPrefix (true :: xs) (false :: ys) := by
  intro h
  cases h

/-- A prefix with the same finite length is the whole word. -/
theorem eq_of_length_eq {xs ys : BitWord} (h : WordPrefix xs ys)
    (hlen : xs.length = ys.length) : xs = ys := by
  induction h with
  | nil ys =>
      cases ys with
      | nil => rfl
      | cons bit ys => cases hlen
  | cons bit htail ih =>
      exact congrArg (List.cons bit) (ih (Nat.succ.inj hlen))

end WordPrefix

/-- Emit `n` one-bits, then a zero delimiter, then `payload`. -/
def unaryPayload : Nat → BitWord → BitWord
  | 0, payload => false :: payload
  | n + 1, payload => true :: unaryPayload n payload

/-- The route code `r(ε)=ε`, `r(bh)=1 b r(h)`. -/
def r : BitWord → BitWord
  | [] => []
  | bit :: history => true :: bit :: r history

/-- The self-delimiting payload code `pc(x)=1^|x| 0 x`. -/
def pc (payload : BitWord) : BitWord :=
  unaryPayload payload.length payload

/-- The complete candidate address `a(h,x)=r(h) 0 pc(x)`. -/
def a (history payload : BitWord) : BitWord :=
  r history ++ false :: pc payload

/-- The open router immediately below a history region, `r(h)1`. -/
def router (history : BitWord) : BitWord :=
  r history ++ [true]

@[simp]
theorem unaryPayload_zero (payload : BitWord) :
    unaryPayload 0 payload = false :: payload :=
  rfl

@[simp]
theorem unaryPayload_succ (n : Nat) (payload : BitWord) :
    unaryPayload (n + 1) payload = true :: unaryPayload n payload :=
  rfl

/-- `unaryPayload` is the displayed replicate-and-delimit word. -/
theorem unaryPayload_eq_replicate (n : Nat) (payload : BitWord) :
    unaryPayload n payload =
      List.replicate n true ++ false :: payload := by
  induction n with
  | zero => rfl
  | succ n ih =>
      change true :: unaryPayload n payload =
        true :: (List.replicate n true ++ false :: payload)
      exact congrArg (List.cons true) ih

/-- Literal form of the advertised self-delimiting payload. -/
theorem pc_eq_replicate (payload : BitWord) :
    pc payload =
      List.replicate payload.length true ++ false :: payload := by
  exact unaryPayload_eq_replicate payload.length payload

@[simp]
theorem r_nil : r [] = [] :=
  rfl

@[simp]
theorem r_cons (bit : Bool) (history : BitWord) :
    r (bit :: history) = true :: bit :: r history :=
  rfl

/-- Appending one occurrence bit appends its literal `1b` route block. -/
theorem r_append_singleton (history : BitWord) (bit : Bool) :
    r (history ++ [bit]) = r history ++ [true, bit] := by
  induction history with
  | nil => rfl
  | cons head history ih =>
      change true :: head :: r (history ++ [bit]) =
        true :: head :: (r history ++ [true, bit])
      exact congrArg (fun suffix => true :: head :: suffix) ih

/-- Route coding is injective. -/
theorem r_injective {left right : BitWord} (heq : r left = r right) :
    left = right := by
  induction left generalizing right with
  | nil =>
      cases right with
      | nil => rfl
      | cons bit right =>
          change [] = true :: bit :: r right at heq
          cases heq
  | cons bit left ih =>
      cases right with
      | nil =>
          change true :: bit :: r left = [] at heq
          cases heq
      | cons other right =>
          change true :: bit :: r left = true :: other :: r right at heq
          have hinner : bit :: r left = other :: r right :=
            (List.cons.inj heq).2
          obtain ⟨rfl, htail⟩ := List.cons.inj hinner
          exact congrArg (List.cons bit) (ih htail)

@[simp]
theorem a_nil (payload : BitWord) :
    a [] payload = false :: pc payload :=
  rfl

@[simp]
theorem a_cons (bit : Bool) (history payload : BitWord) :
    a (bit :: history) payload = true :: bit :: a history payload :=
  rfl

@[simp]
theorem router_nil : router [] = [true] :=
  rfl

@[simp]
theorem router_cons (bit : Bool) (history : BitWord) :
    router (bit :: history) = true :: bit :: router history :=
  rfl

/-- Delimiter positions agree whenever two unary-delimited words prefix. -/
theorem unaryPayload_prefix {leftCount rightCount : Nat}
    {leftPayload rightPayload : BitWord}
    (h : WordPrefix (unaryPayload leftCount leftPayload)
      (unaryPayload rightCount rightPayload)) :
    leftCount = rightCount ∧ WordPrefix leftPayload rightPayload := by
  induction leftCount generalizing rightCount with
  | zero =>
      cases rightCount with
      | zero =>
          exact ⟨rfl, WordPrefix.tail h⟩
      | succ rightCount =>
          exact (WordPrefix.not_false_true _ _ h).elim
  | succ leftCount ih =>
      cases rightCount with
      | zero =>
          exact (WordPrefix.not_true_false _ _ h).elim
      | succ rightCount =>
          have htail := WordPrefix.tail h
          obtain ⟨hcount, hpayload⟩ := ih htail
          exact ⟨congrArg Nat.succ hcount, hpayload⟩

/-- Two complete self-delimiting payloads can prefix only when equal. -/
theorem pc_prefix_eq {left right : BitWord}
    (h : WordPrefix (pc left) (pc right)) : left = right := by
  obtain ⟨hlen, hprefix⟩ := unaryPayload_prefix h
  exact WordPrefix.eq_of_length_eq hprefix hlen

/-- The complete candidate-address family is globally prefix-free. -/
theorem a_prefix_eq {leftHistory rightHistory leftPayload rightPayload : BitWord}
    (h : WordPrefix (a leftHistory leftPayload)
      (a rightHistory rightPayload)) :
    leftHistory = rightHistory ∧ leftPayload = rightPayload := by
  induction leftHistory generalizing rightHistory with
  | nil =>
      cases rightHistory with
      | nil =>
          exact ⟨rfl, pc_prefix_eq (WordPrefix.tail h)⟩
      | cons bit rightHistory =>
          exact (WordPrefix.not_false_true _ _ h).elim
  | cons bit leftHistory ih =>
      cases rightHistory with
      | nil =>
          exact (WordPrefix.not_true_false _ _ h).elim
      | cons other rightHistory =>
          have hblocks := WordPrefix.tail h
          have hbit : bit = other := WordPrefix.head_eq hblocks
          subst other
          obtain ⟨hhistory, hpayload⟩ := ih (WordPrefix.tail hblocks)
          exact ⟨congrArg (List.cons bit) hhistory, hpayload⟩

/-- Iff form of global prefix-freeness. -/
theorem a_prefix_iff {leftHistory rightHistory leftPayload rightPayload : BitWord} :
    WordPrefix (a leftHistory leftPayload) (a rightHistory rightPayload) ↔
      leftHistory = rightHistory ∧ leftPayload = rightPayload := by
  constructor
  · exact a_prefix_eq
  · rintro ⟨rfl, rfl⟩
    exact WordPrefix.refl _

/-- In particular, the pair-valued candidate-address map is injective. -/
theorem a_injective {left right : BitWord × BitWord}
    (heq : a left.1 left.2 = a right.1 right.2) : left = right := by
  have hprefix : WordPrefix (a left.1 left.2) (a right.1 right.2) := by
    rw [heq]
    exact WordPrefix.refl _
  obtain ⟨hhistory, hpayload⟩ := a_prefix_eq hprefix
  exact Prod.ext hhistory hpayload

/-- A complete candidate certificate is never a prefix of a router address. -/
theorem a_not_prefix_router (history payload routeHistory : BitWord) :
    ¬ WordPrefix (a history payload) (router routeHistory) := by
  induction history generalizing routeHistory with
  | nil =>
      cases routeHistory with
      | nil =>
          intro h
          exact WordPrefix.not_false_true _ _ h
      | cons other routeHistory =>
          intro h
          exact WordPrefix.not_false_true _ _ h
  | cons bit history ih =>
      cases routeHistory with
      | nil =>
          intro h
          have htail := WordPrefix.tail h
          exact WordPrefix.not_cons_nil bit (a history payload) htail
      | cons other routeHistory =>
          intro h
          have hblocks := WordPrefix.tail h
          have hbit : bit = other := WordPrefix.head_eq hblocks
          subst other
          exact ih routeHistory (WordPrefix.tail hblocks)

/-- Consequently, a complete candidate address is not itself a router. -/
theorem a_ne_router (history payload routeHistory : BitWord) :
    a history payload ≠ router routeHistory := by
  intro heq
  apply a_not_prefix_router history payload routeHistory
  rw [heq]
  exact WordPrefix.refl _

end PureSFormal.Research.ProtectedTrieCertificates
