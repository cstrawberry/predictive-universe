import PureSFormal.Research.RootResetFrameSpineWalker
import PureSFormal.Research.RootResetFrameCarrierGuard

/-!
# A finite guarded FRAME-spine probe

The fixed 57-state table follows head-arity-three wrappers and checks the
literal halt-code skeleton before accepting a FRAME1/FRAME2 endpoint. The
arity-four actions field is an independent hole, never a runtime parameter
or an equality-comparison operand. Success leaves a genuine redex focused;
ordinary mismatch restores the whole input root, with no mutation.

Every input completes within `40 * source.size` microinstructions at root.
Each pending wrapper costs seven ticks; accepted FRAME1 and FRAME2 endpoints
cost 31 and 27 ticks. The generated-carrier exclusion hypotheses remain
explicit; this component alone does not establish full simulator dispatch.
-/

namespace PureSFormal.Research.RootResetFrameSpineProbe
open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open PureSFormal.PureS.SchedulerResponseInvariant

inductive Mode where | first | second
  deriving DecidableEq, Repr
inductive Check where
  | root | firstApp | firstS | firstParent | secondS | firstUp | secondBranch
  | secondApp | innerApp | thirdS | innerParent | fourthS | innerUp | lastBranch
  | lastS | secondUp | done
  deriving DecidableEq, Repr
inductive Control where
  | down0 | down1 | down2 | down3 | down4 | down5
  | pending2 | pending1 | pendingRoot
  | leading (mode : Mode) | field (mode : Mode)
  | actLeft | actHead | actBack
  | check (stage : Check) (mode : Mode)
  | extra | return0 | return1 | return2
  | ready | abort | miss
  deriving DecidableEq, Repr

def checkTransition : Check → Mode → Probe.NodeKind → Command Control
  | .root, mode, .app => .exec .L (.check .firstApp mode)
  | .firstApp, mode, .app => .exec .L (.check .firstS mode)
  | .firstS, mode, .s => .exec .U (.check .firstParent mode)
  | .firstParent, mode, _ => .exec .R (.check .secondS mode)
  | .secondS, mode, .s => .exec .U (.check .firstUp mode)
  | .firstUp, mode, _ => .exec .U (.check .secondBranch mode)
  | .secondBranch, mode, _ => .exec .R (.check .secondApp mode)
  | .secondApp, mode, .app => .exec .L (.check .innerApp mode)
  | .innerApp, mode, .app => .exec .L (.check .thirdS mode)
  | .thirdS, mode, .s => .exec .U (.check .innerParent mode)
  | .innerParent, mode, _ => .exec .R (.check .fourthS mode)
  | .fourthS, mode, .s => .exec .U (.check .innerUp mode)
  | .innerUp, mode, _ => .exec .U (.check .lastBranch mode)
  | .lastBranch, mode, _ => .exec .R (.check .lastS mode)
  | .lastS, mode, .s => .exec .U (.check .secondUp mode)
  | .secondUp, mode, _ => .exec .U (.check .done mode)
  | .done, .first, _ => .exec .U .extra
  | .done, .second, _ => .stay .return0
  | _, _, _ => .stay .abort

def transition : Control → Probe.NodeKind → Probe.Incoming → Command Control
  | .down0, .app, _ => .exec .L .down1
  | .down1, .app, _ => .exec .L .down2
  | .down2, .app, _ => .exec .L .down3
  | .down3, .s, _ => .exec .U .pending2
  | .down3, .app, _ => .exec .L .down4
  | .down4, .s, _ => .exec .U (.leading .first)
  | .down4, .app, _ => .exec .L .down5
  | .down5, .s, _ => .exec .U (.leading .second)
  | .pending2, _, _ => .exec .U .pending1
  | .pending1, _, _ => .exec .U .pendingRoot
  | .pendingRoot, _, _ => .exec .R .down0
  | .leading .first, _, _ => .exec .R (.field .first)
  | .leading .second, _, _ => .exec .R (.check .root .second)
  | .field .first, .app, _ => .exec .L .actLeft
  | .actLeft, .app, _ => .exec .L .actHead
  | .actHead, .s, _ => .exec .U .actBack
  | .actBack, _, _ => .exec .R (.check .root .first)
  | .field .second, node, _ => checkTransition .root .second node
  | .check stage mode, node, _ => checkTransition stage mode node
  | .extra, _, _ => .exec .U .return0
  | .return0, _, _ => .exec .U .return1
  | .return1, _, _ => .exec .U .return2
  | .return2, _, _ => .exec .U .ready
  | .ready, _, _ => .stay .ready
  | .abort, _, .root => .stay .miss
  | .abort, _, .left => .exec .U .abort
  | .abort, _, .right => .exec .U .abort
  | .miss, _, _ => .stay .miss
  | _, _, _ => .stay .abort

