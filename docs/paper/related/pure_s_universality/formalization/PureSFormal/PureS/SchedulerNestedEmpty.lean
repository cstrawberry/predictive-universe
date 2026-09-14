import PureSFormal.PureS.SchedulerNestedResponse
import PureSFormal.PureS.SchedulerTraceAlgebra

/-!
# Absorbing-empty jobs below completed Local prefixes

This module follows an empty Base through its canonical cursor-only descent,
the finite sequence of zero-action EMPTY frames, and the final continuation.
Every contraction is listed by the executable `seekMutation` relation.  A
nonfinal arity-three continuation exposes the next bounded job; a terminal
arity-four continuation preserves the marked checkpoint while entering the
next stage clock.
-/

namespace PureSFormal.PureS

namespace SchedulerNestedEmpty

open FiniteController SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext

open SchedulerTraceAlgebra

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  SchedulerInvariant.Configuration program dispatcher

/-! ## Exact zero-action response samples -/

/-- One-for-one pairing between EMPTY-script samples and the common response
root grammar. -/
inductive EmptyResponseSamplePairs
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    List (Configuration program dispatcher) -> List (Bool × Term) -> Prop where
  | nil : EmptyResponseSamplePairs program dispatcher registers bits
      continuation carrier parents [] []
  | cons
      (pc : SchedulerControl.ScriptPC program dispatcher
        (.emptyResponse (registers.phase, false)))
      (cursor : Cursor) (done : Bool) (term : Term)
      (position : ControlPosition program dispatcher
        (.script (.emptyResponse (registers.phase, false)) pc registers) cursor)
      (eraseEq : cursor.erase = Cursor.rebuild parents term)
      (root : ResponseRootMutation program dispatcher.tree
        (dispatcher.route_valid (registers.phase, false)) bits continuation
        carrier done term)
      {configurationTail : List (Configuration program dispatcher)}
      {entryTail : List (Bool × Term)}
      (tail : EmptyResponseSamplePairs program dispatcher registers bits
        continuation carrier parents configurationTail entryTail) :
      EmptyResponseSamplePairs program dispatcher registers bits continuation
        carrier parents
        (⟨some (.script (.emptyResponse (registers.phase, false)) pc registers),
          cursor⟩ :: configurationTail)
        ((done, term) :: entryTail)

namespace EmptyResponseSamplePairs

@[simp]
theorem length_eq
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {registers : Registers program} {bits : List Bool}
    {continuation carrier : Term} {parents : List ParentFrame}
    {configurations : List (Configuration program dispatcher)}
    {entries : List (Bool × Term)}
    (pairs : EmptyResponseSamplePairs program dispatcher registers bits
      continuation carrier parents configurations entries) :
    configurations.length = entries.length := by
  induction pairs with
  | nil => rfl
  | cons _ _ _ _ _ _ _ tail ih => simp [ih]

/-- Convert the generic positioned-script trace into the EMPTY-specific
response pairing. -/
theorem ofPositioned
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    forall {configurations : List (Configuration program dispatcher)}
      {entries : List (Bool × Term)},
      PositionedSamples program dispatcher
          (.emptyResponse (registers.phase, false)) registers configurations ->
      configurations.map (fun configuration => configuration.cursor.erase) =
        entries.map (fun entry => Cursor.rebuild parents entry.2) ->
      (forall {done term}, (done, term) ∈ entries ->
        ResponseRootMutation program dispatcher.tree
          (dispatcher.route_valid (registers.phase, false)) bits continuation
          carrier done term) ->
      EmptyResponseSamplePairs program dispatcher registers bits continuation
        carrier parents configurations entries
  | [], [], .nil, _, _ => .nil
  | [], _ :: _, .nil, rootsEq, _ => by
      simp only [List.map] at rootsEq
      contradiction
  | _ :: _, [], .cons pc cursor position tail, rootsEq, _ => by
      simp only [List.map] at rootsEq
      contradiction
  | _, (done, term) :: entries,
      .cons pc cursor position tail, rootsEq, spec => by
      simp only [List.map, List.cons.injEq] at rootsEq
      exact .cons pc cursor done term position rootsEq.1
        (spec (List.Mem.head entries))
        (ofPositioned program dispatcher registers bits continuation carrier
          parents tail rootsEq.2
          (fun member => spec (List.Mem.tail (done, term) member)))

end EmptyResponseSamplePairs

/-- The EMPTY response compiler has the exact common structural sample list,
but retains its own runtime family and epsilon endpoint. -/
theorem emptyResponse_exactPairedMutationChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markStartConfiguration program dispatcher registers bits
          continuation carrier parents)
        (SchedulerEmpty.responseStartConfiguration program dispatcher registers
          bits continuation carrier parents)
        configurations /\
      EmptyResponseSamplePairs program dispatcher registers bits continuation
        carrier parents configurations
        (responseEntries program
          (dispatcher.route_valid (registers.phase, false)) bits continuation
          carrier) := by
  obtain ⟨cursorSamples, trace, roots⟩ :=
    normalResponse_canonicalMutationTrace program
      (dispatcher.route_valid (registers.phase, false)) bits continuation carrier
      parents
  obtain ⟨configurations, cursorsEq, chain, positions⟩ :=
    scriptTrace_exactPositionedMutationChain program dispatcher
      (.emptyResponse (registers.phase, false)) registers
      (SchedulerResponse.frameCursor program dispatcher bits continuation
        carrier parents) trace
      (SchedulerControl.firstScriptPC program dispatcher
        (.emptyResponse (registers.phase, false))) (by rfl) (by rfl) (by
          simp [SchedulerControl.firstScriptPC])
  have erased : configurations.map
      (fun configuration => configuration.cursor.erase) =
      (responseEntries program
        (dispatcher.route_valid (registers.phase, false)) bits continuation
        carrier).map (fun entry => Cursor.rebuild parents entry.2) := by
    calc
      configurations.map (fun configuration => configuration.cursor.erase) =
          cursorSamples.map Cursor.erase := by
        simpa [List.map_map] using! congrArg (List.map Cursor.erase) cursorsEq
      _ = _ := roots
  refine ⟨configurations, ?_, ?_⟩
  · simpa [SchedulerEmpty.responseStartConfiguration,
      SchedulerEmpty.markStartConfiguration, SchedulerEmpty.completedCursor,
      SchedulerControl.jobScript_emptyResponse,
      SchedulerResponse.completedRoute] using! chain
  · exact EmptyResponseSamplePairs.ofPositioned program dispatcher registers
      bits continuation carrier parents positions erased
      (fun member => responseEntries_spec program
        (dispatcher.route_valid (registers.phase, false)) bits continuation
        carrier member)

/-! ## Simultaneous invariant at EMPTY-script samples -/

/-- A structurally paired EMPTY response sample satisfies the simultaneous
invariant once its decoder classification is supplied. -/
theorem emptyResponseScript_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {done : Bool} {term : Term}
    (root : ResponseRootMutation program dispatcher.tree
      (dispatcher.route_valid (registers.phase, false)) bits continuation
      carrier done term)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    {pc : SchedulerControl.ScriptPC program dispatcher
      (.emptyResponse (registers.phase, false))}
    {cursor : Cursor}
    (position : ControlPosition program dispatcher
      (.script (.emptyResponse (registers.phase, false)) pc registers) cursor)
    (eraseEq : cursor.erase = Cursor.rebuild parents term)
    {phase : CTS.Phase program} {scanned : List Bool}
    (coherent : RegistersCoherent registers phase scanned true)
    (decoder : DecoderEvidence program dispatcher.tree .empty cursor.erase) :
    Holds program dispatcher
      ⟨some (.script (.emptyResponse (registers.phase, false)) pc registers),
        cursor⟩ := by
  have audit : AuditedOccurrence program dispatcher.tree cursor.erase := by
    rw [eraseEq]
    exact root.auditedOccurrence snapshotInv parents
  exact .intro
    (.script (.emptyResponse (registers.phase, false)) pc registers) rfl
    phase scanned true coherent position (.empty decoder audit)

/-- Pointwise sampled states for an EMPTY response from a caller-supplied
silent classification of each paired root. -/
theorem EmptyResponseSamplePairs.toIndexedSampledStates
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame)
    {phase : CTS.Phase program} {scanned : List Bool}
    (coherent : RegistersCoherent registers phase scanned true)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier) :
    forall {configurations : List (Configuration program dispatcher)}
      {entries : List (Bool × Term)} {sampleIndex : Nat},
      EmptyResponseSamplePairs program dispatcher registers bits continuation
        carrier parents configurations entries ->
      (forall (index : Nat)
        (pc : SchedulerControl.ScriptPC program dispatcher
          (.emptyResponse (registers.phase, false)))
        (cursor : Cursor) (done : Bool) (term : Term),
        ControlPosition program dispatcher
          (.script (.emptyResponse (registers.phase, false)) pc registers)
          cursor ->
        cursor.erase = Cursor.rebuild parents term ->
        ResponseRootMutation program dispatcher.tree
          (dispatcher.route_valid (registers.phase, false)) bits continuation
          carrier done term ->
        SilentEvidence program dispatcher.tree .empty cursor.erase) ->
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations := by
  intro configurations entries sampleIndex pairs classify
  induction pairs generalizing sampleIndex with
  | nil => exact .nil sampleIndex
  | @cons pc cursor done term position eraseEq root configurationTail entryTail
      tail ih =>
      have silent := classify sampleIndex pc cursor done term position eraseEq root
      have holds := emptyResponseScript_holds program dispatcher registers bits
        continuation carrier parents root snapshotInv position eraseEq coherent
        (.silent silent)
      exact .cons sampleIndex
        (SampledState.ofSilent
          (.script (.emptyResponse (registers.phase, false)) pc registers)
          holds rfl silent)
        ih

/-! ## Empty Base entry below arbitrary completed parents -/

/-- The register bank at the first absorbing-EMPTY frame of a newly launched
job whose encoded queue is empty. -/
def initialEmptyRegisters (program : CTS.Program) : Registers program :=
  SchedulerCycle.enteredEmptyRegisters (Registers.newJob program).clearScan

/-- The empty-mode register bank at Base entry represents the zero phase, an
empty scan, and the absorbing flag. -/
theorem initialEmptyRegisters_coherent (program : CTS.Program) :
    RegistersCoherent (initialEmptyRegisters program) (CTS.zeroPhase program)
      [] true := by
  exact ⟨rfl, rfl, rfl, rfl, rfl⟩

/-- From the last Base-producing fuel sample of an empty job, the controller
performs only cursor moves until it reaches the innermost EMPTY frame.  The
statement is parametric in the continuation and every completed outer parent.
-/
theorem emptyBase_toFirstFrame_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (depth : Nat) (outerParents : List ParentFrame) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) []
    exists ticks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (fuelZeroFifthMutationConfiguration program dispatcher
          (Registers.newJob program) environment continuation
          (PrimitiveFuel.pendingParents environment continuation (depth + 1)
            outerParents))
        (SchedulerEmpty.frameConfiguration program dispatcher
          (initialEmptyRegisters program) [] continuation
          (baseCarrier environment continuation)
          (PrimitiveFuel.pendingParents environment continuation depth
            outerParents)) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) []
  let fullParents := PrimitiveFuel.pendingParents environment continuation
    (depth + 1) outerParents
  let restParents := PrimitiveFuel.pendingParents environment continuation depth
    outerParents
  obtain ⟨baseContext, descent⟩ :=
    SchedulerNestedResponse.baseCarrier_descent program dispatcher []
      continuation
  have suffix := fuelZeroSampleSuffix_zeroRun program dispatcher
    (Registers.newJob program) environment continuation fullParents
  obtain ⟨downTicks, downRun⟩ := SchedulerDescent.run_downDescent
    (Registers.newJob program).clearScan descent fullParents
  have registered := SchedulerAscent.RegisteredContext.ofDescentEmpty
    hadmissible descent
  obtain ⟨upTicks, upRun⟩ := SchedulerAscent.run_registeredContext program
    dispatcher (Registers.newJob program).clearScan registered fullParents
  have parentEq : fullParents =
      .right (SchedulerResponse.pendingFunction program dispatcher []
        continuation) :: restParents := by
    simpa [fullParents, restParents, environment,
      SchedulerResponse.pendingFunction,
      PendingFrame.environmentCode_eq_envelope,
      PendingFrame.frameFunction] using
      (SchedulerCycle.pendingParents_succ_cons environment continuation depth
        outerParents)
  have upRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) upTicks
      (upConfiguration program dispatcher (Registers.newJob program).clearScan
        omega (ContextCursor.frames baseContext omega fullParents))
      (upConfiguration program dispatcher (Registers.newJob program).clearScan
        (baseCarrier environment continuation) fullParents) := by
    simpa [environment, CanonicalTraversal.Descent.source_eq descent] using upRun
  have downRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) downTicks
      (fuelPhaseCompletedConfiguration program dispatcher
        (Registers.newJob program) 0 environment continuation fullParents)
      (upConfiguration program dispatcher (Registers.newJob program).clearScan
        omega (ContextCursor.frames baseContext omega fullParents)) := by
    constructor
    · simpa [fuelPhaseCompletedConfiguration, PrimitiveFuel.pendingParents,
        environment] using! downRun.run_eq
    · simpa [fuelPhaseCompletedConfiguration, PrimitiveFuel.pendingParents,
        environment] using downRun.count_eq
  have notSeen : (Registers.newJob program).clearScan.seen = false := rfl
  have enter := SchedulerCycle.pendingFrameEmpty_zeroRun program dispatcher
    (Registers.newJob program).clearScan [] continuation
    (baseCarrier environment continuation) restParents notSeen
  have enter' : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerAscent.pendingFrameDispatchTicks program dispatcher haltCode
        (compileActions program dispatcher.tree) (word []) continuation
        (baseCarrier environment continuation) restParents)
      (upConfiguration program dispatcher (Registers.newJob program).clearScan
        (baseCarrier environment continuation) fullParents)
      (SchedulerEmpty.frameConfiguration program dispatcher
        (initialEmptyRegisters program) [] continuation
        (baseCarrier environment continuation) restParents) := by
    rw [parentEq]
    simpa [initialEmptyRegisters] using enter
  refine ⟨1 + downTicks + upTicks +
      SchedulerAscent.pendingFrameDispatchTicks program dispatcher haltCode
        (compileActions program dispatcher.tree) (word []) continuation
        (baseCarrier environment continuation) restParents, ?_⟩
  have combined := ((suffix.trans downRun').trans upRun').trans enter'
  simpa [environment, fullParents, restParents, Nat.add_assoc] using combined

/-! ## One complete EMPTY frame -/

/-- Exact mutation samples of one EMPTY frame: every zero-action response
sample followed by the unique marker sample.  Classifications are arguments
because pending, nonfinal, and horizon-ending frames have different public
decoder status while sharing the same controller execution. -/
theorem emptyFrameSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {phase : CTS.Phase program} {scanned : List Bool}
    (coherent : RegistersCoherent registers phase scanned true)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (sampleIndex : Nat)
    (classify : forall (index : Nat)
        (pc : SchedulerControl.ScriptPC program dispatcher
          (.emptyResponse (registers.phase, false)))
        (cursor : Cursor) (done : Bool) (term : Term),
        ControlPosition program dispatcher
          (.script (.emptyResponse (registers.phase, false)) pc registers)
          cursor ->
        cursor.erase = Cursor.rebuild parents term ->
        ResponseRootMutation program dispatcher.tree
          (dispatcher.route_valid (registers.phase, false)) bits continuation
          carrier done term ->
        SilentEvidence program dispatcher.tree .empty cursor.erase)
    (markerSample : SampledState program dispatcher inputBits
      (sampleIndex +
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1)
      (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
        dispatcher registers bits continuation carrier parents)) :
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
          bits continuation carrier parents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier parents) configurations /\
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations /\
      configurations.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1 := by
  obtain ⟨responseConfigurations, responseChain, pairs⟩ :=
    emptyResponse_exactPairedMutationChain program dispatcher registers bits
      continuation carrier parents
  have responseSampled := pairs.toIndexedSampledStates program dispatcher
    inputBits registers bits continuation carrier parents coherent snapshotInv
    (sampleIndex := sampleIndex) classify
  have responseLength : responseConfigurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, false))
        (registers.phase, false) := by
    exact pairs.length_eq.trans
      (responseEntries_length program
        (dispatcher.route_valid (registers.phase, false)) bits continuation
        carrier)
  let marker :=
    SchedulerRootContinuation.emptyMarkerMutationConfiguration program
      dispatcher registers bits continuation carrier parents
  have markerChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
        bits continuation carrier parents)
      (SchedulerEmpty.markStartConfiguration program dispatcher registers bits
        continuation carrier parents) [marker] := by
    exact .next 4
      (by simpa [marker] using
        (SchedulerRootContinuation.emptyMarkStart_seekMutation program dispatcher
          registers bits continuation carrier parents))
      (.done 4 (by simpa [marker] using
        (SchedulerRootContinuation.emptyMarkerSuffix_zeroRun program dispatcher
          registers bits continuation carrier parents)))
  have entered := SchedulerEmpty.enterResponse_zeroRun program dispatcher
    registers bits continuation carrier parents
  have wholeChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
        bits continuation carrier parents)
      (SchedulerEmpty.frameConfiguration program dispatcher registers bits
        continuation carrier parents)
      (responseConfigurations ++ [marker]) :=
    ExactMutationChain.prepend entered
      (SchedulerRecurrence.ExactMutationChain.append responseChain markerChain)
  have markerSample' : SampledState program dispatcher inputBits
      ((sampleIndex + responseConfigurations.length) + 1) marker := by
    rw [responseLength]
    simpa [marker, Nat.add_assoc] using markerSample
  have markerIndexed : IndexedResponseSampledStates program dispatcher inputBits
      (sampleIndex + responseConfigurations.length) [marker] :=
    .cons (sampleIndex + responseConfigurations.length) markerSample'
      (.nil ((sampleIndex + responseConfigurations.length) + 1))
  have wholeSampled := SchedulerNestedPhase.IndexedResponseSampledStates.append
    program dispatcher inputBits responseSampled markerIndexed
  refine ⟨responseConfigurations ++ [marker], wholeChain, wholeSampled, ?_⟩
  simp [responseLength]

