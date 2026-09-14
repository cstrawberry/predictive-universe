import PureSFormal.PureS.FiniteControllerBound
import PureSFormal.Research.RootResetProgressWalker

/-!
# Arbitrary-depth completeness for the progress-spine walker

This module proves recursive completeness for
`RootResetProgressWalker`.  It concerns only the progress-spine fragment:
Armed, Open, and Closed cells over an inert Closed history ending at `S`.

For every `FirstMutation source target`, a fresh invocation at the bare-term
root reaches its first focused contraction after an exact, structurally
defined number of microticks and returns `target`.  The execution contains
exactly one contraction.  The exact cost is at most sixteen times the number
of registered cells on the canonical path.  A wholly inert spine is scanned
without mutation in exactly one plus sixteen ticks per Closed cell.

This is not an all-stage root-reset universality theorem.  Clock, fuel,
frame, route, action, close/commit relocation, and continuation handoff are
outside this component.
-/

namespace PureSFormal.Research.RootResetProgressCompleteness

set_option maxHeartbeats 1000000

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open RootResetProgressRoles
open RootResetProgressWalker

/-- A finite run which changes neither the bare term nor the mutation count. -/
structure SilentRun (ticks : Nat) (before after : Configuration Control) : Prop
    where
  exact : run machine ticks before = after
  silent : runMutationCount machine ticks before = 0

namespace SilentRun

/-- Silent prefixes compose exactly. -/
theorem trans {firstTicks secondTicks : Nat}
    {before middle after : Configuration Control}
    (first : SilentRun firstTicks before middle)
    (second : SilentRun secondTicks middle after) :
    SilentRun (firstTicks + secondTicks) before after := by
  constructor
  · rw [run_add, first.exact, second.exact]
  · rw [runMutationCount_add, first.silent, first.exact, second.silent]

/-- A silent prefix can be prepended to an exact first-mutation run. -/
theorem thenFirstMutation {prefixTicks mutationTicks : Nat}
    {before middle after : Configuration Control}
    (prefixRun : SilentRun prefixTicks before middle)
    (mutation : FirstMutationRun machine mutationTicks middle after) :
    FirstMutationRun machine (prefixTicks + mutationTicks) before after := by
  induction prefixTicks generalizing before with
  | zero =>
      have beforeEq : before = middle := by
        simpa [run] using prefixRun.exact
      subst before
      simpa using mutation
  | succ prefixTicks ih =>
      have countAndTail :
          mutationCount machine before = 0 ∧
            runMutationCount machine prefixTicks (step machine before) = 0 := by
        simpa [runMutationCount, Nat.add_eq_zero_iff] using prefixRun.silent
      have tailExact :
          run machine prefixTicks (step machine before) = middle := by
        simpa [run] using prefixRun.exact
      let tail : SilentRun prefixTicks (step machine before) middle :=
        ⟨tailExact, countAndTail.2⟩
      have remainder := ih tail
      simpa [Nat.succ_add, Nat.add_assoc] using
        FirstMutationRun.later countAndTail.1 remainder

end SilentRun

namespace FirstMutationRun

/-- An exact first-mutation prefix contains exactly one mutation in total. -/
theorem runMutationCount_eq_one
    {ticks : Nat} {before after : Configuration Control}
    (first : FirstMutationRun machine ticks before after) :
    runMutationCount machine ticks before = 1 := by
  induction first with
  | here count => exact count
  | later count tail ih =>
      simp only [runMutationCount, count, Nat.zero_add]
      exact ih

end FirstMutationRun

/-! ## Registered-cell counts -/

