import PureSFormal.Research.RootResetSelectorContract
import PureSFormal.PureS.SchedulerInvariant

/-!
# Runtime zipper contexts and root-reset addresses

The persistent scheduler and the root-reset development define the context
around a zipper focus independently.  This module identifies those two
representations and transports lookup, replacement, and contraction facts
between them.  All addresses remain proof-level root-relative lists; no
address is added to controller state.
-/

namespace PureSFormal.Research.RootResetRuntimeContextBridge

open PureSFormal.PureS

/-- The scheduler and root-reset definitions construct the same context. -/
@[simp]
theorem contextOfParents_eq_surroundingContext
    (parents : List ParentFrame) :
    SchedulerInvariant.contextOfParents parents =
      RootResetSelectorContract.surroundingContext parents := by
  induction parents with
  | nil => rfl
  | cons frame parents ih =>
      cases frame <;>
        simp only [SchedulerInvariant.contextOfParents,
          RootResetSelectorContract.surroundingContext, ih]

/-- The reverse orientation is convenient when a root-reset fact is used by
the persistent scheduler.  It is intentionally not a simplification rule. -/
theorem surroundingContext_eq_contextOfParents
    (parents : List ParentFrame) :
    RootResetSelectorContract.surroundingContext parents =
      SchedulerInvariant.contextOfParents parents :=
  (contextOfParents_eq_surroundingContext parents).symm

/-- Both context representations fill their hole with the same term. -/
theorem context_plug_agrees (parents : List ParentFrame) (focus : Term) :
    (SchedulerInvariant.contextOfParents parents).plug focus =
      (RootResetSelectorContract.surroundingContext parents).plug focus := by
  rw [contextOfParents_eq_surroundingContext]

/-- Filling the scheduler context is exactly zipper rebuilding. -/
@[simp]
theorem contextOfParents_plug_eq_rebuild
    (parents : List ParentFrame) (focus : Term) :
    (SchedulerInvariant.contextOfParents parents).plug focus =
      Cursor.rebuild parents focus :=
  SchedulerInvariant.contextOfParents_plug parents focus

/-- The scheduler context and the root-reset stack encode the same address. -/
@[simp]
theorem contextOfParents_contextAddress
    (parents : List ParentFrame) :
    RootResetSelectorContract.contextAddress
        (SchedulerInvariant.contextOfParents parents) =
      RootResetSelectorContract.addressFromParents parents := by
  rw [contextOfParents_eq_surroundingContext]
  exact RootResetSelectorContract.surroundingContext_address parents

/-- The address represented by a cursor is the hole address of its scheduler
context. -/
@[simp]
theorem cursorAddress_eq_contextOfParents_address
    (focus : Term) (parents : List ParentFrame) :
    RootResetSelectorContract.cursorAddress ⟨focus, parents⟩ =
      RootResetSelectorContract.contextAddress
        (SchedulerInvariant.contextOfParents parents) := by
  rw [contextOfParents_contextAddress]
  rfl

/-- Erasing a runtime cursor is filling its scheduler context. -/
@[simp]
theorem cursorErase_eq_contextOfParents_plug
    (focus : Term) (parents : List ParentFrame) :
    (Cursor.mk focus parents).erase =
      (SchedulerInvariant.contextOfParents parents).plug focus := by
  exact (SchedulerInvariant.contextOfParents_plug parents focus).symm

/-- Lookup at the common root-relative address reaches the runtime focus. -/
@[simp]
theorem subterm?_contextOfParents_address
    (focus : Term) (parents : List ParentFrame) :
    ((SchedulerInvariant.contextOfParents parents).plug focus).subterm?
        (RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents)) =
      some focus := by
  simpa only [cursorErase_eq_contextOfParents_plug,
    cursorAddress_eq_contextOfParents_address] using
      RootResetSelectorContract.subterm?_erase_cursorAddress
        (Cursor.mk focus parents)