/-- The execution-only form of one EMPTY frame.  It lists the same response
mutations and final marker as `emptyFrameSegment`, but deliberately postpones
the marker's semantic classification so a global positive-prefix certificate
can be constructed from the resulting exact chain without circularity. -/
theorem emptyFrameExactMutationChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    let marker :=
      SchedulerRootContinuation.emptyMarkerMutationConfiguration program
        dispatcher registers bits continuation carrier parents
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
          bits continuation carrier parents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier parents) configurations /\
      configurations.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1 /\
      LastSample configurations marker := by
  let marker :=
    SchedulerRootContinuation.emptyMarkerMutationConfiguration program
      dispatcher registers bits continuation carrier parents
  obtain ⟨responseConfigurations, responseChain, pairs⟩ :=
    emptyResponse_exactPairedMutationChain program dispatcher registers bits
      continuation carrier parents
  have responseLength : responseConfigurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, false))
        (registers.phase, false) := by
    exact pairs.length_eq.trans
      (responseEntries_length program
        (dispatcher.route_valid (registers.phase, false)) bits continuation
        carrier)
  have markerChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
        bits continuation carrier parents)
      (SchedulerEmpty.markStartConfiguration program dispatcher registers bits
        continuation carrier parents) [marker] := by
    exact .next 4
      (by simpa [marker] using
        (SchedulerRootContinuation.emptyMarkStart_seekMutation program dispatcher
          registers bits continuation carrier parents))
      (.done 4 (by simpa [marker] using
        (SchedulerRootContinuation.emptyMarkerSuffix_zeroRun program dispatcher
          registers bits continuation carrier parents)))
  have entered := SchedulerEmpty.enterResponse_zeroRun program dispatcher
    registers bits continuation carrier parents
  have wholeChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
        bits continuation carrier parents)
      (SchedulerEmpty.frameConfiguration program dispatcher registers bits
        continuation carrier parents)
      (responseConfigurations ++ [marker]) :=
    ExactMutationChain.prepend entered
      (SchedulerRecurrence.ExactMutationChain.append responseChain markerChain)
  exact ⟨responseConfigurations ++ [marker], wholeChain, by
      simp [responseLength],
    LastSample.appendLeft responseConfigurations (.one marker)⟩

/-- Raw EMPTY-frame execution with every pre-marker response already sampled.
The marker remains a literal singleton suffix, so a caller may first construct
the global positive certificate and then append precisely that one sample. -/
theorem emptyFrameExactWithSampledPrefix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {phase : CTS.Phase program} {scanned : List Bool}
    (coherent : RegistersCoherent registers phase scanned true)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (sampleIndex : Nat)
    (classify : forall (index : Nat)
        (pc : SchedulerControl.ScriptPC program dispatcher
          (.emptyResponse (registers.phase, false)))
        (cursor : Cursor) (done : Bool) (term : Term),
        ControlPosition program dispatcher
          (.script (.emptyResponse (registers.phase, false)) pc registers)
          cursor ->
        cursor.erase = Cursor.rebuild parents term ->
        ResponseRootMutation program dispatcher.tree
          (dispatcher.route_valid (registers.phase, false)) bits continuation
          carrier done term ->
        SilentEvidence program dispatcher.tree .empty cursor.erase) :
    let marker :=
      SchedulerRootContinuation.emptyMarkerMutationConfiguration program
        dispatcher registers bits continuation carrier parents
    exists prefixConfigurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
          bits continuation carrier parents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier parents) (prefixConfigurations ++ [marker]) /\
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        prefixConfigurations /\
      prefixConfigurations.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) /\
      LastSample (prefixConfigurations ++ [marker]) marker := by
  let marker :=
    SchedulerRootContinuation.emptyMarkerMutationConfiguration program
      dispatcher registers bits continuation carrier parents
  obtain ⟨responseConfigurations, responseChain, pairs⟩ :=
    emptyResponse_exactPairedMutationChain program dispatcher registers bits
      continuation carrier parents
  have responseSampled := pairs.toIndexedSampledStates program dispatcher
    inputBits registers bits continuation carrier parents coherent snapshotInv
    (sampleIndex := sampleIndex) classify
  have responseLength : responseConfigurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, false))
        (registers.phase, false) := by
    exact pairs.length_eq.trans
      (responseEntries_length program
        (dispatcher.route_valid (registers.phase, false)) bits continuation
        carrier)
  have markerChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
        bits continuation carrier parents)
      (SchedulerEmpty.markStartConfiguration program dispatcher registers bits
        continuation carrier parents) [marker] := by
    exact .next 4
      (by simpa [marker] using
        (SchedulerRootContinuation.emptyMarkStart_seekMutation program dispatcher
          registers bits continuation carrier parents))
      (.done 4 (by simpa [marker] using
        (SchedulerRootContinuation.emptyMarkerSuffix_zeroRun program dispatcher
          registers bits continuation carrier parents)))
  have entered := SchedulerEmpty.enterResponse_zeroRun program dispatcher
    registers bits continuation carrier parents
  have wholeChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
        bits continuation carrier parents)
      (SchedulerEmpty.frameConfiguration program dispatcher registers bits
        continuation carrier parents)
      (responseConfigurations ++ [marker]) :=
    ExactMutationChain.prepend entered
      (SchedulerRecurrence.ExactMutationChain.append responseChain markerChain)
  exact ⟨responseConfigurations, wholeChain, responseSampled, responseLength,
    LastSample.appendLeft responseConfigurations (.one marker)⟩

/-! ## Silent pending EMPTY frames -/

/-- The marker-script contraction has the simultaneous invariant for either a
silent or an accepted decoder classification.  This is the family-generic
form of the terminal-marker lemma used by the recursive pending sweep. -/
theorem emptyMarker_holdsWith
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {phase : CTS.Phase program} {scanned : List Bool}
    (coherent : RegistersCoherent registers phase scanned true)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (decoder : DecoderEvidence program dispatcher.tree .empty
      (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
        dispatcher registers bits continuation carrier parents).cursor.erase) :
    Holds program dispatcher
      (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
        dispatcher registers bits continuation carrier parents) := by
  let completed := SchedulerEmpty.completedCursor program dispatcher registers
    bits continuation carrier parents
  let marked := SchedulerEmpty.markedCursor program dispatcher registers bits
    continuation carrier parents
  let sample := SchedulerRootContinuation.emptyMarkerCursor program dispatcher
    registers bits continuation carrier parents
  have prefixRun : Script.run
      (List.take 4 (SchedulerControl.jobScript program dispatcher .markEmpty))
      completed = some sample := by
    rfl
  have suffixRun : Script.run
      (List.drop 4 (SchedulerControl.jobScript program dispatcher .markEmpty))
      sample = some marked := by
    rfl
  have safe : CommandSafe sample
      (SchedulerControl.transition program dispatcher
        (.script .markEmpty ⟨4, by
          simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
        (Probe.observeNode sample) (Probe.observeIncoming sample)) := by
    exact ⟨_, rfl⟩
  have position : ControlPosition program dispatcher
      (.script .markEmpty ⟨4, by
        simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
      sample :=
    .script prefixRun suffixRun safe
  let markedTerm := LocalResponse.markedCompleted bits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher registers false carrier)
  have markedInv : ReachableAudit.Holds program dispatcher.tree bits continuation
      markedTerm :=
    SchedulerEmpty.marked_holds program dispatcher registers bits continuation
      carrier snapshotInv
  have audit : AuditedOccurrence program dispatcher.tree sample.erase := by
    refine .intro bits continuation markedTerm
      (SchedulerInvariant.contextOfParents parents) markedInv ?_
    have sampleErase : sample.erase =
        (SchedulerEmpty.markedCursor program dispatcher registers bits
          continuation carrier parents).erase := by
      simpa [sample] using!
        SchedulerRootContinuation.emptyMarkerMutation_erase program dispatcher
          registers bits continuation carrier parents
    rw [sampleErase]
    change Cursor.rebuild parents markedTerm =
      (SchedulerInvariant.contextOfParents parents).plug markedTerm
    exact (SchedulerInvariant.contextOfParents_plug parents markedTerm).symm
  exact .intro
    (.script .markEmpty ⟨4, by
      simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
    rfl phase scanned true coherent position (.empty decoder audit)

/-- A marker below a positive pending-frame stack is a silent sampled state at
the named global contraction index. -/
theorem pendingEmptyMarker_sampled
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleNumber : Nat)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (depth : Nat) (positive : depth ≠ 0)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program} {scanned : List Bool}
    (coherent : RegistersCoherent registers phase scanned true)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier) :
    SampledState program dispatcher inputBits sampleNumber
      (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
        dispatcher registers bits continuation carrier
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation depth outerParents)) := by
  let parents := PrimitiveFuel.pendingParents
    (environmentCode (compileActions program dispatcher.tree) bits)
    continuation depth outerParents
  let marker := SchedulerRootContinuation.emptyMarkerMutationConfiguration
    program dispatcher registers bits continuation carrier parents
  let markedTerm := LocalResponse.markedCompleted bits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher registers false carrier)
  have silent : SilentEvidence program dispatcher.tree .empty
      marker.cursor.erase := by
    rw [show marker.cursor.erase = Cursor.rebuild parents markedTerm by
      simpa [marker, markedTerm] using!
        SchedulerRootContinuation.emptyMarkerMutation_erase program dispatcher
          registers bits continuation carrier parents]
    exact outer.pendingSilent .empty bits continuation markedTerm depth positive
  have holds := emptyMarker_holdsWith program dispatcher registers bits
    continuation carrier parents coherent snapshotInv (.silent silent)
  exact SampledState.ofSilent
    (.script .markEmpty ⟨4, by
      simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
    holds rfl silent

/-- One complete EMPTY frame below a positive pending stack, including its
marker, is entirely silent and has its exact mutation count. -/
theorem pendingEmptyFrameSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (depth sampleIndex : Nat)
    (positive : depth ≠ 0) (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program} {scanned : List Bool}
    (coherent : RegistersCoherent registers phase scanned true)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier) :
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
          bits continuation carrier
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth outerParents))
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth outerParents)) configurations /\
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations /\
      configurations.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1 := by
  let parents := PrimitiveFuel.pendingParents
    (environmentCode (compileActions program dispatcher.tree) bits)
    continuation depth outerParents
  have markerSample := pendingEmptyMarker_sampled program dispatcher inputBits
    (sampleIndex +
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, false))
        (registers.phase, false) + 1)
    registers bits continuation carrier depth positive outerParents layers outer
    coherent snapshotInv
  apply emptyFrameSegment program dispatcher inputBits registers bits
    continuation carrier parents coherent snapshotInv sampleIndex
  · intro index pc cursor done term position eraseEq root
    rw [eraseEq]
    exact outer.pendingSilent .empty bits continuation term depth positive
  · simpa [parents] using markerSample

/-! ## Recursive pending-frame sweep -/

