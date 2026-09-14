import PureSFormal.Research.RootResetInitialContractionPrefix
import PureSFormal.Research.RootResetNormalResponseSelectorChain

/-!
# Empty-job response selection

An empty immutable seed has no front cell.  Its Base-producing sample therefore
passes directly, without an intervening deletion, to the innermost pending
FRAME contraction.  The empty handoff equations below recover that address
from the bare term for every pending depth and admissible continuation.
-/

namespace PureSFormal.Research.RootResetEmptyResponseSelectorChain

open PureSFormal.PureS
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetPersistentFuelCarrier
open RootResetPersistentRouteAFuelSchedulerBridge
open RootResetTraversableCompletedParents.TraversableParents

/-- No completed Local can be mistaken for a pending-frame stack ending in a
Base carrier.  This exclusion is structural and does not inspect its data. -/
theorem fuelParse_none_of_localShape
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {localView : CheckpointDecoder.LocalView program}
    (shape : CheckpointDecoder.LocalShape program tree localView term) :
    parse? (compileActions program tree) term = none := by
  cases accepted : parse? (compileActions program tree) term with
  | none => rfl
  | some view =>
      have valid := parse?_sound accepted
      have source := valid.source
      cases layersEq : view.layers with
      | nil =>
          rcases shape with ⟨haltField, dispatcherTerm, seedAudit,
            continuationAudit, halt, dispatch, localEq⟩
          have same := source.symm.trans localEq
          have boundary := congrArg (fun t =>
            (t.subterm? [.left, .right]).map Term.headArity) same
          simp [View.source, View.fuelView, FuelView.term, FuelEndpoint.term,
            layersEq, pendingContext, OpenBaseView.term,
            CheckpointDecoder.openShell, CheckpointDecoder.openEnvironment,
            Term.subterm?] at boundary
      | cons layer layers =>
          have localArity := CheckpointDecoder.parseLocal?_headArity
            (CheckpointDecoder.parseLocal?_complete shape)
          have canonical : CanonicalPendingLayers (compileActions program tree)
              (layer :: layers) := by
            simpa [View.fuelView, layersEq] using valid.canonical.layers
          have arity : term.headArity = 3 := by
            rw [source]
            simp [View.source, View.fuelView, FuelView.term, layersEq,
              pendingContext_cons, Context.plug, frame, canonical.1.1,
              CheckpointDecoder.openEnvironment]
          rcases localArity with five | six <;> rw [arity] at * <;> contradiction

/-- Every certified completed continuation prefix is automatically safe for
the fuel-aware traversal, for every term placed in its continuation hole. -/
theorem traversableParents_fuelTraversable
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (traversable : RootResetTraversableCompletedParents.TraversableParents
      program dispatcher parents layers) (endpoint : Term) :
    FuelTraversableAt program dispatcher
      parents layers endpoint := by
  induction traversable generalizing endpoint with
  | root => exact .root endpoint
  | fresh outer registers bit bits carrier complete ih =>
      apply FuelTraversableAt.fresh
        registers bit bits endpoint carrier complete (ih _)
      exact fuelParse_none_of_localShape
        (CheckpointDecoder.localShape_completed bits
          (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher
            registers bit carrier))
  | marked outer registers bit bits carrier ih =>
      apply FuelTraversableAt.marked
        registers bit bits endpoint carrier (ih _)
      exact fuelParse_none_of_localShape
        (CheckpointDecoder.localShape_markedCompleted bits
          (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher
            registers bit carrier))

/-- A successfully parsed fuel boundary retains full-selector priority under
every completed continuation prefix that the scheduler is permitted to cross. -/
theorem selectStep?_rebuild_of_fuelParsed
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat} {endpoint : Term} {view : View}
    (traversable : RootResetTraversableCompletedParents.TraversableParents
      program dispatcher parents layers)
    (parsed : parse? (compileActions program dispatcher.tree) endpoint = some view) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (Cursor.rebuild parents endpoint) =
      some (Cursor.rebuild parents (view.target (compileActions program dispatcher.tree))) := by
  have safe := traversableParents_fuelTraversable traversable endpoint
  have rootEq : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
      endpoint = ⟨endpoint, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext, parsed]
  have activeEq := safe.fuelActiveContext_rebuild_active
  rw [rootEq] at activeEq
  have atOuter : parse? (compileActions program dispatcher.tree)
      (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        (Cursor.rebuild parents endpoint)).active = some view := by
    rw [activeEq]
    exact parsed
  have priority := RootResetPersistentRouteAFuel.classifyHandoff_fuel_priority
    (program := program) (layout := dispatcher) atOuter
  apply RootResetPersistentResponseSelector.selectStep?_eq_some_of_baseFuel
    priority.1 priority.2
  change (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
    (Cursor.rebuild parents endpoint)).context.plug _ = _
  rw [safe.fuelActiveContext_rebuild_context, rootEq, Context.plug_comp]
  exact SchedulerInvariant.contextOfParents_plug parents _

