import PureSFormal.PureS.SchedulerDecoder
import PureSFormal.PureS.ControllerTrajectory

/-!
# Halt-marker observations and registered contractions

This module gives distinct formal interfaces for two operational observables:

* a decoder-recognized marked checkpoint snapshot; and
* the actual controller row which contracts the registered fresh halt field.

The second observable inspects only finite control and the cursor focus.  It
does not invoke either checkpoint decoder.
-/

namespace PureSFormal.PureS

namespace TermEvent

/-! ## Decoder-free registered-contraction observation -/

/-- Recognize the payload of the literal fresh field `Halt* V`. -/
def freshHaltPayload? : Term → Option Term
  | .s => none
  | .app function payload =>
      if function = haltCode then some payload else none

@[simp]
theorem freshHaltPayload?_freshHField (payload : Term) :
    freshHaltPayload? (freshHField payload) = some payload := by
  simp [freshHaltPayload?, freshHField]

/--
The current microtick is the registered marker contraction exactly when the
controller is at the unique `Rdx` row of either marker script and the cursor
focus is literally `Halt* V`.  This Boolean reads neither erased terms nor a
checkpoint decoder.
-/
def performsRegisteredMarkH?
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (configuration : SchedulerInvariant.Configuration program dispatcher) :
    Bool :=
  match configuration.control with
  | some (.script .markNormal pc _) =>
      pc.val == 3 && (freshHaltPayload? configuration.cursor.focus).isSome
  | some (.script .markEmpty pc _) =>
      pc.val == 3 && (freshHaltPayload? configuration.cursor.focus).isSome
  | _ => false

/-- Eventual performance of the registered contraction on the actual run. -/
def EventuallyPerformsRegisteredMarkHRaw
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (initial : SchedulerInvariant.Configuration program dispatcher) : Prop :=
  ∃ ticks, performsRegisteredMarkH? program dispatcher
    (FiniteController.run (SchedulerControl.machine program dispatcher)
      ticks initial) = true

/-- Reinitialization never reports a transition at time zero. -/
@[simp]
theorem performsRegisteredMarkH?_initialTerm
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (term : Term) :
    performsRegisteredMarkH? program dispatcher
      ⟨some (SchedulerControl.initialControl program dispatcher),
        ⟨term, []⟩⟩ = false := by
  rfl

/-! ## Decoder-recognized marked snapshots -/

/-- Total term-only observation of a positive marked checkpoint snapshot. -/
def observesMarkedCheckpoint?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Bool :=
  match CheckpointDecoder.decode? program tree term with
  | some (.positive view) =>
      match view.queue with
      | [] => true
      | _ :: _ => false
  | _ => false

/-- Compatibility name for the original marked-snapshot observer. -/
abbrev emitsMarkH? := observesMarkedCheckpoint?

/-- Exact parser characterization of the Boolean marker observer. -/
theorem emitsMarkH?_eq_true_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    observesMarkedCheckpoint? program tree term = true ↔
      ∃ view : CheckpointDecoder.PositiveView program,
        CheckpointDecoder.decode? program tree term = some (.positive view) ∧
          view.queue = [] := by
  constructor
  · intro observed
    unfold observesMarkedCheckpoint? at observed
    cases decoded : CheckpointDecoder.decode? program tree term with
    | none =>
        rw [decoded] at observed
        exact Bool.noConfusion observed
    | some result =>
        cases result with
        | zero bits =>
            rw [decoded] at observed
            exact Bool.noConfusion observed
        | positive view =>
            rw [decoded] at observed
            cases view with
            | mk horizon route label queue =>
                cases queue with
                | nil => exact ⟨_, rfl, rfl⟩
                | cons bit suffix => exact Bool.noConfusion observed
  · rintro ⟨view, decoded, queueEmpty⟩
    unfold observesMarkedCheckpoint?
    rw [decoded]
    cases view with
    | mk horizon route label queue =>
        cases queueEmpty
        rfl