/-- Exact, fully classified sweep of an arbitrary number of pending EMPTY
frames below a completed outer prefix.  The terminal (non-pending) frame is
left unexecuted for the continuation-specific theorem. -/
theorem pendingEmptySweepSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (bits : List Bool) (continuation : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    forall (count sampleIndex : Nat) (registers : Registers program)
      (carrier : Term) (phase : CTS.Phase program)
      (coherent : RegistersCoherent registers phase [] true)
      (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
        continuation carrier),
      exists configurations : List (Configuration program dispatcher),
        ExactMutationChain (SchedulerControl.machine program dispatcher)
          (SchedulerEmpty.frameConfiguration program dispatcher
            (SchedulerCycle.emptySweepRegisters program count registers) bits
            continuation
            (SchedulerCycle.emptySweepCarrier program dispatcher bits
              continuation count registers carrier) outerParents)
          (SchedulerEmpty.frameConfiguration program dispatcher registers bits
            continuation carrier
            (PrimitiveFuel.pendingParents
              (environmentCode (compileActions program dispatcher.tree) bits)
              continuation count outerParents)) configurations /\
        IndexedResponseSampledStates program dispatcher inputBits sampleIndex
          configurations /\
        configurations.length =
          SchedulerCycle.emptySweepMutations program dispatcher count registers
  | 0, sampleIndex, registers, carrier, phase, coherent, snapshotInv => by
      refine ⟨[], ?_, .nil sampleIndex, rfl⟩
      exact .done 0 ⟨rfl, rfl⟩
  | count + 1, sampleIndex, registers, carrier, phase, coherent,
      snapshotInv => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let nextCarrier := LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers false
          carrier)
      let remainingParents := PrimitiveFuel.pendingParents environment
        continuation count outerParents
      let fullParents := PrimitiveFuel.pendingParents environment continuation
        (count + 1) outerParents
      obtain ⟨firstConfigurations, firstChain, firstSampled, firstLength⟩ :=
        pendingEmptyFrameSegment program dispatcher inputBits registers bits
          continuation carrier (count + 1) sampleIndex (Nat.succ_ne_zero count)
          outerParents layers outer coherent snapshotInv
      have parentEq : fullParents =
          .right (SchedulerResponse.pendingFunction program dispatcher bits
            continuation) :: remainingParents := by
        simpa [fullParents, remainingParents, environment,
          SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope,
          PendingFrame.frameFunction] using
          (SchedulerCycle.pendingParents_succ_cons environment continuation count
            outerParents)
      have pendingRaw := SchedulerEmpty.pending_zeroRun program dispatcher
        registers.advanceEmpty bits continuation nextCarrier remainingParents
      have pending : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
              (.pending .emptyReturn)
              (SchedulerResponse.pendingChildCursor program dispatcher bits
                continuation nextCarrier remainingParents) + 1)
          (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
            bits continuation carrier fullParents)
          (SchedulerEmpty.frameConfiguration program dispatcher
            registers.advanceEmpty bits continuation nextCarrier
            remainingParents) := by
        rw [parentEq]
        simpa [nextCarrier, SchedulerEmpty.markedPendingConfiguration,
          SchedulerEmpty.markedCursor, SchedulerEmpty.nextFrameConfiguration,
          SchedulerEmpty.frameConfiguration,
          SchedulerEmpty.pendingProbeConfiguration,
          SchedulerResponse.pendingChildCursor,
          SchedulerResponse.pendingFunction] using! pendingRaw
      have nextCoherent : RegistersCoherent registers.advanceEmpty
          (CTS.nextPhase program phase) [] true := coherent.advanceEmpty
      have nextSnapshot : ReachableAudit.Holds program dispatcher.tree bits
          continuation nextCarrier := by
        exact SchedulerEmpty.marked_holds program dispatcher registers bits
          continuation carrier snapshotInv
      obtain ⟨restConfigurations, restChain, restSampled, restLength⟩ :=
        pendingEmptySweepSegment program dispatcher inputBits bits continuation
          outerParents layers outer count (sampleIndex +
            firstConfigurations.length) registers.advanceEmpty nextCarrier
          (CTS.nextPhase program phase) nextCoherent nextSnapshot
      have linkedRest : ExactMutationChain
          (SchedulerControl.machine program dispatcher)
          (SchedulerEmpty.frameConfiguration program dispatcher
            (SchedulerCycle.emptySweepRegisters program count
              registers.advanceEmpty) bits continuation
            (SchedulerCycle.emptySweepCarrier program dispatcher bits
              continuation count registers.advanceEmpty nextCarrier)
            outerParents)
          (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
            bits continuation carrier fullParents) restConfigurations :=
        ExactMutationChain.prepend pending restChain
      have chain := SchedulerRecurrence.ExactMutationChain.append firstChain
        linkedRest
      have sampled := SchedulerNestedPhase.IndexedResponseSampledStates.append
        program dispatcher inputBits firstSampled restSampled
      refine ⟨firstConfigurations ++ restConfigurations, ?_, sampled, ?_⟩
      · simpa [environment, fullParents, remainingParents, nextCarrier,
          SchedulerCycle.emptySweepRegisters,
          SchedulerCycle.emptySweepCarrier] using chain
      · simp only [List.length_append]
        rw [firstLength, restLength]
        simp [SchedulerCycle.emptySweepMutations, Nat.add_assoc]

/-! ## Terminal-frame decoder classifications -/

/-- A response mutation in a terminal EMPTY frame is silent when its literal
continuation is a nonterminal clock exit.  Intermediate roots fail locally;
the completed root extends the certified Local prefix and fails at that
continuation endpoint. -/
theorem emptyResponse_nonterminalSilent
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      continuation)
    {cursor : Cursor} {done : Bool} {term : Term}
    (eraseEq : cursor.erase = Cursor.rebuild outerParents term)
    (root : ResponseRootMutation program dispatcher.tree
      (dispatcher.route_valid (registers.phase, false)) bits continuation
      carrier done term) :
    SilentEvidence program dispatcher.tree .empty cursor.erase := by
  cases done with
  | false =>
      have prefixShape : CheckpointExclusion.CompletedPrefix program
          dispatcher.tree cursor.erase term layers := by
        rw [eraseEq]
        exact outer.prefix term
      exact .ofState (.endpointFailure prefixShape
        (root.failure hadmissible snapshotInv rfl))
  | true =>
      have completedEq : term =
          LocalResponse.completed bits continuation carrier
            (SchedulerResponse.completedRoute program dispatcher registers false
              carrier) := by
        simpa [SchedulerResponse.completedRoute] using root.done_eq rfl
      have extended := outer.fresh registers false bits carrier
      rw [eraseEq, completedEq]
      rw [← CompletedParents.rebuild_freshContinuationParents program dispatcher
        registers false bits carrier continuation outerParents]
      exact extended.silentOfFailure .empty failure

/-- Before the required marker contraction, the final completed empty Local is
publicly rejected by `emptyPreMarker`; every earlier response root fails under
the existing completed prefix. -/
theorem emptyResponse_preMarkerSilent
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (preMarker : CheckpointExclusion.PreMarkerEmptyShape program dispatcher.tree
      (Cursor.rebuild outerParents
        (LocalResponse.completed bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers false
            carrier))))
    {cursor : Cursor} {done : Bool} {term : Term}
    (eraseEq : cursor.erase = Cursor.rebuild outerParents term)
    (root : ResponseRootMutation program dispatcher.tree
      (dispatcher.route_valid (registers.phase, false)) bits continuation
      carrier done term) :
    SilentEvidence program dispatcher.tree .empty cursor.erase := by
  cases done with
  | false =>
      have prefixShape : CheckpointExclusion.CompletedPrefix program
          dispatcher.tree cursor.erase term layers := by
        rw [eraseEq]
        exact outer.prefix term
      exact .ofState (.endpointFailure prefixShape
        (root.failure hadmissible snapshotInv rfl))
  | true =>
      have completedEq : term =
          LocalResponse.completed bits continuation carrier
            (SchedulerResponse.completedRoute program dispatcher registers false
              carrier) := by
        simpa [SchedulerResponse.completedRoute] using root.done_eq rfl
      rw [eraseEq, completedEq]
      exact .ofPublic (.emptyPreMarker preMarker)

/-- The marker of a nonfinal bounded job is still silent: it adds one marked
Local parser layer whose endpoint is the remaining clock-wrapper spine. -/
theorem nonterminalEmptyMarker_sampled
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleNumber : Nat)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (outerParents : List ParentFrame)
    (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program} {scanned : List Bool}
    (coherent : RegistersCoherent registers phase scanned true)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      continuation) :
    SampledState program dispatcher inputBits sampleNumber
      (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
        dispatcher registers bits continuation carrier outerParents) := by
  let marker := SchedulerRootContinuation.emptyMarkerMutationConfiguration
    program dispatcher registers bits continuation carrier outerParents
  let markedTerm := LocalResponse.markedCompleted bits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher registers false carrier)
  let extendedParents :=
    SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers bits carrier outerParents
  have extended := outer.empty registers bits carrier
  have silent : SilentEvidence program dispatcher.tree .empty
      marker.cursor.erase := by
    have eraseEq : marker.cursor.erase =
        Cursor.rebuild outerParents markedTerm := by
      simpa [marker, markedTerm] using!
        SchedulerRootContinuation.emptyMarkerMutation_erase program dispatcher
          registers bits continuation carrier outerParents
    rw [eraseEq]
    rw [← CompletedParents.rebuild_emptyContinuationParents program dispatcher
      registers bits carrier continuation outerParents]
    exact extended.silentOfFailure .empty failure
  have holds := emptyMarker_holdsWith program dispatcher registers bits
    continuation carrier outerParents coherent snapshotInv (.silent silent)
  exact SampledState.ofSilent
    (.script .markEmpty ⟨4, by
      simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
    holds rfl silent

/-- Exact zero-action response and marker for the terminal frame of a
nonfinal job.  All of these samples are silent; the separate handoff theorem
adds the one arity-three launch contraction. -/
theorem nonterminalEmptyFrameSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program} {scanned : List Bool}
    (coherent : RegistersCoherent registers phase scanned true)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (hadmissible : Carrier.Admissible continuation)
    (failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      continuation) :
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
          bits continuation carrier outerParents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier outerParents) configurations /\
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations /\
      configurations.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1 := by
  have markerSample := nonterminalEmptyMarker_sampled program dispatcher
    inputBits
    (sampleIndex +
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, false))
        (registers.phase, false) + 1)
    registers bits continuation carrier outerParents layers outer coherent
    snapshotInv failure
  apply emptyFrameSegment program dispatcher inputBits registers bits
    continuation carrier outerParents coherent snapshotInv sampleIndex
  · intro index pc cursor done term position eraseEq root
    exact emptyResponse_nonterminalSilent program dispatcher registers bits
      continuation carrier hadmissible snapshotInv outerParents layers outer
      failure eraseEq root
  · exact markerSample

/-! ## Empty-sweep semantic preservation -/

/-- A marked zero-action Local preserves an already-empty recursive carrier
decode. -/
theorem markedZero_decode
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term)
    (hadmissible : Carrier.Admissible continuation)
    (carrierDecode : CarrierDecoder.decode? program dispatcher.tree bits
      continuation hadmissible carrier = some []) :
    CarrierDecoder.decode? program dispatcher.tree bits continuation hadmissible
      (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers false
          carrier)) = some [] := by
  rw [CarrierDecoder.decode?_local program dispatcher.tree bits continuation
    hadmissible
    (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher
      registers false carrier).toDispatchesTo
    (LocalResponse.markedCompleted_localShell bits continuation carrier
      (SchedulerResponse.completedRoute program dispatcher registers false
        carrier))]
  have decoded := CarrierActionDecode.decode_actionAccumulator program
    dispatcher.tree bits continuation hadmissible (registers.phase, false)
    carrierDecode
  simpa [ActionDecode.outputData] using decoded

/-- Every recursively marked carrier created by the EMPTY sweep retains any
empty recursive decode supplied at its source. -/
theorem emptySweepCarrier_decode_of
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation) :
    forall (count : Nat) (registers : Registers program) (carrier : Term),
      CarrierDecoder.decode? program dispatcher.tree bits continuation
        hadmissible carrier = some [] ->
      CarrierDecoder.decode? program dispatcher.tree bits continuation
        hadmissible
        (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation
          count registers carrier) = some []
  | 0, registers, carrier, carrierDecode => by
      simpa [SchedulerCycle.emptySweepCarrier] using carrierDecode
  | count + 1, registers, carrier, carrierDecode => by
      let nextCarrier := LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers false
          carrier)
      have nextDecode : CarrierDecoder.decode? program dispatcher.tree bits
          continuation hadmissible nextCarrier = some [] :=
        markedZero_decode program dispatcher registers bits continuation carrier
          hadmissible carrierDecode
      simpa [SchedulerCycle.emptySweepCarrier, nextCarrier] using
        (emptySweepCarrier_decode_of program dispatcher bits continuation
          hadmissible count registers.advanceEmpty nextCarrier nextDecode)

/-- Specialization of `emptySweepCarrier_decode_of` to the exact empty Base. -/
theorem emptySweepCarrier_decode
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (count : Nat) (registers : Registers program) :
    CarrierDecoder.decode? program dispatcher.tree [] continuation hadmissible
      (SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count
        registers
        (baseCarrier
          (environmentCode (compileActions program dispatcher.tree) [])
          continuation)) = some [] := by
  apply emptySweepCarrier_decode_of program dispatcher [] continuation
    hadmissible count registers
  exact CarrierDecoder.decode?_initial program dispatcher.tree [] continuation
    hadmissible

/-- The strong reachable-carrier audit is preserved by every marked
zero-action layer of the EMPTY sweep. -/
theorem emptySweepCarrier_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) :
    forall (count : Nat) (registers : Registers program) (carrier : Term),
      ReachableAudit.Holds program dispatcher.tree bits continuation carrier ->
      ReachableAudit.Holds program dispatcher.tree bits continuation
        (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation
          count registers carrier)
  | 0, registers, carrier, carrierHolds => by
      simpa [SchedulerCycle.emptySweepCarrier] using carrierHolds
  | count + 1, registers, carrier, carrierHolds => by
      let nextCarrier := LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers false
          carrier)
      have nextHolds : ReachableAudit.Holds program dispatcher.tree bits
          continuation nextCarrier :=
        SchedulerEmpty.marked_holds program dispatcher registers bits
          continuation carrier carrierHolds
      simpa [SchedulerCycle.emptySweepCarrier, nextCarrier] using
        (emptySweepCarrier_holds program dispatcher bits continuation count
          registers.advanceEmpty nextCarrier nextHolds)

/-- Proof-level phase recurrence aligned with `emptySweepRegisters`. -/
def emptySweepPhase (program : CTS.Program) : Nat -> CTS.Phase program ->
    CTS.Phase program
  | 0, phase => phase
  | count + 1, phase =>
      emptySweepPhase program count (CTS.nextPhase program phase)

