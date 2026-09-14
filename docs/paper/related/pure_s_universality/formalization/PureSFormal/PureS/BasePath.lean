import PureSFormal.PureS.CellSpine

/-!
# Fixed canonical path through the literal Base carrier

The Base rule always selects the direct alpha field at `LR`; it never enters
the second copy stored inside beta.  From that field the remainder of the
path is fixed code: alpha to `E*`, then to `D*`, `Seed_w`, and finally the
literal input word.  The small validator below returns the uninspected beta
field and performs no comparison involving that field.
-/

namespace PureSFormal.PureS

namespace BasePath

/-! ## Exact public addresses -/

/-- The direct alpha field in `Base_B = B alpha beta`. -/
def directAlphaAddress : Address :=
  [.left, .right]

/-- The exact `E*` occurrence reached through the direct alpha field. -/
def environmentAddress : Address :=
  [.left, .right, .left, .left]

/-- The exact `D*` child of `E* = S D*`. -/
def dispatcherAddress : Address :=
  [.left, .right, .left, .left, .right]

/-- The exact `Seed_w` child of `D* = S Act* Seed_w`. -/
def seedAddress : Address :=
  [.left, .right, .left, .left, .right, .right]

/-- The complete canonical Base address from the root to `Word(w)`. -/
def wordAddress : Address :=
  [.left, .right, .left, .left, .right, .right, .right]

@[simp]
theorem directAlpha_subterm (actions : Term) (bits : List Bool)
    (continuation : Term) :
    (baseCarrier (environmentCode actions bits) continuation).subterm?
        directAlphaAddress =
      some (baseAlpha (environmentCode actions bits) continuation) := by
  rfl

@[simp]
theorem environment_subterm (actions : Term) (bits : List Bool)
    (continuation : Term) :
    (baseCarrier (environmentCode actions bits) continuation).subterm?
        environmentAddress =
      some (environmentCode actions bits) := by
  rfl

@[simp]
theorem dispatcher_subterm (actions : Term) (bits : List Bool)
    (continuation : Term) :
    (baseCarrier (environmentCode actions bits) continuation).subterm?
        dispatcherAddress =
      some (dispatcherCode actions bits) := by
  rfl

@[simp]
theorem seed_subterm (actions : Term) (bits : List Bool)
    (continuation : Term) :
    (baseCarrier (environmentCode actions bits) continuation).subterm?
        seedAddress =
      some (seedCode bits) := by
  rfl

/-- The literal Base exposes its encoded input at one fixed address. -/
@[simp]
theorem word_subterm (actions : Term) (bits : List Bool)
    (continuation : Term) :
    (baseCarrier (environmentCode actions bits) continuation).subterm?
        wordAddress =
      some (word bits) := by
  simp [wordAddress, baseCarrier, baseAlpha, environmentCode, dispatcherCode,
    seedCode, Term.subterm?]

/-! ## Base-boundary validation -/

/--
Validate only the public Base boundary.  A successful parse returns beta as
an arbitrary retained field; its contents are neither inspected nor compared
with the direct alpha occurrence.
-/
def validate? (environment continuation : Term) : Term → Option Term
  | .app (.app foundContinuation foundAlpha) beta =>
      if foundContinuation = continuation then
        if foundAlpha = baseAlpha environment continuation then
          some beta
        else
          none
      else
        none
  | _ => none

@[simp]
theorem validate?_boundary (environment continuation beta : Term) :
    validate? environment continuation
        (.app (.app continuation (baseAlpha environment continuation)) beta) =
      some beta := by
  simp [validate?]

/-- The exact equation-(9) Base passes validation. -/
@[simp]
theorem validate?_base (environment continuation : Term) :
    validate? environment continuation (baseCarrier environment continuation) =
      some (baseBeta environment continuation) := by
  simp [baseCarrier]

/-- Validation fixes the public continuation/direct-alpha fields only. -/
theorem validate?_sound
    {environment continuation term beta : Term}
    (h : validate? environment continuation term = some beta) :
    term = .app (.app continuation (baseAlpha environment continuation)) beta := by
  cases term with
  | s => simp [validate?] at h
  | app fn arg =>
      cases fn with
      | s => simp [validate?] at h
      | app foundContinuation foundAlpha =>
          simp only [validate?] at h
          split at h
          next hcontinuation =>
            split at h
            next halpha =>
              have hbeta : arg = beta := Option.some.inj h
              rw [hcontinuation, halpha, hbeta]
            next => contradiction
          next => contradiction

