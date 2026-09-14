import PureSFormal.Research.RootResetNestedFrameCost
import PureSFormal.Research.RootResetPendingAdmissionFrameBridge

/-!
The actual finite active-context frontend. FRAME lookahead occurs at the root
and after every Local RL entry; the pending-R segment reuses that lookahead.
This preserves the scoped FRAME return boundary. Live response, CLOCK and
fallback selection are subsequent endpoint phases.
-/
namespace PureSFormal.Research.RootResetActiveFrameFrontend
open PureSFormal.PureS
open FiniteController RootResetCarrierNonemptyProbe

namespace Segment
abbrev Entry := RootResetPendingAdmissionInterleaved.Entry
abbrev Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetPendingAdmissionInterleaved.Control program tree
abbrev machine := RootResetPendingAdmissionSegment.machine
abbrev initial := RootResetPendingAdmissionSegment.initial
abbrev Peels := RootResetPendingAdmissionSegment.Peels
abbrev coefficient := RootResetPendingAdmissionInterleaved.coefficient
end Segment

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | frame (pc : RootResetNestedFrameProbe.Control)
  | segment (pc : Segment.Control program tree)
  | done (ready : Bool)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.done false, .done true] ++ RootResetNestedFrameProbe.machine.states.map .frame ++
    (Segment.machine program tree).states.map .segment

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (state : Control program tree) :
    state ∈ cover program tree := by
  simp only [cover, List.mem_append]
  cases state with
  | done ready =>
      apply Or.inl; apply Or.inl
      cases ready <;> simp only [List.mem_cons, List.mem_singleton, or_true, true_or]
  | frame pc => exact Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ (RootResetNestedFrameProbe.machine.covers pc)))
  | segment pc => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ ((Segment.machine program tree).covers pc))

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .frame (.done true) => .stay (.done true)
  | .frame (.done false) => .stay (.segment (.pending (.probing
      ⟨RootResetEdgeFragment.familyCode (RootResetPendingAdmissionPatterns.rows program tree), ProbeCompiler.Control.self_mem_nodes _⟩)))
  | .frame pc => mapCommand .frame (RootResetNestedFrameProbe.machine.transition pc node incoming)
  | .segment (.done .stopped) => .stay (.done false)
  | .segment (.done .completedLocal) => .stay (.frame (.descending
      ⟨RootResetEdgeSpine.whole RootResetNestedFramePatterns.pendingRows, ProbeCompiler.Control.self_mem_nodes _⟩))
  | .segment pc => mapCommand .segment ((Segment.machine program tree).transition pc node incoming)
  | .done ready => .stay (.done ready)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩
def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration .frame (RootResetNestedFrameProbe.initial origin)
def segment (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration .segment (Segment.initial program tree origin)

def frameDone? (configuration : Configuration RootResetNestedFrameProbe.Control) : Bool :=
  match configuration.control with | some (.done _) => true | _ => false
def segmentDone? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (configuration : Configuration (Segment.Control program tree)) : Bool :=
  match configuration.control with
  | some (.done .stopped) | some (.done .completedLocal) => true
  | _ => false

theorem frame_absorbs (configuration : Configuration RootResetNestedFrameProbe.Control)
    (ended : frameDone? configuration = true) (ticks : Nat) :
    run RootResetNestedFrameProbe.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done ready => exact RootResetNestedFrameProbe.done_absorbs ready cursor ticks
    | descending _ | reading _ | ascending _ => cases ended

theorem segment_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Segment.Control program tree)) (ended : segmentDone? configuration = true) (ticks : Nat) :
    run (Segment.machine program tree) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | pending _ | completedLocal _ => cases ended
    | done entry => cases entry with
      | pending => cases ended
      | stopped => exact RootResetPendingAdmissionSegment.yield_absorbs program tree .stopped (by intro h; cases h) cursor ticks
      | completedLocal => exact RootResetPendingAdmissionSegment.yield_absorbs program tree .completedLocal (by intro h; cases h) cursor ticks

