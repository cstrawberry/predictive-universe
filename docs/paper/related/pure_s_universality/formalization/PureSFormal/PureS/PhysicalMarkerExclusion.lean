import PureSFormal.Research.RootResetMarkerPhysicalSoundness

namespace PureSFormal.PureS.PhysicalMarkerExclusion
open FiniteController SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext SchedulerNestedResponse

/-- Independent-hole marked halt-field shape at the actual post-contraction focus. -/
def markedFocus? : Term → Bool
  | .app (.app .s _) (.app (.app (.app .s .s) .s) _) => true
  | _ => false

def CursorSafe (cursor : Cursor) : Prop := markedFocus? cursor.focus = false
def CursorsSafe (cursors : List Cursor) : Prop := ∀ cursor ∈ cursors, CursorSafe cursor
def SamplesSafe (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (samples : List (SchedulerInvariant.Configuration program dispatcher)) : Prop :=
  ∀ configuration ∈ samples, CursorSafe configuration.cursor

theorem cursors_nil : CursorsSafe [] := by intro cursor member; cases member
theorem cursors_cons {cursor : Cursor} {rest : List Cursor}
    (first : CursorSafe cursor) (tail : CursorsSafe rest) : CursorsSafe (cursor :: rest) := by
  intro other member
  cases member with
  | head => exact first
  | tail _ inside => exact tail other inside
theorem cursors_append {first second : List Cursor}
    (left : CursorsSafe first) (right : CursorsSafe second) : CursorsSafe (first ++ second) := by
  intro cursor member
  rcases List.mem_append.mp member with member | member
  · exact left cursor member
  · exact right cursor member

theorem marked_focus (left right : Term) : markedFocus? (Carrier.markedHField left right) = true := rfl
theorem tombstone_safe (bit : Bool) (predecessor audit : Term) (parents : List ParentFrame) :
    CursorSafe ⟨Carrier.tombstone bit predecessor audit, parents⟩ := by cases bit <;> rfl

theorem frame_trace_safe
    (actions : Term) (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace PrimitiveScripts.framePrefixScript
        ⟨frame (environmentCode actions bits) continuation carrier, parents⟩ samples
        ⟨.app actions carrier,
          .right (freshHField carrier) :: .left (.app (seedCode bits) carrier) ::
          .left (.app continuation carrier) :: parents⟩ ∧ CursorsSafe samples := by
  unfold PrimitiveScripts.framePrefixScript
  refine ⟨_, .step rfl (.step rfl (.step rfl (.step rfl
    (.step rfl (.step rfl (.step rfl (.step rfl (.nil _)))))))), ?_⟩
  apply cursors_cons
  · rfl
  apply cursors_cons
  · rfl
  exact cursors_cons rfl cursors_nil

theorem chosen_safe (payload function argument : Term) (parents : List ParentFrame)
    (different : function ≠ haltTag) :
    CursorSafe ⟨chosen payload (.app function argument), parents⟩ := by
  cases function with
  | s => rfl
  | app first second =>
    cases first with
    | s => rfl
    | app first secondFirst =>
      cases first <;> cases secondFirst <;> cases second <;>
        simp_all [CursorSafe, markedFocus?, chosen, haltTag, b]

theorem compile_ne_s {Label : Type} (encode : Label → Term) (tree : Dispatcher.Tree Label) :
    compileDispatcher encode tree ≠ .s := by cases tree <;> intro impossible <;> cases impossible

theorem fork_ne_haltTag {Label : Type} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) :
    fork (compileDispatcher encode left) (compileDispatcher encode right) ≠ haltTag := by
  intro equal
  have impossible : compileDispatcher encode left = .s := (Term.app.inj (Term.app.inj equal).1).2
  exact compile_ne_s encode left impossible

theorem nodeLeft_trace_safe
    {Label : Type} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (carrier : Term) (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace PrimitiveScripts.nodeLeft
        ⟨.app (nodeCode (compileDispatcher encode left) (compileDispatcher encode right)) carrier, parents⟩ samples
        ⟨RouteGrammar.compiledCall encode left carrier,
          .left (RouteGrammar.compiledCall encode right carrier) :: .right (.app .s carrier) :: parents⟩ ∧ CursorsSafe samples := by
  unfold PrimitiveScripts.nodeLeft
  refine ⟨_, .step rfl (.step rfl (.step rfl (.step rfl (.nil _)))), ?_⟩
  apply cursors_cons
  · exact chosen_safe carrier _ carrier parents (fork_ne_haltTag encode left right)
  apply cursors_cons
  · cases left <;> rfl
  exact cursors_nil

theorem nodeRight_trace_safe
    {Label : Type} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (carrier : Term) (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace PrimitiveScripts.nodeRight
        ⟨.app (nodeCode (compileDispatcher encode left) (compileDispatcher encode right)) carrier, parents⟩ samples
        ⟨RouteGrammar.compiledCall encode right carrier,
          .right (RouteGrammar.compiledCall encode left carrier) :: .right (.app .s carrier) :: parents⟩ ∧ CursorsSafe samples := by
  unfold PrimitiveScripts.nodeRight
  refine ⟨_, .step rfl (.step rfl (.step rfl (.step rfl (.nil _)))), ?_⟩
  apply cursors_cons
  · exact chosen_safe carrier _ carrier parents (fork_ne_haltTag encode left right)
  apply cursors_cons
  · cases left <;> rfl
  exact cursors_nil

theorem leaf_trace_safe
    {Label : Type} (encode : Label → Term) (label : Label)
    (different : encode label ≠ haltTag) (carrier : Term) (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace PrimitiveScripts.leaf
        ⟨.app (leafCode (encode label)) carrier, parents⟩ samples
        ⟨.app (encode label) carrier, .right (.app .s carrier) :: parents⟩ ∧ CursorsSafe samples := by
  unfold PrimitiveScripts.leaf
  refine ⟨_, .step rfl (.step rfl (.nil _)), ?_⟩
  exact cursors_cons (chosen_safe carrier _ carrier parents different) cursors_nil

theorem forward_trace_safe
    {Label : Type} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (different : ∀ label, encode label ≠ haltTag)
    (carrier : Term) (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace (PrimitiveRoute.forward route)
        ⟨RouteGrammar.compiledCall encode tree carrier, parents⟩ samples
        ⟨.app (encode label) carrier, PrimitiveRoute.selectedParents encode carrier tree route parents⟩ ∧ CursorsSafe samples := by
  induction path generalizing parents with
  | leaf stored => exact leaf_trace_safe encode stored (different stored) carrier parents
  | @left route label left right path ih =>
      obtain ⟨frontSamples, first, firstSafe⟩ := nodeLeft_trace_safe encode left right carrier parents
      obtain ⟨suffix, rest, restSafe⟩ := ih (.left (RouteGrammar.compiledCall encode right carrier) :: .right (.app .s carrier) :: parents)
      exact ⟨frontSamples ++ suffix, trace_append first rest, cursors_append firstSafe restSafe⟩
  | @right route label left right path ih =>
      obtain ⟨frontSamples, first, firstSafe⟩ := nodeRight_trace_safe encode left right carrier parents
      obtain ⟨suffix, rest, restSafe⟩ := ih (.right (RouteGrammar.compiledCall encode left carrier) :: .right (.app .s carrier) :: parents)
      exact ⟨frontSamples ++ suffix, trace_append first rest, cursors_append firstSafe restSafe⟩

theorem appender_ne_haltTag (bits : List Bool) : appender bits ≠ haltTag := by
  cases bits <;> intro equal <;> cases equal

theorem selectedAction_ne_haltTag (program : CTS.Program) (label : ActionLabel program) :
    selectedAction program label ≠ haltTag := by
  rcases label with ⟨phase, bit⟩
  cases bit
  · intro equal; cases equal
  · exact appender_ne_haltTag _

theorem actionDescent_trace_safe : ∀ (bits : List Bool) (initial : Term)
    (parents : List ParentFrame),
    ∃ samples,
      CursorMutationTrace (PrimitiveScripts.actionDescent bits)
        ⟨.app (appender bits) initial, parents⟩ samples
        ⟨PrimitiveScripts.actionFocus bits initial,
          PrimitiveScripts.actionParents bits initial parents⟩ ∧ CursorsSafe samples
  | [], initial, parents => ⟨[], .nil _, cursors_nil⟩
  | [bit], initial, parents => by
      refine ⟨_, .step rfl (.step rfl (.nil _)), ?_⟩
      apply cursors_cons
      · rfl
      exact cursors_cons rfl cursors_nil
  | bit :: next :: rest, initial, parents => by
      obtain ⟨innerSamples, innerTrace, innerSafe⟩ :=
        actionDescent_trace_safe (next :: rest) (extendAccumulator bit initial)
          (.left (pushHistory bit initial) :: parents)
      obtain ⟨firstSamples, firstTrace, firstSafe⟩ :
          ∃ samples,
            CursorMutationTrace [.Rdx, .Rdx, .L]
              ⟨.app (appender (bit :: next :: rest)) initial, parents⟩ samples
              ⟨.app (appender (next :: rest)) (extendAccumulator bit initial),
                .left (pushHistory bit initial) :: parents⟩ ∧ CursorsSafe samples := by
        refine ⟨_, .step rfl (.step rfl (.step rfl (.nil _))), ?_⟩
        apply cursors_cons
        · rfl
        exact cursors_cons rfl cursors_nil
      exact ⟨firstSamples ++ innerSamples, trace_append firstTrace innerTrace,
        cursors_append firstSafe innerSafe⟩

theorem action_trace_safe (bits : List Bool) (initial : Term) (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace (PrimitiveScripts.action bits)
        ⟨.app (appender bits) initial, parents⟩ samples
        ⟨appenderResult bits initial, parents⟩ ∧ CursorsSafe samples := by
  obtain ⟨samples, descent, safe⟩ := actionDescent_trace_safe bits initial parents
  have ascent := cursorOnly_trace
    (PrimitiveScripts.actionReturn_cursorOnly bits)
    (PrimitiveScripts.run_actionReturn bits initial parents)
  refine ⟨samples, ?_, safe⟩
  simpa [PrimitiveScripts.action] using trace_append descent ascent

theorem normalResponse_trace_safe
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace (PrimitiveLocalResponse.execute program route label)
        ⟨frame (environmentCode (compileActions program tree) bits)
          continuation carrier, parents⟩ samples
        ⟨LocalResponse.completed bits continuation carrier
          (PrimitiveLocalResponse.completedRoute program tree route label carrier), parents⟩ ∧
      CursorsSafe samples := by
  let localParents : List ParentFrame :=
    .right (freshHField carrier) :: .left (.app (seedCode bits) carrier) ::
      .left (.app continuation carrier) :: parents
  obtain ⟨frameSamples, frameTrace, frameSafe⟩ :=
    frame_trace_safe (compileActions program tree) bits continuation carrier parents
  obtain ⟨routeSamples, routeTrace, routeSafe⟩ :=
    forward_trace_safe (encode := selectedAction program) path
      (selectedAction_ne_haltTag program) carrier localParents
  obtain ⟨actionSamples, rawActionTrace, actionSafe⟩ :=
    action_trace_safe (PrimitiveLocalResponse.emitted program label) carrier
      (PrimitiveRoute.selectedParents (selectedAction program) carrier tree route localParents)
  have actionTrace :
      CursorMutationTrace (PrimitiveScripts.action (PrimitiveLocalResponse.emitted program label))
        ⟨.app (selectedAction program label) carrier,
          PrimitiveRoute.selectedParents (selectedAction program) carrier tree route localParents⟩
        actionSamples
        ⟨actionResult program label carrier,
          PrimitiveRoute.selectedParents (selectedAction program) carrier tree route localParents⟩ := by
    simpa using rawActionTrace
  have backwardTrace := cursorOnly_trace
    (PrimitiveRoute.backward_cursorOnly route)
    (PrimitiveRoute.run_backward_withResponse (encode := selectedAction program)
      path carrier (actionResult program label carrier) localParents)
  have localTrace :
      CursorMutationTrace PrimitiveLocalResponse.localReturn
        ⟨PrimitiveRoute.withResponse (selectedAction program) tree route carrier
            (actionResult program label carrier), localParents⟩ []
        ⟨LocalResponse.completed bits continuation carrier
            (PrimitiveLocalResponse.completedRoute program tree route label carrier), parents⟩ := by
    apply cursorOnly_trace PrimitiveLocalResponse.localReturn_cursorOnly
    rfl
  refine ⟨frameSamples ++ routeSamples ++ actionSamples, ?_,
    cursors_append (cursors_append frameSafe routeSafe) actionSafe⟩
  unfold PrimitiveLocalResponse.execute
  simpa [localParents, List.append_assoc] using
    trace_append frameTrace (trace_append routeTrace
      (trace_append actionTrace (trace_append backwardTrace localTrace)))

/-- Physical focus predicate. Its name mirrors the earlier control-exclusion
proof so that the trace recurrences can be strengthened without changing their
control flow; it does not inspect the finite-control state. -/
abbrev postMarker? (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (configuration : SchedulerInvariant.Configuration program dispatcher) : Bool :=
  markedFocus? configuration.cursor.focus

abbrev NoPostMarkers := SamplesSafe

theorem noPostMarkers_nil (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    NoPostMarkers program dispatcher [] := by intro configuration member; cases member

theorem noPostMarkers_cons {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {head : SchedulerInvariant.Configuration program dispatcher}
    {tail : List (SchedulerInvariant.Configuration program dispatcher)}
    (headSafe : postMarker? program dispatcher head = false)
    (tailSafe : NoPostMarkers program dispatcher tail) :
    NoPostMarkers program dispatcher (head :: tail) := by
  intro configuration member
  cases member with
  | head => exact headSafe
  | tail _ member => exact tailSafe _ member

theorem noPostMarkers_append {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {first second : List (SchedulerInvariant.Configuration program dispatcher)}
    (left : NoPostMarkers program dispatcher first)
    (right : NoPostMarkers program dispatcher second) :
    NoPostMarkers program dispatcher (first ++ second) := by
  intro configuration member
  rcases List.mem_append.mp member with member | member
  · exact left _ member
  · exact right _ member

theorem normalResponse_exactSafeMutationChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ samples,
      ExactMutationChain (machine program dispatcher)
        (SchedulerResponse.returnConfiguration program dispatcher registers bit bits continuation carrier parents)
        (SchedulerResponse.responseStartConfiguration program dispatcher registers bit bits continuation carrier parents)
        samples ∧
      samples.length = LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit) ∧
      SamplesSafe program dispatcher samples := by
  obtain ⟨cursorSamples, trace, safe⟩ := normalResponse_trace_safe program
    (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier parents
  obtain ⟨samples, cursorsEq, chain, _⟩ :=
    scriptTrace_exactPositionedMutationChain program dispatcher
      (.normalResponse (registers.phase, bit)) registers
      (SchedulerResponse.frameCursor program dispatcher bits continuation carrier parents) trace
      (firstScriptPC program dispatcher (.normalResponse (registers.phase, bit)))
      (by rfl) (by rfl) (by simp [firstScriptPC])
  refine ⟨samples, ?_, ?_, ?_⟩
  · simpa [SchedulerResponse.responseStartConfiguration, SchedulerResponse.returnConfiguration] using! chain
  · calc
      samples.length = cursorSamples.length := by simpa using congrArg List.length cursorsEq
      _ = _ := trace.length_eq.trans (PrimitiveLocalResponse.execute_rdxCount _ _ _)
  · intro configuration member
    apply safe configuration.cursor
    rw [← cursorsEq]
    exact PureSFormal.Research.RootResetCompletedLocalPatterns.map_member _ member

theorem normalResponse_chain_noPostMarkers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {terminal : SchedulerInvariant.Configuration program dispatcher}
    {configurations : List (SchedulerInvariant.Configuration program dispatcher)}
    (chain : ExactMutationChain (machine program dispatcher) terminal
      (SchedulerResponse.responseStartConfiguration program dispatcher registers bit bits
        continuation carrier parents) configurations)
    (lengthEq : configurations.length = LocalResponse.completedCost program
      (dispatcher.route (registers.phase, bit)) (registers.phase, bit)) :
    NoPostMarkers program dispatcher configurations := by
  obtain ⟨samples, reference, sampleLength, safe⟩ := normalResponse_exactSafeMutationChain
    program dispatcher registers bit bits continuation carrier parents
  have same := RegisteredMarkerExclusion.exactChain_samples_unique chain reference
    (lengthEq.trans sampleLength.symm)
  rw [same]
  exact safe

theorem selectedResponse_chain_noPostMarkers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    (parents : List ParentFrame)
    {outerContext fullContext innerContext targetContext : Context} {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits continuation source admissible
      registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (notSeen : registers.seen = false)
    {terminal : SchedulerInvariant.Configuration program dispatcher}
    {configurations : List (SchedulerInvariant.Configuration program dispatcher)}
    (chain : ExactMutationChain (machine program dispatcher) terminal
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames fullContext omega
          (.right (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) ::
            parents))) configurations)
    (lengthEq : configurations.length = 1 + LocalResponse.completedCost program
      (dispatcher.route ((scannedRegisters registers bit suffix).phase, bit))
      ((scannedRegisters registers bit suffix).phase, bit)) :
    NoPostMarkers program dispatcher configurations := by
  let finalRegisters := scannedRegisters registers bit suffix
  let carrier := deletedCarrier bit outerContext innerContext
  let c4 := selectedC4Configuration program dispatcher registers bit outerContext innerContext
    (.right (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) :: parents)
  obtain ⟨bound, found⟩ := selected_seekC4 program dispatcher seedBits continuation source
    admissible registers bit suffix parents trace notSeen
  obtain ⟨ascentTicks, ascent⟩ := selectedC4_toFrame_zeroRunAt program dispatcher seedBits
    continuation source admissible registers bit suffix 0 parents (by simpa using! trace) notSeen
  have entry := SchedulerResponse.enterResponse_zeroRun program dispatcher finalRegisters bit
    seedBits continuation carrier parents (scannedRegisters_bit registers bit suffix notSeen)
  obtain ⟨samples, response, sampleLength, safe⟩ := normalResponse_exactSafeMutationChain
    program dispatcher finalRegisters bit seedBits continuation carrier parents
  have fromFrame := ExactMutationChain.prepend entry response
  have fromC4 := ExactMutationChain.prepend ascent fromFrame
  have reference : ExactMutationChain (machine program dispatcher)
      (SchedulerResponse.returnConfiguration program dispatcher finalRegisters bit seedBits
        continuation carrier parents)
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames fullContext omega
          (.right (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) ::
            parents))) (c4 :: samples) := by
    exact .next bound found fromC4
  have same := RegisteredMarkerExclusion.exactChain_samples_unique chain reference (by
    rw [lengthEq, List.length_cons, sampleLength]
    exact Nat.add_comm 1 _)
  rw [same]
  exact noPostMarkers_cons (tombstone_safe bit _ _ _) safe

end PureSFormal.PureS.PhysicalMarkerExclusion
