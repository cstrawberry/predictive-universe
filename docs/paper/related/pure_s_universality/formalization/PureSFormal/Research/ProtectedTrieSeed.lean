import PureSFormal.Research.ProtectedTrieParser

/-!
# Frozen seed and initial protected-trie encoder

This local Research module instantiates the generic frozen-header results with
the literal bitstring encoding

`N [] = S`, `N (0 :: w) = S S (N w)`, and
`N (1 :: w) = S (S S) (N w)`.

Every value is a finite closed pure-`S` term because `Term` has no variable
constructor.  The results below additionally prove syntactic injectivity and
normality under arbitrary contextual pure-`S` contraction.  The final encoder
only places that frozen seed beside the initial generator `D 2 2`; this module
does not claim finite range, confluence, certificates, or multiway universality.
-/

namespace PureSFormal.Research.ProtectedTrieSeed

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieParser

/-! ## Literal finite seed code -/

/-- The normal pure-`S` encoding of a finite bitstring. -/
def N : List Bool -> Term
  | [] => .s
  | false :: bits => passive .s (N bits)
  | true :: bits => passive b (N bits)

@[simp]
theorem N_nil : N [] = .s :=
  rfl

@[simp]
theorem N_false (bits : List Bool) :
    N (false :: bits) = passive .s (N bits) :=
  rfl

@[simp]
theorem N_true (bits : List Bool) :
    N (true :: bits) = passive b (N bits) :=
  rfl

/-- A small executable left inverse used to certify seed injectivity. -/
def decodeN? : Term -> Option (List Bool)
  | .s => some []
  | .app (.app .s .s) tail =>
      (decodeN? tail).map (List.cons false)
  | .app (.app .s (.app .s .s)) tail =>
      (decodeN? tail).map (List.cons true)
  | _ => none

/-- The seed decoder returns every encoded bitstring literally. -/
@[simp]
theorem decodeN?_N (bits : List Bool) : decodeN? (N bits) = some bits := by
  induction bits with
  | nil => rfl
  | cons bit bits ih =>
      cases bit <;> simp [N, passive, b, decodeN?, ih]

/-- The finite seed encoding is syntactically injective. -/
theorem N_injective : forall {left right : List Bool},
    N left = N right -> left = right := by
  intro left right heq
  have hdecoded := congrArg decodeN? heq
  simpa only [decodeN?_N, Option.some.injEq] using hdecoded

/-- Every nonempty seed has exactly two head-spine arguments. -/
@[simp]
theorem N_cons_headArity (bit : Bool) (bits : List Bool) :
    (N (bit :: bits)).headArity = 2 := by
  cases bit <;> rfl

/-- No encoded seed is a root redex. -/
@[simp]
theorem N_contractRoot? (bits : List Bool) :
    (N bits).contractRoot? = none := by
  cases bits with
  | nil => rfl
  | cons bit bits => cases bit <;> rfl

/-! ## Contextual normality -/

/-- A passive record is step-normal when both literal fields are step-normal. -/
theorem stepNormal_passive {left right : Term}
    (hleft : StepNormal left) (hright : StepNormal right) :
    StepNormal (passive left right) := by
  intro target hstep
  rcases passive_step_cases hstep with hleftStep | hrightStep
  · rcases hleftStep with ⟨left', hstep, _⟩
    exact hleft left' hstep
  · rcases hrightStep with ⟨right', hstep, _⟩
    exact hright right' hstep

/-- The one-argument term `b = S S` is step-normal. -/
theorem stepNormal_b : StepNormal b := by
  intro target hstep
  rcases step_app_cases hstep with hroot | hchildren
  · rcases hroot with ⟨x, y, z, hsource, _⟩
    have harity := congrArg Term.headArity hsource
    simp [b, Term.redex] at harity
  · rcases hchildren with hleft | hright
    · rcases hleft with ⟨left', hstep, _⟩
      exact not_step_s left' hstep
    · rcases hright with ⟨right', hstep, _⟩
      exact not_step_s right' hstep

/-- Every literal seed is normal under arbitrary contextual contraction. -/
theorem N_stepNormal (bits : List Bool) : StepNormal (N bits) := by
  induction bits with
  | nil => exact stepNormal_s
  | cons bit bits ih =>
      cases bit
      · exact stepNormal_passive stepNormal_s ih
      · exact stepNormal_passive stepNormal_b ih

/-! ## Concrete frozen encoder -/

/-- A protected-trie header with the concrete frozen bitstring seed. -/
def seededHeader (bits : List Bool) (body : Term) : Term :=
  header (N bits) body

