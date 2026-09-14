import PureSFormal.Research.RootResetPersistentRouteAFuel
import PureSFormal.PureS.SchedulerRecurrence
import PureSFormal.PureS.SchedulerCompletedContext

/-!
# Ordinary fuel selection at the persistent scheduler handoff

This module relates the executable bare-term fuel parser to the existing
persistent scheduler's fifth zero-fuel sample, selected C4 endpoint, and first
frame-prefix contraction.  It is an isolated local bridge: no public theorem,
whole-run closure, or path-identity claim is introduced here.
-/

namespace PureSFormal.Research.RootResetPersistentRouteAFuelSchedulerBridge

open PureSFormal.PureS
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetPersistentFuelCarrier

/-! ## Pending-stack normalization -/

/-- Repeated generated pending layers are the primitive nested-frame fold. -/
theorem pendingContext_replicate_plug
    (actions : Term) (bits : List Bool) (continuation body : Term) :
    ∀ count,
      (pendingContext
          (List.replicate count (generatedLayer actions bits continuation))).plug body =
        Nat.rec body
          (fun _ inner => frame (environmentCode actions bits) continuation inner)
          count
  | 0 => rfl
  | count + 1 => by
      simp only [List.replicate_succ, pendingContext_cons, Context.plug]
      rw [pendingContext_replicate_plug actions bits continuation body count]
      rfl

/-- Appending the repeated element once is successor replication. -/
theorem replicate_append_singleton {Alpha : Type} (value : Alpha) :
    ∀ count, List.replicate count value ++ [value] =
      List.replicate (count + 1) value
  | 0 => rfl
  | count + 1 => by
      change value :: (List.replicate count value ++ [value]) =
        value :: List.replicate (count + 1) value
      exact congrArg (List.cons value)
        (replicate_append_singleton value count)

/-- The generated positive-depth fifth sample is exactly `nestedFrames`. -/
theorem generatedFifthSample_eq_nestedFrames
    (actions : Term) (bits : List Bool) (continuation : Term) (fuel : Nat) :
    let layer := generatedLayer actions bits continuation
    let layers := List.replicate fuel layer ++ [layer]
    let base := generatedBaseView actions (word bits) continuation
    FuelView.term actions ⟨layers, .carrier base⟩ =
      nestedFrames (environmentCode actions bits) continuation (fuel + 1) := by
  dsimp only
  rw [show List.replicate fuel
      (generatedLayer actions bits continuation) ++
        [generatedLayer actions bits continuation] =
      List.replicate (fuel + 1)
        (generatedLayer actions bits continuation) by
    induction fuel with
    | zero => rfl
    | succ fuel ih => simp only [List.replicate_succ, List.cons_append, ih]]
  simp only [FuelView.term, FuelEndpoint.term]
  rw [pendingContext_replicate_plug]
  rw [generatedBaseView_term_eq]
  rw [show zeroEnvironment actions (word bits) =
      environmentCode actions bits by
    simpa [zeroEnvironment] using
      (CheckpointDecoder.openEnvironment_word actions bits)]
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      simp only [Nat.rec, nestedFrames]
      exact congrArg
        (fun inner => frame (environmentCode actions bits) continuation inner) ih

/-- Erasure of the actual fifth scheduler sample is its literal nested frame term. -/
theorem fuelZeroFifthMutationConfiguration_erase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (bits : List Bool) (continuation : Term) (fuel : Nat) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    (SchedulerInvariant.fuelZeroFifthMutationConfiguration program dispatcher
        registers environment continuation parents).cursor.erase =
      nestedFrames environment continuation (fuel + 1) := by
  dsimp only
  simpa [SchedulerInvariant.fuelZeroFifthMutationConfiguration] using
    (PrimitiveFuel.erase_run_expand (fuel + 1)
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation)

/-- The actual fifth sample and the generated parser fixture are the same bare term. -/
theorem fuelZeroFifthMutationConfiguration_eq_generated
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (bit : Bool) (suffix : List Bool) (continuation : Term) (fuel : Nat) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    let layer := generatedLayer actions bits continuation
    let layers := List.replicate fuel layer ++ [layer]
    let base := generatedBaseView actions (word bits) continuation
    (SchedulerInvariant.fuelZeroFifthMutationConfiguration program dispatcher
        registers environment continuation parents).cursor.erase =
      FuelView.term actions ⟨layers, .carrier base⟩ := by
  dsimp only
  rw [fuelZeroFifthMutationConfiguration_erase]
  exact (generatedFifthSample_eq_nestedFrames
    (compileActions program dispatcher.tree) (bit :: suffix) continuation fuel).symm

/-! ## Exact parser agreement at the fifth sample -/

