import PureSFormal.PureS.SchedulerResponseClassification

/-!
# Construction-facing sampled scheduler recurrence

This module starts the all-stage productivity recurrence above the exact
clock/fuel layer.  Its first theorem packages every contraction of a normal
response below a positive canonical pending stack, including executable
searches, exact global sample indices, and decoder silence.
-/

namespace PureSFormal.PureS

namespace SchedulerCycle

open FiniteController SchedulerControl SchedulerInvariant
  SchedulerResponseInvariant

namespace ResponseSamplePairs

/-- A structural response pairing is one-for-one, so its executable and
semantic enumerations have identical lengths. -/
theorem length_eq
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {registers : Registers program} {bit : Bool}
    {bits : List Bool} {continuation carrier : Term}
    {parents : List ParentFrame}
    {configurations : List
      (SchedulerResponseInvariant.Configuration program dispatcher)}
    {entries : List (Bool × Term)}
    (pairs : ResponseSamplePairs program dispatcher registers bit bits
      continuation carrier parents configurations entries) :
    configurations.length = entries.length := by
  induction pairs with
  | nil => rfl
  | cons pc cursor done term position eraseEq root tail ih =>
      simp only [List.length_cons]
      exact congrArg Nat.succ ih

end ResponseSamplePairs

/-! ## The unique final response flag -/

/-- A response-entry list consists of zero or more silent samples followed by
one and only one completed sample.  Keeping this as an inductive list
predicate makes the final sample's exact index available without subtraction.
-/
inductive FinalResponseFlags : List (Bool × Term) → Prop where
  | last (term : Term) : FinalResponseFlags [(true, term)]
  | silent (term : Term) {tail : List (Bool × Term)}
      (rest : FinalResponseFlags tail) :
      FinalResponseFlags ((false, term) :: tail)

namespace FinalResponseFlags

/-- Changing only the term component preserves the unique-final-flag shape. -/
theorem mapTerm (function : Term → Term) :
    ∀ {entries : List (Bool × Term)}, FinalResponseFlags entries →
      FinalResponseFlags
        (entries.map fun entry => (entry.1, function entry.2))
  | _, .last term => .last (function term)
  | _, .silent term rest => .silent (function term) (mapTerm function rest)

/-- Mapping a response wrapper whose Boolean guard is true preserves the
unique final flag without any extensional equality of mapping functions. -/
theorem mapAndTrue (function : Term → Term) :
    ∀ {entries : List (Bool × Term)}, FinalResponseFlags entries →
      FinalResponseFlags
        (entries.map fun entry => (entry.1 && true, function entry.2))
  | _, .last term => .last (function term)
  | _, .silent term rest => .silent (function term) (mapAndTrue function rest)

/-- A list whose flags are all false can be prepended to a uniquely final
response list. -/
theorem prependFalse :
    ∀ (leading : List (Bool × Term)),
      (∀ entry, entry ∈ leading → entry.1 = false) →
      ∀ {tail}, FinalResponseFlags tail → FinalResponseFlags (leading ++ tail)
  | [], _, _, final => final
  | entry :: leading, allFalse, tail, final => by
      have headFalse : entry.1 = false :=
        allFalse entry (List.Mem.head leading)
      obtain ⟨flag, term⟩ := entry
      simp only at headFalse
      subst flag
      exact .silent term
        (prependFalse leading
          (fun later membership =>
            allFalse later (List.Mem.tail (false, term) membership)) final)

end FinalResponseFlags

/-- The dispatcher-route contraction trace has exactly one final flag, at its
selected leaf. -/
theorem routeEntries_finalFlags
    {Label : Type} (encode : Label → Term) (carrier : Term)
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) :
    FinalResponseFlags
      (SchedulerResponseInvariant.routeEntries encode carrier tree route) := by
  induction path with
  | leaf stored => exact .last _
  | @left route label left right path ih =>
      exact .silent _ (.silent _
        (FinalResponseFlags.mapTerm
          (fun term => RouteGrammar.selectedLeft carrier term
            (RouteGrammar.compiledCall encode right carrier)) ih))
  | @right route label left right path ih =>
      exact .silent _ (.silent _
        (FinalResponseFlags.mapTerm
          (fun term => RouteGrammar.selectedRight carrier
            (RouteGrammar.compiledCall encode left carrier) term) ih))

/-- Every flag in a route trace becomes false when the response appendant is
nonempty and the route completion is therefore not yet the response end. -/
theorem routeEntries_wrapped_allFalse
    {Label : Type} (encode : Label → Term) (carrier : Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route)
    (wrapTerm : Term → Term) :
    ∀ entry,
      entry ∈
        (SchedulerResponseInvariant.routeEntries encode carrier tree route).map
          (fun item => (item.1 && false, wrapTerm item.2)) →
      entry.1 = false := by
  intro entry member
  obtain ⟨source, sourceMember, sourceEq⟩ :=
    SchedulerResponseInvariant.exists_of_mem_map_clean _ member
  rw [← sourceEq]
  simp

/-- A nonempty appender trace has exactly one final flag, at its last Push
contraction. -/
theorem actionEntries_finalFlags
    (expected : Nat) (bit : Bool) (rest : List Bool) (initial : Term)
    (outer : List Term)
    (count : expected = (bit :: rest).length + outer.length) :
    FinalResponseFlags
      (SchedulerResponseInvariant.actionEntries expected (bit :: rest) initial
        outer count) := by
  induction rest generalizing bit initial outer with
  | nil =>
      exact .silent _ (.last _)
  | cons next tail ih =>
      apply FinalResponseFlags.silent
      apply FinalResponseFlags.silent
      exact ih next (extendAccumulator bit initial)
        (pushHistory bit initial :: outer) (by
          simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using count)