/-- Replacement at the common address changes exactly the runtime focus. -/
@[simp]
theorem replace?_contextOfParents_address
    (focus replacement : Term) (parents : List ParentFrame) :
    ((SchedulerInvariant.contextOfParents parents).plug focus).replace?
        (RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents)) replacement =
      some ((SchedulerInvariant.contextOfParents parents).plug replacement) := by
  exact RootResetSelectorContract.context_replace?_plug
    (SchedulerInvariant.contextOfParents parents) focus replacement

/-- The root-reset hole address selects the hole of every ordinary context. -/
@[simp]
theorem subterm?_contextAddress (context : Context) (focus : Term) :
    (context.plug focus).subterm?
        (RootResetSelectorContract.contextAddress context) = some focus := by
  induction context with
  | hole => simp [Context.plug, RootResetSelectorContract.contextAddress,
      Term.subterm?]
  | appLeft inner right ih =>
      simpa [RootResetSelectorContract.contextAddress, Term.subterm?] using ih
  | appRight left inner ih =>
      simpa [RootResetSelectorContract.contextAddress, Term.subterm?] using ih

/-- Contracting a context hole is precisely a root contraction of its focus. -/
theorem contractAt?_contextAddress (context : Context) (focus : Term) :
    (context.plug focus).contractAt?
        (RootResetSelectorContract.contextAddress context) =
      focus.contractRoot?.map context.plug := by
  unfold Term.contractAt?
  rw [subterm?_contextAddress]
  cases contracted : focus.contractRoot? with
  | none => simp [contracted]
  | some replacement =>
      simp [contracted,
        RootResetSelectorContract.context_replace?_plug]

/-- In particular, contraction at a runtime cursor's root address is focused
root contraction followed by reconstruction of the same outer term. -/
theorem contractAt?_contextOfParents_address
    (focus : Term) (parents : List ParentFrame) :
    ((SchedulerInvariant.contextOfParents parents).plug focus).contractAt?
        (RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents)) =
      focus.contractRoot?.map fun replacement =>
        (SchedulerInvariant.contextOfParents parents).plug replacement :=
  contractAt?_contextAddress
    (SchedulerInvariant.contextOfParents parents) focus

/-- The direct cursor theorem and the scheduler-context theorem are the same
statement after translating their contexts and addresses. -/
theorem contractAt?_cursorAddress_eq_contextOfParents
    (focus : Term) (parents : List ParentFrame) :
    (Cursor.mk focus parents).erase.contractAt?
        (RootResetSelectorContract.cursorAddress ⟨focus, parents⟩) =
      ((SchedulerInvariant.contextOfParents parents).plug focus).contractAt?
        (RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents)) := by
  rw [cursorErase_eq_contextOfParents_plug,
    cursorAddress_eq_contextOfParents_address]

/-- Adding proof-level context frames appends the local hole address to the
address already represented by the runtime parent stack. -/
@[simp]
theorem addressFromParents_frames
    (context : Context) (focus : Term) (parents : List ParentFrame) :
    RootResetSelectorContract.addressFromParents
        (ContextCursor.frames context focus parents) =
      RootResetSelectorContract.addressFromParents parents ++
        RootResetSelectorContract.contextAddress context := by
  induction context generalizing parents with
  | hole => simp [ContextCursor.frames,
      RootResetSelectorContract.contextAddress]
  | appLeft inner right ih =>
      rw [ContextCursor.frames, ih]
      simp [RootResetSelectorContract.addressFromParents,
        RootResetSelectorContract.contextAddress, List.append_assoc]
  | appRight left inner ih =>
      rw [ContextCursor.frames, ih]
      simp [RootResetSelectorContract.addressFromParents,
        RootResetSelectorContract.contextAddress, List.append_assoc]

