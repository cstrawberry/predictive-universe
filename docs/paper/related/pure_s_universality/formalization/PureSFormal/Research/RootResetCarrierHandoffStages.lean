import PureSFormal.Research.RootResetProgressCompleteness
import PureSFormal.Research.RootResetClockFuelCanonicalGrammar

/-!
# Root-reset carrier-handoff stages

This module describes the syntax-level handoff from a parsed fuel carrier to
the registered progress-spine encoding developed in the root-reset research
modules.  It provides a total parser for the first mutable progress cell.
The parser follows only the
registered predecessor edge: `R` below Armed cells and `LR` below Open or
Closed cells.  It therefore selects the innermost Armed root, or the Open
right child immediately outside an inert Closed prefix.  A wholly Closed
spine returns no address.

The second part lifts that local address through the fixed Base word path and
through every parsed pending-frame layer.  The resulting address is relative
to the current bare fuel-carrier term and carries an exact `contractAt?`
witness.

The persistent scheduler's present generated Base contains an ordinary
`CellSpine.word`, not this progress-spine encoding.  Consequently this module
is a sound and complete component for the proposed progress carrier; a
separate encoding/closure bridge is required before it can be used to prove
path identity with the current persistent trajectory.
-/

namespace PureSFormal.Research.RootResetCarrierHandoffStages

open PureSFormal.PureS
open RootResetProgressRoles
open RootResetProgressWalker
open RootResetClockFuelStages

namespace Accumulator

abbrev View := RootResetAccumulatorClassifier.View
abbrev Tracks := RootResetAccumulatorClassifier.Tracks
abbrev analyze? := RootResetAccumulatorClassifier.analyze?
abbrev prefixAddresses := RootResetAccumulatorClassifier.prefixAddresses

end Accumulator

/-! ## Executable inert-prefix recognition -/

/-- Every declaratively inert spine is accepted by the independent-hole
accumulator grammar with empty queue and no Open address. -/
theorem inert_tracks {term : Term} (history : Inert term) :
    Accumulator.Tracks term [] [] := by
  induction history with
  | endpoint => exact .endpoint
  | closed bit leftAudit rightAudit inner ih =>
      simpa [Accumulator.prefixAddresses] using!
        RootResetAccumulatorClassifier.Tracks.closed bit leftAudit rightAudit ih

/-- Empty queue and empty Open-address list force every registered cell to be
Closed. -/
theorem tracks_empty_inert
    {term : Term} {bits : List Bool} {addresses : List Address}
    (shape : Accumulator.Tracks term bits addresses)
    (bitsEmpty : bits = []) (addressesEmpty : addresses = []) :
    Inert term := by
  induction shape with
  | endpoint => exact .endpoint
  | armed bit inner ih =>
      simp at bitsEmpty
  | opened bit audit inner ih =>
      simp [Accumulator.prefixAddresses] at addressesEmpty
  | closed bit leftAudit rightAudit inner ih =>
      apply Inert.closed bit leftAudit rightAudit
      apply ih bitsEmpty
      simpa [Accumulator.prefixAddresses,
        RootResetAccumulatorClassifier.prefixAddresses] using addressesEmpty

/-- Total syntax predicate for a spine made only of Closed cells over `S`.
It reuses the independent-hole accumulator parser, which visits no audit
subtree. -/
def isInert (term : Term) : Bool :=
  match Accumulator.analyze? term with
  | some ⟨[], []⟩ => true
  | _ => false

theorem isInert_eq_true_iff (term : Term) :
    isInert term = true ↔ Inert term := by
  constructor
  · intro accepted
    unfold isInert at accepted
    generalize parsedEq : Accumulator.analyze? term = parsed at accepted
    cases parsed with
    | none => simp at accepted
    | some view =>
        rcases view with ⟨bits, addresses⟩
        cases bits with
        | cons bit rest => simp at accepted
        | nil =>
            cases addresses with
            | cons address rest => simp at accepted
            | nil =>
                exact tracks_empty_inert
                  (RootResetAccumulatorClassifier.analyze?_sound parsedEq)
                  rfl rfl
  · intro history
    have parsed := RootResetAccumulatorClassifier.analyze?_complete
      (inert_tracks history)
    simp [isInert, parsed]

/-! ## The first registered progress mutation -/

/-- The two syntax-visible local mutation roles. -/
inductive Stage where
  | armed
  | opened
  deriving BEq, DecidableEq, Inhabited, Repr