/-- Literal generated empty carriers have a distinguished empty handoff view. -/
theorem nestedFrames_parse_empty
    (actions continuation : Term) (admissible : Carrier.Admissible continuation)
    (depth : Nat) :
    let layer := generatedLayer actions [] continuation
    let base := generatedBaseView actions (word []) continuation
    parse? actions (nestedFrames (environmentCode actions []) continuation
        (depth + 1)) =
      some ⟨List.replicate depth layer ++ [layer], base,
        .empty ⟨List.replicate depth layer, layer⟩⟩ := by
  rw [← generatedFifthSample_eq_nestedFrames]
  exact parse?_generated_empty actions continuation admissible depth

/-- The complete selector contracts the innermost frame of every empty job;
the pending depth is reconstructed by the parser. -/
theorem selectStep?_nestedFrames_empty
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (depth : Nat) :
    let actions := compileActions program dispatcher.tree
    let environment := environmentCode actions []
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (nestedFrames environment continuation (depth + 1)) =
      some (Cursor.rebuild
        (PrimitiveFuel.pendingParents environment continuation depth [])
        (SchedulerResponseInvariant.frameFirstRoot actions [] continuation
          (baseCarrier environment continuation))) := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  let layer := generatedLayer actions [] continuation
  let base := generatedBaseView actions (word []) continuation
  let view : View := ⟨List.replicate depth layer ++ [layer], base,
    .empty ⟨List.replicate depth layer, layer⟩⟩
  let source := nestedFrames (environmentCode actions []) continuation (depth + 1)
  have parsed : parse? actions source = some view :=
    nestedFrames_parse_empty actions continuation admissible depth
  have outerEq : RootResetPersistentRouteAFuel.fuelActiveContext program
      dispatcher source = ⟨source, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext, parsed]
  have parsedAtOuter : parse? actions
      (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        source).active = some view := by
    rw [outerEq]
    exact parsed
  have priority := RootResetPersistentRouteAFuel.classifyHandoff_fuel_priority
    (program := program) (layout := dispatcher) parsedAtOuter
  apply RootResetPersistentResponseSelector.selectStep?_eq_some_of_baseFuel
    priority.1 priority.2
  simp only [RootResetPersistentRouteAFuel.fuelSelection, outerEq, Context.plug]
  change (pendingContext (List.replicate depth layer)).plug
    (View.frameFirstTarget actions [] continuation (base.term actions)) = _
  rw [pendingContext_replicate_plug]
  rw [generatedBaseView_term_eq]
  have envEq : zeroEnvironment actions (word []) = environmentCode actions [] := rfl
  rw [envEq, PrimitiveFuel.rebuild_pendingParents]
  rfl

/-- The empty handoff equation holds beneath an arbitrary certified completed
outer prefix, with every fuel-priority exclusion discharged structurally. -/
theorem selectStep?_nestedFrames_empty_under_parents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (depth : Nat) {parents : List ParentFrame} {layers : Nat}
    (traversable : RootResetTraversableCompletedParents.TraversableParents
      program dispatcher parents layers) :
    let actions := compileActions program dispatcher.tree
    let environment := environmentCode actions []
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (Cursor.rebuild parents (nestedFrames environment continuation (depth + 1))) =
      some (Cursor.rebuild parents (Cursor.rebuild
        (PrimitiveFuel.pendingParents environment continuation depth [])
        (SchedulerResponseInvariant.frameFirstRoot actions [] continuation
          (baseCarrier environment continuation)))) := by
  dsimp only
  have parsed := nestedFrames_parse_empty (compileActions program dispatcher.tree)
    continuation admissible depth
  have lifted := selectStep?_rebuild_of_fuelParsed traversable parsed
  have localSelected := selectStep?_rebuild_of_fuelParsed
    (RootResetTraversableCompletedParents.TraversableParents.root
      (program := program) (dispatcher := dispatcher)) parsed
  have exactSelected := selectStep?_nestedFrames_empty program dispatcher
    continuation admissible depth
  have targetEq := Option.some.inj (localSelected.symm.trans exactSelected)
  dsimp only [Cursor.rebuild] at targetEq
  rw [targetEq] at lifted
  exact lifted

