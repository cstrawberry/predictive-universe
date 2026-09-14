import PureSFormal.Research.RootResetEmptyAwareResponseProbe
import PureSFormal.Research.RootResetCompletedResponseAgreement

/-! Exact forwarding laws for the EMPTY response. Ordinary chronology and
COMMIT witnesses are tied to real runs of the empty-aware pending worker. -/
namespace PureSFormal.Research.RootResetEmptyAwareResponseAgreement
open PureSFormal.PureS
open FiniteController RootResetProbeSequence RootResetCompletedResponseAtoms
open RootResetCompletedResponseAgreement RootResetEmptyAwareResponseProbe

theorem finish {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (fresh : view.status = .fresh)
    (origin endpoint : Cursor) (ready : Bool) (atSource : origin.focus = source)
    (selected : Executes (body program tree) origin ready endpoint) :
    Executes (worker program tree) origin ready endpoint :=
  branch_yes (guardWorker program tree) (body program tree) RootResetCompletedResponseProbe.rejectWorker
    (code_terminal _) (body_terminal program tree) origin endpoint ready (fresh_guard parsed fresh origin atSource) selected

theorem nonempty_forwarded {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (fresh : view.status = .fresh)
    (origin endpoint : Cursor) (ready : Bool) (atSource : origin.focus = source)
    (nonempty : Executes (RootResetCompletedResponseProbe.nonemptyWorker program tree) origin true origin)
    (selected : Executes (ordinary program tree) origin ready endpoint) :
    Executes (worker program tree) origin ready endpoint :=
  finish parsed fresh origin endpoint ready atSource
    (branch_yes (RootResetCompletedResponseProbe.nonemptyWorker program tree) (ordinary program tree) (emptyBody program tree)
      (RootResetCompletedResponseProbe.nonempty_terminal program tree) (RootResetCompletedResponseProbe.terminal program tree true)
      origin endpoint ready nonempty selected)

theorem ordinary_forwarded {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (fresh : view.status = .fresh)
    (origin endpoint : Cursor) (ready : Bool) (atSource : origin.focus = source)
    (boundary : RootResetCompleteCarrierRows.Boundary origin)
    (ordinaryOrigin : Executes (RootResetEmptyOriginProbe.worker program tree) origin false origin)
    (selected : Executes (ordinary program tree) origin ready endpoint) :
    Executes (worker program tree) origin ready endpoint := by
  obtain ⟨ticks, nonempty, state, bounded, actual, answered⟩ := RootResetCompletedResponseProbe.nonempty_at program tree origin boundary
  cases nonempty with
  | true => exact nonempty_forwarded parsed fresh origin endpoint ready atSource ⟨ticks, state, actual, answered⟩ selected
  | false =>
    have inner : Executes (emptyBody program tree) origin ready endpoint :=
      branch_no (RootResetEmptyOriginProbe.worker program tree) (commitWorker program tree) (ordinary program tree)
        (RootResetEmptyOriginProbe.terminal program tree) (RootResetCompletedResponseProbe.terminal program tree true)
        origin endpoint ready ordinaryOrigin selected
    exact finish parsed fresh origin endpoint ready atSource
      (branch_no (RootResetCompletedResponseProbe.nonemptyWorker program tree) (ordinary program tree) (emptyBody program tree)
        (RootResetCompletedResponseProbe.nonempty_terminal program tree) (empty_terminal program tree)
        origin endpoint ready ⟨ticks, state, actual, answered⟩ inner)

theorem commit_forwarded {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (fresh : view.status = .fresh)
    (origin endpoint : Cursor) (atSource : origin.focus = source)
    (boundary : RootResetCompleteCarrierRows.Boundary origin)
    (selected : Executes (ordinary program tree) origin true endpoint)
    (committed : Executes (commitWorker program tree) origin true endpoint) :
    Executes (worker program tree) origin true endpoint := by
  obtain ⟨ticks, emptyOrigin, state, bounded, actual, answered⟩ := RootResetEmptyOriginProbe.all_input program tree origin boundary
  cases emptyOrigin with
  | false => exact ordinary_forwarded parsed fresh origin endpoint true atSource boundary ⟨ticks, state, actual, answered⟩ selected
  | true =>
    obtain ⟨n, nonempty, ns, nb, nr, na⟩ := RootResetCompletedResponseProbe.nonempty_at program tree origin boundary
    cases nonempty with
    | true => exact nonempty_forwarded parsed fresh origin endpoint true atSource ⟨n, ns, nr, na⟩ selected
    | false =>
      have inner : Executes (emptyBody program tree) origin true endpoint :=
        branch_yes (RootResetEmptyOriginProbe.worker program tree) (commitWorker program tree) (ordinary program tree)
          (RootResetEmptyOriginProbe.terminal program tree) (code_terminal _) origin endpoint true ⟨ticks, state, actual, answered⟩ committed
      exact finish parsed fresh origin endpoint true atSource
        (branch_no (RootResetCompletedResponseProbe.nonemptyWorker program tree) (ordinary program tree) (emptyBody program tree)
          (RootResetCompletedResponseProbe.nonempty_terminal program tree) (empty_terminal program tree)
          origin endpoint true ⟨n, ns, nr, na⟩ inner)

theorem empty_commit {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (fresh : view.status = .fresh)
    (origin endpoint : Cursor) (atSource : origin.focus = source)
    (empty : Executes (RootResetCompletedResponseProbe.nonemptyWorker program tree) origin false origin)
    (emptyOrigin : Executes (RootResetEmptyOriginProbe.worker program tree) origin true origin)
    (committed : Executes (commitWorker program tree) origin true endpoint) :
    Executes (worker program tree) origin true endpoint :=
  finish parsed fresh origin endpoint true atSource
    (branch_no (RootResetCompletedResponseProbe.nonemptyWorker program tree) (ordinary program tree) (emptyBody program tree)
      (RootResetCompletedResponseProbe.nonempty_terminal program tree) (empty_terminal program tree) origin endpoint true empty
      (branch_yes (RootResetEmptyOriginProbe.worker program tree) (commitWorker program tree) (ordinary program tree)
        (RootResetEmptyOriginProbe.terminal program tree) (code_terminal _) origin endpoint true emptyOrigin committed))

end PureSFormal.Research.RootResetEmptyAwareResponseAgreement
