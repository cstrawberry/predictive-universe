import PureSFormal.PureS.LocalTransition

/-!
# Halt-consistent checked CTS transitions

This module adds the scheduler's halt-state decision to one complete local
transition.  All result data remain indices of propositions: no proof of
emptiness is eliminated to construct a `Term`, cost, or halt state.

For a nonempty input the base response cost includes the unique C4 deletion.
For an empty input there is no deletion.  In both cases the marker contribution
is exactly one iff the absorbing CTS output is empty.
-/

namespace PureSFormal.PureS

namespace CheckedTransition

open CanonicalTraversal

/-! ## Computable indices -/

/-- The data component of the total CTS successor. -/
def outputData (program : CTS.Program) (phase : CTS.Phase program)
    (input : List Bool) : List Bool :=
  (CTS.absorbingStep program ⟨phase, input⟩).data

/-- The dispatcher label used by a local transition.  Empty input uses zero. -/
def label (program : CTS.Program) (phase : CTS.Phase program) :
    List Bool → ActionLabel program
  | [] => (phase, false)
  | bit :: _ => (phase, bit)

/-- The post-deletion data seen by the selected action. -/
def actionInput : List Bool → List Bool
  | [] => []
  | _ :: suffix => suffix

/-- The deletion contribution to the response cost. -/
def deletionCost : List Bool → Nat
  | [] => 0
  | _ :: _ => 1

/-- Whether the response must receive the registered halt marker. -/
def needsMark : List Bool → Bool
  | [] => true
  | _ :: _ => false

/-- The exact Boolean marker contribution, either zero or one. -/
def markerCost (data : List Bool) : Nat :=
  if needsMark data then 1 else 0

/-- The registered endpoint status is determined by output emptiness. -/
def outputStatus : List Bool → ReachableAudit.HaltState
  | [] => .marked
  | _ :: _ => .fresh