/-- Context composition is associative. -/
theorem context_comp_assoc (first second third : Context) :
    (first.comp second).comp third = first.comp (second.comp third) := by
  induction first with
  | hole => rfl
  | appLeft inner right ih => simp [Context.comp, ih]
  | appRight left inner ih => simp [Context.comp, ih]

/-- The hole is a right identity for context composition. -/
@[simp]
theorem context_comp_hole (context : Context) :
    context.comp .hole = context := by
  induction context with
  | hole => rfl
  | appLeft inner right ih => simp [Context.comp, ih]
  | appRight left inner ih => simp [Context.comp, ih]

/-- Converting frames back to a context composes the pre-existing outer
parent stack with the context through which the cursor descended. -/
theorem contextOfParents_frames_eq_comp
    (context : Context) (focus : Term) (parents : List ParentFrame) :
    SchedulerInvariant.contextOfParents
        (ContextCursor.frames context focus parents) =
      (SchedulerInvariant.contextOfParents parents).comp context := by
  induction context generalizing parents with
  | hole => simp [ContextCursor.frames, Context.comp]
  | appLeft inner right ih =>
      change SchedulerInvariant.contextOfParents
          (ContextCursor.frames inner focus (.left right :: parents)) = _
      rw [ih, SchedulerInvariant.contextOfParents, context_comp_assoc]
      rfl
  | appRight left inner ih =>
      change SchedulerInvariant.contextOfParents
          (ContextCursor.frames inner focus (.right left :: parents)) = _
      rw [ih, SchedulerInvariant.contextOfParents, context_comp_assoc]
      rfl

/-- At the root, the frames produced by a context encode that context exactly. -/
@[simp]
theorem contextOfParents_frames_root (context : Context) (focus : Term) :
    SchedulerInvariant.contextOfParents
        (ContextCursor.frames context focus []) = context := by
  simpa [SchedulerInvariant.contextOfParents, Context.comp] using
    contextOfParents_frames_eq_comp context focus []

/-- The cursor obtained by descending through a local context has the expected
composite root-relative address. -/
@[simp]
theorem cursorAddress_frames
    (context : Context) (focus : Term) (parents : List ParentFrame) :
    RootResetSelectorContract.cursorAddress
        ⟨focus, ContextCursor.frames context focus parents⟩ =
      RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents) ++
        RootResetSelectorContract.contextAddress context := by
  simp only [RootResetSelectorContract.cursorAddress,
    addressFromParents_frames, contextOfParents_contextAddress]

/-- Rebuilding after a proof-level descent fills the local context and then
the scheduler's outer context. -/
@[simp]
theorem rebuild_frames_eq_contextOfParents_plug
    (context : Context) (focus : Term) (parents : List ParentFrame) :
    Cursor.rebuild (ContextCursor.frames context focus parents) focus =
      (SchedulerInvariant.contextOfParents parents).plug
        (context.plug focus) := by
  rw [SchedulerInvariant.rebuild_contextFrames]
  exact (SchedulerInvariant.contextOfParents_plug parents
    (context.plug focus)).symm

/-- A contraction below both a runtime parent stack and a local context uses
the concatenation of their root-relative addresses. -/
theorem contractAt?_contextOfParents_append
    (outer : List ParentFrame) (inner : Context) (focus : Term) :
    ((SchedulerInvariant.contextOfParents outer).plug
        (inner.plug focus)).contractAt?
      (RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents outer) ++
        RootResetSelectorContract.contextAddress inner) =
      focus.contractRoot?.map fun replacement =>
        (SchedulerInvariant.contextOfParents outer).plug
          (inner.plug replacement) := by
  rw [← Context.plug_comp,
    ← RootResetSelectorContract.contextAddress_comp,
    contractAt?_contextAddress]
  cases contracted : focus.contractRoot? with
  | none => rfl
  | some replacement =>
      exact congrArg some
        (Context.plug_comp
          (SchedulerInvariant.contextOfParents outer) inner replacement)

end PureSFormal.Research.RootResetRuntimeContextBridge
