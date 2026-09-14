import PureSFormal.PureS.BasePath

/-!
# Mutation-closed Base carriers

The direct alpha field contains two environment occurrences.  Only the first
is on the canonical queue path.  This module separates them explicitly: the
active environment contains an arbitrary queue at the registered seed child,
while the dormant environment remains the original fixed code.  The outer
beta field is an arbitrary retained term.

The executable parser validates only fixed constructors and fixed code.  It
extracts the queue and beta fields without comparing them or descending into
either field.
-/

namespace PureSFormal.PureS

namespace MutableBase

/-! ## Mutation-closed syntax -/

/-- The active seed wrapper with its one mutable queue child. -/
def activeSeed (queue : Term) : Term :=
  .app .s queue

/-- The active dispatcher retains fixed action code and exposes `activeSeed`. -/
def activeDispatcher (actions queue : Term) : Term :=
  .app (.app .s (actCode actions)) (activeSeed queue)

/-- The active environment occurrence on the canonical queue path. -/
def activeEnvironment (actions queue : Term) : Term :=
  .app .s (activeDispatcher actions queue)

/--
The direct alpha field.  Its first environment is active; the environment
inside `b environment` is the fixed original code for `bits`.
-/
def activeAlpha (actions : Term) (bits : List Bool)
    (continuation queue : Term) : Term :=
  .app
    (.app
      (activeEnvironment actions queue)
      (.app b (environmentCode actions bits)))
    continuation

/--
The mutation-closed Base boundary with one active queue and one arbitrary
retained beta field.
-/
def base (actions : Term) (bits : List Bool)
    (continuation queue beta : Term) : Term :=
  .app (.app continuation (activeAlpha actions bits continuation queue)) beta

/--
The exact reachable mutable Base.  Its retained beta is fixed to the original
equation-(9) beta while its one active queue occurrence may evolve.
-/
def mutableBase (actions : Term) (bits : List Bool)
    (continuation queue : Term) : Term :=
  base actions bits continuation queue
    (baseBeta (environmentCode actions bits) continuation)

/-- The direct alpha of every mutation-closed Base has registered arity three. -/
@[simp]
theorem headArity_activeAlpha
    (actions : Term) (bits : List Bool) (continuation queue : Term) :
    (activeAlpha actions bits continuation queue).headArity = 3 := by
  rfl

/-! ## Registered addresses -/

/-- The dormant original environment occurrence inside the direct alpha. -/
def dormantEnvironmentAddress : Address :=
  [.left, .right, .left, .right, .right]

/-- The arbitrary beta field is the root's right child. -/
def betaAddress : Address :=
  [.right]

/-- The active queue is exactly at the established Base word address. -/
@[simp]
theorem queue_subterm
    (actions : Term) (bits : List Bool)
    (continuation queue beta : Term) :
    (base actions bits continuation queue beta).subterm?
        BasePath.wordAddress = some queue := by
  simp [base, activeAlpha, activeEnvironment, activeDispatcher, activeSeed,
    BasePath.wordAddress, Term.subterm?]

/-- The second environment occurrence remains the fixed original code. -/
@[simp]
theorem dormantEnvironment_subterm
    (actions : Term) (bits : List Bool)
    (continuation queue beta : Term) :
    (base actions bits continuation queue beta).subterm?
        dormantEnvironmentAddress =
      some (environmentCode actions bits) := by
  rfl

/-- Beta remains an independent retained root field. -/
@[simp]
theorem beta_subterm
    (actions : Term) (bits : List Bool)
    (continuation queue beta : Term) :
    (base actions bits continuation queue beta).subterm? betaAddress =
      some beta := by
  simp [base, betaAddress, Term.subterm?]

/-- The exact reachable form exposes its evolving queue at the same address. -/
@[simp]
theorem mutableBase_queue_subterm
    (actions : Term) (bits : List Bool) (continuation queue : Term) :
    (mutableBase actions bits continuation queue).subterm?
        BasePath.wordAddress = some queue := by
  exact queue_subterm actions bits continuation queue
    (baseBeta (environmentCode actions bits) continuation)

/-- The exact reachable form retains the original dormant environment copy. -/
@[simp]
theorem mutableBase_dormantEnvironment_subterm
    (actions : Term) (bits : List Bool) (continuation queue : Term) :
    (mutableBase actions bits continuation queue).subterm?
        dormantEnvironmentAddress =
      some (environmentCode actions bits) := by
  exact dormantEnvironment_subterm actions bits continuation queue
    (baseBeta (environmentCode actions bits) continuation)

