import PureSFormal.Research.RootResetHistoricalPriorityRejection
import PureSFormal.Research.RootResetBaseEndpointExecution

/-! Exact initial Base selections by the complete finite selector. -/
namespace PureSFormal.Research.RootResetFiniteBaseAgreement
open PureSFormal.PureS
open FiniteController RootResetActivePendingAgreement

theorem noLocal_rejects {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (status : CheckpointDecoder.HaltStatus) {source : Term}
    (refused : CheckpointDecoder.parseLocal? program tree source = none) :
    RootResetCompletedLocalPatterns.accepts status program tree source = false := by
  cases accepted : RootResetCompletedLocalPatterns.accepts status program tree source with
  | false => rfl
  | true =>
      obtain ⟨view, _, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse status program tree source).mp accepted
      rw [refused] at parsed
      cases parsed

theorem base_clear (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (horizon remaining : Nat) (bits : List Bool) (queue beta : Term) :
    let source := MutableBase.base (compileActions program tree) bits
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program tree) bits)) queue beta
    RootResetFreshHistoryRejection.Clear program tree source ∧ RootResetHistoricalPriorityRejection.Clear program tree source := by
  dsimp only
  have noLocal := RootResetActiveBaseAgreement.base_noLocal program tree bits
    (Dovetail.clockExit horizon remaining (environmentCode (compileActions program tree) bits)) queue beta
  refine ⟨⟨noLocal_rejects .fresh noLocal, ?_⟩, ⟨noLocal_rejects .marked noLocal, ?_⟩⟩
  · intro audit
    cases remaining with
    | zero => exact RootResetFreshAncestorExitAgreement.fresh_rejects_arity (by change 7 ≠ 6; decide)
    | succ remaining =>
        cases accepted : RootResetCompletedLocalPatterns.accepts .fresh program tree
            (.app (MutableBase.base (compileActions program tree) bits
              (Dovetail.clockExit horizon (remaining + 1) (environmentCode (compileActions program tree) bits)) queue beta) audit) with
        | false => rfl
        | true =>
            obtain ⟨view, fresh, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program tree _).mp accepted
            obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, shape⟩ := CheckpointDecoder.parseLocal?_sound parsed
            rw [fresh] at haltShape
            cases haltShape with
            | fresh fieldAudit =>
                have fields := (Term.app.inj (Term.app.inj (Term.app.inj shape).1).1).1
                have impossible := (Term.app.inj (Term.app.inj (Term.app.inj fields).1).1).2
                change C horizon = .s at impossible
                cases horizon <;> cases impossible
  · intro audit
    apply RootResetMarkedHandoffAgreement.marked_rejects_arity
    cases remaining
    · change 7 ≠ 5; decide
    · change 6 ≠ 5; decide

theorem pending_clear (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (payload next carrier : Term) :
    let source := frame (CheckpointDecoder.openEnvironment (compileActions program tree) payload) next carrier
    RootResetFreshHistoryRejection.Clear program tree source ∧ RootResetHistoricalPriorityRejection.Clear program tree source := by
  dsimp only
  refine ⟨⟨RootResetFreshAncestorExitAgreement.fresh_rejects_arity (by change 3 ≠ 6; decide), ?_⟩,
    ⟨RootResetMarkedHandoffAgreement.marked_rejects_arity (by change 3 ≠ 5; decide), ?_⟩⟩
  · intro audit
    exact RootResetFreshAncestorExitAgreement.fresh_rejects_arity (by change 4 ≠ 6; decide)
  · intro audit
    exact RootResetMarkedHandoffAgreement.marked_rejects_arity (by change 4 ≠ 5; decide)

theorem pending_priorities_declined {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (horizon remaining : Nat) (bits : List Bool) (queue beta payload next : Term) (layers : List Layer) :
    let carrier := MutableBase.base (compileActions program layout.tree) bits
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits)) queue beta
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
      (frame (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next carrier))
    (∃ ticks candidate, run (RootResetFreshResponsePass.worker program layout.tree).machine ticks
      ((RootResetFreshResponsePass.worker program layout.tree).initial (Cursor.atRoot source)) = ⟨some (.done false), candidate⟩) ∧
    (∃ ticks candidate, run (RootResetMarkedHandoffPass.worker program layout.tree).machine ticks
      ((RootResetMarkedHandoffPass.worker program layout.tree).initial (Cursor.atRoot source)) = ⟨some (.done false), candidate⟩) := by
  dsimp only
  obtain ⟨ticks, bound, actual⟩ := RootResetActiveBaseAgreement.cleanParents_pending_base_stops outer horizon remaining bits queue beta payload next layers
  have clear := pending_clear program layout.tree payload next
    (MutableBase.base (compileActions program layout.tree) bits
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits)) queue beta)
  exact RootResetHistoricalPriorityRejection.preceding_passes_declined outer layers _ clear.1 clear.2 ticks false actual