/-- The explicit response list has one final flag for every possible
appendant.  Keeping the appendant as a direct structural argument avoids any
extensional rewrite beneath the route-map lambda. -/
theorem explicitResponseEntries_finalFlags
    (program : CTS.Program) {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term)
    (emitted : List Bool) :
    FinalResponseFlags
      ([(false, SchedulerResponseInvariant.frameFirstRoot
            (compileActions program tree) bits continuation carrier),
          (false, SchedulerResponseInvariant.frameSecondRoot
            (compileActions program tree) bits continuation carrier),
          (false, freshLocal (compileActions program tree) bits continuation
            carrier)] ++
        (SchedulerResponseInvariant.routeEntries (selectedAction program)
          carrier tree route).map (fun entry =>
            (entry.1 && emitted.isEmpty,
              Carrier.activeShell bits continuation (freshHField carrier)
                entry.2 carrier carrier)) ++
        (SchedulerResponseInvariant.actionEntries emitted.length emitted carrier
          [] (Nat.add_zero emitted.length).symm).map (fun entry =>
            (entry.1, Carrier.activeShell bits continuation
              (freshHField carrier)
              (PrimitiveRoute.withResponse (selectedAction program) tree route
                carrier entry.2) carrier carrier))) := by
  cases emitted with
  | nil =>
      have routeFinal := FinalResponseFlags.mapAndTrue
        (fun term => Carrier.activeShell bits continuation
          (freshHField carrier) term carrier carrier)
        (routeEntries_finalFlags (selectedAction program) carrier path)
      change FinalResponseFlags
        ([(false, SchedulerResponseInvariant.frameFirstRoot
              (compileActions program tree) bits continuation carrier),
            (false, SchedulerResponseInvariant.frameSecondRoot
              (compileActions program tree) bits continuation carrier),
            (false, freshLocal (compileActions program tree) bits continuation
              carrier)] ++
          (SchedulerResponseInvariant.routeEntries (selectedAction program)
            carrier tree route).map (fun entry =>
              (entry.1 && true, Carrier.activeShell bits continuation
                (freshHField carrier) entry.2 carrier carrier)) ++ [])
      rw [List.append_nil]
      exact .silent _ (.silent _ (.silent _ routeFinal))
  | cons bit rest =>
      let routeWrapped :=
        (SchedulerResponseInvariant.routeEntries (selectedAction program)
          carrier tree route).map fun entry =>
            (entry.1 && false,
              Carrier.activeShell bits continuation (freshHField carrier)
                entry.2 carrier carrier)
      have routeFalse : ∀ entry, entry ∈ routeWrapped → entry.1 = false :=
        routeEntries_wrapped_allFalse (selectedAction program) carrier tree route
          (fun term => Carrier.activeShell bits continuation
            (freshHField carrier) term carrier carrier)
      have actionFinal := FinalResponseFlags.mapTerm
        (fun term => Carrier.activeShell bits continuation
          (freshHField carrier)
          (PrimitiveRoute.withResponse (selectedAction program) tree route
            carrier term) carrier carrier)
        (actionEntries_finalFlags (bit :: rest).length bit rest carrier []
          (Nat.add_zero (bit :: rest).length).symm)
      have bodyFinal := FinalResponseFlags.prependFalse routeWrapped routeFalse
        actionFinal
      exact .silent _ (.silent _ (.silent _ bodyFinal))

/-- The complete response enumeration has exactly one final flag, independent
of whether completion occurs at the route leaf or at the last Push. -/
theorem responseEntries_finalFlags
    (program : CTS.Program) {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term) :
    FinalResponseFlags
      (SchedulerResponseInvariant.responseEntries program path bits
        continuation carrier) := by
  unfold SchedulerResponseInvariant.responseEntries
  exact explicitResponseEntries_finalFlags program path bits continuation
    carrier (PrimitiveLocalResponse.emitted program label)

/-- Empty appendants finish at the route leaf. -/
theorem responseEntries_finalFlags_nil
    (program : CTS.Program) {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term)
    (_emittedEq : PrimitiveLocalResponse.emitted program label = []) :
    FinalResponseFlags
      (SchedulerResponseInvariant.responseEntries program path bits
        continuation carrier) :=
  responseEntries_finalFlags program path bits continuation carrier

/-- Nonempty appendants finish at their last Push contraction. -/
theorem responseEntries_finalFlags_cons
    (program : CTS.Program) {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term)
    (bit : Bool) (rest : List Bool)
    (_emittedEq : PrimitiveLocalResponse.emitted program label = bit :: rest) :
    FinalResponseFlags
      (SchedulerResponseInvariant.responseEntries program path bits
        continuation carrier) :=
  responseEntries_finalFlags program path bits continuation carrier

/-! ## Root-level final-sample classification -/

/-- A positive-prefix certificate whose decoded queue is nonempty exposes a
fresh terminal checkpoint. -/
def positivePrefix_freshTerminal
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {inputBits : List Bool} {horizon : Nat} {term : Term}
    {contractions : Nat} {activeContext : Context}
    {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      horizon term contractions activeContext chain)
    (nonempty :
      (CTS.iterate program horizon (CTS.initial program inputBits)).data ≠ []) :
    CheckpointExclusion.TerminalCheckpointShape program dispatcher.tree .fresh
      ⟨horizon, chain.last.route, chain.last.label,
        (CTS.iterate program horizon (CTS.initial program inputBits)).data⟩
      term := by
  have statusFresh : chain.last.status = .fresh := by
    have compatible :=
      (CheckpointDecoder.markerCompatible_eq_true_iff chain.last.status
        (CTS.iterate program horizon
          (CTS.initial program inputBits)).data).mp
        certificate.marker_compatible
    cases statusEq : chain.last.status with
    | fresh => rfl
    | marked =>
        have empty := compatible.mp statusEq
        exact (nonempty empty).elim
  have terminalHorizon : chain.terminal.horizon = horizon :=
    congrArg CheckpointDecoder.TerminalView.horizon certificate.terminal
  exact
    { chain := chain
      chainShape := certificate.chainShape
      phase := by
        rw [terminalHorizon]
        exact certificate.final_phase
      carrier := certificate.final_queue
      marker := certificate.marker_compatible
      result_eq := by rw [terminalHorizon]
      status_eq := statusFresh }

namespace ResponseSamplePairs

