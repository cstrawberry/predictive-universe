import PureSFormal.PureS.Frame

/-!
# Intrinsic carrier and queue grammar

This module formalizes the static syntax of equations (9)--(10e).  The
relations are deliberately permissive: every audit argument is an independent
constructor argument, while the public queue, halt-field, seed, and
continuation boundaries remain literal pure-`S` syntax.

The relation supplied as `dispatchesTo` records the already separate
route/action parse from a dispatcher field to its canonical predecessor.
Consequently this file neither repeats the route grammar nor claims the
scheduler reductions which establish reachability.
-/

namespace PureSFormal.PureS

namespace Carrier

/-! ## Queue constructors and their canonical child -/

/-- A transparent post-deletion cell `S predecessor (vᵢ audit)`. -/
def tombstone (bit : Bool) (predecessor audit : Term) : Term :=
  .app (.app .s predecessor) (.app (valueTag bit) audit)

@[simp]
theorem headArity_omega : omega.headArity = 0 :=
  rfl

@[simp]
theorem headArity_liveCell (bit : Bool) (tail : Term) :
    (Term.app (live bit) tail).headArity = 3 :=
  rfl

@[simp]
theorem headArity_tombstone (bit : Bool) (predecessor audit : Term) :
    (tombstone bit predecessor audit).headArity = 2 :=
  rfl

/-- The three registered queue-root forms are pairwise arity-disjoint. -/
theorem omega_ne_liveCell (bit : Bool) (tail : Term) :
    omega ≠ .app (live bit) tail := by
  intro h
  have harity := congrArg Term.headArity h
  simp only [headArity_omega, headArity_liveCell] at harity
  cases harity

theorem omega_ne_tombstone (bit : Bool) (predecessor audit : Term) :
    omega ≠ tombstone bit predecessor audit := by
  intro h
  have harity := congrArg Term.headArity h
  simp only [headArity_omega, headArity_tombstone] at harity
  cases harity

theorem liveCell_ne_tombstone
    (liveBit tombstoneBit : Bool) (tail predecessor audit : Term) :
    .app (live liveBit) tail ≠ tombstone tombstoneBit predecessor audit := by
  intro h
  have harity := congrArg Term.headArity h
  simp only [headArity_liveCell, headArity_tombstone] at harity
  cases harity

/-- One registered canonical queue move. -/
inductive QueueStep : Term → Term → Prop where
  | live (bit : Bool) (tail : Term) :
      QueueStep (.app (PureSFormal.PureS.live bit) tail) tail
  | tombstone (bit : Bool) (predecessor audit : Term) :
      QueueStep (Carrier.tombstone bit predecessor audit) predecessor

/--
Structural projection used after a root has been classified as a registered
live cell or tombstone.  It is not the full validating decoder.
-/
def queueChild? : Term → Option Term
  | .app (.app (.app .s .s) _) tail => some tail
  | .app (.app .s predecessor) _ => some predecessor
  | _ => none

namespace QueueStep

@[simp]
theorem queueChild?_eq {source target : Term} (h : QueueStep source target) :
    queueChild? source = some target := by
  cases h <;> rfl

/-- A registered queue root has exactly one canonical next child. -/
theorem deterministic
    {source first second : Term}
    (hfirst : QueueStep source first) (hsecond : QueueStep source second) :
    first = second := by
  have h : (some first : Option Term) = some second :=
    hfirst.queueChild?_eq.symm.trans hsecond.queueChild?_eq
  exact Option.some.inj h

end QueueStep

/--
A finite mutation-closed queue segment ending at `endpoint`.  Tombstone audit
arguments are independent at every layer.  Taking `endpoint = omega` gives a
complete queue; taking it to be a carrier root gives an appended segment.
-/
inductive QueueSegment (endpoint : Term) : Term → Prop where
  | endpoint : QueueSegment endpoint endpoint
  | live {tail : Term} (bit : Bool) (inner : QueueSegment endpoint tail) :
      QueueSegment endpoint (.app (PureSFormal.PureS.live bit) tail)
  | tombstone {predecessor : Term} (bit : Bool) (audit : Term)
      (inner : QueueSegment endpoint predecessor) :
      QueueSegment endpoint (Carrier.tombstone bit predecessor audit)

