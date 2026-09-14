import PureSFormal.PureS.TermEvent
import PureSFormal.PureS.SchedulerGlobalRecurrence
import PureSFormal.PureS.SchedulerEmpty
import PureSFormal.Research.RootResetInitialContractionPrefix

/-!
Operational lemmas for the existing decoder-free registered-marker predicate.
This research module does not assert global CTS-event equivalence or regularity.
-/
namespace PureSFormal.PureS.RegisteredMarkerBridge

open FiniteController SchedulerControl

theorem freshHaltPayload_some_iff (term payload : Term) :
    TermEvent.freshHaltPayload? term = some payload ↔
      term = freshHField payload := by
  cases term with
  | s => simp [TermEvent.freshHaltPayload?, freshHField]
  | app function argument =>
      simp [TermEvent.freshHaltPayload?, freshHField]

theorem freshHaltPayload_isSome_iff (term : Term) :
    (TermEvent.freshHaltPayload? term).isSome = true ↔
      ∃ payload, term = freshHField payload := by
  cases found : TermEvent.freshHaltPayload? term with
  | none =>
      constructor
      · intro impossible; cases impossible
      · rintro ⟨payload, shape⟩
        rw [shape, TermEvent.freshHaltPayload?_freshHField] at found
        cases found
  | some payload =>
      constructor
      · intro _; exact ⟨payload, (freshHaltPayload_some_iff term payload).1 found⟩
      · intro _; rfl

def normalEventConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (payload : Term)
    (parents : List ParentFrame) : SchedulerInvariant.Configuration program dispatcher :=
  ⟨some (.script .markNormal ⟨3, by simp [jobScript, PrimitiveScripts.mark]⟩ registers),
    ⟨freshHField payload, parents⟩⟩

def emptyEventConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (payload : Term)
    (parents : List ParentFrame) : SchedulerInvariant.Configuration program dispatcher :=
  ⟨some (.script .markEmpty ⟨3, by simp [jobScript, PrimitiveScripts.mark]⟩ registers),
    ⟨freshHField payload, parents⟩⟩

@[simp] theorem normalEvent_performs
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (payload : Term)
    (parents : List ParentFrame) :
    TermEvent.performsRegisteredMarkH? program dispatcher
      (normalEventConfiguration program dispatcher registers payload parents) = true := by
  change (3 == 3) && (TermEvent.freshHaltPayload? (freshHField payload)).isSome = true
  rw [TermEvent.freshHaltPayload?_freshHField]
  rfl

@[simp] theorem emptyEvent_performs
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (payload : Term)
    (parents : List ParentFrame) :
    TermEvent.performsRegisteredMarkH? program dispatcher
      (emptyEventConfiguration program dispatcher registers payload parents) = true := by
  change (3 == 3) && (TermEvent.freshHaltPayload? (freshHField payload)).isSome = true
  rw [TermEvent.freshHaltPayload?_freshHField]
  rfl

theorem normalEvent_mutationCount
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (payload : Term)
    (parents : List ParentFrame) :
    mutationCount (machine program dispatcher)
      (normalEventConfiguration program dispatcher registers payload parents) = 1 := by
  rfl

theorem emptyEvent_mutationCount
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (payload : Term)
    (parents : List ParentFrame) :
    mutationCount (machine program dispatcher)
      (emptyEventConfiguration program dispatcher registers payload parents) = 1 := by
  rfl