def checkStates : List Check :=
  [.root, .firstApp, .firstS, .firstParent, .secondS, .firstUp, .secondBranch,
   .secondApp, .innerApp, .thirdS, .innerParent, .fourthS, .innerUp, .lastBranch,
   .lastS, .secondUp, .done]
def states : List Control :=
  [.down0, .down1, .down2, .down3, .down4, .down5,
   .pending2, .pending1, .pendingRoot, .leading .first, .leading .second,
   .field .first, .field .second, .actLeft, .actHead, .actBack,
   .extra, .return0, .return1, .return2, .ready, .abort, .miss] ++
  checkStates.flatMap (fun stage => [.check stage .first, .check stage .second])

theorem mem_states (state : Control) : state ∈ states := by
  cases state with
  | check stage mode => cases stage <;> cases mode <;> decide
  | leading mode => cases mode <;> decide
  | field mode => cases mode <;> decide
  | _ => decide

def machine : Machine Control := ⟨fun _ => states, mem_states, transition⟩
def initial (source : Term) : Configuration Control := ⟨some .down0, Cursor.atRoot source⟩
theorem states_length : machine.states.length = 57 := rfl
set_option maxRecDepth 10000 in
theorem states_nodup : states.Nodup := by decide

theorem run_pending (field continuation body : Term) (parents : List ParentFrame) :
    run machine 7 ⟨some .down0, ⟨frame (.app .s field) continuation body, parents⟩⟩ =
      ⟨some .down0, ⟨body, .right (.app (.app .s field) continuation) :: parents⟩⟩ := rfl

theorem run_abort (cursor : Cursor) :
    run machine (cursor.parents.length + 1) ⟨some .abort, cursor⟩ =
      ⟨some .miss, Cursor.atRoot cursor.erase⟩ := by
  rcases cursor with ⟨focus, parents⟩
  induction parents generalizing focus with
  | nil => rfl
  | cons parent parents ih =>
      cases parent with
      | left sibling =>
          change run machine ((parents.length + 1) + 1)
            ⟨some .abort, ⟨focus, .left sibling :: parents⟩⟩ = _
          rw [run_succ]; exact ih (.app focus sibling)
      | right sibling =>
          change run machine ((parents.length + 1) + 1)
            ⟨some .abort, ⟨focus, .right sibling :: parents⟩⟩ = _
          rw [run_succ]; exact ih (.app sibling focus)