/-- A positive checkpoint is observed as marked exactly when its data is empty. -/
theorem emitsMarkH?_positivePrefix
    {program : CTS.Program} {actions : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat} {term : Term}
    {contractions : Nat} {activeContext : Context}
    {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program actions bits horizon
      term contractions activeContext chain) :
    emitsMarkH? program actions.tree term = true ↔
      (CTS.iterate program horizon (CTS.initial program bits)).data = [] := by
  unfold emitsMarkH? observesMarkedCheckpoint?
  rw [certificate.decode]
  cases hdata : (CTS.iterate program horizon
      (CTS.initial program bits)).data with
  | nil => simp
  | cons bit suffix => simp

/-- The unreduced horizon-zero encoder is not a marked positive snapshot. -/
@[simp]
theorem emitsMarkH?_timeZero
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) :
    emitsMarkH? program actions.tree
      (generator (compileActions program actions.tree) bits) = false := by
  unfold emitsMarkH? observesMarkedCheckpoint?
  rw [CheckpointRun.decode?_timeZero]

/-- Marked-snapshot observation exposes a public decode with empty data. -/
theorem publicDecode_of_emitsMarkH
    {program : CTS.Program} {actions : ActionDispatcher program}
    {term : Term}
    (marked : emitsMarkH? program actions.tree term = true) :
    ∃ horizon,
      PublicDecoder.decode program actions.tree term =
        some (horizon, PublicDecoder.decodedConfig program horizon []) := by
  rcases (emitsMarkH?_eq_true_iff program actions.tree term).1 marked with
    ⟨view, decoded, queueEmpty⟩
  cases view with
  | mk horizon route label queue =>
      change queue = [] at queueEmpty
      subst queue
      refine ⟨horizon, ?_⟩
      unfold PublicDecoder.decode
      rw [decoded]
      rfl

/-- A positive public decode with empty data is observed as marked. -/
theorem emitsMarkH_of_publicDecode_empty
    {program : CTS.Program} {actions : ActionDispatcher program}
    {term : Term} {horizon : Nat}
    (positive : horizon ≠ 0)
    (decoded : PublicDecoder.decode program actions.tree term =
      some (horizon, PublicDecoder.decodedConfig program horizon [])) :
    emitsMarkH? program actions.tree term = true := by
  rcases PublicDecoder.exists_internal_of_decode decoded with
    ⟨result, internal, repacked⟩
  cases result with
  | zero bits =>
      have horizonEq : 0 = horizon :=
        congrArg Prod.fst repacked
      exact (positive horizonEq.symm).elim
  | positive view =>
      apply (emitsMarkH?_eq_true_iff program actions.tree term).2
      refine ⟨view, internal, ?_⟩
      have queueEq : view.queue = [] :=
        congrArg (fun pair => pair.2.data) repacked
      exact queueEq

/-- Eventual observation of a marked snapshot on a sampled controller run. -/
def EventuallyObservesMarkedCheckpoint
    {Control : Type}
    {machine : FiniteController.Machine Control}
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (system : FiniteController.ProductiveSystem machine) : Prop :=
  ∃ index, emitsMarkH? program tree
    (system.contractionRun index).cursor.erase = true

/-- Compatibility name for the original sampled marked-snapshot predicate. -/
abbrev EventuallyEmits
    {Control : Type}
    {machine : FiniteController.Machine Control}
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (system : FiniteController.ProductiveSystem machine) : Prop :=
  EventuallyObservesMarkedCheckpoint program tree system

/-- Eventual marked-snapshot observation on the actual microtick run. -/
def EventuallyObservesMarkedCheckpointRaw
    {Control : Type}
    (machine : FiniteController.Machine Control)
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (initial : FiniteController.Configuration Control) : Prop :=
  ∃ ticks, emitsMarkH? program tree
    (FiniteController.run machine ticks initial).cursor.erase = true

/-- Compatibility name for the original raw marked-snapshot predicate. -/
abbrev EventuallyEmitsRaw
    {Control : Type}
    (machine : FiniteController.Machine Control)
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (initial : FiniteController.Configuration Control) : Prop :=
  EventuallyObservesMarkedCheckpointRaw machine program tree initial