/-- Executable result: role, exact root-relative address, and exact target. -/
structure Selection where
  stage : Stage
  address : Address
  target : Term
  deriving BEq, DecidableEq, Repr

namespace Selection

def armedHere (bit : Bool) (predecessor : Term) : Selection :=
  ⟨.armed, [], openCell bit predecessor predecessor⟩

def openedHere (bit : Bool) (predecessor audit : Term) : Selection :=
  ⟨.opened, [.right], closedCell bit predecessor audit audit⟩

def underArmed (selection : Selection) (bit : Bool) : Selection :=
  ⟨selection.stage, .right :: selection.address,
    RootResetProgressRoles.Gadget.source bit selection.target⟩

def underOpened (selection : Selection) (bit : Bool) (audit : Term) :
    Selection :=
  ⟨selection.stage, .left :: .right :: selection.address,
    openCell bit selection.target audit⟩

def underClosed (selection : Selection) (bit : Bool)
    (leftAudit rightAudit : Term) : Selection :=
  ⟨selection.stage, .left :: .right :: selection.address,
    closedCell bit selection.target leftAudit rightAudit⟩

end Selection

/-- Declarative address-indexed form of `FirstMutation`. -/
inductive FirstMutationAt : Term → Term → Stage → Address → Prop where
  | armed {predecessor : Term} (bit : Bool) (history : Inert predecessor) :
      FirstMutationAt
        (RootResetProgressRoles.Gadget.source bit predecessor)
        (openCell bit predecessor predecessor) .armed []
  | opened {predecessor : Term} (bit : Bool) (audit : Term)
      (history : Inert predecessor) :
      FirstMutationAt (openCell bit predecessor audit)
        (closedCell bit predecessor audit audit) .opened [.right]
  | underArmed {before after : Term} {stage : Stage} {address : Address}
      (bit : Bool) (inner : FirstMutationAt before after stage address) :
      FirstMutationAt (RootResetProgressRoles.Gadget.source bit before)
        (RootResetProgressRoles.Gadget.source bit after) stage
        (.right :: address)
  | underOpened {before after : Term} {stage : Stage} {address : Address}
      (bit : Bool) (audit : Term)
      (inner : FirstMutationAt before after stage address) :
      FirstMutationAt (openCell bit before audit) (openCell bit after audit)
        stage (.left :: .right :: address)
  | underClosed {before after : Term} {stage : Stage} {address : Address}
      (bit : Bool) (leftAudit rightAudit : Term)
      (inner : FirstMutationAt before after stage address) :
      FirstMutationAt (closedCell bit before leftAudit rightAudit)
        (closedCell bit after leftAudit rightAudit) stage
        (.left :: .right :: address)

namespace FirstMutationAt

/-- Erasing the address and role recovers the existing first-mutation
relation. -/
theorem firstMutation
    {source target : Term} {stage : Stage} {address : Address}
    (selected : FirstMutationAt source target stage address) :
    FirstMutation source target := by
  induction selected with
  | armed bit history => exact .armed bit history
  | opened bit audit history => exact .opened bit audit history
  | underArmed bit inner ih =>
      exact .wrap ih (.armed bit _ _)
  | underOpened bit audit inner ih =>
      exact .wrap ih (.opened bit audit _ _)
  | underClosed bit leftAudit rightAudit inner ih =>
      exact .wrap ih (.closed bit leftAudit rightAudit _ _)

/-- The indexed address performs exactly the named contextual contraction. -/
theorem contracts
    {source target : Term} {stage : Stage} {address : Address}
    (selected : FirstMutationAt source target stage address) :
    source.contractAt? address = some target := by
  induction selected with
  | armed bit history =>
      exact RootResetProgressRoles.contractAt?_source_root bit _
  | opened bit audit history =>
      exact RootResetProgressRoles.contractAt?_openCell_right bit _ audit
  | underArmed bit inner ih =>
      exact RootResetAccumulatorClassifier.contractAt?_armed_predecessor
        bit _ ih
  | underOpened bit audit inner ih =>
      exact RootResetAccumulatorClassifier.contractAt?_open_predecessor
        bit audit _ ih
  | underClosed bit leftAudit rightAudit inner ih =>
      exact RootResetAccumulatorClassifier.contractAt?_closed_predecessor
        bit leftAudit rightAudit _ ih