theorem run_first (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    run machine 31 ⟨some .down0, ⟨frameFirstRoot actions bits continuation carrier, parents⟩⟩ =
      ⟨some .ready, ⟨Term.redex (actCode actions) (seedCode bits) carrier,
        .left (.app continuation carrier) :: parents⟩⟩ := by
  simp only [run, step, machine, transition, checkTransition, frameFirstRoot,
    dispatcherCode, actCode, haltCode, haltTag, b, Probe.observeNode,
    Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?, ParentFrame.fill, Term.redex]

theorem run_second (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    run machine 27 ⟨some .down0, ⟨frameSecondRoot actions bits continuation carrier, parents⟩⟩ =
      ⟨some .ready, ⟨Term.redex haltCode actions carrier,
        .left (.app (seedCode bits) carrier) :: .left (.app continuation carrier) :: parents⟩⟩ := by
  simp only [run, step, machine, transition, checkTransition, frameSecondRoot,
    actCode, haltCode, haltTag, b, Probe.observeNode,
    Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?, ParentFrame.fill, Term.redex]


def CheckWithin (mode : Mode) (term : Term) (parents : List ParentFrame) : Prop :=
  ∃ ticks final, ticks ≤ 16 ∧
    run machine ticks ⟨some (.check .root mode), ⟨term, parents⟩⟩ = final ∧
    ((term = haltCode ∧ final = ⟨some (.check .done mode), ⟨term, parents⟩⟩) ∨
      final.control = some .abort) ∧
    final.cursor.parents.length ≤ parents.length + 3

theorem check_mismatch (mode : Mode) (term : Term) (parents : List ParentFrame)
    (ticks depth : Nat) (timeBound : ticks ≤ 16) (depthBound : depth ≤ 3)
    (failed : (run machine ticks ⟨some (.check .root mode), ⟨term, parents⟩⟩).control = some .abort)
    (depthEq : (run machine ticks ⟨some (.check .root mode),
      ⟨term, parents⟩⟩).cursor.parents.length = parents.length + depth) :
    CheckWithin mode term parents := by
  refine ⟨ticks, _, timeBound, rfl, Or.inr failed, ?_⟩
  rw [depthEq]
  exact Nat.add_le_add_left depthBound parents.length

theorem check_within (mode : Mode) (term : Term) (parents : List ParentFrame) :
    CheckWithin mode term parents := by
  cases term with
  | s => exact check_mismatch mode _ parents 1 0 (by decide) (by decide) rfl rfl
  | app left right =>
      cases left with
      | s => exact check_mismatch mode _ parents 2 1 (by decide) (by decide) rfl rfl
      | app first second =>
          cases first with
          | app a b => exact check_mismatch mode _ parents 3 2 (by decide) (by decide) rfl rfl
          | s =>
              cases second with
              | app a b =>
                  apply check_mismatch mode _ parents 5 2 (by decide) (by decide)
                  all_goals simp only [run, step, machine, transition, checkTransition,
                    Probe.observeNode, Primitive.exec, Cursor.left?, Cursor.right?,
                    Cursor.up?, ParentFrame.fill, List.length_cons]
              | s =>
                  cases right with
                  | s =>
                      apply check_mismatch mode _ parents 8 1 (by decide) (by decide)
                      all_goals simp only [run, step, machine, transition, checkTransition,
                        Probe.observeNode, Primitive.exec, Cursor.left?, Cursor.right?,
                        Cursor.up?, ParentFrame.fill, List.length_cons]
                  | app inner last =>
                      cases inner with
                      | s =>
                          apply check_mismatch mode _ parents 9 2 (by decide) (by decide)
                          all_goals simp only [run, step, machine, transition, checkTransition,
                            Probe.observeNode, Primitive.exec, Cursor.left?, Cursor.right?,
                            Cursor.up?, ParentFrame.fill, List.length_cons]
                      | app third fourth =>
                          cases third with
                          | app a b =>
                              apply check_mismatch mode _ parents 10 3 (by decide) (by decide)
                              all_goals simp only [run, step, machine, transition, checkTransition,
                                Probe.observeNode, Primitive.exec, Cursor.left?, Cursor.right?,
                                Cursor.up?, ParentFrame.fill, List.length_cons]
                          | s =>
                              cases fourth with
                              | app a b =>
                                  apply check_mismatch mode _ parents 12 3 (by decide) (by decide)
                                  all_goals simp only [run, step, machine, transition, checkTransition,
                                    Probe.observeNode, Primitive.exec, Cursor.left?, Cursor.right?,
                                    Cursor.up?, ParentFrame.fill, List.length_cons]
                              | s =>
                                  cases last with
                                  | app a b =>
                                      apply check_mismatch mode _ parents 15 2 (by decide) (by decide)
                                      all_goals simp only [run, step, machine, transition, checkTransition,
                                        Probe.observeNode, Primitive.exec, Cursor.left?, Cursor.right?,
                                        Cursor.up?, ParentFrame.fill, List.length_cons]
                                  | s =>
                                      refine ⟨16, ⟨some (.check .done mode), ⟨haltCode, parents⟩⟩,
                                        Nat.le_refl _, ?_, Or.inl ⟨rfl, rfl⟩, Nat.le_add_right _ _⟩
                                      simp only [run, step, machine, transition, checkTransition,
                                        haltCode, haltTag, b, Probe.observeNode, Primitive.exec,
                                        Cursor.left?, Cursor.right?, Cursor.up?, ParentFrame.fill]


theorem mutationCount_zero (configuration : Configuration Control) : mutationCount machine configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      cases state with
      | check stage mode =>
          cases stage <;> cases mode <;> cases nodeEq : Probe.observeNode cursor <;>
            simp only [mutationCount, machine, transition, checkTransition, nodeEq]
      | leading mode => cases mode <;> rfl
      | field mode =>
          cases mode <;> cases nodeEq : Probe.observeNode cursor <;>
            simp only [mutationCount, machine, transition, checkTransition, nodeEq]
      | abort =>
          cases incomingEq : Probe.observeIncoming cursor <;>
            simp only [mutationCount, machine, transition, incomingEq]
      | _ =>
          cases nodeEq : Probe.observeNode cursor <;>
            simp only [mutationCount, machine, transition, nodeEq]

theorem runMutationCount_zero (ticks : Nat) (configuration : Configuration Control) :
    runMutationCount machine ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (ticks : Nat) (configuration : Configuration Control) :
    (run machine ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN machine ticks configuration
  rw [runMutationCount_zero] at projected
  exact (StepsN.eq_of_zero projected).symm

def Answer (origin : Cursor) (final : Configuration Control) : Prop :=
  (final.control = some .ready ∧ ∃ first second third, final.cursor.focus = Term.redex first second third) ∨
  (final.control = some .miss ∧ final.cursor = Cursor.atRoot origin.erase)

def Within (term : Term) (parents : List ParentFrame) : Prop :=
  ∃ ticks final, ticks ≤ 40 * term.size + parents.length ∧
    run machine ticks ⟨some .down0, ⟨term, parents⟩⟩ = final ∧ Answer ⟨term, parents⟩ final

theorem small_budget (term : Term) (ticks : Nat) (bound : ticks ≤ 40) : ticks ≤ 40 * term.size :=
  Nat.le_trans bound (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left 40 (Term.size_pos term))

theorem abort_within (term : Term) (parents : List ParentFrame) (ticks depth : Nat)
    (failed : (run machine ticks ⟨some .down0, ⟨term, parents⟩⟩).control = some .abort)
    (depthLe : (run machine ticks ⟨some .down0,
      ⟨term, parents⟩⟩).cursor.parents.length ≤ parents.length + depth)
    (budget : ticks + depth + 1 ≤ 40 * term.size) : Within term parents := by
  let origin : Configuration Control := ⟨some .down0, ⟨term, parents⟩⟩
  let after := run machine ticks origin
  have afterEq : after = ⟨some .abort, after.cursor⟩ :=
    congrArg (fun control => Configuration.mk control after.cursor) failed
  refine ⟨ticks + (after.cursor.parents.length + 1),
    ⟨some .miss, Cursor.atRoot origin.cursor.erase⟩, ?_, ?_, Or.inr ⟨rfl, rfl⟩⟩
  · apply Nat.le_trans (Nat.add_le_add_left (Nat.add_le_add_right depthLe 1) ticks)
    simpa only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] using
      Nat.add_le_add_right budget parents.length
  · rw [run_add]
    change run machine (after.cursor.parents.length + 1) after = _
    rw [afterEq, run_abort]
    have preserved : after.cursor.erase = origin.cursor.erase := erase_run ticks origin
    rw [preserved]

theorem scan_arity4 (actions second third fourth : Term) (parents : List ParentFrame) :
    run machine 31 ⟨some .down0,
        ⟨.app (Term.redex (actCode actions) second third) fourth, parents⟩⟩ =
      ⟨some .ready, ⟨Term.redex (actCode actions) second third, .left fourth :: parents⟩⟩ := by
  simp only [run, step, machine, transition, checkTransition, actCode, haltCode, haltTag, b,
    Probe.observeNode, Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?, ParentFrame.fill, Term.redex]

theorem scan_arity5 (second third fourth fifth : Term) (parents : List ParentFrame) :
    run machine 27 ⟨some .down0,
        ⟨.app (.app (Term.redex haltCode second third) fourth) fifth, parents⟩⟩ =
      ⟨some .ready, ⟨Term.redex haltCode second third, .left fourth :: .left fifth :: parents⟩⟩ := by
  simp only [run, step, machine, transition, checkTransition, haltCode, haltTag, b,
    Probe.observeNode, Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?, ParentFrame.fill, Term.redex]


theorem enter_arity4 (tag actions second third fourth : Term) (parents : List ParentFrame) :
    run machine 10 ⟨some .down0,
      ⟨.app (Term.redex (.app (.app .s tag) actions) second third) fourth, parents⟩⟩ =
    ⟨some (.check .root .first), ⟨tag, .right .s :: .left actions :: .right .s ::
      .left second :: .left third :: .left fourth :: parents⟩⟩ := by
  simp only [run, step, machine, transition, Probe.observeNode, Primitive.exec,
    Cursor.left?, Cursor.right?, Cursor.up?, ParentFrame.fill, Term.redex]

theorem enter_arity5 (leading second third fourth fifth : Term) (parents : List ParentFrame) :
    run machine 7 ⟨some .down0,
      ⟨.app (.app (Term.redex leading second third) fourth) fifth, parents⟩⟩ =
    ⟨some (.check .root .second), ⟨leading, .right .s :: .left second ::
      .left third :: .left fourth :: .left fifth :: parents⟩⟩ := by
  simp only [run, step, machine, transition, Probe.observeNode, Primitive.exec,
    Cursor.left?, Cursor.right?, Cursor.up?, ParentFrame.fill, Term.redex]

theorem wrapper_budget (size depth ticks : Nat) (bound : ticks ≤ 40 * size + (depth + 1)) :
    7 + ticks ≤ 40 * (size + 1) + depth := by
  apply Nat.le_trans (Nat.add_le_add_left bound 7)
  apply Nat.le.intro (k := 32)
  simp only [Nat.mul_add, Nat.mul_one, Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]
  simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero]
theorem arity4_within (leading second third fourth : Term) (parents : List ParentFrame) :
    Within (.app (Term.redex leading second third) fourth) parents := by
  cases leading with
  | s =>
      apply abort_within _ parents 7 4
      · rfl
      · exact Nat.le_refl _
      · exact small_budget _ _ (by decide)
  | app fn actions =>
      cases fn with
      | s =>
          apply abort_within _ parents 8 5
          · rfl
          · exact Nat.le_refl _
          · exact small_budget _ _ (by decide)
      | app head tag =>
          cases head with
          | app a b =>
              apply abort_within _ parents 9 6
              · rfl
              · exact Nat.le_refl _
              · exact small_budget _ _ (by decide)
          | s =>
              obtain ⟨ticks, final, bound, execution, answer, depthBound⟩ :=
                check_within .first tag
                  (.right .s :: .left actions :: .right .s :: .left second ::
                    .left third :: .left fourth :: parents)
              rcases answer with ⟨equal, finished⟩ | failed
              · subst tag
                refine ⟨31, _, ?_, scan_arity4 actions second third fourth parents,
                  Or.inl ⟨rfl, actCode actions, second, third, rfl⟩⟩
                exact Nat.le_trans (small_budget _ 31 (by decide)) (Nat.le_add_right _ _)
              · apply abort_within _ parents (10 + ticks) 9
                · rw [run_add, enter_arity4, execution]; exact failed
                · rw [run_add, enter_arity4, execution]
                  simpa only [List.length_cons, Nat.add_assoc] using depthBound
                · apply small_budget
                  have limited : 20 + ticks ≤ 36 := Nat.add_le_add_left bound 20
                  apply Nat.le_trans _ (by decide : 36 ≤ 40)
                  simpa only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] using limited

