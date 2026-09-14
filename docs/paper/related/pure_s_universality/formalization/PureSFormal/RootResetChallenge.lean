import PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement
import PureSFormal.Research.RootResetContractProjection
import PureSFormal.Computation.DeterministicTapeRootResetOutput
import PureSFormal.Computation.DeterministicTapePaddedEncoderConstructionMachine
import PureSFormal.Computation.DeterministicTapeOutputQuartic
import PureSFormal.PureS.PrimitiveInterfaceCertificates
import PureSFormal.Computation.FixedEndpointUniformity

/-!
The fixed root-restarted computation endpoint. Each invocation uses the same
finite local-observation machine and a fresh root cursor. Source instances
change only the padded initial term. The measured encoder and literal row,
terminal-row, and scanned-bit observers are the implementations certified
below. Bounds count controller microticks or primitive interface operations
on unshared syntax trees and unary naturals; they are distinct measures.

The persistent-cursor aggregate remains in `PureSFormal.Challenge`.
-/
namespace PureSFormal.RootResetChallenge
set_option maxRecDepth 10000
set_option maxHeartbeats 1000000
open PureSFormal.PureS
open PureSFormal.Research
open RootResetSelectorContract
open PureSFormal.Computation
open ProtectedTrieDeterministicCompiler

abbrev UniversalProgram : CTS.Program := Cook.rogozhinCookProgram
abbrev UniversalDispatcher : ActionDispatcher UniversalProgram :=
  WeakPathUniversality.canonicalDispatcher UniversalProgram
def UniversalContract : Contract :=
  RootResetFinitePrioritySelector.selectorContract UniversalProgram UniversalDispatcher
abbrev UniversalControl := UniversalContract.Control
abbrev UniversalController := UniversalContract.machine
def UniversalSelector : Term → Option Term :=
  RootResetFiniteAllInputsTraceAgreement.selector UniversalProgram
abbrev UniversalActions : Term := compileActions UniversalProgram UniversalDispatcher.tree
abbrev UniversalDecoder := PublicDecoder.decode UniversalProgram UniversalDispatcher.tree
abbrev UniversalDetector := TermEvent.observesMarkedCheckpoint? UniversalProgram UniversalDispatcher.tree
def UniversalRealization := RootResetFiniteAllInputsTraceAgreement.finiteCTSUniversality UniversalProgram

attribute [local irreducible] Cook.rogozhinCookProgram BalancedActionTree.dispatcher

def wordTerm (bits : List Bool) (index : Nat) : Term :=
  RootResetTermOnlyTransfer.run UniversalSelector index (generator UniversalActions bits)

abbrev Source := DeterministicTape.Instance
abbrev encode : Source → Term := DeterministicTapePureSOutput.encode
abbrev sourceTerm : Source → Nat → Term := DeterministicTapeRootResetOutput.termAt
abbrev sourceOutput : Term → Option Bool := DeterministicTapePureSOutput.decodeScannedOutput?