/-- A seed-front certificate over a literal nonempty word recovers its literal
head, suffix, and canonical front without consulting scheduler state. -/
theorem seedFrontValid_of_word_cons
    {bit : Bool} {suffix : List Bool} {seed : SeedFront}
    (valid : seed.Valid (word (bit :: suffix))) :
    seed.bits = bit :: suffix ∧
      seed.front.bit = bit ∧
      CellDeletion.IsCanonicalFront
        (word (bit :: suffix)) suffix seed.front := by
  have decodedAsSeedBits : CellSpine.Decodes
      (word (bit :: suffix)) seed.bits := by
    rw [valid.literal]
    exact CellSpine.decodes_word seed.bits
  have bitsEq : seed.bits = bit :: suffix :=
    decodedAsSeedBits.deterministic
      (CellSpine.decodes_word (bit :: suffix))
  obtain ⟨remaining, frontBits, canonical⟩ := valid.suffixCertificate
  have consEq : seed.front.bit :: remaining = bit :: suffix :=
    frontBits.symm.trans bitsEq
  injection consEq with frontBitEq remainingEq
  exact ⟨bitsEq, frontBitEq, remainingEq ▸ canonical⟩

/-- The seed parser's canonical front induces the same proof-relevant Base
selection used by the persistent scheduler invariant. -/
theorem selectedFront_of_seed
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (continuation : Term)
    (seed : SeedFront) (valid : seed.Valid (word (bit :: suffix))) :
    CanonicalTraversal.SelectedFront program dispatcher.tree (bit :: suffix)
      continuation
      (baseCarrier
        (environmentCode (compileActions program dispatcher.tree)
          (bit :: suffix)) continuation)
      bit suffix
      ((MutableBase.queueContext
          (compileActions program dispatcher.tree) (bit :: suffix) continuation
          (baseBeta
            (environmentCode (compileActions program dispatcher.tree)
              (bit :: suffix)) continuation)).comp seed.front.context) := by
  obtain ⟨_bitsEq, frontBitEq, canonical⟩ :=
    seedFrontValid_of_word_cons valid
  obtain ⟨innerContext, innerShape, innerPlug⟩ :=
    CanonicalTraversal.QueueContext.ofDecodes canonical.predecessorEmpty
  let queueContext := seed.front.context.comp
    (.appRight (PureSFormal.PureS.live bit) innerContext)
  have selection : CanonicalTraversal.QueueSelection queueContext bit suffix
      seed.front.context seed.front.address := by
    apply CanonicalTraversal.QueueSelection.ofOuter innerShape
    simpa [frontBitEq] using canonical.outer
  have queuePlug : queueContext.plug omega = word (bit :: suffix) := by
    simp only [queueContext, Context.plug_comp, Context.plug, innerPlug]
    simpa [frontBitEq] using canonical.source_eq
  have selected := CanonicalTraversal.SelectedFront.base
    (program := program) (tree := dispatcher.tree)
    (bits := bit :: suffix) (continuation := continuation)
    selection.sourceShape selection
  simpa [queuePlug] using selected

/-- The C4 target named by the persistent first-response trace is exactly the
generated Base with only its active queue replaced by the seed parser's
canonical endpoint. -/
theorem deletedCarrier_eq_generatedPostBase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks)
    (seed : SeedFront)
    (valid : seed.Valid (word (bit :: suffix))) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    SchedulerCycle.deletedCarrier bit outerContext innerContext =
      (withQueue (generatedBaseView actions (word bits) continuation)
        seed.front.endpoint).term actions := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  let bits := bit :: suffix
  let environment := environmentCode actions bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  obtain ⟨_bitsEq, frontBitEq, canonical⟩ :=
    seedFrontValid_of_word_cons valid
  have generatedSelected := selectedFront_of_seed program dispatcher bit suffix
    continuation seed valid
  have outerEq :=
    (CanonicalTraversal.SelectedFront.deterministic
      (Dovetail.clockExit_admissible (fuel + 1) fuel environment)
      generatedSelected trace.selected).2.2
  have queueCertificate : CanonicalTraversal.FrontCertificate
      (word bits) seed.front.endpoint bit suffix seed.front.predecessor
      seed.front.context := by
    refine ⟨CanonicalTraversal.AscentContext.ofCellOuter
        (address := seed.front.address) canonical.outer, ?_, ?_⟩
    · simpa [bits, frontBitEq] using canonical.source_eq.symm
    · simp [CellDeletion.Front.endpoint, frontBitEq]
  have baseCertificate := queueCertificate.wrapBase actions bits continuation
  have baseCertificate' : CanonicalTraversal.FrontCertificate
      (baseCarrier environment continuation)
      ((MutableBase.queueContext actions bits continuation
        (baseBeta environment continuation)).plug seed.front.endpoint)
      bit suffix seed.front.predecessor
      ((MutableBase.queueContext actions bits continuation
        (baseBeta environment continuation)).comp seed.front.context) := by
    simpa [actions, bits, environment, MutableBase.mutableBase_word] using!
      baseCertificate
  have predecessorEq :
      SchedulerAscent.frontPredecessor innerContext = seed.front.predecessor := by
    have actualCertificate := baseCertificate'
    rw [outerEq] at actualCertificate
    exact SchedulerAscent.FrontPath.predecessor_eq_certificate
      trace.sourceDescent trace.path
      (by simpa [actions, bits, environment, continuation] using
        actualCertificate)
  rw [SchedulerCycle.deletedCarrier, ← outerEq, predecessorEq]
  simp only [Context.plug_comp]
  have endpointEq : seed.front.context.plug
      (Carrier.tombstone bit seed.front.predecessor seed.front.predecessor) =
        seed.front.endpoint := by
    rw [← frontBitEq]
    rfl
  rw [endpointEq]
  simp [MutableBase.queueContext, withQueue, generatedBaseView,
    OpenBaseView.term, zeroEnvironment, continuation,
    CheckpointDecoder.openEnvironment, PendingFrame.envelope,
    PendingFrame.envelopeSlot, actCode,
    CheckpointDecoder.openEnvironment_word, actions, bits, environment]

