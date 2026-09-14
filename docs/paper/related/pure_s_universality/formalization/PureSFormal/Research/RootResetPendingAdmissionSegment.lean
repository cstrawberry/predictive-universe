import PureSFormal.Research.RootResetPendingAdmissionInterleaved

/-! A fixed finite pending-prefix admission segment. Pending R entries repeat;
the first completed Local RL entry or exact miss yields. The proof records every
pending wrapper and retains the linear reserve for a yielded Local continuation.
This is the segment boundary at which a caller may run FRAME lookahead. -/
namespace PureSFormal.Research.RootResetPendingAdmissionSegment
open PureSFormal.PureS
open FiniteController
open RootResetPendingAdmissionInterleaved

abbrev base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetPendingAdmissionInterleaved.machine program tree
abbrev initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetPendingAdmissionInterleaved.initial program tree

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .done .pending => .stay (.pending (.probing
      ⟨RootResetEdgeFragment.familyCode (RootResetPendingAdmissionPatterns.rows program tree),
        ProbeCompiler.Control.self_mem_nodes _⟩))
  | _ => (base program tree).transition state node incoming

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨(base program tree).stateCover, (base program tree).covers, transition program tree⟩

def done? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (configuration : Configuration (Control program tree)) : Bool :=
  match configuration.control with | some (.done _) => true | _ => false

theorem base_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) (ended : done? configuration = true) (ticks : Nat) :
    run (base program tree) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done entry => exact RootResetPendingAdmissionInterleaved.done_absorbs program tree entry cursor ticks
    | pending pc => cases ended
    | completedLocal pc => cases ended

theorem step_before_done (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) (running : done? configuration = false) :
    step (machine program tree) configuration = step (base program tree) configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state => cases state with
    | done entry => cases running
    | pending pc => rfl
    | completedLocal pc => rfl