/-- Every field concerns the displayed closed controller and interfaces.
No source-dependent controller, selected path, or agreement premise is an
argument to this proposition. State-cover completeness does not assert an
enumerated deduplicated or reachable-state count. -/
structure RootResetComputationUniversality : Prop where
  programPeriod : UniversalProgram.period = 912
  controllerCoverComplete : ∀ control : UniversalControl, control ∈ UniversalController.states
  controllerTextbookAgreement : ∀ control node incoming,
    ((FiniteController.machineEquivTextbook UniversalControl).backward
      ((FiniteController.machineEquivTextbook UniversalControl).forward UniversalController)).transition
        control node incoming = UniversalController.transition control node incoming
  freshRootInitialization : ∀ term,
    UniversalContract.initial term = ⟨some UniversalContract.start, Cursor.atRoot term⟩
  noInterInvocationState : ∀ (first second : UniversalContract.InterInvocationState) term,
    UniversalContract.invokeRun first term = UniversalContract.invokeRun second term
  selectorProjection : ∀ term,
    UniversalSelector term = RootResetContractProjection.projectedStep? UniversalContract term
  selectorCoefficientPositive : 0 < UniversalContract.coefficient
  selectorMicroticks : ∀ term,
    UniversalContract.stoppingTime term ≤ UniversalContract.coefficient * (term.size + 1)
  selectorTerminates : ∀ term,
    (runtimeHaltKind UniversalContract.haltKind
      (UniversalContract.invokeRun () term).control).isSome = true
  selectorTerminalAbsorbing : ∀ control node incoming,
    (UniversalContract.haltKind control).isSome = true →
      UniversalController.transition control node incoming = .stay control
  selectorNormality : ∀ term, UniversalSelector term = none ↔ AddressNormal term
  successfulInvocation : ∀ term target, UniversalSelector term = some target →
    runtimeHaltKind UniversalContract.haltKind (UniversalContract.invokeRun () term).control = some .redex ∧
    (UniversalContract.invokeRun () term).cursor.erase = target ∧
    FiniteController.runMutationCount UniversalController (UniversalContract.stoppingTime term)
      (UniversalContract.initial term) = 1 ∧
    term.contractAt? (cursorAddress (UniversalContract.invokeRun () term).cursor) = some target
  normalInvocation : ∀ term, UniversalSelector term = none →
    runtimeHaltKind UniversalContract.haltKind (UniversalContract.invokeRun () term).control = some .nf ∧
    AddressNormal term ∧ (UniversalContract.invokeRun () term).cursor.erase = term ∧
    FiniteController.runMutationCount UniversalController (UniversalContract.stoppingTime term)
      (UniversalContract.initial term) = 0
  selectorEdgeMoves : ∀ term,
    runSuccessfulEdgeMoveCount UniversalController (UniversalContract.stoppingTime term)
      (UniversalContract.initial term) ≤ UniversalContract.coefficient * (term.size + 1)
  realizesEveryInput : ∀ bits,
    WeakPath.Realizes UniversalProgram (RootResetTermOnlyTransfer.Projects UniversalSelector)
      UniversalSelector (UniversalRealization.encode bits) (CTS.initial UniversalProgram bits)
      UniversalDecoder (UniversalRealization.path bits) (UniversalRealization.checkpointTime bits)
  iterationIsCertifiedPath : ∀ bits index, wordTerm bits index = (UniversalRealization.path bits).term index
  everyInvocationSelectsNext : ∀ bits index,
    UniversalSelector (wordTerm bits index) = some (wordTerm bits (index + 1))
  everySampledEdgeIsS : ∀ bits index, Step (wordTerm bits index) (wordTerm bits (index + 1))
  checkpointsStrictlyIncrease : ∀ bits, WeakPath.StrictlyIncreasing (UniversalRealization.checkpointTime bits)
  exactCTSDecoding : ∀ bits index horizon config,
    UniversalDecoder (wordTerm bits index) = some (horizon, config) ↔
      index = UniversalRealization.checkpointTime bits horizon ∧
        config = CTS.iterate UniversalProgram horizon (CTS.initial UniversalProgram bits)
  paddedEncoderShape : ∀ source,
    encode source = generator UniversalActions (DeterministicTapePureSOutput.seed source)
  sourceInitialization : ∀ source, sourceTerm source 0 = encode source
  sourceFreshRootIteration : ∀ source index,
    sourceTerm source index = RootResetTermOnlyTransfer.run UniversalSelector index (encode source)
  completeEncoder : ∀ number,
    DeterministicTapePaddedEncoderConstructionMachine.TermExecution number
      (DeterministicTapePaddedEncoderConstructionMachine.sourceTerm number).value
      (DeterministicTapePaddedEncoderConstructionMachine.sourceTerm number).operations ∧
    (DeterministicTapePaddedEncoderConstructionMachine.sourceTerm number).value =
      sourceTerm (DeterministicTapeCode.instanceDecodeCode number) 0 ∧
    (DeterministicTapePaddedEncoderConstructionMachine.sourceTerm number).value.code =
      PRCode.eval₁ DeterministicTapeStatePaddingComputability.Program.paddedTerm number ∧
    (DeterministicTapePaddedEncoderConstructionMachine.sourceTerm number).operations ≤
      DeterministicTapePaddedEncoderConstructionMachine.termBudget number
  encoderPrimitiveRecursive : PrimitiveRecursive
    (fun number => (encode (DeterministicTapeCode.instanceDecodeCode number)).code)
  literalRows : ∀ source row,
    (∃ sample, DeterministicTapePureSOutput.decodeRow? (sourceTerm source sample) = some row) ↔
      ∃ fuel, DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row
  terminalRows : ∀ source row,
    (∃ sample, DeterministicTapePureSOutput.decodeTerminalRow? (sourceTerm source sample) = some row) ↔
      (∃ fuel, DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) ∧
        DeterministicTape.step? source.machine row = none
  returnedOutput : ∀ source output,
    (∃ sample, sourceOutput (sourceTerm source sample) = some output) ↔
      DeterministicTapePureSOutput.Returns source output
  nonhaltingRejectsTerminal : ∀ source, ¬ DeterministicTape.Halts source → ∀ sample,
    DeterministicTapePureSOutput.decodeTerminalRow? (sourceTerm source sample) = none
  nonconstantOutputExample : ∀ input output,
    (∃ sample, sourceOutput (sourceTerm (CookSeedOutputExample.source input) sample) = some output) ↔ output = !input
  decoderOperations : ∀ term,
    (PublicDecoderPrimitive.decode UniversalProgram UniversalDispatcher.tree term).value = UniversalDecoder term ∧
      (PublicDecoderPrimitive.decode UniversalProgram UniversalDispatcher.tree term).operations ≤
        PublicDecoderPrimitive.coefficient UniversalProgram UniversalDispatcher.tree * (term.size + 1)^2
  detectorOperations : ∀ term,
    (TermEventPrimitive.observesMarkedCheckpoint UniversalProgram UniversalDispatcher.tree term).value = UniversalDetector term ∧
      (TermEventPrimitive.observesMarkedCheckpoint UniversalProgram UniversalDispatcher.tree term).operations ≤
        TermEventPrimitive.coefficient UniversalProgram UniversalDispatcher.tree * (term.size + 1)^2
  seedReadbackOperations : ∀ term,
    (CheckpointSeedReadbackPrimitive.decode UniversalProgram UniversalDispatcher.tree term).value =
      CheckpointSeedReadback.decode? UniversalProgram UniversalDispatcher.tree term ∧
      (CheckpointSeedReadbackPrimitive.decode UniversalProgram UniversalDispatcher.tree term).operations ≤
        CheckpointSeedReadbackPrimitive.coefficient UniversalProgram UniversalDispatcher.tree * (term.size + 1)^2
  completeOutputOperations : ∀ term,
    ((DeterministicTapeOutputPrimitive.row term).value = DeterministicTapePureSOutput.decodeRow? term ∧
      (DeterministicTapeOutputPrimitive.row term).operations ≤ DeterministicTapeOutputQuartic.budget term.size) ∧
    ((DeterministicTapeOutputPrimitive.terminal term).value = DeterministicTapePureSOutput.decodeTerminalRow? term ∧
      (DeterministicTapeOutputPrimitive.terminal term).operations ≤ DeterministicTapeOutputQuartic.budget term.size) ∧
    ((DeterministicTapeOutputPrimitive.scanned term).value = sourceOutput term ∧
      (DeterministicTapeOutputPrimitive.scanned term).operations ≤ DeterministicTapeOutputQuartic.budget term.size)