/-- The validator is complete for every independently chosen beta field. -/
theorem validate?_complete
    (environment continuation beta : Term) :
    validate? environment continuation
        (.app (.app continuation (baseAlpha environment continuation)) beta) =
      some beta :=
  validate?_boundary environment continuation beta

theorem validate?_eq_some_iff
    (environment continuation term beta : Term) :
    validate? environment continuation term = some beta ↔
      term = .app (.app continuation (baseAlpha environment continuation)) beta := by
  constructor
  · exact validate?_sound
  · intro h
    rw [h]
    exact validate?_complete environment continuation beta

/-- The direct-alpha child and every Local seed child are arity-disjoint. -/
theorem directAlpha_ne_seedField
    (actions : Term) (bits : List Bool) (continuation seedAudit : Term) :
    baseAlpha (environmentCode actions bits) continuation ≠
      .app (seedCode bits) seedAudit := by
  intro h
  have harity := congrArg Term.headArity h
  simp only [Carrier.headArity_baseAlpha_environment,
    headArity_seedField] at harity
  cases harity

/--
Even with an arbitrary beta, a validated Base boundary cannot be a Local
shell.  The proof inspects only the registered `LR` child.
-/
theorem boundary_ne_localShell
    (actions : Term) (bits : List Bool)
    (continuation beta haltField dispatcher seedAudit continuationAudit : Term) :
    .app
        (.app continuation
          (baseAlpha (environmentCode actions bits) continuation))
        beta ≠
      Carrier.shell bits haltField dispatcher seedAudit continuation
        continuationAudit := by
  intro h
  have hchildren := congrArg
    (fun term => term.subterm? [.left, .right]) h
  simp only [Carrier.shell_seed_subterm] at hchildren
  change
    some (baseAlpha (environmentCode actions bits) continuation) =
      some (.app (seedCode bits) seedAudit) at hchildren
  exact directAlpha_ne_seedField actions bits continuation seedAudit
    (Option.some.inj hchildren)

/-- A successful Base validation is incompatible with the Local grammar. -/
theorem validated_not_local
    {actions : Term} {bits : List Bool} {continuation term beta dispatcher : Term}
    (hbase : validate? (environmentCode actions bits) continuation term =
      some beta)
    (hlocal : Carrier.LocalShell bits continuation dispatcher term) : False := by
  have hterm := validate?_sound hbase
  cases hlocal with
  | fresh haltAudit seedAudit continuationAudit =>
      apply boundary_ne_localShell actions bits continuation beta
        (freshHField haltAudit) dispatcher seedAudit continuationAudit
      simpa [Carrier.activeShell] using hterm.symm
  | marked leftAudit rightAudit seedAudit continuationAudit =>
      apply boundary_ne_localShell actions bits continuation beta
        (Carrier.markedHField leftAudit rightAudit) dispatcher seedAudit
        continuationAudit
      simpa [Carrier.activeShell] using hterm.symm

/-! ## Phase-zero decoding -/

/-- Follow the fixed Base address and invoke the registered cell decoder. -/
def decodeWord? (term : Term) : Option (List Bool) := do
  let queue ← term.subterm? wordAddress
  CellSpine.decode? queue

/-- The exact Base exposes precisely its literal encoded input word. -/
@[simp]
theorem decodeWord?_base (actions : Term) (bits : List Bool)
    (continuation : Term) :
    decodeWord? (baseCarrier (environmentCode actions bits) continuation) =
      some bits := by
  simp [decodeWord?, CellSpine.decode?_word]

/-- Package the exposed word as the phase-zero CTS configuration. -/
def decodeInitial? (program : CTS.Program) (term : Term) :
    Option (CTS.Config program) :=
  (decodeWord? term).map (CTS.initial program)

/-- Phase-zero Base decoding agrees exactly with `CTS.initial`. -/
@[simp]
theorem decodeInitial?_base (program : CTS.Program) (actions : Term)
    (bits : List Bool) (continuation : Term) :
    decodeInitial? program
        (baseCarrier (environmentCode actions bits) continuation) =
      some (CTS.initial program bits) := by
  simp [decodeInitial?]

end BasePath

end PureSFormal.PureS