theorem one_phase (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    ∃ used entry after, Paid program tree origin used entry after ∧
      run (machine program tree) used (initial program tree origin) = ⟨some (.done entry), after⟩ ∧
      Outcome program tree origin entry after ∧
      ∃ referenceTicks, run (base program tree) referenceTicks (initial program tree origin) = ⟨some (.done entry), after⟩ := by
  obtain ⟨ticks, entry, after, paid, execution, outcome⟩ := RootResetPendingAdmissionInterleaved.all_input program tree origin boundary
  obtain ⟨used, bounded, lifted⟩ := RootResetCarrierNonemptyProbe.run_to_boundary (base program tree) (machine program tree) (fun pc => pc)
    done? (base_absorbs program tree) (fun configuration running => by
      rw [RootResetMixedContinuationSpine.lift_id, RootResetMixedContinuationSpine.lift_id]
      exact step_before_done program tree configuration running)
    ticks (initial program tree origin) (by rw [execution]; rfl)
  rw [RootResetMixedContinuationSpine.lift_id, execution, RootResetMixedContinuationSpine.lift_id] at lifted
  exact ⟨used, entry, after, Nat.le_trans (Nat.add_le_add_right bounded _) paid,
    lifted, outcome, ticks, execution⟩

theorem pending_restart (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (after : Cursor) :
    step (machine program tree) ⟨some (.done .pending), after⟩ = initial program tree after := rfl

theorem yield_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (entry : Entry) (yielded : entry ≠ .pending) (after : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done entry), after⟩ = ⟨some (.done entry), after⟩ := by
  cases entry with
  | pending => exact False.elim (yielded rfl)
  | stopped => induction ticks with
    | zero => rfl
    | succ ticks ih => exact ih
  | completedLocal => induction ticks with
    | zero => rfl
    | succ ticks ih => exact ih

inductive Peels (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Cursor → Entry → Cursor → Prop where
  | done (origin : Cursor) (entry : Entry) (after : Cursor) (yielded : entry ≠ .pending)
      (outcome : Outcome program tree origin entry after)
      (reference : ∃ ticks, run (base program tree) ticks (initial program tree origin) = ⟨some (.done entry), after⟩) :
      Peels program tree origin entry after
  | pending (origin : Cursor) (payload continuation child : Term)
      (shape : origin.focus = .app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child)
      (admitted : RootResetPendingAdmissionPatterns.childAdmitted program tree child = true)
      (reference : ∃ ticks, run (base program tree) ticks (initial program tree origin) =
        ⟨some (.done .pending), ⟨child, .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: origin.parents⟩⟩)
      {entry : Entry} {endpoint : Cursor}
      (rest : Peels program tree ⟨child, .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: origin.parents⟩ entry endpoint) :
      Peels program tree origin entry endpoint

def Within (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Prop :=
  ∃ ticks entry endpoint, Paid program tree origin ticks entry endpoint ∧ entry ≠ .pending ∧
    run (machine program tree) ticks (initial program tree origin) = ⟨some (.done entry), endpoint⟩ ∧
    Peels program tree origin entry endpoint ∧
    RootResetCarrierScanParentBoundary.carrierParent? endpoint.parents.head? = false

theorem scan_within (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    Within program tree origin := by
  have auxiliary : ∀ size, ∀ origin : Cursor, origin.focus.size = size →
      RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false → Within program tree origin := by
    intro size
    induction size using Nat.strongRecOn with
    | ind size ih =>
      intro origin sizeEq boundary
      obtain ⟨used, entry, after, paid, execution, outcome, reference⟩ := one_phase program tree origin boundary
      cases outcome with
      | stopped refused =>
          exact ⟨used, .stopped, origin, paid, (by intro equal; cases equal), execution,
            .done origin .stopped origin (by intro equal; cases equal) (.stopped refused) reference, boundary⟩
      | completedLocal refused admitted =>
          exact ⟨used, .completedLocal, after, paid, (by intro equal; cases equal), execution,
            .done origin .completedLocal after (by intro equal; cases equal) (.completedLocal refused admitted) reference,
            outcome_boundary (.completedLocal refused admitted) boundary⟩
      | pending admitted =>
          cases admitted with
          | entered payload continuation child shape admitted =>
            let after : Cursor := ⟨child, .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: origin.parents⟩
            have nextBoundary : RootResetCarrierScanParentBoundary.carrierParent? after.parents.head? = false :=
              RootResetPendingAdmissionPatterns.admitted_parent_boundary _ _ _
            have smaller : after.focus.size < origin.focus.size := outcome_gap
              (.pending (.entered payload continuation child shape admitted)) rfl
            have smallerIndex : after.focus.size < size := by rw [← sizeEq]; exact smaller
            obtain ⟨restTicks, entry, endpoint, restPaid, yielded, restRun, restPeels, finalBoundary⟩ :=
              ih _ smallerIndex after rfl nextBoundary
            refine ⟨used + 1 + restTicks, entry, endpoint, ?_, yielded, ?_,
              .pending origin payload continuation child shape admitted reference restPeels, finalBoundary⟩
            · have combined := Nat.add_le_add_left restPaid (used + 1)
              apply Nat.le_trans (by simpa only [Paid, Nat.add_assoc] using combined)
              simpa only [Paid, Entry.entered, ↓reduceIte, Nat.add_assoc] using paid
            · have firstRun : run (machine program tree) (used + 1) (initial program tree origin) = initial program tree after := by
                rw [run_add, execution]
                exact pending_restart program tree after
              rw [run_add, firstRun]
              exact restRun
  exact auxiliary origin.focus.size origin rfl boundary

theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) : mutationCount (machine program tree) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      have zero := RootResetPendingAdmissionInterleaved.mutationCount_zero program tree ⟨some state, cursor⟩
      cases state with
      | done entry => cases entry <;> rfl
      | pending pc => exact zero
      | completedLocal pc => exact zero

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

end PureSFormal.Research.RootResetPendingAdmissionSegment