theorem step
    {source target : Term} {stage : Stage} {address : Address}
    (selected : FirstMutationAt source target stage address) :
    Step source target :=
  Term.contractAt?_sound selected.contracts

end FirstMutationAt

/-- Internal structural pass.  Recursive calls enter only the registered
predecessor. -/
def scan? : Term → Option Selection
  | .s => none
  | .app (.app (.app .s .s) constructor) predecessor =>
      match RootResetDeletionGadget.parseLiveConstructor? constructor with
      | none => none
      | some bit =>
          match scan? predecessor with
          | some inner => some (inner.underArmed bit)
          | none =>
              if isInert predecessor = true then
                some (Selection.armedHere bit predecessor)
              else none
  | .app (.app .s predecessor)
      (.app (.app (.app .s .s) tag) audit) =>
      match RootResetDeletionGadget.parseValueTag? tag with
      | none => none
      | some bit =>
          match scan? predecessor with
          | some inner => some (inner.underOpened bit audit)
          | none =>
              if isInert predecessor = true then
                some (Selection.openedHere bit predecessor audit)
              else none
  | .app (.app .s predecessor)
      (.app (.app .s leftAudit) (.app tag rightAudit)) =>
      match RootResetDeletionGadget.parseValueTag? tag with
      | none => none
      | some bit =>
          (scan? predecessor).map
            (fun inner => inner.underClosed bit leftAudit rightAudit)
  | _ => none
termination_by structural term => term

@[simp]
theorem scan?_armed (bit : Bool) (predecessor : Term) :
    scan? (RootResetProgressRoles.Gadget.source bit predecessor) =
      match scan? predecessor with
      | some inner => some (inner.underArmed bit)
      | none =>
          if isInert predecessor = true then
            some (Selection.armedHere bit predecessor)
          else none := by
  cases bit <;>
    simp [scan?, RootResetProgressRoles.Gadget.source,
      RootResetDeletionGadget.source, RootResetDeletionGadget.progressLive,
      live, b] <;>
    cases scan? predecessor <;> rfl

@[simp]
theorem scan?_opened (bit : Bool) (predecessor audit : Term) :
    scan? (openCell bit predecessor audit) =
      match scan? predecessor with
      | some inner => some (inner.underOpened bit audit)
      | none =>
          if isInert predecessor = true then
            some (Selection.openedHere bit predecessor audit)
          else none := by
  cases bit <;> simp [scan?, openCell, live, b] <;>
    cases scan? predecessor <;> rfl

@[simp]
theorem scan?_closed (bit : Bool) (predecessor leftAudit rightAudit : Term) :
    scan? (closedCell bit predecessor leftAudit rightAudit) =
      (scan? predecessor).map
        (fun inner => inner.underClosed bit leftAudit rightAudit) := by
  cases bit <;>
    simp [scan?, closedCell, RootResetDeletionGadget.parseValueTag?] <;>
    cases scan? predecessor <;> rfl

/-- A wholly Closed spine has no registered progress mutation. -/
theorem scan?_none_of_inert {term : Term} (history : Inert term) :
    scan? term = none := by
  induction history with
  | endpoint => rfl
  | closed bit leftAudit rightAudit inner ih =>
      simp [ih]

/-- Soundness of the internal scan on the independently parsed spine. -/
theorem scan?_sound_of_tracks
    {term : Term} {bits : List Bool} {addresses : List Address}
    {selection : Selection}
    (shape : Accumulator.Tracks term bits addresses)
    (accepted : scan? term = some selection) :
    FirstMutationAt term selection.target selection.stage selection.address := by
  induction shape generalizing selection with
  | endpoint => simp [scan?] at accepted
  | @armed predecessor innerBits innerAddresses bit inner ih =>
      rw [scan?_armed] at accepted
      cases innerResult : scan? predecessor with
      | some found =>
          rw [innerResult] at accepted
          have selectionEq : found.underArmed bit = selection :=
            Option.some.inj accepted
          subst selection
          exact .underArmed bit (ih innerResult)
      | none =>
          rw [innerResult] at accepted
          by_cases inert : isInert predecessor = true
          · rw [if_pos inert] at accepted
            have selectionEq : Selection.armedHere bit predecessor = selection :=
              Option.some.inj accepted
            subst selection
            exact .armed bit ((isInert_eq_true_iff predecessor).mp inert)
          · rw [if_neg inert] at accepted
            contradiction
  | @opened predecessor innerBits innerAddresses bit audit inner ih =>
      rw [scan?_opened] at accepted
      cases innerResult : scan? predecessor with
      | some found =>
          rw [innerResult] at accepted
          have selectionEq : found.underOpened bit audit = selection :=
            Option.some.inj accepted
          subst selection
          exact .underOpened bit audit (ih innerResult)
      | none =>
          rw [innerResult] at accepted
          by_cases inert : isInert predecessor = true
          · rw [if_pos inert] at accepted
            have selectionEq :
                Selection.openedHere bit predecessor audit = selection :=
              Option.some.inj accepted
            subst selection
            exact .opened bit audit ((isInert_eq_true_iff predecessor).mp inert)
          · rw [if_neg inert] at accepted
            contradiction
  | @closed predecessor innerBits innerAddresses bit leftAudit rightAudit
      inner ih =>
      rw [scan?_closed] at accepted
      cases innerResult : scan? predecessor with
      | none => simp [innerResult] at accepted
      | some found =>
          rw [innerResult] at accepted
          have selectionEq :
              found.underClosed bit leftAudit rightAudit = selection :=
            Option.some.inj accepted
          subst selection
          exact .underClosed bit leftAudit rightAudit (ih innerResult)

