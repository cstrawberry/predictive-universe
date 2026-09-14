import PureSFormal.PureS.FiniteController
import PureSFormal.Research.RootResetProgressSpine

/-!
# A root-reset finite-state walker for recursive progress spines

This module realizes the delayed-deletion progress-cell scan by one concrete
finite controller.  Every invocation starts at the root in `Control.down`.
The controller sees only `S` versus application and root/left/right incoming
edge, and its only operations are one-edge moves and focused `Rdx`.

The transition table is designed to follow only the registered predecessor:
`R` for Armed cells and `LR` for Open or Closed cells.  It then ascends,
classifies the visible role boundary, and contracts an Armed root or an Open
right child.  The checked component theorem proves total one-step soundness
on every input and exact fresh-root executions for the Armed, Open, and
Closed endpoint cases, including their mutation counts and queue effects.

The arbitrary-depth progress-spine completeness induction and the clock,
frame, dispatcher, action, commit, and continuation classifiers remain
separate obligations.  No all-stage root-reset universality claim is made.
-/

namespace PureSFormal.Research.RootResetProgressWalker

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open RootResetProgressRoles

/-- Finite program counters of the progress-spine walker. -/
inductive Control where
  | down
  | downL
  | downLL
  | downArmedL
  | downArmedRoot
  | downOtherL
  | afterUp
  | inspect
  | inspectL
  | inspectLL
  | armedL
  | armedRoot
  | otherL
  | otherRoot
  | right
  | rightL
  | rightLL
  | openRL
  | openRight
  | closedRL
  | closedRight
  | closedRoot
  | halt
  deriving BEq, DecidableEq, Inhabited, Repr

/-- Explicit finite cover of the controller state type. -/
def states : List Control :=
  [.down, .downL, .downLL, .downArmedL, .downArmedRoot, .downOtherL,
   .afterUp, .inspect, .inspectL, .inspectLL, .armedL, .armedRoot,
   .otherL, .otherRoot, .right, .rightL, .rightLL, .openRL, .openRight,
   .closedRL, .closedRight, .closedRoot, .halt]

theorem mem_states (control : Control) : control ∈ states := by
  cases control <;> simp [states]

/-- Local transition table.  Shape mismatches reject rather than mutate. -/
def transition : Control → Probe.NodeKind → Probe.Incoming →
    Command Control
  | .down, .s, _ => .exec .U .afterUp
  | .down, .app, _ => .exec .L .downL
  | .downL, .app, _ => .exec .L .downLL
  | .downL, .s, _ => .reject
  | .downLL, .app, _ => .exec .U .downArmedL
  | .downLL, .s, _ => .exec .U .downOtherL
  | .downArmedL, _, _ => .exec .U .downArmedRoot
  | .downArmedRoot, _, _ => .exec .R .down
  | .downOtherL, _, _ => .exec .R .down
  | .afterUp, _, .left => .exec .U .inspect
  | .afterUp, _, .root => .stay .inspect
  | .afterUp, _, .right => .stay .inspect
  | .inspect, .app, _ => .exec .L .inspectL
  | .inspect, .s, _ => .reject
  | .inspectL, .app, _ => .exec .L .inspectLL
  | .inspectL, .s, _ => .reject
  | .inspectLL, .app, _ => .exec .U .armedL
  | .inspectLL, .s, _ => .exec .U .otherL
  | .armedL, _, _ => .exec .U .armedRoot
  | .armedRoot, _, _ => .exec .Rdx .halt
  | .otherL, _, _ => .exec .U .otherRoot
  | .otherRoot, _, _ => .exec .R .right
  | .right, .app, _ => .exec .L .rightL
  | .right, .s, _ => .reject
  | .rightL, .app, _ => .exec .L .rightLL
  | .rightL, .s, _ => .reject
  | .rightLL, .app, _ => .exec .U .openRL
  | .rightLL, .s, _ => .exec .U .closedRL
  | .openRL, _, _ => .exec .U .openRight
  | .openRight, _, _ => .exec .Rdx .halt
  | .closedRL, _, _ => .exec .U .closedRight
  | .closedRight, _, _ => .exec .U .closedRoot
  | .closedRoot, _, .root => .reject
  | .closedRoot, _, .left => .exec .U .afterUp
  | .closedRoot, _, .right => .exec .U .afterUp
  | .halt, _, _ => .stay .halt

/-- One fixed finite-state walker, independent of bit values and audit terms. -/
def machine : Machine Control where
  stateCover := fun _ => states
  covers := mem_states
  transition := transition

/-- Every invocation discards all prior position and control information. -/
def initial (term : Term) : Configuration Control :=
  ⟨some .down, Cursor.atRoot term⟩

/-- Bounded search for the first mutation of a fresh root invocation. -/
def selectStep? (fuel : Nat) (term : Term) : Option Term :=
  (seekMutation machine fuel (initial term)).map
    (fun result => result.cursor.erase)

/-- Any returned result is exactly one contextual pure-S contraction. -/
theorem selectStep?_sound {fuel : Nat} {source target : Term}
    (h : selectStep? fuel source = some target) : Step source target := by
  unfold selectStep? at h
  generalize hs : seekMutation machine fuel (initial source) = result at h
  cases result with
  | none => simp at h
  | some after =>
      cases h
      simpa [initial] using seekMutation_sound machine hs