/-- Root response classifications with a public nonempty checkpoint at the
unique final contraction.  The length equation threads the absolute index
constructively through the false-prefix induction. -/
theorem positiveRootClassifications
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (offset : Nat)
    {activeContext : Context} {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      (offset + 1)
      (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier))
      (ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) activeContext chain)
    (nonempty :
      (CTS.iterate program (offset + 1)
        (CTS.initial program inputBits)).data ≠ []) :
    ∀ {configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher)}
      {entries : List (Bool × Term)} {sampleIndex : Nat},
      ResponseSamplePairs program dispatcher registers bit bits continuation
        carrier [] configurations entries →
      FinalResponseFlags entries →
      sampleIndex + configurations.length =
        ExactCheckpointRun.checkpointTime program dispatcher inputBits
          (offset + 1) →
      ResponseClassifications program dispatcher inputBits registers bit
        sampleIndex configurations := by
  intro configurations entries sampleIndex pairs flags indexEq
  induction pairs generalizing sampleIndex with
  | nil => cases flags
  | @cons pc cursor done term position eraseEq root configurationTail entryTail
      tail ih =>
      cases flags with
      | last finalTerm =>
          cases tail with
          | nil =>
              have cursorEq : cursor.erase = term := by
                simpa [Cursor.rebuild] using eraseEq
              have completedEq : term =
                  LocalResponse.completed bits continuation carrier
                    (SchedulerResponse.completedRoute program dispatcher
                      registers bit carrier) := by
                simpa [SchedulerResponse.completedRoute] using root.done_eq rfl
              have terminalCertificate : CheckpointRun.PositivePrefix program
                  dispatcher inputBits (offset + 1) cursor.erase
                  (ExactCheckpointRun.checkpointTime program dispatcher
                    inputBits (offset + 1)) activeContext chain := by
                rw [cursorEq, completedEq]
                exact certificate
              have terminal := positivePrefix_freshTerminal terminalCertificate
                nonempty
              have finalIndex : sampleIndex + 1 =
                  ExactCheckpointRun.checkpointTime program dispatcher
                    inputBits (offset + 1) := by
                simpa using indexEq
              obtain ⟨decoder, event⟩ :=
                ResponseSamplePairs.terminalClassification program dispatcher
                  inputBits sampleIndex offset terminal terminalCertificate
                  finalIndex
              exact .cons sampleIndex pc cursor decoder event (.nil _)
      | silent silentTerm rest =>
          have cursorEq : cursor.erase = term := by
            simpa [Cursor.rebuild] using eraseEq
          have rootClassification :=
            ResponseSamplePairs.rootIntermediateClassification program
              dispatcher inputBits registers bit bits continuation carrier
              hadmissible snapshotInv sampleIndex root
          have classification :
              DecoderEvidence program dispatcher.tree .frameDispatch
                  cursor.erase ∧
                EventEvidence program dispatcher inputBits (sampleIndex + 1)
                  .frameDispatch cursor.erase := by
            rw [cursorEq]
            exact rootClassification
          have tailIndex : (sampleIndex + 1) + configurationTail.length =
              ExactCheckpointRun.checkpointTime program dispatcher inputBits
                (offset + 1) := by
            calc
              (sampleIndex + 1) + configurationTail.length =
                  sampleIndex + (1 + configurationTail.length) :=
                Nat.add_assoc _ _ _
              _ = sampleIndex + (configurationTail.length + 1) := by
                rw [Nat.add_comm 1 configurationTail.length]
              _ = _ := by simpa using indexEq
          exact .cons sampleIndex pc cursor classification.1 classification.2
            (ih rest tailIndex)

/-- Root response classifications when the completed fresh Local decodes the
empty queue.  The unique final response sample is the registered
`framePreMarker` noncheckpoint; the subsequent marker contraction is handled
as a separate sampled edge. -/
theorem preMarkerRootClassifications
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (preMarker : CheckpointExclusion.PreMarkerEmptyShape program
      dispatcher.tree
      (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier))) :
    ∀ {configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher)}
      {entries : List (Bool × Term)} {sampleIndex : Nat},
      ResponseSamplePairs program dispatcher registers bit bits continuation
        carrier [] configurations entries →
      FinalResponseFlags entries →
      ResponseClassifications program dispatcher inputBits registers bit
        sampleIndex configurations := by
  intro configurations entries sampleIndex pairs flags
  induction pairs generalizing sampleIndex with
  | nil => cases flags
  | @cons pc cursor done term position eraseEq root configurationTail entryTail
      tail ih =>
      cases flags with
      | last finalTerm =>
          cases tail with
          | nil =>
              have cursorEq : cursor.erase = term := by
                simpa [Cursor.rebuild] using eraseEq
              have completedEq : term =
                  LocalResponse.completed bits continuation carrier
                    (SchedulerResponse.completedRoute program dispatcher
                      registers bit carrier) := by
                simpa [SchedulerResponse.completedRoute] using root.done_eq rfl
              have shape : CheckpointExclusion.PreMarkerEmptyShape program
                  dispatcher.tree cursor.erase := by
                rw [cursorEq, completedEq]
                exact preMarker
              let silent : SilentEvidence program dispatcher.tree
                  .frameDispatch cursor.erase :=
                .ofPublic (.framePreMarker shape)
              exact .cons sampleIndex pc cursor (.silent silent)
                (.silent silent) (.nil _)
      | silent silentTerm rest =>
          have cursorEq : cursor.erase = term := by
            simpa [Cursor.rebuild] using eraseEq
          have rootClassification :=
            ResponseSamplePairs.rootIntermediateClassification program
              dispatcher inputBits registers bit bits continuation carrier
              hadmissible snapshotInv sampleIndex root
          have classification :
              DecoderEvidence program dispatcher.tree .frameDispatch
                  cursor.erase ∧
                EventEvidence program dispatcher inputBits (sampleIndex + 1)
                  .frameDispatch cursor.erase := by
            rw [cursorEq]
            exact rootClassification
          exact .cons sampleIndex pc cursor classification.1 classification.2
            (ih rest)

end ResponseSamplePairs

