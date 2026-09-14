import PureSFormal.Research.RootResetCompositeStageRegistry

/-!
# Persistent fuel-carrier handoff from the bare term

This module isolates the carrier endpoint reached by the fifth zero-fuel
sample of the existing persistent scheduler.  Unlike the
progress carrier, that endpoint contains the ordinary `CellSpine.word`
encoding.  The executable parser below therefore runs
`CellDeletion.findFront?` on the immutable dormant seed, never on the
partially deleted active queue.

Before C4, equality of the active queue and dormant seed identifies the
unique canonical front.  After C4, equality of the active queue and the
front endpoint identifies the handoff to the innermost pending frame.  The
empty literal seed bypasses C4 and hands its unchanged Base directly to that
frame.  The returned addresses are relative to the bare active term.  A final wrapper
lifts them through the canonical prefix of completed marked Locals.

The results are local syntax and contraction theorems.  They do not assert
that every reachable scheduler term has one of these forms and do not supply
the global closure needed for term-only path identity.
-/

namespace PureSFormal.Research.RootResetPersistentFuelCarrier

open PureSFormal.PureS
open RootResetReachableStageGrammar
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetCompositeStageRegistry

/-! ## Exact contexts for the active Base queue -/

/-- The context from an open-environment root to its seed payload. -/
def openEnvironmentPayloadContext (actions : Term) : Context :=
  .appRight .s
    (.appRight (.app .s (actCode actions)) (.appRight .s .hole))

@[simp]
theorem openEnvironmentPayloadContext_plug (actions payload : Term) :
    (openEnvironmentPayloadContext actions).plug payload =
      CheckpointDecoder.openEnvironment actions payload :=
  rfl

/-- The context from an open-Base root to its active queue payload. -/
def openBaseQueueContext (actions : Term) (base : OpenBaseView) : Context :=
  .appLeft
    (.appRight base.outerContinuation
      (.appLeft
        (.appLeft (openEnvironmentPayloadContext actions)
          (.app b
            (CheckpointDecoder.openEnvironment actions base.seedPayload)))
        base.innerContinuation))
    base.beta

@[simp]
theorem openBaseQueueContext_plug
    (actions : Term) (base : OpenBaseView) :
    (openBaseQueueContext actions base).plug base.queue = base.term actions :=
  rfl

@[simp]
theorem openBaseQueueContext_address
    (actions : Term) (base : OpenBaseView) :
    RootResetSelectorContract.contextAddress
        (openBaseQueueContext actions base) =
      BasePath.wordAddress :=
  rfl

/-- Replace only the active queue field of an independently parsed Base. -/
def withQueue (base : OpenBaseView) (queue : Term) : OpenBaseView :=
  { base with queue := queue }

@[simp]
theorem openBaseQueueContext_plug_withQueue
    (actions : Term) (base : OpenBaseView) (queue : Term) :
    (openBaseQueueContext actions base).plug queue =
      (withQueue base queue).term actions :=
  rfl

/-- Complete context from a fuel-carrier root to its active queue payload. -/
def carrierQueueContext
    (actions : Term) (layers : List PendingLayer) (base : OpenBaseView) :
    Context :=
  (pendingContext layers).comp (openBaseQueueContext actions base)

@[simp]
theorem carrierQueueContext_plug
    (actions : Term) (layers : List PendingLayer) (base : OpenBaseView) :
    (carrierQueueContext actions layers base).plug base.queue =
      FuelView.term actions ⟨layers, .carrier base⟩ := by
  simp only [carrierQueueContext, Context.plug_comp,
    openBaseQueueContext_plug, FuelView.term, FuelEndpoint.term]

@[simp]
theorem carrierQueueContext_plug_withQueue
    (actions : Term) (layers : List PendingLayer) (base : OpenBaseView)
    (queue : Term) :
    (carrierQueueContext actions layers base).plug queue =
      FuelView.term actions ⟨layers, .carrier (withQueue base queue)⟩ := by
  simp [carrierQueueContext, FuelView.term, FuelEndpoint.term,
    Context.plug_comp]

@[simp]
theorem carrierQueueContext_address
    (actions : Term) (layers : List PendingLayer) (base : OpenBaseView) :
    RootResetSelectorContract.contextAddress
        (carrierQueueContext actions layers base) =
      rights layers.length ++ BasePath.wordAddress := by
  simp [carrierQueueContext, RootResetSelectorContract.contextAddress_comp,
    pendingContext_address]

/-! ## Last pending-frame decomposition -/

/-- Executable decomposition of a nonempty outer-to-inner pending stack. -/
structure LastLayer where
  outerLayers : List PendingLayer
  layer : PendingLayer

