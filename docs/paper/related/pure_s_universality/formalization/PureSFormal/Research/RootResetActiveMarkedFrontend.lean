import PureSFormal.Research.RootResetNestedFrameCost
import PureSFormal.Research.RootResetDecodedCarrierNonemptyAgreement
import PureSFormal.Research.RootResetPendingAdmissionFrameBridge

/-!
The actual finite active-context frontend. FRAME lookahead occurs at the root
and after every Local RL entry; the pending-R segment reuses that lookahead.
This preserves the scoped FRAME return boundary. Live response, CLOCK and
fallback selection are subsequent endpoint phases.
-/
namespace PureSFormal.Research.RootResetActiveMarkedFrontend
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

abbrev markedClassifier (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetMixedLocalFragment.classifier .marked program tree

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | marked (pc : RootResetPatternFragment.PC (markedClassifier program tree))
  | enterRight | enterLeft
  | frame (pc : RootResetNestedFrameProbe.Control)
  | segment (pc : Segment.Control program tree)
  | done (ready : Bool)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.done false, .done true, .enterRight, .enterLeft] ++
    (RootResetPatternFragment.machine (markedClassifier program tree)).states.map .marked ++
    RootResetNestedFrameProbe.machine.states.map .frame ++
    (Segment.machine program tree).states.map .segment

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (state : Control program tree) :
    state ∈ cover program tree := by
  simp only [cover, List.mem_append]
  cases state with
  | done ready =>
      apply Or.inl; apply Or.inl; apply Or.inl
      cases ready <;> simp only [List.mem_cons, List.mem_singleton, or_true, true_or]
  | enterRight => exact Or.inl (Or.inl (Or.inl (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _)))))
  | enterLeft => exact Or.inl (Or.inl (Or.inl (List.Mem.tail _ (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))))))
  | marked pc => exact Or.inl (Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _
      ((RootResetPatternFragment.machine (markedClassifier program tree)).covers pc))))
  | frame pc => exact Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ (RootResetNestedFrameProbe.machine.covers pc)))
  | segment pc => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ ((Segment.machine program tree).covers pc))

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .marked pc => match pc.val with
    | .answer true => .stay .enterRight
    | .answer false => .stay (.frame (.descending
        ⟨RootResetEdgeSpine.whole RootResetNestedFramePatterns.pendingRows, ProbeCompiler.Control.self_mem_nodes _⟩))
    | _ => mapCommand .marked ((RootResetPatternFragment.machine (markedClassifier program tree)).transition pc node incoming)
  | .enterRight => .exec .R .enterLeft
  | .enterLeft => .exec .L (.segment (.done .completedLocal))
  | .frame (.done true) => .stay (.done true)
  | .frame (.done false) => .stay (.segment (.pending (.probing
      ⟨RootResetEdgeFragment.familyCode (RootResetPendingAdmissionPatterns.rows program tree), ProbeCompiler.Control.self_mem_nodes _⟩)))
  | .frame pc => mapCommand .frame (RootResetNestedFrameProbe.machine.transition pc node incoming)
  | .segment (.done .stopped) => .stay (.done false)
  | .segment (.done .completedLocal) => .stay (.marked
      ⟨markedClassifier program tree, ProbeCompiler.Control.self_mem_nodes _⟩)
  | .segment pc => mapCommand .segment ((Segment.machine program tree).transition pc node incoming)
  | .done ready => .stay (.done ready)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩
def frameInitial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration .frame (RootResetNestedFrameProbe.initial origin)

def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration .marked (RootResetPatternFragment.initial (markedClassifier program tree) origin)
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
    ∃ used, used ≤ ticks ∧ run (machine program tree) (used + 1) (frameInitial program tree origin) =
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

def coreCoefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  Segment.coefficient program tree + RootResetNestedFrameCost.coefficient + RootResetNestedFrameProbe.coefficient + 2

inductive Phase where | ready | stopped | completedLocal