namespace QueueSegment

/-- Wrapping a segment by a finite list of live cells preserves its endpoint. -/
theorem foldl_live
    {endpoint start : Term} (bits : List Bool)
    (hstart : QueueSegment endpoint start) :
    QueueSegment endpoint
      (bits.foldl (fun tail bit => .app (PureSFormal.PureS.live bit) tail)
        start) := by
  induction bits generalizing start with
  | nil => exact hstart
  | cons bit bits ih =>
      exact ih (.live bit hstart)

/-- Every literal encoded word is accepted as a complete queue. -/
theorem word (bits : List Bool) : QueueSegment omega (PureSFormal.PureS.word bits) := by
  exact foldl_live bits (.endpoint : QueueSegment omega omega)

end QueueSegment

/-! ## Mutation-closed halt and Local fields -/

/-- The independent-hole marked halt field `S A₀ (haltTag A₁)`. -/
def markedHField (leftAudit rightAudit : Term) : Term :=
  .app (.app .s leftAudit) (.app haltTag rightAudit)

@[simp]
theorem markedHField_diagonal (carrier : Term) :
    markedHField carrier carrier = markH carrier :=
  rfl

@[simp]
theorem headArity_markedHField (leftAudit rightAudit : Term) :
    (markedHField leftAudit rightAudit).headArity = 2 :=
  rfl

/-- Equation (10b), with separate constructor fields for every audit. -/
inductive HField : Term → Prop where
  | fresh (audit : Term) : HField (freshHField audit)
  | marked (leftAudit rightAudit : Term) :
      HField (markedHField leftAudit rightAudit)

namespace HField

theorem headArity {field : Term} (h : HField field) :
    field.headArity = 2 ∨ field.headArity = 3 := by
  cases h with
  | fresh audit => exact Or.inr (headArity_freshHField audit)
  | marked leftAudit rightAudit =>
      exact Or.inl (headArity_markedHField leftAudit rightAudit)

/-- Fresh and marked alternatives cannot coincide. -/
theorem fresh_ne_marked (freshAudit leftAudit rightAudit : Term) :
    freshHField freshAudit ≠ markedHField leftAudit rightAudit := by
  intro h
  have harity := congrArg Term.headArity h
  simp only [headArity_freshHField, headArity_markedHField] at harity
  cases harity

end HField

/--
The exact left-associated shell constructor shared by (10a) and (10c).
`haltField`, `seedAudit`, and `continuationAudit` are independent terms.
-/
def shell (bits : List Bool) (haltField dispatcher seedAudit continuation
    continuationAudit : Term) : Term :=
  .app
    (.app
      (.app haltField dispatcher)
      (.app (seedCode bits) seedAudit))
    (.app continuation continuationAudit)

/-- Equation (10a), emphasizing that the continuation code is fixed. -/
def activeShell (bits : List Bool) (continuation haltField dispatcher
    seedAudit continuationAudit : Term) : Term :=
  shell bits haltField dispatcher seedAudit continuation continuationAudit

/-- Equation (10c), emphasizing the mutable function child of `K A_b`. -/
def completedShell (bits : List Bool) (haltField dispatcher seedAudit
    chain continuationAudit : Term) : Term :=
  shell bits haltField dispatcher seedAudit chain continuationAudit

@[simp]
theorem activeShell_fresh_diagonal (actions : Term) (bits : List Bool)
    (continuation carrier : Term) :
    activeShell bits continuation (freshHField carrier) (.app actions carrier)
        carrier carrier =
      freshLocal actions bits continuation carrier :=
  rfl

@[simp]
theorem activeShell_marked_diagonal (actions : Term) (bits : List Bool)
    (continuation carrier : Term) :
    activeShell bits continuation (markedHField carrier carrier)
        (.app actions carrier) carrier carrier =
      markedLocal actions bits continuation carrier :=
  rfl

@[simp]
theorem shell_dispatcher_subterm (bits : List Bool)
    (haltField dispatcher seedAudit continuation continuationAudit : Term) :
    Term.subterm?
        (shell bits haltField dispatcher seedAudit continuation continuationAudit)
        [.left, .left, .right] =
      some dispatcher :=
  by simp [shell, Term.subterm?]