/-- Phase iteration may expose its first successor rather than its last. -/
theorem iteratePhase_succ_front
    (program : CTS.Program) (count : Nat) (phase : CTS.Phase program) :
    CTS.iteratePhase program (count + 1) phase =
      CTS.iteratePhase program count (CTS.nextPhase program phase) := by
  induction count with
  | zero => rfl
  | succ count ih =>
      change CTS.nextPhase program
          (CTS.iteratePhase program (count + 1) phase) =
        CTS.nextPhase program
          (CTS.iteratePhase program count (CTS.nextPhase program phase))
      exact congrArg (CTS.nextPhase program) ih

/-- The EMPTY sweep's front-recursive phase index is the standard CTS phase
iterate. -/
theorem emptySweepPhase_eq_iteratePhase
    (program : CTS.Program) : forall (count : Nat) (phase : CTS.Phase program),
      emptySweepPhase program count phase =
        CTS.iteratePhase program count phase
  | 0, phase => rfl
  | count + 1, phase => by
      rw [emptySweepPhase]
      rw [emptySweepPhase_eq_iteratePhase program count
        (CTS.nextPhase program phase)]
      exact (iteratePhase_succ_front program count phase).symm

/-- Logical register coherence advances in lockstep with the recursive EMPTY
sweep register bank. -/
theorem emptySweepRegisters_coherent
    (program : CTS.Program) :
    forall (count : Nat) (registers : Registers program)
      (phase : CTS.Phase program),
      RegistersCoherent registers phase [] true ->
      RegistersCoherent
        (SchedulerCycle.emptySweepRegisters program count registers)
        (emptySweepPhase program count phase) [] true
  | 0, registers, phase, coherent => by
      simpa [SchedulerCycle.emptySweepRegisters, emptySweepPhase] using coherent
  | count + 1, registers, phase, coherent => by
      have next := emptySweepRegisters_coherent program count
        registers.advanceEmpty (CTS.nextPhase program phase)
        coherent.advanceEmpty
      simpa [SchedulerCycle.emptySweepRegisters, emptySweepPhase] using next

/-- Starting from the exact empty Base register bank, the final EMPTY response
uses the decoder phase prescribed for horizon `fuel + 1`. -/
theorem initialEmptySweep_phase_eq_expectedPhase
    (program : CTS.Program) (fuel : Nat) :
    (SchedulerCycle.emptySweepRegisters program fuel
      (initialEmptyRegisters program)).phase =
        CheckpointDecoder.expectedPhase program (fuel + 1) := by
  have coherent := emptySweepRegisters_coherent program fuel
    (initialEmptyRegisters program) (CTS.zeroPhase program)
    (initialEmptyRegisters_coherent program)
  rw [coherent.phase_eq, emptySweepPhase_eq_iteratePhase]
  simpa [CTS.initial] using
    (CheckpointRun.iterate_phase_eq_expectedPhase program [] fuel)

/-! ## Exact terminal chain shapes under completed outer prefixes -/

/-- Wrap a completed checkpoint chain in an arbitrary certified completed
prefix, preserving its terminal and innermost Local while adding the exact
number of outer layers. -/
theorem wrapCompletedPrefix
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term endpoint : Term} {layers : Nat}
    {chain : CheckpointDecoder.ChainView program}
    (outer : CheckpointExclusion.CompletedPrefix program tree term endpoint
      layers)
    (inner : CheckpointDecoder.ChainShape program tree endpoint
      (.completed chain)) :
    CheckpointDecoder.ChainShape program tree term
      (.completed (CheckpointRun.addLayers layers chain)) := by
  induction outer with
  | here =>
      simpa [CheckpointRun.addLayers] using inner
  | «local» view boundary tailPrefix ih =>
      have wrapped := CheckpointDecoder.ChainShape.local view boundary (ih inner)
      simpa [CheckpointDecoder.prependLocal, CheckpointRun.addLayers,
        Nat.add_assoc] using wrapped

/-- The literal final EMPTY carrier determines the fresh pre-marker rejection
shape, while the carried positive-prefix certificate determines the marked
accepted shape.  Thus callers need not duplicate endpoint-local parser facts.
-/
def terminalEmptyShapes
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (fuel : Nat) (registers : Registers program)
    (carrier : Term) (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (carrierDecode :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) []
      let continuation := Dovetail.clockExit (fuel + 1) 0 environment
      CarrierDecoder.decode? program dispatcher.tree [] continuation
        (Dovetail.clockExit_admissible (fuel + 1) 0 environment) carrier =
        some [])
    {activeContext : Context}
    {checkpointChain : CheckpointDecoder.ChainView program}
    (certificate :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) []
      let continuation := Dovetail.clockExit (fuel + 1) 0 environment
      CheckpointRun.PositivePrefix program dispatcher inputBits (fuel + 1)
        (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
          dispatcher registers [] continuation carrier outerParents).cursor.erase
        (ExactCheckpointRun.checkpointTime program dispatcher inputBits
          (fuel + 1)) activeContext checkpointChain)
    (outputEmpty :
      (CTS.iterate program (fuel + 1)
        (CTS.initial program inputBits)).data = []) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) []
    let continuation := Dovetail.clockExit (fuel + 1) 0 environment
    CheckpointExclusion.PreMarkerEmptyShape program dispatcher.tree
        (Cursor.rebuild outerParents
          (LocalResponse.completed [] continuation carrier
            (SchedulerResponse.completedRoute program dispatcher registers false
              carrier))) ×
      (Σ result : CheckpointDecoder.PositiveView program,
        CheckpointExclusion.TerminalCheckpointShape program dispatcher.tree
          .marked result
          (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
            dispatcher registers [] continuation carrier
            outerParents).cursor.erase) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) []
  let continuation := Dovetail.clockExit (fuel + 1) 0 environment
  let route := dispatcher.route (registers.phase, false)
  let label : ActionLabel program := (registers.phase, false)
  let accumulator := actionAccumulator program label carrier
  let dispatcherTerm :=
    SchedulerResponse.completedRoute program dispatcher registers false carrier
  let terminal := CheckpointRun.terminalView (fuel + 1) []
  let freshView := CheckpointDecoder.completedView program route label
    accumulator [] continuation
  let freshChain : CheckpointDecoder.ChainView program :=
    ⟨1, terminal, freshView⟩
  let freshTerm :=
    LocalResponse.completed [] continuation carrier dispatcherTerm
  have terminalShape : CheckpointDecoder.ChainShape program dispatcher.tree
      continuation (.terminal terminal) := by
    apply CheckpointDecoder.ChainShape.terminal terminal
    · exact CheckpointDecoder.parseLocal?_terminal_none program dispatcher.tree
        (fuel + 1) environment
    · simpa [continuation, terminal, environment] using!
        (CheckpointDecoder.parseTerminal?_clockExit
          (compileActions program dispatcher.tree) (word []) fuel)
  have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program
    dispatcher registers false carrier
  have freshLocalShape : CheckpointDecoder.ChainShape program dispatcher.tree
      freshTerm (.completed freshChain) := by
    simpa [freshTerm, freshChain, freshView, route, label, accumulator,
      dispatcherTerm] using
      (CheckpointDecoder.ChainShape.prepend_response_terminal [] dispatch
        terminalShape)
  let fullFreshChain := CheckpointRun.addLayers layers freshChain
  have freshFullShape : CheckpointDecoder.ChainShape program dispatcher.tree
      (Cursor.rebuild outerParents freshTerm) (.completed fullFreshChain) := by
    exact wrapCompletedPrefix (outer.prefix freshTerm) freshLocalShape
  have accumulatorDecode : CarrierDecoder.decode? program dispatcher.tree []
      continuation (Dovetail.clockExit_admissible (fuel + 1) 0 environment)
      accumulator = some [] := by
    have decoded := CarrierActionDecode.decode_actionAccumulator program
      dispatcher.tree [] continuation
      (Dovetail.clockExit_admissible (fuel + 1) 0 environment) label carrierDecode
    simpa [label, accumulator, ActionDecode.outputData] using decoded
  have publicDecode : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      accumulator = some [] :=
    CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree [] continuation
      (Dovetail.clockExit_admissible (fuel + 1) 0 environment)
      accumulatorDecode
  have accumulatorShape : CheckpointDecoder.CarrierDecodes program
      dispatcher.tree accumulator [] :=
    CheckpointDecoder.decodeCarrier?_sound program dispatcher.tree publicDecode
  have preMarker : CheckpointExclusion.PreMarkerEmptyShape program
      dispatcher.tree (Cursor.rebuild outerParents freshTerm) :=
    { chain := fullFreshChain
      chainShape := freshFullShape
      fresh := by
        simp [fullFreshChain, CheckpointRun.addLayers, freshChain, freshView,
          CheckpointDecoder.completedView]
      empty := by
        simpa [fullFreshChain, CheckpointRun.addLayers, freshChain, freshView]
          using! accumulatorShape }
  have terminalHorizon : checkpointChain.terminal.horizon = fuel + 1 := by
    exact congrArg CheckpointDecoder.TerminalView.horizon certificate.terminal
  have checkpointEmpty : CheckpointDecoder.CarrierDecodes program
      dispatcher.tree checkpointChain.last.accumulator [] := by
    rw [← outputEmpty]
    exact certificate.final_queue
  have checkpointCompatible : CheckpointDecoder.markerCompatible
      checkpointChain.last.status [] = true := by
    rw [← outputEmpty]
    exact certificate.marker_compatible
  have checkpointMarked : checkpointChain.last.status = .marked := by
    have iff := (CheckpointDecoder.markerCompatible_eq_true_iff
      checkpointChain.last.status []).mp checkpointCompatible
    exact iff.mpr rfl
  let result : CheckpointDecoder.PositiveView program :=
    ⟨checkpointChain.terminal.horizon, checkpointChain.last.route,
      checkpointChain.last.label, []⟩
  have terminalCheckpoint : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .marked result
      (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
        dispatcher registers [] continuation carrier outerParents).cursor.erase :=
    { chain := checkpointChain
      chainShape := certificate.chainShape
      phase := by
        rw [terminalHorizon]
        exact certificate.final_phase
      carrier := checkpointEmpty
      marker := checkpointCompatible
      result_eq := rfl
      status_eq := checkpointMarked }
  exact ⟨by simpa [freshTerm, continuation, environment, dispatcherTerm] using
      preMarker,
    ⟨result, terminalCheckpoint⟩⟩

/-- Certificate-free terminal shapes for an arbitrary seed environment.  The
phase premise is the only semantic fact not recoverable from the literal
carrier and completed-parent grammar; it is supplied by the job recurrence.
This constructor is used before the global `PositivePrefix` exists. -/
def terminalEmptyRawShapesAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (offset : Nat) (registers : Registers program)
    (carrier : Term) (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (carrierDecode :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (offset + 1) 0 environment
      CarrierDecoder.decode? program dispatcher.tree bits continuation
        (Dovetail.clockExit_admissible (offset + 1) 0 environment) carrier =
        some [])
    (phaseEq : registers.phase =
      CheckpointDecoder.expectedPhase program (offset + 1)) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (offset + 1) 0 environment
    CheckpointExclusion.PreMarkerEmptyShape program dispatcher.tree
        (Cursor.rebuild outerParents
          (LocalResponse.completed bits continuation carrier
            (SchedulerResponse.completedRoute program dispatcher registers false
              carrier))) ×
      (Σ result : CheckpointDecoder.PositiveView program,
        CheckpointExclusion.TerminalCheckpointShape program dispatcher.tree
          .marked result
          (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
            dispatcher registers bits continuation carrier
            outerParents).cursor.erase) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (offset + 1) 0 environment
  let route := dispatcher.route (registers.phase, false)
  let label : ActionLabel program := (registers.phase, false)
  let accumulator := actionAccumulator program label carrier
  let dispatcherTerm :=
    SchedulerResponse.completedRoute program dispatcher registers false carrier
  let terminal := CheckpointRun.terminalView (offset + 1) bits
  let freshView := CheckpointDecoder.completedView program route label
    accumulator bits continuation
  let freshChain : CheckpointDecoder.ChainView program :=
    ⟨1, terminal, freshView⟩
  let freshTerm :=
    LocalResponse.completed bits continuation carrier dispatcherTerm
  let markedTerm :=
    LocalResponse.markedCompleted bits continuation carrier dispatcherTerm
  have terminalShape : CheckpointDecoder.ChainShape program dispatcher.tree
      continuation (.terminal terminal) := by
    apply CheckpointDecoder.ChainShape.terminal terminal
    · exact CheckpointDecoder.parseLocal?_terminal_none program dispatcher.tree
        (offset + 1) environment
    · simpa [continuation, terminal, environment] using!
        (CheckpointDecoder.parseTerminal?_clockExit
          (compileActions program dispatcher.tree) (word bits) offset)
  have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program
    dispatcher registers false carrier
  have freshLocalShape : CheckpointDecoder.ChainShape program dispatcher.tree
      freshTerm (.completed freshChain) := by
    simpa [freshTerm, freshChain, freshView, route, label, accumulator,
      dispatcherTerm] using
      (CheckpointDecoder.ChainShape.prepend_response_terminal bits dispatch
        terminalShape)
  let fullFreshChain := CheckpointRun.addLayers layers freshChain
  have freshFullShape : CheckpointDecoder.ChainShape program dispatcher.tree
      (Cursor.rebuild outerParents freshTerm) (.completed fullFreshChain) := by
    exact wrapCompletedPrefix (outer.prefix freshTerm) freshLocalShape
  have accumulatorDecode : CarrierDecoder.decode? program dispatcher.tree bits
      continuation (Dovetail.clockExit_admissible (offset + 1) 0 environment)
      accumulator = some [] := by
    have decoded := CarrierActionDecode.decode_actionAccumulator program
      dispatcher.tree bits continuation
      (Dovetail.clockExit_admissible (offset + 1) 0 environment) label
      carrierDecode
    simpa [label, accumulator, ActionDecode.outputData] using decoded
  have publicDecode : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      accumulator = some [] :=
    CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree bits
      continuation (Dovetail.clockExit_admissible (offset + 1) 0 environment)
      accumulatorDecode
  have accumulatorShape : CheckpointDecoder.CarrierDecodes program
      dispatcher.tree accumulator [] :=
    CheckpointDecoder.decodeCarrier?_sound program dispatcher.tree publicDecode
  have preMarker : CheckpointExclusion.PreMarkerEmptyShape program
      dispatcher.tree (Cursor.rebuild outerParents freshTerm) :=
    { chain := fullFreshChain
      chainShape := freshFullShape
      fresh := by
        simp [fullFreshChain, CheckpointRun.addLayers, freshChain, freshView,
          CheckpointDecoder.completedView]
      empty := by
        simpa [fullFreshChain, CheckpointRun.addLayers, freshChain, freshView]
          using! accumulatorShape }
  have phase : label.1 =
      CheckpointDecoder.expectedPhase program terminal.horizon := by
    simpa [label, terminal] using! phaseEq
  let rootResult : CheckpointDecoder.PositiveView program :=
    ⟨offset + 1, route, label, []⟩
  have rootTerminal : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .marked rootResult markedTerm := by
    simpa [rootResult, markedTerm, dispatcherTerm] using!
      (SchedulerRootContinuation.markedRootTerminalShape bits dispatch
        terminalShape phase accumulatorShape)
  let fullMarkedChain := CheckpointRun.addLayers layers rootTerminal.chain
  have fullMarkedShape : CheckpointDecoder.ChainShape program dispatcher.tree
      (Cursor.rebuild outerParents markedTerm) (.completed fullMarkedChain) := by
    exact wrapCompletedPrefix (outer.prefix markedTerm) rootTerminal.chainShape
  have terminalCheckpoint : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .marked rootResult
      (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
        dispatcher registers bits continuation carrier outerParents).cursor.erase :=
    { chain := fullMarkedChain
      chainShape := by
        have eraseEq :
            (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
              dispatcher registers bits continuation carrier
              outerParents).cursor.erase =
            Cursor.rebuild outerParents markedTerm := by
          simpa [markedTerm, dispatcherTerm] using!
            (SchedulerRootContinuation.emptyMarkerMutation_erase program
              dispatcher registers bits continuation carrier outerParents)
        rw [eraseEq]
        exact fullMarkedShape
      phase := by
        simpa [fullMarkedChain, CheckpointRun.addLayers] using rootTerminal.phase
      carrier := by
        simpa [fullMarkedChain, CheckpointRun.addLayers] using rootTerminal.carrier
      marker := by
        simpa [fullMarkedChain, CheckpointRun.addLayers] using rootTerminal.marker
      result_eq := by
        simpa [fullMarkedChain, CheckpointRun.addLayers] using
          rootTerminal.result_eq
      status_eq := by
        simpa [fullMarkedChain, CheckpointRun.addLayers] using
          rootTerminal.status_eq }
  exact ⟨by simpa [freshTerm, continuation, environment, dispatcherTerm] using
      preMarker,
    ⟨rootResult, by
      simpa [continuation, environment] using terminalCheckpoint⟩⟩

/-! ## Nonfinal arity-three continuation handoff -/

/-- Exact next-job fuel source nested in the newly marked empty Local. -/
def nextEmptyJobSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel jobs : Nat) (registers : Registers program) (carrier : Term)
    (outerParents : List ParentFrame) : Configuration program dispatcher :=
  let environment :=
    environmentCode (compileActions program dispatcher.tree) []
  fuelPhaseSourceConfiguration program dispatcher (Registers.newJob program)
    (fuel + 1) environment (Dovetail.clockExit (fuel + 1) jobs environment)
    (SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers [] carrier outerParents)