/-- Exact root-level normal response whose unique final contraction is the
positive checkpoint at `offset + 1`. -/
theorem positiveRootResponseSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (sampleIndex offset : Nat)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (bitEq : registers.bit = some bit)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    {activeContext : Context} {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      (offset + 1)
      (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier))
      (ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) activeContext chain)
    (nonempty :
      (CTS.iterate program (offset + 1)
        (CTS.initial program inputBits)).data ≠ [])
    (indexEq : sampleIndex +
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, bit)) (registers.phase, bit) =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) :
    ∃ configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerResponse.returnConfiguration program dispatcher registers bit
          bits continuation carrier [])
        (SchedulerResponse.frameConfiguration program dispatcher registers bits
          continuation carrier []) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, bit)) (registers.phase, bit) ∧
      SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
        sampleIndex configurations.length
        (SchedulerResponse.frameConfiguration program dispatcher registers bits
          continuation carrier []) := by
  obtain ⟨configurations, scriptChain, pairs⟩ :=
    normalResponse_exactPairedMutationChain program dispatcher registers bit
      bits continuation carrier []
  have flags := responseEntries_finalFlags program
    (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
  have lengths := pairs.length_eq
  have entriesLength := responseEntries_length program
    (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
  have configurationLength : configurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit) :=
    lengths.trans entriesLength
  have classifications := ResponseSamplePairs.positiveRootClassifications
    program dispatcher inputBits registers bit bits continuation carrier
    hadmissible snapshotInv offset certificate nonempty pairs flags (by
      rw [configurationLength]
      exact indexEq)
  have sampled := ResponseSamplePairs.toIndexedSampledStates program dispatcher
    registers bit bits continuation carrier [] coherent snapshotInv pairs
    classifications
  have zeroPrefix := SchedulerResponse.enterResponse_zeroRun program dispatcher
    registers bit bits continuation carrier [] bitEq
  have completeChain := ExactMutationChain.prepend zeroPrefix scriptChain
  exact ⟨configurations, completeChain, sampled, configurationLength,
    ExactMutationChain.toExistentialAdvance program dispatcher inputBits
      sampleIndex completeChain sampled⟩

/-- Exact root-level normal response whose final fresh Local is still waiting
for the required empty-output marker contraction. -/
theorem preMarkerRootResponseSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term) (sampleIndex : Nat)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (bitEq : registers.bit = some bit)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (preMarker : CheckpointExclusion.PreMarkerEmptyShape program
      dispatcher.tree
      (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier))) :
    ∃ configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerResponse.returnConfiguration program dispatcher registers bit
          bits continuation carrier [])
        (SchedulerResponse.frameConfiguration program dispatcher registers bits
          continuation carrier []) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, bit)) (registers.phase, bit) ∧
      SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
        sampleIndex configurations.length
        (SchedulerResponse.frameConfiguration program dispatcher registers bits
          continuation carrier []) := by
  obtain ⟨configurations, scriptChain, pairs⟩ :=
    normalResponse_exactPairedMutationChain program dispatcher registers bit
      bits continuation carrier []
  have flags := responseEntries_finalFlags program
    (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
  have classifications := ResponseSamplePairs.preMarkerRootClassifications
    program dispatcher inputBits registers bit bits continuation carrier
    hadmissible snapshotInv preMarker (sampleIndex := sampleIndex) pairs flags
  have sampled := ResponseSamplePairs.toIndexedSampledStates program dispatcher
    registers bit bits continuation carrier [] coherent snapshotInv pairs
    classifications
  have lengths := pairs.length_eq
  have entriesLength := responseEntries_length program
    (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
  have configurationLength : configurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit) :=
    lengths.trans entriesLength
  have zeroPrefix := SchedulerResponse.enterResponse_zeroRun program dispatcher
    registers bit bits continuation carrier [] bitEq
  have completeChain := ExactMutationChain.prepend zeroPrefix scriptChain
  exact ⟨configurations, completeChain, sampled, configurationLength,
    ExactMutationChain.toExistentialAdvance program dispatcher inputBits
      sampleIndex completeChain sampled⟩

/-- At the last frame of a one-step job, an empty successor leaves the exact
fresh completed chain that must be rejected until its marker contraction. -/
def firstResponse_preMarkerShape
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : FirstResponseTrace program dispatcher bit suffix 0 outerContext
      fullContext innerContext targetContext ascentTicks)
    (dataEq : (CTS.absorbingStep program
      ⟨CTS.zeroPhase program, bit :: suffix⟩).data = []) :
    CheckpointExclusion.PreMarkerEmptyShape program dispatcher.tree
      (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
        innerContext).cursor.erase := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit 1 0 environment
  let carrier := deletedCarrier bit outerContext innerContext
  let registers := responseRegisters program bit suffix
  let route := dispatcher.route (registers.phase, bit)
  let label : ActionLabel program := (registers.phase, bit)
  let accumulator := actionAccumulator program label carrier
  let completedRoute :=
    SchedulerResponse.completedRoute program dispatcher registers bit carrier
  let terminal := CheckpointRun.terminalView 1 bits
  let view := CheckpointDecoder.completedView program route label accumulator
    bits continuation
  let chain : CheckpointDecoder.ChainView program := ⟨1, terminal, view⟩
  have terminalShape : CheckpointDecoder.ChainShape program dispatcher.tree
      continuation (.terminal terminal) := by
    apply CheckpointDecoder.ChainShape.terminal terminal
    · exact CheckpointDecoder.parseLocal?_terminal_none program dispatcher.tree
        1 environment
    · simpa [continuation, terminal, environment, bits] using!
        (CheckpointDecoder.parseTerminal?_clockExit
          (compileActions program dispatcher.tree) (word bits) 0)
  have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program
    dispatcher registers bit carrier
  have chainShape : CheckpointDecoder.ChainShape program dispatcher.tree
      (LocalResponse.completed bits continuation carrier completedRoute)
      (.completed chain) := by
    simpa [chain, view, route, label, accumulator, completedRoute] using
      (CheckpointDecoder.ChainShape.prepend_response_terminal bits dispatch
        terminalShape)
  have accumulatorDecode : CarrierDecoder.decode? program dispatcher.tree bits
      continuation (Dovetail.clockExit_admissible 1 0 environment) accumulator =
        some [] := by
    have decoded := CarrierActionDecode.decode_actionAccumulator program
      dispatcher.tree bits continuation
      (Dovetail.clockExit_admissible 1 0 environment) label trace.targetDecode
    have phaseEq : registers.phase = CTS.zeroPhase program :=
      responseRegisters_phase program bit suffix
    rw [ActionDecode.outputData_eq_ordinaryStep_data, phaseEq, dataEq] at decoded
    simpa [accumulator, label, carrier] using decoded
  have publicDecode : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      accumulator = some [] :=
    CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree bits
      continuation (Dovetail.clockExit_admissible 1 0 environment)
      accumulatorDecode
  have emptyShape : CheckpointDecoder.CarrierDecodes program dispatcher.tree
      accumulator [] :=
    CheckpointDecoder.decodeCarrier?_sound program dispatcher.tree publicDecode
  have shape : CheckpointExclusion.PreMarkerEmptyShape program dispatcher.tree
      (LocalResponse.completed bits continuation carrier completedRoute) :=
    ⟨chain, chainShape, rfl, by simpa [chain, view] using! emptyShape⟩
  simpa [firstReturnConfiguration, bits, environment, continuation, carrier,
    registers, completedRoute, SchedulerResponse.returnConfiguration,
    SchedulerResponse.completedCursor, Cursor.erase, Cursor.rebuild] using! shape