/-- The exact reachable form retains its fixed equation-(9) beta. -/
@[simp]
theorem mutableBase_beta_subterm
    (actions : Term) (bits : List Bool) (continuation queue : Term) :
    (mutableBase actions bits continuation queue).subterm? betaAddress =
      some (baseBeta (environmentCode actions bits) continuation) := by
  exact beta_subterm actions bits continuation queue
    (baseBeta (environmentCode actions bits) continuation)

/-- The direct alpha remains the registered `LR` child after queue mutation. -/
@[simp]
theorem directAlpha_subterm
    (actions : Term) (bits : List Bool)
    (continuation queue beta : Term) :
    (base actions bits continuation queue beta).subterm?
        [.left, .right] =
      some (activeAlpha actions bits continuation queue) := by
  rfl

/-! ## Separation from Local shells -/

/--
A mutation-closed Base and Local shell are disjoint at `LR`: the former has
an arity-three direct alpha there, while the latter has an arity-two seed
field.  Queue and beta contents play no role in this comparison.
-/
theorem base_ne_shell
    (actions : Term) (bits : List Bool)
    (continuation queue beta haltField dispatcher seedAudit
      continuationAudit : Term) :
    base actions bits continuation queue beta ≠
      Carrier.shell bits haltField dispatcher seedAudit continuation
        continuationAudit := by
  intro h
  have hchildren := congrArg
    (fun term => term.subterm? [.left, .right]) h
  simp only [directAlpha_subterm, Carrier.shell_seed_subterm] at hchildren
  have hfields := Option.some.inj hchildren
  have harity := congrArg Term.headArity hfields
  simp only [headArity_activeAlpha, headArity_seedField] at harity
  cases harity

/-! ## Structural parser -/

/-- The two unrestricted fields returned by a successful parse. -/
structure View where
  queue : Term
  beta : Term
  deriving BEq, DecidableEq, Repr

/-- Internal parse result carrying its reconstruction theorem. -/
structure Certified
    (actions : Term) (bits : List Bool) (continuation term : Term) where
  queue : Term
  beta : Term
  shape : term = base actions bits continuation queue beta

/--
Proof-carrying structural validation.  The pattern binds `queue` and `beta`
as whole subtrees.  Equality tests mention only the supplied continuation,
the fixed action prefix, and the fixed dormant environment code.
-/
def parseCertified? (actions : Term) (bits : List Bool)
    (continuation term : Term) :
    Option (Certified actions bits continuation term) :=
  match term with
  | .app
      (.app foundOuterContinuation
        (.app
          (.app
            (.app .s
              (.app (.app .s foundAct) (.app .s queue)))
            (.app (.app .s .s) foundDormantEnvironment))
          foundAlphaContinuation))
      beta =>
      if houter : foundOuterContinuation = continuation then
        if hact : foundAct = actCode actions then
          if hdormant :
              foundDormantEnvironment = environmentCode actions bits then
            if halpha : foundAlphaContinuation = continuation then
              some ⟨queue, beta, by
                subst foundOuterContinuation
                subst foundAct
                subst foundDormantEnvironment
                subst foundAlphaContinuation
                rfl⟩
            else
              none
          else
            none
        else
          none
      else
        none
  | _ => none

/-- Public executable parser returning only the two unrestricted fields. -/
def parse? (actions : Term) (bits : List Bool)
    (continuation term : Term) : Option View :=
  (parseCertified? actions bits continuation term).map
    (fun parsed => ⟨parsed.queue, parsed.beta⟩)

/-- Successful parsing reconstructs exactly one mutation-closed Base. -/
theorem parse?_sound
    {actions : Term} {bits : List Bool} {continuation term : Term}
    {view : View}
    (h : parse? actions bits continuation term = some view) :
    term = base actions bits continuation view.queue view.beta := by
  unfold parse? at h
  cases hcertified : parseCertified? actions bits continuation term with
  | none => simp [hcertified] at h
  | some certified =>
      rw [hcertified] at h
      simp only [Option.map] at h
      have hview : View.mk certified.queue certified.beta = view :=
        Option.some.inj h
      subst view
      exact certified.shape

/-- Every independently chosen queue and beta pair is accepted exactly. -/
@[simp]
theorem parse?_base
    (actions : Term) (bits : List Bool)
    (continuation queue beta : Term) :
    parse? actions bits continuation
      (base actions bits continuation queue beta) =
      some ⟨queue, beta⟩ := by
  simp [parse?, parseCertified?, base, activeAlpha, activeEnvironment,
    activeDispatcher, activeSeed, b]

/-- Declarative completeness stated for an arbitrary source equality. -/
theorem parse?_complete
    {actions : Term} {bits : List Bool} {continuation term queue beta : Term}
    (h : term = base actions bits continuation queue beta) :
    parse? actions bits continuation term = some ⟨queue, beta⟩ := by
  subst term
  exact parse?_base actions bits continuation queue beta