/-- The arity-three launch sample is a silent positive-fuel source below the
newly certified marked Local prefix. -/
theorem nextEmptyJobSource_sampled
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleNumber fuel jobs : Nat)
    (registers : Registers program) (carrier : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    SampledState program dispatcher inputBits sampleNumber
      (nextEmptyJobSourceConfiguration program dispatcher fuel jobs registers
        carrier outerParents) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) []
  let continuation := Dovetail.clockExit (fuel + 1) jobs environment
  let parents :=
    SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers [] carrier outerParents
  let endpoint : Term :=
    .app (.app (C (fuel + 1)) environment) continuation
  have extended := outer.empty registers [] carrier
  have silent : SilentEvidence program dispatcher.tree .fuel
      (nextEmptyJobSourceConfiguration program dispatcher fuel jobs registers
        carrier outerParents).cursor.erase := by
    have eraseEq :
        (nextEmptyJobSourceConfiguration program dispatcher fuel jobs registers
          carrier outerParents).cursor.erase = Cursor.rebuild parents endpoint :=
      rfl
    rw [eraseEq]
    apply SilentEvidence.ofPublic
    apply CheckpointExclusion.Noncheckpoint.fuelSource
      (extended.prefix endpoint)
    exact ⟨fuel, word [], continuation, by
      simpa only [endpoint, environment,
        CheckpointDecoder.openEnvironment_word]⟩
  have holds : Holds program dispatcher
      (nextEmptyJobSourceConfiguration program dispatcher fuel jobs registers
        carrier outerParents) := by
    exact .intro (.macro (.family .fuel) (Registers.newJob program)) rfl
      (CTS.zeroPhase program) [] false (RegistersCoherent.initial program)
      (ControlPosition.macro (context := contextOfParents parents)
        (focus := endpoint) (cursorAtContextOfParents endpoint parents)
        (by trivial))
      (.fuel (.silent (by
        simpa [nextEmptyJobSourceConfiguration, environment, continuation,
          parents, endpoint] using silent)))
  exact SampledState.ofSilent
    (.macro (.family .fuel) (Registers.newJob program)) holds rfl silent

/-- After a nonfinal EMPTY marker, all continuation probes are cursor-only and
the sole next mutation is the wrapper launch into the exact next-job fuel
source. -/
theorem nonterminalEmptyHandoff
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleIndex fuel jobs : Nat)
    (registers : Registers program) (carrier : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) []
    let continuation := Dovetail.clockExit (fuel + 1) (jobs + 1) environment
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (nextEmptyJobSourceConfiguration program dispatcher fuel jobs registers
          carrier outerParents)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
          [] continuation carrier outerParents) configurations /\
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations /\
      configurations.length = 1 /\
      CompletedParents program dispatcher
        (SchedulerRootContinuation.emptyContinuationParents program dispatcher
          registers [] carrier outerParents) (layers + 1) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) []
  let continuation := Dovetail.clockExit (fuel + 1) (jobs + 1) environment
  let continuationParents :=
    SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers [] carrier outerParents
  let cursor := SchedulerEmpty.continuationCursor program dispatcher registers
    [] continuation carrier outerParents
  let decision := SchedulerContinuation.arityDecisionConfiguration program
    dispatcher registers.advanceEmpty true cursor
  let after : Cursor :=
    ⟨Dovetail.jobSource (fuel + 1) jobs environment, continuationParents⟩
  let next := nextEmptyJobSourceConfiguration program dispatcher fuel jobs
    registers carrier outerParents
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (SchedulerEmpty.markedCursor program dispatcher registers [] continuation
        carrier outerParents) = false := by
    simpa [SchedulerEmpty.markedCursor, SchedulerResponse.markedCursor] using
      outer.pendingReject .emptyReturn
        (LocalResponse.markedCompleted [] continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers false
            carrier))
  have terminal := SchedulerEmpty.terminalContinuation_zeroRun program dispatcher
    registers [] continuation carrier outerParents pendingReject
  have arity : cursor.focus.headArity = 3 := by
    simpa [cursor, SchedulerEmpty.continuationCursor,
      SchedulerResponse.markedContinuationCursor,
      SchedulerResponse.literalContinuationCursor, continuation] using
      (Dovetail.headArity_clockExit_succ (fuel + 1) jobs environment)
  have checked := SchedulerContinuation.arityThreeDecision_zeroRun program
    dispatcher registers.advanceEmpty cursor arity
  have zeroPrefix : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      ((SchedulerControl.compiledProbeCost program dispatcher
            (.pending .emptyReturn)
            (SchedulerEmpty.markedCursor program dispatcher registers []
              continuation carrier outerParents) +
          ((SchedulerControl.jobScript program dispatcher .continuation).length +
            1)) +
        (1 + SchedulerControl.compiledProbeCost program dispatcher
          (.arityThree (.continuation registers.advanceEmpty.empty)) cursor))
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers []
        continuation carrier outerParents) decision := by
    simpa [cursor, decision, SchedulerContinuation.checkConfiguration,
      Nat.add_assoc] using terminal.trans checked
  have contracts : cursor.rdx? = some after := by
    rfl
  have launched := SchedulerContinuation.arityThreeDecision_countedStep program
    dispatcher registers.advanceEmpty cursor after contracts
  have mutationEq : FiniteController.mutationCount
      (SchedulerControl.machine program dispatcher) decision = 1 := by
    simpa [decision, FiniteController.runMutationCount] using launched.count_eq
  have stepEq : FiniteController.step (SchedulerControl.machine program dispatcher)
      decision = next := by
    simpa [decision, next, nextEmptyJobSourceConfiguration, after,
      continuationParents, continuation, environment, Dovetail.jobSource,
      FiniteController.run] using! launched.run_eq
  have foundLast : FiniteController.seekMutation
      (SchedulerControl.machine program dispatcher) 1 decision = some next := by
    simp [FiniteController.seekMutation, mutationEq, stepEq]
  have found := zeroPrefix.seekMutation_prepend foundLast
  have chain : ExactMutationChain (SchedulerControl.machine program dispatcher)
      next
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers []
        continuation carrier outerParents) [next] :=
    .next _ found (.done 0 ⟨rfl, rfl⟩)
  have nextSample := nextEmptyJobSource_sampled program dispatcher inputBits
    (sampleIndex + 1) fuel jobs registers carrier outerParents layers outer
  have sampled : IndexedResponseSampledStates program dispatcher inputBits
      sampleIndex [next] :=
    .cons sampleIndex (by simpa [next] using nextSample)
      (.nil (sampleIndex + 1))
  exact ⟨[next], by simpa [next, continuation, environment] using chain,
    sampled, rfl, outer.empty registers [] carrier⟩

/-! ## Complete nonfinal empty job -/

/-- An empty bounded job whose continuation retains another wrapper runs from
its final Base-producing fuel sample through every EMPTY frame and the unique
next-job launch.  The endpoint is the exact next fuel source below one newly
completed marked Local layer. -/
theorem nonterminalEmptyJobSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleIndex fuel jobs : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) []
    let continuation := Dovetail.clockExit (fuel + 1) (jobs + 1) environment
    let registers := SchedulerCycle.emptySweepRegisters program fuel
      (initialEmptyRegisters program)
    let carrier := SchedulerCycle.emptySweepCarrier program dispatcher []
      continuation fuel (initialEmptyRegisters program)
      (baseCarrier environment continuation)
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (nextEmptyJobSourceConfiguration program dispatcher fuel jobs registers
          carrier outerParents)
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
          (Registers.newJob program) continuation outerParents (fuel + 1) 0)
        configurations /\
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations /\
      configurations.length =
        SchedulerRootContinuation.emptyCleanupMutations program dispatcher fuel
          (initialEmptyRegisters program) + 1 /\
      CompletedParents program dispatcher
        (SchedulerRootContinuation.emptyContinuationParents program dispatcher
          registers [] carrier outerParents) (layers + 1) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) []
  let continuation := Dovetail.clockExit (fuel + 1) (jobs + 1) environment
  let initialCarrier := baseCarrier environment continuation
  let initialRegisters := initialEmptyRegisters program
  let finalRegisters := SchedulerCycle.emptySweepRegisters program fuel
    initialRegisters
  let finalCarrier := SchedulerCycle.emptySweepCarrier program dispatcher []
    continuation fuel initialRegisters initialCarrier
  obtain ⟨baseTicks, baseEntry⟩ := emptyBase_toFirstFrame_zeroRun program
    dispatcher continuation
      (Dovetail.clockExit_admissible (fuel + 1) (jobs + 1) environment)
      fuel outerParents
  have initialCoherent : RegistersCoherent initialRegisters
      (CTS.zeroPhase program) [] true := initialEmptyRegisters_coherent program
  have initialAudit : ReachableAudit.Holds program dispatcher.tree []
      continuation initialCarrier := by
    simpa [initialCarrier, environment] using
      (ReachableAudit.Holds.initial program dispatcher.tree [] continuation)
  obtain ⟨sweepConfigurations, sweepChain, sweepSampled, sweepLength⟩ :=
    pendingEmptySweepSegment program dispatcher inputBits [] continuation
      outerParents layers outer fuel sampleIndex initialRegisters initialCarrier
      (CTS.zeroPhase program) initialCoherent initialAudit
  have finalCoherent : RegistersCoherent finalRegisters
      (emptySweepPhase program fuel (CTS.zeroPhase program)) [] true := by
    exact emptySweepRegisters_coherent program fuel initialRegisters
      (CTS.zeroPhase program) initialCoherent
  have finalAudit : ReachableAudit.Holds program dispatcher.tree [] continuation
      finalCarrier := by
    exact emptySweepCarrier_holds program dispatcher [] continuation fuel
      initialRegisters initialCarrier initialAudit
  have failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      continuation :=
    SchedulerNestedResponse.ResponseSamplePairs.nonterminalClockExit_failure
      program dispatcher (fuel + 1) jobs environment
  obtain ⟨terminalConfigurations, terminalChain, terminalSampled,
      terminalLength⟩ :=
    nonterminalEmptyFrameSegment program dispatcher inputBits finalRegisters []
      continuation finalCarrier (sampleIndex + sweepConfigurations.length)
      outerParents layers outer finalCoherent finalAudit
      (Dovetail.clockExit_admissible (fuel + 1) (jobs + 1) environment) failure
  obtain ⟨handoffConfigurations, handoffChain, handoffSampled, handoffLength,
      extended⟩ :=
    nonterminalEmptyHandoff program dispatcher inputBits
      (sampleIndex + sweepConfigurations.length +
        terminalConfigurations.length)
      fuel jobs finalRegisters finalCarrier outerParents layers outer
  have fromFirstFrame := SchedulerRecurrence.ExactMutationChain.append sweepChain
    terminalChain
  have fromFirstFrame' := SchedulerRecurrence.ExactMutationChain.append
    fromFirstFrame handoffChain
  have completeChain := ExactMutationChain.prepend baseEntry fromFirstFrame'
  have sampledPrefix := SchedulerNestedPhase.IndexedResponseSampledStates.append
    program dispatcher inputBits sweepSampled terminalSampled
  have completeSampled :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      inputBits sampledPrefix (by
        simpa [List.length_append, Nat.add_assoc] using handoffSampled)
  refine ⟨sweepConfigurations ++ terminalConfigurations ++
      handoffConfigurations, ?_, completeSampled, ?_, extended⟩
  · have sourceEq :
        SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
          (Registers.newJob program) continuation outerParents (fuel + 1) 0 =
        fuelZeroFifthMutationConfiguration program dispatcher
          (Registers.newJob program) environment continuation
          (PrimitiveFuel.pendingParents environment continuation (fuel + 1)
            outerParents) := by
        simp [SchedulerNestedPhase.fuelTerminalConfigurationAt,
          fuelSampleEndDepth_eq, environment]
    rw [sourceEq]
    simpa [environment, continuation, initialCarrier, initialRegisters,
      finalRegisters, finalCarrier, List.append_assoc] using completeChain
  · simp only [List.length_append]
    rw [sweepLength, terminalLength, handoffLength]
    simp [SchedulerRootContinuation.emptyCleanupMutations, finalRegisters,
      initialRegisters, Nat.add_assoc]