def phaseConfiguration (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (phase : Phase) (endpoint : Cursor) : Configuration (Control program tree) :=
  match phase with
  | .ready => ⟨some (.done true), endpoint⟩
  | .stopped => ⟨some (.done false), endpoint⟩
  | .completedLocal => ⟨some (.segment (.done .completedLocal)), endpoint⟩

def CorePaid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (ticks : Nat) (phase : Phase) (endpoint : Cursor) : Prop :=
  ticks + (match phase with | .completedLocal => 1 + coreCoefficient program tree * endpoint.focus.size | _ => 0) ≤
    coreCoefficient program tree * origin.focus.size

inductive Outcome (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Phase → Cursor → Prop where
  | ready {endpoint : Cursor} (redex : endpoint.rdx?.isSome = true) : Outcome program tree origin .ready endpoint
  | stopped {endpoint : Cursor} (peels : Segment.Peels program tree origin .stopped endpoint) : Outcome program tree origin .stopped endpoint
  | completedLocal {endpoint : Cursor} (peels : Segment.Peels program tree origin .completedLocal endpoint) :
      Outcome program tree origin .completedLocal endpoint
  | marked (view : CheckpointDecoder.LocalView program)
      (parsed : CheckpointDecoder.parseLocal? program tree origin.focus = some view)
      (status : view.status = .marked) (left audit : Term)
      (shape : origin.focus = .app left (.app view.continuation audit)) :
      Outcome program tree origin .completedLocal ⟨view.continuation, .left audit :: .right left :: origin.parents⟩

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
    frame + segment + handoffs ≤ coreCoefficient program tree * source.size := by
  have constant : handoffs ≤ 2 * source.size := Nat.le_trans handoffBound
    (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left 2 (Term.size_pos source))
  have frameEnlarged := Nat.le_trans frameBound (Nat.le_add_right _ (RootResetNestedFrameCost.coefficient * source.size))
  have total := Nat.add_le_add (Nat.add_le_add frameEnlarged segmentBound) constant
  simpa only [coreCoefficient, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total

theorem continued_paid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (frameTicks segmentTicks : Nat)
    (framePaid : frameTicks + RootResetNestedFrameCost.coefficient * endpoint.focus.size ≤
      RootResetNestedFrameCost.coefficient * origin.focus.size)
    (segmentPaid : RootResetPendingAdmissionInterleaved.Paid program tree origin segmentTicks .completedLocal endpoint)
    (gap : endpoint.focus.size + 1 ≤ origin.focus.size) :
    CorePaid program tree origin (frameTicks + 1 + segmentTicks) .completedLocal endpoint := by
  let extra := RootResetNestedFrameProbe.coefficient + 2
  have extraBound : 1 + extra * endpoint.focus.size ≤ extra * origin.focus.size := by
    calc
      _ ≤ extra + extra * endpoint.focus.size := Nat.add_le_add_right (Nat.succ_le_succ (Nat.zero_le _)) _
      _ = extra * (endpoint.focus.size + 1) := by rw [Nat.mul_succ, Nat.add_comm]
      _ ≤ extra * origin.focus.size := Nat.mul_le_mul_left _ gap
  have total := Nat.add_le_add (Nat.add_le_add segmentPaid framePaid) extraBound
  simpa only [CorePaid, RootResetPendingAdmissionInterleaved.Paid, RootResetPendingAdmissionInterleaved.Entry.entered,
    ↓reduceIte, coreCoefficient, extra, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total

theorem core_one_phase (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetNestedFramePatterns.rightParent? origin = false) :
    ∃ ticks phase endpoint, CorePaid program tree origin ticks phase endpoint ∧
      run (machine program tree) ticks (frameInitial program tree origin) = phaseConfiguration program tree phase endpoint ∧
      Outcome program tree origin phase endpoint := by
  obtain ⟨frameTicks, ready, endpoint, frameBound, frameRun, frameFacts⟩ := RootResetNestedFrameProbe.all_input origin boundary
  obtain ⟨frameUsed, frameUsedBound, frameActual⟩ := frame_runs program tree origin endpoint frameTicks ready frameRun
  cases ready with
  | true =>
      refine ⟨frameUsed + 1, .ready, endpoint, ?_, frameActual, .ready frameFacts⟩
      simpa only [CorePaid, Nat.add_zero] using stop_bound program tree origin.focus frameUsed 0 1 (by decide)
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
            simpa only [CorePaid, Nat.add_zero, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
              stop_bound program tree origin.focus frameUsed segmentUsed 2 (Nat.le_refl _)
                (Nat.le_trans frameUsedBound frameBound) segmentBound
          · have firstTwo : run (machine program tree) (frameUsed + 1 + segmentUsed) (frameInitial program tree origin) =
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

theorem marked_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetPatternFragment.PC (markedClassifier program tree)))
    (running : anyAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration Control.marked configuration) =
      liftConfiguration Control.marked (step (RootResetPatternFragment.machine (markedClassifier program tree)) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨pc, member⟩
  cases pc with
  | answer bit => cases running
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem marked_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ used, used ≤ RootResetMixedLocalFragment.classifyBound .marked program tree ∧
      run (machine program tree) (used + 1) (initial program tree origin) =
        if RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus then
          ⟨some .enterRight, origin⟩ else frameInitial program tree origin := by
  obtain ⟨member, execution⟩ := RootResetMixedLocalFragment.classifier_runs .marked program tree origin
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary
    (RootResetPatternFragment.machine (markedClassifier program tree)) (machine program tree) Control.marked
    anyAnswer? (RootResetMixedLocalFragment.classify_absorbs _) (marked_step program tree)
    _ (RootResetPatternFragment.initial (markedClassifier program tree) origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, Nat.le_trans bounded (RootResetCompletedLocalFragment.familyTicks_bound _ _), ?_⟩
  rw [initial, run_add, lifted]
  have finish (bit : Bool) (member : ProbeCompiler.Control.answer bit ∈ ProbeCompiler.Control.nodes (markedClassifier program tree)) :
      run (machine program tree) 1 (liftConfiguration Control.marked ⟨some ⟨.answer bit, member⟩, origin⟩) =
        if bit then ⟨some .enterRight, origin⟩ else frameInitial program tree origin := by
    cases bit <;> rfl
  exact finish _ member

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  coreCoefficient program tree + (RootResetMixedLocalFragment.classifyBound .marked program tree + 4)

def Paid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (ticks : Nat) (phase : Phase) (endpoint : Cursor) : Prop :=
  ticks + (match phase with | .completedLocal => 1 + coefficient program tree * endpoint.focus.size | _ => 0) ≤
    coefficient program tree * origin.focus.size

theorem Outcome.gap {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor} {phase : Phase} (outcome : Outcome program tree origin phase endpoint)
    (continued : phase = .completedLocal) : endpoint.focus.size < origin.focus.size := by
  cases outcome with
  | ready redex => cases continued
  | stopped peels => cases continued
  | completedLocal peels => exact RootResetPendingAdmissionFrameBridge.completedLocal_gap peels
  | marked view parsed status left audit shape => exact RootResetMixedLocalAmortized.continuation_gap parsed

theorem guard_paid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (guardTicks coreTicks : Nat) (phase : Phase)
    (guardBound : guardTicks ≤ RootResetMixedLocalFragment.classifyBound .marked program tree)
    (corePaid : CorePaid program tree origin coreTicks phase endpoint)
    (gap : phase = .completedLocal → endpoint.focus.size < origin.focus.size) :
    Paid program tree origin (guardTicks + 1 + coreTicks) phase endpoint := by
  let extra := RootResetMixedLocalFragment.classifyBound .marked program tree + 4
  have guardConstant : guardTicks + 1 ≤ extra := Nat.le_trans (Nat.add_le_add_right guardBound 1) (Nat.le_add_right _ 3)
  cases phase with
  | ready | stopped =>
      have scaled : guardTicks + 1 ≤ extra * origin.focus.size := Nat.le_trans guardConstant
        (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left extra (Term.size_pos origin.focus))
      have total := Nat.add_le_add corePaid scaled
      simpa only [CorePaid, Paid, Nat.add_zero, coefficient, extra, Nat.add_mul,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
  | completedLocal =>
      have extraPaid : guardTicks + 1 + extra * endpoint.focus.size ≤ extra * origin.focus.size := by
        apply Nat.le_trans (Nat.add_le_add_right guardConstant _)
        rw [Nat.add_comm extra, ← Nat.mul_succ]
        exact Nat.mul_le_mul_left _ (gap rfl)
      have total := Nat.add_le_add corePaid extraPaid
      simpa only [CorePaid, Paid, coefficient, extra, Nat.add_mul,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total

theorem one_phase (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetNestedFramePatterns.rightParent? origin = false) :
    ∃ ticks phase endpoint, Paid program tree origin ticks phase endpoint ∧
      run (machine program tree) ticks (initial program tree origin) = phaseConfiguration program tree phase endpoint ∧
      Outcome program tree origin phase endpoint := by
  obtain ⟨guardTicks, guardBound, guardRun⟩ := marked_runs program tree origin
  cases marked : RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus with
  | false =>
      rw [marked] at guardRun
      obtain ⟨ticks, phase, endpoint, paid, execution, outcome⟩ := core_one_phase program tree origin boundary
      refine ⟨guardTicks + 1 + ticks, phase, endpoint, guard_paid program tree origin endpoint guardTicks ticks phase guardBound paid outcome.gap, ?_, outcome⟩
      rw [run_add, guardRun]
      exact execution
  | true =>
      rw [marked] at guardRun
      obtain ⟨view, status, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program tree origin.focus).mp marked
      obtain ⟨left, audit, shape⟩ := RootResetMixedLocalFragment.parsed_shape parsed
      let endpoint : Cursor := ⟨view.continuation, .left audit :: .right left :: origin.parents⟩
      refine ⟨guardTicks + 1 + 2, .completedLocal, endpoint, ?_, ?_, .marked view parsed status left audit shape⟩
      · have constant : guardTicks + 1 + 2 + 1 ≤ coefficient program tree := by
          exact Nat.le_trans (by simpa only [Nat.add_assoc] using Nat.add_le_add_right guardBound 4) (Nat.le_add_left _ _)
        change guardTicks + 1 + 2 + (1 + coefficient program tree * endpoint.focus.size) ≤ _
        rw [← Nat.add_assoc]
        apply Nat.le_trans (Nat.add_le_add_right constant _)
        rw [Nat.add_comm (coefficient program tree), ← Nat.mul_succ]
        exact Nat.mul_le_mul_left _ (RootResetMixedLocalAmortized.continuation_gap parsed)
      · rw [run_add, guardRun]
        rcases origin with ⟨source, parents⟩
        change source = _ at shape
        subst source
        rfl

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
  | marked {origin endpoint : Cursor} {ready : Bool} (view : CheckpointDecoder.LocalView program)
      (parsed : CheckpointDecoder.parseLocal? program tree origin.focus = some view)
      (status : view.status = .marked) (left audit : Term)
      (shape : origin.focus = .app left (.app view.continuation audit))
      (rest : Trace program tree ⟨view.continuation, .left audit :: .right left :: origin.parents⟩ ready endpoint) :
      Trace program tree origin ready endpoint

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
      | marked view parsed status left audit shape =>
          let endpoint : Cursor := ⟨view.continuation, .left audit :: .right left :: origin.parents⟩
          have smaller : endpoint.focus.size < origin.focus.size := RootResetMixedLocalAmortized.continuation_gap parsed
          have smallerIndex : endpoint.focus.size < size := by rw [← sizeEq]; exact smaller
          obtain ⟨restTicks, ready, after, restBound, restRun, restTrace, facts⟩ := ih _ smallerIndex endpoint rfl rfl
          refine ⟨used + 1 + restTicks, ready, after, ?_, ?_, .marked view parsed status left audit shape restTrace, facts⟩
          · apply Nat.le_trans (Nat.add_le_add_left restBound (used + 1))
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
      | enterRight | enterLeft => rfl
      | marked pc =>
          rcases pc with ⟨code, member⟩
          have safe : ProbeCompiler.Control.NoRdx (markedClassifier program tree) :=
            RootResetCompletedLocalFragment.family_readOnly _ _ _ True.intro True.intro
          have zero := RootResetPatternFragment.mutationCount_zero _ safe ⟨some ⟨code, member⟩, cursor⟩
          rw [← commandCount_eq_mutationCount] at zero
          cases code with
          | answer bit => cases bit <;> rfl
          | observeNode onS onApp =>
              simp only [machine, transition, commandCount_map]
              exact zero
          | observeIncoming onRoot onLeft onRight =>
              simp only [machine, transition, commandCount_map]
              exact zero
          | move operation next =>
              simp only [machine, transition, commandCount_map]
              exact zero
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

end PureSFormal.Research.RootResetActiveMarkedFrontend
