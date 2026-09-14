import PureSFormal.Research.RootResetFrameFirstSelectorProof
import PureSFormal.Research.RootResetFrameSecondSelectorProof

/-!
# A finite walker for two FRAME intermediates beneath pending wrappers

The thirteen controls below inspect only node kind and move one tree edge at
a time. They cross any number of head-arity-three wrappers and contract the
saturated head redex of the first head-arity-four or head-arity-five term.
The wrapper count and all term fields occur only in the proof, never in the
controller. Each wrapper costs seven moves; the two FRAME endpoints cost
eight or nine microsteps, including exactly one contraction.

This is a phase component. Its input family is explicit: pending wrappers
around one of the two FRAME intermediates. A complete root-reset selector
must establish this phase before using the component; in particular, a
head-arity-three term can also be a FRAME redex that must be contracted.
-/

namespace PureSFormal.Research.RootResetFrameSpineWalker

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open PureSFormal.PureS.SchedulerResponseInvariant

inductive Control where
  | down0 | down1 | down2 | down3 | down4 | down5
  | pending2 | pending1 | pendingRoot
  | redex2 | redex1 | contract | halt
  deriving DecidableEq, Repr

def states : List Control :=
  [.down0, .down1, .down2, .down3, .down4, .down5,
    .pending2, .pending1, .pendingRoot, .redex2, .redex1, .contract, .halt]

theorem mem_states (state : Control) : state ∈ states := by
  cases state <;> decide

def transition : Control → Probe.NodeKind → Probe.Incoming → Command Control
  | .down0, .app, _ => .exec .L .down1
  | .down1, .app, _ => .exec .L .down2
  | .down2, .app, _ => .exec .L .down3
  | .down3, .s, _ => .exec .U .pending2
  | .down3, .app, _ => .exec .L .down4
  | .down4, .s, _ => .exec .U .redex2
  | .down4, .app, _ => .exec .L .down5
  | .down5, .s, _ => .exec .U .redex2
  | .pending2, _, _ => .exec .U .pending1
  | .pending1, _, _ => .exec .U .pendingRoot
  | .pendingRoot, _, _ => .exec .R .down0
  | .redex2, _, _ => .exec .U .redex1
  | .redex1, _, _ => .exec .U .contract
  | .contract, _, _ => .exec .Rdx .halt
  | .halt, _, _ => .stay .halt
  | _, _, _ => .reject

def machine : Machine Control := ⟨fun _ => states, mem_states, transition⟩

theorem states_length : machine.states.length = 13 := rfl

def initial (term : Term) : Configuration Control :=
  ⟨some .down0, Cursor.atRoot term⟩

/-- The two opaque fields of one head-arity-three pending wrapper. -/
abbrev Layer := Term × Term

def wrap : List Layer → Term → Term
  | [], body => body
  | (field, continuation) :: layers, body =>
      frame (.app .s field) continuation (wrap layers body)

def spineParents : List Layer → List ParentFrame → List ParentFrame
  | [], parents => parents
  | (field, continuation) :: layers, parents =>
      spineParents layers
        (.right (.app (.app .s field) continuation) :: parents)

theorem rebuild_spineParents (layers : List Layer) (body : Term)
    (parents : List ParentFrame) :
    Cursor.rebuild (spineParents layers parents) body =
      Cursor.rebuild parents (wrap layers body) := by
  induction layers generalizing parents with
  | nil => rfl
  | cons layer layers ih =>
      rcases layer with ⟨field, continuation⟩
      rw [spineParents, ih]
      rfl

theorem run_pending (field continuation body : Term)
    (parents : List ParentFrame) :
    run machine 7
        ⟨some .down0, ⟨frame (.app .s field) continuation body, parents⟩⟩ =
      ⟨some .down0,
        ⟨body, .right (.app (.app .s field) continuation) :: parents⟩⟩ := rfl

theorem runMutationCount_pending (field continuation body : Term)
    (parents : List ParentFrame) :
    runMutationCount machine 7
      ⟨some .down0, ⟨frame (.app .s field) continuation body, parents⟩⟩ = 0 := rfl

theorem run_spine (layers : List Layer) (body : Term)
    (parents : List ParentFrame) :
    run machine (7 * layers.length)
        ⟨some .down0, ⟨wrap layers body, parents⟩⟩ =
      ⟨some .down0, ⟨body, spineParents layers parents⟩⟩ := by
  induction layers generalizing parents with
  | nil => rfl
  | cons layer layers ih =>
      rcases layer with ⟨field, continuation⟩
      rw [List.length_cons, Nat.mul_succ, Nat.add_comm (7 * layers.length) 7,
        run_add, wrap, run_pending]
      exact ih _