/-- Executable parsing and the mutation-closed Base syntax agree exactly. -/
theorem parse?_eq_some_iff
    (actions : Term) (bits : List Bool) (continuation term queue beta : Term) :
    parse? actions bits continuation term = some ⟨queue, beta⟩ ↔
      term = base actions bits continuation queue beta :=
  ⟨parse?_sound, parse?_complete⟩

/-- A successful permissive Base parse cannot also inhabit the Local grammar. -/
theorem parsed_not_local
    {actions : Term} {bits : List Bool}
    {continuation term : Term} {view : View} {dispatcher : Term}
    (hbase : parse? actions bits continuation term = some view)
    (hlocal : Carrier.LocalShell bits continuation dispatcher term) : False := by
  have hterm := parse?_sound hbase
  cases hlocal with
  | fresh haltAudit seedAudit continuationAudit =>
      apply base_ne_shell actions bits continuation view.queue view.beta
        (freshHField haltAudit) dispatcher seedAudit continuationAudit
      simpa [Carrier.activeShell] using hterm.symm
  | marked leftAudit rightAudit seedAudit continuationAudit =>
      apply base_ne_shell actions bits continuation view.queue view.beta
        (Carrier.markedHField leftAudit rightAudit) dispatcher seedAudit
        continuationAudit
      simpa [Carrier.activeShell] using hterm.symm

/-! ## Exact reachable-form validation -/

/--
Validate the exact reachable form and return its active queue.  Unlike the
permissive structural parser, this refinement checks that beta is the fixed
original beta required by reachability.
-/
def parseMutable? (actions : Term) (bits : List Bool)
    (continuation term : Term) : Option Term :=
  match parse? actions bits continuation term with
  | none => none
  | some view =>
      if view.beta = baseBeta (environmentCode actions bits) continuation then
        some view.queue
      else
        none

/-- Exact-validator success reconstructs the reachable mutable Base. -/
theorem parseMutable?_sound
    {actions : Term} {bits : List Bool} {continuation term queue : Term}
    (h : parseMutable? actions bits continuation term = some queue) :
    term = mutableBase actions bits continuation queue := by
  unfold parseMutable? at h
  generalize hparse : parse? actions bits continuation term = parsed at h
  cases parsed with
  | none => contradiction
  | some view =>
      simp only at h
      split at h
      next hbeta =>
        have hqueue : view.queue = queue := Option.some.inj h
        have hshape := parse?_sound hparse
        rw [hshape, hqueue, hbeta]
        rfl
      next => contradiction

/-- Every exact reachable mutable Base is accepted with its queue. -/
@[simp]
theorem parseMutable?_mutableBase
    (actions : Term) (bits : List Bool) (continuation queue : Term) :
    parseMutable? actions bits continuation
      (mutableBase actions bits continuation queue) = some queue := by
  simp [parseMutable?, mutableBase]

/-- Exact executable validation agrees with the reachable syntax. -/
theorem parseMutable?_eq_some_iff
    (actions : Term) (bits : List Bool) (continuation term queue : Term) :
    parseMutable? actions bits continuation term = some queue ↔
      term = mutableBase actions bits continuation queue :=
  ⟨parseMutable?_sound, fun h => by
    subst term
    exact parseMutable?_mutableBase actions bits continuation queue⟩

/-! ## Initial Base compatibility -/

/-- With the literal input word, the active environment is the original code. -/
@[simp]
theorem activeEnvironment_word (actions : Term) (bits : List Bool) :
    activeEnvironment actions (word bits) = environmentCode actions bits :=
  rfl

/--
Choosing the original beta specializes the mutation-closed syntax to the
existing exact equation-(9) Base definition.
-/
@[simp]
theorem mutableBase_word
    (actions : Term) (bits : List Bool) (continuation : Term) :
    mutableBase actions bits continuation (word bits) =
      baseCarrier (environmentCode actions bits) continuation :=
  rfl

/-- Compatibility alias stated directly for the permissive boundary. -/
@[simp]
theorem initial_eq_baseCarrier
    (actions : Term) (bits : List Bool) (continuation : Term) :
    base actions bits continuation (word bits)
        (baseBeta (environmentCode actions bits) continuation) =
      baseCarrier (environmentCode actions bits) continuation :=
  mutableBase_word actions bits continuation

/-- The existing exact initial Base parses to its word and original beta. -/
@[simp]
theorem parse?_initial
    (actions : Term) (bits : List Bool) (continuation : Term) :
    parse? actions bits continuation
        (baseCarrier (environmentCode actions bits) continuation) =
      some ⟨word bits,
        baseBeta (environmentCode actions bits) continuation⟩ := by
  rw [← initial_eq_baseCarrier]
  exact parse?_base actions bits continuation (word bits)
    (baseBeta (environmentCode actions bits) continuation)