/-- No other finite-control row can satisfy the existing event predicate. -/
theorem performs_iff_configuration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (configuration : SchedulerInvariant.Configuration program dispatcher) :
    TermEvent.performsRegisteredMarkH? program dispatcher configuration = true ↔
      ∃ registers payload parents,
        configuration = normalEventConfiguration program dispatcher registers payload parents ∨
        configuration = emptyEventConfiguration program dispatcher registers payload parents := by
  constructor
  · intro occurs
    cases configuration with
    | mk runtime cursor =>
      cases runtime with
      | none => cases occurs
      | some control =>
        cases control with
        | «macro» mode registers => cases occurs
        | probe kind pc registers => cases occurs
        | script job pc registers =>
          cases job <;> try cases occurs
          all_goals
            change ((pc.val == 3) &&
              (TermEvent.freshHaltPayload? cursor.focus).isSome) = true at occurs
            have parts := (Bool.and_eq_true _ _).mp occurs
            have atThree : pc.val = 3 := of_decide_eq_true parts.1
            obtain ⟨payload, focusEq⟩ :=
              (freshHaltPayload_isSome_iff cursor.focus).1 parts.2
            have pcEq : pc = ⟨3, by simp [jobScript, PrimitiveScripts.mark]⟩ :=
              Fin.ext atThree
            subst pc
            cases cursor with
            | mk focus parents =>
              change focus = freshHField payload at focusEq
              subst focus
              first
              | exact ⟨registers, payload, parents, Or.inl rfl⟩
              | exact ⟨registers, payload, parents, Or.inr rfl⟩
  · rintro ⟨registers, payload, parents, rfl | rfl⟩
    · exact normalEvent_performs program dispatcher registers payload parents
    · exact emptyEvent_performs program dispatcher registers payload parents

/-- The event predicate certifies one actual successful native contraction. -/
theorem performs_mutationCount
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (configuration : SchedulerInvariant.Configuration program dispatcher)
    (occurs : TermEvent.performsRegisteredMarkH? program dispatcher configuration = true) :
    mutationCount (machine program dispatcher) configuration = 1 := by
  obtain ⟨registers, payload, parents, rfl | rfl⟩ :=
    (performs_iff_configuration program dispatcher configuration).1 occurs
  · exact normalEvent_mutationCount program dispatcher registers payload parents
  · exact emptyEvent_mutationCount program dispatcher registers payload parents

theorem performs_projects_one_step
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (configuration : SchedulerInvariant.Configuration program dispatcher)
    (occurs : TermEvent.performsRegisteredMarkH? program dispatcher configuration = true) :
    StepsN 1 configuration.cursor.erase
      (step (machine program dispatcher) configuration).cursor.erase := by
  have projected := step_projects_stepsN (machine program dispatcher) configuration
  rw [performs_mutationCount program dispatcher configuration occurs] at projected
  exact projected

/-- The three read-only descent rows reach the actual normal marker event. -/
theorem normalStart_event_after_three
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    TermEvent.performsRegisteredMarkH? program dispatcher
      (run (machine program dispatcher) 3
        (SchedulerResponse.markStartConfiguration program dispatcher
          registers bit bits continuation carrier parents)) = true := by
  change (3 == 3) &&
    (TermEvent.freshHaltPayload? (freshHField carrier)).isSome = true
  rw [TermEvent.freshHaltPayload?_freshHField]
  rfl

/-- The absorbing-empty marker has the same three read-only descent rows. -/
theorem emptyStart_event_after_three
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    TermEvent.performsRegisteredMarkH? program dispatcher
      (run (machine program dispatcher) 3
        (SchedulerEmpty.markStartConfiguration program dispatcher
          registers bits continuation carrier parents)) = true := by
  change (3 == 3) &&
    (TermEvent.freshHaltPayload? (freshHField carrier)).isSome = true
  rw [TermEvent.freshHaltPayload?_freshHField]
  rfl

/-- A certified normal empty-output return executes the marker after four rows. -/
theorem emptyOutputReturn_event_after_four
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : outputEmpty program registers bit = true) :
    TermEvent.performsRegisteredMarkH? program dispatcher
      (run (machine program dispatcher) 4
        (SchedulerResponse.returnConfiguration program dispatcher
          registers bit bits continuation carrier parents)) = true := by
  rw [show 4 = 3 + 1 by rfl, run_succ]
  rw [SchedulerResponse.step_returnMark program dispatcher registers bit bits
    continuation carrier parents bit_eq output_eq]
  exact normalStart_event_after_three program dispatcher registers bit bits
    continuation carrier parents