/-! ## Canonical inert history and first-mutation relation -/

/-- A canonical history contains only the endpoint and Closed cells. -/
inductive Inert : Term → Prop where
  | endpoint : Inert .s
  | closed {predecessor : Term} (bit : Bool) (leftAudit rightAudit : Term)
      (inner : Inert predecessor) :
      Inert (closedCell bit predecessor leftAudit rightAudit)

/-- Contextual replacement of the registered predecessor of one cell. -/
inductive Wraps : Term → Term → Term → Term → Prop where
  | armed (bit : Bool) (before after : Term) :
      Wraps before after
        (RootResetProgressRoles.Gadget.source bit before)
        (RootResetProgressRoles.Gadget.source bit after)
  | opened (bit : Bool) (audit before after : Term) :
      Wraps before after (openCell bit before audit) (openCell bit after audit)
  | closed (bit : Bool) (leftAudit rightAudit before after : Term) :
      Wraps before after
        (closedCell bit before leftAudit rightAudit)
        (closedCell bit after leftAudit rightAudit)

/-- The exact first mutable progress cell, allowing arbitrary outer cells. -/
inductive FirstMutation : Term → Term → Prop where
  | armed {predecessor : Term} (bit : Bool) (history : Inert predecessor) :
      FirstMutation (RootResetProgressRoles.Gadget.source bit predecessor)
        (openCell bit predecessor predecessor)
  | opened {predecessor : Term} (bit : Bool) (audit : Term)
      (history : Inert predecessor) :
      FirstMutation (openCell bit predecessor audit)
        (closedCell bit predecessor audit audit)
  | wrap {before after outerBefore outerAfter : Term}
      (inner : FirstMutation before after)
      (outer : Wraps before after outerBefore outerAfter) :
      FirstMutation outerBefore outerAfter

/-- The relation names one genuine contextual contraction. -/
theorem FirstMutation.step {source target : Term}
    (h : FirstMutation source target) : Step source target := by
  induction h with
  | armed bit history => exact RootResetProgressRoles.source_step_openCell _ _
  | opened bit audit history => exact RootResetProgressRoles.openCell_step_closedCell _ _ _
  | wrap inner outer ih =>
      cases outer with
      | armed bit before after =>
          exact ih.appRight _
      | opened bit audit before after =>
          exact (ih.appRight .s).appLeft _
      | closed bit leftAudit rightAudit before after =>
          exact (ih.appRight .s).appLeft _

/-- A fresh root invocation opens a one-cell Armed spine after exactly twelve
controller microticks. -/
theorem run_armed_endpoint (bit : Bool) :
    (run machine 12
      (initial (RootResetProgressRoles.Gadget.source bit .s))).cursor.erase =
        openCell bit .s .s := by
  cases bit <;> rfl

/-- The twelve-tick Armed run contains exactly one focused contraction. -/
theorem runMutationCount_armed_endpoint (bit : Bool) :
    runMutationCount machine 12
      (initial (RootResetProgressRoles.Gadget.source bit .s)) = 1 := by
  cases bit <;> rfl

/-- A second fresh root invocation closes the diagonal one-cell Open spine
after exactly sixteen controller microticks. -/
theorem run_open_endpoint (bit : Bool) :
    (run machine 16 (initial (openCell bit .s .s))).cursor.erase =
      closedCell bit .s .s .s := by
  cases bit <;> rfl

/-- The sixteen-tick Open run contains exactly one focused contraction. -/
theorem runMutationCount_open_endpoint (bit : Bool) :
    runMutationCount machine 16 (initial (openCell bit .s .s)) = 1 := by
  cases bit <;> rfl

/-- A fresh root invocation rejects a one-cell Closed spine without changing
its bare term. -/
theorem run_closed_endpoint (bit : Bool) :
    (run machine 17
      (initial (closedCell bit .s .s .s))).cursor.erase =
        closedCell bit .s .s .s := by
  cases bit <;> rfl

/-- The complete Closed-spine scan contains no contraction. -/
theorem runMutationCount_closed_endpoint (bit : Bool)
    :
    runMutationCount machine 17
      (initial (closedCell bit .s .s .s)) = 0 := by
  cases bit <;> rfl

/-- The selected one-cell opening has the exact queue effect certified by
the recursive progress-spine decoder. -/
theorem armed_endpoint_deletes (bit : Bool) :
    RootResetProgressSpine.queue?
        (RootResetProgressRoles.Gadget.source bit .s) = some [bit] ∧
      RootResetProgressSpine.queue? (openCell bit .s .s) = some [] := by
  exact RootResetProgressSpine.opening_deletes bit
    RootResetProgressSpine.Decodes.endpoint

/-- The selected one-cell close preserves the already-deleted queue. -/
theorem open_endpoint_close_preserves_queue (bit : Bool) (audit : Term) :
    RootResetProgressSpine.queue? (openCell bit .s audit) =
      RootResetProgressSpine.queue? (closedCell bit .s audit audit) :=
  RootResetProgressSpine.closing_preserves_queue bit .s audit

end PureSFormal.Research.RootResetProgressWalker