theorem wordTerm_eq_path (bits : List Bool) (index : Nat) :
    wordTerm bits index = (UniversalRealization.path bits).term index :=
  RootResetFiniteAllInputsTraceAgreement.termOnlyPath_eq_persistentPath UniversalProgram bits index

/- Keep the generic operational projection folded while specializing the
large fixed controller. Each field is checked before the final assembly. -/
private theorem verified_programPeriod :
    UniversalProgram.period = 912 := FixedEndpointUniformity.fixedProgram_period

private theorem verified_controllerCoverComplete :
    ∀ control : UniversalControl, control ∈ UniversalController.states := UniversalController.covers

private theorem verified_controllerTextbookAgreement :
    ∀ control node incoming,
    ((FiniteController.machineEquivTextbook UniversalControl).backward
      ((FiniteController.machineEquivTextbook UniversalControl).forward UniversalController)).transition
        control node incoming = UniversalController.transition control node incoming := (FiniteController.machineEquivTextbook UniversalControl).backwardForwardTransition UniversalController

private theorem verified_freshRootInitialization :
    ∀ term,
    UniversalContract.initial term = ⟨some UniversalContract.start, Cursor.atRoot term⟩ := fun _ => rfl

private theorem verified_noInterInvocationState :
    ∀ (first second : UniversalContract.InterInvocationState) term,
    UniversalContract.invokeRun first term = UniversalContract.invokeRun second term := UniversalContract.invokeRun_state_independent

private theorem readonlyProjection {α : Type} (spec : RootResetReadonlySelector.ProbeSpec α) (term : Term) :
    RootResetReadonlySelector.selectStep? spec term =
      RootResetContractProjection.projectedStep? (RootResetReadonlySelector.selectorContract spec) term := rfl

