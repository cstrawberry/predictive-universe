import PureSFormal.Research.RootResetClockFuelCanonicalGrammar
import PureSFormal.Research.RootResetProgressProgramCode

/-!
# Progress-aware clock, fuel, and frame-prefix parsing

The clock and fuel grammars treat every seed payload as an opaque field.  They
can therefore be reused unchanged after instantiating their fixed action field
with `progressCompileActions`.  The three frame-prefix rows need one additional
operation: their literal seed is decoded with `RootResetProgressSpine.decode?`,
not with the ordinary live-word decoder.

The frame parsers retain the payload itself, its decoded queue and Open count,
and every copied carrier independently.  Successful parsing never compares
opaque copies.  The exact generated rows expose the three registered
contraction addresses `[]`, `[L]`, and `[L,L]`.
-/

namespace PureSFormal.Research.RootResetProgressClockFuel

open PureSFormal.PureS

/-! ## Payload-opaque clock and fuel instantiation -/

/-- The fixed progress-aware action field for one finite dispatcher tree. -/
def actions (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Term :=
  RootResetProgressProgramCode.progressCompileActions program tree

/-- The existing role-free clock parser is independent of the action field. -/
def parseClock? (term : Term) : Option RootResetClockFuelStages.ClockView :=
  RootResetClockFuelStages.parseClock? term

/-- Fixed-wrapper clock parsing instantiated with the progress dispatcher. -/
def parseCanonicalClock?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option RootResetClockFuelStages.ClockView :=
  RootResetClockFuelCanonicalGrammar.parseCanonicalClock?
    (actions program tree) term

/-- Recursive fuel parsing instantiated with the progress dispatcher. -/
def parseFuelActive?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option RootResetClockFuelStages.FuelView :=
  RootResetClockFuelStages.parseFuelActive? (actions program tree) term

/-- Strict local fuel-row parsing instantiated with the progress dispatcher. -/
def parseCanonicalFuelRow?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option RootResetClockFuelStages.FuelRow :=
  RootResetClockFuelCanonicalGrammar.parseCanonicalFuelRow?
    (actions program tree) term

/-- The semantic canonical fuel grammar at the progress action field. -/
abbrev CanonicalFuelView
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : RootResetClockFuelStages.FuelView) : Prop :=
  RootResetClockFuelCanonicalGrammar.CanonicalFuelView
    (actions program tree) view

/-- Canonical progress fuel views are accepted by the reused recursive parser. -/
theorem parseFuelActive?_canonical
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {view : RootResetClockFuelStages.FuelView}
    (canonical : CanonicalFuelView program tree view) :
    parseFuelActive? program tree (view.term (actions program tree)) =
      some view := by
  exact canonical.parseFuelActive

/-- Progress environments are literally the generic open wrapper at the
progress action field. -/
theorem progressEnvironmentCode_eq_openEnvironment
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) :
    RootResetProgressProgramCode.progressEnvironmentCode program tree bits =
      CheckpointDecoder.openEnvironment (actions program tree)
        (RootResetProgressProgramCode.progressWord bits) :=
  rfl

/-- The reused environment parser returns the progress payload without
inspecting it. -/
@[simp]
theorem parseEnvironment?_progress
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) :
    CheckpointDecoder.parseEnvironment? (actions program tree)
        (RootResetProgressProgramCode.progressEnvironmentCode program tree bits) =
      some (RootResetProgressProgramCode.progressWord bits) := by
  exact CheckpointDecoder.parseEnvironment?_open
    (actions program tree) (RootResetProgressProgramCode.progressWord bits)

/-! ## Seed evidence -/

/-- A literal progress seed together with the result of decoding its registered
progress-cell spine. -/
structure SeedView where
  payload : Term
  decoded : RootResetProgressSpine.View
  deriving BEq, DecidableEq, Repr

/-- Parse a seed payload using only the progress-cell grammar. -/
def parseSeedPayload? (payload : Term) : Option SeedView :=
  (RootResetProgressSpine.decode? payload).map fun decoded => ⟨payload, decoded⟩

/-- Parse the public one-argument seed wrapper. -/
def parseSeedCode? : Term → Option SeedView
  | .app .s payload => parseSeedPayload? payload
  | _ => none

/-- The canonical clean seed view of a literal input word. -/
def generatedSeed (bits : List Bool) : SeedView :=
  ⟨RootResetProgressProgramCode.progressWord bits, ⟨bits, 0⟩⟩

