import PureSFormal.PureS.SchedulerCycle

/-!
# Exact classification of response contraction samples

This module turns the one-for-one structural pairing for a normal-response
script into the decoder/event classification required by the sampled-state
invariant.  The construction callback sees the exact script position, rebuilt
root equality, and mutation grammar witness for each contraction.
-/

namespace PureSFormal.PureS

namespace SchedulerCycle

open FiniteController SchedulerControl SchedulerInvariant
  SchedulerResponseInvariant

namespace ResponseSamplePairs

/--
Classify every paired response contraction at its exact successive global
contraction index.  The callback is deliberately construction-facing: its
arguments are precisely the evidence stored by `ResponseSamplePairs`.
-/
theorem toClassifications
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    ∀ {configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher)}
      {entries : List (Bool × Term)} {sampleIndex : Nat},
      ResponseSamplePairs program dispatcher registers bit bits continuation
        carrier parents configurations entries →
      (∀ (index : Nat)
        (pc : SchedulerControl.ScriptPC program dispatcher
          (.normalResponse (registers.phase, bit)))
        (cursor : Cursor) (done : Bool) (term : Term),
        ControlPosition program dispatcher
          (.script (.normalResponse (registers.phase, bit)) pc registers)
          cursor →
        cursor.erase = Cursor.rebuild parents term →
        ResponseRootMutation program dispatcher.tree
          (dispatcher.route_valid (registers.phase, bit)) bits continuation
          carrier done term →
        DecoderEvidence program dispatcher.tree .frameDispatch cursor.erase ∧
          EventEvidence program dispatcher inputBits (index + 1)
            .frameDispatch cursor.erase) →
      ResponseClassifications program dispatcher inputBits registers bit
        sampleIndex configurations := by
  intro configurations entries sampleIndex pairs classify
  induction pairs generalizing sampleIndex with
  | nil => exact .nil sampleIndex
  | @cons pc cursor done term position eraseEq root configurationTail entryTail
      tail ih =>
      obtain ⟨decoder, event⟩ :=
        classify sampleIndex pc cursor done term position eraseEq root
      exact .cons sampleIndex pc cursor decoder event ih

/--
The classification shared by every nonfinal response mutation.  A completed
outer prefix is enough to lift the local parser failure to the whole bare
term.
-/
theorem intermediateClassification
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (sampleIndex : Nat)
    {term : Term}
    (sample : ResponseRootMutation program dispatcher.tree
      (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
      false term)
    {cursor : Cursor} {layers : Nat}
    (outer : CheckpointExclusion.CompletedPrefix program dispatcher.tree
      cursor.erase term layers) :
    DecoderEvidence program dispatcher.tree .frameDispatch cursor.erase ∧
      EventEvidence program dispatcher inputBits (sampleIndex + 1)
        .frameDispatch cursor.erase := by
  let silent : SilentEvidence program dispatcher.tree .frameDispatch
      cursor.erase := .ofState (.endpointFailure outer
        (sample.failure hadmissible snapshotInv rfl))
  exact ⟨.silent silent, .silent silent⟩

/--
Every response contraction below a positive canonical pending-frame stack is
silent, including the completed response mutation at the end of the script.
-/
theorem pendingClassification
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (continuation : Term)
    (sampleIndex depth : Nat) (positive : depth ≠ 0)
    {term : Term} {cursor : Cursor}
    (eraseEq : cursor.erase = Cursor.rebuild
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation depth []) term) :
    DecoderEvidence program dispatcher.tree .frameDispatch cursor.erase ∧
      EventEvidence program dispatcher inputBits (sampleIndex + 1)
        .frameDispatch cursor.erase := by
  have failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      cursor.erase := by
    rw [eraseEq]
    exact pendingParents_failure program dispatcher seedBits continuation term
      depth positive
  let silent : SilentEvidence program dispatcher.tree .frameDispatch
      cursor.erase := .ofEndpointFailure failure
  exact ⟨.silent silent, .silent silent⟩

/-- Root-level specialization of `intermediateClassification`. -/
theorem rootIntermediateClassification
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (sampleIndex : Nat) {term : Term}
    (sample : ResponseRootMutation program dispatcher.tree
      (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
      false term) :
    DecoderEvidence program dispatcher.tree .frameDispatch term ∧
      EventEvidence program dispatcher inputBits (sampleIndex + 1)
        .frameDispatch term := by
  have classified := intermediateClassification program dispatcher inputBits
    registers bit bits continuation carrier hadmissible snapshotInv sampleIndex
    sample (cursor := Cursor.atRoot term) (.here term)
  simpa using classified

/--
The classification at the unique public terminal response mutation.  The
stored positive-prefix certificate fixes the contraction index as well as the
decoded checkpoint value.
-/
theorem terminalClassification
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleIndex offset : Nat)
    {cursor : Cursor} {result : CheckpointDecoder.PositiveView program}
    (terminal : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .fresh result cursor.erase)
    {activeContext : Context} {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      (offset + 1) cursor.erase
      (ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) activeContext chain)
    (indexEq : sampleIndex + 1 =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) :
    DecoderEvidence program dispatcher.tree .frameDispatch cursor.erase ∧
      EventEvidence program dispatcher inputBits (sampleIndex + 1)
        .frameDispatch cursor.erase :=
  ⟨.public (.frameTerminal terminal), .positive offset certificate indexEq⟩

end ResponseSamplePairs

end SchedulerCycle

end PureSFormal.PureS