/-! ## Arbitrary-seed nonterminal absorbing suffix -/

/-- Exact next-job fuel source after an arbitrary-seed EMPTY suffix. -/
def nextEmptyJobSourceConfigurationAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (offset jobs : Nat) (registers : Registers program)
    (carrier : Term) (outerParents : List ParentFrame) :
    Configuration program dispatcher :=
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  fuelPhaseSourceConfiguration program dispatcher (Registers.newJob program)
    (offset + 1) environment (Dovetail.clockExit (offset + 1) jobs environment)
    (SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers bits carrier outerParents)

/-- The arbitrary-seed next-job source is silent below the completed marked
Local created by the EMPTY suffix. -/
theorem nextEmptyJobSource_sampledAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleNumber offset jobs : Nat)
    (registers : Registers program) (carrier : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    SampledState program dispatcher bits sampleNumber
      (nextEmptyJobSourceConfigurationAt program dispatcher bits offset jobs
        registers carrier outerParents) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (offset + 1) jobs environment
  let parents :=
    SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers bits carrier outerParents
  let endpoint : Term :=
    .app (.app (C (offset + 1)) environment) continuation
  have extended := outer.empty registers bits carrier
  have silent : SilentEvidence program dispatcher.tree .fuel
      (nextEmptyJobSourceConfigurationAt program dispatcher bits offset jobs
        registers carrier outerParents).cursor.erase := by
    have eraseEq :
        (nextEmptyJobSourceConfigurationAt program dispatcher bits offset jobs
          registers carrier outerParents).cursor.erase =
          Cursor.rebuild parents endpoint := rfl
    rw [eraseEq]
    apply SilentEvidence.ofPublic
    apply CheckpointExclusion.Noncheckpoint.fuelSource
      (extended.prefix endpoint)
    exact ⟨offset, word bits, continuation, by
      simpa only [endpoint, environment,
        CheckpointDecoder.openEnvironment_word]⟩
  have holds : Holds program dispatcher
      (nextEmptyJobSourceConfigurationAt program dispatcher bits offset jobs
        registers carrier outerParents) := by
    exact .intro (.macro (.family .fuel) (Registers.newJob program)) rfl
      (CTS.zeroPhase program) [] false (RegistersCoherent.initial program)
      (ControlPosition.macro (context := contextOfParents parents)
        (focus := endpoint) (cursorAtContextOfParents endpoint parents)
        (by trivial))
      (.fuel (.silent (by
        simpa [nextEmptyJobSourceConfigurationAt, environment, continuation,
          parents, endpoint] using silent)))
  exact SampledState.ofSilent
    (.macro (.family .fuel) (Registers.newJob program)) holds rfl silent

/-- Exact arity-three launch after an arbitrary-seed EMPTY terminal frame. -/
theorem nonterminalEmptyHandoffAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex offset jobs : Nat)
    (registers : Registers program) (carrier : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (offset + 1) (jobs + 1) environment
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (nextEmptyJobSourceConfigurationAt program dispatcher bits offset jobs
          registers carrier outerParents)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
          bits continuation carrier outerParents) configurations /\
      IndexedResponseSampledStates program dispatcher bits sampleIndex
        configurations /\
      configurations.length = 1 /\
      CompletedParents program dispatcher
        (SchedulerRootContinuation.emptyContinuationParents program dispatcher
          registers bits carrier outerParents) (layers + 1) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (offset + 1) (jobs + 1) environment
  let continuationParents :=
    SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers bits carrier outerParents
  let cursor := SchedulerEmpty.continuationCursor program dispatcher registers
    bits continuation carrier outerParents
  let decision := SchedulerContinuation.arityDecisionConfiguration program
    dispatcher registers.advanceEmpty true cursor
  let after : Cursor :=
    ⟨Dovetail.jobSource (offset + 1) jobs environment, continuationParents⟩
  let next := nextEmptyJobSourceConfigurationAt program dispatcher bits offset
    jobs registers carrier outerParents
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (SchedulerEmpty.markedCursor program dispatcher registers bits continuation
        carrier outerParents) = false := by
    simpa [SchedulerEmpty.markedCursor, SchedulerResponse.markedCursor] using
      outer.pendingReject .emptyReturn
        (LocalResponse.markedCompleted bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers false
            carrier))
  have terminal := SchedulerEmpty.terminalContinuation_zeroRun program dispatcher
    registers bits continuation carrier outerParents pendingReject
  have arity : cursor.focus.headArity = 3 := by
    simpa [cursor, SchedulerEmpty.continuationCursor,
      SchedulerResponse.markedContinuationCursor,
      SchedulerResponse.literalContinuationCursor, continuation] using
      (Dovetail.headArity_clockExit_succ (offset + 1) jobs environment)
  have checked := SchedulerContinuation.arityThreeDecision_zeroRun program
    dispatcher registers.advanceEmpty cursor arity
  have zeroPrefix : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      ((SchedulerControl.compiledProbeCost program dispatcher
            (.pending .emptyReturn)
            (SchedulerEmpty.markedCursor program dispatcher registers bits
              continuation carrier outerParents) +
          ((SchedulerControl.jobScript program dispatcher .continuation).length +
            1)) +
        (1 + SchedulerControl.compiledProbeCost program dispatcher
          (.arityThree (.continuation registers.advanceEmpty.empty)) cursor))
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
        bits continuation carrier outerParents) decision := by
    simpa [cursor, decision, SchedulerContinuation.checkConfiguration,
      Nat.add_assoc] using terminal.trans checked
  have contracts : cursor.rdx? = some after := by
    rfl
  have launched := SchedulerContinuation.arityThreeDecision_countedStep program
    dispatcher registers.advanceEmpty cursor after contracts
  have mutationEq : FiniteController.mutationCount
      (SchedulerControl.machine program dispatcher) decision = 1 := by
    simpa [decision, FiniteController.runMutationCount] using launched.count_eq
  have stepEq : FiniteController.step (SchedulerControl.machine program dispatcher)
      decision = next := by
    simpa [decision, next, nextEmptyJobSourceConfigurationAt, after,
      continuationParents, continuation, environment, Dovetail.jobSource,
      FiniteController.run] using! launched.run_eq
  have foundLast : FiniteController.seekMutation
      (SchedulerControl.machine program dispatcher) 1 decision = some next := by
    simp [FiniteController.seekMutation, mutationEq, stepEq]
  have found := zeroPrefix.seekMutation_prepend foundLast
  have chain : ExactMutationChain (SchedulerControl.machine program dispatcher)
      next
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
        bits continuation carrier outerParents) [next] :=
    .next _ found (.done 0 ⟨rfl, rfl⟩)
  have nextSample := nextEmptyJobSource_sampledAt program dispatcher bits
    (sampleIndex + 1) offset jobs registers carrier outerParents layers outer
  have sampled : IndexedResponseSampledStates program dispatcher bits
      sampleIndex [next] :=
    .cons sampleIndex (by simpa [next] using nextSample)
      (.nil (sampleIndex + 1))
  exact ⟨[next], by simpa [next, continuation, environment] using chain,
    sampled, rfl, outer.empty registers bits carrier⟩

/-- From any already-entered EMPTY frame, execute all remaining pending frames,
the terminal nonfinal frame, and the unique next-job launch. -/
theorem nonterminalEmptySweepSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex offset jobs count : Nat)
    (registers : Registers program) (carrier : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program}
    (coherent : RegistersCoherent registers phase [] true)
    (snapshotInv :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation :=
        Dovetail.clockExit (offset + 1) (jobs + 1) environment
      ReachableAudit.Holds program dispatcher.tree bits continuation carrier) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation :=
      Dovetail.clockExit (offset + 1) (jobs + 1) environment
    let finalRegisters :=
      SchedulerCycle.emptySweepRegisters program count registers
    let finalCarrier :=
      SchedulerCycle.emptySweepCarrier program dispatcher bits continuation
        count registers carrier
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (nextEmptyJobSourceConfigurationAt program dispatcher bits offset jobs
          finalRegisters finalCarrier outerParents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier
          (PrimitiveFuel.pendingParents environment continuation count
            outerParents)) configurations /\
      IndexedResponseSampledStates program dispatcher bits sampleIndex
        configurations /\
      configurations.length =
        SchedulerRootContinuation.emptyCleanupMutations program dispatcher count
          registers + 1 /\
      CompletedParents program dispatcher
        (SchedulerRootContinuation.emptyContinuationParents program dispatcher
          finalRegisters bits finalCarrier outerParents) (layers + 1) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation :=
    Dovetail.clockExit (offset + 1) (jobs + 1) environment
  let finalRegisters :=
    SchedulerCycle.emptySweepRegisters program count registers
  let finalCarrier :=
    SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count
      registers carrier
  obtain ⟨sweepConfigurations, sweepChain, sweepSampled, sweepLength⟩ :=
    pendingEmptySweepSegment program dispatcher bits bits continuation
      outerParents layers outer count sampleIndex registers carrier phase coherent
      snapshotInv
  have finalCoherent : RegistersCoherent finalRegisters
      (emptySweepPhase program count phase) [] true := by
    exact emptySweepRegisters_coherent program count registers phase coherent
  have finalAudit : ReachableAudit.Holds program dispatcher.tree bits
      continuation finalCarrier := by
    exact emptySweepCarrier_holds program dispatcher bits continuation count
      registers carrier snapshotInv
  have failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      continuation :=
    SchedulerNestedResponse.ResponseSamplePairs.nonterminalClockExit_failure
      program dispatcher (offset + 1) jobs environment
  obtain ⟨terminalConfigurations, terminalChain, terminalSampled,
      terminalLength⟩ :=
    nonterminalEmptyFrameSegment program dispatcher bits finalRegisters bits
      continuation finalCarrier (sampleIndex + sweepConfigurations.length)
      outerParents layers outer finalCoherent finalAudit
      (Dovetail.clockExit_admissible (offset + 1) (jobs + 1) environment)
      failure
  obtain ⟨handoffConfigurations, handoffChain, handoffSampled, handoffLength,
      extended⟩ := nonterminalEmptyHandoffAt program dispatcher bits
    (sampleIndex + sweepConfigurations.length + terminalConfigurations.length)
    offset jobs finalRegisters finalCarrier outerParents layers outer
  have throughTerminal := SchedulerRecurrence.ExactMutationChain.append sweepChain
    terminalChain
  have completeChain := SchedulerRecurrence.ExactMutationChain.append
    throughTerminal handoffChain
  have prefixSampled :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      bits sweepSampled terminalSampled
  have completeSampled :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      bits prefixSampled (by
        simpa [List.length_append, Nat.add_assoc] using handoffSampled)
  refine ⟨sweepConfigurations ++ terminalConfigurations ++
      handoffConfigurations, ?_, completeSampled, ?_, extended⟩
  · simpa [List.append_assoc, finalRegisters, finalCarrier, continuation,
      environment] using completeChain
  · simp only [List.length_append]
    rw [sweepLength, terminalLength, handoffLength]
    simp [SchedulerRootContinuation.emptyCleanupMutations, finalRegisters,
      Nat.add_assoc]

/-! ## Horizon-ending EMPTY frame and next-stage handoff -/

/-- The terminal EMPTY frame rejects its completed fresh shell, accepts the
unique marker contraction at the caller's exact checkpoint time, and otherwise
uses only the zero-action response samples. -/
theorem terminalEmptyFrameSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleIndex fuel : Nat)
    (registers : Registers program) (carrier : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program} {scanned : List Bool}
    (coherent : RegistersCoherent registers phase scanned true)
    (snapshotInv :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) []
      let continuation := Dovetail.clockExit (fuel + 1) 0 environment
      ReachableAudit.Holds program dispatcher.tree [] continuation carrier)
    (preMarker :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) []
      let continuation := Dovetail.clockExit (fuel + 1) 0 environment
      CheckpointExclusion.PreMarkerEmptyShape program dispatcher.tree
        (Cursor.rebuild outerParents
          (LocalResponse.completed [] continuation carrier
            (SchedulerResponse.completedRoute program dispatcher registers false
              carrier))))
    {result : CheckpointDecoder.PositiveView program}
    (terminal :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) []
      let continuation := Dovetail.clockExit (fuel + 1) 0 environment
      CheckpointExclusion.TerminalCheckpointShape program dispatcher.tree
        .marked result
        (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
          dispatcher registers [] continuation carrier outerParents).cursor.erase)
    {activeContext : Context}
    {checkpointChain : CheckpointDecoder.ChainView program}
    (certificate :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) []
      let continuation := Dovetail.clockExit (fuel + 1) 0 environment
      CheckpointRun.PositivePrefix program dispatcher inputBits (fuel + 1)
        (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
          dispatcher registers [] continuation carrier outerParents).cursor.erase
        (ExactCheckpointRun.checkpointTime program dispatcher inputBits
          (fuel + 1)) activeContext checkpointChain)
    (indexEq : sampleIndex +
        (LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1) =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (fuel + 1)) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) []
    let continuation := Dovetail.clockExit (fuel + 1) 0 environment
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
          [] continuation carrier outerParents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers []
          continuation carrier outerParents) configurations /\
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations /\
      configurations.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1 := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) []
  let continuation := Dovetail.clockExit (fuel + 1) 0 environment
  let marker := SchedulerRootContinuation.emptyMarkerMutationConfiguration
    program dispatcher registers [] continuation carrier outerParents
  have markerHolds : Holds program dispatcher marker := by
    exact SchedulerRootContinuation.emptyMarker_holds program dispatcher
      registers [] continuation carrier outerParents coherent snapshotInv terminal
  have markerSample : SampledState program dispatcher inputBits
      (sampleIndex +
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1) marker := by
    exact SchedulerRootContinuation.emptyMarker_sampledState program dispatcher
      inputBits
      (sampleIndex +
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1)
      fuel registers [] continuation carrier outerParents markerHolds certificate
      indexEq
  apply emptyFrameSegment program dispatcher inputBits registers [] continuation
    carrier outerParents coherent snapshotInv sampleIndex
  · intro index pc cursor done term position eraseEq root
    exact emptyResponse_preMarkerSilent program dispatcher registers []
      continuation carrier
      (Dovetail.clockExit_admissible (fuel + 1) 0 environment) snapshotInv
      outerParents layers outer preMarker eraseEq root
  · simpa [marker] using markerSample