/-- The public parser first verifies the entire independent-hole spine, then
returns its first registered mutation. -/
def firstMutation? (term : Term) : Option Selection :=
  match Accumulator.analyze? term with
  | none => none
  | some _ => scan? term

/-- Every successful parse identifies the exact existing first mutation and
its exact contraction address. -/
theorem firstMutation?_sound
    {term : Term} {selection : Selection}
    (accepted : firstMutation? term = some selection) :
    FirstMutationAt term selection.target selection.stage selection.address := by
  unfold firstMutation? at accepted
  generalize parsedEq : Accumulator.analyze? term = parsed at accepted
  cases parsed with
  | none => simp at accepted
  | some view =>
      exact scan?_sound_of_tracks
        (RootResetAccumulatorClassifier.analyze?_sound parsedEq) accepted

/-- A successful executable result is an existing `FirstMutation`. -/
theorem firstMutation?_firstMutation
    {term : Term} {selection : Selection}
    (accepted : firstMutation? term = some selection) :
    FirstMutation term selection.target :=
  (firstMutation?_sound accepted).firstMutation

/-- A successful executable result contracts at exactly its returned address. -/
theorem firstMutation?_contracts
    {term : Term} {selection : Selection}
    (accepted : firstMutation? term = some selection) :
    term.contractAt? selection.address = some selection.target :=
  (firstMutation?_sound accepted).contracts

theorem firstMutation?_step
    {term : Term} {selection : Selection}
    (accepted : firstMutation? term = some selection) :
    Step term selection.target :=
  (firstMutation?_sound accepted).step

/-- Sources of existing first mutations belong to the independent-hole
accumulator grammar. -/
theorem FirstMutation.source_tracks
    {source target : Term} (mutation : FirstMutation source target) :
    ∃ bits addresses, Accumulator.Tracks source bits addresses := by
  induction mutation with
  | armed bit history =>
      exact ⟨[bit], [], by
        simpa using! RootResetAccumulatorClassifier.Tracks.armed bit
          (inert_tracks history)⟩
  | opened bit audit history =>
      exact ⟨[], [[.right]], by
        simpa [Accumulator.prefixAddresses] using!
          RootResetAccumulatorClassifier.Tracks.opened bit audit
            (inert_tracks history)⟩
  | wrap inner outer ih =>
      obtain ⟨bits, addresses, shape⟩ := ih
      cases outer with
      | armed bit before after =>
          exact ⟨bits ++ [bit],
            Accumulator.prefixAddresses [.right] addresses,
            RootResetAccumulatorClassifier.Tracks.armed bit shape⟩
      | opened bit audit before after =>
          exact ⟨bits,
            [.right] :: Accumulator.prefixAddresses [.left, .right] addresses,
            RootResetAccumulatorClassifier.Tracks.opened bit audit shape⟩
      | closed bit leftAudit rightAudit before after =>
          exact ⟨bits,
            Accumulator.prefixAddresses [.left, .right] addresses,
            RootResetAccumulatorClassifier.Tracks.closed bit leftAudit
              rightAudit shape⟩