@[simp]
theorem shell_seed_subterm (bits : List Bool)
    (haltField dispatcher seedAudit continuation continuationAudit : Term) :
    Term.subterm?
        (shell bits haltField dispatcher seedAudit continuation continuationAudit)
        [.left, .right] =
      some (.app (seedCode bits) seedAudit) :=
  rfl

@[simp]
theorem shell_continuation_subterm (bits : List Bool)
    (haltField dispatcher seedAudit continuation continuationAudit : Term) :
    Term.subterm?
        (shell bits haltField dispatcher seedAudit continuation continuationAudit)
        [.right, .left] =
      some continuation :=
  by simp [shell, Term.subterm?]

@[simp]
theorem completedShell_replace_continuation (bits : List Bool)
    (haltField dispatcher seedAudit continuation continuationAudit
      replacement : Term) :
    (completedShell bits haltField dispatcher seedAudit continuation
        continuationAudit).replace? [.right, .left] replacement =
      some (completedShell bits haltField dispatcher seedAudit replacement
        continuationAudit) :=
  by simp [completedShell, shell, Term.replace?]

@[simp]
theorem headArity_shell_fresh (bits : List Bool)
    (haltAudit dispatcher seedAudit continuation continuationAudit : Term) :
    (shell bits (freshHField haltAudit) dispatcher seedAudit continuation
      continuationAudit).headArity = 6 :=
  rfl

@[simp]
theorem headArity_shell_marked (bits : List Bool)
    (leftAudit rightAudit dispatcher seedAudit continuation
      continuationAudit : Term) :
    (shell bits (markedHField leftAudit rightAudit) dispatcher seedAudit
      continuation continuationAudit).headArity = 5 :=
  rfl

/-- The direct-alpha field of the exact Base has registered arity three. -/
@[simp]
theorem headArity_baseAlpha_environment (actions : Term) (bits : List Bool)
    (continuation : Term) :
    (baseAlpha (environmentCode actions bits) continuation).headArity = 3 :=
  rfl

@[simp]
theorem baseCarrier_directAlpha_subterm (actions : Term) (bits : List Bool)
    (continuation : Term) :
    Term.subterm? (baseCarrier (environmentCode actions bits) continuation)
        [.left, .right] =
      some (baseAlpha (environmentCode actions bits) continuation) :=
  rfl

/-- The exact arity of a Base is its continuation arity plus two. -/
theorem headArity_baseCarrier (environment continuation : Term) :
    (baseCarrier environment continuation).headArity =
      continuation.headArity + 2 :=
  rfl

/-- Equation (10e). -/
def Admissible (continuation : Term) : Prop :=
  continuation.headArity = 3 ∨ continuation.headArity = 4

/-- An admissible Base has carrier-root arity five or six. -/
theorem baseCarrier_headArity
    {continuation : Term} (environment : Term)
    (h : Admissible continuation) :
    (baseCarrier environment continuation).headArity = 5 ∨
      (baseCarrier environment continuation).headArity = 6 := by
  rcases h with h | h
  · left
    rw [headArity_baseCarrier, h]
  · right
    rw [headArity_baseCarrier, h]

/--
The Base and Local productions are disjoint at their registered `LR` field:
direct alpha has arity three, whereas the Local seed field has arity two.
-/
theorem baseCarrier_ne_shell (actions : Term) (bits : List Bool)
    (continuation haltField dispatcher seedAudit continuationAudit : Term) :
    baseCarrier (environmentCode actions bits) continuation ≠
      shell bits haltField dispatcher seedAudit continuation continuationAudit := by
  intro h
  have hsubterms := congrArg
    (fun term => term.subterm? [.left, .right]) h
  simp only [baseCarrier_directAlpha_subterm, shell_seed_subterm] at hsubterms
  injection hsubterms with hfields
  have harity := congrArg Term.headArity hfields
  simp only [headArity_baseAlpha_environment, headArity_seedField] at harity
  cases harity

