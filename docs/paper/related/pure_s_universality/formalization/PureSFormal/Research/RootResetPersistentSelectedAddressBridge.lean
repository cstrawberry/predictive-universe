import PureSFormal.Research.RootResetReachableActiveContext
import PureSFormal.Research.RootResetRuntimeContextBridge
import PureSFormal.Research.RootResetWholeDispatcherStages
import PureSFormal.Research.RootResetWholeAppenderStages

/-!
# Persistent and root-reset selected-address agreement

A role-indexed active-context derivation reconstructs the whole bare term and
its root-relative active address.  This module shows that any verified local
endpoint contraction lifts through that context.  When the local endpoint is
presented as a focused root redex, the same address is represented by the
parent stack of a concrete cursor.  The statement is independent of scheduler
family and can therefore be reused by all seven family cases.
-/

namespace PureSFormal.Research.RootResetPersistentSelectedAddressBridge

open PureSFormal.PureS

/-- Root-relative address obtained by prefixing the local endpoint address
with the role-derived active address. -/
def wholeAddress
    (view : RootResetReachableActiveContext.View)
    (localAddress : Address) : Address :=
  view.address ++ localAddress

/-- Whole target obtained by putting the local target back into the
role-derived context. -/
def wholeTarget
    (view : RootResetReachableActiveContext.View)
    (localTarget : Term) : Term :=
  view.context.plug localTarget

/-- Any verified local endpoint contraction lifts to the exact whole-term
address and exact reconstructed contractum. -/
theorem lift_contractAt?
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List RootResetReachableActiveContext.Role}
    {term : Term} {view : RootResetReachableActiveContext.View}
    (shape : RootResetReachableActiveContext.Describes
      program tree roles term view)
    {localAddress : Address} {localTarget : Term}
    (contracts : view.active.contractAt? localAddress = some localTarget) :
    term.contractAt? (wholeAddress view localAddress) =
      some (wholeTarget view localTarget) := by
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    view.context localAddress contracts
  rw [shape.contextAddress_eq] at lifted
  rw [shape.source_eq] at lifted
  exact lifted

/-- A dispatcher parser's certified redex address and exact local contractum
lift through any role-indexed active context.  The dispatcher view calls this
field `redexAddress`; the composite registry exposes it as its selected
address. -/
theorem lift_dispatcher_redexAddress
    {program : CTS.Program} {layout : ActionDispatcher program}
    {roles : List RootResetReachableActiveContext.Role}
    {term : Term} {outerView : RootResetReachableActiveContext.View}
    (outerShape : RootResetReachableActiveContext.Describes
      program layout.tree roles term outerView)
    {dispatcherView : RootResetWholeDispatcherStages.View program}
    (parsed : RootResetWholeDispatcherStages.parse?
      program layout outerView.active = some dispatcherView) :
    ∃ localTarget,
      outerView.active.replace? dispatcherView.redexAddress
          dispatcherView.endpoint.replacement = some localTarget ∧
      outerView.active.contractAt? dispatcherView.redexAddress =
          some localTarget ∧
      term.contractAt?
          (wholeAddress outerView dispatcherView.redexAddress) =
        some (wholeTarget outerView localTarget) := by
  obtain ⟨localTarget, replaced, contracts⟩ :=
    dispatcherView.contracts parsed
  exact ⟨localTarget, replaced, contracts,
    lift_contractAt? outerShape contracts⟩