/-- The exact scheduler's empty Base sample has the unconditional selected
FRAME successor for every admissible continuation and pending depth. -/
theorem emptyFifth_selectStep_eq_firstFrameRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (depth : Nat) :
    let actions := compileActions program dispatcher.tree
    let environment := environmentCode actions []
    let fifth := SchedulerInvariant.fuelZeroFifthMutationConfiguration program
      dispatcher registers environment continuation
      (PrimitiveFuel.pendingParents environment continuation (depth + 1) [])
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        fifth.cursor.erase =
      some (Cursor.rebuild
        (PrimitiveFuel.pendingParents environment continuation depth [])
        (SchedulerResponseInvariant.frameFirstRoot actions [] continuation
          (baseCarrier environment continuation))) := by
  dsimp only
  rw [fuelZeroFifthMutationConfiguration_erase]
  exact selectStep?_nestedFrames_empty program dispatcher continuation
    admissible depth

/-- A real EMPTY-script contraction is the first FRAME residual, uniformly in
all outer cursor parents. -/
theorem emptyResponse_firstMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    ∃ ticks sample,
      FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
          ticks (SchedulerEmpty.responseStartConfiguration program dispatcher
            registers bits continuation carrier parents) = some sample ∧
        sample.cursor.erase = Cursor.rebuild parents
          (SchedulerResponseInvariant.frameFirstRoot
            (compileActions program dispatcher.tree) bits continuation carrier) := by
  obtain ⟨samples, chain, paired⟩ :=
    SchedulerNestedEmpty.emptyResponse_exactPairedMutationChain program dispatcher
      registers bits continuation carrier parents
  change SchedulerNestedEmpty.EmptyResponseSamplePairs program dispatcher
    registers bits continuation carrier parents samples ((false,
      SchedulerResponseInvariant.frameFirstRoot
        (compileActions program dispatcher.tree) bits continuation carrier) :: _) at paired
  cases paired with
  | cons pc cursor done term position erased root tail =>
      cases chain with
      | next ticks found remaining => exact ⟨ticks, _, found, erased⟩

/-- The empty Base descent and the first actual EMPTY contraction agree with
the restarted selector without a parser-priority assumption. -/
theorem emptyFifth_firstMutation_agreement
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (depth : Nat) :
    let actions := compileActions program dispatcher.tree
    let environment := environmentCode actions []
    let fifth := SchedulerInvariant.fuelZeroFifthMutationConfiguration program
      dispatcher (SchedulerControl.Registers.newJob program) environment continuation
      (PrimitiveFuel.pendingParents environment continuation (depth + 1) [])
    ∃ ticks sample,
      FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        ticks fifth = some sample ∧
      RootResetPersistentResponseSelector.selectStep? program dispatcher
        fifth.cursor.erase = some sample.cursor.erase := by
  dsimp only
  let environment := environmentCode (compileActions program dispatcher.tree) []
  let registers := SchedulerNestedEmpty.initialEmptyRegisters program
  let carrier := baseCarrier environment continuation
  let parents := PrimitiveFuel.pendingParents environment continuation depth []
  obtain ⟨downTicks, descend⟩ := SchedulerNestedEmpty.emptyBase_toFirstFrame_zeroRun
    program dispatcher continuation admissible depth []
  have enter := SchedulerEmpty.enterResponse_zeroRun program dispatcher registers
    [] continuation carrier parents
  obtain ⟨responseTicks, sample, found, erased⟩ := emptyResponse_firstMutation
    program dispatcher registers [] continuation carrier parents
  refine ⟨(downTicks + 1) + responseTicks, sample,
    (descend.trans enter).seekMutation_prepend found, ?_⟩
  rw [erased]
  exact emptyFifth_selectStep_eq_firstFrameRoot program dispatcher
    (SchedulerControl.Registers.newJob program) continuation admissible depth

/-- Rebuilding arbitrary outer parents commutes with erasing the fifth sample. -/
theorem emptyFifth_erase_under_parents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (continuation : Term)
    (depth : Nat) (parents : List ParentFrame) :
    let environment := environmentCode (compileActions program dispatcher.tree) []
    (SchedulerInvariant.fuelZeroFifthMutationConfiguration program dispatcher
      registers environment continuation
      (PrimitiveFuel.pendingParents environment continuation (depth + 1)
        parents)).cursor.erase =
      Cursor.rebuild parents (nestedFrames environment continuation (depth + 1)) := by
  dsimp only
  change Cursor.rebuild (PrimitiveFuel.pendingParents _ _ _ _) _ = _
  rw [PrimitiveFuel.rebuild_pendingParents]
  apply congrArg (Cursor.rebuild parents)
  have root := fuelZeroFifthMutationConfiguration_erase program dispatcher
    registers [] continuation depth
  change Cursor.rebuild (PrimitiveFuel.pendingParents _ _ _ []) _ = _ at root
  rw [PrimitiveFuel.rebuild_pendingParents] at root
  exact root