theorem repeated_priorities_declined {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (horizon remaining : Nat) (bits : List Bool) (queue beta : Term) (count : Nat) :
    let environment := environmentCode (compileActions program layout.tree) bits
    let continuation := Dovetail.clockExit horizon remaining environment
    let source := (Cursor.mk (MutableBase.base (compileActions program layout.tree) bits continuation queue beta)
      (PrimitiveFuel.pendingParents environment continuation count parents)).erase
    (∃ ticks candidate, run (RootResetFreshResponsePass.worker program layout.tree).machine ticks
      ((RootResetFreshResponsePass.worker program layout.tree).initial (Cursor.atRoot source)) = ⟨some (.done false), candidate⟩) ∧
    (∃ ticks candidate, run (RootResetMarkedHandoffPass.worker program layout.tree).machine ticks
      ((RootResetMarkedHandoffPass.worker program layout.tree).initial (Cursor.atRoot source)) = ⟨some (.done false), candidate⟩) := by
  dsimp only
  cases count with
  | zero =>
      obtain ⟨innerTicks, innerRun⟩ := RootResetActiveBaseAgreement.base_stops program layout.tree horizon remaining bits queue beta parents
        (RootResetActiveCleanParentsAgreement.parents_boundary outer _)
      obtain ⟨ticks, bound, actual⟩ := RootResetActiveCleanParentsAgreement.cleanParents_terminal outer _ innerTicks false _ innerRun
      have clear := base_clear program layout.tree horizon remaining bits queue beta
      exact RootResetHistoricalPriorityRejection.preceding_passes_declined outer [] _ clear.1 clear.2 ticks false actual
  | succ count =>
      have wholeEq := RootResetBaseEndpointExecution.rebuild_repeated_succ (compileActions program layout.tree) (word bits)
        (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
        (MutableBase.base (compileActions program layout.tree) bits
          (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits)) queue beta) count parents
      change Cursor.rebuild _ _ = _ at wholeEq
      rw [CheckpointDecoder.openEnvironment_word] at wholeEq
      simp only [Cursor.erase]
      rw [wholeEq]
      exact pending_priorities_declined outer horizon remaining bits queue beta (word bits)
        (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
        (List.replicate count (word bits, Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits)))

theorem appender_focus (suffix : List Bool) (initial : Term) (parents : List ParentFrame) :
    ∃ innerParents, RootResetEdgeFragment.follow (List.replicate suffix.length Direction.right)
      ⟨appenderAccumulator suffix initial, parents⟩ = some ⟨initial, innerParents⟩ ∧
      ∀ replacement, Cursor.rebuild innerParents replacement = Cursor.rebuild parents (appenderAccumulator suffix replacement) := by
  induction suffix generalizing initial parents with
  | nil => exact ⟨parents, rfl, fun _ => rfl⟩
  | cons bit suffix ih =>
      obtain ⟨innerParents, followed, rebuilt⟩ := ih (.app (live bit) initial) parents
      refine ⟨.right (live bit) :: innerParents, ?_, ?_⟩
      · change RootResetEdgeFragment.follow (List.replicate (suffix.length + 1) Direction.right)
          ⟨appenderAccumulator suffix (.app (live bit) initial), parents⟩ = _
        rw [List.replicate_succ', RootResetInverseEdgeFragment.follow_append, followed]
        rfl
      · intro replacement
        exact rebuilt (.app (live bit) replacement)

theorem initial_firstC4_contract (actions : Term) (bit : Bool) (suffix : List Bool) (continuation : Term)
    (parents : List ParentFrame) (endpoint : Cursor)
    (followed : RootResetEdgeFragment.follow (BasePath.wordAddress ++ List.replicate suffix.length Direction.right)
      ⟨baseCarrier (environmentCode actions (bit :: suffix)) continuation, parents⟩ = some endpoint) :
    ∃ after, endpoint.rdx? = some after ∧
      after.erase = Cursor.rebuild parents (RootResetResponseCarrierChronology.firstCarrier actions bit suffix continuation) := by
  let environment := environmentCode actions (bit :: suffix)
  let queueParents : List ParentFrame := [.right .s, .right (.app .s (actCode actions)), .right .s,
    .left (.app b environment), .left continuation, .right continuation, .left (baseBeta environment continuation)] ++ parents
  have prefixRun : RootResetEdgeFragment.follow BasePath.wordAddress
      ⟨baseCarrier environment continuation, parents⟩ = some ⟨word (bit :: suffix), queueParents⟩ := rfl
  obtain ⟨innerParents, wordRun, replacement⟩ := appender_focus suffix (.app (live bit) omega) queueParents
  have actual : RootResetEdgeFragment.follow (BasePath.wordAddress ++ List.replicate suffix.length Direction.right)
      ⟨baseCarrier environment continuation, parents⟩ = some ⟨.app (live bit) omega, innerParents⟩ := by
    rw [RootResetInverseEdgeFragment.follow_append, prefixRun]
    exact wordRun
  have same := Option.some.inj (followed.symm.trans actual)
  subst endpoint
  refine ⟨⟨Carrier.tombstone bit omega omega, innerParents⟩, rfl, ?_⟩
  change Cursor.rebuild innerParents (Carrier.tombstone bit omega omega) = _
  rw [replacement]
  rfl

theorem repeated_initial_firstC4 {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (horizon remaining : Nat) (bit : Bool) (suffix : List Bool) (count : Nat) :
    let actions := compileActions program layout.tree
    let environment := environmentCode actions (bit :: suffix)
    let continuation := Dovetail.clockExit horizon remaining environment
    let innerParents := PrimitiveFuel.pendingParents environment continuation count parents
    RootResetFinitePrioritySelector.selectStep? program layout
      (Cursor.rebuild innerParents (baseCarrier environment continuation)) =
        some (Cursor.rebuild innerParents (RootResetResponseCarrierChronology.firstCarrier actions bit suffix continuation)) := by
  dsimp only
  obtain ⟨⟨f, fc, fr⟩, ⟨m, mc, mr⟩⟩ := repeated_priorities_declined outer horizon remaining (bit :: suffix) (word (bit :: suffix))
    (baseBeta (environmentCode (compileActions program layout.tree) (bit :: suffix))
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) (bit :: suffix)))) count
  obtain ⟨ticks, endpoint, bound, execution, followed⟩ := RootResetBaseEndpointExecution.repeated_initial_firstC4 outer horizon remaining bit suffix count
  obtain ⟨after, contracted, rebuilt⟩ := initial_firstC4_contract (compileActions program layout.tree) bit suffix _ _ endpoint followed
  rw [← rebuilt]
  exact RootResetFinitePriorityExecution.endpoint_selected program layout _ f m ticks (.done false) (.done false) (.done true)
    fc mc endpoint after fr rfl mr rfl execution rfl contracted