/-- A nonempty first-stage successor produces the full positive-prefix
certificate directly at the scheduler's literal completed response term. -/
theorem firstResponse_positivePrefix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : FirstResponseTrace program dispatcher bit suffix 0 outerContext
      fullContext innerContext targetContext ascentTicks)
    (nonempty : (CTS.absorbingStep program
      ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ []) :
    ∃ activeContext chain,
      CheckpointRun.PositivePrefix program dispatcher (bit :: suffix) 1
        (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
          innerContext).cursor.erase
        (ExactCheckpointRun.checkpointTime program dispatcher (bit :: suffix) 1)
        activeContext chain := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit 1 0 environment
  let carrier := deletedCarrier bit outerContext innerContext
  let registers := responseRegisters program bit suffix
  let route := dispatcher.route (registers.phase, bit)
  let label : ActionLabel program := (registers.phase, bit)
  let accumulator := actionAccumulator program label carrier
  let completedRoute :=
    SchedulerResponse.completedRoute program dispatcher registers bit carrier
  let terminal := CheckpointRun.terminalView 1 bits
  let view := CheckpointDecoder.completedView program route label accumulator
    bits continuation
  let chain : CheckpointDecoder.ChainView program := ⟨1, terminal, view⟩
  let activeContext :=
    BoundedJob.completedContinuationContext bits carrier completedRoute
  have terminalShape : CheckpointDecoder.ChainShape program dispatcher.tree
      continuation (.terminal terminal) := by
    apply CheckpointDecoder.ChainShape.terminal terminal
    · exact CheckpointDecoder.parseLocal?_terminal_none program dispatcher.tree
        1 environment
    · simpa [continuation, terminal, environment, bits] using!
        (CheckpointDecoder.parseTerminal?_clockExit
          (compileActions program dispatcher.tree) (word bits) 0)
  have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program
    dispatcher registers bit carrier
  have chainShape : CheckpointDecoder.ChainShape program dispatcher.tree
      (LocalResponse.completed bits continuation carrier completedRoute)
      (.completed chain) := by
    simpa [chain, view, route, label, accumulator, completedRoute] using
      (CheckpointDecoder.ChainShape.prepend_response_terminal bits dispatch
        terminalShape)
  have accumulatorDecode : CarrierDecoder.decode? program dispatcher.tree bits
      continuation (Dovetail.clockExit_admissible 1 0 environment) accumulator =
        some ((CTS.iterate program 1 (CTS.initial program bits)).data) := by
    have decoded := CarrierActionDecode.decode_actionAccumulator program
      dispatcher.tree bits continuation
      (Dovetail.clockExit_admissible 1 0 environment) label trace.targetDecode
    have phaseEq : registers.phase = CTS.zeroPhase program :=
      responseRegisters_phase program bit suffix
    rw [ActionDecode.outputData_eq_ordinaryStep_data, phaseEq] at decoded
    simpa [CTS.iterate_succ, bits, accumulator, label, carrier] using! decoded
  have publicDecode : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      accumulator =
        some ((CTS.iterate program 1 (CTS.initial program bits)).data) :=
    CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree bits
      continuation (Dovetail.clockExit_admissible 1 0 environment)
      accumulatorDecode
  have carrierShape : CheckpointDecoder.CarrierDecodes program dispatcher.tree
      accumulator (CTS.iterate program 1 (CTS.initial program bits)).data :=
    CheckpointDecoder.decodeCarrier?_sound program dispatcher.tree publicDecode
  have responseReduction : StepsN
      (firstResponseMutations program dispatcher bit suffix)
      (nestedFrames environment continuation 1)
      (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
        innerContext).cursor.erase := by
    have reduced := trace.termReduction
    have sourceEq :
        (positiveStageUpConfiguration program dispatcher bit suffix 0
          fullContext).cursor.erase = nestedFrames environment continuation 1 := by
      change Cursor.rebuild
          (ContextCursor.frames fullContext omega
            (PrimitiveFuel.pendingParents environment continuation 1 []))
          omega = nestedFrames environment continuation 1
      rw [rebuild_contextFrames, trace.sourceDescent.source_eq]
      simpa [nestedFrames] using!
        (PrimitiveFuel.rebuild_pendingParents 1 environment continuation
          (baseCarrier environment continuation) [])
    rw [sourceEq] at reduced
    exact reduced
  have staging := Dovetail.generator_to_staging
    (compileActions program dispatcher.tree) bits
  have stageExpansion := Dovetail.stage_expand 1 environment
  have launch := Dovetail.launch_expandJob 1 0 environment
  have allSteps := StepsN.trans staging
    (StepsN.trans stageExpansion (StepsN.trans launch responseReduction))
  have countEq : 1 + ((1 + 1) +
      ((2 * 1 + 6) + firstResponseMutations program dispatcher bit suffix)) =
      ExactCheckpointRun.checkpointTime program dispatcher bits 1 := by
    cases outputEq : (CTS.absorbingStep program
      ⟨CTS.zeroPhase program, bit :: suffix⟩).data with
    | nil => exact (nonempty outputEq).elim
    | cons outputBit outputSuffix =>
        simp [ExactCheckpointRun.checkpointTime_one,
          ExactCheckpointRun.stageCost, ExactCheckpointRun.jobsCost,
          ExactCheckpointRun.jobCost, CheckedTransition.totalCost_cons,
          CheckedTransition.markerCost, CheckedTransition.needsMark,
          firstResponseMutations,
          responseRegisters_phase, bits, outputEq, Nat.add_assoc,
          Nat.add_comm, Nat.add_left_comm]
  have exactSteps : StepsN
      (ExactCheckpointRun.checkpointTime program dispatcher bits 1)
      (generator (compileActions program dispatcher.tree) bits)
      (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
        innerContext).cursor.erase := by
    rw [← countEq]
    exact allSteps
  have phaseSpec : view.label.1 =
      CheckpointDecoder.expectedPhase program 1 := by
    simpa [view, label, registers, responseRegisters_phase] using!
      (CheckpointRun.iterate_phase_eq_expectedPhase program bits 0)
  have markerSpec : CheckpointDecoder.markerCompatible view.status
      (CTS.iterate program 1 (CTS.initial program bits)).data = true := by
    have iterateNonempty :
        (CTS.iterate program 1 (CTS.initial program bits)).data ≠ [] := by
      simpa [CTS.iterate_succ, bits] using! nonempty
    cases outputEq : (CTS.iterate program 1 (CTS.initial program bits)).data with
    | nil => exact (iterateNonempty outputEq).elim
    | cons outputBit outputSuffix =>
        simp [view, CheckpointDecoder.completedView, outputEq,
          CheckpointDecoder.markerCompatible]
  have endpointEq :
      LocalResponse.completed bits continuation carrier completedRoute =
        (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
          innerContext).cursor.erase := by
    simp [firstReturnConfiguration, bits, environment, continuation, carrier,
      registers, completedRoute, SchedulerResponse.returnConfiguration,
      SchedulerResponse.completedCursor, remainingParents,
      PrimitiveFuel.pendingParents, Cursor.erase, Cursor.rebuild]
  refine ⟨activeContext, chain, ?_⟩
  refine
    { run := ?_
      chainShape := ?_
      layers := rfl
      terminal := rfl
      last := ?_
      wrapsCompleted := ?_ }
  · refine ⟨exactSteps, ?_, rfl⟩
    simpa [activeContext, continuation, environment, bits] using! endpointEq
  · rw [← endpointEq]
    exact chainShape
  · exact ⟨by simpa [chain] using phaseSpec,
      by simpa [chain, view] using! carrierShape,
      by simpa [chain] using markerSpec⟩
  · intro innerTerm innerChain innerShape
    have wrapped := CheckpointDecoder.ChainShape.prepend_response_completed bits
      dispatch innerShape
    simpa [activeContext, chain, view, route, label, accumulator,
      completedRoute, CheckpointRun.cumulativeLayers, CheckpointRun.addLayers]
      using wrapped

/-! ## Exact first C4 sample -/

/-- Immediate post-C4 configuration in the first response of a positive job. -/
def firstC4Configuration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    (outerContext innerContext : Context) :
    SchedulerInvariant.Configuration program dispatcher :=
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let endpoint := deletedCarrier bit outerContext innerContext
  let parents :=
    PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
  upConfiguration program dispatcher
    (((Registers.newJob program).clearScan).observeLive bit)
    (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
      (SchedulerAscent.frontPredecessor innerContext))
    (ContextCursor.frames outerContext
      (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
        (SchedulerAscent.frontPredecessor innerContext)) parents)

/-- The immediate C4 target has the full UP-family position, recursive audit,
and direct pending-envelope decoder rejection. -/
theorem firstC4_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : FirstResponseTrace program dispatcher bit suffix fuel outerContext
      fullContext innerContext targetContext ascentTicks) :
    Holds program dispatcher
      (firstC4Configuration program dispatcher bit suffix fuel outerContext
        innerContext) := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let endpoint := Carrier.tombstone bit
    (SchedulerAscent.frontPredecessor innerContext)
    (SchedulerAscent.frontPredecessor innerContext)
  let parents :=
    PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
  let registers := ((Registers.newJob program).clearScan).observeLive bit
  have coherent : RegistersCoherent registers (CTS.zeroPhase program) [bit]
      false := by
    exact ⟨rfl, rfl, rfl, rfl, rfl⟩
  have failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      (firstC4Configuration program dispatcher bit suffix fuel outerContext
        innerContext).cursor.erase := by
    change CheckpointExclusion.EndpointFailure program dispatcher.tree
      (Cursor.rebuild (ContextCursor.frames outerContext endpoint parents)
        endpoint)
    rw [rebuild_contextFrames]
    exact pendingParents_failure program dispatcher bits continuation
      (deletedCarrier bit outerContext innerContext) (fuel + 1)
      (Nat.succ_ne_zero fuel)
  let silent : SilentEvidence program dispatcher.tree .up
      (firstC4Configuration program dispatcher bit suffix fuel outerContext
        innerContext).cursor.erase := .ofEndpointFailure failure
  have auditSource := auditedOccurrence_downDescent trace.targetDescent parents
  have audit : AuditedOccurrence program dispatcher.tree
      (firstC4Configuration program dispatcher bit suffix fuel outerContext
        innerContext).cursor.erase := by
    have eraseEq :
        (firstC4Configuration program dispatcher bit suffix fuel outerContext
          innerContext).cursor.erase =
        (Cursor.mk (deletedCarrier bit outerContext innerContext) parents).erase := by
      change Cursor.rebuild (ContextCursor.frames outerContext endpoint parents)
          endpoint =
        Cursor.rebuild parents (deletedCarrier bit outerContext innerContext)
      rw [rebuild_contextFrames]
      rfl
    rw [eraseEq]
    exact auditSource
  let cursor := (firstC4Configuration program dispatcher bit suffix fuel
    outerContext innerContext).cursor
  exact .intro (.macro (.family .up) registers) rfl (CTS.zeroPhase program)
    [bit] false coherent
    (ControlPosition.macro
      (context := contextOfParents cursor.parents) (focus := cursor.focus)
      (cursorAtContextOfParents cursor.focus cursor.parents) (by trivial))
    (.up (.silent silent) audit)

