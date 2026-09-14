import PureSFormal.Research.RootResetFreshResponsePass
import PureSFormal.Research.RootResetMarkedHandoffPass
import PureSFormal.Research.RootResetPriorityReplay

/-!
One fixed finite root-restarted selector: fresh-response priority, marked
handoff priority, and the active endpoint pass, with explicit root ascent
between declined passes. The final suffix performs one contraction or
certifies normality by a complete Euler search. This module closes its
all-input contract; every-sample CTS agreement is a separate obligation.
-/
namespace PureSFormal.Research.RootResetFinitePrioritySelector
set_option maxRecDepth 10000
set_option maxHeartbeats 1000000
open PureSFormal.PureS
open FiniteController RootResetSelectorContract

def laterSpec (program : CTS.Program) (layout : ActionDispatcher program) :=
  RootResetPriorityReplay.probeSpec (RootResetMarkedHandoffPass.probeSpec program layout.tree)
    (RootResetActiveEndpointProbe.probeSpec program layout)

def selectionSpec (program : CTS.Program) (layout : ActionDispatcher program) :=
  RootResetPriorityReplay.probeSpec (RootResetFreshResponsePass.probeSpec program layout.tree)
    (laterSpec program layout)

abbrev SelectionControl (program : CTS.Program) (layout : ActionDispatcher program) :=
  (RootResetPriorityReplay.worker (RootResetFreshResponsePass.probeSpec program layout.tree) (laterSpec program layout)).Control

def selectorContract (program : CTS.Program) (layout : ActionDispatcher program) : Contract :=
  RootResetReadonlySelector.selectorContract (selectionSpec program layout)

def selectStep? (program : CTS.Program) (layout : ActionDispatcher program) (source : Term) : Option Term :=
  RootResetReadonlySelector.selectStep? (selectionSpec program layout) source

theorem same_root_start (program : CTS.Program) (layout : ActionDispatcher program) (source : Term) :
    (selectorContract program layout).initial source =
      ⟨some (selectorContract program layout).start, Cursor.atRoot source⟩ := rfl

theorem all_input_linear (program : CTS.Program) (layout : ActionDispatcher program) (source : Term) :
    (selectorContract program layout).stoppingTime source ≤
      (selectorContract program layout).coefficient * (source.size + 1) :=
  (selectorContract program layout).stoppingTime_le source

theorem all_input_terminal (program : CTS.Program) (layout : ActionDispatcher program) (source : Term) :
    (runtimeHaltKind (selectorContract program layout).haltKind
      (run (selectorContract program layout).machine ((selectorContract program layout).stoppingTime source)
        ((selectorContract program layout).initial source)).control).isSome = true :=
  (selectorContract program layout).terminal source

theorem selected_step (program : CTS.Program) (layout : ActionDispatcher program) (source : Term)
    (ticks : Nat) (state : SelectionControl program layout) (endpoint after : Cursor)
    (execution : run (selectionSpec program layout).machine ticks
      ⟨some (selectionSpec program layout).start, Cursor.atRoot source⟩ = ⟨some state, endpoint⟩)
    (answered : (selectionSpec program layout).answer state = some true) (contracted : endpoint.rdx? = some after) :
    selectStep? program layout source = some after.erase :=
  RootResetReadonlySelector.selected_step (selectionSpec program layout) source ticks state endpoint after execution answered contracted

end PureSFormal.Research.RootResetFinitePrioritySelector