/-- Erasure of the actual post-C4 scheduler configuration is the generated
post-C4 carrier at every pending-frame depth. -/
theorem firstC4Configuration_erase_eq_generatedPost
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks)
    (seed : SeedFront)
    (valid : seed.Valid (word (bit :: suffix))) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let layer := generatedLayer actions bits continuation
    let layers := List.replicate fuel layer ++ [layer]
    let base := generatedBaseView actions (word bits) continuation
    (SchedulerCycle.firstC4Configuration program dispatcher bit suffix fuel
      outerContext innerContext).cursor.erase =
      FuelView.term actions
        ⟨layers, .carrier (withQueue base seed.front.endpoint)⟩ := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  let bits := bit :: suffix
  let environment := environmentCode actions bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let layer := generatedLayer actions bits continuation
  let layers := List.replicate fuel layer ++ [layer]
  let base := generatedBaseView actions (word bits) continuation
  let postBase := withQueue base seed.front.endpoint
  have carrierEq := deletedCarrier_eq_generatedPostBase program dispatcher bit
    suffix fuel trace seed valid
  have pendingEq := pendingContext_replicate_plug actions bits continuation
    (postBase.term actions) (fuel + 1)
  have layersEq : layers = List.replicate (fuel + 1) layer := by
    exact replicate_append_singleton layer fuel
  change Cursor.rebuild
      (ContextCursor.frames outerContext
        (Carrier.tombstone bit
          (SchedulerAscent.frontPredecessor innerContext)
          (SchedulerAscent.frontPredecessor innerContext))
        (PrimitiveFuel.pendingParents environment continuation (fuel + 1) []))
      (Carrier.tombstone bit
        (SchedulerAscent.frontPredecessor innerContext)
        (SchedulerAscent.frontPredecessor innerContext)) = _
  rw [SchedulerInvariant.rebuild_contextFrames]
  change Cursor.rebuild
      (PrimitiveFuel.pendingParents environment continuation (fuel + 1) [])
      (SchedulerCycle.deletedCarrier bit outerContext innerContext) = _
  rw [PrimitiveFuel.rebuild_pendingParents]
  rw [carrierEq]
  have pendingEq' := pendingEq.symm
  rw [← layersEq] at pendingEq'
  simpa [FuelView.term, FuelEndpoint.term, layers, layer, postBase, base,
    actions, bits, environment, continuation] using! pendingEq'

/-! ## The post-C4 frame handoff -/

/-- A mutation-free controller segment preserves the erased pure-S term. -/
theorem zeroMutationRun_erase_eq
    {Control : Type}
    {machine : FiniteController.Machine Control}
    {ticks : Nat}
    {before after : FiniteController.Configuration Control}
    (segment : SchedulerInvariant.ZeroMutationRun machine ticks before after) :
    before.cursor.erase = after.cursor.erase := by
  have projected := FiniteController.run_projects_stepsN machine ticks before
  rw [segment.run_eq, segment.count_eq] at projected
  exact StepsN.eq_of_zero projected

