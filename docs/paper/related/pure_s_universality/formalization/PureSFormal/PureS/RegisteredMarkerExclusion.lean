import PureSFormal.PureS.RegisteredMarkerSampling

/-! Concrete control exclusion retained through nonempty mutation traces. -/
namespace PureSFormal.PureS.RegisteredMarkerExclusion

open FiniteController SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext SchedulerNestedResponse
  RegisteredMarkerBridge

/-- The exact post-contraction PC of either marker script. -/
def postMarker? (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (configuration : SchedulerInvariant.Configuration program dispatcher) : Bool :=
  match configuration.control with
  | some (.script .markNormal pc _) => pc.val == 4
  | some (.script .markEmpty pc _) => pc.val == 4
  | _ => false

def NoPostMarkers (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (configurations : List (SchedulerInvariant.Configuration program dispatcher)) : Prop :=
  ∀ configuration, configuration ∈ configurations → postMarker? program dispatcher configuration = false

theorem noPostMarkers_nil (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    NoPostMarkers program dispatcher [] := by
  intro configuration member
  cases member

theorem noPostMarkers_cons
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {head : SchedulerInvariant.Configuration program dispatcher}
    {tail : List (SchedulerInvariant.Configuration program dispatcher)}
    (headSafe : postMarker? program dispatcher head = false)
    (tailSafe : NoPostMarkers program dispatcher tail) :
    NoPostMarkers program dispatcher (head :: tail) := by
  intro configuration member
  cases member with
  | head => exact headSafe
  | tail _ member => exact tailSafe _ member

theorem noPostMarkers_append
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {first second : List (SchedulerInvariant.Configuration program dispatcher)}
    (left : NoPostMarkers program dispatcher first)
    (right : NoPostMarkers program dispatcher second) :
    NoPostMarkers program dispatcher (first ++ second) := by
  intro configuration member
  cases List.mem_append.mp member with
  | inl member => exact left _ member
  | inr member => exact right _ member

theorem registeredEvent_postMarker
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (configuration : SchedulerInvariant.Configuration program dispatcher)
    (occurs : TermEvent.performsRegisteredMarkH? program dispatcher configuration = true) :
    postMarker? program dispatcher (step (machine program dispatcher) configuration) = true := by
  obtain ⟨registers, payload, parents, rfl | rfl⟩ :=
    (performs_iff_configuration program dispatcher configuration).1 occurs
  · rfl
  · rfl

theorem noEvent_of_sample_exclusion
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (system : ProductiveSystem (machine program dispatcher))
    (excluded : ∀ index, postMarker? program dispatcher (system.contractionRun index) = false) :
    ¬ TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher system.initial := by
  rintro ⟨ticks, occurs⟩
  have marker := registeredEvent_postMarker program dispatcher _ occurs
  rw [step_eq_sample_of_mutation system ticks
    (performs_mutationCount program dispatcher _ occurs), excluded] at marker
  cases marker

/-- Successful first-mutation searches agree, regardless of their fuel. -/
theorem seekMutation_result_unique
    {Control : Type} {machine : Machine Control}
    {before first second : Configuration Control} {firstFuel secondFuel : Nat}
    (left : seekMutation machine firstFuel before = some first)
    (right : seekMutation machine secondFuel before = some second) : first = second := by
  have left' := FirstMutationRun.seekMutation_eq_add left secondFuel
  have right' := FirstMutationRun.seekMutation_eq_add right firstFuel
  rw [Nat.add_comm secondFuel firstFuel] at right'
  exact Option.some.inj (left'.symm.trans right')

/-- Equal-length exact chains from one source have literally identical samples.
Their terminal cursor-only suffixes need not be equal. -/
theorem exactChain_samples_unique
    {Control : Type} {machine : Machine Control}
    {before firstTerminal secondTerminal : Configuration Control}
    {first second : List (Configuration Control)}
    (left : ExactMutationChain machine firstTerminal before first)
    (right : ExactMutationChain machine secondTerminal before second)
    (lengthEq : first.length = second.length) : first = second := by
  induction left generalizing second with
  | done ticks suffix =>
      cases second with
      | nil => rfl
      | cons head tail => cases lengthEq
  | @next before head tail fuel found rest ih =>
      cases right with
      | done ticks suffix => cases lengthEq
      | @next _ other otherTail otherFuel otherFound otherRest =>
          have headEq := seekMutation_result_unique found otherFound
          subst other
          have tailEq := ih otherRest (Nat.succ.inj lengthEq)
          exact congrArg (List.cons head) tailEq

theorem responsePairs_noPostMarkers
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {registers : Registers program} {bit : Bool} {bits : List Bool}
    {continuation carrier : Term} {parents : List ParentFrame}
    {configurations : List (SchedulerInvariant.Configuration program dispatcher)}
    {entries : List (Bool × Term)}
    (pairs : ResponseSamplePairs program dispatcher registers bit bits continuation carrier
      parents configurations entries) : NoPostMarkers program dispatcher configurations := by
  induction pairs with
  | nil => exact noPostMarkers_nil program dispatcher
  | cons pc cursor done term position eraseEq root tail ih =>
      exact noPostMarkers_cons rfl ih

/-- Any exact normal-response chain of the stated response length excludes
marker samples, even when its terminal suffix has been extended. -/
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
  obtain ⟨samples, reference, pairs⟩ := normalResponse_exactPairedMutationChain
    program dispatcher registers bit bits continuation carrier parents
  have sampleLength := pairs.length_eq.trans
    (responseEntries_length program (dispatcher.route_valid (registers.phase, bit))
      bits continuation carrier)
  have same := exactChain_samples_unique chain reference (lengthEq.trans sampleLength.symm)
  rw [same]
  exact responsePairs_noPostMarkers pairs

/-- The C4 deletion and complete ordinary response have no marker sample.
This applies to any exact chain with their exact mutation length, including
chains whose final cursor-only handoff has already been absorbed. -/
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
  obtain ⟨samples, response, pairs⟩ := normalResponse_exactPairedMutationChain
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
  have sampleLength := pairs.length_eq.trans
    (responseEntries_length program (dispatcher.route_valid (finalRegisters.phase, bit))
      seedBits continuation carrier)
  have same := exactChain_samples_unique chain reference (by
    rw [lengthEq, List.length_cons, sampleLength]
    exact Nat.add_comm 1 _)
  rw [same]
  exact noPostMarkers_cons rfl (responsePairs_noPostMarkers pairs)

end PureSFormal.PureS.RegisteredMarkerExclusion
