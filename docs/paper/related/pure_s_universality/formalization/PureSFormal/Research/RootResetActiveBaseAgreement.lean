import PureSFormal.Research.RootResetActivePendingAgreement
import PureSFormal.Research.RootResetPendingAdmissionCarrierRejection
import PureSFormal.Research.RootResetBaseQueueAgreement
import PureSFormal.Research.RootResetPendingBaseProbe

/-! Exact frontend forwarding to a generated Base or its immediately enclosing
pending wrapper. The Base child remains outside active-child admission. -/
namespace PureSFormal.Research.RootResetActiveBaseAgreement
open PureSFormal.PureS
open FiniteController
open RootResetActiveMarkedFrontend RootResetActiveCleanParentsAgreement RootResetActivePendingAgreement

theorem frame_wrap_append (first second : List RootResetFrameSpineWalker.Layer) (body : Term) :
    RootResetFrameSpineWalker.wrap (first ++ second) body =
      RootResetFrameSpineWalker.wrap first (RootResetFrameSpineWalker.wrap second body) := by
  induction first with
  | nil => rfl
  | cons layer first ih =>
      change frame (.app .s layer.1) layer.2 (RootResetFrameSpineWalker.wrap (first ++ second) body) = _
      rw [ih]
      rfl

theorem base_noLocal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation queue beta : Term) :
    CheckpointDecoder.parseLocal? program tree (MutableBase.base (compileActions program tree) bits continuation queue beta) = none := by
  cases parsed : CheckpointDecoder.parseLocal? program tree (MutableBase.base (compileActions program tree) bits continuation queue beta) with
  | none => rfl
  | some view =>
      have refused := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed)
      rw [CheckpointDecoder.parseBase?_mutableBase] at refused
      cases refused

theorem frame_misses_base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (horizon remaining : Nat) (bits : List Bool) (queue beta : Term)
    (layers : List RootResetFrameSpineWalker.Layer) (parents : List ParentFrame)
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨RootResetFrameSpineWalker.wrap layers
      (MutableBase.base (compileActions program tree) bits (Dovetail.clockExit horizon remaining
        (environmentCode (compileActions program tree) bits)) queue beta), parents⟩ = false) :
    ∃ ticks, run RootResetNestedFrameProbe.machine ticks (RootResetNestedFrameProbe.initial
      ⟨RootResetFrameSpineWalker.wrap layers (MutableBase.base (compileActions program tree) bits
        (Dovetail.clockExit horizon remaining (environmentCode (compileActions program tree) bits)) queue beta), parents⟩) =
      ⟨some (.done false), ⟨RootResetFrameSpineWalker.wrap layers (MutableBase.base (compileActions program tree) bits
        (Dovetail.clockExit horizon remaining (environmentCode (compileActions program tree) bits)) queue beta), parents⟩⟩ := by
  obtain ⟨ticks, _, actual⟩ := RootResetNestedFrameCost.missed_count layers
    (MutableBase.base (compileActions program tree) bits (Dovetail.clockExit horizon remaining
      (environmentCode (compileActions program tree) bits)) queue beta) parents
    (by cases remaining <;> rfl) (RootResetFrameCarrierGuard.frameHeadGuard_generatedBase ..) boundary
  exact ⟨ticks, actual⟩

theorem pending_misses_base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (horizon remaining : Nat) (bits : List Bool) (queue beta : Term) (parents : List ParentFrame) :
    ∃ ticks, run (RootResetPendingAdmissionFragment.machine program tree) ticks
      (RootResetPendingAdmissionFragment.initial program tree ⟨MutableBase.base (compileActions program tree) bits
        (Dovetail.clockExit horizon remaining (environmentCode (compileActions program tree) bits)) queue beta, parents⟩) =
      ⟨some (.done false), ⟨MutableBase.base (compileActions program tree) bits
        (Dovetail.clockExit horizon remaining (environmentCode (compileActions program tree) bits)) queue beta, parents⟩⟩ := by
  obtain ⟨ticks, entered, after, _, actual, outcome⟩ := RootResetPendingAdmissionFragment.bounded_input program tree
    ⟨MutableBase.base (compileActions program tree) bits
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program tree) bits)) queue beta, parents⟩
  cases outcome with
  | stopped refused => exact ⟨ticks, actual⟩
  | entered payload next child shape admitted =>
      have arity := congrArg Term.headArity shape
      cases remaining with
      | zero => change 6 = 3 at arity; cases arity
      | succ remaining => change 5 = 3 at arity; cases arity

theorem base_stops (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (horizon remaining : Nat) (bits : List Bool) (queue beta : Term) (parents : List ParentFrame)
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨MutableBase.base (compileActions program tree) bits
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program tree) bits)) queue beta, parents⟩ = false) :
    ∃ ticks, run (machine program tree) ticks (initial program tree ⟨MutableBase.base (compileActions program tree) bits
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program tree) bits)) queue beta, parents⟩) =
      ⟨some (.done false), ⟨MutableBase.base (compileActions program tree) bits
        (Dovetail.clockExit horizon remaining (environmentCode (compileActions program tree) bits)) queue beta, parents⟩⟩ := by
  have noLocal := base_noLocal program tree bits (Dovetail.clockExit horizon remaining (environmentCode (compileActions program tree) bits)) queue beta
  obtain ⟨p, pr⟩ := pending_misses_base program tree horizon remaining bits queue beta parents
  obtain ⟨l, lr⟩ := local_stops_of_noLocal program tree ⟨_, parents⟩ noLocal
  obtain ⟨s, sr⟩ := segment_stops program tree _ p l pr lr
  obtain ⟨f, fr⟩ := frame_misses_base program tree horizon remaining bits queue beta [] parents boundary
  exact forwarded program tree _ _ f s (notMarked_of_noLocal noLocal) fr .stopped (by intro h; cases h) sr