/-- The zero-mutation C4-to-FRAME controller run changes only the retained
cursor and finite control; its two endpoints have the same bare term. -/
theorem firstC4Configuration_erase_eq_firstFrameConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks) :
    (SchedulerCycle.firstC4Configuration program dispatcher bit suffix fuel
        outerContext innerContext).cursor.erase =
      (SchedulerCycle.firstFrameConfiguration program dispatcher bit suffix
        fuel outerContext innerContext).cursor.erase := by
  obtain ⟨ticks, segment⟩ := SchedulerCycle.firstC4_toFrame_zeroRun
    program dispatcher bit suffix fuel trace
  exact zeroMutationRun_erase_eq segment

/-- Pending-frame zipper parents put their focus after exactly one right edge
per pending frame, below any already present outer zipper. -/
theorem contextOfParents_pendingParents_address
    (environment continuation : Term) : ∀ count parents,
    RootResetSelectorContract.contextAddress
        (SchedulerInvariant.contextOfParents
          (PrimitiveFuel.pendingParents environment continuation count parents)) =
      RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents) ++ rights count
  | 0, parents => by
      simp [PrimitiveFuel.pendingParents, rights]
  | count + 1, parents => by
      rw [PrimitiveFuel.pendingParents]
      rw [contextOfParents_pendingParents_address environment continuation count
        (.right (.app environment continuation) :: parents)]
      simp [SchedulerInvariant.contextOfParents,
        RootResetSelectorContract.contextAddress_comp,
        RootResetSelectorContract.contextAddress, rights, List.append_assoc]

/-- With no completed outer zipper, the persistent FRAME focus has precisely
the syntax-derived `rights fuel` root address. -/
theorem firstFrameConfiguration_cursorAddress
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    (outerContext innerContext : Context) :
    RootResetSelectorContract.contextAddress
        (SchedulerInvariant.contextOfParents
          (SchedulerCycle.firstFrameConfiguration program dispatcher bit suffix
            fuel outerContext innerContext).cursor.parents) =
      rights fuel := by
  let actions := compileActions program dispatcher.tree
  let bits := bit :: suffix
  let environment := environmentCode actions bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  change RootResetSelectorContract.contextAddress
      (SchedulerInvariant.contextOfParents
        (PrimitiveFuel.pendingParents environment continuation fuel [])) = _
  have address := contextOfParents_pendingParents_address
    environment continuation fuel []
  simpa [SchedulerInvariant.contextOfParents,
    RootResetSelectorContract.contextAddress] using address

/-- The syntax-derived post-C4 address contracts the innermost pending frame
to the exact first FRAME-prefix response root, at every pending depth. -/
theorem generatedPost_contracts_firstFrameRoot
    (actions : Term) (bits : List Bool) (continuation : Term)
    (base : OpenBaseView) (fuel : Nat) :
    let layer := generatedLayer actions bits continuation
    let layers := List.replicate fuel layer ++ [layer]
    (FuelView.term actions ⟨layers, .carrier base⟩).contractAt? (rights fuel) =
      some
        (Cursor.rebuild
          (PrimitiveFuel.pendingParents
            (environmentCode actions bits) continuation fuel [])
          (SchedulerResponseInvariant.frameFirstRoot
            actions bits continuation (base.term actions))) := by
  dsimp only
  let layer := generatedLayer actions bits continuation
  let outerLayers := List.replicate fuel layer
  let carrier := base.term actions
  let firstRoot := SchedulerResponseInvariant.frameFirstRoot
    actions bits continuation carrier
  have rootContract := frameFirst_contractAt? actions bits continuation carrier
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    (pendingContext outerLayers) [] rootContract
  have sourceEq :
      FuelView.term actions ⟨outerLayers ++ [layer], .carrier base⟩ =
        (pendingContext outerLayers).plug
          (frame (environmentCode actions bits) continuation carrier) := by
    change (pendingContext (outerLayers ++ [layer])).plug carrier = _
    rw [pendingContext_append_singleton_plug]
    rfl
  have targetEq : (pendingContext outerLayers).plug firstRoot =
      Cursor.rebuild
        (PrimitiveFuel.pendingParents
          (environmentCode actions bits) continuation fuel []) firstRoot := by
    rw [pendingContext_replicate_plug]
    exact (PrimitiveFuel.rebuild_pendingParents fuel
      (environmentCode actions bits) continuation firstRoot []).symm
  rw [sourceEq]
  change
    ((pendingContext outerLayers).plug
        (frame (environmentCode actions bits) continuation carrier)).contractAt?
      (RootResetSelectorContract.contextAddress
        (pendingContext outerLayers) ++ []) =
      some ((pendingContext outerLayers).plug firstRoot) at lifted
  rw [targetEq] at lifted
  simpa [outerLayers, firstRoot,
    RootResetSelectorContract.contextAddress] using lifted