/-- The internal scan is complete for the existing first-mutation relation. -/
theorem FirstMutation.scan?_complete
    {source target : Term} (mutation : FirstMutation source target) :
    ∃ stage address,
      scan? source = some ⟨stage, address, target⟩ := by
  induction mutation with
  | armed bit history =>
      refine ⟨.armed, [], ?_⟩
      rw [scan?_armed, scan?_none_of_inert history,
        (isInert_eq_true_iff _).mpr history]
      rfl
  | opened bit audit history =>
      refine ⟨.opened, [.right], ?_⟩
      rw [scan?_opened, scan?_none_of_inert history,
        (isInert_eq_true_iff _).mpr history]
      rfl
  | wrap inner outer ih =>
      obtain ⟨stage, address, accepted⟩ := ih
      cases outer with
      | armed bit before after =>
          refine ⟨stage, .right :: address, ?_⟩
          rw [scan?_armed, accepted]
          rfl
      | opened bit audit before after =>
          refine ⟨stage, .left :: .right :: address, ?_⟩
          rw [scan?_opened, accepted]
          rfl
      | closed bit leftAudit rightAudit before after =>
          refine ⟨stage, .left :: .right :: address, ?_⟩
          rw [scan?_closed, accepted]
          rfl

/-- Completeness of the total public parser for every existing
`FirstMutation`. -/
theorem FirstMutation.firstMutation?_complete
    {source target : Term} (mutation : FirstMutation source target) :
    ∃ stage address,
      firstMutation? source = some ⟨stage, address, target⟩ := by
  obtain ⟨bits, addresses, shape⟩ := FirstMutation.source_tracks mutation
  obtain ⟨stage, address, scanned⟩ := FirstMutation.scan?_complete mutation
  have parsed := RootResetAccumulatorClassifier.analyze?_complete shape
  refine ⟨stage, address, ?_⟩
  simp [firstMutation?, parsed, scanned]

/-- All-Closed syntax is a completed carrier progress spine, not a local
mutation stage. -/
theorem firstMutation?_none_of_inert
    {term : Term} (history : Inert term) :
    firstMutation? term = none := by
  have parsed := RootResetAccumulatorClassifier.analyze?_complete
    (inert_tracks history)
  simp [firstMutation?, parsed, scan?_none_of_inert history]

/-! ## Exact Base and pending-frame lift -/

/-- The fixed context from an open-environment root to its seed payload. -/
def openEnvironmentPayloadContext (actions : Term) : Context :=
  .appRight .s
    (.appRight (.app .s (actCode actions)) (.appRight .s .hole))

@[simp]
theorem openEnvironmentPayloadContext_plug (actions payload : Term) :
    (openEnvironmentPayloadContext actions).plug payload =
      CheckpointDecoder.openEnvironment actions payload :=
  rfl

/-- The exact context from an open-Base root to its active queue field. -/
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

/-- The complete context from a pending-fuel root to its active queue. -/
def carrierQueueContext (actions : Term) (layers : List PendingLayer)
    (base : OpenBaseView) : Context :=
  (pendingContext layers).comp (openBaseQueueContext actions base)

@[simp]
theorem carrierQueueContext_plug
    (actions : Term) (layers : List PendingLayer) (base : OpenBaseView) :
    (carrierQueueContext actions layers base).plug base.queue =
      FuelView.term actions ⟨layers, .carrier base⟩ := by
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

/-- Bare-term carrier view with a verified local progress mutation. -/
structure View where
  layers : List PendingLayer
  base : OpenBaseView
  selection : Selection
  deriving BEq, DecidableEq, Repr

namespace View

def source (actions : Term) (view : View) : Term :=
  FuelView.term actions ⟨view.layers, .carrier view.base⟩

/-- Exact current-root address.  The prefix consists of the pending-frame
right spine and the fixed Base word path. -/
def selectedAddress (view : View) : Address :=
  (rights view.layers.length ++ BasePath.wordAddress) ++
    view.selection.address

def target (actions : Term) (view : View) : Term :=
  (carrierQueueContext actions view.layers view.base).plug
    view.selection.target

def preC4 (view : View) : Bool := view.selection.stage == .armed

def postC4 (view : View) : Bool := view.selection.stage == .opened

end View

/-- Parse only a fuel-carrier endpoint whose active queue has a registered
first progress mutation. -/
def parse? (actions term : Term) : Option View :=
  match parseFuelActive? actions term with
  | some ⟨layers, .carrier base⟩ =>
      (firstMutation? base.queue).map fun selection =>
        ⟨layers, base, selection⟩
  | _ => none