/-- Remove the innermost pending layer, preserving the outer-to-inner order. -/
def splitLast? : List PendingLayer → Option LastLayer
  | [] => none
  | first :: rest =>
      match splitLast? rest with
      | none => some ⟨[], first⟩
      | some last => some ⟨first :: last.outerLayers, last.layer⟩

@[simp]
theorem splitLast?_nil : splitLast? [] = none :=
  rfl

/-- Failure occurs exactly on the empty pending stack. -/
theorem splitLast?_eq_none_iff (layers : List PendingLayer) :
    splitLast? layers = none ↔ layers = [] := by
  cases layers with
  | nil => simp [splitLast?]
  | cons first rest =>
      unfold splitLast?
      cases splitLast? rest <;> simp

/-- Splitting an explicit final layer recovers exactly that layer. -/
@[simp]
theorem splitLast?_append_singleton
    (outerLayers : List PendingLayer) (layer : PendingLayer) :
    splitLast? (outerLayers ++ [layer]) = some ⟨outerLayers, layer⟩ := by
  induction outerLayers with
  | nil => rfl
  | cons first outerLayers ih =>
      simp only [List.cons_append, splitLast?, ih]

/-- Every successful split reconstructs the original pending stack. -/
theorem splitLast?_sound
    {layers : List PendingLayer} {last : LastLayer}
    (accepted : splitLast? layers = some last) :
    layers = last.outerLayers ++ [last.layer] := by
  induction layers generalizing last with
  | nil => simp [splitLast?] at accepted
  | cons first rest ih =>
      unfold splitLast? at accepted
      generalize tailEq : splitLast? rest = tailResult at accepted
      cases tailResult with
      | none =>
          have restEmpty : rest = [] :=
            (splitLast?_eq_none_iff rest).mp tailEq
          subst rest
          have lastEq := Option.some.inj accepted
          subst last
          rfl
      | some inner =>
          have innerSource := ih tailEq
          have lastEq := Option.some.inj accepted
          subst last
          simp [innerSource]

/-- Every nonempty pending stack has an executable final-layer split. -/
theorem exists_splitLast?_of_ne_nil
    {layers : List PendingLayer} (nonempty : layers ≠ []) :
    ∃ last, splitLast? layers = some last := by
  have some_of_ne_none : ∀ value : Option LastLayer,
      value ≠ none → ∃ last, value = some last := by
    intro value differs
    cases value with
    | none => exact False.elim (differs rfl)
    | some last => exact ⟨last, rfl⟩
  apply some_of_ne_none (splitLast? layers)
  intro rejected
  exact nonempty ((splitLast?_eq_none_iff layers).mp rejected)

/-- Appending one pending layer exposes its frame below the outer prefix. -/
theorem pendingContext_append_singleton_plug
    (outerLayers : List PendingLayer) (layer : PendingLayer) (body : Term) :
    (pendingContext (outerLayers ++ [layer])).plug body =
      (pendingContext outerLayers).plug
        (frame layer.environment layer.continuation body) := by
  induction outerLayers with
  | nil => rfl
  | cons first outerLayers ih =>
      simp only [List.cons_append, pendingContext_cons, Context.plug, ih]

/-- The root of the innermost frame lies after one right move per outer layer. -/
theorem pendingContext_innermostFrame_address
    (outerLayers : List PendingLayer) :
    RootResetSelectorContract.contextAddress (pendingContext outerLayers) =
      rights outerLayers.length :=
  pendingContext_address outerLayers

/-- The final member of a canonical pending stack is canonical. -/
theorem canonicalPendingLayers_last
    {actions : Term} {outerLayers : List PendingLayer} {layer : PendingLayer}
    (canonical : CanonicalPendingLayers actions (outerLayers ++ [layer])) :
    CanonicalPendingLayer actions layer := by
  induction outerLayers with
  | nil => exact canonical.1
  | cons first outerLayers ih => exact ih canonical.2

/-! ## Immutable-seed front parser -/

/-- Literal seed data paired with the result of the canonical-front search. -/
structure SeedFront where
  bits : List Bool
  front : CellDeletion.Front

/-- Semantic certificate carried by a successful immutable-seed parse. -/
structure SeedFront.Valid (seed : Term) (view : SeedFront) : Prop where
  literal : seed = word view.bits
  found : CellDeletion.findFront? seed = some view.front
  suffixCertificate : ∃ remaining,
    view.bits = view.front.bit :: remaining ∧
      CellDeletion.IsCanonicalFront seed remaining view.front

/-- Parse the literal seed and find its innermost live cell. -/
def parseSeedFront? (seed : Term) : Option SeedFront :=
  match CheckpointDecoder.parseWord? seed with
  | none => none
  | some bits =>
      match CellDeletion.findFront? seed with
      | none => none
      | some front => some ⟨bits, front⟩