/-- At the actual persistent scheduler's post-C4 sample, the executable
bare-term parser stops at the innermost pending frame.  Its address is exactly
the retained FRAME cursor's root-relative address, and its contractum is the
first response-root mutation.  The statement is uniform in pending depth. -/
theorem firstC4Configuration_parse_postC4_selects_firstFrameRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let layer := generatedLayer actions bits continuation
    let base := generatedBaseView actions (word bits) continuation
    let firstC4 := SchedulerCycle.firstC4Configuration program dispatcher bit
      suffix fuel outerContext innerContext
    let firstFrame := SchedulerCycle.firstFrameConfiguration program dispatcher
      bit suffix fuel outerContext innerContext
    ∃ seed view,
      parseSeedFront? (word bits) = some seed ∧
        parse? actions firstC4.cursor.erase = some view ∧
        view.stage = .postC4 seed
          ⟨List.replicate fuel layer, layer⟩ ∧
        view.selectedAddress = rights fuel ∧
        view.selectedAddress =
          RootResetSelectorContract.contextAddress
            (SchedulerInvariant.contextOfParents firstFrame.cursor.parents) ∧
        firstC4.cursor.erase = firstFrame.cursor.erase ∧
        firstC4.cursor.erase.contractAt? view.selectedAddress =
          some
            (Cursor.rebuild
              (PrimitiveFuel.pendingParents environment continuation fuel [])
              (SchedulerResponseInvariant.frameFirstRoot actions bits
                continuation
                (SchedulerCycle.deletedCarrier bit outerContext
                  innerContext))) := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  let bits := bit :: suffix
  let environment := environmentCode actions bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let layer := generatedLayer actions bits continuation
  let layers := List.replicate fuel layer ++ [layer]
  let base := generatedBaseView actions (word bits) continuation
  obtain ⟨seed, view, seedParse, parsedGenerated, stageEq, addressEq,
      _generatedContract⟩ :=
    exists_postC4_handoff_of_generatedFifthSample actions bit suffix
      continuation (Dovetail.clockExit_admissible (fuel + 1) fuel environment)
      fuel
  have seedValid := parseSeedFront?_sound seedParse
  have c4Eq := firstC4Configuration_erase_eq_generatedPost program dispatcher
    bit suffix fuel trace seed seedValid
  have parsedActual : parse? actions
      (SchedulerCycle.firstC4Configuration program dispatcher bit suffix fuel
        outerContext innerContext).cursor.erase = some view := by
    rw [c4Eq]
    exact parsedGenerated
  have persistentAddress := firstFrameConfiguration_cursorAddress program
    dispatcher bit suffix fuel outerContext innerContext
  have erasedEq := firstC4Configuration_erase_eq_firstFrameConfiguration
    program dispatcher bit suffix fuel trace
  have carrierEq := deletedCarrier_eq_generatedPostBase program dispatcher bit
    suffix fuel trace seed seedValid
  have direct := generatedPost_contracts_firstFrameRoot actions bits
    continuation (withQueue base seed.front.endpoint) fuel
  have actualContract :
      (SchedulerCycle.firstC4Configuration program dispatcher bit suffix fuel
          outerContext innerContext).cursor.erase.contractAt?
          view.selectedAddress =
        some
          (Cursor.rebuild
            (PrimitiveFuel.pendingParents environment continuation fuel [])
            (SchedulerResponseInvariant.frameFirstRoot actions bits continuation
              (SchedulerCycle.deletedCarrier bit outerContext innerContext))) := by
    rw [c4Eq, addressEq]
    rw [← carrierEq] at direct
    exact direct
  refine ⟨seed, view, seedParse, parsedActual, stageEq, addressEq, ?_, erasedEq,
    actualContract⟩
  exact addressEq.trans persistentAddress.symm

/-- The actual fifth zero-fuel sample is accepted as the pre-C4 carrier, with
the exact root-relative C4 address and contractum returned by the parser. -/
theorem fuelZeroFifthMutationConfiguration_parse_preC4
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (bit : Bool) (suffix : List Bool) (continuation : Term) (fuel : Nat)
    (admissible : Carrier.Admissible continuation) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    let fifth := SchedulerInvariant.fuelZeroFifthMutationConfiguration
      program dispatcher registers environment continuation parents
    ∃ view seed,
      parse? actions fifth.cursor.erase = some view ∧
        view.stage = .preC4 seed ∧
        fifth.cursor.erase.contractAt? view.selectedAddress =
          some (view.target actions) := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  obtain ⟨view, parsed, seed, stageEq, _addressEq, contracted⟩ :=
    exists_preC4_of_generatedFifthSample actions bit suffix continuation
      admissible fuel
  refine ⟨view, seed, ?_, stageEq, ?_⟩
  · rw [fuelZeroFifthMutationConfiguration_eq_generated]
    exact parsed
  · rw [fuelZeroFifthMutationConfiguration_eq_generated]
    exact contracted