theorem runMutationCount_spine (layers : List Layer) (body : Term)
    (parents : List ParentFrame) :
    runMutationCount machine (7 * layers.length)
      ⟨some .down0, ⟨wrap layers body, parents⟩⟩ = 0 := by
  induction layers generalizing parents with
  | nil => rfl
  | cons layer layers ih =>
      rcases layer with ⟨field, continuation⟩
      rw [List.length_cons, Nat.mul_succ, Nat.add_comm (7 * layers.length) 7,
        runMutationCount_add, wrap, runMutationCount_pending, run_pending,
        Nat.zero_add]
      exact ih _

def firstTarget (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) : Cursor :=
  ⟨.app (.app (actCode actions) carrier) (.app (seedCode bits) carrier),
    .left (.app continuation carrier) :: parents⟩

def secondTarget (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) : Cursor :=
  ⟨.app (.app haltCode carrier) (.app actions carrier),
    .left (.app (seedCode bits) carrier) ::
      .left (.app continuation carrier) :: parents⟩

theorem run_first (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    run machine 8
        ⟨some .down0, ⟨frameFirstRoot actions bits continuation carrier, parents⟩⟩ =
      ⟨some .halt, firstTarget actions bits continuation carrier parents⟩ := rfl

theorem run_second (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    run machine 9
        ⟨some .down0, ⟨frameSecondRoot actions bits continuation carrier, parents⟩⟩ =
      ⟨some .halt, secondTarget actions bits continuation carrier parents⟩ := rfl

theorem runMutationCount_first (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    runMutationCount machine 8
      ⟨some .down0, ⟨frameFirstRoot actions bits continuation carrier, parents⟩⟩ = 1 := by
  simp only [runMutationCount, mutationCount, step, machine, transition,
    frameFirstRoot, dispatcherCode, Probe.observeNode, Primitive.exec,
    Cursor.left?, Cursor.up?, ParentFrame.fill, Cursor.rdx?, Term.contractRoot?,
    Nat.zero_add, Nat.add_zero]

theorem runMutationCount_second (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    runMutationCount machine 9
      ⟨some .down0, ⟨frameSecondRoot actions bits continuation carrier, parents⟩⟩ = 1 := by
  simp only [runMutationCount, mutationCount, step, machine, transition,
    frameSecondRoot, actCode, Probe.observeNode, Primitive.exec,
    Cursor.left?, Cursor.up?, ParentFrame.fill, Cursor.rdx?, Term.contractRoot?,
    Nat.zero_add, Nat.add_zero]

/-- Exact rooted invocation, uniform in the number and fields of the wrappers. -/
theorem run_wrapped_first (layers : List Layer) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    run machine (7 * layers.length + 8)
        (initial (wrap layers (frameFirstRoot actions bits continuation carrier))) =
      ⟨some .halt,
        firstTarget actions bits continuation carrier (spineParents layers [])⟩ := by
  rw [initial, Cursor.atRoot, run_add, run_spine, run_first]

theorem run_wrapped_second (layers : List Layer) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    run machine (7 * layers.length + 9)
        (initial (wrap layers (frameSecondRoot actions bits continuation carrier))) =
      ⟨some .halt,
        secondTarget actions bits continuation carrier (spineParents layers [])⟩ := by
  rw [initial, Cursor.atRoot, run_add, run_spine, run_second]

theorem mutationCount_wrapped_first (layers : List Layer) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    runMutationCount machine (7 * layers.length + 8)
      (initial (wrap layers (frameFirstRoot actions bits continuation carrier))) = 1 := by
  rw [initial, Cursor.atRoot, runMutationCount_add, runMutationCount_spine,
    run_spine, runMutationCount_first, Nat.zero_add]

theorem mutationCount_wrapped_second (layers : List Layer) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    runMutationCount machine (7 * layers.length + 9)
      (initial (wrap layers (frameSecondRoot actions bits continuation carrier))) = 1 := by
  rw [initial, Cursor.atRoot, runMutationCount_add, runMutationCount_spine,
    run_spine, runMutationCount_second, Nat.zero_add]

theorem erase_wrapped_first (layers : List Layer) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    (run machine (7 * layers.length + 8)
      (initial (wrap layers (frameFirstRoot actions bits continuation carrier)))).cursor.erase =
      wrap layers (frameSecondRoot actions bits continuation carrier) := by
  rw [run_wrapped_first]
  change Cursor.rebuild (spineParents layers [])
    (frameSecondRoot actions bits continuation carrier) = _
  exact rebuild_spineParents layers _ []

theorem erase_wrapped_second (layers : List Layer) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    (run machine (7 * layers.length + 9)
      (initial (wrap layers (frameSecondRoot actions bits continuation carrier)))).cursor.erase =
      wrap layers (freshLocal actions bits continuation carrier) := by
  rw [run_wrapped_second]
  change Cursor.rebuild (spineParents layers [])
    (freshLocal actions bits continuation carrier) = _
  exact rebuild_spineParents layers _ []

theorem first_agrees_selector (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bits : List Bool)
    (continuation carrier : Term) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier) =
      some (run machine 8
        (initial (frameFirstRoot (compileActions program dispatcher.tree)
          bits continuation carrier))).cursor.erase := by
  rw [RootResetFrameFirstSelectorProof.selectStep?_frameFirstRoot_structured]
  exact congrArg some (erase_wrapped_first [] _ bits continuation carrier).symm

theorem second_agrees_selector (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bits : List Bool)
    (continuation carrier : Term) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (frameSecondRoot (compileActions program dispatcher.tree) bits continuation carrier) =
      some (run machine 9
        (initial (frameSecondRoot (compileActions program dispatcher.tree)
          bits continuation carrier))).cursor.erase := by
  rw [RootResetFrameSecondSelectorProof.selectStep?_frameSecondRoot]
  exact congrArg some (erase_wrapped_second [] _ bits continuation carrier).symm

/-- The literal zipper family produced by primitive fuel expansion. -/
theorem spineParents_replicate (count : Nat) (field continuation : Term)
    (parents : List ParentFrame) :
    spineParents (List.replicate count (field, continuation)) parents =
      PrimitiveFuel.pendingParents (.app .s field) continuation count parents := by
  induction count generalizing parents with
  | zero => rfl
  | succ count ih =>
      rw [List.replicate_succ, spineParents, PrimitiveFuel.pendingParents]
      exact ih _

theorem rebuild_pending_eq_wrap (count : Nat) (field continuation body : Term) :
    Cursor.rebuild
        (PrimitiveFuel.pendingParents (.app .s field) continuation count []) body =
      wrap (List.replicate count (field, continuation)) body := by
  rw [← spineParents_replicate, rebuild_spineParents]
  rfl

/-- The walker handles the literal pending-parent family in scheduler traces. -/
theorem erase_pending_first (count : Nat) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    let parents := PrimitiveFuel.pendingParents
      (environmentCode actions bits) continuation count []
    (run machine (7 * count + 8)
      (initial (Cursor.rebuild parents
        (frameFirstRoot actions bits continuation carrier)))).cursor.erase =
      Cursor.rebuild parents (frameSecondRoot actions bits continuation carrier) := by
  dsimp only [environmentCode]
  change (run machine (7 * count + 8)
    (initial (Cursor.rebuild
      (PrimitiveFuel.pendingParents (.app .s (dispatcherCode actions bits))
        continuation count [])
      (frameFirstRoot actions bits continuation carrier)))).cursor.erase = _
  rw [rebuild_pending_eq_wrap, rebuild_pending_eq_wrap]
  simpa only [List.length_replicate] using
    erase_wrapped_first (List.replicate count
      (dispatcherCode actions bits, continuation)) actions bits continuation carrier

theorem erase_pending_second (count : Nat) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    let parents := PrimitiveFuel.pendingParents
      (environmentCode actions bits) continuation count []
    (run machine (7 * count + 9)
      (initial (Cursor.rebuild parents
        (frameSecondRoot actions bits continuation carrier)))).cursor.erase =
      Cursor.rebuild parents (freshLocal actions bits continuation carrier) := by
  dsimp only [environmentCode]
  change (run machine (7 * count + 9)
    (initial (Cursor.rebuild
      (PrimitiveFuel.pendingParents (.app .s (dispatcherCode actions bits))
        continuation count [])
      (frameSecondRoot actions bits continuation carrier)))).cursor.erase = _
  rw [rebuild_pending_eq_wrap, rebuild_pending_eq_wrap]
  simpa only [List.length_replicate] using
    erase_wrapped_second (List.replicate count
      (dispatcherCode actions bits, continuation)) actions bits continuation carrier

/-- A saturated FRAME root is outside this phase: blindly crossing it rejects. -/
theorem frame_root_requires_other_phase (field continuation : Term) :
    (run machine 8
      (initial (frame (.app .s field) continuation .s))).control = none ∧
    runMutationCount machine 8
      (initial (frame (.app .s field) continuation .s)) = 0 ∧
    (frame (.app .s field) continuation .s).contractRoot? =
      some (Term.contractum field continuation .s) := by
  constructor
  · rfl
  constructor
  · change runMutationCount machine (7 + 1)
      ⟨some .down0, ⟨frame (.app .s field) continuation .s, []⟩⟩ = 0
    rw [runMutationCount_add, runMutationCount_pending, run_pending]
    rfl
  · rfl

end PureSFormal.Research.RootResetFrameSpineWalker