/-- A successful seed parse yields the canonical front certificate. -/
theorem parseSeedFront?_sound
    {seed : Term} {view : SeedFront}
    (accepted : parseSeedFront? seed = some view) :
    view.Valid seed := by
  unfold parseSeedFront? at accepted
  generalize wordEq : CheckpointDecoder.parseWord? seed = wordResult at accepted
  cases wordResult with
  | none => simp at accepted
  | some bits =>
      generalize frontEq : CellDeletion.findFront? seed = frontResult at accepted
      cases frontResult with
      | none => simp at accepted
      | some front =>
          have viewEq := Option.some.inj accepted
          subst view
          have literal := CheckpointDecoder.parseWord?_sound wordEq
          have decoded : CellSpine.Decodes seed bits := by
            rw [literal]
            exact CellSpine.decodes_word bits
          have spec := CellDeletion.findFront?_spec decoded
          rw [frontEq] at spec
          obtain ⟨suffix, bitsEq, canonical⟩ := spec
          exact ⟨literal, frontEq, ⟨suffix, bitsEq, canonical⟩⟩

/-- Every nonempty literal word is accepted with its unique canonical front. -/
theorem exists_parseSeedFront?_word_cons
    (bit : Bool) (suffix : List Bool) :
    ∃ view,
      parseSeedFront? (word (bit :: suffix)) = some view ∧
        view.Valid (word (bit :: suffix)) := by
  obtain ⟨front, specification, _unique⟩ :=
    CellDeletion.canonicalFront (CellSpine.decodes_word (bit :: suffix))
  refine ⟨⟨bit :: suffix, front⟩, ?_, ?_⟩
  · simp [parseSeedFront?, specification.1]
  · exact ⟨rfl, specification.1, ⟨suffix,
      by simpa [specification.2.1], specification.2.2.1⟩⟩

/-- Address-level form of the canonical C4 contraction. -/
theorem canonicalFront_contractAt?_eq_endpoint
    {term : Term} {suffix : List Bool} {front : CellDeletion.Front}
    (canonical : CellDeletion.IsCanonicalFront term suffix front) :
    term.contractAt? front.address = some front.endpoint := by
  unfold Term.contractAt?
  rw [canonical.selected_subterm]
  change term.replace? front.address
      (Carrier.tombstone front.bit front.predecessor front.predecessor) =
    some front.endpoint
  exact canonical.endpoint_replace

/-- A canonical C4 endpoint differs from its nonempty immutable source. -/
theorem SeedFront.Valid.endpoint_ne_seed
    {seed : Term} {view : SeedFront} (valid : view.Valid seed) :
    view.front.endpoint ≠ seed := by
  obtain ⟨remaining, bitsEq, canonical⟩ := valid.suffixCertificate
  intro endpointEq
  have sourceDecoded : CellSpine.Decodes seed view.bits := by
    rw [valid.literal]
    exact CellSpine.decodes_word view.bits
  have endpointDecoded := canonical.endpoint_decodes
  rw [endpointEq] at endpointDecoded
  have wordsEqual := sourceDecoded.deterministic endpointDecoded
  have impossible : view.front.bit :: remaining = remaining :=
    bitsEq.symm.trans wordsEqual
  have lengths := congrArg List.length impossible
  exact (Nat.ne_of_lt (Nat.lt_succ_self remaining.length)) lengths.symm

/-! ## Nonempty deletion and empty handoff stages -/

/-- The syntax-distinguished stages at the fifth-sample carrier boundary. -/
inductive Stage where
  | preC4 (seed : SeedFront)
  | postC4 (seed : SeedFront) (last : LastLayer)
  | empty (last : LastLayer)

/-- A parsed ordinary fuel-carrier stage. -/
structure View where
  layers : List PendingLayer
  base : OpenBaseView
  stage : Stage

namespace View

def fuelView (view : View) : FuelView :=
  ⟨view.layers, .carrier view.base⟩

def source (actions : Term) (view : View) : Term :=
  view.fuelView.term actions

/-- Root-relative bare-term address selected at either side of the handoff. -/
def selectedAddress (view : View) : Address :=
  match view.stage with
  | .preC4 seed =>
      (rights view.layers.length ++ BasePath.wordAddress) ++
        seed.front.address
  | .postC4 _ last => rights last.outerLayers.length
  | .empty last => rights last.outerLayers.length

/-- The first frame-prefix contractum. -/
def frameFirstTarget
    (actions : Term) (bits : List Bool) (continuation carrier : Term) : Term :=
  .app
    (.app (dispatcherCode actions bits) carrier)
    (.app continuation carrier)