/-- An appender parser's present selected address and exact local contractum
lift through any role-indexed active context.  Final Push rows are excluded
by the explicit local replacement premise. -/
theorem lift_appender_selectedAddress
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List RootResetReachableActiveContext.Role}
    {term : Term} {outerView : RootResetReachableActiveContext.View}
    (outerShape : RootResetReachableActiveContext.Describes
      program tree roles term outerView)
    {appenderView : RootResetWholeAppenderStages.View program}
    (parsed : RootResetWholeAppenderStages.parse?
      program tree outerView.active = some appenderView)
    {replacement : Term}
    (replacementEq : appenderView.endpoint.row.replacement? =
      some replacement) :
    ∃ localTarget,
      appenderView.selectedAddress = some appenderView.focusAddress ∧
      outerView.active.replace? appenderView.focusAddress replacement =
          some localTarget ∧
      outerView.active.contractAt? appenderView.focusAddress =
          some localTarget ∧
      term.contractAt?
          (wholeAddress outerView appenderView.focusAddress) =
        some (wholeTarget outerView localTarget) := by
  obtain ⟨localTarget, selected, replaced, contracts⟩ :=
    appenderView.selected_contracts parsed replacementEq
  exact ⟨localTarget, selected, replaced, contracts,
    lift_contractAt? outerShape contracts⟩

/-- Cursor focused at a local endpoint below the role-derived whole context. -/
def cursorBefore
    (view : RootResetReachableActiveContext.View)
    (localContext : Context) (focus : Term) : Cursor :=
  ⟨focus,
    ContextCursor.frames (view.context.comp localContext) focus []⟩

/-- Cursor immediately after replacing the focused endpoint while retaining
the same occurrence path. -/
def cursorAfter
    (view : RootResetReachableActiveContext.View)
    (localContext : Context) (focus replacement : Term) : Cursor :=
  ⟨replacement,
    ContextCursor.frames (view.context.comp localContext) focus []⟩

/-- The selected cursor's parent stack encodes exactly the composite of the
role-derived context and the local endpoint context. -/
@[simp]
theorem cursorBefore_parentContext
    (view : RootResetReachableActiveContext.View)
    (localContext : Context) (focus : Term) :
    SchedulerInvariant.contextOfParents
        (cursorBefore view localContext focus).parents =
      view.context.comp localContext := by
  simpa [cursorBefore] using
    RootResetRuntimeContextBridge.contextOfParents_frames_root
      (view.context.comp localContext) focus

/-- If the local endpoint context reconstructs the active term, erasing the
selected cursor reconstructs the whole source term. -/
@[simp]
theorem cursorBefore_erase
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List RootResetReachableActiveContext.Role}
    {term : Term} {view : RootResetReachableActiveContext.View}
    (shape : RootResetReachableActiveContext.Describes
      program tree roles term view)
    (localContext : Context) (focus : Term)
    (localSource : localContext.plug focus = view.active) :
    (cursorBefore view localContext focus).erase = term := by
  calc
    (cursorBefore view localContext focus).erase =
        (view.context.comp localContext).plug focus := by
          simpa [cursorBefore, Cursor.erase,
            SchedulerInvariant.contextOfParents] using
            RootResetRuntimeContextBridge.rebuild_frames_eq_contextOfParents_plug
              (view.context.comp localContext) focus []
    _ = view.context.plug (localContext.plug focus) :=
      Context.plug_comp view.context localContext focus
    _ = view.context.plug view.active := congrArg view.context.plug localSource
    _ = term := shape.source_eq

/-- The selected cursor carries exactly the role-prefix/local-suffix root
address. -/
@[simp]
theorem cursorBefore_address
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List RootResetReachableActiveContext.Role}
    {term : Term} {view : RootResetReachableActiveContext.View}
    (shape : RootResetReachableActiveContext.Describes
      program tree roles term view)
    (localContext : Context) (focus : Term) :
    RootResetSelectorContract.cursorAddress
        (cursorBefore view localContext focus) =
      wholeAddress view
        (RootResetSelectorContract.contextAddress localContext) := by
  have address := RootResetRuntimeContextBridge.cursorAddress_frames
    (view.context.comp localContext) focus []
  simpa [cursorBefore, wholeAddress,
    SchedulerInvariant.contextOfParents,
    RootResetSelectorContract.contextAddress,
    RootResetSelectorContract.contextAddress_comp,
    shape.contextAddress_eq] using address