/-- Deletion plus frame/route/action, before the optional marker. -/
def baseCost (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (input : List Bool) : Nat :=
  deletionCost input +
    LocalResponse.completedCost program (actions.route (label program phase input))
      (label program phase input)

/-- Complete checked-transition cost: base response plus the Boolean marker. -/
def totalCost (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (input : List Bool) : Nat :=
  baseCost program actions phase input +
    markerCost (outputData program phase input)

@[simp] theorem outputData_empty
    (program : CTS.Program) (phase : CTS.Phase program) :
    outputData program phase [] = [] :=
  rfl

@[simp] theorem outputData_cons
    (program : CTS.Program) (phase : CTS.Phase program)
    (bit : Bool) (suffix : List Bool) :
    outputData program phase (bit :: suffix) =
      (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data :=
  rfl

@[simp] theorem label_empty
    (program : CTS.Program) (phase : CTS.Phase program) :
    label program phase [] = (phase, false) :=
  rfl

@[simp] theorem label_cons
    (program : CTS.Program) (phase : CTS.Phase program)
    (bit : Bool) (suffix : List Bool) :
    label program phase (bit :: suffix) = (phase, bit) :=
  rfl

@[simp] theorem actionInput_empty : actionInput [] = [] :=
  rfl

@[simp] theorem actionInput_cons (bit : Bool) (suffix : List Bool) :
    actionInput (bit :: suffix) = suffix :=
  rfl

@[simp] theorem deletionCost_empty : deletionCost [] = 0 :=
  rfl

@[simp] theorem deletionCost_cons (bit : Bool) (suffix : List Bool) :
    deletionCost (bit :: suffix) = 1 :=
  rfl

@[simp] theorem markerCost_empty : markerCost [] = 1 :=
  rfl

@[simp] theorem markerCost_cons (bit : Bool) (suffix : List Bool) :
    markerCost (bit :: suffix) = 0 :=
  rfl

@[simp] theorem outputStatus_empty : outputStatus [] = .marked :=
  rfl

@[simp] theorem outputStatus_cons (bit : Bool) (suffix : List Bool) :
    outputStatus (bit :: suffix) = .fresh :=
  rfl

@[simp] theorem baseCost_empty
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) :
    baseCost program actions phase [] =
      LocalResponse.completedCost program
        (actions.route (phase, false)) (phase, false) := by
  simp [baseCost]

@[simp] theorem baseCost_cons
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (bit : Bool) (suffix : List Bool) :
    baseCost program actions phase (bit :: suffix) =
      1 + LocalResponse.completedCost program
        (actions.route (phase, bit)) (phase, bit) := by
  simp [baseCost]

/-- The absorbing-empty cost is exactly the existing `executeEmpty` count. -/
theorem totalCost_empty
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) :
    totalCost program actions phase [] =
      5 + 2 * (actions.route (phase, false)).length := by
  simp only [totalCost, outputData_empty, markerCost_empty, baseCost_empty,
    LocalResponse.completedCost, actionCost_zero, Nat.add_zero]
  rw [← Nat.add_assoc 3 (2 * (actions.route (phase, false)).length) 1]
  rw [Nat.add_comm 3 (2 * (actions.route (phase, false)).length)]
  rw [Nat.add_comm 5 (2 * (actions.route (phase, false)).length)]

/-- Nonempty cost exposes deletion + response + the Boolean marker literally. -/
theorem totalCost_cons
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (bit : Bool) (suffix : List Bool) :
    totalCost program actions phase (bit :: suffix) =
      (1 + LocalResponse.completedCost program
        (actions.route (phase, bit)) (phase, bit)) +
        markerCost
          ((CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data) :=
  rfl

/-- The action selected after deletion computes the total CTS output data. -/
theorem action_output_eq
    (program : CTS.Program) (phase : CTS.Phase program) (input : List Bool) :
    ActionDecode.outputData program (label program phase input)
        (actionInput input) =
      outputData program phase input := by
  cases input with
  | nil => rfl
  | cons bit suffix => cases bit <;> rfl

/-! ## Exact preparation and marking relations -/

/--
The response snapshot is the source itself on empty input and the canonical
one-cell deletion endpoint on nonempty input.
-/
inductive Prepared
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation) (source : Term) :
    List Bool → Term → Prop where
  | empty
      (sourceInv : ReachableAudit.Holds program actions.tree seedBits
        continuation source)
      (sourceDecode : CarrierDecoder.decode? program actions.tree seedBits
        continuation hadmissible source = some []) :
      Prepared program actions seedBits continuation hadmissible source [] source
  | nonempty
      {bit : Bool} {suffix : List Bool} {snapshot : Term}
      (deletion : StepsN 1 source snapshot)
      (snapshotInv : ReachableAudit.Holds program actions.tree seedBits
        continuation snapshot)
      (snapshotDecode : CarrierDecoder.decode? program actions.tree seedBits
        continuation hadmissible snapshot = some suffix)
      (canonical : ∃ predecessor outerContext,
        SelectedFront program actions.tree seedBits continuation source bit
            suffix outerContext ∧
          FrontCertificate source snapshot bit suffix predecessor outerContext) :
      Prepared program actions seedBits continuation hadmissible source
        (bit :: suffix) snapshot

namespace Prepared

theorem snapshot_holds
    {program : CTS.Program} {actions : ActionDispatcher program}
    {seedBits : List Bool} {continuation : Term}
    {hadmissible : Carrier.Admissible continuation} {source : Term}
    {input : List Bool} {snapshot : Term}
    (h : Prepared program actions seedBits continuation hadmissible source input
      snapshot) :
    ReachableAudit.Holds program actions.tree seedBits continuation snapshot := by
  cases h with
  | empty sourceInv sourceDecode => exact sourceInv
  | nonempty deletion snapshotInv snapshotDecode canonical => exact snapshotInv

theorem snapshot_decode
    {program : CTS.Program} {actions : ActionDispatcher program}
    {seedBits : List Bool} {continuation : Term}
    {hadmissible : Carrier.Admissible continuation} {source : Term}
    {input : List Bool} {snapshot : Term}
    (h : Prepared program actions seedBits continuation hadmissible source input
      snapshot) :
    CarrierDecoder.decode? program actions.tree seedBits continuation
      hadmissible snapshot = some (actionInput input) := by
  cases h with
  | empty sourceInv sourceDecode => exact sourceDecode
  | nonempty deletion snapshotInv snapshotDecode canonical => exact snapshotDecode

/-- Lift the optional one-cell deletion through the pending frame. -/
theorem frame_steps
    {program : CTS.Program} {actions : ActionDispatcher program}
    {seedBits : List Bool} {continuation : Term}
    {hadmissible : Carrier.Admissible continuation} {source : Term}
    {input : List Bool} {snapshot : Term}
    (h : Prepared program actions seedBits continuation hadmissible source input
      snapshot) :
    StepsN (deletionCost input)
      (frame
        (environmentCode (compileActions program actions.tree) seedBits)
        continuation source)
      (frame
        (environmentCode (compileActions program actions.tree) seedBits)
        continuation snapshot) := by
  cases h with
  | empty sourceInv sourceDecode => exact StepsN.refl _
  | nonempty deletion snapshotInv snapshotDecode canonical =>
      exact StepsN.appRight
        (.app
          (environmentCode (compileActions program actions.tree) seedBits)
          continuation)
        deletion

end Prepared

/--
The optional marker relation.  Its indices expose the exact endpoint term,
zero/one cost, and halt status without eliminating an emptiness proof to data.
-/
inductive Marking
    (bits : List Bool) (continuation snapshot completedRoute : Term) :
    List Bool → Term → Nat → ReachableAudit.HaltState → Prop where
  | fresh (bit : Bool) (suffix : List Bool) :
      Marking bits continuation snapshot completedRoute (bit :: suffix)
        (LocalResponse.completed bits continuation snapshot completedRoute)
        0 .fresh
  | marked :
      Marking bits continuation snapshot completedRoute []
        (LocalResponse.markedCompleted bits continuation snapshot completedRoute)
        1 .marked

namespace Marking

/-- The relation performs exactly its indexed zero-or-one marker count. -/
theorem steps
    {bits : List Bool} {continuation snapshot completedRoute : Term}
    {output : List Bool} {result : Term} {cost : Nat}
    {status : ReachableAudit.HaltState}
    (h : Marking bits continuation snapshot completedRoute output result cost
      status) :
    StepsN cost
      (LocalResponse.completed bits continuation snapshot completedRoute)
      result := by
  cases h with
  | fresh bit suffix => exact StepsN.refl _
  | marked =>
      exact LocalResponse.completed_mark bits continuation snapshot completedRoute

/-- The indexed marker count is the Boolean emptiness cost. -/
theorem cost_eq
    {bits : List Bool} {continuation snapshot completedRoute : Term}
    {output : List Bool} {result : Term} {cost : Nat}
    {status : ReachableAudit.HaltState}
    (h : Marking bits continuation snapshot completedRoute output result cost
      status) :
    cost = markerCost output := by
  cases h <;> rfl

/-- Marked status occurs exactly on empty output. -/
theorem marked_iff
    {bits : List Bool} {continuation snapshot completedRoute : Term}
    {output : List Bool} {result : Term} {cost : Nat}
    {status : ReachableAudit.HaltState}
    (h : Marking bits continuation snapshot completedRoute output result cost
      status) :
    status = .marked ↔ output = [] := by
  cases h <;> simp

/-- Fresh status occurs exactly on nonempty output. -/
theorem fresh_iff
    {bits : List Bool} {continuation snapshot completedRoute : Term}
    {output : List Bool} {result : Term} {cost : Nat}
    {status : ReachableAudit.HaltState}
    (h : Marking bits continuation snapshot completedRoute output result cost
      status) :
    status = .fresh ↔ output ≠ [] := by
  cases h <;> simp

/-- Both endpoint alternatives retain the literal continuation occurrence. -/
theorem continuation
    {bits : List Bool} {continuation snapshot completedRoute : Term}
    {output : List Bool} {result : Term} {cost : Nat}
    {status : ReachableAudit.HaltState}
    (h : Marking bits continuation snapshot completedRoute output result cost
      status) :
    result.subterm? LocalResponse.continuationAddress = some continuation := by
  cases h with
  | fresh bit suffix =>
      exact LocalResponse.completed_continuation bits continuation snapshot
        completedRoute
  | marked =>
      exact LocalResponse.markedCompleted_continuation bits continuation snapshot
        completedRoute

/-- Exact dispatch provenance extends to the indexed fresh/marked Layer. -/
theorem layer
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation snapshot completedRoute : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {accumulator : Term}
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator completedRoute)
    {output : List Bool} {result : Term} {cost : Nat}
    {status : ReachableAudit.HaltState}
    (h : Marking bits continuation snapshot completedRoute output result cost
      status) :
    ReachableAudit.Layer program tree bits continuation snapshot accumulator
      result status route label completedRoute := by
  cases h with
  | fresh bit suffix => exact ⟨dispatch, rfl⟩
  | marked => exact ⟨dispatch, rfl⟩