/-- Exact whole active-term target at either side of the handoff. -/
def target (actions : Term) (view : View) : Term :=
  match view.stage with
  | .preC4 seed =>
      (carrierQueueContext actions view.layers view.base).plug
        seed.front.endpoint
  | .postC4 seed last =>
      (pendingContext last.outerLayers).plug
        (frameFirstTarget actions seed.bits last.layer.continuation
          (view.base.term actions))
  | .empty last =>
      (pendingContext last.outerLayers).plug
        (frameFirstTarget actions [] last.layer.continuation
          (view.base.term actions))

end View

/-- Declarative facts reconstructed by the executable stage parser. -/
def Stage.Valid
    (actions : Term) (layers : List PendingLayer) (base : OpenBaseView) :
    Stage → Prop
  | .preC4 seed =>
      seed.Valid base.seedPayload ∧ base.queue = base.seedPayload
  | .postC4 seed last =>
      seed.Valid base.seedPayload ∧
        base.queue = seed.front.endpoint ∧
        layers = last.outerLayers ++ [last.layer] ∧
        last.layer.seedPayload = base.seedPayload
  | .empty last =>
      base.seedPayload = word [] ∧ base.queue = base.seedPayload ∧
        layers = last.outerLayers ++ [last.layer] ∧
        last.layer.seedPayload = base.seedPayload

/-- Full local soundness certificate for a parsed carrier stage. -/
structure Valid (actions term : Term) (view : View) : Prop where
  source : term = view.source actions
  canonical : CanonicalFuelView actions view.fuelView
  stage : Stage.Valid actions view.layers view.base view.stage

/-- Total parser for the ordinary fifth-sample carrier and its C4 handoff. -/
def parse? (actions term : Term) : Option View :=
  match parseCanonicalFuelActive? actions term with
  | some ⟨layers, .carrier base⟩ =>
      match parseSeedFront? base.seedPayload with
      | none =>
          if base.seedPayload = word [] ∧ base.queue = base.seedPayload then
            match splitLast? layers with
            | none => none
            | some last =>
                if last.layer.seedPayload = base.seedPayload then
                  some ⟨layers, base, .empty last⟩
                else none
          else none
      | some seed =>
          if base.queue = base.seedPayload then
            some ⟨layers, base, .preC4 seed⟩
          else if base.queue = seed.front.endpoint then
            match splitLast? layers with
            | none => none
            | some last =>
                if last.layer.seedPayload = base.seedPayload then
                  some ⟨layers, base, .postC4 seed last⟩
                else none
          else none
  | _ => none

/-- Successful parsing reconstructs the exact source and stage conditions. -/
theorem parse?_sound
    {actions term : Term} {view : View}
    (accepted : parse? actions term = some view) :
    Valid actions term view := by
  unfold parse? at accepted
  generalize fuelEq : parseCanonicalFuelActive? actions term = fuelResult at accepted
  cases fuelResult with
  | none => simp [fuelEq] at accepted
  | some fuel =>
      rcases fuel with ⟨layers, endpoint⟩
      cases endpoint with
      | row row => simp at accepted
      | carrier base =>
          simp only at accepted
          generalize seedEq : parseSeedFront? base.seedPayload = seedResult at accepted
          cases seedResult with
          | none =>
              simp only at accepted
              by_cases emptySeed :
                  base.seedPayload = word [] ∧ base.queue = base.seedPayload
              · simp only [if_pos emptySeed] at accepted
                generalize splitEq : splitLast? layers = splitResult at accepted
                cases splitResult with
                | none => contradiction
                | some last =>
                    simp only at accepted
                    by_cases lastSeed : last.layer.seedPayload = base.seedPayload
                    · simp only [if_pos lastSeed] at accepted
                      have viewEq := Option.some.inj accepted
                      subst view
                      have strict := parseCanonicalFuelActive?_sound fuelEq
                      exact ⟨by simpa [View.source, View.fuelView] using strict.1,
                        by simpa [View.fuelView] using strict.2,
                        emptySeed.1, emptySeed.2,
                        splitLast?_sound splitEq, lastSeed⟩
                    · simp only [if_neg lastSeed] at accepted
                      contradiction
              · simp only [if_neg emptySeed] at accepted
                contradiction
          | some seed =>
              simp only at accepted
              by_cases queueIsSeed : base.queue = base.seedPayload
              · simp only [if_pos queueIsSeed] at accepted
                have viewEq := Option.some.inj accepted
                subst view
                have strict := parseCanonicalFuelActive?_sound fuelEq
                exact ⟨by simpa [View.source, View.fuelView] using strict.1,
                  by simpa [View.fuelView] using strict.2,
                  parseSeedFront?_sound seedEq, queueIsSeed⟩
              · simp only [if_neg queueIsSeed] at accepted
                by_cases queueIsEndpoint : base.queue = seed.front.endpoint
                · simp only [if_pos queueIsEndpoint] at accepted
                  generalize splitEq : splitLast? layers = splitResult at accepted
                  cases splitResult with
                  | none => simp [splitEq] at accepted
                  | some last =>
                      simp only at accepted
                      by_cases lastSeed :
                          last.layer.seedPayload = base.seedPayload
                      · simp only [if_pos lastSeed] at accepted
                        have viewEq := Option.some.inj accepted
                        subst view
                        have strict := parseCanonicalFuelActive?_sound fuelEq
                        exact ⟨by
                            simpa [View.source, View.fuelView] using strict.1,
                          by simpa [View.fuelView] using strict.2,
                          parseSeedFront?_sound seedEq, queueIsEndpoint,
                          splitLast?_sound splitEq, lastSeed⟩
                      · simp only [if_neg lastSeed] at accepted
                        contradiction
                · simp only [if_neg queueIsEndpoint] at accepted
                  contradiction