theorem arity5_within (leading second third fourth fifth : Term) (parents : List ParentFrame) :
    Within (.app (.app (Term.redex leading second third) fourth) fifth) parents := by
  obtain ⟨ticks, final, bound, execution, answer, depthBound⟩ :=
    check_within .second leading
      (.right .s :: .left second :: .left third :: .left fourth :: .left fifth :: parents)
  rcases answer with ⟨equal, finished⟩ | failed
  · subst leading
    refine ⟨27, _, ?_, scan_arity5 second third fourth fifth parents,
      Or.inl ⟨rfl, haltCode, second, third, rfl⟩⟩
    exact Nat.le_trans (small_budget _ 27 (by decide)) (Nat.le_add_right _ _)
  · apply abort_within _ parents (7 + ticks) 8
    · rw [run_add, enter_arity5, execution]; exact failed
    · rw [run_add, enter_arity5, execution]
      simpa only [List.length_cons, Nat.add_assoc] using depthBound
    · apply small_budget
      have limited : 16 + ticks ≤ 32 := Nat.add_le_add_left bound 16
      apply Nat.le_trans _ (by decide : 32 ≤ 40)
      simpa only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] using limited

theorem scan_within (term : Term) (parents : List ParentFrame) : Within term parents := by
  induction term generalizing parents with
  | s =>
      apply abort_within _ parents 1 0
      · rfl
      · exact Nat.le_refl _
      · exact small_budget _ _ (by decide)
  | app left arg leftIH argIH =>
      cases left with
      | s =>
          apply abort_within _ parents 2 1
          · rfl
          · exact Nat.le_refl _
          · exact small_budget _ _ (by decide)
      | app fn third =>
          cases fn with
          | s =>
              apply abort_within _ parents 3 2
              · rfl
              · exact Nat.le_refl _
              · exact small_budget _ _ (by decide)
          | app head second =>
              cases head with
              | s =>
                  obtain ⟨ticks, final, bound, execution, answer⟩ :=
                    argIH (.right (.app (.app .s second) third) :: parents)
                  refine ⟨7 + ticks, final, ?_, ?_, answer⟩
                  · apply Nat.le_trans (wrapper_budget arg.size parents.length ticks bound)
                    apply Nat.add_le_add_right
                    apply Nat.mul_le_mul_left
                    apply Nat.le.intro (k := second.size + third.size + 3)
                    simp only [Term.size, Nat.succ_eq_add_one,
                      Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]
                    simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero]
                  · change run machine (7 + ticks)
                      ⟨some .down0, ⟨frame (.app .s second) third arg, parents⟩⟩ = _
                    rw [run_add, run_pending, execution]
              | app deeper first =>
                  cases deeper with
                  | s => exact arity4_within first second third arg parents
                  | app finalHead zeroth =>
                      cases finalHead with
                      | s => exact arity5_within zeroth first second third arg parents
                      | app a b =>
                          apply abort_within _ parents 6 5
                          · rfl
                          · exact Nat.le_refl _
                          · exact small_budget _ _ (by decide)