/-- Exact dispatch decoding is independent of the halt-field alternative. -/
theorem decode
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation snapshot completedRoute : Term}
    (hadmissible : Carrier.Admissible continuation)
    {route : Dispatcher.Route} {label : ActionLabel program}
    {accumulator : Term}
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator completedRoute)
    {output : List Bool} {result : Term} {cost : Nat}
    {status : ReachableAudit.HaltState}
    (h : Marking bits continuation snapshot completedRoute output result cost
      status)
    (accumulatorDecode : CarrierDecoder.decode? program tree bits continuation
      hadmissible accumulator = some output) :
    CarrierDecoder.decode? program tree bits continuation hadmissible result =
      some output := by
  cases h with
  | fresh bit suffix =>
      rw [CarrierDecoder.decode?_local program tree bits continuation
        hadmissible dispatch.toDispatchesTo
        (LocalResponse.completed_localShell bits continuation snapshot
          completedRoute)]
      exact accumulatorDecode
  | marked =>
      rw [CarrierDecoder.decode?_local program tree bits continuation
        hadmissible dispatch.toDispatchesTo
        (LocalResponse.markedCompleted_localShell bits continuation snapshot
          completedRoute)]
      exact accumulatorDecode

end Marking

/-! ## Checked result relation -/

/--
A complete halt-consistent local transition.  `result`, `cost`, and `status`
are proposition indices rather than data projected from a proof.
-/
structure Result
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (seedBits : List Bool)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (source : Term) (input : List Bool)
    (result : Term) (cost : Nat) (status : ReachableAudit.HaltState) : Prop where
  steps : StepsN cost
    (frame
      (environmentCode (compileActions program actions.tree) seedBits)
      continuation source)
    result
  holds : ReachableAudit.Holds program actions.tree seedBits continuation result
  decodes : CarrierDecoder.decode? program actions.tree seedBits continuation
    hadmissible result = some (outputData program phase input)
  exposesContinuation :
    result.subterm? LocalResponse.continuationAddress = some continuation
  cost_eq : cost = totalCost program actions phase input
  status_eq : status = outputStatus (outputData program phase input)
  marked_iff_output_empty :
    status = .marked ↔ outputData program phase input = []
  fresh_iff_output_nonempty :
    status = .fresh ↔ outputData program phase input ≠ []
  provenance : ∃ snapshot completedRoute,
    Prepared program actions seedBits continuation hadmissible source input
        snapshot ∧
      ReachableAudit.SnapshotDispatchAt program actions.tree snapshot
        (actions.route (label program phase input)) (label program phase input)
        (actionAccumulator program (label program phase input) snapshot)
        completedRoute ∧
      Marking seedBits continuation snapshot completedRoute
        (outputData program phase input) result
        (markerCost (outputData program phase input)) status ∧
      ReachableAudit.Layer program actions.tree seedBits continuation snapshot
        (actionAccumulator program (label program phase input) snapshot)
        result status (actions.route (label program phase input))
        (label program phase input) completedRoute