/-- Completeness for a canonical pre-C4 carrier with an accepted immutable seed. -/
theorem parse?_complete_preC4
    (actions : Term) (layers : List PendingLayer) (base : OpenBaseView)
    (seed : SeedFront)
    (canonical : CanonicalFuelView actions ⟨layers, .carrier base⟩)
    (seedParsed : parseSeedFront? base.seedPayload = some seed)
    (queueEq : base.queue = base.seedPayload) :
    parse? actions (FuelView.term actions ⟨layers, .carrier base⟩) =
      some ⟨layers, base, .preC4 seed⟩ := by
  have strict := parseCanonicalFuelActive?_complete
    (actions := actions) (view := ⟨layers, .carrier base⟩) rfl canonical
  simp [parse?, strict, seedParsed, queueEq]

/-- Completeness for the exact post-C4 queue and final pending layer. -/
theorem parse?_complete_postC4
    (actions : Term) (outerLayers : List PendingLayer) (layer : PendingLayer)
    (base : OpenBaseView) (seed : SeedFront)
    (canonical : CanonicalFuelView actions
      ⟨outerLayers ++ [layer], .carrier base⟩)
    (seedParsed : parseSeedFront? base.seedPayload = some seed)
    (queueEq : base.queue = seed.front.endpoint)
    (lastSeed : layer.seedPayload = base.seedPayload) :
    parse? actions
        (FuelView.term actions ⟨outerLayers ++ [layer], .carrier base⟩) =
      some ⟨outerLayers ++ [layer], base,
        .postC4 seed ⟨outerLayers, layer⟩⟩ := by
  have seedValid := parseSeedFront?_sound seedParsed
  have endpointNe : seed.front.endpoint ≠ base.seedPayload :=
    seedValid.endpoint_ne_seed
  have queueNe : base.queue ≠ base.seedPayload := by
    rw [queueEq]
    exact seedValid.endpoint_ne_seed
  have strict := parseCanonicalFuelActive?_complete
    (actions := actions) (view := ⟨outerLayers ++ [layer], .carrier base⟩)
    rfl canonical
  simp [parse?, strict, seedParsed, queueNe, endpointNe, queueEq, lastSeed]

/-- Root contraction of the first registered frame row. -/
@[simp]
theorem frameFirst_contractAt?
    (actions : Term) (bits : List Bool) (continuation carrier : Term) :
    (frame (environmentCode actions bits) continuation carrier).contractAt? [] =
      some (View.frameFirstTarget actions bits continuation carrier) :=
  rfl

/-- The empty literal has no C4 front to contract. -/
@[simp]
theorem parseSeedFront?_word_nil : parseSeedFront? (word []) = none := by
  rw [parseSeedFront?, CheckpointDecoder.parseWord?_word]
  rfl

/-- Empty fuel bypasses deletion and selects the innermost pending frame. -/
theorem parse?_complete_empty
    (actions : Term) (outerLayers : List PendingLayer) (layer : PendingLayer)
    (base : OpenBaseView)
    (canonical : CanonicalFuelView actions
      ⟨outerLayers ++ [layer], .carrier base⟩)
    (seedEmpty : base.seedPayload = word [])
    (queueEq : base.queue = base.seedPayload)
    (lastSeed : layer.seedPayload = base.seedPayload) :
    parse? actions
        (FuelView.term actions ⟨outerLayers ++ [layer], .carrier base⟩) =
      some ⟨outerLayers ++ [layer], base, .empty ⟨outerLayers, layer⟩⟩ := by
  have strict := parseCanonicalFuelActive?_complete
    (actions := actions) (view := ⟨outerLayers ++ [layer], .carrier base⟩)
    rfl canonical
  rw [parse?, strict]
  dsimp only
  rw [seedEmpty, parseSeedFront?_word_nil]
  simp only [seedEmpty, queueEq, and_self, if_true,
    splitLast?_append_singleton, lastSeed]