private theorem finiteSelectorProjection (program : CTS.Program) (layout : ActionDispatcher program) (term : Term) :
    RootResetFinitePrioritySelector.selectStep? program layout term =
      RootResetContractProjection.projectedStep? (RootResetFinitePrioritySelector.selectorContract program layout) term :=
  readonlyProjection (RootResetFinitePrioritySelector.selectionSpec program layout) term

private theorem verified_selectorProjection :
    ∀ term,
    UniversalSelector term = RootResetContractProjection.projectedStep? UniversalContract term :=
  finiteSelectorProjection UniversalProgram UniversalDispatcher

private theorem verified_selectorCoefficientPositive :
    0 < UniversalContract.coefficient := UniversalContract.coefficient_pos

private theorem verified_selectorMicroticks :
    ∀ term,
    UniversalContract.stoppingTime term ≤ UniversalContract.coefficient * (term.size + 1) := UniversalContract.stoppingTime_le

private theorem verified_selectorTerminates :
    ∀ term,
    (runtimeHaltKind UniversalContract.haltKind
      (UniversalContract.invokeRun () term).control).isSome = true := UniversalContract.terminal

private theorem verified_selectorTerminalAbsorbing :
    ∀ control node incoming,
    (UniversalContract.haltKind control).isSome = true →
      UniversalController.transition control node incoming = .stay control := UniversalContract.terminal_absorbing

private theorem verified_selectorNormality :
    ∀ term, UniversalSelector term = none ↔ AddressNormal term := by
  intro term
  rw [verified_selectorProjection]
  exact RootResetContractProjection.none_iff_normal UniversalContract term

private theorem verified_successfulInvocation :
    ∀ term target, UniversalSelector term = some target →
    runtimeHaltKind UniversalContract.haltKind (UniversalContract.invokeRun () term).control = some .redex ∧
    (UniversalContract.invokeRun () term).cursor.erase = target ∧
    FiniteController.runMutationCount UniversalController (UniversalContract.stoppingTime term)
      (UniversalContract.initial term) = 1 ∧
    term.contractAt? (cursorAddress (UniversalContract.invokeRun () term).cursor) = some target := by
  intro term target selected
  rw [verified_selectorProjection] at selected
  exact RootResetContractProjection.some_result UniversalContract () term target selected

private theorem verified_normalInvocation :
    ∀ term, UniversalSelector term = none →
    runtimeHaltKind UniversalContract.haltKind (UniversalContract.invokeRun () term).control = some .nf ∧
    AddressNormal term ∧ (UniversalContract.invokeRun () term).cursor.erase = term ∧
    FiniteController.runMutationCount UniversalController (UniversalContract.stoppingTime term)
      (UniversalContract.initial term) = 0 := by
  intro term selected
  rw [verified_selectorProjection] at selected
  exact RootResetContractProjection.none_result UniversalContract () term selected

private theorem verified_selectorEdgeMoves :
    ∀ term,
    runSuccessfulEdgeMoveCount UniversalController (UniversalContract.stoppingTime term)
      (UniversalContract.initial term) ≤ UniversalContract.coefficient * (term.size + 1) := UniversalContract.successfulEdgeMoves_le

private theorem verified_realizesEveryInput :
    ∀ bits,
    WeakPath.Realizes UniversalProgram (RootResetTermOnlyTransfer.Projects UniversalSelector)
      UniversalSelector (UniversalRealization.encode bits) (CTS.initial UniversalProgram bits)
      UniversalDecoder (UniversalRealization.path bits) (UniversalRealization.checkpointTime bits) := UniversalRealization.realizes

private theorem verified_iterationIsCertifiedPath :
    ∀ bits index, wordTerm bits index = (UniversalRealization.path bits).term index := wordTerm_eq_path

private theorem verified_everyInvocationSelectsNext :
    ∀ bits index,
    UniversalSelector (wordTerm bits index) = some (wordTerm bits (index + 1)) := by
    intro bits index
    rw [wordTerm_eq_path, wordTerm_eq_path]
    exact (UniversalRealization.realizes bits).isProjection.2.2 index

private theorem verified_everySampledEdgeIsS :
    ∀ bits index, Step (wordTerm bits index) (wordTerm bits (index + 1)) := by
    intro bits index
    rw [wordTerm_eq_path, wordTerm_eq_path]
    exact (UniversalRealization.path bits).contracts index

private theorem verified_checkpointsStrictlyIncrease :
    ∀ bits, WeakPath.StrictlyIncreasing (UniversalRealization.checkpointTime bits) := fun bits => (UniversalRealization.realizes bits).checkpointsIncrease