/-! ## Uniform response after preparation -/

/--
Execute the exact route/action response from a prepared snapshot and apply the
Boolean marker decision to its decoded output.
-/
theorem executePrepared
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (seedBits : List Bool)
    (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    {input : List Bool} {snapshot : Term}
    (prepared : Prepared program actions seedBits continuation hadmissible source
      input snapshot) :
    ∃ result cost status,
      Result program actions phase seedBits continuation hadmissible source input
        result cost status := by
  let selectedLabel := label program phase input
  let route := actions.route selectedLabel
  obtain ⟨completedRoute, path, responseSteps, freshInv, dispatch⟩ :=
    CompleteLayer.executeSelected program actions selectedLabel seedBits
      continuation snapshot prepared.snapshot_holds
  have preparedSteps := prepared.frame_steps
  have baseSteps : StepsN (baseCost program actions phase input)
      (frame
        (environmentCode (compileActions program actions.tree) seedBits)
        continuation source)
      (LocalResponse.completed seedBits continuation snapshot completedRoute) := by
    have combined := StepsN.trans preparedSteps responseSteps
    simpa [baseCost, selectedLabel, route] using combined
  have accumulatorDecode :
      CarrierDecoder.decode? program actions.tree seedBits continuation
          hadmissible
          (actionAccumulator program selectedLabel snapshot) =
        some (outputData program phase input) := by
    have decoded := CarrierActionDecode.decode_actionAccumulator program
      actions.tree seedBits continuation hadmissible selectedLabel
      prepared.snapshot_decode
    simpa [selectedLabel, action_output_eq] using decoded
  cases houtput : outputData program phase input with
  | nil =>
      let result := LocalResponse.markedCompleted seedBits continuation snapshot
        completedRoute
      have marking : Marking seedBits continuation snapshot completedRoute []
          result 1 .marked := by
        exact .marked
      have markerSteps := marking.steps
      have allSteps : StepsN (totalCost program actions phase input)
          (frame
            (environmentCode (compileActions program actions.tree) seedBits)
            continuation source)
          result := by
        have combined := StepsN.trans baseSteps markerSteps
        simpa [totalCost, houtput] using combined
      have layer := marking.layer dispatch
      have resultInv : ReachableAudit.Holds program actions.tree seedBits
          continuation result :=
        .local prepared.snapshot_holds prepared.snapshot_holds
          (ReachableAudit.actionAccumulator_segment program selectedLabel snapshot)
          layer
      have resultDecode : CarrierDecoder.decode? program actions.tree seedBits
          continuation hadmissible result =
          some (outputData program phase input) := by
        have decoded := marking.decode hadmissible dispatch
          (houtput ▸ accumulatorDecode)
        simpa [houtput] using decoded
      refine ⟨result, totalCost program actions phase input, .marked, ?_⟩
      refine
        { steps := allSteps
          holds := resultInv
          decodes := resultDecode
          exposesContinuation := marking.continuation
          cost_eq := rfl
          status_eq := ?_
          marked_iff_output_empty := ?_
          fresh_iff_output_nonempty := ?_
          provenance := ?_ }
      · simp [houtput]
      · simp [houtput]
      · simp [houtput]
      · exact ⟨snapshot, completedRoute, prepared, by simpa [selectedLabel,
          route] using dispatch, by simpa [houtput] using marking,
          by simpa [selectedLabel, route] using layer⟩
  | cons outputBit outputSuffix =>
      let result := LocalResponse.completed seedBits continuation snapshot
        completedRoute
      have marking : Marking seedBits continuation snapshot completedRoute
          (outputBit :: outputSuffix) result 0 .fresh := by
        exact .fresh outputBit outputSuffix
      have markerSteps := marking.steps
      have allSteps : StepsN (totalCost program actions phase input)
          (frame
            (environmentCode (compileActions program actions.tree) seedBits)
            continuation source)
          result := by
        have combined := StepsN.trans baseSteps markerSteps
        simpa [totalCost, houtput] using combined
      have layer := marking.layer dispatch
      have resultInv : ReachableAudit.Holds program actions.tree seedBits
          continuation result :=
        .local prepared.snapshot_holds prepared.snapshot_holds
          (ReachableAudit.actionAccumulator_segment program selectedLabel snapshot)
          layer
      have resultDecode : CarrierDecoder.decode? program actions.tree seedBits
          continuation hadmissible result =
          some (outputData program phase input) := by
        have decoded := marking.decode hadmissible dispatch
          (houtput ▸ accumulatorDecode)
        simpa [houtput] using decoded
      refine ⟨result, totalCost program actions phase input, .fresh, ?_⟩
      refine
        { steps := allSteps
          holds := resultInv
          decodes := resultDecode
          exposesContinuation := marking.continuation
          cost_eq := rfl
          status_eq := ?_
          marked_iff_output_empty := ?_
          fresh_iff_output_nonempty := ?_
          provenance := ?_ }
      · simp [houtput]
      · simp [houtput]
      · simp [houtput]
      · exact ⟨snapshot, completedRoute, prepared, by simpa [selectedLabel,
          route] using dispatch, by simpa [houtput] using marking,
          by simpa [selectedLabel, route] using layer⟩

/-! ## Scheduler-facing single transition -/

/--
Every decoded reachable carrier performs one exact halt-consistent CTS step.
Nonempty input first uses the unique canonical deletion; empty input is its
zero-action absorbing response.  The returned relation fixes term, cost, and
status entirely by indices.
-/
theorem execute
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (seedBits : List Bool)
    (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (input : List Bool)
    (sourceInv : ReachableAudit.Holds program actions.tree seedBits continuation
      source)
    (sourceDecode : CarrierDecoder.decode? program actions.tree seedBits
      continuation hadmissible source = some input) :
    ∃ result cost status,
      Result program actions phase seedBits continuation hadmissible source input
        result cost status := by
  cases input with
  | nil =>
      exact executePrepared program actions phase seedBits continuation source
        hadmissible (.empty sourceInv sourceDecode)
  | cons bit suffix =>
      obtain ⟨decoded, context, descent, descentDecode⟩ :=
        LocalTransition.decode_of_holds program actions.tree seedBits continuation
          hadmissible sourceInv
      have decodedEq : decoded = bit :: suffix := by
        have hsomes : (some decoded : Option (List Bool)) =
            some (bit :: suffix) := descentDecode.symm.trans sourceDecode
        exact Option.some.inj hsomes
      subst decoded
      obtain ⟨snapshot, snapshotContext, deletedCellPredecessor, outerContext,
        selected, unique, snapshotDescent, snapshotInv, certificate, deletion,
        selectedSubterm, replaced, later⟩ := descent.deleteCanonical hadmissible
      have snapshotDecode : CarrierDecoder.decode? program actions.tree seedBits
          continuation hadmissible snapshot = some suffix :=
        LocalTransition.Descent.decode_eq program actions.tree seedBits
          continuation hadmissible snapshotDescent
      have prepared : Prepared program actions seedBits continuation hadmissible
          source (bit :: suffix) snapshot := by
        exact .nonempty deletion snapshotInv snapshotDecode
          ⟨deletedCellPredecessor, outerContext, selected, certificate⟩
      exact executePrepared program actions phase seedBits continuation source
        hadmissible prepared

/-- Cost and status can be normalized to their computable indices. -/
theorem executeExact
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (seedBits : List Bool)
    (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (input : List Bool)
    (sourceInv : ReachableAudit.Holds program actions.tree seedBits continuation
      source)
    (sourceDecode : CarrierDecoder.decode? program actions.tree seedBits
      continuation hadmissible source = some input) :
    ∃ result,
      Result program actions phase seedBits continuation hadmissible source input
        result (totalCost program actions phase input)
        (outputStatus (outputData program phase input)) := by
  obtain ⟨result, cost, status, checked⟩ :=
    execute program actions phase seedBits continuation source hadmissible input
      sourceInv sourceDecode
  have costEq := checked.cost_eq
  have statusEq := checked.status_eq
  subst cost
  subst status
  exact ⟨result, checked⟩

/--
Absorbing-empty specialization, at exactly the pre-existing `executeEmpty`
cost and with a marked endpoint.
-/
theorem executeEmpty
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (seedBits : List Bool)
    (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (sourceInv : ReachableAudit.Holds program actions.tree seedBits continuation
      source)
    (sourceDecode : CarrierDecoder.decode? program actions.tree seedBits
      continuation hadmissible source = some []) :
    ∃ result,
      Result program actions phase seedBits continuation hadmissible source []
        result (5 + 2 * (actions.route (phase, false)).length) .marked := by
  obtain ⟨result, checked⟩ :=
    executeExact program actions phase seedBits continuation source hadmissible
      [] sourceInv sourceDecode
  rw [totalCost_empty] at checked
  exact ⟨result, checked⟩

/--
Nonempty specialization: one deletion plus the exact response cost, followed
by precisely the zero-or-one Boolean marker contribution.
-/
theorem executeNonempty
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (bit : Bool) (suffix seedBits : List Bool)
    (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (sourceInv : ReachableAudit.Holds program actions.tree seedBits continuation
      source)
    (sourceDecode : CarrierDecoder.decode? program actions.tree seedBits
      continuation hadmissible source = some (bit :: suffix)) :
    ∃ result,
      Result program actions phase seedBits continuation hadmissible source
        (bit :: suffix) result
        ((1 + LocalResponse.completedCost program
          (actions.route (phase, bit)) (phase, bit)) +
          markerCost
            ((CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data))
        (outputStatus
          ((CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data)) := by
  obtain ⟨result, checked⟩ :=
    executeExact program actions phase seedBits continuation source hadmissible
      (bit :: suffix) sourceInv sourceDecode
  simpa only [totalCost_cons, outputData_cons] using ⟨result, checked⟩

end CheckedTransition

end PureSFormal.PureS