theorem pending_base_stops (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (horizon remaining : Nat) (bits : List Bool) (queue beta payload next : Term)
    (layers : List Layer) (parents : List ParentFrame)
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨wrap (compileActions program tree) layers
      (frame (CheckpointDecoder.openEnvironment (compileActions program tree) payload) next
        (MutableBase.base (compileActions program tree) bits (Dovetail.clockExit horizon remaining
          (environmentCode (compileActions program tree) bits)) queue beta)), parents⟩ = false) :
    ∃ ticks, run (machine program tree) ticks (initial program tree ⟨wrap (compileActions program tree) layers
      (frame (CheckpointDecoder.openEnvironment (compileActions program tree) payload) next
        (MutableBase.base (compileActions program tree) bits (Dovetail.clockExit horizon remaining
          (environmentCode (compileActions program tree) bits)) queue beta)), parents⟩) =
      ⟨some (.done false), ⟨frame (CheckpointDecoder.openEnvironment (compileActions program tree) payload) next
        (MutableBase.base (compileActions program tree) bits (Dovetail.clockExit horizon remaining
          (environmentCode (compileActions program tree) bits)) queue beta), parentsAfter (compileActions program tree) layers parents⟩⟩ := by
  let body := MutableBase.base (compileActions program tree) bits (Dovetail.clockExit horizon remaining
    (environmentCode (compileActions program tree) bits)) queue beta
  let pending := frame (CheckpointDecoder.openEnvironment (compileActions program tree) payload) next body
  have noLocal : CheckpointDecoder.parseLocal? program tree pending = none :=
    CheckpointDecoder.parseLocal?_none_of_headArity program tree pending (by change 3 ≠ 5; decide) (by change 3 ≠ 6; decide)
  obtain ⟨p, _, pr⟩ := RootResetPendingAdmissionFragment.refused_child_runs program tree payload next body
    (parentsAfter (compileActions program tree) layers parents)
    (RootResetPendingAdmissionCarrierRejection.childAdmitted_base_false program tree horizon remaining bits queue beta)
  obtain ⟨l, lr⟩ := local_stops_of_noLocal program tree ⟨pending, parentsAfter (compileActions program tree) layers parents⟩ noLocal
  obtain ⟨s, sr⟩ := segment_stops program tree _ p l pr lr
  obtain ⟨allTicks, allRun⟩ := segment_layers_terminal program tree layers pending parents
    (RootResetPendingAdmissionPatterns.childAdmitted_pending program tree payload next body) s .stopped _ sr
  have noMarked : RootResetCompletedLocalPatterns.accepts .marked program tree (wrap (compileActions program tree) layers pending) = false := by
    apply notMarked_of_noLocal
    exact wrapped_noLocal _ noLocal
  let finalLayer : RootResetFrameSpineWalker.Layer :=
    (.app (.app .s (actCode (compileActions program tree))) (.app .s payload), next)
  have wholeEq : RootResetFrameSpineWalker.wrap (frameLayers (compileActions program tree) layers ++ [finalLayer]) body =
      wrap (compileActions program tree) layers pending := frame_wrap_append _ _ body
  obtain ⟨f, fr⟩ := frame_misses_base program tree horizon remaining bits queue beta
    (frameLayers (compileActions program tree) layers ++ [finalLayer]) parents (by rw [wholeEq]; exact boundary)
  rw [wholeEq] at fr
  exact forwarded program tree _ _ f allTicks noMarked fr .stopped (by intro h; cases h) allRun

theorem cleanParents_pending_base_stops {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (horizon remaining : Nat) (bits : List Bool) (queue beta payload next : Term) (layers : List Layer) :
    ∃ ticks, ticks ≤ coefficient program layout.tree * (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
      (frame (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next
        (MutableBase.base (compileActions program layout.tree) bits (Dovetail.clockExit horizon remaining
          (environmentCode (compileActions program layout.tree) bits)) queue beta)))).size ∧
      run (machine program layout.tree) ticks (initial program layout.tree (Cursor.atRoot (Cursor.rebuild parents
        (wrap (compileActions program layout.tree) layers (frame (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next
          (MutableBase.base (compileActions program layout.tree) bits (Dovetail.clockExit horizon remaining
            (environmentCode (compileActions program layout.tree) bits)) queue beta)))))) =
        ⟨some (.done false), ⟨frame (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next
          (MutableBase.base (compileActions program layout.tree) bits (Dovetail.clockExit horizon remaining
            (environmentCode (compileActions program layout.tree) bits)) queue beta), parentsAfter (compileActions program layout.tree) layers parents⟩⟩ := by
  obtain ⟨ticks, actual⟩ := pending_base_stops program layout.tree horizon remaining bits queue beta payload next layers parents
    (parents_boundary outer _)
  exact cleanParents_terminal outer _ ticks false _ actual

end PureSFormal.Research.RootResetActiveBaseAgreement
