import PureSFormal.Research.RootResetFinitePrioritySelector

/-! Exact successful runs propagate through the three priority passes into
the single contraction performed by the complete finite selector. -/
namespace PureSFormal.Research.RootResetFinitePriorityExecution
open PureSFormal.PureS
open FiniteController RootResetFinitePrioritySelector

theorem fresh_selected (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (ticks : Nat)
    (state : (RootResetFreshResponsePass.worker program layout.tree).Control) (endpoint after : Cursor)
    (execution : run (RootResetFreshResponsePass.probeSpec program layout.tree).machine ticks
      ⟨some (RootResetFreshResponsePass.probeSpec program layout.tree).start, Cursor.atRoot source⟩ = ⟨some state, endpoint⟩)
    (answered : (RootResetFreshResponsePass.probeSpec program layout.tree).answer state = some true)
    (contracted : endpoint.rdx? = some after) :
    selectStep? program layout source = some after.erase := by
  obtain ⟨used, _, actual⟩ := RootResetPriorityReplay.first_selected
    (RootResetFreshResponsePass.probeSpec program layout.tree) (laterSpec program layout)
    source ticks state endpoint execution answered
  exact selected_step program layout source used (.done true) endpoint after actual rfl contracted

theorem later_selected (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (freshTicks laterTicks : Nat)
    (freshState : (RootResetFreshResponsePass.worker program layout.tree).Control)
    (laterState : (RootResetPriorityReplay.worker (RootResetMarkedHandoffPass.probeSpec program layout.tree)
      (RootResetActiveEndpointProbe.probeSpec program layout)).Control)
    (middle endpoint after : Cursor)
    (freshRun : run (RootResetFreshResponsePass.probeSpec program layout.tree).machine freshTicks
      ⟨some (RootResetFreshResponsePass.probeSpec program layout.tree).start, Cursor.atRoot source⟩ = ⟨some freshState, middle⟩)
    (freshAnswer : (RootResetFreshResponsePass.probeSpec program layout.tree).answer freshState = some false)
    (laterRun : run (laterSpec program layout).machine laterTicks
      ⟨some (laterSpec program layout).start, Cursor.atRoot source⟩ = ⟨some laterState, endpoint⟩)
    (laterAnswer : (laterSpec program layout).answer laterState = some true)
    (contracted : endpoint.rdx? = some after) :
    selectStep? program layout source = some after.erase := by
  obtain ⟨used, actual⟩ := RootResetPriorityReplay.second_selected
    (RootResetFreshResponsePass.probeSpec program layout.tree) (laterSpec program layout)
    source freshTicks laterTicks freshState laterState middle endpoint freshRun freshAnswer laterRun laterAnswer
  exact selected_step program layout source used (.done true) endpoint after actual rfl contracted

theorem marked_selected (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (freshTicks markedTicks : Nat)
    (freshState : (RootResetFreshResponsePass.worker program layout.tree).Control)
    (markedState : (RootResetMarkedHandoffPass.worker program layout.tree).Control)
    (middle endpoint after : Cursor)
    (freshRun : run (RootResetFreshResponsePass.probeSpec program layout.tree).machine freshTicks
      ⟨some (RootResetFreshResponsePass.probeSpec program layout.tree).start, Cursor.atRoot source⟩ = ⟨some freshState, middle⟩)
    (freshAnswer : (RootResetFreshResponsePass.probeSpec program layout.tree).answer freshState = some false)
    (markedRun : run (RootResetMarkedHandoffPass.probeSpec program layout.tree).machine markedTicks
      ⟨some (RootResetMarkedHandoffPass.probeSpec program layout.tree).start, Cursor.atRoot source⟩ = ⟨some markedState, endpoint⟩)
    (markedAnswer : (RootResetMarkedHandoffPass.probeSpec program layout.tree).answer markedState = some true)
    (contracted : endpoint.rdx? = some after) :
    selectStep? program layout source = some after.erase := by
  obtain ⟨used, _, actual⟩ := RootResetPriorityReplay.first_selected
    (RootResetMarkedHandoffPass.probeSpec program layout.tree) (RootResetActiveEndpointProbe.probeSpec program layout)
    source markedTicks markedState endpoint markedRun markedAnswer
  exact later_selected program layout source freshTicks used freshState (.done true)
    middle endpoint after freshRun freshAnswer actual rfl contracted

theorem endpoint_selected (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (freshTicks markedTicks endpointTicks : Nat)
    (freshState : (RootResetFreshResponsePass.worker program layout.tree).Control)
    (markedState : (RootResetMarkedHandoffPass.worker program layout.tree).Control)
    (endpointState : (RootResetActiveEndpointProbe.worker program layout).Control)
    (freshMiddle markedMiddle endpoint after : Cursor)
    (freshRun : run (RootResetFreshResponsePass.probeSpec program layout.tree).machine freshTicks
      ⟨some (RootResetFreshResponsePass.probeSpec program layout.tree).start, Cursor.atRoot source⟩ = ⟨some freshState, freshMiddle⟩)
    (freshAnswer : (RootResetFreshResponsePass.probeSpec program layout.tree).answer freshState = some false)
    (markedRun : run (RootResetMarkedHandoffPass.probeSpec program layout.tree).machine markedTicks
      ⟨some (RootResetMarkedHandoffPass.probeSpec program layout.tree).start, Cursor.atRoot source⟩ = ⟨some markedState, markedMiddle⟩)
    (markedAnswer : (RootResetMarkedHandoffPass.probeSpec program layout.tree).answer markedState = some false)
    (endpointRun : run (RootResetActiveEndpointProbe.probeSpec program layout).machine endpointTicks
      ⟨some (RootResetActiveEndpointProbe.probeSpec program layout).start, Cursor.atRoot source⟩ = ⟨some endpointState, endpoint⟩)
    (endpointAnswer : (RootResetActiveEndpointProbe.probeSpec program layout).answer endpointState = some true)
    (contracted : endpoint.rdx? = some after) :
    selectStep? program layout source = some after.erase := by
  obtain ⟨used, actual⟩ := RootResetPriorityReplay.second_selected
    (RootResetMarkedHandoffPass.probeSpec program layout.tree) (RootResetActiveEndpointProbe.probeSpec program layout)
    source markedTicks endpointTicks markedState endpointState markedMiddle endpoint markedRun markedAnswer endpointRun endpointAnswer
  exact later_selected program layout source freshTicks used freshState (.done true)
    freshMiddle endpoint after freshRun freshAnswer actual rfl contracted

end PureSFormal.Research.RootResetFinitePriorityExecution
