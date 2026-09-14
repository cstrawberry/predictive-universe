import PureSFormal.Research.RootResetFinitePriorityExecution
import PureSFormal.Research.RootResetFreshHistoryRejection

/-! Closed exact contractions of the composed finite priority selector. -/
namespace PureSFormal.Research.RootResetFinitePriorityAgreement
open PureSFormal.PureS
open FiniteController RootResetActivePendingAgreement
open RootResetEmptyHandoffContext (exitTerm)

theorem marked_handoff {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (outerPending : List Layer) (payload next : Term)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits exitBits : List Bool)
    (carrier : Term) (horizon remaining : Nat) :
    let actions := compileActions program layout.tree
    let body := LocalResponse.markedCompleted bits (exitTerm program layout horizon remaining exitBits) carrier
      (SchedulerResponse.completedRoute program layout registers bit carrier)
    let source := Cursor.rebuild parents (wrap actions (outerPending ++ [(payload, next)]) body)
    RootResetFinitePrioritySelector.selectStep? program layout source =
      some (Cursor.rebuild (parentsAfter actions outerPending parents)
        (.app (.app (.app (.app .s (actCode actions)) (.app .s payload)) body) (.app next body))) := by
  dsimp only
  obtain ⟨freshTicks, middle, freshRun⟩ := RootResetFreshHistoryRejection.pendingMarked_rejected outer
    (outerPending ++ [(payload, next)]) registers bit bits exitBits carrier horizon remaining
  obtain ⟨markedTicks, bound, markedRun⟩ := RootResetMarkedHandoffAgreement.pendingMarked_handoff outer
    outerPending payload next registers bit bits exitBits carrier horizon remaining
  exact RootResetFinitePriorityExecution.marked_selected program layout _ freshTicks markedTicks
    (.done false) (.done true) middle _ _ freshRun rfl markedRun rfl rfl

end PureSFormal.Research.RootResetFinitePriorityAgreement