/-- The actual empty Base-to-FRAME mutation agrees below every generated
completed continuation prefix, uniformly in both outer and pending depths. -/
theorem emptyFifth_under_parents_firstMutation_agreement
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (depth : Nat) {parents : List ParentFrame} {layers : Nat}
    (traversable : RootResetTraversableCompletedParents.TraversableParents
      program dispatcher parents layers) :
    let environment := environmentCode (compileActions program dispatcher.tree) []
    let fifth := SchedulerInvariant.fuelZeroFifthMutationConfiguration program
      dispatcher (SchedulerControl.Registers.newJob program) environment continuation
      (PrimitiveFuel.pendingParents environment continuation (depth + 1) parents)
    ∃ ticks sample,
      FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
          ticks fifth = some sample ∧
        RootResetPersistentResponseSelector.selectStep? program dispatcher
          fifth.cursor.erase = some sample.cursor.erase := by
  dsimp only
  let environment := environmentCode (compileActions program dispatcher.tree) []
  let registers := SchedulerNestedEmpty.initialEmptyRegisters program
  let carrier := baseCarrier environment continuation
  let pending := PrimitiveFuel.pendingParents environment continuation depth parents
  obtain ⟨downTicks, descend⟩ := SchedulerNestedEmpty.emptyBase_toFirstFrame_zeroRun
    program dispatcher continuation admissible depth parents
  have enter := SchedulerEmpty.enterResponse_zeroRun program dispatcher registers
    [] continuation carrier pending
  obtain ⟨responseTicks, sample, found, erased⟩ := emptyResponse_firstMutation
    program dispatcher registers [] continuation carrier pending
  refine ⟨(downTicks + 1) + responseTicks, sample,
    (descend.trans enter).seekMutation_prepend found, ?_⟩
  rw [emptyFifth_erase_under_parents, erased]
  have selected := selectStep?_nestedFrames_empty_under_parents program dispatcher
    continuation admissible depth traversable
  simpa only [pending, PrimitiveFuel.rebuild_pendingParents, Cursor.rebuild]
    using selected

/-- Marked response carriers identify the absorbing false action independently
of the number of Local shells or tombstones they contain. -/
theorem markedCompleted_responseBit
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (bit : Bool) (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.carrierResponseBit? program dispatcher.tree
      (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier)) =
      some false := by
  have parsed := CheckpointDecoder.parseLocal?_markedCompleted
    (continuation := continuation) bits
    (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher
      registers bit carrier)
  rw [RootResetPersistentResponseSelector.carrierResponseBit?, parsed]
  rfl

/-- Marking a response leaves its next-phase label readable from the carrier. -/
theorem markedCompleted_phase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (bit : Bool) (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.carrierPhase? program dispatcher.tree
      (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier)) =
      some (CTS.nextPhase program registers.phase) := by
  have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program
    dispatcher registers bit carrier
  have shape := CheckpointDecoder.localShape_markedCompleted
    (continuation := continuation) bits dispatch
  have notBase := CheckpointRun.parseBase?_none_of_localShape shape
  have parsed := CheckpointDecoder.parseLocal?_markedCompleted
    (continuation := continuation) bits dispatch
  rw [RootResetPersistentResponseSelector.carrierPhase?, notBase]
  dsimp only
  rw [parsed]
  rfl

/-- The entire recursively generated absorbing-empty carrier family preserves
the exact phase and false-action label, for every sweep length. -/
theorem emptySweepCarrier_label
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (count : Nat)
    (registers : SchedulerControl.Registers program) (carrier : Term)
    (phase : RootResetPersistentResponseSelector.carrierPhase? program dispatcher.tree
      carrier = some registers.phase)
    (emptyBit : RootResetPersistentResponseSelector.carrierResponseBit? program
      dispatcher.tree carrier = some false) :
    let swept := SchedulerCycle.emptySweepCarrier program dispatcher bits
      continuation count registers carrier
    RootResetPersistentResponseSelector.carrierPhase? program dispatcher.tree swept =
        some (SchedulerCycle.emptySweepRegisters program count registers).phase ∧
      RootResetPersistentResponseSelector.carrierResponseBit? program
        dispatcher.tree swept = some false := by
  induction count generalizing registers carrier with
  | zero => exact ⟨phase, emptyBit⟩
  | succ count ih =>
      exact ih registers.advanceEmpty _
        (markedCompleted_phase program dispatcher registers false bits
          continuation carrier)
        (markedCompleted_responseBit program dispatcher registers false bits
          continuation carrier)