@[simp]
theorem parseSeedPayload?_progressWord (bits : List Bool) :
    parseSeedPayload? (RootResetProgressProgramCode.progressWord bits) =
      some (generatedSeed bits) := by
  simp [parseSeedPayload?, generatedSeed,
    RootResetProgressProgramCode.progressWord_decode]

@[simp]
theorem parseSeedCode?_progressSeedCode (bits : List Bool) :
    parseSeedCode? (RootResetProgressProgramCode.progressSeedCode bits) =
      some (generatedSeed bits) := by
  simp [parseSeedCode?, RootResetProgressProgramCode.progressSeedCode,
    parseSeedPayload?_progressWord]

/-- Successful payload parsing supplies the independent progress-spine
derivation. -/
theorem parseSeedPayload?_sound
    {payload : Term} {view : SeedView}
    (h : parseSeedPayload? payload = some view) :
    payload = view.payload ∧
      RootResetProgressSpine.Decodes view.payload view.decoded.bits
        view.decoded.openCount := by
  unfold parseSeedPayload? at h
  cases decodedEq : RootResetProgressSpine.decode? payload with
  | none => simp [decodedEq] at h
  | some decoded =>
      simp [decodedEq] at h
      subst view
      exact ⟨rfl, RootResetProgressSpine.decode?_sound decodedEq⟩

/-- Successful seed-code parsing reconstructs its exact public wrapper. -/
theorem parseSeedCode?_sound
    {term : Term} {view : SeedView}
    (h : parseSeedCode? term = some view) :
    term = .app .s view.payload ∧
      RootResetProgressSpine.Decodes view.payload view.decoded.bits
        view.decoded.openCount := by
  cases term with
  | s => simp [parseSeedCode?] at h
  | app fn payload =>
      cases fn with
      | app _ _ => simp [parseSeedCode?] at h
      | s =>
          have sound := parseSeedPayload?_sound h
          exact ⟨congrArg (Term.app .s) sound.1, sound.2⟩

/-! ## Progress dispatcher parsing -/

/-- Dispatcher syntax with a retained literal progress seed. -/
def SeedView.dispatcher (actions : Term) (seed : SeedView) : Term :=
  .app (.app .s (actCode actions)) (.app .s seed.payload)

/-- Parse `S (Act actions) (S payload)` and decode only its payload spine. -/
def parseDispatcher? (actions : Term) : Term → Option SeedView
  | .app (.app .s foundAct) seedCode =>
      if foundAct = actCode actions then parseSeedCode? seedCode else none
  | _ => none

@[simp]
theorem parseDispatcher?_generated
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) :
    parseDispatcher? (actions program tree)
        (RootResetProgressProgramCode.progressDispatcherCode program tree bits) =
      some (generatedSeed bits) := by
  simp [parseDispatcher?, RootResetProgressProgramCode.progressDispatcherCode,
    RootResetProgressProgramCode.progressActCode, actions, actCode,
    parseSeedCode?_progressSeedCode]

/-- Successful dispatcher parsing reconstructs the entire fixed wrapper and
the independent progress-spine evidence for its seed. -/
theorem parseDispatcher?_sound
    {actions term : Term} {seed : SeedView}
    (h : parseDispatcher? actions term = some seed) :
    term = seed.dispatcher actions ∧
      RootResetProgressSpine.Decodes seed.payload seed.decoded.bits
        seed.decoded.openCount := by
  unfold parseDispatcher? at h
  split at h <;> try contradiction
  next foundAct seedCode =>
    split at h
    next fixed =>
      have seedSound := parseSeedCode?_sound h
      subst foundAct
      exact ⟨by rw [seedSound.1]; rfl, seedSound.2⟩
    next => contradiction

/-! ## The three registered frame-prefix rows -/

/-- First frame row `R₀ = E B X`, with a decoded progress seed. -/
structure FrameR0View where
  seed : SeedView
  continuation : Term
  child : Term
  deriving BEq, DecidableEq, Repr

def FrameR0View.term (actions : Term) (view : FrameR0View) : Term :=
  frame (CheckpointDecoder.openEnvironment actions view.seed.payload)
    view.continuation view.child

/-- Parse the exact frame boundary; the environment wrapper is checked before
its returned seed payload is decoded as a progress spine. -/
def parseFrameR0? (actions : Term) : Term → Option FrameR0View
  | .app (.app environment continuation) child =>
      match CheckpointDecoder.parseEnvironment? actions environment with
      | none => none
      | some payload =>
          (parseSeedPayload? payload).map fun seed =>
            ⟨seed, continuation, child⟩
  | _ => none