/-- Successful carrier parsing reconstructs the exact source and retains the
exact local parser result. -/
theorem parse?_sound
    {actions term : Term} {view : View}
    (accepted : parse? actions term = some view) :
    term = view.source actions ∧
      firstMutation? view.base.queue = some view.selection := by
  unfold parse? at accepted
  generalize fuelEq : parseFuelActive? actions term = fuelResult at accepted
  cases fuelResult with
  | none => simp at accepted
  | some fuel =>
      rcases fuel with ⟨layers, endpoint⟩
      cases endpoint with
      | row row => simp at accepted
      | carrier base =>
          change (firstMutation? base.queue).map
            (fun selection => ⟨layers, base, selection⟩) = some view at accepted
          generalize selectionEq : firstMutation? base.queue = result at accepted
          cases result with
          | none => simp at accepted
          | some selection =>
              simp only [Option.map, Option.some.injEq] at accepted
              subst view
              constructor
              · simpa [View.source] using parseFuelActive?_sound fuelEq
              · exact selectionEq

/-- The returned root-relative address performs exactly the returned
carrier-stage contraction. -/
theorem View.selected_contracts
    {actions term : Term} {view : View}
    (accepted : parse? actions term = some view) :
    term.contractAt? view.selectedAddress = some (view.target actions) := by
  have sound := parse?_sound accepted
  have localContract := firstMutation?_contracts sound.2
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    (carrierQueueContext actions view.layers view.base)
    view.selection.address localContract
  have sourceEq :
      term = (carrierQueueContext actions view.layers view.base).plug
        view.base.queue := by
    rw [sound.1, View.source, ← carrierQueueContext_plug]
  rw [sourceEq]
  simpa [View.selectedAddress, View.target, carrierQueueContext_address]
    using lifted

theorem View.selected_step
    {actions term : Term} {view : View}
    (accepted : parse? actions term = some view) :
    Step term (view.target actions) :=
  Term.contractAt?_sound (view.selected_contracts accepted)

/-- A parsed Armed role is the pre-opening carrier stage. -/
theorem View.preC4_eq_true_iff (view : View) :
    view.preC4 = true ↔ view.selection.stage = .armed := by
  cases stageEq : view.selection.stage <;>
    simp [View.preC4, stageEq] <;> decide

/-- A parsed Open role is the post-opening, pre-close carrier stage. -/
theorem View.postC4_eq_true_iff (view : View) :
    view.postC4 = true ↔ view.selection.stage = .opened := by
  cases stageEq : view.selection.stage <;>
    simp [View.postC4, stageEq] <;> decide

/-- The two carrier progress stages are disjoint and exhaustive. -/
theorem View.preC4_xor_postC4 (view : View) :
    (view.preC4 = true ∧ view.postC4 = false) ∨
      (view.preC4 = false ∧ view.postC4 = true) := by
  cases stageEq : view.selection.stage <;>
    simp [View.preC4, View.postC4, stageEq] <;> decide

/-- Completeness below any already parsed fuel-carrier boundary. -/
theorem parse?_complete
    (actions : Term) (layers : List PendingLayer) (base : OpenBaseView)
    {target : Term} (fuelParsed :
      parseFuelActive? actions (FuelView.term actions ⟨layers, .carrier base⟩) =
        some ⟨layers, .carrier base⟩)
    (mutation : FirstMutation base.queue target) :
    ∃ stage address,
      parse? actions (FuelView.term actions ⟨layers, .carrier base⟩) =
        some ⟨layers, base, ⟨stage, address, target⟩⟩ := by
  obtain ⟨stage, address, selected⟩ := FirstMutation.firstMutation?_complete mutation
  refine ⟨stage, address, ?_⟩
  simp [parse?, fuelParsed, selected]

/-- A wholly Closed queue makes the carrier parser hand off without choosing
an outer live or audit-field redex. -/
theorem parse?_none_of_inert_queue
    (actions : Term) (layers : List PendingLayer) (base : OpenBaseView)
    (fuelParsed :
      parseFuelActive? actions (FuelView.term actions ⟨layers, .carrier base⟩) =
        some ⟨layers, .carrier base⟩)
    (history : Inert base.queue) :
    parse? actions (FuelView.term actions ⟨layers, .carrier base⟩) = none := by
  simp [parse?, fuelParsed, firstMutation?_none_of_inert history]

end PureSFormal.Research.RootResetCarrierHandoffStages