/-- Administrative rows neither create nor hide marked-snapshot observations. -/
theorem eventuallyEmitsRaw_iff_sampled
    {Control : Type}
    {machine : FiniteController.Machine Control}
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (system : FiniteController.ProductiveSystem machine) :
    EventuallyEmitsRaw machine program tree system.initial ↔
      EventuallyEmits program tree system := by
  exact system.eventually_raw_iff_sampled (emitsMarkH? program tree)

/--
For a fully productive scheduler with exact checkpoints, eventual observation
of a marked snapshot is equivalent to eventual emptiness of the totalized CTS
dataword.
-/
theorem eventuallyEmits_iff_eventuallyEmpty
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (bound : SchedulerInvariant.Configuration program dispatcher → Nat)
    (initialGood : SchedulerInvariant.SampledGood program dispatcher bits 0
      bound (SchedulerControl.initialConfiguration program dispatcher bits))
    (exactCheckpoint : ∀ horizon,
      let system := SchedulerInvariant.SampledGood.productiveSystem
        program dispatcher bits bound
        (SchedulerControl.initialConfiguration program dispatcher bits)
        initialGood
      PublicDecoder.decode program dispatcher.tree
          (system.contractionRun
            (ExactCheckpointRun.checkpointTime program dispatcher bits
              horizon)).cursor.erase =
        some (horizon,
          CTS.iterate program horizon (CTS.initial program bits))) :
    let system := SchedulerInvariant.SampledGood.productiveSystem
      program dispatcher bits bound
      (SchedulerControl.initialConfiguration program dispatcher bits)
      initialGood
    EventuallyEmits program dispatcher.tree system ↔
      ∃ horizon,
        (CTS.iterate program horizon (CTS.initial program bits)).data = [] := by
  dsimp only
  let system := SchedulerInvariant.SampledGood.productiveSystem
    program dispatcher bits bound
    (SchedulerControl.initialConfiguration program dispatcher bits)
    initialGood
  constructor
  · rintro ⟨index, marked⟩
    rcases publicDecode_of_emitsMarkH marked with ⟨horizon, decoded⟩
    have accepted :=
      SchedulerInvariant.SampledGood.contractionRun_publicAcceptsOnly
        program dispatcher bits bound
        (SchedulerControl.initialConfiguration program dispatcher bits)
        initialGood index horizon
        (PublicDecoder.decodedConfig program horizon []) decoded
    refine ⟨horizon, ?_⟩
    have dataEq := congrArg CTS.Config.data accepted.2
    exact dataEq.symm
  · rintro ⟨horizon, empty⟩
    let positiveHorizon := horizon + 1
    have nextEmpty :
        (CTS.iterate program positiveHorizon
          (CTS.initial program bits)).data = [] := by
      unfold positiveHorizon
      rw [CTS.iterate_succ]
      exact CTS.absorbingStep_data_eq_empty_of_empty empty
    have decoded := exactCheckpoint positiveHorizon
    have decodedEmpty : PublicDecoder.decode program dispatcher.tree
        (system.contractionRun
          (ExactCheckpointRun.checkpointTime program dispatcher bits
            positiveHorizon)).cursor.erase =
        some (positiveHorizon,
          PublicDecoder.decodedConfig program positiveHorizon []) := by
      rw [decoded]
      apply congrArg (fun config => some (positiveHorizon, config))
      have reconstructed := PublicDecoder.decodedConfig_iterate_data
        program positiveHorizon bits
      rw [nextEmpty] at reconstructed
      exact reconstructed.symm
    refine ⟨ExactCheckpointRun.checkpointTime
      program dispatcher bits positiveHorizon, ?_⟩
    exact emitsMarkH_of_publicDecode_empty
      (by exact Nat.succ_ne_zero horizon) decodedEmpty