/-- The empty carrier handoff contracts its actual pending-frame root. -/
theorem selected_contracts_empty
    {actions term : Term} {view : View} {last : LastLayer}
    (valid : Valid actions term view)
    (stageEq : view.stage = .empty last) :
    term.contractAt? view.selectedAddress = some (view.target actions) := by
  have stageValid := valid.stage
  rw [stageEq] at stageValid
  rcases stageValid with ⟨seedEmpty, queueEmpty, layersEq, lastSeed⟩
  have lastCanonical : CanonicalPendingLayer actions last.layer := by
    apply canonicalPendingLayers_last
    simpa [View.fuelView, layersEq] using valid.canonical.layers
  have environmentEq : last.layer.environment = environmentCode actions [] := by
    rw [lastCanonical.1, lastSeed, seedEmpty]
    rfl
  have localContract := frameFirst_contractAt? actions []
    last.layer.continuation (view.base.term actions)
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    (pendingContext last.outerLayers) [] localContract
  rw [valid.source]
  simpa [View.source, View.fuelView, View.selectedAddress, View.target,
    stageEq, layersEq, FuelView.term, FuelEndpoint.term,
    pendingContext_append_singleton_plug, environmentEq] using lifted

/-- A successful pre-C4 parse returns the exact C4 address and contractum. -/
theorem selected_contracts_preC4
    {actions term : Term} {view : View} {seed : SeedFront}
    (valid : Valid actions term view)
    (stageEq : view.stage = .preC4 seed) :
    term.contractAt? view.selectedAddress = some (view.target actions) := by
  have stageValid := valid.stage
  rw [stageEq] at stageValid
  obtain ⟨remaining, bitsEq, canonical⟩ :=
    stageValid.1.suffixCertificate
  have localSeed := canonicalFront_contractAt?_eq_endpoint
    canonical
  have localQueue :
      view.base.queue.contractAt? seed.front.address =
        some seed.front.endpoint := by
    simpa [stageValid.2] using localSeed
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    (carrierQueueContext actions view.layers view.base)
    seed.front.address localQueue
  rw [valid.source]
  simpa [View.source, View.fuelView, View.selectedAddress, View.target,
    stageEq, carrierQueueContext_address] using! lifted

/-- A successful post-C4 parse selects the innermost pending-frame R0. -/
theorem selected_contracts_postC4
    {actions term : Term} {view : View} {seed : SeedFront} {last : LastLayer}
    (valid : Valid actions term view)
    (stageEq : view.stage = .postC4 seed last) :
    term.contractAt? view.selectedAddress = some (view.target actions) := by
  have stageValid := valid.stage
  rw [stageEq] at stageValid
  rcases stageValid with
    ⟨seedValid, queueEndpoint, layersEq, lastSeed⟩
  have lastCanonical : CanonicalPendingLayer actions last.layer := by
    apply canonicalPendingLayers_last
    simpa [View.fuelView, layersEq] using valid.canonical.layers
  have environmentEq :
      last.layer.environment = environmentCode actions seed.bits := by
    rw [lastCanonical.1, lastSeed, seedValid.literal]
    rfl
  have localContract := frameFirst_contractAt? actions seed.bits
    last.layer.continuation (view.base.term actions)
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    (pendingContext last.outerLayers) [] localContract
  rw [valid.source]
  simpa [View.source, View.fuelView, View.selectedAddress, View.target,
    stageEq, layersEq, FuelView.term, FuelEndpoint.term,
    pendingContext_append_singleton_plug, environmentEq] using lifted

/-- Every successful carrier parse returns an exact saturated contraction. -/
theorem View.selected_contracts
    {actions term : Term} {view : View}
    (accepted : parse? actions term = some view) :
    term.contractAt? view.selectedAddress = some (view.target actions) := by
  have valid := parse?_sound accepted
  cases stageEq : view.stage with
  | preC4 seed => exact selected_contracts_preC4 valid stageEq
  | postC4 seed last => exact selected_contracts_postC4 valid stageEq
  | empty last => exact selected_contracts_empty valid stageEq

/-- Every selected carrier mutation is one contextual pure-S step. -/
theorem View.selected_step
    {actions term : Term} {view : View}
    (accepted : parse? actions term = some view) :
    Step term (view.target actions) :=
  Term.contractAt?_sound (view.selected_contracts accepted)

/-! ## Completeness for generated fifth-sample syntax -/

/-- A generated pending layer for one immutable input word. -/
def generatedLayer
    (actions : Term) (bits : List Bool) (continuation : Term) : PendingLayer :=
  ⟨environmentCode actions bits, continuation, word bits⟩