/-- First residual row `R₁ = D X (B X)`. -/
structure FrameR1View where
  seed : SeedView
  carrierLeft : Term
  continuation : Term
  carrierRight : Term
  deriving BEq, DecidableEq, Repr

def FrameR1View.term (actions : Term) (view : FrameR1View) : Term :=
  .app (.app (view.seed.dispatcher actions) view.carrierLeft)
    (.app view.continuation view.carrierRight)

def parseFrameR1? (actions : Term) : Term → Option FrameR1View
  | .app (.app dispatcher carrierLeft)
      (.app continuation carrierRight) =>
      (parseDispatcher? actions dispatcher).map fun seed =>
        ⟨seed, carrierLeft, continuation, carrierRight⟩
  | _ => none

/-- Second residual row `R₂ = Act X (Seed X) (B X)`. -/
structure FrameR2View where
  seed : SeedView
  carrier0 : Term
  carrier1 : Term
  continuation : Term
  carrier2 : Term
  deriving BEq, DecidableEq, Repr

def FrameR2View.term (actions : Term) (view : FrameR2View) : Term :=
  .app
    (.app (.app (actCode actions) view.carrier0)
      (.app (.app .s view.seed.payload) view.carrier1))
    (.app view.continuation view.carrier2)

def parseFrameR2? (actions : Term) : Term → Option FrameR2View
  | .app
      (.app (.app foundAct carrier0) (.app seedCode carrier1))
      (.app continuation carrier2) =>
      if foundAct = actCode actions then
        (parseSeedCode? seedCode).map fun seed =>
          ⟨seed, carrier0, carrier1, continuation, carrier2⟩
      else none
  | _ => none

/-! ## Parser soundness and exact generated rows -/

theorem parseFrameR0?_sound
    {actions term : Term} {view : FrameR0View}
    (h : parseFrameR0? actions term = some view) :
    term = view.term actions ∧
      RootResetProgressSpine.Decodes view.seed.payload view.seed.decoded.bits
        view.seed.decoded.openCount := by
  unfold parseFrameR0? at h
  split at h <;> try contradiction
  next environment continuation child =>
    split at h <;> try contradiction
    next payload environmentEq =>
      cases seedEq : parseSeedPayload? payload with
      | none => simp [seedEq] at h
      | some seed =>
          simp [seedEq] at h
          subst view
          have seedSound := parseSeedPayload?_sound seedEq
          rw [CheckpointDecoder.parseEnvironment?_sound environmentEq,
            seedSound.1]
          exact ⟨rfl, seedSound.2⟩

theorem parseFrameR1?_sound
    {actions term : Term} {view : FrameR1View}
    (h : parseFrameR1? actions term = some view) :
    term = view.term actions ∧
      RootResetProgressSpine.Decodes view.seed.payload view.seed.decoded.bits
        view.seed.decoded.openCount := by
  unfold parseFrameR1? at h
  split at h <;> try contradiction
  next dispatcher carrierLeft continuation carrierRight =>
    cases seedEq : parseDispatcher? actions dispatcher with
    | none => simp [seedEq] at h
    | some seed =>
        simp [seedEq] at h
        subst view
        have dispatcherSound := parseDispatcher?_sound seedEq
        rw [dispatcherSound.1]
        exact ⟨rfl, dispatcherSound.2⟩

theorem parseFrameR2?_sound
    {actions term : Term} {view : FrameR2View}
    (h : parseFrameR2? actions term = some view) :
    term = view.term actions ∧
      RootResetProgressSpine.Decodes view.seed.payload view.seed.decoded.bits
        view.seed.decoded.openCount := by
  unfold parseFrameR2? at h
  split at h <;> try contradiction
  next foundAct carrier0 seedCode carrier1 continuation carrier2 =>
    split at h
    next fixed =>
      cases seedEq : parseSeedCode? seedCode with
      | none => simp [seedEq] at h
      | some seed =>
          simp [seedEq] at h
          subst view
          subst foundAct
          have seedSound := parseSeedCode?_sound seedEq
          rw [seedSound.1]
          exact ⟨rfl, seedSound.2⟩
    next => contradiction