/-- Exact global sampled-state wrapper for the unique first-response C4. -/
theorem firstC4_sampledState
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks sampleIndex : Nat}
    (trace : FirstResponseTrace program dispatcher bit suffix fuel outerContext
      fullContext innerContext targetContext ascentTicks) :
    SampledState program dispatcher inputBits (sampleIndex + 1)
      (firstC4Configuration program dispatcher bit suffix fuel outerContext
        innerContext) := by
  let silent : SilentEvidence program dispatcher.tree .up
      (firstC4Configuration program dispatcher bit suffix fuel outerContext
        innerContext).cursor.erase := by
    apply SilentEvidence.ofEndpointFailure
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let endpoint := Carrier.tombstone bit
      (SchedulerAscent.frontPredecessor innerContext)
      (SchedulerAscent.frontPredecessor innerContext)
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    change CheckpointExclusion.EndpointFailure program dispatcher.tree
      (Cursor.rebuild (ContextCursor.frames outerContext endpoint parents)
        endpoint)
    rw [rebuild_contextFrames]
    exact pendingParents_failure program dispatcher bits continuation
      (deletedCarrier bit outerContext innerContext) (fuel + 1)
      (Nat.succ_ne_zero fuel)
  exact SampledState.ofSilent
    (.macro (.family .up)
      (((Registers.newJob program).clearScan).observeLive bit))
    (firstC4_holds program dispatcher bit suffix fuel trace) rfl silent