/--
The same snapshot equivalence holds for the literal finite-controller
trajectory, including every cursor movement, local probe, and finite-control
transition.
-/
theorem eventuallyEmitsRaw_iff_eventuallyEmpty
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (bound : SchedulerInvariant.Configuration program dispatcher → Nat)
    (initialGood : SchedulerInvariant.SampledGood program dispatcher bits 0
      bound (SchedulerControl.initialConfiguration program dispatcher bits))
    (exactCheckpoint : ∀ horizon,
      let system := SchedulerInvariant.SampledGood.productiveSystem
        program dispatcher bits bound
        (SchedulerControl.initialConfiguration program dispatcher bits)
        initialGood
      PublicDecoder.decode program dispatcher.tree
          (system.contractionRun
            (ExactCheckpointRun.checkpointTime program dispatcher bits
              horizon)).cursor.erase =
        some (horizon,
          CTS.iterate program horizon (CTS.initial program bits))) :
    EventuallyEmitsRaw (SchedulerControl.machine program dispatcher)
        program dispatcher.tree
        (SchedulerControl.initialConfiguration program dispatcher bits) ↔
      ∃ horizon,
        (CTS.iterate program horizon (CTS.initial program bits)).data = [] := by
  let system := SchedulerInvariant.SampledGood.productiveSystem
    program dispatcher bits bound
    (SchedulerControl.initialConfiguration program dispatcher bits)
    initialGood
  exact (eventuallyEmitsRaw_iff_sampled program dispatcher.tree system).trans
    (eventuallyEmits_iff_eventuallyEmpty program dispatcher bits bound
      initialGood exactCheckpoint)

/-! Accurate public names for the marked-snapshot results above. -/

theorem eventuallyObservesMarkedCheckpointRaw_iff_sampled
    {Control : Type}
    {machine : FiniteController.Machine Control}
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (system : FiniteController.ProductiveSystem machine) :
    EventuallyObservesMarkedCheckpointRaw machine program tree system.initial ↔
      EventuallyObservesMarkedCheckpoint program tree system :=
  eventuallyEmitsRaw_iff_sampled program tree system

theorem eventuallyObservesMarkedCheckpoint_iff_eventuallyEmpty
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (bound : SchedulerInvariant.Configuration program dispatcher → Nat)
    (initialGood : SchedulerInvariant.SampledGood program dispatcher bits 0
      bound (SchedulerControl.initialConfiguration program dispatcher bits))
    (exactCheckpoint : ∀ horizon,
      let system := SchedulerInvariant.SampledGood.productiveSystem
        program dispatcher bits bound
        (SchedulerControl.initialConfiguration program dispatcher bits)
        initialGood
      PublicDecoder.decode program dispatcher.tree
          (system.contractionRun
            (ExactCheckpointRun.checkpointTime program dispatcher bits
              horizon)).cursor.erase =
        some (horizon,
          CTS.iterate program horizon (CTS.initial program bits))) :
    let system := SchedulerInvariant.SampledGood.productiveSystem
      program dispatcher bits bound
      (SchedulerControl.initialConfiguration program dispatcher bits)
      initialGood
    EventuallyObservesMarkedCheckpoint program dispatcher.tree system ↔
      ∃ horizon,
        (CTS.iterate program horizon (CTS.initial program bits)).data = [] :=
  eventuallyEmits_iff_eventuallyEmpty program dispatcher bits bound initialGood
    exactCheckpoint

theorem eventuallyObservesMarkedCheckpointRaw_iff_eventuallyEmpty
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (bound : SchedulerInvariant.Configuration program dispatcher → Nat)
    (initialGood : SchedulerInvariant.SampledGood program dispatcher bits 0
      bound (SchedulerControl.initialConfiguration program dispatcher bits))
    (exactCheckpoint : ∀ horizon,
      let system := SchedulerInvariant.SampledGood.productiveSystem
        program dispatcher bits bound
        (SchedulerControl.initialConfiguration program dispatcher bits)
        initialGood
      PublicDecoder.decode program dispatcher.tree
          (system.contractionRun
            (ExactCheckpointRun.checkpointTime program dispatcher bits
              horizon)).cursor.erase =
        some (horizon,
          CTS.iterate program horizon (CTS.initial program bits))) :
    EventuallyObservesMarkedCheckpointRaw
        (SchedulerControl.machine program dispatcher) program dispatcher.tree
        (SchedulerControl.initialConfiguration program dispatcher bits) ↔
      ∃ horizon,
        (CTS.iterate program horizon (CTS.initial program bits)).data = [] :=
  eventuallyEmitsRaw_iff_eventuallyEmpty program dispatcher bits bound
    initialGood exactCheckpoint

end TermEvent

end PureSFormal.PureS
