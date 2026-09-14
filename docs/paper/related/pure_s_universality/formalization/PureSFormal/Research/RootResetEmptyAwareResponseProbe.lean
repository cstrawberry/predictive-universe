import PureSFormal.Research.RootResetCompletedResponseProbe
import PureSFormal.Research.RootResetEmptyOriginProbe

/-! Pending completed responses distinguish absorbing EMPTY origins before
the ordinary chronology test. The additional query is gated by an empty
accumulator; nonempty responses keep the ordinary C4/handoff decision. -/
namespace PureSFormal.Research.RootResetEmptyAwareResponseProbe
open PureSFormal.PureS
open FiniteController RootResetProbeSequence RootResetProbeBranch RootResetCompletedResponseAtoms

abbrev ordinary (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetCompletedResponseProbe.worker program tree true

def emptyBody (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetProbeBranch.worker (RootResetEmptyOriginProbe.worker program tree) (commitWorker program tree) (ordinary program tree)

def body (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetProbeBranch.worker (RootResetCompletedResponseProbe.nonemptyWorker program tree)
    (ordinary program tree) (emptyBody program tree)

def worker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetProbeBranch.worker (guardWorker program tree) (body program tree) RootResetCompletedResponseProbe.rejectWorker

def emptyCoefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetEmptyOriginProbe.coefficient program tree + commitBound program tree + RootResetCompletedResponseProbe.coefficient program tree true + 2

def bodyCoefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetCarrierNonemptyProbe.coefficient program tree + RootResetCompletedResponseProbe.coefficient program tree true + emptyCoefficient program tree + 2

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  guardBound program tree + bodyCoefficient program tree + 0 + 2

theorem empty_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (emptyBody program tree).Terminal := RootResetProbeBranch.terminal _ _ _

theorem body_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (body program tree).Terminal := RootResetProbeBranch.terminal _ _ _

theorem terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (worker program tree).Terminal := RootResetProbeBranch.terminal _ _ _

theorem restoring (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    RestoringAt (worker program tree) (coefficient program tree) origin := by
  have ordinaryRestores : RestoringAt (ordinary program tree) (RootResetCompletedResponseProbe.coefficient program tree true) origin := by
    obtain ⟨ticks, ready, endpoint, bounded, actual, facts⟩ := RootResetCompletedResponseProbe.all_input program tree true origin boundary
    exact ⟨ticks, ready, endpoint, .done ready, bounded, actual, rfl, facts⟩
  have emptyRestores : RestoringAt (emptyBody program tree) (emptyCoefficient program tree) origin :=
    RootResetProbeBranch.restoring_at (RootResetEmptyOriginProbe.worker program tree) (commitWorker program tree) (ordinary program tree)
      (RootResetEmptyOriginProbe.coefficient program tree) (commitBound program tree) (RootResetCompletedResponseProbe.coefficient program tree true)
      (RootResetEmptyOriginProbe.terminal program tree) (code_terminal _) (RootResetCompletedResponseProbe.terminal program tree true) origin
      (RootResetEmptyOriginProbe.all_input program tree origin boundary) (RootResetCompletedResponseProbe.commit_at program tree origin) ordinaryRestores
  have bodyRestores : RestoringAt (body program tree) (bodyCoefficient program tree) origin :=
    RootResetProbeBranch.restoring_at (RootResetCompletedResponseProbe.nonemptyWorker program tree) (ordinary program tree) (emptyBody program tree)
      (RootResetCarrierNonemptyProbe.coefficient program tree) (RootResetCompletedResponseProbe.coefficient program tree true) (emptyCoefficient program tree)
      (RootResetCompletedResponseProbe.nonempty_terminal program tree) (RootResetCompletedResponseProbe.terminal program tree true) (empty_terminal program tree) origin
      (RootResetCompletedResponseProbe.nonempty_at program tree origin boundary) ordinaryRestores emptyRestores
  exact RootResetProbeBranch.restoring_at (guardWorker program tree) (body program tree) RootResetCompletedResponseProbe.rejectWorker
    (guardBound program tree) (bodyCoefficient program tree) 0 (code_terminal _) (body_terminal program tree) (code_terminal _) origin
    (RootResetCompletedResponseProbe.guard_at program tree origin) bodyRestores (RootResetCompletedResponseProbe.reject_at origin)

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks ready endpoint, ticks ≤ coefficient program tree * origin.erase.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial origin) = ⟨some (.done ready), endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) := by
  obtain ⟨ticks, ready, endpoint, state, bounded, actual, answered, facts⟩ := restoring program tree origin boundary
  cases state with
  | testing _ | positive _ | negative _ => cases answered
  | done result =>
      have same := Option.some.inj answered
      subst result
      exact ⟨ticks, ready, endpoint, bounded, actual, facts⟩

theorem readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (worker program tree).ReadOnly :=
  RootResetProbeBranch.readOnly _ _ _ (guard_readOnly program tree)
    (RootResetProbeBranch.readOnly _ _ _ (RootResetCompletedResponseProbe.nonempty_readOnly program tree)
      (RootResetCompletedResponseProbe.readOnly program tree true)
      (RootResetProbeBranch.readOnly _ _ _ (RootResetEmptyOriginProbe.readOnly program tree)
        (commit_readOnly program tree) (RootResetCompletedResponseProbe.readOnly program tree true)))
    (code_readOnly _ True.intro)

end PureSFormal.Research.RootResetEmptyAwareResponseProbe