def Terminal (configuration : Configuration Control) : Prop :=
  configuration.control = some .ready ∨ configuration.control = some .miss

theorem Answer.terminal {origin : Cursor} {configuration : Configuration Control}
    (answer : Answer origin configuration) : Terminal configuration := by
  rcases answer with h | h
  · exact Or.inl h.1
  · exact Or.inr h.1

theorem run_terminal (ticks : Nat) (configuration : Configuration Control)
    (terminal : Terminal configuration) : run machine ticks configuration = configuration := by
  rcases configuration with ⟨control, cursor⟩
  rcases terminal with h | h <;> change control = _ at h <;> subst control <;>
    induction ticks with
    | zero => rfl
    | succ ticks ih => exact ih

theorem probe_within (source : Term) :
    ∃ ticks final, ticks ≤ 40 * source.size ∧ run machine ticks (initial source) = final ∧
      Answer (Cursor.atRoot source) final := by
  simpa only [Within, initial, Cursor.atRoot, List.length_nil, Nat.add_zero] using scan_within source []

theorem terminal_answer (source : Term) (ticks : Nat)
    (terminal : Terminal (run machine ticks (initial source))) :
    Answer (Cursor.atRoot source) (run machine ticks (initial source)) := by
  obtain ⟨doneTicks, final, _, execution, answer⟩ := probe_within source
  have commute := congrArg (fun count => run machine count (initial source))
    (Nat.add_comm ticks doneTicks)
  rw [run_add, run_terminal doneTicks _ terminal, run_add, execution,
    run_terminal ticks final answer.terminal] at commute
  rw [commute]; exact answer