theorem frame_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration RootResetNestedFrameProbe.Control) (running : frameDone? configuration = false) :
    step (machine program tree) (liftConfiguration Control.frame configuration) =
      liftConfiguration Control.frame (step RootResetNestedFrameProbe.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done _ => cases running
  | descending _ | reading _ | ascending _ => rfl

theorem segment_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Segment.Control program tree)) (running : segmentDone? configuration = false) :
    step (machine program tree) (liftConfiguration Control.segment configuration) =
      liftConfiguration Control.segment (step (Segment.machine program tree) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | pending _ | completedLocal _ => rfl
  | done entry => cases entry with
    | pending => rfl
    | stopped | completedLocal => cases running

theorem frame_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (ticks : Nat) (ready : Bool)
    (execution : run RootResetNestedFrameProbe.machine ticks (RootResetNestedFrameProbe.initial origin) = ⟨some (.done ready), endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) (used + 1) (initial program tree origin) =
      if ready then ⟨some (.done true), endpoint⟩ else segment program tree endpoint := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary RootResetNestedFrameProbe.machine (machine program tree) Control.frame frameDone?
    frame_absorbs (frame_step program tree) ticks (RootResetNestedFrameProbe.initial origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run (machine program tree) (used + 1) (liftConfiguration Control.frame (RootResetNestedFrameProbe.initial origin)) = _
  rw [run_add, lifted]
  cases ready <;> rfl

theorem segment_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (ticks : Nat) (entry : Segment.Entry) (yielded : entry ≠ .pending)
    (execution : run (Segment.machine program tree) ticks (Segment.initial program tree origin) = ⟨some (.done entry), endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) used (segment program tree origin) = ⟨some (.segment (.done entry)), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (Segment.machine program tree) (machine program tree) Control.segment segmentDone?
    (segment_absorbs program tree) (segment_step program tree) ticks (Segment.initial program tree origin)
    (by rw [execution]; cases entry with | stopped => rfl | completedLocal => rfl | pending => exact False.elim (yielded rfl))
  rw [execution] at lifted
  exact ⟨used, bounded, lifted⟩

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  Segment.coefficient program tree + RootResetNestedFrameCost.coefficient + RootResetNestedFrameProbe.coefficient + 2

inductive Phase where | ready | stopped | completedLocal

def phaseConfiguration (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (phase : Phase) (endpoint : Cursor) : Configuration (Control program tree) :=
  match phase with
  | .ready => ⟨some (.done true), endpoint⟩
  | .stopped => ⟨some (.done false), endpoint⟩
  | .completedLocal => ⟨some (.segment (.done .completedLocal)), endpoint⟩

def Paid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (ticks : Nat) (phase : Phase) (endpoint : Cursor) : Prop :=
  ticks + (match phase with | .completedLocal => 1 + coefficient program tree * endpoint.focus.size | _ => 0) ≤
    coefficient program tree * origin.focus.size

inductive Outcome (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Phase → Cursor → Prop where
  | ready {endpoint : Cursor} (redex : endpoint.rdx?.isSome = true) : Outcome program tree origin .ready endpoint
  | stopped {endpoint : Cursor} (peels : Segment.Peels program tree origin .stopped endpoint) : Outcome program tree origin .stopped endpoint
  | completedLocal {endpoint : Cursor} (peels : Segment.Peels program tree origin .completedLocal endpoint) :
      Outcome program tree origin .completedLocal endpoint

theorem notRight_boundary (origin : Cursor) (boundary : RootResetNestedFramePatterns.rightParent? origin = false) :
    RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false := by
  rcases origin with ⟨focus, parents⟩
  cases parents with
  | nil => rfl
  | cons parent parents => cases parent with
    | left sibling => rfl
    | right sibling => cases boundary

theorem stop_bound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term)
    (frame segment handoffs : Nat) (handoffBound : handoffs ≤ 2)
    (frameBound : frame ≤ RootResetNestedFrameProbe.coefficient * source.size)
    (segmentBound : segment ≤ Segment.coefficient program tree * source.size) :
    frame + segment + handoffs ≤ coefficient program tree * source.size := by
  have constant : handoffs ≤ 2 * source.size := Nat.le_trans handoffBound
    (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left 2 (Term.size_pos source))
  have frameEnlarged := Nat.le_trans frameBound (Nat.le_add_right _ (RootResetNestedFrameCost.coefficient * source.size))
  have total := Nat.add_le_add (Nat.add_le_add frameEnlarged segmentBound) constant
  simpa only [coefficient, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total

theorem continued_paid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (frameTicks segmentTicks : Nat)
    (framePaid : frameTicks + RootResetNestedFrameCost.coefficient * endpoint.focus.size ≤
      RootResetNestedFrameCost.coefficient * origin.focus.size)
    (segmentPaid : RootResetPendingAdmissionInterleaved.Paid program tree origin segmentTicks .completedLocal endpoint)
    (gap : endpoint.focus.size + 1 ≤ origin.focus.size) :
    Paid program tree origin (frameTicks + 1 + segmentTicks) .completedLocal endpoint := by
  let extra := RootResetNestedFrameProbe.coefficient + 2
  have extraBound : 1 + extra * endpoint.focus.size ≤ extra * origin.focus.size := by
    calc
      _ ≤ extra + extra * endpoint.focus.size := Nat.add_le_add_right (Nat.succ_le_succ (Nat.zero_le _)) _
      _ = extra * (endpoint.focus.size + 1) := by rw [Nat.mul_succ, Nat.add_comm]
      _ ≤ extra * origin.focus.size := Nat.mul_le_mul_left _ gap
  have total := Nat.add_le_add (Nat.add_le_add segmentPaid framePaid) extraBound
  simpa only [Paid, RootResetPendingAdmissionInterleaved.Paid, RootResetPendingAdmissionInterleaved.Entry.entered,
    ↓reduceIte, coefficient, extra, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total

theorem one_phase (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetNestedFramePatterns.rightParent? origin = false) :
    ∃ ticks phase endpoint, Paid program tree origin ticks phase endpoint ∧
      run (machine program tree) ticks (initial program tree origin) = phaseConfiguration program tree phase endpoint ∧
      Outcome program tree origin phase endpoint := by
  obtain ⟨frameTicks, ready, endpoint, frameBound, frameRun, frameFacts⟩ := RootResetNestedFrameProbe.all_input origin boundary
  obtain ⟨frameUsed, frameUsedBound, frameActual⟩ := frame_runs program tree origin endpoint frameTicks ready frameRun
  cases ready with
  | true =>
      refine ⟨frameUsed + 1, .ready, endpoint, ?_, frameActual, .ready frameFacts⟩
      simpa only [Paid, Nat.add_zero] using stop_bound program tree origin.focus frameUsed 0 1 (by decide)
        (Nat.le_trans frameUsedBound frameBound) (Nat.zero_le _)
  | false =>
      have equal : endpoint = origin := frameFacts
      subst endpoint
      obtain ⟨segmentTicks, entry, endpoint, segmentPaid, yielded, segmentRun, peels, endBoundary⟩ :=
        RootResetPendingAdmissionSegment.scan_within program tree origin (notRight_boundary origin boundary)
      obtain ⟨segmentUsed, segmentUsedBound, segmentActual⟩ := segment_runs program tree origin endpoint segmentTicks entry yielded segmentRun
      have paidSegment := Nat.le_trans (Nat.add_le_add_right segmentUsedBound _) segmentPaid
      cases entry with
      | pending => exact False.elim (yielded rfl)
      | stopped =>
          refine ⟨frameUsed + 1 + segmentUsed + 1, .stopped, endpoint, ?_, ?_, .stopped peels⟩
          · have segmentBound : segmentUsed ≤ Segment.coefficient program tree * origin.focus.size := by
              simpa only [RootResetPendingAdmissionInterleaved.Paid, RootResetPendingAdmissionInterleaved.Entry.entered,
                Bool.false_eq_true, ↓reduceIte, Nat.add_zero] using paidSegment
            simpa only [Paid, Nat.add_zero, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
              stop_bound program tree origin.focus frameUsed segmentUsed 2 (Nat.le_refl _)
                (Nat.le_trans frameUsedBound frameBound) segmentBound
          · have firstTwo : run (machine program tree) (frameUsed + 1 + segmentUsed) (initial program tree origin) =
                ⟨some (.segment (.done .stopped)), endpoint⟩ := by
              rw [run_add, frameActual]
              exact segmentActual
            rw [run_add, firstTwo]
            rfl
      | completedLocal =>
          obtain ⟨layers, terminal, view, wrapped, parents, parsed, left, audit, shape, endpointEq⟩ :=
            RootResetPendingAdmissionFrameBridge.completedLocal_terminal peels
          have originEq : origin = ⟨RootResetFrameSpineWalker.wrap layers terminal.focus, origin.parents⟩ := by
            rcases origin with ⟨focus, parents⟩
            change focus = _ at wrapped
            rw [wrapped]
          have reference : run RootResetNestedFrameProbe.machine frameTicks
              (RootResetNestedFrameProbe.initial ⟨RootResetFrameSpineWalker.wrap layers terminal.focus, origin.parents⟩) =
              ⟨some (.done false), ⟨RootResetFrameSpineWalker.wrap layers terminal.focus, origin.parents⟩⟩ := by
            rw [← originEq]
            exact frameRun
          have stops := RootResetNestedFrameCost.parsed_local_stops parsed
          have guardMiss := RootResetNestedFrameCost.miss_implies_guard layers terminal.focus origin.parents stops frameTicks reference
          obtain ⟨countTicks, countBound, countRun⟩ := RootResetNestedFrameCost.missed_count layers terminal.focus origin.parents
            stops guardMiss (by rw [← originEq]; exact boundary)
          rw [← originEq] at countRun
          obtain ⟨countUsed, countUsedBound, countActual⟩ := frame_runs program tree origin origin countTicks false countRun
          have counted : countUsed ≤ RootResetNestedFrameCost.coefficient * (layers.length + 1) := Nat.le_trans countUsedBound countBound
          have sizeGap : layers.length + 1 + endpoint.focus.size ≤ origin.focus.size := by
            rw [endpointEq, wrapped]
            exact Nat.le_trans (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
              (Nat.add_le_add_left (RootResetMixedLocalAmortized.continuation_gap parsed) layers.length))
              (RootResetNestedFrameCost.wrapper_size layers terminal.focus)
          have framePaid : countUsed + RootResetNestedFrameCost.coefficient * endpoint.focus.size ≤
              RootResetNestedFrameCost.coefficient * origin.focus.size := by
            apply Nat.le_trans (Nat.add_le_add_right counted _)
            rw [← Nat.mul_add]
            exact Nat.mul_le_mul_left _ sizeGap
          refine ⟨countUsed + 1 + segmentUsed, .completedLocal, endpoint,
            continued_paid program tree origin endpoint countUsed segmentUsed framePaid paidSegment
              (RootResetPendingAdmissionFrameBridge.completedLocal_gap peels), ?_, .completedLocal peels⟩
          rw [run_add, countActual]
          exact segmentActual

theorem done_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (ready : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done ready), origin⟩ = ⟨some (.done ready), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

inductive Trace (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Cursor → Bool → Cursor → Prop where
  | ready (origin endpoint : Cursor) (redex : endpoint.rdx?.isSome = true) : Trace program tree origin true endpoint
  | stopped {origin endpoint : Cursor} (peels : Segment.Peels program tree origin .stopped endpoint) :
      Trace program tree origin false endpoint
  | completedLocal {origin after endpoint : Cursor} {ready : Bool}
      (peels : Segment.Peels program tree origin .completedLocal after)
      (rest : Trace program tree after ready endpoint) : Trace program tree origin ready endpoint

def Within (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Prop :=
  ∃ ticks ready endpoint, ticks ≤ coefficient program tree * origin.focus.size ∧
    run (machine program tree) ticks (initial program tree origin) = ⟨some (.done ready), endpoint⟩ ∧
    Trace program tree origin ready endpoint ∧ (if ready then endpoint.rdx?.isSome = true else True)

theorem scan_within (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetNestedFramePatterns.rightParent? origin = false) : Within program tree origin := by
  have auxiliary : ∀ size, ∀ origin : Cursor, origin.focus.size = size →
      RootResetNestedFramePatterns.rightParent? origin = false → Within program tree origin := by
    intro size
    induction size using Nat.strongRecOn with
    | ind size ih =>
      intro origin sizeEq boundary
      obtain ⟨used, phase, endpoint, paid, execution, outcome⟩ := one_phase program tree origin boundary
      cases outcome with
      | ready redex =>
          exact ⟨used, true, endpoint, by simpa only [Paid, Nat.add_zero] using paid,
            execution, .ready origin endpoint redex, redex⟩
      | stopped peels =>
          exact ⟨used, false, endpoint, by simpa only [Paid, Nat.add_zero] using paid,
            execution, .stopped peels, trivial⟩
      | completedLocal peels =>
          have smaller := RootResetPendingAdmissionFrameBridge.completedLocal_gap peels
          have smallerIndex : endpoint.focus.size < size := by rw [← sizeEq]; exact smaller
          obtain ⟨restTicks, ready, after, restBound, restRun, restTrace, facts⟩ :=
            ih _ smallerIndex endpoint rfl (RootResetPendingAdmissionFrameBridge.completedLocal_boundary peels)
          refine ⟨used + 1 + restTicks, ready, after, ?_, ?_, .completedLocal peels restTrace, facts⟩
          · have enlarged := Nat.add_le_add_left restBound (used + 1)
            apply Nat.le_trans enlarged
            simpa only [Paid, Nat.add_assoc] using paid
          · have firstRun : run (machine program tree) (used + 1) (initial program tree origin) = initial program tree endpoint := by
              rw [run_add, execution]
              rfl
            rw [run_add, firstRun]
            exact restRun
  exact auxiliary origin.focus.size origin rfl boundary

theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) : mutationCount (machine program tree) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done _ => rfl
      | frame pc =>
          have zero := RootResetNestedFrameProbe.mutationCount_zero ⟨some pc, cursor⟩
          cases pc with
          | done ready => cases ready <;> rfl
          | descending _ | reading _ | ascending _ =>
              simp only [machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero
      | segment pc =>
          have zero := RootResetPendingAdmissionSegment.mutationCount_zero program tree ⟨some pc, cursor⟩
          cases pc with
          | done entry => cases entry <;> rfl
          | pending _ | completedLocal _ =>
              simp only [machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero

theorem runMutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (ticks : Nat) (configuration : Configuration (Control program tree)) :
    runMutationCount (machine program tree) ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (ticks : Nat) (configuration : Configuration (Control program tree)) :
    (run (machine program tree) ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN (machine program tree) ticks configuration
  rw [runMutationCount_zero] at projected
  exact (StepsN.eq_of_zero projected).symm

theorem all_input_atRoot (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) :
    ∃ ticks ready endpoint, ticks ≤ coefficient program tree * source.size ∧
      run (machine program tree) ticks (initial program tree (Cursor.atRoot source)) = ⟨some (.done ready), endpoint⟩ ∧
      Trace program tree (Cursor.atRoot source) ready endpoint ∧
      (if ready then endpoint.rdx?.isSome = true else True) ∧ endpoint.erase = source := by
  obtain ⟨ticks, ready, endpoint, bounded, execution, trace, facts⟩ := scan_within program tree (Cursor.atRoot source) rfl
  have erased := erase_run program tree ticks (initial program tree (Cursor.atRoot source))
  rw [execution] at erased
  exact ⟨ticks, ready, endpoint, bounded, execution, trace, facts, erased⟩

end PureSFormal.Research.RootResetActiveFrameFrontend