/-- From the Base-producing final fuel sample, executable search finds the C4
target through only the certified DOWN/UP cursor prefix. -/
theorem positiveStageFinal_seekFirstC4
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    (sampleIndex fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {descentTicks ascentTicks : Nat}
    (trace : PositiveStageFirstResponseTrace program dispatcher bit suffix
      clockRegisters phase scanned emptyMode clockCoherent sampleIndex fuel
      outerContext fullContext innerContext targetContext descentTicks
      ascentTicks) :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    ∃ bound,
      FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        bound
        (fuelZeroFifthMutationConfiguration program dispatcher
          (Registers.newJob program) environment continuation parents) =
        some (firstC4Configuration program dispatcher bit suffix fuel
          outerContext innerContext) := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let parents :=
    PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
  obtain ⟨bound, found⟩ := SchedulerAscent.selectedFront_seekMutation
    program dispatcher (Registers.newJob program).clearScan trace.response.path
    parents (by rfl)
  have combined := trace.stage.finalSample_to_up.seekMutation_prepend found
  exact ⟨_, by
    simpa [firstC4Configuration, bits, environment, continuation, parents,
      positiveStageUpConfiguration] using combined⟩

/-- After the C4 sample, the retained outer ascent and pending-frame dispatch
reach the exact first FRAME state without another contraction. -/
theorem firstC4_toFrame_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : FirstResponseTrace program dispatcher bit suffix fuel outerContext
      fullContext innerContext targetContext ascentTicks) :
    ∃ ticks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (firstC4Configuration program dispatcher bit suffix fuel outerContext
          innerContext)
        (firstFrameConfiguration program dispatcher bit suffix fuel outerContext
          innerContext) := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let endpoint := Carrier.tombstone bit
    (SchedulerAscent.frontPredecessor innerContext)
    (SchedulerAscent.frontPredecessor innerContext)
  let carrier := deletedCarrier bit outerContext innerContext
  let fullParents :=
    PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
  let remaining := remainingParents program dispatcher bits fuel
  let observed := ((Registers.newJob program).clearScan).observeLive bit
  let finalRegisters := responseRegisters program bit suffix
  have observedSeen : observed.seen = true := by rfl
  obtain ⟨outerTicks, outerRun⟩ :=
    SchedulerAscent.selectedFront_outer_zeroRun program dispatcher
      (Dovetail.clockExit_admissible (fuel + 1) fuel environment)
      trace.selected (endpoint := endpoint) observed fullParents observedSeen
  have parentSplit := positiveStageParents_split program dispatcher bits fuel
  dsimp only at parentSplit
  have outerRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) outerTicks
      (firstC4Configuration program dispatcher bit suffix fuel outerContext
        innerContext)
      (upConfiguration program dispatcher finalRegisters carrier
        fullParents) := by
    simpa [firstC4Configuration, bits, environment, continuation, endpoint,
      carrier, fullParents, remaining, observed, finalRegisters,
      responseRegisters, deletedCarrier] using outerRun
  dsimp only [fullParents] at outerRun'
  rw [parentSplit] at outerRun'
  have finalSeen : finalRegisters.seen = true := by
    exact (responseRegisters_spec program bit suffix).2.1
  have leave := SchedulerAscent.pendingFrameDispatch_zeroRun program dispatcher
    finalRegisters haltCode (compileActions program dispatcher.tree) (word bits)
    continuation carrier remaining finalSeen
  refine ⟨outerTicks + SchedulerAscent.pendingFrameDispatchTicks program
    dispatcher haltCode (compileActions program dispatcher.tree) (word bits)
    continuation carrier remaining, ?_⟩
  simpa [firstFrameConfiguration, bits, environment, continuation, carrier,
    remaining, finalRegisters] using! outerRun'.trans leave

/-- Exact response sample package below a nonfinal canonical pending stack. -/
def PendingResponseSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (seedBits : List Bool) (continuation carrier : Term)
    (depth sampleIndex : Nat) : Prop :=
  ∃ configurations : List
      (SchedulerResponseInvariant.Configuration program dispatcher),
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        seedBits continuation carrier
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation depth []))
      (SchedulerResponse.frameConfiguration program dispatcher registers
        seedBits continuation carrier
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation depth []))
      configurations ∧
    IndexedResponseSampledStates program dispatcher inputBits sampleIndex
      configurations ∧
    configurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit) ∧
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      sampleIndex configurations.length
      (SchedulerResponse.frameConfiguration program dispatcher registers
        seedBits continuation carrier
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation depth []))

/-- Every response under at least one remaining pending frame is a completely
classified silent productivity segment. -/
theorem pendingResponseSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (seedBits : List Bool) (continuation carrier : Term)
    (depth sampleIndex : Nat) (positive : depth ≠ 0)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (bitEq : registers.bit = some bit)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree seedBits
      continuation carrier) :
    PendingResponseSegment program dispatcher inputBits registers bit seedBits
      continuation carrier depth sampleIndex := by
  let parents := PrimitiveFuel.pendingParents
    (environmentCode (compileActions program dispatcher.tree) seedBits)
    continuation depth []
  obtain ⟨configurations, scriptChain, pairs⟩ :=
    normalResponse_exactPairedMutationChain program dispatcher registers bit
      seedBits continuation carrier parents
  have classifications := ResponseSamplePairs.toClassifications program
    dispatcher inputBits registers bit seedBits continuation carrier parents
    (sampleIndex := sampleIndex) pairs
    (fun index pc cursor done term position eraseEq root =>
      ResponseSamplePairs.pendingClassification program dispatcher inputBits
        seedBits continuation index depth positive eraseEq)
  have sampled := ResponseSamplePairs.toIndexedSampledStates program dispatcher
    registers bit seedBits continuation carrier parents coherent snapshotInv
    pairs classifications
  have zeroPrefix := SchedulerResponse.enterResponse_zeroRun program dispatcher
    registers bit seedBits continuation carrier parents bitEq
  have chain := ExactMutationChain.prepend zeroPrefix scriptChain
  have lengths := pairs.length_eq
  have entriesLength := responseEntries_length program
    (dispatcher.route_valid (registers.phase, bit)) seedBits continuation carrier
  have configurationLength : configurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit) :=
    lengths.trans entriesLength
  exact ⟨configurations, by simpa [parents] using chain, sampled,
    configurationLength,
    ExactMutationChain.toExistentialAdvance program dispatcher inputBits
      sampleIndex chain sampled⟩