/-- On a positive-stage trace, the term-only pre-C4 parser returns exactly
the persistent scheduler's next sampled term, not merely an arbitrary legal
contractum. -/
theorem positiveStageFifth_selects_exact_firstC4
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    (clockRegisters : SchedulerControl.Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : SchedulerInvariant.RegistersCoherent clockRegisters
      phase scanned emptyMode)
    (sampleIndex fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {descentTicks ascentTicks : Nat}
    (trace : SchedulerCycle.PositiveStageFirstResponseTrace program dispatcher
      bit suffix clockRegisters phase scanned emptyMode clockCoherent sampleIndex
      fuel outerContext fullContext innerContext targetContext descentTicks
      ascentTicks) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    let fifth := SchedulerInvariant.fuelZeroFifthMutationConfiguration
      program dispatcher (SchedulerControl.Registers.newJob program)
      environment continuation parents
    let firstC4 := SchedulerCycle.firstC4Configuration program dispatcher bit
      suffix fuel outerContext innerContext
    ∃ bound view,
      FiniteController.seekMutation
          (SchedulerControl.machine program dispatcher) bound fifth =
        some firstC4 ∧
      parse? actions fifth.cursor.erase = some view ∧
      fifth.cursor.erase.contractAt? view.selectedAddress =
        some firstC4.cursor.erase := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  let bits := bit :: suffix
  let environment := environmentCode actions bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let layer := generatedLayer actions bits continuation
  let layers := List.replicate fuel layer ++ [layer]
  let base := generatedBaseView actions (word bits) continuation
  obtain ⟨seed, seedParse, seedValid⟩ :=
    exists_parseSeedFront?_word_cons bit suffix
  let view : View := ⟨layers, base, .preC4 seed⟩
  have canonical : CanonicalFuelView actions
      ⟨layers, .carrier base⟩ := by
    refine ⟨?_, generatedBaseView_canonical actions (word bits) continuation
      (Dovetail.clockExit_admissible (fuel + 1) fuel environment)⟩
    exact canonicalPendingLayers_generated_append actions bits continuation
      (Dovetail.clockExit_admissible (fuel + 1) fuel environment) fuel
  have parsedGenerated : parse? actions
      (FuelView.term actions ⟨layers, .carrier base⟩) = some view := by
    exact parse?_complete_preC4 actions layers base seed canonical seedParse rfl
  have parsedActual : parse? actions
      (SchedulerInvariant.fuelZeroFifthMutationConfiguration program dispatcher
        (SchedulerControl.Registers.newJob program) environment continuation
        (PrimitiveFuel.pendingParents environment continuation (fuel + 1) [])).cursor.erase =
        some view := by
    rw [fuelZeroFifthMutationConfiguration_eq_generated]
    exact parsedGenerated
  have localContract := view.selected_contracts parsedGenerated
  have viewTargetEq : view.target actions =
      FuelView.term actions
        ⟨layers, .carrier (withQueue base seed.front.endpoint)⟩ := by
    simp [view, View.target, carrierQueueContext_plug_withQueue]
  have c4Eq := firstC4Configuration_erase_eq_generatedPost program dispatcher
    bit suffix fuel trace.response seed seedValid
  obtain ⟨bound, found⟩ := SchedulerCycle.positiveStageFinal_seekFirstC4
    program dispatcher bit suffix clockRegisters phase scanned emptyMode
    clockCoherent sampleIndex fuel trace
  refine ⟨bound, view, found, parsedActual, ?_⟩
  rw [fuelZeroFifthMutationConfiguration_eq_generated]
  rw [viewTargetEq] at localContract
  rw [c4Eq]
  exact localContract

/-- One positive-stage trace is covered continuously across the complete fuel
handoff: the pre-C4 bare selection is the scheduler's C4 sample, administrative
motion preserves that sample, and the post-C4 bare selection is exactly the
persistent FRAME cursor's first response contraction. -/
theorem positiveStageFifth_through_firstFrameRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    (clockRegisters : SchedulerControl.Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : SchedulerInvariant.RegistersCoherent clockRegisters
      phase scanned emptyMode)
    (sampleIndex fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {descentTicks ascentTicks : Nat}
    (trace : SchedulerCycle.PositiveStageFirstResponseTrace program dispatcher
      bit suffix clockRegisters phase scanned emptyMode clockCoherent sampleIndex
      fuel outerContext fullContext innerContext targetContext descentTicks
      ascentTicks) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    let fifth := SchedulerInvariant.fuelZeroFifthMutationConfiguration
      program dispatcher (SchedulerControl.Registers.newJob program)
      environment continuation parents
    let firstC4 := SchedulerCycle.firstC4Configuration program dispatcher bit
      suffix fuel outerContext innerContext
    let firstFrame := SchedulerCycle.firstFrameConfiguration program dispatcher
      bit suffix fuel outerContext innerContext
    ∃ bound preC4 postC4 seed,
      FiniteController.seekMutation
          (SchedulerControl.machine program dispatcher) bound fifth =
        some firstC4 ∧
      parse? actions fifth.cursor.erase = some preC4 ∧
      fifth.cursor.erase.contractAt? preC4.selectedAddress =
        some firstC4.cursor.erase ∧
      parse? actions firstC4.cursor.erase = some postC4 ∧
      postC4.stage = .postC4 seed
        ⟨List.replicate fuel (generatedLayer actions bits continuation),
          generatedLayer actions bits continuation⟩ ∧
      postC4.selectedAddress =
        RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents firstFrame.cursor.parents) ∧
      firstC4.cursor.erase = firstFrame.cursor.erase ∧
      firstC4.cursor.erase.contractAt? postC4.selectedAddress =
        some
          (Cursor.rebuild
            (PrimitiveFuel.pendingParents environment continuation fuel [])
            (SchedulerResponseInvariant.frameFirstRoot actions bits continuation
              (SchedulerCycle.deletedCarrier bit outerContext innerContext))) := by
  dsimp only
  obtain ⟨bound, preC4, found, preParsed, preContract⟩ :=
    positiveStageFifth_selects_exact_firstC4 program dispatcher bit suffix
      clockRegisters phase scanned emptyMode clockCoherent sampleIndex fuel trace
  obtain ⟨seed, postC4, _seedParsed, postParsed, stageEq, _rightsEq,
      persistentAddress, erasedEq, postContract⟩ :=
    firstC4Configuration_parse_postC4_selects_firstFrameRoot program dispatcher
      bit suffix fuel trace.response
  exact ⟨bound, preC4, postC4, seed, found, preParsed, preContract,
    postParsed, stageEq, persistentAddress, erasedEq, postContract⟩

/-! ## Historical and completed-parent lifts -/

/-- A locally accepted fuel handoff beneath a declared marked history is
accepted by the executable whole-term parser with exactly that decomposition. -/
theorem parseWhole?_complete_of_markedPrefix
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term activeTerm : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    {activeView : View}
    (marked : RootResetReachableStageGrammar.MarkedPrefix program tree term
      activeTerm context history)
    (activeParsed : parse? (compileActions program tree) activeTerm =
      some activeView) :
    parseWhole? program tree term =
      some
        { activeTerm := activeTerm
          context := context
          history := history
          active := activeView } := by
  have components :=
    RootResetReachableStageGrammar.markedPrefix_eq_peelMarked marked
  unfold parseWhole?
  dsimp only
  rw [← components.1, activeParsed, ← components.2.1, ← components.2.2]

/-- The exact post-C4/FRAME agreement lifts through an arbitrary canonical
prefix of completed marked Locals.  Both the executable whole-term address and
the target are obtained by literal context composition. -/
theorem markedPrefix_firstC4_selects_firstFrameRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks)
    {term : Term} {historyContext : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (marked : RootResetReachableStageGrammar.MarkedPrefix program
      dispatcher.tree term
      (SchedulerCycle.firstC4Configuration program dispatcher bit suffix fuel
        outerContext innerContext).cursor.erase historyContext history) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let layer := generatedLayer actions bits continuation
    let firstFrame := SchedulerCycle.firstFrameConfiguration program dispatcher
      bit suffix fuel outerContext innerContext
    ∃ seed activeView wholeView,
      parseWhole? program dispatcher.tree term = some wholeView ∧
        wholeView.active = activeView ∧
        activeView.stage = .postC4 seed
          ⟨List.replicate fuel layer, layer⟩ ∧
        wholeView.selectedAddress =
          RootResetSelectorContract.contextAddress historyContext ++
            RootResetSelectorContract.contextAddress
              (SchedulerInvariant.contextOfParents firstFrame.cursor.parents) ∧
        term.contractAt? wholeView.selectedAddress =
          some
            (historyContext.plug
              (Cursor.rebuild
                (PrimitiveFuel.pendingParents environment continuation fuel [])
                (SchedulerResponseInvariant.frameFirstRoot actions bits
                  continuation
                  (SchedulerCycle.deletedCarrier bit outerContext
                    innerContext)))) := by
  dsimp only
  obtain ⟨seed, activeView, _seedParsed, activeParsed, stageEq, _rightsEq,
      persistentAddress, _erasedEq, activeContract⟩ :=
    firstC4Configuration_parse_postC4_selects_firstFrameRoot program dispatcher
      bit suffix fuel trace
  let wholeView : WholeView program :=
    { activeTerm :=
        (SchedulerCycle.firstC4Configuration program dispatcher bit suffix fuel
          outerContext innerContext).cursor.erase
      context := historyContext
      history := history
      active := activeView }
  have wholeParsed : parseWhole? program dispatcher.tree term =
      some wholeView := by
    exact parseWhole?_complete_of_markedPrefix marked activeParsed
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    historyContext activeView.selectedAddress activeContract
  rw [marked.source_eq] at lifted
  refine ⟨seed, activeView, wholeView, wholeParsed, rfl, stageEq, ?_, ?_⟩
  · change RootResetSelectorContract.contextAddress historyContext ++
      activeView.selectedAddress = _
    rw [persistentAddress]
  · simpa [wholeView, WholeView.selectedAddress] using lifted

/-- The same local post-C4 contraction lifts below any certified completed
outer zipper.  The theorem records the completed-prefix depth and is uniform
in both that depth and the pending-frame fuel depth. -/
theorem completedParents_firstC4_selects_firstFrameRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks)
    {completedParents : List ParentFrame} {completedLayers : Nat}
    (completed : SchedulerCompletedContext.CompletedParents program dispatcher
      completedParents completedLayers) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let firstC4 := SchedulerCycle.firstC4Configuration program dispatcher bit
      suffix fuel outerContext innerContext
    ∃ activeView,
      parse? actions firstC4.cursor.erase = some activeView ∧
        (CanonicalTraversal.contextAddress
          (SchedulerInvariant.contextOfParents completedParents)).length =
            2 * completedLayers ∧
        (Cursor.rebuild completedParents firstC4.cursor.erase).contractAt?
            (RootResetSelectorContract.contextAddress
                (SchedulerInvariant.contextOfParents completedParents) ++
              activeView.selectedAddress) =
          some
            (Cursor.rebuild completedParents
              (Cursor.rebuild
                (PrimitiveFuel.pendingParents environment continuation fuel [])
                (SchedulerResponseInvariant.frameFirstRoot actions bits
                  continuation
                  (SchedulerCycle.deletedCarrier bit outerContext
                    innerContext)))) := by
  dsimp only
  obtain ⟨_seed, activeView, _seedParsed, activeParsed, _stageEq, _rightsEq,
      _persistentAddress, _erasedEq, activeContract⟩ :=
    firstC4Configuration_parse_postC4_selects_firstFrameRoot program dispatcher
      bit suffix fuel trace
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    (SchedulerInvariant.contextOfParents completedParents)
    activeView.selectedAddress activeContract
  simp only [SchedulerInvariant.contextOfParents_plug] at lifted
  exact ⟨activeView, activeParsed, completed.contextDepth, lifted⟩

