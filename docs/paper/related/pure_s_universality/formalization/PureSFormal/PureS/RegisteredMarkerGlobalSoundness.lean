import PureSFormal.PureS.RegisteredMarkerStages

namespace PureSFormal.PureS.RegisteredMarkerExclusion

open FiniteController SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext SchedulerRecurrence
  SchedulerStageAssembly RegisteredMarkerBridge

/-- Each bounded all-nonempty CTS horizon has its concrete whole generator
prefix with no post-marker row in any listed contraction sample. -/
theorem positiveStages_excludingMarkers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) : ∀ offset,
    (∀ index, index ≤ offset + 1 →
      (CTS.iterate program index (CTS.initial program (bit :: suffix))).data ≠ []) →
    ∃ stages : PositiveStages program dispatcher (bit :: suffix) (offset + 1),
      NoPostMarkers program dispatcher stages.configurations
  | 0, allNonempty => by
      have indexEq : 1 + ExactCheckpointRun.stageCost program dispatcher (bit :: suffix) 1 =
          ExactCheckpointRun.checkpointTime program dispatcher (bit :: suffix) 1 :=
        (ExactCheckpointRun.checkpointTime_one program dispatcher (bit :: suffix)).symm
      obtain ⟨nextParents, configurations, checkpoint, semantic, raw, safe⟩ :=
        allNonemptyRaw_excludingMarkers program dispatcher bit suffix 0 1 []
          (CompletedParents.root program dispatcher) allNonempty indexEq
      refine ⟨RawStageSegment.first program dispatcher (bit :: suffix) semantic raw, ?_⟩
      change NoPostMarkers program dispatcher
        (initialPreludeConfigurations program dispatcher (bit :: suffix) ++ configurations)
      exact noPostMarkers_append (initialPrelude_noPostMarkers program dispatcher (bit :: suffix)) safe
  | offset + 1, allNonempty => by
      obtain ⟨past, pastSafe⟩ := positiveStages_excludingMarkers program dispatcher bit suffix offset
        (fun index bound => allNonempty index (Nat.le_trans bound (Nat.le_succ _)))
      have indexEq : past.configurations.length +
          ExactCheckpointRun.stageCost program dispatcher (bit :: suffix) (offset + 2) =
          ExactCheckpointRun.checkpointTime program dispatcher (bit :: suffix) (offset + 2) := by
        rw [past.count]
        exact ExactCheckpointRun.checkpointTime_positive_succ program dispatcher (bit :: suffix) offset
      obtain ⟨nextParents, configurations, checkpoint, semantic, raw, safe⟩ :=
        allNonemptyRaw_excludingMarkers program dispatcher bit suffix (offset + 1)
          past.configurations.length past.nextParents past.nextOuter allNonempty indexEq
      refine ⟨RawStageSegment.extend past semantic raw, ?_⟩
      change NoPostMarkers program dispatcher (past.configurations ++ configurations)
      exact noPostMarkers_append pastSafe safe

/-- Every positive sampled index covered by an exact chain denotes a literal
member of its configuration list. No cursor erasure is used in this statement. -/
theorem exactChain_contractionRun_mem
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine)
    {terminal before : Configuration Control}
    {configurations : List (Configuration Control)}
    (chain : ExactMutationChain machine terminal before configurations) :
    ∀ {start offset}, system.contractionRun start = before →
      0 < offset → offset ≤ configurations.length →
      system.contractionRun (start + offset) ∈ configurations := by
  induction chain with
  | done ticks suffix =>
      intro start offset beforeEq positive bounded
      exact False.elim (Nat.not_lt_zero 0 (Nat.lt_of_lt_of_le positive bounded))
  | @next before head tail fuel found rest ih =>
      intro start offset beforeEq positive bounded
      have nextEq : system.next before = head := by
        obtain ⟨other, boundedFound⟩ := system.finds before
          (by rw [← beforeEq]; exact system.contractionRun_good start)
        have same := seekMutation_result_unique found boundedFound
        have forward : system.next before = other :=
          advance_eq_of_seekMutation machine system.bound boundedFound
        exact forward.trans same.symm
      have sampleEq : system.contractionRun (start + 1) = head := by
        rw [ProductiveSystem.contractionRun_succ, beforeEq, nextEq]
      cases offset with
      | zero => cases positive
      | succ offset =>
          cases offset with
          | zero => rw [sampleEq]; exact List.Mem.head _
          | succ remaining =>
              have member := ih sampleEq (Nat.zero_lt_succ remaining)
                (Nat.succ_le_succ_iff.mp bounded)
              have shifted : system.contractionRun (start + ((remaining + 1) + 1)) ∈ tail := by
                simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using member
              exact List.Mem.tail head shifted

/-- Unconditional global soundness for the actual registered contraction.
The finite first-empty classification extracts a witness constructively. -/
theorem registeredEvent_implies_eventuallyEmpty
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (event : TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher
      (initialConfiguration program dispatcher bits)) :
    ∃ horizon, (CTS.iterate program horizon (CTS.initial program bits)).data = [] := by
  cases bits with
  | nil => exact ⟨0, rfl⟩
  | cons bit suffix =>
      let system := SampledGood.productiveSystem program dispatcher (bit :: suffix)
        (SchedulerBound.bound program dispatcher)
        (initialConfiguration program dispatcher (bit :: suffix))
        (SchedulerRecurrence.initialGood program dispatcher (bit :: suffix))
      obtain ⟨ticks, occurs⟩ := event
      let count := runMutationCount (machine program dispatcher) ticks system.initial
      have post : postMarker? program dispatcher (system.contractionRun (count + 1)) = true := by
        have marker := registeredEvent_postMarker program dispatcher _ occurs
        change postMarker? program dispatcher
          (step (machine program dispatcher) (run (machine program dispatcher) ticks system.initial)) = true at marker
        rw [step_eq_sample_of_mutation system ticks
          (performs_mutationCount program dispatcher _ occurs)] at marker
        exact marker
      cases SchedulerStageCases.allNonempty_or_firstEmpty program (bit :: suffix) (count + 1) with
      | firstEmpty first => exact ⟨first.index, first.empty⟩
      | allNonempty allNonempty =>
          obtain ⟨stages, safe⟩ := positiveStages_excludingMarkers program dispatcher bit suffix count allNonempty
          have member : system.contractionRun (count + 1) ∈ stages.configurations := by
            have indexed := exactChain_contractionRun_mem system stages.chain
              (start := 0) (offset := count + 1) rfl (Nat.zero_lt_succ count) stages.horizonLower
            simpa only [Nat.zero_add] using indexed
          have excluded := safe _ member
          rw [excluded] at post
          cases post

/-- Every encoded input satisfies the decoder-free registered-event iff. -/
theorem registeredEvent_iff_eventuallyEmpty
    (program : CTS.Program) (dispatcher : ActionDispatcher program) (bits : List Bool) :
    TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher
      (initialConfiguration program dispatcher bits) ↔
      ∃ horizon, (CTS.iterate program horizon (CTS.initial program bits)).data = [] :=
  ⟨registeredEvent_implies_eventuallyEmpty program dispatcher bits,
    eventuallyEmpty_implies_registeredEvent program dispatcher bits⟩

end PureSFormal.PureS.RegisteredMarkerExclusion