/-- Count-normalized form of the pending response productivity segment. -/
theorem pendingResponseExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (seedBits : List Bool) (continuation carrier : Term)
    (depth sampleIndex : Nat) (positive : depth ≠ 0)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (bitEq : registers.bit = some bit)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree seedBits
      continuation carrier) :
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      sampleIndex
      (LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit))
      (SchedulerResponse.frameConfiguration program dispatcher registers seedBits
        continuation carrier
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation depth [])) := by
  obtain ⟨configurations, chain, sampled, lengthEq, advance⟩ :=
    pendingResponseSegment program dispatcher inputBits registers
    bit seedBits continuation carrier depth sampleIndex positive bitEq coherent
    snapshotInv
  simpa [lengthEq] using advance

/-! ## Positive-stage nonfinal first response -/

/-- Exact C4-plus-response sample chain for every nonlast positive-stage job.
The strict positivity of `fuel` is precisely the fact that a canonical pending
frame remains outside the response, so every response sample is silent. -/
theorem positiveStagePendingFirstResponseSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (bit : Bool) (suffix : List Bool)
    (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    (sampleIndex fuel : Nat) (fuelPositive : fuel ≠ 0)
    {outerContext fullContext innerContext targetContext : Context}
    {descentTicks ascentTicks : Nat}
    (trace : PositiveStageFirstResponseTrace program dispatcher bit suffix
      clockRegisters phase scanned emptyMode clockCoherent sampleIndex fuel
      outerContext fullContext innerContext targetContext descentTicks
      ascentTicks) :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    ∃ configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (firstReturnConfiguration program dispatcher bit suffix fuel
          outerContext innerContext)
        (fuelZeroFifthMutationConfiguration program dispatcher
          (Registers.newJob program) environment continuation parents)
        configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits
        (positiveStageEndIndex sampleIndex fuel) configurations ∧
      configurations.length =
        firstResponseMutations program dispatcher bit suffix := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let parents :=
    PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
  let carrier := deletedCarrier bit outerContext innerContext
  let registers := responseRegisters program bit suffix
  let c4 := firstC4Configuration program dispatcher bit suffix fuel outerContext
    innerContext
  obtain ⟨c4Bound, c4Found⟩ := positiveStageFinal_seekFirstC4 program
    dispatcher bit suffix clockRegisters phase scanned emptyMode clockCoherent
    sampleIndex fuel trace
  have c4Sample : SampledState program dispatcher inputBits
      (positiveStageEndIndex sampleIndex fuel + 1) c4 := by
    simpa [c4] using firstC4_sampledState program dispatcher inputBits bit
      suffix fuel trace.response
  obtain ⟨frameTicks, c4ToFrame⟩ := firstC4_toFrame_zeroRun program
    dispatcher bit suffix fuel trace.response
  have bitEq : registers.bit = some bit := by
    exact (responseRegisters_spec program bit suffix).1
  have coherent := responseRegisters_coherent program bit suffix
  obtain ⟨responseConfigurations, responseChain, responseSampled,
      responseLength, responseAdvance⟩ :=
    pendingResponseSegment program dispatcher inputBits registers bit bits
      continuation carrier fuel (positiveStageEndIndex sampleIndex fuel + 1)
      fuelPositive bitEq coherent trace.response.targetHolds
  have responseChain' : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (firstReturnConfiguration program dispatcher bit suffix fuel outerContext
        innerContext)
      (firstFrameConfiguration program dispatcher bit suffix fuel outerContext
        innerContext) responseConfigurations := by
    simpa [firstReturnConfiguration, firstFrameConfiguration, registers, bits,
      environment, continuation, carrier, remainingParents] using responseChain
  have chainFromC4 := ExactMutationChain.prepend c4ToFrame responseChain'
  have completeChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (firstReturnConfiguration program dispatcher bit suffix fuel outerContext
        innerContext)
      (fuelZeroFifthMutationConfiguration program dispatcher
        (Registers.newJob program) environment continuation parents)
      (c4 :: responseConfigurations) :=
    .next c4Bound (by simpa [c4, bits, environment, continuation, parents]
      using c4Found) chainFromC4
  have completeSampled : IndexedResponseSampledStates program dispatcher
      inputBits (positiveStageEndIndex sampleIndex fuel)
      (c4 :: responseConfigurations) :=
    .cons (positiveStageEndIndex sampleIndex fuel) c4Sample responseSampled
  have completeLength : (c4 :: responseConfigurations).length =
      firstResponseMutations program dispatcher bit suffix := by
    simp only [List.length_cons, firstResponseMutations]
    rw [responseLength]
    exact Nat.add_comm _ _
  exact ⟨c4 :: responseConfigurations, completeChain, completeSampled,
    completeLength⟩

/-- Count-normalized productivity form of the nonlast first-response chain. -/
theorem positiveStagePendingFirstResponseExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (bit : Bool) (suffix : List Bool)
    (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    (sampleIndex fuel : Nat) (fuelPositive : fuel ≠ 0)
    {outerContext fullContext innerContext targetContext : Context}
    {descentTicks ascentTicks : Nat}
    (trace : PositiveStageFirstResponseTrace program dispatcher bit suffix
      clockRegisters phase scanned emptyMode clockCoherent sampleIndex fuel
      outerContext fullContext innerContext targetContext descentTicks
      ascentTicks) :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      (positiveStageEndIndex sampleIndex fuel)
      (firstResponseMutations program dispatcher bit suffix)
      (fuelZeroFifthMutationConfiguration program dispatcher
        (Registers.newJob program) environment continuation parents) := by
  obtain ⟨configurations, chain, sampled, lengthEq⟩ :=
    positiveStagePendingFirstResponseSegment program dispatcher inputBits bit
      suffix clockRegisters phase scanned emptyMode clockCoherent sampleIndex
      fuel fuelPositive trace
  have advance := ExactMutationChain.toExistentialAdvance program dispatcher
    inputBits (positiveStageEndIndex sampleIndex fuel) chain sampled
  simpa [lengthEq] using advance

end SchedulerCycle

end PureSFormal.PureS