@[simp]
theorem parseHeader?_seededHeader (bits : List Bool) (body : Term) :
    parseHeader? (seededHeader bits body) = some ⟨N bits, body⟩ :=
  rfl

/-- Any step below a concrete seed changes only the body field. -/
theorem seededHeader_step_preserves
    {bits : List Bool} {body target : Term}
    (hstep : Step (seededHeader bits body) target) :
    exists body', Step body body' /\ target = seededHeader bits body' := by
  exact header_step_preserves (N_stepNormal bits) hstep

/-- Any finite reduction below a concrete seed changes only the body field. -/
theorem seededHeader_steps_preserves
    {bits : List Bool} {body target : Term}
    (hsteps : Steps (seededHeader bits body) target) :
    exists body', Steps body body' /\ target = seededHeader bits body' := by
  exact header_steps_preserves (N_stepNormal bits) hsteps

/-- Concrete anchored parsing is exactly protected-path parsing of the body. -/
theorem anchoredOpenedAt?_seededHeader_iff
    {bits : List Bool} {body : Term} {path : List Bool} :
    anchoredOpenedAt? (seededHeader bits body) path = true <->
      OpenedAt body path :=
  anchoredOpenedAt?_eq_true_iff

/-- One arbitrary contraction preserves every path below a concrete seed. -/
theorem seededHeader_anchoredOpenedAt?_step_mono
    {bits : List Bool} {body target : Term} {path : List Bool}
    (hopen : anchoredOpenedAt? (seededHeader bits body) path = true)
    (hstep : Step (seededHeader bits body) target) :
    anchoredOpenedAt? target path = true :=
  anchoredOpenedAt?_step_mono (N_stepNormal bits) hopen hstep

/-- Every finite reduction preserves every path below a concrete seed. -/
theorem seededHeader_anchoredOpenedAt?_steps_mono
    {bits : List Bool} {body target : Term} {path : List Bool}
    (hopen : anchoredOpenedAt? (seededHeader bits body) path = true)
    (hsteps : Steps (seededHeader bits body) target) :
    anchoredOpenedAt? target path = true :=
  anchoredOpenedAt?_steps_mono (N_stepNormal bits) hopen hsteps

/-- The finite initial protected-trie term `S (N bits) D_2,2`. -/
def encoder (bits : List Bool) : Term :=
  seededHeader bits (D 2 2)

@[simp]
theorem parseHeader?_encoder (bits : List Bool) :
    parseHeader? (encoder bits) = some ⟨N bits, D 2 2⟩ :=
  rfl

/-- Every one-step reduct keeps the same literal seed and changes only the body. -/
theorem encoder_step_preserves {bits : List Bool} {target : Term}
    (hstep : Step (encoder bits) target) :
    exists body', Step (D 2 2) body' /\
      target = header (N bits) body' := by
  exact seededHeader_step_preserves hstep

/-- Every finite reduct keeps the same literal seed and is a body reduct. -/
theorem encoder_steps_preserves {bits : List Bool} {target : Term}
    (hsteps : Steps (encoder bits) target) :
    exists body', Steps (D 2 2) body' /\
      target = header (N bits) body' := by
  exact seededHeader_steps_preserves hsteps

/-- At the concrete encoder, anchored parsing is exactly body parsing. -/
theorem anchoredOpenedAt?_encoder_iff {bits : List Bool} {path : List Bool} :
    anchoredOpenedAt? (encoder bits) path = true <->
      OpenedAt (D 2 2) path :=
  anchoredOpenedAt?_eq_true_iff

/-- Any raw first contraction preserves every accepted anchored path. -/
theorem encoder_anchoredOpenedAt?_step_mono
    {bits : List Bool} {target : Term} {path : List Bool}
    (hopen : anchoredOpenedAt? (encoder bits) path = true)
    (hstep : Step (encoder bits) target) :
    anchoredOpenedAt? target path = true :=
  anchoredOpenedAt?_step_mono (N_stepNormal bits) hopen hstep

/-- Every finite raw reduction preserves every accepted anchored path. -/
theorem encoder_anchoredOpenedAt?_steps_mono
    {bits : List Bool} {target : Term} {path : List Bool}
    (hopen : anchoredOpenedAt? (encoder bits) path = true)
    (hsteps : Steps (encoder bits) target) :
    anchoredOpenedAt? target path = true :=
  anchoredOpenedAt?_steps_mono (N_stepNormal bits) hopen hsteps

end PureSFormal.Research.ProtectedTrieSeed