/-- Arbitrary-seed form of `terminalEmptyFrameSegment`, used after a nonempty
job first enters absorbing-empty mode. -/
theorem terminalEmptyFrameSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex offset : Nat)
    (registers : Registers program) (carrier : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program} {scanned : List Bool}
    (coherent : RegistersCoherent registers phase scanned true)
    (snapshotInv :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (offset + 1) 0 environment
      ReachableAudit.Holds program dispatcher.tree bits continuation carrier)
    (preMarker :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (offset + 1) 0 environment
      CheckpointExclusion.PreMarkerEmptyShape program dispatcher.tree
        (Cursor.rebuild outerParents
          (LocalResponse.completed bits continuation carrier
            (SchedulerResponse.completedRoute program dispatcher registers false
              carrier))))
    {result : CheckpointDecoder.PositiveView program}
    (terminal :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (offset + 1) 0 environment
      CheckpointExclusion.TerminalCheckpointShape program dispatcher.tree
        .marked result
        (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
          dispatcher registers bits continuation carrier outerParents).cursor.erase)
    {activeContext : Context}
    {checkpointChain : CheckpointDecoder.ChainView program}
    (certificate :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (offset + 1) 0 environment
      CheckpointRun.PositivePrefix program dispatcher bits (offset + 1)
        (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
          dispatcher registers bits continuation carrier outerParents).cursor.erase
        (ExactCheckpointRun.checkpointTime program dispatcher bits
          (offset + 1)) activeContext checkpointChain)
    (indexEq : sampleIndex +
        (LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1) =
      ExactCheckpointRun.checkpointTime program dispatcher bits (offset + 1)) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (offset + 1) 0 environment
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
          bits continuation carrier outerParents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier outerParents) configurations /\
      IndexedResponseSampledStates program dispatcher bits sampleIndex
        configurations /\
      configurations.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1 := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (offset + 1) 0 environment
  let marker := SchedulerRootContinuation.emptyMarkerMutationConfiguration
    program dispatcher registers bits continuation carrier outerParents
  have markerHolds : Holds program dispatcher marker := by
    exact SchedulerRootContinuation.emptyMarker_holds program dispatcher
      registers bits continuation carrier outerParents coherent snapshotInv
      terminal
  have markerSample : SampledState program dispatcher bits
      (sampleIndex +
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1) marker := by
    exact SchedulerRootContinuation.emptyMarker_sampledState program dispatcher
      bits
      (sampleIndex +
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1)
      offset registers bits continuation carrier outerParents markerHolds
      certificate indexEq
  apply emptyFrameSegment program dispatcher bits registers bits continuation
    carrier outerParents coherent snapshotInv sampleIndex
  · intro index pc cursor done term position eraseEq root
    exact emptyResponse_preMarkerSilent program dispatcher registers bits
      continuation carrier
      (Dovetail.clockExit_admissible (offset + 1) 0 environment) snapshotInv
      outerParents layers outer preMarker eraseEq root
  · simpa [marker] using markerSample

/-- After the sampled terminal marker, the failed pending probe, literal `RL`
continuation descent, and arity-four table are mutation-free and end at the
exact nested next-stage clock source. -/
theorem terminalEmptyPostMarker_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (registers : Registers program) (carrier : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) []
    let continuation := Dovetail.clockExit (fuel + 1) 0 environment
    exists ticks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
          [] continuation carrier outerParents)
        (SchedulerRootContinuation.emptyNextStageSourceConfiguration program
          dispatcher registers [] (fuel + 1) environment carrier
          outerParents) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) []
  let continuation := Dovetail.clockExit (fuel + 1) 0 environment
  let continuationParents :=
    SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers [] carrier outerParents
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (SchedulerEmpty.markedCursor program dispatcher registers [] continuation
        carrier outerParents) = false := by
    simpa [SchedulerEmpty.markedCursor, SchedulerResponse.markedCursor] using
      outer.pendingReject .emptyReturn
        (LocalResponse.markedCompleted [] continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers false
            carrier))
  have handoff := SchedulerEmpty.terminalContinuation_zeroRun program dispatcher
    registers [] continuation carrier outerParents pendingReject
  have checked := SchedulerRootContinuation.terminalCheck_zeroRun program
    dispatcher registers.advanceEmpty (fuel + 1) environment continuationParents
  exact ⟨_, by
    simpa [continuation, continuationParents,
      SchedulerRootContinuation.emptyNextStageSourceConfiguration,
      SchedulerRootContinuation.terminalCursor,
      SchedulerContinuation.checkConfiguration,
      SchedulerRootContinuation.emptyContinuationParents] using!
      handoff.trans checked⟩

/-- Arbitrary-seed post-marker handoff to the next-stage clock source. -/
theorem terminalEmptyPostMarker_zeroRunAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (offset : Nat) (registers : Registers program)
    (carrier : Term) (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (offset + 1) 0 environment
    exists ticks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
          bits continuation carrier outerParents)
        (SchedulerRootContinuation.emptyNextStageSourceConfiguration program
          dispatcher registers bits (offset + 1) environment carrier
          outerParents) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (offset + 1) 0 environment
  let continuationParents :=
    SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers bits carrier outerParents
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (SchedulerEmpty.markedCursor program dispatcher registers bits continuation
        carrier outerParents) = false := by
    simpa [SchedulerEmpty.markedCursor, SchedulerResponse.markedCursor] using
      outer.pendingReject .emptyReturn
        (LocalResponse.markedCompleted bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers false
            carrier))
  have handoff := SchedulerEmpty.terminalContinuation_zeroRun program dispatcher
    registers bits continuation carrier outerParents pendingReject
  have checked := SchedulerRootContinuation.terminalCheck_zeroRun program
    dispatcher registers.advanceEmpty (offset + 1) environment
      continuationParents
  exact ⟨_, by
    simpa [continuation, continuationParents,
      SchedulerRootContinuation.emptyNextStageSourceConfiguration,
      SchedulerRootContinuation.terminalCursor,
      SchedulerContinuation.checkConfiguration,
      SchedulerRootContinuation.emptyContinuationParents] using!
      handoff.trans checked⟩

/-! ## Arbitrary-seed absorbing suffixes -/

/-- Raw exact terminal EMPTY suffix for an arbitrary seed environment.  Every
sample before the final marker is already classified; the full configuration
list is exposed as `prefixConfigurations ++ [marker]`, allowing the caller to
construct the global `PositivePrefix` from this chain and then classify only
the singleton marker. -/
theorem terminalEmptySweepRawSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex offset count : Nat)
    (registers : Registers program) (carrier : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program}
    (coherent : RegistersCoherent registers phase [] true)
    (snapshotInv :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (offset + 1) 0 environment
      ReachableAudit.Holds program dispatcher.tree bits continuation carrier)
    (carrierDecode :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (offset + 1) 0 environment
      CarrierDecoder.decode? program dispatcher.tree bits continuation
        (Dovetail.clockExit_admissible (offset + 1) 0 environment) carrier =
        some [])
    (phaseEq :
      (SchedulerCycle.emptySweepRegisters program count registers).phase =
        CheckpointDecoder.expectedPhase program (offset + 1)) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (offset + 1) 0 environment
    let finalRegisters :=
      SchedulerCycle.emptySweepRegisters program count registers
    let finalCarrier :=
      SchedulerCycle.emptySweepCarrier program dispatcher bits continuation
        count registers carrier
    let marker :=
      SchedulerRootContinuation.emptyMarkerMutationConfiguration program
        dispatcher finalRegisters bits continuation finalCarrier outerParents
    exists prefixConfigurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerRootContinuation.emptyNextStageSourceConfiguration program
          dispatcher finalRegisters bits (offset + 1) environment finalCarrier
          outerParents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier
          (PrimitiveFuel.pendingParents environment continuation count
            outerParents))
        (prefixConfigurations ++ [marker]) /\
      IndexedResponseSampledStates program dispatcher bits sampleIndex
        prefixConfigurations /\
      (prefixConfigurations ++ [marker]).length =
        SchedulerRootContinuation.emptyCleanupMutations program dispatcher count
          registers /\
      LastSample (prefixConfigurations ++ [marker]) marker /\
      CompletedParents program dispatcher
        (SchedulerRootContinuation.emptyContinuationParents program dispatcher
          finalRegisters bits finalCarrier outerParents) (layers + 1) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (offset + 1) 0 environment
  let finalRegisters :=
    SchedulerCycle.emptySweepRegisters program count registers
  let finalCarrier :=
    SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count
      registers carrier
  let marker :=
    SchedulerRootContinuation.emptyMarkerMutationConfiguration program
      dispatcher finalRegisters bits continuation finalCarrier outerParents
  obtain ⟨sweepConfigurations, sweepChain, sweepSampled, sweepLength⟩ :=
    pendingEmptySweepSegment program dispatcher bits bits continuation
      outerParents layers outer count sampleIndex registers carrier phase coherent
      snapshotInv
  have finalCoherent : RegistersCoherent finalRegisters
      (emptySweepPhase program count phase) [] true := by
    exact emptySweepRegisters_coherent program count registers phase coherent
  have finalAudit : ReachableAudit.Holds program dispatcher.tree bits
      continuation finalCarrier := by
    exact emptySweepCarrier_holds program dispatcher bits continuation count
      registers carrier snapshotInv
  have finalDecode : CarrierDecoder.decode? program dispatcher.tree bits
      continuation (Dovetail.clockExit_admissible (offset + 1) 0 environment)
      finalCarrier = some [] := by
    exact emptySweepCarrier_decode_of program dispatcher bits continuation
      (Dovetail.clockExit_admissible (offset + 1) 0 environment) count registers
      carrier carrierDecode
  obtain ⟨preMarker, ⟨result, terminal⟩⟩ :=
    terminalEmptyRawShapesAt program dispatcher bits offset finalRegisters
      finalCarrier outerParents layers outer finalDecode phaseEq
  obtain ⟨responseConfigurations, terminalChain, responseSampled,
      responseLength, terminalLast⟩ :=
    emptyFrameExactWithSampledPrefix program dispatcher bits finalRegisters bits
      continuation finalCarrier outerParents finalCoherent finalAudit
      (sampleIndex + sweepConfigurations.length) (by
        intro index pc cursor done term position eraseEq root
        exact emptyResponse_preMarkerSilent program dispatcher finalRegisters
          bits continuation finalCarrier
          (Dovetail.clockExit_admissible (offset + 1) 0 environment) finalAudit
          outerParents layers outer preMarker eraseEq root)
  obtain ⟨postTicks, post⟩ := terminalEmptyPostMarker_zeroRunAt program
    dispatcher bits offset finalRegisters finalCarrier outerParents layers outer
  have postChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerRootContinuation.emptyNextStageSourceConfiguration program
        dispatcher finalRegisters bits (offset + 1) environment finalCarrier
        outerParents)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher
        finalRegisters bits continuation finalCarrier outerParents) [] :=
    .done postTicks (by simpa [continuation, environment] using post)
  have throughMarker := SchedulerRecurrence.ExactMutationChain.append sweepChain
    terminalChain
  have completeChain := SchedulerRecurrence.ExactMutationChain.append
    throughMarker postChain
  have prefixSampled :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      bits sweepSampled responseSampled
  let prefixConfigurations := sweepConfigurations ++ responseConfigurations
  refine ⟨prefixConfigurations, ?_, ?_, ?_, ?_,
    outer.empty finalRegisters bits finalCarrier⟩
  · simpa [prefixConfigurations, List.append_assoc, marker, finalRegisters,
      finalCarrier, continuation, environment] using completeChain
  · simpa [prefixConfigurations] using prefixSampled
  · simp only [prefixConfigurations, List.length_append,
      List.length_singleton]
    rw [sweepLength, responseLength]
    simp [SchedulerRootContinuation.emptyCleanupMutations, finalRegisters,
      Nat.add_assoc]
  · exact LastSample.appendLeft prefixConfigurations (.one marker)

/-- Certificate-bearing terminal EMPTY suffix for an arbitrary seed.  This is
the semantic companion of `terminalEmptySweepRawSegmentAt`: it classifies the
same terminal marker using the `PositivePrefix` constructed from the raw exact
stage chain. -/
theorem terminalEmptySweepSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex offset count : Nat)
    (registers : Registers program) (carrier : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program}
    (coherent : RegistersCoherent registers phase [] true)
    (snapshotInv :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (offset + 1) 0 environment
      ReachableAudit.Holds program dispatcher.tree bits continuation carrier)
    (carrierDecode :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (offset + 1) 0 environment
      CarrierDecoder.decode? program dispatcher.tree bits continuation
        (Dovetail.clockExit_admissible (offset + 1) 0 environment) carrier =
        some [])
    (phaseEq :
      (SchedulerCycle.emptySweepRegisters program count registers).phase =
        CheckpointDecoder.expectedPhase program (offset + 1))
    {activeContext : Context}
    {checkpointChain : CheckpointDecoder.ChainView program}
    (certificate :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (offset + 1) 0 environment
      let finalRegisters :=
        SchedulerCycle.emptySweepRegisters program count registers
      let finalCarrier :=
        SchedulerCycle.emptySweepCarrier program dispatcher bits continuation
          count registers carrier
      CheckpointRun.PositivePrefix program dispatcher bits (offset + 1)
        (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
          dispatcher finalRegisters bits continuation finalCarrier
          outerParents).cursor.erase
        (ExactCheckpointRun.checkpointTime program dispatcher bits
          (offset + 1)) activeContext checkpointChain)
    (indexEq : sampleIndex +
        SchedulerRootContinuation.emptyCleanupMutations program dispatcher count
          registers =
      ExactCheckpointRun.checkpointTime program dispatcher bits (offset + 1)) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (offset + 1) 0 environment
    let finalRegisters :=
      SchedulerCycle.emptySweepRegisters program count registers
    let finalCarrier :=
      SchedulerCycle.emptySweepCarrier program dispatcher bits continuation
        count registers carrier
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerRootContinuation.emptyNextStageSourceConfiguration program
          dispatcher finalRegisters bits (offset + 1) environment finalCarrier
          outerParents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier
          (PrimitiveFuel.pendingParents environment continuation count
            outerParents)) configurations /\
      IndexedResponseSampledStates program dispatcher bits sampleIndex
        configurations /\
      configurations.length =
        SchedulerRootContinuation.emptyCleanupMutations program dispatcher count
          registers /\
      CompletedParents program dispatcher
        (SchedulerRootContinuation.emptyContinuationParents program dispatcher
          finalRegisters bits finalCarrier outerParents) (layers + 1) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (offset + 1) 0 environment
  let finalRegisters :=
    SchedulerCycle.emptySweepRegisters program count registers
  let finalCarrier :=
    SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count
      registers carrier
  obtain ⟨sweepConfigurations, sweepChain, sweepSampled, sweepLength⟩ :=
    pendingEmptySweepSegment program dispatcher bits bits continuation
      outerParents layers outer count sampleIndex registers carrier phase coherent
      snapshotInv
  have finalCoherent : RegistersCoherent finalRegisters
      (emptySweepPhase program count phase) [] true := by
    exact emptySweepRegisters_coherent program count registers phase coherent
  have finalAudit : ReachableAudit.Holds program dispatcher.tree bits
      continuation finalCarrier := by
    exact emptySweepCarrier_holds program dispatcher bits continuation count
      registers carrier snapshotInv
  have finalDecode : CarrierDecoder.decode? program dispatcher.tree bits
      continuation (Dovetail.clockExit_admissible (offset + 1) 0 environment)
      finalCarrier = some [] := by
    exact emptySweepCarrier_decode_of program dispatcher bits continuation
      (Dovetail.clockExit_admissible (offset + 1) 0 environment) count registers
      carrier carrierDecode
  obtain ⟨preMarker, ⟨result, terminal⟩⟩ :=
    terminalEmptyRawShapesAt program dispatcher bits offset finalRegisters
      finalCarrier outerParents layers outer finalDecode phaseEq
  have terminalIndexEq :
      (sampleIndex + sweepConfigurations.length) +
          (LocalResponse.completedCost program
            (dispatcher.route (finalRegisters.phase, false))
            (finalRegisters.phase, false) + 1) =
        ExactCheckpointRun.checkpointTime program dispatcher bits
          (offset + 1) := by
    rw [sweepLength]
    simpa [SchedulerRootContinuation.emptyCleanupMutations, finalRegisters,
      Nat.add_assoc] using indexEq
  obtain ⟨terminalConfigurations, terminalChain, terminalSampled,
      terminalLength⟩ := terminalEmptyFrameSegmentAt program dispatcher bits
    (sampleIndex + sweepConfigurations.length) offset finalRegisters finalCarrier
    outerParents layers outer finalCoherent finalAudit preMarker terminal
    certificate terminalIndexEq
  obtain ⟨postTicks, post⟩ := terminalEmptyPostMarker_zeroRunAt program
    dispatcher bits offset finalRegisters finalCarrier outerParents layers outer
  have postChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerRootContinuation.emptyNextStageSourceConfiguration program
        dispatcher finalRegisters bits (offset + 1) environment finalCarrier
        outerParents)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher
        finalRegisters bits continuation finalCarrier outerParents) [] :=
    .done postTicks (by simpa [continuation, environment] using post)
  have throughMarker := SchedulerRecurrence.ExactMutationChain.append sweepChain
    terminalChain
  have completeChain := SchedulerRecurrence.ExactMutationChain.append
    throughMarker postChain
  have completeSampled :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      bits sweepSampled terminalSampled
  refine ⟨sweepConfigurations ++ terminalConfigurations, ?_,
    completeSampled, ?_, outer.empty finalRegisters bits finalCarrier⟩
  · simpa [List.append_assoc, finalRegisters, finalCarrier, continuation,
      environment] using completeChain
  · simp only [List.length_append]
    rw [sweepLength, terminalLength]
    simp [SchedulerRootContinuation.emptyCleanupMutations, finalRegisters,
      Nat.add_assoc]