/-- The exact initial Base also passes the reachable-form validator. -/
@[simp]
theorem parseMutable?_initial
    (actions : Term) (bits : List Bool) (continuation : Term) :
    parseMutable? actions bits continuation
        (baseCarrier (environmentCode actions bits) continuation) =
      some (word bits) := by
  rw [← mutableBase_word]
  exact parseMutable?_mutableBase actions bits continuation (word bits)

/-! ## Queue context and reduction lifting -/

/-- The explicit one-hole context whose hole is the active queue occurrence. -/
def queueContext (actions : Term) (bits : List Bool)
    (continuation beta : Term) : Context :=
  .appLeft
    (.appRight continuation
      (.appLeft
        (.appLeft
          (.appRight .s
            (.appRight (.app .s (actCode actions))
              (.appRight .s .hole)))
          (.app b (environmentCode actions bits)))
        continuation))
    beta

@[simp]
theorem queueContext_plug
    (actions : Term) (bits : List Bool)
    (continuation beta queue : Term) :
    (queueContext actions bits continuation beta).plug queue =
      base actions bits continuation queue beta := by
  rfl

/-- Replacing the registered active queue preserves every other Base field. -/
@[simp]
theorem replace?_queue
    (actions : Term) (bits : List Bool)
    (continuation beta queue replacement : Term) :
    (base actions bits continuation queue beta).replace?
        BasePath.wordAddress replacement =
      some (base actions bits continuation replacement beta) := by
  simp [base, activeAlpha, activeEnvironment, activeDispatcher, activeSeed,
    BasePath.wordAddress, Term.replace?]

/-- Replacing the queue of an exact reachable Base preserves its fixed beta. -/
@[simp]
theorem replace?_mutableBase_queue
    (actions : Term) (bits : List Bool)
    (continuation queue replacement : Term) :
    (mutableBase actions bits continuation queue).replace?
        BasePath.wordAddress replacement =
      some (mutableBase actions bits continuation replacement) := by
  exact replace?_queue actions bits continuation
    (baseBeta (environmentCode actions bits) continuation) queue replacement

/-- Exact-length queue reduction lifts through the fixed mutation-closed Base. -/
theorem stepsN_queue
    (actions : Term) (bits : List Bool) (continuation beta : Term)
    {n : Nat} {source target : Term}
    (h : StepsN n source target) :
    StepsN n
      (base actions bits continuation source beta)
      (base actions bits continuation target beta) := by
  simpa only [queueContext_plug] using
    h.inContext (queueContext actions bits continuation beta)

/-- Queue reduction preserves the exact reachable Base form and step count. -/
theorem stepsN_mutableBase_queue
    (actions : Term) (bits : List Bool) (continuation : Term)
    {n : Nat} {source target : Term}
    (h : StepsN n source target) :
    StepsN n
      (mutableBase actions bits continuation source)
      (mutableBase actions bits continuation target) := by
  exact stepsN_queue actions bits continuation
    (baseBeta (environmentCode actions bits) continuation) h

/-! ## Root arity -/

/-- Root arity depends only on the fixed continuation. -/
@[simp]
theorem headArity_base
    (actions : Term) (bits : List Bool)
    (continuation queue beta : Term) :
    (base actions bits continuation queue beta).headArity =
      continuation.headArity + 2 :=
  rfl

/-- The exact reachable form has the same continuation-controlled arity. -/
@[simp]
theorem headArity_mutableBase
    (actions : Term) (bits : List Bool) (continuation queue : Term) :
    (mutableBase actions bits continuation queue).headArity =
      continuation.headArity + 2 := by
  rfl

/-- An admissible continuation gives the registered Base root arity 5 or 6. -/
theorem root_headArity
    (actions : Term) (bits : List Bool)
    {continuation : Term}
    (hadmissible : Carrier.Admissible continuation)
    (queue beta : Term) :
    (base actions bits continuation queue beta).headArity = 5 ∨
      (base actions bits continuation queue beta).headArity = 6 := by
  rcases hadmissible with h | h
  · left
    rw [headArity_base, h]
  · right
    rw [headArity_base, h]

/-- Exact reachable Bases therefore also have registered root arity 5 or 6. -/
theorem mutableBase_root_headArity
    (actions : Term) (bits : List Bool)
    {continuation : Term}
    (hadmissible : Carrier.Admissible continuation)
    (queue : Term) :
    (mutableBase actions bits continuation queue).headArity = 5 ∨
      (mutableBase actions bits continuation queue).headArity = 6 := by
  exact root_headArity actions bits hadmissible queue
    (baseBeta (environmentCode actions bits) continuation)

end MutableBase

end PureSFormal.PureS