/-- Structural certificate for the number of registered progress cells on a
canonical predecessor path.  The count is tied to the bare source term, not
an unconstrained runtime witness. -/
inductive RegisteredCells : Term -> Nat -> Prop where
  | endpoint : RegisteredCells .s 0
  | armed {predecessor : Term} {cells : Nat} (bit : Bool)
      (inner : RegisteredCells predecessor cells) :
      RegisteredCells (RootResetProgressRoles.Gadget.source bit predecessor)
        (cells + 1)
  | opened {predecessor : Term} {cells : Nat} (bit : Bool) (audit : Term)
      (inner : RegisteredCells predecessor cells) :
      RegisteredCells (openCell bit predecessor audit) (cells + 1)
  | closed {predecessor : Term} {cells : Nat} (bit : Bool)
      (leftAudit rightAudit : Term)
      (inner : RegisteredCells predecessor cells) :
      RegisteredCells (closedCell bit predecessor leftAudit rightAudit)
        (cells + 1)

/-! Small arithmetic identities used to expose human-readable exact costs. -/

private theorem inertTickEq (cells : Nat) :
    4 + ((1 + 16 * cells) + 12) = 1 + 16 * (cells + 1) := by
  simp [Nat.mul_add, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [← Nat.add_assoc, show 4 + 12 = 16 by decide]

private theorem armedTickEq (cells : Nat) :
    (5 + ((1 + 16 * cells) + 5)) + 1 = 12 + 16 * cells := by
  simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [← Nat.add_assoc 5 5 (16 * cells),
    ← Nat.add_assoc 1 (5 + 5) (16 * cells),
    ← Nat.add_assoc 1 (1 + (5 + 5)) (16 * cells)]

private theorem openTickEq (cells : Nat) :
    (4 + ((1 + 16 * cells) + 10)) + 1 = 16 + 16 * cells := by
  simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [← Nat.add_assoc 4 10 (16 * cells),
    ← Nat.add_assoc 1 (4 + 10) (16 * cells),
    ← Nat.add_assoc 1 (1 + (4 + 10)) (16 * cells)]

private theorem armedTickBound (cells : Nat) :
    12 + 16 * cells ≤ 16 * (cells + 1) := by
  rw [Nat.mul_add, Nat.mul_one]
  simpa [Nat.add_comm] using
    (Nat.add_le_add_right (show 12 ≤ 16 by decide) (16 * cells))

private theorem openTickBound (cells : Nat) :
    16 + 16 * cells ≤ 16 * (cells + 1) := by
  rw [Nat.mul_add, Nat.mul_one, Nat.add_comm]
  exact Nat.le_refl _

/-! ## Fixed local traces -/

/-- Five silent ticks enter the registered predecessor of an Armed cell. -/
theorem downArmed (bit : Bool) (predecessor : Term)
    (parents : List ParentFrame) :
    SilentRun 5
      ⟨some .down, ⟨RootResetProgressRoles.Gadget.source bit predecessor,
        parents⟩⟩
      ⟨some .down,
        ⟨predecessor,
          .right (RootResetProgressRoles.Gadget.progressLive bit) :: parents⟩⟩ := by
  cases bit <;> exact ⟨rfl, rfl⟩

/-- Four silent ticks enter the registered predecessor of an arity-two cell. -/
theorem downOther (predecessor right : Term)
    (parents : List ParentFrame) :
    SilentRun 4
      ⟨some .down, ⟨.app (.app .s predecessor) right, parents⟩⟩
      ⟨some .down,
        ⟨predecessor, .right .s :: .left right :: parents⟩⟩ :=
  ⟨rfl, rfl⟩

private theorem ascendClosedFirstFour (bit : Bool)
    (predecessor leftAudit rightAudit : Term)
    (frame : ParentFrame) (parents : List ParentFrame) :
    let right : Term := .app (.app .s leftAudit)
      (.app (valueTag bit) rightAudit)
    SilentRun 4
      ⟨some .afterUp,
        ⟨.app .s predecessor, .left right :: frame :: parents⟩⟩
      ⟨some .otherL,
        ⟨.app .s predecessor, .left right :: frame :: parents⟩⟩ := by
  cases bit <;> exact ⟨rfl, rfl⟩

private theorem ascendClosedMiddleFour (bit : Bool)
    (predecessor leftAudit rightAudit : Term)
    (frame : ParentFrame) (parents : List ParentFrame) :
    let tagArgument : Term := .app (valueTag bit) rightAudit
    let right : Term := .app (.app .s leftAudit) tagArgument
    SilentRun 4
      ⟨some .otherL,
        ⟨.app .s predecessor, .left right :: frame :: parents⟩⟩
      ⟨some .rightLL,
        ⟨.s, .left leftAudit :: .left tagArgument ::
          .right (.app .s predecessor) :: frame :: parents⟩⟩ := by
  cases bit <;> exact ⟨rfl, rfl⟩

private theorem ascendClosedLastFour (bit : Bool)
    (predecessor leftAudit rightAudit : Term)
    (frame : ParentFrame) (parents : List ParentFrame) :
    let tagArgument : Term := .app (valueTag bit) rightAudit
    SilentRun 4
      ⟨some .rightLL,
        ⟨.s, .left leftAudit :: .left tagArgument ::
          .right (.app .s predecessor) :: frame :: parents⟩⟩
      ⟨some .afterUp,
        ⟨frame.fill (closedCell bit predecessor leftAudit rightAudit),
          parents⟩⟩ := by
  cases bit <;> cases frame <;> exact ⟨rfl, rfl⟩

/-- Twelve silent ticks classify one Closed cell and ascend through it. -/
theorem ascendClosed (bit : Bool) (predecessor leftAudit rightAudit : Term)
    (frame : ParentFrame) (parents : List ParentFrame) :
    SilentRun 12
      ⟨some .afterUp,
        ⟨.app .s predecessor,
          .left (.app (.app .s leftAudit) (.app (valueTag bit) rightAudit)) ::
            frame :: parents⟩⟩
      ⟨some .afterUp,
        ⟨frame.fill (closedCell bit predecessor leftAudit rightAudit),
          parents⟩⟩ := by
  have first := ascendClosedFirstFour bit predecessor leftAudit rightAudit
    frame parents
  have middle := ascendClosedMiddleFour bit predecessor leftAudit rightAudit
    frame parents
  have last := ascendClosedLastFour bit predecessor leftAudit rightAudit
    frame parents
  simpa using first.trans (middle.trans last)

/-- At a selected cell boundary, the cell root is either the whole root or
the registered right child of its immediate predecessor context. -/
inductive Boundary : List ParentFrame → Prop where
  | root : Boundary []
  | right (leftSibling : Term) (parents : List ParentFrame) :
      Boundary (.right leftSibling :: parents)

/-- Five silent ticks put an Armed cell's root under the final `Rdx`. -/
theorem prepareArmedMutation (bit : Bool) (predecessor : Term)
    (parents : List ParentFrame) (boundary : Boundary parents) :
    SilentRun 5
      ⟨some .afterUp,
        ⟨RootResetProgressRoles.Gadget.source bit predecessor, parents⟩⟩
      ⟨some .armedRoot,
        ⟨RootResetProgressRoles.Gadget.source bit predecessor, parents⟩⟩ := by
  cases boundary <;> cases bit <;> exact ⟨rfl, rfl⟩

/-- The prepared Armed root performs the first mutation in one tick. -/
theorem mutateArmed (bit : Bool) (predecessor : Term)
    (parents : List ParentFrame) :
    FirstMutationRun machine 1
      ⟨some .armedRoot,
        ⟨RootResetProgressRoles.Gadget.source bit predecessor, parents⟩⟩
      ⟨some .halt, ⟨openCell bit predecessor predecessor, parents⟩⟩ := by
  apply FirstMutationRun.here
  cases bit <;> rfl

private theorem prepareOpenFirstFive (bit : Bool) (predecessor audit : Term)
    (parents : List ParentFrame) :
    SilentRun 5
      ⟨some .afterUp,
        ⟨.app .s predecessor,
          .left (.app (live bit) audit) :: parents⟩⟩
      ⟨some .otherRoot,
        ⟨openCell bit predecessor audit, parents⟩⟩ := by
  cases bit <;> exact ⟨rfl, rfl⟩

private theorem prepareOpenLastFive (bit : Bool) (predecessor audit : Term)
    (parents : List ParentFrame) :
    SilentRun 5
      ⟨some .otherRoot,
        ⟨openCell bit predecessor audit, parents⟩⟩
      ⟨some .openRight,
        ⟨.app (live bit) audit,
          .right (.app .s predecessor) :: parents⟩⟩ := by
  cases bit <;> exact ⟨rfl, rfl⟩

/-- Ten silent ticks put an Open cell's right child under the final `Rdx`. -/
theorem prepareOpenMutation (bit : Bool) (predecessor audit : Term)
    (parents : List ParentFrame) :
    SilentRun 10
      ⟨some .afterUp,
        ⟨.app .s predecessor,
          .left (.app (live bit) audit) :: parents⟩⟩
      ⟨some .openRight,
        ⟨.app (live bit) audit,
          .right (.app .s predecessor) :: parents⟩⟩ := by
  simpa using (prepareOpenFirstFive bit predecessor audit parents).trans
    (prepareOpenLastFive bit predecessor audit parents)

/-- The prepared Open right child performs the first mutation in one tick. -/
theorem mutateOpen (bit : Bool) (predecessor audit : Term)
    (parents : List ParentFrame) :
    FirstMutationRun machine 1
      ⟨some .openRight,
        ⟨.app (live bit) audit,
          .right (.app .s predecessor) :: parents⟩⟩
      ⟨some .halt,
        ⟨.app (.app .s audit) (.app (valueTag bit) audit),
          .right (.app .s predecessor) :: parents⟩⟩ := by
  apply FirstMutationRun.here
  cases bit <;> rfl

/-! ## Recursive inert scans -/

/-- Every inert history is scanned without contraction and without entering
an audit field.  Each registered Closed cell contributes exactly sixteen
microticks. -/
theorem Inert.scan {term : Term} (history : Inert term)
    (frame : ParentFrame) (parents : List ParentFrame) :
    ∃ closedCells,
      RegisteredCells term closedCells ∧
      SilentRun (1 + 16 * closedCells)
        ⟨some .down, ⟨term, frame :: parents⟩⟩
        ⟨some .afterUp, ⟨frame.fill term, parents⟩⟩ := by
  induction history generalizing frame parents with
  | endpoint =>
      refine ⟨0, .endpoint, ?_⟩
      cases frame <;> exact ⟨rfl, rfl⟩
  | @closed predecessor bit leftAudit rightAudit inner ih =>
      let right : Term := .app (.app .s leftAudit)
        (.app (valueTag bit) rightAudit)
      obtain ⟨closedCells, registered, inside⟩ :=
        ih (.right .s) (.left right :: frame :: parents)
      have down := downOther predecessor right (frame :: parents)
      have up := ascendClosed bit predecessor leftAudit rightAudit frame parents
      refine ⟨closedCells + 1,
        .closed bit leftAudit rightAudit registered, ?_⟩
      have composed := down.trans (inside.trans up)
      rw [← inertTickEq closedCells]
      simpa [right] using! composed

/-! ## Exact arbitrary-depth first mutation -/

/-- Generalized exact run under a root-or-registered-right boundary. -/
theorem FirstMutation.runExact {source target : Term}
    (mutation : FirstMutation source target) (parents : List ParentFrame)
    (boundary : Boundary parents) :
    ∃ registeredCells ticks after,
      RegisteredCells source registeredCells ∧
      0 < registeredCells ∧
      ticks ≤ 16 * registeredCells ∧
      FirstMutationRun machine ticks
        ⟨some .down, ⟨source, parents⟩⟩ after ∧
      after.control = some .halt ∧
      after.cursor.erase = Cursor.rebuild parents target := by
  induction mutation generalizing parents with
  | @armed predecessor bit history =>
      obtain ⟨closedCells, registered, scanned⟩ := Inert.scan history (.right
        (RootResetProgressRoles.Gadget.progressLive bit)) parents
      have down := downArmed bit predecessor parents
      have prepared := prepareArmedMutation bit predecessor parents boundary
      have final := mutateArmed bit predecessor parents
      let finalConfiguration : Configuration Control :=
        ⟨some .halt, ⟨openCell bit predecessor predecessor, parents⟩⟩
      refine ⟨closedCells + 1, 12 + 16 * closedCells, finalConfiguration,
        .armed bit registered, by simp, ?_, ?_, rfl, rfl⟩
      · exact armedTickBound closedCells
      · have silentPrefix := down.trans (scanned.trans prepared)
        rw [← armedTickEq closedCells]
        simpa [finalConfiguration] using
          silentPrefix.thenFirstMutation final
  | @opened predecessor bit audit history =>
      let right : Term := .app (live bit) audit
      obtain ⟨closedCells, registered, scanned⟩ :=
        Inert.scan history (.right .s) (.left right :: parents)
      have down := downOther predecessor right parents
      have prepared := prepareOpenMutation bit predecessor audit parents
      have final := mutateOpen bit predecessor audit parents
      let finalConfiguration : Configuration Control :=
        ⟨some .halt,
          ⟨.app (.app .s audit) (.app (valueTag bit) audit),
            .right (.app .s predecessor) :: parents⟩⟩
      refine ⟨closedCells + 1, 16 + 16 * closedCells, finalConfiguration,
        .opened bit audit registered, by simp, ?_, ?_, rfl, ?_⟩
      · exact openTickBound closedCells
      · have silentPrefix := down.trans (scanned.trans prepared)
        rw [← openTickEq closedCells]
        simpa [right, finalConfiguration] using!
          silentPrefix.thenFirstMutation final
      · rfl
  | @wrap before after outerBefore outerAfter inner outer ih =>
      cases outer with
      | armed bit before after =>
          obtain ⟨cells, ticks, final, registered, positive, linear,
              runInner, halted, erased⟩ :=
            ih (.right (RootResetProgressRoles.Gadget.progressLive bit) ::
              parents) (.right _ _)
          refine ⟨cells + 1, 5 + ticks, final, .armed bit registered,
            by simp, ?_, ?_, halted, ?_⟩
          · calc
              5 + ticks ≤ 16 + 16 * cells :=
                Nat.add_le_add (by decide) linear
              _ = 16 * (cells + 1) := by
                rw [Nat.mul_add, Nat.mul_one, Nat.add_comm]
          · exact (downArmed bit before parents).thenFirstMutation runInner
          · simpa [Cursor.erase, RootResetProgressRoles.Gadget.source,
              RootResetDeletionGadget.source] using! erased
      | opened bit audit before after =>
          let right : Term := .app (live bit) audit
          obtain ⟨cells, ticks, final, registered, positive, linear,
              runInner, halted, erased⟩ :=
            ih (.right .s :: .left right :: parents) (.right _ _)
          refine ⟨cells + 1, 4 + ticks, final,
            .opened bit audit registered, by simp, ?_, ?_, halted, ?_⟩
          · calc
              4 + ticks ≤ 16 + 16 * cells :=
                Nat.add_le_add (by decide) linear
              _ = 16 * (cells + 1) := by
                rw [Nat.mul_add, Nat.mul_one, Nat.add_comm]
          · exact (downOther before right parents).thenFirstMutation runInner
          · simpa [Cursor.erase, openCell, right] using! erased
      | closed bit leftAudit rightAudit before after =>
          let right : Term := .app (.app .s leftAudit)
            (.app (valueTag bit) rightAudit)
          obtain ⟨cells, ticks, final, registered, positive, linear,
              runInner, halted, erased⟩ :=
            ih (.right .s :: .left right :: parents) (.right _ _)
          refine ⟨cells + 1, 4 + ticks, final,
            .closed bit leftAudit rightAudit registered, by simp,
            ?_, ?_, halted, ?_⟩
          · calc
              4 + ticks ≤ 16 + 16 * cells :=
                Nat.add_le_add (by decide) linear
              _ = 16 * (cells + 1) := by
                rw [Nat.mul_add, Nat.mul_one, Nat.add_comm]
          · exact (downOther before right parents).thenFirstMutation runInner
          · simpa [Cursor.erase, closedCell, right] using! erased

/-- Exact fresh-root execution for every arbitrary-depth first mutation. -/
theorem FirstMutation.run_freshRoot_exact {source target : Term}
    (mutation : FirstMutation source target) :
    ∃ registeredCells ticks after,
      RegisteredCells source registeredCells ∧
      0 < registeredCells ∧
      ticks ≤ 16 * registeredCells ∧
      FirstMutationRun machine ticks (initial source) after ∧
      after.control = some .halt ∧ after.cursor.erase = target := by
  exact FirstMutation.runExact mutation [] .root

/-- The total bare-term selector is complete on every `FirstMutation` spine
for a concrete exact tick count bounded linearly by registered depth. -/
theorem FirstMutation.selectStep?_complete {source target : Term}
    (mutation : FirstMutation source target) :
    ∃ registeredCells ticks,
      RegisteredCells source registeredCells ∧
      0 < registeredCells ∧
      ticks ≤ 16 * registeredCells ∧
      selectStep? ticks source = some target := by
  obtain ⟨cells, ticks, after, registered, positive, linear, first,
      halted, erased⟩ :=
    FirstMutation.run_freshRoot_exact mutation
  refine ⟨cells, ticks, registered, positive, linear, ?_⟩
  unfold selectStep?
  rw [first.seekMutation_eq]
  simpa [erased]

/-- Every exact arbitrary-depth selector run reaches the named target and
contains one and only one contraction. -/
theorem FirstMutation.runMutationCount_eq_one {source target : Term}
    (mutation : FirstMutation source target) :
    ∃ registeredCells ticks,
      RegisteredCells source registeredCells ∧
      0 < registeredCells ∧
      ticks ≤ 16 * registeredCells ∧
      selectStep? ticks source = some target ∧
      runMutationCount machine ticks (initial source) = 1 := by
  obtain ⟨cells, ticks, after, registered, positive, linear, first,
      halted, erased⟩ :=
    FirstMutation.run_freshRoot_exact mutation
  refine ⟨cells, ticks, registered, positive, linear, ?_,
    PureSFormal.Research.RootResetProgressCompleteness.FirstMutationRun.runMutationCount_eq_one
      first⟩
  unfold selectStep?
  rw [first.seekMutation_eq]
  simpa [erased]

/-- The structurally fuelled total wrapper uses a linear all-input fuel
envelope and returns the same exact first mutation on the registered
progress-spine fragment.  This theorem does not assert that the bare
controller self-halts or rejects every malformed input without supplied
fuel. -/
theorem FirstMutation.selectStep?_stateBound_complete
    {source target : Term} (mutation : FirstMutation source target) :
    selectStep?
        (FiniteController.stateBound machine (initial source)) source =
      some target := by
  obtain ⟨cells, ticks, after, registered, positive, linear, first,
      halted, erased⟩ :=
    FirstMutation.run_freshRoot_exact mutation
  unfold selectStep?
  rw [FiniteController.seekMutation_stateBound machine first.seekMutation_eq]
  simpa [erased]

/-- The total wrapper's concrete fuel envelope is exactly 24 runtime states
per syntax node: 23 listed controls plus the rejecting sink. -/
theorem stateBound_initial_eq (term : Term) :
    FiniteController.stateBound machine (initial term) = 24 * term.size := by
  rw [FiniteController.stateBound_eq]
  rfl

end PureSFormal.Research.RootResetProgressCompleteness