theorem failure_restores (source : Term) (ticks : Nat)
    (missed : (run machine ticks (initial source)).control = some .miss) :
    (run machine ticks (initial source)).cursor = Cursor.atRoot source := by
  rcases terminal_answer source ticks (Or.inr missed) with ⟨accepted, _⟩ | ⟨_, restored⟩
  · rw [missed] at accepted; cases Option.some.inj accepted
  · exact restored

theorem success_contracts (source : Term) (ticks : Nat)
    (accepted : (run machine ticks (initial source)).control = some .ready) :
    ∃ target, source.contractAt? (RootResetSelectorContract.cursorAddress
      (run machine ticks (initial source)).cursor) = some target := by
  rcases terminal_answer source ticks (Or.inl accepted) with ⟨_, first, second, third, focusEq⟩ |
      ⟨missed, _⟩
  · have preserved : (run machine ticks (initial source)).cursor.erase = source :=
      erase_run ticks (initial source)
    have contracts := RootResetSelectorContract.contractAt?_cursorAddress
      (run machine ticks (initial source)).cursor
    rw [focusEq, Term.contractRoot?_redex, preserved] at contracts
    exact ⟨_, contracts⟩
  · rw [accepted] at missed; cases Option.some.inj missed

theorem run_spine (layers : List RootResetFrameSpineWalker.Layer) (body : Term)
    (parents : List ParentFrame) :
    run machine (7 * layers.length)
      ⟨some .down0, ⟨RootResetFrameSpineWalker.wrap layers body, parents⟩⟩ =
      ⟨some .down0, ⟨body, RootResetFrameSpineWalker.spineParents layers parents⟩⟩ := by
  induction layers generalizing parents with
  | nil => rfl
  | cons layer layers ih =>
      rcases layer with ⟨field, continuation⟩
      rw [List.length_cons, Nat.mul_succ, Nat.add_comm (7 * layers.length) 7,
        run_add, RootResetFrameSpineWalker.wrap, run_pending]
      exact ih _