private theorem verified_exactCTSDecoding :
    ∀ bits index horizon config,
    UniversalDecoder (wordTerm bits index) = some (horizon, config) ↔
      index = UniversalRealization.checkpointTime bits horizon ∧
        config = CTS.iterate UniversalProgram horizon (CTS.initial UniversalProgram bits) := by
    intro bits index horizon config
    rw [wordTerm_eq_path]
    exact (UniversalRealization.realizes bits).decode_eq_some_iff index horizon config

private theorem verified_paddedEncoderShape :
    ∀ source,
    encode source = generator UniversalActions (DeterministicTapePureSOutput.seed source) := fun _ => rfl

private theorem verified_sourceInitialization :
    ∀ source, sourceTerm source 0 = encode source := DeterministicTapeRootResetOutput.termAt_zero

private theorem verified_sourceFreshRootIteration :
    ∀ source index,
    sourceTerm source index = RootResetTermOnlyTransfer.run UniversalSelector index (encode source) := fun _ _ => rfl

private theorem verified_completeEncoder :
    ∀ number,
    DeterministicTapePaddedEncoderConstructionMachine.TermExecution number
      (DeterministicTapePaddedEncoderConstructionMachine.sourceTerm number).value
      (DeterministicTapePaddedEncoderConstructionMachine.sourceTerm number).operations ∧
    (DeterministicTapePaddedEncoderConstructionMachine.sourceTerm number).value =
      sourceTerm (DeterministicTapeCode.instanceDecodeCode number) 0 ∧
    (DeterministicTapePaddedEncoderConstructionMachine.sourceTerm number).value.code =
      PRCode.eval₁ DeterministicTapeStatePaddingComputability.Program.paddedTerm number ∧
    (DeterministicTapePaddedEncoderConstructionMachine.sourceTerm number).operations ≤
      DeterministicTapePaddedEncoderConstructionMachine.termBudget number := by
    intro number
    have certified := DeterministicTapePaddedEncoderConstructionMachine.complete_padded_encoder_certificate number
    exact ⟨certified.1, certified.2.1.trans
      (DeterministicTapeRootResetOutput.termAt_eq_persistent (DeterministicTapeCode.instanceDecodeCode number) 0).symm,
      certified.2.2⟩

private theorem verified_encoderPrimitiveRecursive :
    PrimitiveRecursive
    (fun number => (encode (DeterministicTapeCode.instanceDecodeCode number)).code) := DeterministicTapePureSOutput.encode_code_primitiveRecursive

private theorem verified_literalRows :
    ∀ source row,
    (∃ sample, DeterministicTapePureSOutput.decodeRow? (sourceTerm source sample) = some row) ↔
      ∃ fuel, DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row := DeterministicTapeRootResetOutput.exists_literalRow_iff

private theorem verified_terminalRows :
    ∀ source row,
    (∃ sample, DeterministicTapePureSOutput.decodeTerminalRow? (sourceTerm source sample) = some row) ↔
      (∃ fuel, DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) ∧
        DeterministicTape.step? source.machine row = none := DeterministicTapeRootResetOutput.exists_terminalRow_iff

private theorem verified_returnedOutput :
    ∀ source output,
    (∃ sample, sourceOutput (sourceTerm source sample) = some output) ↔
      DeterministicTapePureSOutput.Returns source output := DeterministicTapeRootResetOutput.exists_scannedOutput_iff

private theorem verified_nonhaltingRejectsTerminal :
    ∀ source, ¬ DeterministicTape.Halts source → ∀ sample,
    DeterministicTapePureSOutput.decodeTerminalRow? (sourceTerm source sample) = none := DeterministicTapeRootResetOutput.nonhalting_rejects_terminal

private theorem verified_nonconstantOutputExample :
    ∀ input output,
    (∃ sample, sourceOutput (sourceTerm (CookSeedOutputExample.source input) sample) = some output) ↔ output = !input := DeterministicTapeRootResetOutput.bitToggle_output_iff

private theorem verified_decoderOperations :
    ∀ term,
    (PublicDecoderPrimitive.decode UniversalProgram UniversalDispatcher.tree term).value = UniversalDecoder term ∧
      (PublicDecoderPrimitive.decode UniversalProgram UniversalDispatcher.tree term).operations ≤
        PublicDecoderPrimitive.coefficient UniversalProgram UniversalDispatcher.tree * (term.size + 1)^2 := PrimitiveInterfaceCertificates.primitivePublicDecoder_resource_certificate UniversalProgram UniversalDispatcher.tree