/-- The generated empty Base exposes phase zero and the false-action label. -/
theorem emptyBase_label
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) :
    let carrier := baseCarrier
      (environmentCode (compileActions program dispatcher.tree) []) continuation
    RootResetPersistentResponseSelector.carrierPhase? program dispatcher.tree
        carrier = some (CTS.zeroPhase program) ∧
      RootResetPersistentResponseSelector.carrierResponseBit? program dispatcher.tree
        carrier = some false := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  let carrier := baseCarrier (environmentCode actions []) continuation
  have parsed : CheckpointDecoder.parseBase? actions carrier =
      some ⟨word [], continuation, word [],
        baseBeta (environmentCode actions []) continuation⟩ :=
    CheckpointDecoder.parseBase?_open ..
  have notLocal : CheckpointDecoder.parseLocal? program dispatcher.tree carrier =
      none := by
    cases localParsed : CheckpointDecoder.parseLocal? program dispatcher.tree
        carrier with
    | none => rfl
    | some view =>
        have notBase := CheckpointRun.parseBase?_none_of_localShape
          (CheckpointDecoder.parseLocal?_sound localParsed)
        rw [parsed] at notBase
        contradiction
  have localCount : RootResetPersistentResponseSelector.carrierLocalCount?
      program dispatcher.tree carrier = some 0 := by
    rw [RootResetPersistentResponseSelector.carrierLocalCount?, parsed]
  have tombCount : RootResetPersistentResponseSelector.carrierTombstoneCount?
      program dispatcher.tree carrier = some 0 := by
    rw [RootResetPersistentResponseSelector.carrierTombstoneCount?, parsed]
    change RootResetPersistentResponseSelector.spineTombstoneCount? omega = some 0
    rw [RootResetPersistentResponseSelector.spineTombstoneCount?]
    rfl
  have decoded : CheckpointDecoder.decodeCarrier? program dispatcher.tree carrier =
      some [] := by
    rw [CheckpointDecoder.decodeCarrier?, parsed]
    rfl
  constructor
  · rw [RootResetPersistentResponseSelector.carrierPhase?, parsed]
  · rw [RootResetPersistentResponseSelector.carrierResponseBit?, notLocal,
      localCount, tombCount, decoded]
    rfl

/-- Every actual carrier in an initially empty job has the exact current
EMPTY label; neither a count comparison nor a parser premise is supplied. -/
theorem generatedEmptySweep_label
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (count : Nat) :
    let registers := SchedulerNestedEmpty.initialEmptyRegisters program
    let carrier := SchedulerCycle.emptySweepCarrier program dispatcher []
      continuation count registers
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) [])
        continuation)
    RootResetPersistentResponseSelector.carrierPhase? program dispatcher.tree carrier =
        some (SchedulerCycle.emptySweepRegisters program count registers).phase ∧
      RootResetPersistentResponseSelector.carrierResponseBit? program dispatcher.tree
        carrier = some false := by
  have base := emptyBase_label program dispatcher continuation
  exact emptySweepCarrier_label program dispatcher [] continuation count
    (SchedulerNestedEmpty.initialEmptyRegisters program) _ base.1 base.2

/-- The literal empty-input sample occurs after exactly eleven actual
contractions, has no seed front, and selects the real next FRAME mutation. -/
theorem emptyInitialHandoff_witness
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    let before := RootResetInitialContractionPrefix.clockFuelTerminal
      program dispatcher []
    let samples := RootResetInitialContractionPrefix.clockFuelSamples
      program dispatcher []
    SchedulerResponseInvariant.ExactMutationChain
        (SchedulerControl.machine program dispatcher) before
        (SchedulerControl.initialConfiguration program dispatcher []) samples ∧
      samples.length = 11 ∧ parseSeedFront? (word []) = none ∧
      ∃ ticks sample,
        FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
          ticks before = some sample ∧
        RootResetPersistentResponseSelector.selectStep? program dispatcher
          before.cursor.erase = some sample.cursor.erase := by
  refine ⟨RootResetInitialContractionPrefix.clockFuel_exactMutationChain
    program dispatcher [],
    RootResetInitialContractionPrefix.clockFuelSamples_length program dispatcher [],
    parseSeedFront?_word_nil, ?_⟩
  exact emptyFifth_firstMutation_agreement program dispatcher
    (Dovetail.clockExit 1 0
      (environmentCode (compileActions program dispatcher.tree) []))
    (Dovetail.clockExit_admissible 1 0 _) 0

end PureSFormal.Research.RootResetEmptyResponseSelectorChain
