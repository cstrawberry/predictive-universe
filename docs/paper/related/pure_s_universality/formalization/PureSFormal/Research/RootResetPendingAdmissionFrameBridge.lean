import PureSFormal.Research.RootResetPendingAdmissionSegment
import PureSFormal.Research.RootResetNestedFrameCost

/-! Proof-only identification of the exact FRAME pending layers consumed by the
finite admission segment. Runtime remains the fixed segment controller. -/
namespace PureSFormal.Research.RootResetPendingAdmissionFrameBridge
open PureSFormal.PureS
open FiniteController RootResetPendingAdmissionInterleaved
open RootResetFrameSpineWalker (Layer wrap spineParents)

theorem terminal_layers {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor} {entry : Entry}
    (peels : RootResetPendingAdmissionSegment.Peels program tree origin entry endpoint) :
    ∃ layers : List Layer, ∃ terminal : Cursor,
      origin.focus = wrap layers terminal.focus ∧
      terminal.parents = spineParents layers origin.parents ∧
      entry ≠ .pending ∧ Outcome program tree terminal entry endpoint ∧
      ∃ ticks, run (RootResetPendingAdmissionSegment.base program tree) ticks
        (RootResetPendingAdmissionSegment.initial program tree terminal) = ⟨some (.done entry), endpoint⟩ := by
  induction peels with
  | done origin entry after yielded outcome reference => exact ⟨[], origin, rfl, rfl, yielded, outcome, reference⟩
  | pending origin payload continuation child shape admitted reference rest ih =>
      obtain ⟨layers, terminal, wrapped, parents, yielded, outcome, reference⟩ := ih
      let field := Term.app (.app .s (actCode (compileActions program tree))) (.app .s payload)
      refine ⟨(field, continuation) :: layers, terminal, ?_, parents, yielded, outcome, reference⟩
      rw [shape]
      change Term.app (.app _ _) child = Term.app (.app _ _) (wrap layers terminal.focus)
      change child = wrap layers terminal.focus at wrapped
      rw [wrapped]
      rfl

theorem completedLocal_terminal {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor}
    (peels : RootResetPendingAdmissionSegment.Peels program tree origin .completedLocal endpoint) :
    ∃ layers : List Layer, ∃ terminal : Cursor, ∃ view : CheckpointDecoder.LocalView program,
      origin.focus = wrap layers terminal.focus ∧
      terminal.parents = spineParents layers origin.parents ∧
      CheckpointDecoder.parseLocal? program tree terminal.focus = some view ∧
      ∃ left audit, terminal.focus = .app left (.app view.continuation audit) ∧
        endpoint = ⟨view.continuation, .left audit :: .right left :: terminal.parents⟩ := by
  obtain ⟨layers, terminal, wrapped, parents, yielded, outcome, reference⟩ := terminal_layers peels
  cases outcome with
  | completedLocal refused admitted => cases admitted with
    | entered view parsed left audit shape => exact ⟨layers, terminal, view, wrapped, parents, parsed, left, audit, shape, rfl⟩

theorem completedLocal_gap {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor}
    (peels : RootResetPendingAdmissionSegment.Peels program tree origin .completedLocal endpoint) :
    endpoint.focus.size < origin.focus.size := by
  obtain ⟨layers, terminal, view, wrapped, parents, parsed, left, audit, shape, endpointEq⟩ := completedLocal_terminal peels
  rw [endpointEq, wrapped]
  exact Nat.lt_of_lt_of_le (RootResetMixedLocalAmortized.continuation_gap parsed)
    (Nat.le_trans (Nat.le_add_left _ _) (RootResetNestedFrameCost.wrapper_size layers terminal.focus))

theorem completedLocal_boundary {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor}
    (peels : RootResetPendingAdmissionSegment.Peels program tree origin .completedLocal endpoint) :
    RootResetNestedFramePatterns.rightParent? endpoint = false := by
  obtain ⟨layers, terminal, view, wrapped, parents, parsed, left, audit, shape, endpointEq⟩ := completedLocal_terminal peels
  rw [endpointEq]
  rfl

end PureSFormal.Research.RootResetPendingAdmissionFrameBridge