/-- Repetition of a generated admissible layer is a canonical pending stack. -/
theorem canonicalPendingLayers_replicate_generatedLayer
    (actions : Term) (bits : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    ∀ count,
      CanonicalPendingLayers actions
        (List.replicate count (generatedLayer actions bits continuation))
  | 0 => trivial
  | count + 1 => by
      constructor
      · exact ⟨rfl, admissible⟩
      · exact canonicalPendingLayers_replicate_generatedLayer actions bits
          continuation admissible count

/-- Appending one more generated layer preserves the canonical stack. -/
theorem canonicalPendingLayers_generated_append
    (actions : Term) (bits : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation) (depth : Nat) :
    CanonicalPendingLayers actions
      (List.replicate depth (generatedLayer actions bits continuation) ++
        [generatedLayer actions bits continuation]) := by
  induction depth with
  | zero => exact ⟨⟨rfl, admissible⟩, trivial⟩
  | succ depth ih => exact ⟨⟨rfl, admissible⟩, ih⟩

/-- Every empty generated job hands its unchanged Base to the innermost frame,
uniformly in the number of enclosing pending frames. -/
theorem parse?_generated_empty
    (actions continuation : Term) (admissible : Carrier.Admissible continuation)
    (depth : Nat) :
    let layer := generatedLayer actions [] continuation
    let outerLayers := List.replicate depth layer
    let base := generatedBaseView actions (word []) continuation
    parse? actions
        (FuelView.term actions ⟨outerLayers ++ [layer], .carrier base⟩) =
      some ⟨outerLayers ++ [layer], base, .empty ⟨outerLayers, layer⟩⟩ := by
  dsimp only
  apply parse?_complete_empty
  · exact ⟨canonicalPendingLayers_generated_append actions [] continuation
      admissible depth,
      generatedBaseView_canonical actions (word []) continuation admissible⟩
  · rfl
  · rfl
  · rfl

/-- The generated fifth-sample Base under a positive pending depth is
recognized as pre-C4 syntax. -/
theorem exists_preC4_of_generatedFifthSample
    (actions : Term) (bit : Bool) (suffix : List Bool)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (depth : Nat) :
    let bits := bit :: suffix
    let layer := generatedLayer actions bits continuation
    let layers := List.replicate depth layer ++ [layer]
    let base := generatedBaseView actions (word bits) continuation
    ∃ view,
      parse? actions (FuelView.term actions ⟨layers, .carrier base⟩) =
          some view ∧
        ∃ seed, view.stage = .preC4 seed ∧
          view.selectedAddress =
            (rights layers.length ++ BasePath.wordAddress) ++
              seed.front.address ∧
          (FuelView.term actions ⟨layers, .carrier base⟩).contractAt?
              view.selectedAddress = some (view.target actions) := by
  dsimp only
  obtain ⟨seed, seedParse, seedValid⟩ :=
    exists_parseSeedFront?_word_cons bit suffix
  let layer := generatedLayer actions (bit :: suffix) continuation
  let layers := List.replicate depth layer ++ [layer]
  let base := generatedBaseView actions (word (bit :: suffix)) continuation
  have canonical : CanonicalFuelView actions
      ⟨layers, .carrier base⟩ := by
    refine ⟨?_, generatedBaseView_canonical actions
      (word (bit :: suffix)) continuation admissible⟩
    exact canonicalPendingLayers_generated_append actions (bit :: suffix)
      continuation admissible depth
  have strict : parseCanonicalFuelActive? actions
      (FuelView.term actions ⟨layers, .carrier base⟩) =
        some ⟨layers, .carrier base⟩ :=
    parseCanonicalFuelActive?_complete rfl canonical
  let view : View := ⟨layers, base, .preC4 seed⟩
  have parsed : parse? actions
      (FuelView.term actions ⟨layers, .carrier base⟩) = some view := by
    simpa [view] using parse?_complete_preC4 actions layers base seed
      canonical seedParse rfl
  refine ⟨view, parsed, seed, rfl, rfl, ?_⟩
  exact view.selected_contracts parsed

/-- Replacing the generated active queue by the immutable seed's C4 endpoint
is recognized as post-C4 syntax, and the selected address is exactly the root
of the innermost pending frame. -/
theorem exists_postC4_handoff_of_generatedFifthSample
    (actions : Term) (bit : Bool) (suffix : List Bool)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (depth : Nat) :
    let bits := bit :: suffix
    let layer := generatedLayer actions bits continuation
    let layers := List.replicate depth layer ++ [layer]
    let base := generatedBaseView actions (word bits) continuation
    ∃ seed view,
      parseSeedFront? (word bits) = some seed ∧
        parse? actions
            (FuelView.term actions
              ⟨layers, .carrier (withQueue base seed.front.endpoint)⟩) =
          some view ∧
        view.stage = .postC4 seed
          ⟨List.replicate depth layer, layer⟩ ∧
        view.selectedAddress = rights depth ∧
        (FuelView.term actions
            ⟨layers, .carrier (withQueue base seed.front.endpoint)⟩).contractAt?
          view.selectedAddress = some (view.target actions) := by
  dsimp only
  obtain ⟨seed, seedParse, seedValid⟩ :=
    exists_parseSeedFront?_word_cons bit suffix
  let layer := generatedLayer actions (bit :: suffix) continuation
  let layers := List.replicate depth layer ++ [layer]
  let base := generatedBaseView actions (word (bit :: suffix)) continuation
  let postBase := withQueue base seed.front.endpoint
  have canonical : CanonicalFuelView actions
      ⟨layers, .carrier postBase⟩ := by
    refine ⟨?_, ?_⟩
    · exact canonicalPendingLayers_generated_append actions (bit :: suffix)
        continuation admissible depth
    · simpa [postBase, withQueue] using!
        generatedBaseView_canonical actions (word (bit :: suffix))
          continuation admissible
  have strict : parseCanonicalFuelActive? actions
      (FuelView.term actions ⟨layers, .carrier postBase⟩) =
        some ⟨layers, .carrier postBase⟩ :=
    parseCanonicalFuelActive?_complete rfl canonical
  let last : LastLayer := ⟨List.replicate depth layer, layer⟩
  let view : View := ⟨layers, postBase, .postC4 seed last⟩
  have parsed : parse? actions
      (FuelView.term actions ⟨layers, .carrier postBase⟩) = some view := by
    have completed := parse?_complete_postC4 actions
      (List.replicate depth layer) layer postBase seed canonical
      (by simpa [postBase, base, withQueue] using! seedParse)
      rfl rfl
    simpa [layers, view, last] using completed
  refine ⟨seed, view, seedParse, parsed, rfl, ?_, ?_⟩
  · simp [view, View.selectedAddress, last]
  · exact view.selected_contracts parsed

/-! ## Marked-history lift -/

/-- Whole-term result of peeling marked history and parsing the active carrier. -/
structure WholeView (program : CTS.Program) where
  activeTerm : Term
  context : Context
  history : List (CheckpointDecoder.LocalView program)
  active : View

namespace WholeView

def selectedAddress {program : CTS.Program} (view : WholeView program) : Address :=
  RootResetSelectorContract.contextAddress view.context ++
    view.active.selectedAddress

def target {program : CTS.Program}
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : WholeView program) : Term :=
  view.context.plug (view.active.target (compileActions program tree))