/-- A successful focused root contraction is the literal cursor mutation to
the retained-parent target cursor. -/
@[simp]
theorem cursorBefore_rdx?
    (view : RootResetReachableActiveContext.View)
    (localContext : Context) (focus replacement : Term)
    (contracts : focus.contractRoot? = some replacement) :
    (cursorBefore view localContext focus).rdx? =
      some (cursorAfter view localContext focus replacement) := by
  simp [cursorBefore, cursorAfter, Cursor.rdx?, contracts]

/-- Erasing the post-contraction cursor reconstructs the expected whole
contractum. -/
@[simp]
theorem cursorAfter_erase
    (view : RootResetReachableActiveContext.View)
    (localContext : Context) (focus replacement : Term) :
    (cursorAfter view localContext focus replacement).erase =
      wholeTarget view (localContext.plug replacement) := by
  have framesEq := ContextCursor.frames_term_irrelevant
    (view.context.comp localContext) focus replacement []
  have rebuilt :=
    RootResetRuntimeContextBridge.rebuild_frames_eq_contextOfParents_plug
      (view.context.comp localContext) replacement []
  unfold cursorAfter Cursor.erase
  rw [framesEq]
  simpa [wholeTarget, SchedulerInvariant.contextOfParents,
    Context.plug_comp] using rebuilt

/-- A focused local root contraction lifts to the exact role-prefixed whole
address. -/
theorem lift_focused_contractAt?
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List RootResetReachableActiveContext.Role}
    {term : Term} {view : RootResetReachableActiveContext.View}
    (shape : RootResetReachableActiveContext.Describes
      program tree roles term view)
    (localContext : Context) (focus replacement : Term)
    (localSource : localContext.plug focus = view.active)
    (contracts : focus.contractRoot? = some replacement) :
    term.contractAt?
        (wholeAddress view
          (RootResetSelectorContract.contextAddress localContext)) =
      some (wholeTarget view (localContext.plug replacement)) := by
  have localContract :
      view.active.contractAt?
          (RootResetSelectorContract.contextAddress localContext) =
        some (localContext.plug replacement) := by
    rw [← localSource]
    rw [RootResetRuntimeContextBridge.contractAt?_contextAddress, contracts]
    rfl
  exact lift_contractAt? shape localContract

/-- The whole-term contraction, root-relative selected address, and
persistent-cursor mutation are one exact operation. -/
theorem focused_contraction_cursor_agreement
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List RootResetReachableActiveContext.Role}
    {term : Term} {view : RootResetReachableActiveContext.View}
    (shape : RootResetReachableActiveContext.Describes
      program tree roles term view)
    (localContext : Context) (focus replacement : Term)
    (localSource : localContext.plug focus = view.active)
    (contracts : focus.contractRoot? = some replacement) :
    let before := cursorBefore view localContext focus
    let after := cursorAfter view localContext focus replacement
    before.erase = term ∧
      SchedulerInvariant.contextOfParents before.parents =
        view.context.comp localContext ∧
      RootResetSelectorContract.cursorAddress before =
        wholeAddress view
          (RootResetSelectorContract.contextAddress localContext) ∧
      before.rdx? = some after ∧
      after.erase = wholeTarget view (localContext.plug replacement) ∧
      term.contractAt?
          (wholeAddress view
            (RootResetSelectorContract.contextAddress localContext)) =
        some after.erase := by
  dsimp only
  refine ⟨cursorBefore_erase shape localContext focus localSource,
    cursorBefore_parentContext view localContext focus,
    cursorBefore_address shape localContext focus,
    cursorBefore_rdx? view localContext focus replacement contracts,
    cursorAfter_erase view localContext focus replacement, ?_⟩
  rw [cursorAfter_erase]
  exact lift_focused_contractAt? shape localContext focus replacement
    localSource contracts

end PureSFormal.Research.RootResetPersistentSelectedAddressBridge