/-- Exact mutation-closed Local grammar for one fixed continuation. -/
inductive LocalShell (bits : List Bool) (continuation : Term) :
    Term → Term → Prop where
  | fresh (dispatcher haltAudit seedAudit continuationAudit : Term) :
      LocalShell bits continuation dispatcher
        (activeShell bits continuation (freshHField haltAudit) dispatcher
          seedAudit continuationAudit)
  | marked (dispatcher leftAudit rightAudit seedAudit continuationAudit : Term) :
      LocalShell bits continuation dispatcher
        (activeShell bits continuation (markedHField leftAudit rightAudit)
          dispatcher seedAudit continuationAudit)

namespace LocalShell

theorem dispatcher_subterm
    {bits : List Bool} {continuation dispatcher result : Term}
    (h : LocalShell bits continuation dispatcher result) :
    result.subterm? [.left, .left, .right] = some dispatcher := by
  cases h <;> simp [activeShell, shell, Term.subterm?]

/-- A fixed Local term exposes only one dispatcher field at its public slot. -/
theorem dispatcher_deterministic
    {bits : List Bool} {continuation dispatcher₁ dispatcher₂ result : Term}
    (h₁ : LocalShell bits continuation dispatcher₁ result)
    (h₂ : LocalShell bits continuation dispatcher₂ result) :
    dispatcher₁ = dispatcher₂ := by
  have h : (some dispatcher₁ : Option Term) = some dispatcher₂ :=
    h₁.dispatcher_subterm.symm.trans h₂.dispatcher_subterm
  exact Option.some.inj h

theorem result_headArity
    {bits : List Bool} {continuation dispatcher result : Term}
    (h : LocalShell bits continuation dispatcher result) :
    result.headArity = 5 ∨ result.headArity = 6 := by
  cases h with
  | fresh => exact Or.inr (by rfl)
  | marked => exact Or.inl (by rfl)

theorem ne_baseCarrier
    {bits : List Bool} {continuation dispatcher result : Term}
    (h : LocalShell bits continuation dispatcher result) (actions : Term) :
    result ≠ baseCarrier (environmentCode actions bits) continuation := by
  intro heq
  cases h with
  | fresh haltAudit seedAudit continuationAudit =>
      exact baseCarrier_ne_shell actions bits continuation
        (freshHField haltAudit) dispatcher seedAudit continuationAudit heq.symm
  | marked leftAudit rightAudit seedAudit continuationAudit =>
      exact baseCarrier_ne_shell actions bits continuation
        (markedHField leftAudit rightAudit) dispatcher seedAudit
        continuationAudit heq.symm

end LocalShell

/-! ## Recursive permissive carrier and completed-chain grammars -/

/-- Right-uniqueness of the external route/action-to-predecessor relation. -/
def RightUnique (relation : Term → Term → Prop) : Prop :=
  ∀ {field first second},
    relation field first → relation field second → first = second

/-- A Local term whose dispatcher field parses to `predecessor`. -/
def HasPredecessor (bits : List Bool) (continuation : Term)
    (dispatchesTo : Term → Term → Prop) (result predecessor : Term) : Prop :=
  ∃ dispatcher,
    LocalShell bits continuation dispatcher result ∧
      dispatchesTo dispatcher predecessor

/-- Public shell parsing is unique whenever route/action parsing is unique. -/
theorem hasPredecessor_deterministic
    {bits : List Bool} {continuation : Term}
    {dispatchesTo : Term → Term → Prop}
    (hunique : RightUnique dispatchesTo)
    {result first second : Term}
    (hfirst : HasPredecessor bits continuation dispatchesTo result first)
    (hsecond : HasPredecessor bits continuation dispatchesTo result second) :
    first = second := by
  obtain ⟨firstDispatcher, firstShell, firstParse⟩ := hfirst
  obtain ⟨secondDispatcher, secondShell, secondParse⟩ := hsecond
  have hdispatcher := firstShell.dispatcher_deterministic secondShell
  subst secondDispatcher
  exact hunique firstParse secondParse

/-- The mutation-closed active-carrier grammar from (9), (10a), and (10b). -/
inductive Grammar (actions : Term) (bits : List Bool) (continuation : Term)
    (dispatchesTo : Term → Term → Prop) : Term → Prop where
  | base :
      Grammar actions bits continuation dispatchesTo
        (baseCarrier (environmentCode actions bits) continuation)
  | layer
      {predecessor dispatcher result : Term}
      (inner : Grammar actions bits continuation dispatchesTo predecessor)
      (dispatch : dispatchesTo dispatcher predecessor)
      (outer : LocalShell bits continuation dispatcher result) :
      Grammar actions bits continuation dispatchesTo result