theorem fuelTerminal_firstC4 {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (registers : SchedulerControl.Registers program) (horizon remaining : Nat)
    (bit : Bool) (suffix : List Bool) (fuel depth : Nat) :
    let environment := environmentCode (compileActions program layout.tree) (bit :: suffix)
    let continuation := RootResetEmptyHandoffContext.exitTerm program layout horizon remaining (bit :: suffix)
    let origin := (SchedulerNestedPhase.fuelTerminalConfigurationAt program layout (bit :: suffix) registers continuation parents fuel depth).cursor
    RootResetFinitePrioritySelector.selectStep? program layout origin.erase =
      some (Cursor.rebuild origin.parents (RootResetResponseCarrierChronology.firstCarrier (compileActions program layout.tree) bit suffix continuation)) :=
  repeated_initial_firstC4 outer horizon remaining bit suffix (SchedulerInvariant.fuelSampleEndDepth depth fuel)

theorem repeated_post_firstC4_handoff {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (horizon remaining : Nat) (bit : Bool) (suffix : List Bool) (count : Nat) :
    let actions := compileActions program layout.tree
    let environment := environmentCode actions (bit :: suffix)
    let continuation := Dovetail.clockExit horizon remaining environment
    let carrier := RootResetResponseCarrierChronology.firstCarrier actions bit suffix continuation
    RootResetFinitePrioritySelector.selectStep? program layout
      (Cursor.rebuild (PrimitiveFuel.pendingParents environment continuation (count + 1) parents) carrier) =
        some (Cursor.rebuild (PrimitiveFuel.pendingParents environment continuation count parents)
          (.app (.app (dispatcherCode actions (bit :: suffix)) carrier) (.app continuation carrier))) := by
  dsimp only
  obtain ⟨⟨f, fc, fr⟩, ⟨m, mc, mr⟩⟩ := repeated_priorities_declined outer horizon remaining (bit :: suffix)
    (appenderAccumulator suffix (Carrier.tombstone bit omega omega))
    (baseBeta (environmentCode (compileActions program layout.tree) (bit :: suffix))
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) (bit :: suffix)))) (count + 1)
  obtain ⟨ticks, bound, execution⟩ := RootResetBaseEndpointExecution.repeated_post_firstC4_handoff outer horizon remaining bit suffix count
  exact RootResetFinitePriorityExecution.endpoint_selected program layout _ f m ticks (.done false) (.done false) (.done true)
    fc mc _ _ fr rfl mr rfl execution rfl rfl