/-! ## Complete horizon-ending empty job -/

/-- Certificate-free complete terminal job for the definitionally empty seed.
Its final marker remains a singleton suffix while every preceding contraction
already carries its silent sampled-state proof. -/
theorem terminalEmptyJobRawSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (sampleIndex fuel : Nat) (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) []
    let continuation := Dovetail.clockExit (fuel + 1) 0 environment
    let finalRegisters := SchedulerCycle.emptySweepRegisters program fuel
      (initialEmptyRegisters program)
    let finalCarrier := SchedulerCycle.emptySweepCarrier program dispatcher []
      continuation fuel (initialEmptyRegisters program)
      (baseCarrier environment continuation)
    let marker :=
      SchedulerRootContinuation.emptyMarkerMutationConfiguration program
        dispatcher finalRegisters [] continuation finalCarrier outerParents
    exists prefixConfigurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerRootContinuation.emptyNextStageSourceConfiguration program
          dispatcher finalRegisters [] (fuel + 1) environment finalCarrier
          outerParents)
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
          (Registers.newJob program) continuation outerParents (fuel + 1) 0)
        (prefixConfigurations ++ [marker]) /\
      IndexedResponseSampledStates program dispatcher [] sampleIndex
        prefixConfigurations /\
      (prefixConfigurations ++ [marker]).length =
        SchedulerRootContinuation.emptyCleanupMutations program dispatcher fuel
          (initialEmptyRegisters program) /\
      LastSample (prefixConfigurations ++ [marker]) marker /\
      CompletedParents program dispatcher
        (SchedulerRootContinuation.emptyContinuationParents program dispatcher
          finalRegisters [] finalCarrier outerParents) (layers + 1) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) []
  let continuation := Dovetail.clockExit (fuel + 1) 0 environment
  let initialRegisters := initialEmptyRegisters program
  let initialCarrier := baseCarrier environment continuation
  let finalRegisters := SchedulerCycle.emptySweepRegisters program fuel
    initialRegisters
  let finalCarrier := SchedulerCycle.emptySweepCarrier program dispatcher []
    continuation fuel initialRegisters initialCarrier
  let marker :=
    SchedulerRootContinuation.emptyMarkerMutationConfiguration program
      dispatcher finalRegisters [] continuation finalCarrier outerParents
  obtain ⟨baseTicks, baseEntry⟩ := emptyBase_toFirstFrame_zeroRun program
    dispatcher continuation
      (Dovetail.clockExit_admissible (fuel + 1) 0 environment) fuel outerParents
  have initialCoherent : RegistersCoherent initialRegisters
      (CTS.zeroPhase program) [] true := initialEmptyRegisters_coherent program
  have initialAudit : ReachableAudit.Holds program dispatcher.tree []
      continuation initialCarrier := by
    simpa [initialCarrier, environment] using
      (ReachableAudit.Holds.initial program dispatcher.tree [] continuation)
  have initialDecode : CarrierDecoder.decode? program dispatcher.tree []
      continuation (Dovetail.clockExit_admissible (fuel + 1) 0 environment)
      initialCarrier = some [] := by
    exact CarrierDecoder.decode?_initial program dispatcher.tree [] continuation
      (Dovetail.clockExit_admissible (fuel + 1) 0 environment)
  obtain ⟨prefixConfigurations, suffixChain, prefixSampled, suffixLength,
      finalSample, extended⟩ := terminalEmptySweepRawSegmentAt program
    dispatcher [] sampleIndex fuel fuel initialRegisters initialCarrier
    outerParents layers outer initialCoherent initialAudit initialDecode
    (initialEmptySweep_phase_eq_expectedPhase program fuel)
  have completeChain := ExactMutationChain.prepend baseEntry suffixChain
  refine ⟨prefixConfigurations, ?_, prefixSampled, suffixLength, finalSample,
    extended⟩
  have sourceEq :
      SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
        (Registers.newJob program) continuation outerParents (fuel + 1) 0 =
      fuelZeroFifthMutationConfiguration program dispatcher
        (Registers.newJob program) environment continuation
        (PrimitiveFuel.pendingParents environment continuation (fuel + 1)
          outerParents) := by
    simp [SchedulerNestedPhase.fuelTerminalConfigurationAt,
      fuelSampleEndDepth_eq, environment]
  rw [sourceEq]
  simpa [environment, continuation, initialRegisters, initialCarrier,
    finalRegisters, finalCarrier, marker] using completeChain

/-- An empty bounded job whose continuation is terminal runs from its final
Base-producing fuel sample through all pending EMPTY frames, exposes its unique
marked checkpoint at the caller-supplied exact time, and reaches the next-stage
clock source without another contraction.  The surrounding completed zipper
is extended by exactly the terminal marked Local. -/
theorem terminalEmptyJobSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleIndex fuel : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {activeContext : Context}
    {checkpointChain : CheckpointDecoder.ChainView program}
    (certificate :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) []
      let continuation := Dovetail.clockExit (fuel + 1) 0 environment
      let registers := SchedulerCycle.emptySweepRegisters program fuel
        (initialEmptyRegisters program)
      let carrier := SchedulerCycle.emptySweepCarrier program dispatcher []
        continuation fuel (initialEmptyRegisters program)
        (baseCarrier environment continuation)
      CheckpointRun.PositivePrefix program dispatcher inputBits (fuel + 1)
        (SchedulerRootContinuation.emptyMarkerMutationConfiguration program
          dispatcher registers [] continuation carrier
          outerParents).cursor.erase
        (ExactCheckpointRun.checkpointTime program dispatcher inputBits
          (fuel + 1)) activeContext checkpointChain)
    (outputEmpty :
      (CTS.iterate program (fuel + 1)
        (CTS.initial program inputBits)).data = [])
    (indexEq : sampleIndex +
        SchedulerRootContinuation.emptyCleanupMutations program dispatcher fuel
          (initialEmptyRegisters program) =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (fuel + 1)) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) []
    let continuation := Dovetail.clockExit (fuel + 1) 0 environment
    let registers := SchedulerCycle.emptySweepRegisters program fuel
      (initialEmptyRegisters program)
    let carrier := SchedulerCycle.emptySweepCarrier program dispatcher []
      continuation fuel (initialEmptyRegisters program)
      (baseCarrier environment continuation)
    exists configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerRootContinuation.emptyNextStageSourceConfiguration program
          dispatcher registers [] (fuel + 1) environment carrier outerParents)
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
          (Registers.newJob program) continuation outerParents (fuel + 1) 0)
        configurations /\
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations /\
      configurations.length =
        SchedulerRootContinuation.emptyCleanupMutations program dispatcher fuel
          (initialEmptyRegisters program) /\
      CompletedParents program dispatcher
        (SchedulerRootContinuation.emptyContinuationParents program dispatcher
          registers [] carrier outerParents) (layers + 1) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) []
  let continuation := Dovetail.clockExit (fuel + 1) 0 environment
  let initialCarrier := baseCarrier environment continuation
  let initialRegisters := initialEmptyRegisters program
  let finalRegisters := SchedulerCycle.emptySweepRegisters program fuel
    initialRegisters
  let finalCarrier := SchedulerCycle.emptySweepCarrier program dispatcher []
    continuation fuel initialRegisters initialCarrier
  obtain ⟨baseTicks, baseEntry⟩ := emptyBase_toFirstFrame_zeroRun program
    dispatcher continuation (Dovetail.clockExit_admissible (fuel + 1) 0
      environment) fuel outerParents
  have initialCoherent : RegistersCoherent initialRegisters
      (CTS.zeroPhase program) [] true := initialEmptyRegisters_coherent program
  have initialAudit : ReachableAudit.Holds program dispatcher.tree []
      continuation initialCarrier := by
    simpa [initialCarrier, environment] using
      (ReachableAudit.Holds.initial program dispatcher.tree [] continuation)
  obtain ⟨sweepConfigurations, sweepChain, sweepSampled, sweepLength⟩ :=
    pendingEmptySweepSegment program dispatcher inputBits [] continuation
      outerParents layers outer fuel sampleIndex initialRegisters initialCarrier
      (CTS.zeroPhase program) initialCoherent initialAudit
  have finalCoherent : RegistersCoherent finalRegisters
      (emptySweepPhase program fuel (CTS.zeroPhase program)) [] true := by
    exact emptySweepRegisters_coherent program fuel initialRegisters
      (CTS.zeroPhase program) initialCoherent
  have finalAudit : ReachableAudit.Holds program dispatcher.tree [] continuation
      finalCarrier := by
    exact emptySweepCarrier_holds program dispatcher [] continuation fuel
      initialRegisters initialCarrier initialAudit
  have finalDecode : CarrierDecoder.decode? program dispatcher.tree []
      continuation (Dovetail.clockExit_admissible (fuel + 1) 0 environment)
      finalCarrier = some [] := by
    exact emptySweepCarrier_decode program dispatcher continuation
      (Dovetail.clockExit_admissible (fuel + 1) 0 environment) fuel
      initialRegisters
  obtain ⟨preMarker, ⟨result, terminal⟩⟩ := terminalEmptyShapes program
    dispatcher inputBits fuel finalRegisters finalCarrier outerParents layers
    outer finalDecode certificate outputEmpty
  have terminalIndexEq :
      (sampleIndex + sweepConfigurations.length) +
          (LocalResponse.completedCost program
            (dispatcher.route (finalRegisters.phase, false))
            (finalRegisters.phase, false) + 1) =
        ExactCheckpointRun.checkpointTime program dispatcher inputBits
          (fuel + 1) := by
    rw [sweepLength]
    simpa [SchedulerRootContinuation.emptyCleanupMutations, finalRegisters,
      initialRegisters, Nat.add_assoc] using indexEq
  obtain ⟨terminalConfigurations, terminalChain, terminalSampled,
      terminalLength⟩ := terminalEmptyFrameSegment program dispatcher inputBits
    (sampleIndex + sweepConfigurations.length) fuel finalRegisters finalCarrier
    outerParents layers outer finalCoherent finalAudit preMarker terminal
    certificate terminalIndexEq
  obtain ⟨postTicks, post⟩ := terminalEmptyPostMarker_zeroRun program
    dispatcher fuel finalRegisters finalCarrier outerParents layers outer
  have postChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerRootContinuation.emptyNextStageSourceConfiguration program
        dispatcher finalRegisters [] (fuel + 1) environment finalCarrier
        outerParents)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher
        finalRegisters [] continuation finalCarrier outerParents) [] :=
    .done postTicks (by simpa [continuation, environment] using post)
  have fromFirstFrame := SchedulerRecurrence.ExactMutationChain.append sweepChain
    terminalChain
  have fromFirstFrame' := SchedulerRecurrence.ExactMutationChain.append
    fromFirstFrame postChain
  have completeChain := ExactMutationChain.prepend baseEntry fromFirstFrame'
  have completeSampled :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      inputBits sweepSampled terminalSampled
  refine ⟨sweepConfigurations ++ terminalConfigurations, ?_,
    completeSampled, ?_, outer.empty finalRegisters [] finalCarrier⟩
  · have sourceEq :
        SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
          (Registers.newJob program) continuation outerParents (fuel + 1) 0 =
        fuelZeroFifthMutationConfiguration program dispatcher
          (Registers.newJob program) environment continuation
          (PrimitiveFuel.pendingParents environment continuation (fuel + 1)
            outerParents) := by
        simp [SchedulerNestedPhase.fuelTerminalConfigurationAt,
          fuelSampleEndDepth_eq, environment]
    rw [sourceEq]
    simpa [environment, continuation, initialCarrier, initialRegisters,
      finalRegisters, finalCarrier] using completeChain
  · simp only [List.length_append]
    rw [sweepLength, terminalLength]
    simp [SchedulerRootContinuation.emptyCleanupMutations, finalRegisters,
      initialRegisters, Nat.add_assoc]

end SchedulerNestedEmpty

end PureSFormal.PureS