/-- Eventual marker occurrence transports through an actual finite run. -/
theorem eventually_of_reaches
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    {initial later : SchedulerInvariant.Configuration program dispatcher}
    {ticks : Nat}
    (reaches : run (machine program dispatcher) ticks initial = later)
    (event : TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher later) :
    TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher initial := by
  rcases event with ⟨delay, occurs⟩
  refine ⟨ticks + delay, ?_⟩
  rw [run_add, reaches]
  exact occurs

/-- Every actual EMPTY frame executes its registered marker after its
fixed zero-action response, without inspecting a checkpoint decoder. -/
theorem emptyFrame_event
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher
      (SchedulerEmpty.frameConfiguration program dispatcher registers bits
        continuation carrier parents) := by
  apply eventually_of_reaches program dispatcher
    (SchedulerEmpty.enterResponse_zeroRun program dispatcher registers bits
      continuation carrier parents).run_eq
  apply eventually_of_reaches program dispatcher
    (SchedulerEmpty.response_countedRun program dispatcher registers bits
      continuation carrier parents).run_eq
  exact ⟨3, emptyStart_event_after_three program dispatcher registers bits
    continuation carrier parents⟩

/-- The actual RETURN-to-marker transition, with the scanned registers,
is equivalent to empty successor data in the independently defined CTS. -/
theorem normalReturn_entersMarker_iff_CTS_empty
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (suffix seedBits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (notSeen : registers.seen = false) (noTail : registers.tail = false) :
    step (machine program dispatcher)
      (SchedulerResponse.returnConfiguration program dispatcher
        (SchedulerCycle.scannedRegisters registers bit suffix) bit seedBits
        continuation carrier parents) =
      SchedulerResponse.markStartConfiguration program dispatcher
        (SchedulerCycle.scannedRegisters registers bit suffix) bit seedBits
        continuation carrier parents ↔
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = [] := by
  have bitEq := SchedulerCycle.scannedRegisters_bit registers bit suffix notSeen
  have guardEq := SchedulerCycle.outputEmpty_scannedRegisters program registers
    bit suffix notSeen noTail
  constructor
  · intro enters
    cases emptyEq : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data with
    | nil => rfl
    | cons next rest =>
      have guardFalse : outputEmpty program
          (SchedulerCycle.scannedRegisters registers bit suffix) bit = false := by
        simpa [emptyEq] using guardEq
      rw [SchedulerResponse.step_returnNoMark program dispatcher
        (SchedulerCycle.scannedRegisters registers bit suffix) bit seedBits
        continuation carrier parents bitEq guardFalse] at enters
      cases congrArg Configuration.control enters
  · intro emptyEq
    exact SchedulerResponse.step_returnMark program dispatcher
      (SchedulerCycle.scannedRegisters registers bit suffix) bit seedBits
      continuation carrier parents bitEq (by simpa [emptyEq] using guardEq)

/-- Every certified nonempty-source response with empty successor has an
actual decoder-free marker event on its finite controller continuation. -/
theorem selectedResponse_empty_event
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context}
    (parents : List ParentFrame) (ticks : Nat)
    (response : SchedulerCycle.SelectedResponseTrace program dispatcher
      seedBits continuation source admissible registers bit suffix
      outerContext fullContext innerContext targetContext parents ticks)
    (notSeen : registers.seen = false) (noTail : registers.tail = false)
    (emptyEq : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher
      (SchedulerInvariant.upConfiguration program dispatcher registers omega
        (ContextCursor.frames fullContext omega
          (.right (PendingFrame.frameFunction haltCode
            (compileActions program dispatcher.tree) (word seedBits) continuation) ::
              parents))) := by
  apply eventually_of_reaches program dispatcher response.execution.run_eq
  refine ⟨4, ?_⟩
  apply emptyOutputReturn_event_after_four
  · exact SchedulerCycle.scannedRegisters_bit registers bit suffix notSeen
  · have guardEq := SchedulerCycle.outputEmpty_scannedRegisters program registers
      bit suffix notSeen noTail
    simpa [emptyEq] using guardEq

/-- An exact finite mutation chain supplies literal raw-run reachability. -/
theorem exactChain_reachable
    {Control : Type} {machine : Machine Control}
    {terminal before : Configuration Control}
    {samples : List (Configuration Control)}
    (chain : SchedulerResponseInvariant.ExactMutationChain machine terminal before samples) :
    ∃ ticks, run machine ticks before = terminal := by
  induction chain with
  | done ticks suffix => exact ⟨ticks, suffix.run_eq⟩
  | next searchTicks found tail ih =>
    obtain ⟨prefixTicks, _, prefixRun, _, _⟩ := seekMutation_exact_run machine found
    obtain ⟨suffixTicks, suffixRun⟩ := ih
    refine ⟨prefixTicks + suffixTicks, ?_⟩
    rw [run_add, prefixRun, suffixRun]

/-- Every encoded input reaches its actual first Base-producing sample. -/
theorem initialBase_reachable
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    let environment := environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit 1 0 environment
    ∃ ticks, run (machine program dispatcher) ticks
        (initialConfiguration program dispatcher bits) =
        SchedulerInvariant.fuelZeroFifthMutationConfiguration program dispatcher
          (Registers.newJob program) environment continuation
          (PrimitiveFuel.pendingParents environment continuation 1 []) := by
  exact exactChain_reachable
    (PureSFormal.Research.RootResetInitialContractionPrefix.clockFuel_exactMutationChain
      program dispatcher bits)

/-- An initially empty encoded CTS input performs a registered marker.
This is a generator-level theorem, including the complete preceding run. -/
theorem initiallyEmpty_performs
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher
      (initialConfiguration program dispatcher []) := by
  let environment := environmentCode (compileActions program dispatcher.tree) []
  let continuation := Dovetail.clockExit 1 0 environment
  obtain ⟨prefixTicks, prefixRun⟩ := initialBase_reachable program dispatcher []
  apply eventually_of_reaches program dispatcher prefixRun
  obtain ⟨downTicks, downRun⟩ := SchedulerNestedEmpty.emptyBase_toFirstFrame_zeroRun
    program dispatcher continuation (Dovetail.clockExit_admissible 1 0 environment) 0 []
  apply eventually_of_reaches program dispatcher downRun.run_eq
  exact emptyFrame_event program dispatcher
    (SchedulerNestedEmpty.initialEmptyRegisters program) [] continuation
    (baseCarrier environment continuation) []

/-- An encoded nonempty input whose first CTS successor is empty performs
a registered marker on its literal controller trajectory. -/
theorem firstSuccessorEmpty_performs
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    (emptyEq : (CTS.absorbingStep program
      ⟨CTS.zeroPhase program, bit :: suffix⟩).data = []) :
    TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher
      (initialConfiguration program dispatcher (bit :: suffix)) := by
  obtain ⟨outerContext, fullContext, innerContext, targetContext, descentTicks,
    ascentTicks, trace⟩ := SchedulerCycle.positiveStageFirstResponseTrace
    program dispatcher bit suffix (Registers.initial program) (CTS.zeroPhase program)
    [] false (SchedulerInvariant.RegistersCoherent.initial program) 1 0
  obtain ⟨prefixTicks, prefixRun⟩ := initialBase_reachable program dispatcher (bit :: suffix)
  apply eventually_of_reaches program dispatcher prefixRun
  apply eventually_of_reaches program dispatcher trace.finalSample_to_return.run_eq
  refine ⟨4, ?_⟩
  apply emptyOutputReturn_event_after_four
  · exact (SchedulerCycle.responseRegisters_spec program bit suffix).1
  · have guardEq := SchedulerCycle.outputEmpty_scannedRegisters program
      (Registers.newJob program).clearScan bit suffix rfl rfl
    have initialPhase : (Registers.newJob program).clearScan.phase = CTS.zeroPhase program := rfl
    rw [initialPhase, emptyEq] at guardEq
    simpa [SchedulerCycle.responseRegisters, SchedulerCycle.scannedRegisters] using guardEq

end PureSFormal.PureS.RegisteredMarkerBridge