namespace Grammar

theorem root_headArity
    {actions : Term} {bits : List Bool} {continuation : Term}
    {dispatchesTo : Term → Term → Prop} {result : Term}
    (hadmissible : Admissible continuation)
    (h : Grammar actions bits continuation dispatchesTo result) :
    result.headArity = 5 ∨ result.headArity = 6 := by
  cases h with
  | base =>
      exact baseCarrier_headArity (environmentCode actions bits) hadmissible
  | layer inner dispatch outer => exact outer.result_headArity

/-- Every non-Base grammar constructor supplies its canonical predecessor. -/
theorem base_or_hasPredecessor
    {actions : Term} {bits : List Bool} {continuation : Term}
    {dispatchesTo : Term → Term → Prop} {result : Term}
    (h : Grammar actions bits continuation dispatchesTo result) :
    result = baseCarrier (environmentCode actions bits) continuation ∨
      ∃ predecessor,
        HasPredecessor bits continuation dispatchesTo result predecessor := by
  cases h with
  | base => exact Or.inl rfl
  | layer inner dispatch outer =>
      exact Or.inr ⟨_, ⟨_, outer, dispatch⟩⟩

end Grammar

/--
The completed continuation-chain grammar (10d).  Each constructor has fresh
independent audit fields, and `inner` occupies exactly the function child at
path `RL` of the new shell.
-/
inductive CompletedChain (bits : List Bool) (completedField : Term → Prop)
    (active : Term) : Term → Prop where
  | active : CompletedChain bits completedField active active
  | completed
      {inner dispatcher haltField : Term}
      (innerChain : CompletedChain bits completedField active inner)
      (fieldComplete : completedField dispatcher)
      (haltShape : HField haltField)
      (seedAudit continuationAudit : Term) :
      CompletedChain bits completedField active
        (completedShell bits haltField dispatcher seedAudit inner
          continuationAudit)

namespace CompletedChain

/-- The active continuation is exposed by an ordinary one-hole context. -/
theorem context
    {bits : List Bool} {completedField : Term → Prop}
    {active result : Term}
    (h : CompletedChain bits completedField active result) :
    ∃ ctx : Context, ctx.plug active = result := by
  induction h with
  | active => exact ⟨.hole, rfl⟩
  | @completed inner dispatcher haltField innerChain fieldComplete haltShape
      seedAudit continuationAudit ih =>
      obtain ⟨ctx, hctx⟩ := ih
      let shellPrefix : Term :=
        .app (.app haltField dispatcher) (.app (seedCode bits) seedAudit)
      refine ⟨.appRight shellPrefix (.appLeft ctx continuationAudit), ?_⟩
      simp only [Context.plug, hctx]
      rfl

/--
Mutation closure of (10d): any supplied exact reduction of the active
continuation lifts through every completed shell without touching an audit.
This theorem does not construct the scheduler's reduction.
-/
theorem liftStepsN
    {bits : List Bool} {completedField : Term → Prop}
    {active result active' : Term} {n : Nat}
    (h : CompletedChain bits completedField active result)
    (steps : StepsN n active active') :
    ∃ result',
      CompletedChain bits completedField active' result' ∧
        StepsN n result result' := by
  induction h with
  | active => exact ⟨active', .active, steps⟩
  | @completed inner dispatcher haltField innerChain fieldComplete haltShape
      seedAudit continuationAudit ih =>
      obtain ⟨inner', innerChain', innerSteps⟩ := ih
      refine ⟨completedShell bits haltField dispatcher seedAudit inner'
        continuationAudit,
        .completed innerChain' fieldComplete haltShape seedAudit
          continuationAudit,
        ?_⟩
      let shellPrefix : Term :=
        .app (.app haltField dispatcher) (.app (seedCode bits) seedAudit)
      simpa [completedShell, shell, shellPrefix] using
        StepsN.appRight shellPrefix
          (StepsN.appLeft innerSteps continuationAudit)

end CompletedChain

end Carrier

end PureSFormal.PureS