theorem fifth_empty_handoff {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (registers : SchedulerControl.Registers program) (horizon remaining count : Nat) :
    let actions := compileActions program layout.tree
    let environment := environmentCode actions []
    let continuation := Dovetail.clockExit horizon remaining environment
    let origin := (SchedulerInvariant.fuelZeroFifthMutationConfiguration program layout registers environment continuation
      (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)).cursor
    let carrier := baseCarrier environment continuation
    RootResetFinitePrioritySelector.selectStep? program layout origin.erase =
      some (Cursor.rebuild (PrimitiveFuel.pendingParents environment continuation count parents)
        (.app (.app (dispatcherCode actions []) carrier) (.app continuation carrier))) := by
  dsimp only
  obtain ⟨⟨f, fc, fr⟩, ⟨m, mc, mr⟩⟩ := repeated_priorities_declined outer horizon remaining [] omega
    (baseBeta (environmentCode (compileActions program layout.tree) [])
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) []))) (count + 1)
  obtain ⟨ticks, bound, execution⟩ := RootResetBaseEndpointExecution.fifth_empty_handoff outer registers horizon remaining count
  exact RootResetFinitePriorityExecution.endpoint_selected program layout _ f m ticks (.done false) (.done false) (.done true)
    fc mc _ _ fr rfl mr rfl execution rfl rfl

end PureSFormal.Research.RootResetFiniteBaseAgreement