theorem run_wrapped_first (layers : List RootResetFrameSpineWalker.Layer) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    run machine (7 * layers.length + 31)
      (initial (RootResetFrameSpineWalker.wrap layers (frameFirstRoot actions bits continuation carrier))) =
      ⟨some .ready, ⟨Term.redex (actCode actions) (seedCode bits) carrier,
        .left (.app continuation carrier) :: RootResetFrameSpineWalker.spineParents layers []⟩⟩ := by
  rw [initial, Cursor.atRoot, run_add, run_spine, run_first]

theorem run_wrapped_second (layers : List RootResetFrameSpineWalker.Layer) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    run machine (7 * layers.length + 27)
      (initial (RootResetFrameSpineWalker.wrap layers (frameSecondRoot actions bits continuation carrier))) =
      ⟨some .ready, ⟨Term.redex haltCode actions carrier,
        .left (.app (seedCode bits) carrier) :: .left (.app continuation carrier) ::
          RootResetFrameSpineWalker.spineParents layers []⟩⟩ := by
  rw [initial, Cursor.atRoot, run_add, run_spine, run_second]

theorem abort_complete (origin : Configuration Control) (ticks : Nat)
    (failed : (run machine ticks origin).control = some .abort) :
    ∃ total, run machine total origin = ⟨some .miss, Cursor.atRoot origin.cursor.erase⟩ := by
  let after := run machine ticks origin
  have afterEq : after = ⟨some .abort, after.cursor⟩ :=
    congrArg (fun control => Configuration.mk control after.cursor) failed
  refine ⟨ticks + (after.cursor.parents.length + 1), ?_⟩
  rw [run_add]
  change run machine (after.cursor.parents.length + 1) after = _
  rw [afterEq, run_abort]
  have preserved : after.cursor.erase = origin.cursor.erase := erase_run ticks origin
  rw [preserved]

theorem arity5_misses (leading second third fourth fifth : Term) (parents : List ParentFrame)
    (notCode : leading ≠ haltCode) :
    ∃ ticks, run machine ticks ⟨some .down0,
        ⟨.app (.app (Term.redex leading second third) fourth) fifth, parents⟩⟩ =
      ⟨some .miss, Cursor.atRoot
        (Cursor.rebuild parents (.app (.app (Term.redex leading second third) fourth) fifth))⟩ := by
  obtain ⟨ticks, final, _, execution, answer, _⟩ :=
    check_within .second leading
      (.right .s :: .left second :: .left third :: .left fourth :: .left fifth :: parents)
  rcases answer with ⟨equal, _⟩ | failed
  · exact False.elim (notCode equal)
  · apply abort_complete _ (7 + ticks)
    rw [run_add, enter_arity5, execution]; exact failed

theorem arity6_misses (first second third fourth fifth sixth : Term) (parents : List ParentFrame) :
    ∃ ticks, run machine ticks ⟨some .down0,
        ⟨.app (.app (.app (Term.redex first second third) fourth) fifth) sixth, parents⟩⟩ =
      ⟨some .miss, Cursor.atRoot
        (Cursor.rebuild parents (.app (.app (.app (Term.redex first second third) fourth) fifth) sixth))⟩ := by
  apply abort_complete _ 6
  rfl

end PureSFormal.Research.RootResetFrameSpineProbe