end WholeView

/-- Parse the carrier only after the canonical marked-history traversal. -/
def parseWhole?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (WholeView program) :=
  let decomposition := peelMarked program tree term
  match parse? (compileActions program tree) decomposition.active with
  | none => none
  | some active =>
      some ⟨decomposition.active, decomposition.context,
        decomposition.history, active⟩

/-- Declarative certificate for a whole marked-prefix placement. -/
structure WholeValid
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (view : WholeView program) : Prop where
  marked : MarkedPrefix program tree term view.activeTerm view.context view.history
  activeParse :
    parse? (compileActions program tree) view.activeTerm = some view.active
  active : Valid (compileActions program tree) view.activeTerm view.active

/-- Whole parsing reconstructs both the marked prefix and the active carrier. -/
theorem parseWhole?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : WholeView program}
    (accepted : parseWhole? program tree term = some view) :
    WholeValid program tree term view := by
  dsimp [parseWhole?] at accepted
  generalize activeEq : parse? (compileActions program tree)
    (peelMarked program tree term).active = activeResult at accepted
  cases activeResult with
  | none => simp at accepted
  | some active =>
      have viewEq := Option.some.inj accepted
      subst view
      exact ⟨peelMarked_sound program tree term, activeEq,
        parse?_sound activeEq⟩

/-- The active contraction lifts through every historical marked Local. -/
theorem WholeView.selected_contracts
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : WholeView program}
    (accepted : parseWhole? program tree term = some view) :
    term.contractAt? view.selectedAddress =
      some (view.target tree) := by
  have valid := parseWhole?_sound accepted
  have localContract := view.active.selected_contracts valid.activeParse
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    view.context view.active.selectedAddress localContract
  rw [← valid.marked.source_eq]
  simpa [WholeView.selectedAddress, WholeView.target] using lifted

/-- Every whole marked-prefix result is a genuine contextual S-step. -/
theorem WholeView.selected_step
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : WholeView program}
    (accepted : parseWhole? program tree term = some view) :
    Step term (view.target tree) :=
  Term.contractAt?_sound (view.selected_contracts accepted)

end PureSFormal.Research.RootResetPersistentFuelCarrier