@[simp]
theorem parseFrameR0?_generated
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation child : Term) :
    parseFrameR0? (actions program tree)
        (frame (RootResetProgressProgramCode.progressEnvironmentCode
          program tree bits)
          continuation child) =
      some ⟨generatedSeed bits, continuation, child⟩ := by
  rw [show frame
      (RootResetProgressProgramCode.progressEnvironmentCode program tree bits)
      continuation child =
      .app
        (.app
          (RootResetProgressProgramCode.progressEnvironmentCode
            program tree bits)
          continuation)
        child by rfl]
  simp only [parseFrameR0?]
  rw [parseEnvironment?_progress]
  simp only [parseSeedPayload?_progressWord, Option.map]

@[simp]
theorem parseFrameR1?_generated
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool)
    (carrierLeft continuation carrierRight : Term) :
    parseFrameR1? (actions program tree)
        (.app
          (.app (RootResetProgressProgramCode.progressDispatcherCode
            program tree bits) carrierLeft)
          (.app continuation carrierRight)) =
      some ⟨generatedSeed bits, carrierLeft, continuation, carrierRight⟩ := by
  simp [parseFrameR1?, parseDispatcher?_generated]

@[simp]
theorem parseFrameR2?_generated
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool)
    (carrier0 carrier1 continuation carrier2 : Term) :
    parseFrameR2? (actions program tree)
        (.app
          (.app
            (.app (RootResetProgressProgramCode.progressActCode program tree)
              carrier0)
            (.app (RootResetProgressProgramCode.progressSeedCode bits)
              carrier1))
          (.app continuation carrier2)) =
      some ⟨generatedSeed bits, carrier0, carrier1, continuation, carrier2⟩ := by
  simp [parseFrameR2?, RootResetProgressProgramCode.progressActCode,
    actions, actCode,
    parseSeedCode?_progressSeedCode]

/-! ## Exact selected occurrences and contracta -/

def frameR0Address : Address := []
def frameR1Address : Address := [.left]
def frameR2Address : Address := [.left, .left]

def frameR0
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) : Term :=
  frame (RootResetProgressProgramCode.progressEnvironmentCode program tree bits)
    continuation carrier

def frameR1
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) : Term :=
  .app
    (.app
      (RootResetProgressProgramCode.progressDispatcherCode program tree bits)
      carrier)
    (.app continuation carrier)

def frameR2
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) : Term :=
  .app
    (.app
      (.app (RootResetProgressProgramCode.progressActCode program tree) carrier)
      (.app (RootResetProgressProgramCode.progressSeedCode bits) carrier))
    (.app continuation carrier)

@[simp]
theorem frameR0_subterm
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    (frameR0 program tree bits continuation carrier).subterm? frameR0Address =
      some (frameR0 program tree bits continuation carrier) :=
  rfl

@[simp]
theorem frameR1_subterm
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    (frameR1 program tree bits continuation carrier).subterm? frameR1Address =
      some (.app
        (RootResetProgressProgramCode.progressDispatcherCode program tree bits)
        carrier) :=
  rfl

@[simp]
theorem frameR2_subterm
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    (frameR2 program tree bits continuation carrier).subterm? frameR2Address =
      some (.app
        (RootResetProgressProgramCode.progressActCode program tree) carrier) :=
  rfl

@[simp]
theorem frameR0_contractAt?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    (frameR0 program tree bits continuation carrier).contractAt?
        frameR0Address =
      some (frameR1 program tree bits continuation carrier) := by
  rfl

@[simp]
theorem frameR1_contractAt?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    (frameR1 program tree bits continuation carrier).contractAt?
        frameR1Address =
      some (frameR2 program tree bits continuation carrier) := by
  rfl

@[simp]
theorem frameR2_contractAt?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    (frameR2 program tree bits continuation carrier).contractAt?
        frameR2Address =
      some (RootResetProgressProgramCode.progressFreshLocal
        program tree bits continuation carrier) := by
  rfl

theorem frameR0_step_frameR1
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    Step (frameR0 program tree bits continuation carrier)
      (frameR1 program tree bits continuation carrier) :=
  Term.contractAt?_sound
    (frameR0_contractAt? program tree bits continuation carrier)

theorem frameR1_step_frameR2
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    Step (frameR1 program tree bits continuation carrier)
      (frameR2 program tree bits continuation carrier) :=
  Term.contractAt?_sound
    (frameR1_contractAt? program tree bits continuation carrier)

theorem frameR2_step_freshLocal
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    Step (frameR2 program tree bits continuation carrier)
      (RootResetProgressProgramCode.progressFreshLocal
        program tree bits continuation carrier) :=
  Term.contractAt?_sound
    (frameR2_contractAt? program tree bits continuation carrier)

end PureSFormal.Research.RootResetProgressClockFuel