/-! ## Canonical fuel rows below pending frames -/

/-- Any canonical local fuel row remains exactly selectable below an arbitrary
number of pending-frame parents.  Its local parser certificate and exact
lifted contractum are both retained. -/
theorem canonicalFuelRow_pendingParents_selects
    (actions : Term) (bits : List Bool) (continuation : Term)
    (row : FuelRow) (canonical : CanonicalFuelRow actions row)
    (depth : Nat) :
    parseCanonicalFuelRow? actions row.term = some row ∧
      (Cursor.rebuild
          (PrimitiveFuel.pendingParents
            (environmentCode actions bits) continuation depth [])
          row.term).contractAt?
        (rights depth ++ row.localAddress) =
          some
            (Cursor.rebuild
              (PrimitiveFuel.pendingParents
                (environmentCode actions bits) continuation depth [])
              row.target) := by
  refine ⟨parseCanonicalFuelRow?_complete rfl canonical, ?_⟩
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    (SchedulerInvariant.contextOfParents
      (PrimitiveFuel.pendingParents
        (environmentCode actions bits) continuation depth []))
    row.localAddress row.contractAt?_eq_some_target
  simp only [SchedulerInvariant.contextOfParents_plug] at lifted
  have address := contextOfParents_pendingParents_address
    (environmentCode actions bits) continuation depth []
  have address' :
      RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents
            (PrimitiveFuel.pendingParents
              (environmentCode actions bits) continuation depth [])) =
        rights depth := by
    simpa [SchedulerInvariant.contextOfParents,
      RootResetSelectorContract.contextAddress] using address
  simpa only [address'] using lifted

end PureSFormal.Research.RootResetPersistentRouteAFuelSchedulerBridge