private theorem verified_detectorOperations :
    ∀ term,
    (TermEventPrimitive.observesMarkedCheckpoint UniversalProgram UniversalDispatcher.tree term).value = UniversalDetector term ∧
      (TermEventPrimitive.observesMarkedCheckpoint UniversalProgram UniversalDispatcher.tree term).operations ≤
        TermEventPrimitive.coefficient UniversalProgram UniversalDispatcher.tree * (term.size + 1)^2 := PrimitiveInterfaceCertificates.primitiveMarkedDetector_resource_certificate UniversalProgram UniversalDispatcher.tree

private theorem verified_seedReadbackOperations :
    ∀ term,
    (CheckpointSeedReadbackPrimitive.decode UniversalProgram UniversalDispatcher.tree term).value =
      CheckpointSeedReadback.decode? UniversalProgram UniversalDispatcher.tree term ∧
      (CheckpointSeedReadbackPrimitive.decode UniversalProgram UniversalDispatcher.tree term).operations ≤
        CheckpointSeedReadbackPrimitive.coefficient UniversalProgram UniversalDispatcher.tree * (term.size + 1)^2 := PrimitiveInterfaceCertificates.primitiveSeedReadback_resource_certificate UniversalProgram UniversalDispatcher.tree

private theorem verified_completeOutputOperations :
    ∀ term,
    ((DeterministicTapeOutputPrimitive.row term).value = DeterministicTapePureSOutput.decodeRow? term ∧
      (DeterministicTapeOutputPrimitive.row term).operations ≤ DeterministicTapeOutputQuartic.budget term.size) ∧
    ((DeterministicTapeOutputPrimitive.terminal term).value = DeterministicTapePureSOutput.decodeTerminalRow? term ∧
      (DeterministicTapeOutputPrimitive.terminal term).operations ≤ DeterministicTapeOutputQuartic.budget term.size) ∧
    ((DeterministicTapeOutputPrimitive.scanned term).value = sourceOutput term ∧
      (DeterministicTapeOutputPrimitive.scanned term).operations ≤ DeterministicTapeOutputQuartic.budget term.size) := DeterministicTapeOutputQuartic.complete_output_resource_certificate

/-- The displayed fixed machine and measured interfaces satisfy the complete
root-restarted computation contract, for every word and source instance. -/
theorem sCombinatorIsRootResetComputationUniversal : RootResetComputationUniversality where
  programPeriod := verified_programPeriod
  controllerCoverComplete := verified_controllerCoverComplete
  controllerTextbookAgreement := verified_controllerTextbookAgreement
  freshRootInitialization := verified_freshRootInitialization
  noInterInvocationState := verified_noInterInvocationState
  selectorProjection := verified_selectorProjection
  selectorCoefficientPositive := verified_selectorCoefficientPositive
  selectorMicroticks := verified_selectorMicroticks
  selectorTerminates := verified_selectorTerminates
  selectorTerminalAbsorbing := verified_selectorTerminalAbsorbing
  selectorNormality := verified_selectorNormality
  successfulInvocation := verified_successfulInvocation
  normalInvocation := verified_normalInvocation
  selectorEdgeMoves := verified_selectorEdgeMoves
  realizesEveryInput := verified_realizesEveryInput
  iterationIsCertifiedPath := verified_iterationIsCertifiedPath
  everyInvocationSelectsNext := verified_everyInvocationSelectsNext
  everySampledEdgeIsS := verified_everySampledEdgeIsS
  checkpointsStrictlyIncrease := verified_checkpointsStrictlyIncrease
  exactCTSDecoding := verified_exactCTSDecoding
  paddedEncoderShape := verified_paddedEncoderShape
  sourceInitialization := verified_sourceInitialization
  sourceFreshRootIteration := verified_sourceFreshRootIteration
  completeEncoder := verified_completeEncoder
  encoderPrimitiveRecursive := verified_encoderPrimitiveRecursive
  literalRows := verified_literalRows
  terminalRows := verified_terminalRows
  returnedOutput := verified_returnedOutput
  nonhaltingRejectsTerminal := verified_nonhaltingRejectsTerminal
  nonconstantOutputExample := verified_nonconstantOutputExample
  decoderOperations := verified_decoderOperations
  detectorOperations := verified_detectorOperations
  seedReadbackOperations := verified_seedReadbackOperations
  completeOutputOperations := verified_completeOutputOperations

end PureSFormal.RootResetChallenge
