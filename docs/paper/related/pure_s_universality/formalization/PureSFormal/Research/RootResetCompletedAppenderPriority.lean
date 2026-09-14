import PureSFormal.Research.RootResetPersistentResponseSelector

namespace PureSFormal.Research.RootResetCompletedAppenderPriority

open PureSFormal.PureS
open RootResetWholeAppenderStages
open RootResetAppenderStages

/-- A nonfinal Push row cannot be a completed action, independently of the
opaque accumulator and history fields. -/
theorem actionParser_nonfinal_row_none
    (program : CTS.Program) (label : ActionLabel program) (row : Row)
    (nonfinal : row.stage ≠ .secondFinal) :
    ActionParser.parse program label row.term = none := by
  cases row with
  | first position bit rest accumulator duplicate histories =>
      rw [ActionParser.parse, Row.term, Term.spineArgs_applyArgs]
      simp [firstRow, ActionParser.parseSpine?, SchedulerResponseInvariant.ActionMutation.appender_ne_b]
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      rw [ActionParser.parse, Row.term, Term.spineArgs_applyArgs]
      simp [secondRow, ActionParser.parseSpine?, appender_cons, push, p, b,
        SchedulerResponseInvariant.ActionMutation.appender_ne_s]
  | secondFinal position bit accumulator currentHistory histories =>
      exact False.elim (nonfinal rfl)

/-- Completed-Local and nonfinal-appender parsing are structurally disjoint. -/
theorem parseLocal_none_of_nonfinalAppender
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ActiveView program}
    (parsed : parseActive? program tree term = some view)
    (nonfinal : view.row.stage ≠ .secondFinal) :
    CheckpointDecoder.parseLocal? program tree term = none := by
  rcases (parseActive?_sound parsed).source_eq with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, route, sourceEq⟩
  have detailed := DispatchParser.parseRouteDetailed_complete route
  have dispatchNone : DispatchParser.parse program tree dispatcher = none := by
    rw [DispatchParser.parse, detailed]
    dsimp only
    rw [actionParser_nonfinal_row_none program view.label view.row nonfinal]
  rw [sourceEq]
  cases halt with
  | fresh audit =>
      simp [CheckpointDecoder.openShell, CheckpointDecoder.parseLocal?,
        CheckpointDecoder.checkHalt?, freshHField, haltCode, b, dispatchNone]

/-- Any appender view overlapping a completed Local is necessarily final. -/
theorem completedAppender_stage_final
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ActiveView program} {localView : CheckpointDecoder.LocalView program}
    (parsed : parseActive? program tree term = some view)
    (localParsed : CheckpointDecoder.parseLocal? program tree term = some localView) :
    view.row.stage = .secondFinal := by
  cases stageEq : view.row.stage with
  | first =>
      have rejected := parseLocal_none_of_nonfinalAppender parsed (by rw [stageEq]; decide)
      rw [localParsed] at rejected
      contradiction
  | secondNonfinal =>
      have rejected := parseLocal_none_of_nonfinalAppender parsed (by rw [stageEq]; decide)
      rw [localParsed] at rejected
      contradiction
  | secondFinal => rfl

/-- The apparent next-Push focus in a completed Local is noncontractible. -/
theorem completedAppender_focus_contract_none
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ActiveView program} {localView : CheckpointDecoder.LocalView program}
    (parsed : parseActive? program tree term = some view)
    (localParsed : CheckpointDecoder.parseLocal? program tree term = some localView) :
    term.contractAt? view.focusAddress = none := by
  have finalRow := completedAppender_stage_final parsed localParsed
  have focus := (parseActive?_sound parsed).focus_subterm
  cases rowEq : view.row with
  | first position bit rest accumulator duplicate histories =>
      simp [rowEq, Row.stage] at finalRow
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      simp [rowEq, Row.stage] at finalRow
  | secondFinal position bit accumulator currentHistory histories =>
      rw [rowEq] at focus
      unfold Term.contractAt?
      rw [focus]
      rfl


open RootResetPersistentResponseSelector

/-- Completion makes the registered Push focus noncontractible even below an
arbitrary literal outer address. -/
theorem completedAppender_prefixed_contract_none
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {whole term : Term} {outerAddress : Address}
    {view : ActiveView program} {localView : CheckpointDecoder.LocalView program}
    (found : whole.subterm? outerAddress = some term)
    (parsed : parseActive? program tree term = some view)
    (localParsed : CheckpointDecoder.parseLocal? program tree term = some localView) :
    whole.contractAt? (outerAddress ++ view.focusAddress) = none := by
  have finalRow := completedAppender_stage_final parsed localParsed
  have focus := (parseActive?_sound parsed).focus_subterm
  have wholeFocus : whole.subterm? (outerAddress ++ view.focusAddress) = some view.row.focus := by
    rw [CarrierDecoder.subterm?_append, found]
    exact focus
  cases rowEq : view.row with
  | first position bit rest accumulator duplicate histories =>
      simp [rowEq, Row.stage] at finalRow
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      simp [rowEq, Row.stage] at finalRow
  | secondFinal position bit accumulator currentHistory histories =>
      rw [rowEq] at wholeFocus
      unfold Term.contractAt?
      rw [wholeFocus]
      rfl

theorem responseAppenderSelection_none_of_completed_noPending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (whole term : Term) (outerAddress : Address)
    (root : freshResponseRoot? program dispatcher whole = some (outerAddress, term))
    (found : whole.subterm? outerAddress = some term)
    (localView : CheckpointDecoder.LocalView program)
    (localParsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some localView)
    (pendingZero : pendingBeforeFresh?
      (RootResetPersistentRouteA.activeContext program dispatcher whole).roles = some 0)
    (noBaseFinal : ∀ view : RootResetWholeAppenderStages.View program,
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).route.endpoint =
        some (.registered (.appender view)) → view.stage ≠ .secondFinal) :
    responseAppenderSelection? program dispatcher whole = none := by
  unfold responseAppenderSelection? responseAppenderAddress?
  rw [root]
  dsimp only [Option.bind]
  cases parsed : RootResetWholeAppenderStages.parseActive? program dispatcher.tree term with
  | none => rfl
  | some view =>
      have finalRow := completedAppender_stage_final parsed localParsed
      have rejected := completedAppender_prefixed_contract_none found parsed localParsed
      cases rowEq : view.row with
      | first position bit rest accumulator duplicate histories =>
          simp [rowEq, Row.stage] at finalRow
      | secondNonfinal position bit next tail accumulator currentHistory histories =>
          simp [rowEq, Row.stage] at finalRow
      | secondFinal position bit accumulator currentHistory histories =>
          dsimp only [Option.bind]
          rw [rowEq]
          dsimp only
          have baseEq : (match (RootResetPersistentRouteAFuel.classifyHandoff
              program dispatcher whole).route.endpoint with
            | some (.registered (.appender endpoint)) =>
                if endpoint.stage = .secondFinal then
                  some (responseOuter program dispatcher whole).address.dropLast
                else some (outerAddress ++ view.focusAddress)
            | _ => some (outerAddress ++ view.focusAddress)) =
              some (outerAddress ++ view.focusAddress) := by
            split
            · rename_i endpoint endpointEq
              rw [if_neg (noBaseFinal endpoint endpointEq)]
            · rfl
          by_cases empty : outerAddress.isEmpty = true
          · rw [if_pos empty]
            apply Eq.trans (congrArg (fun addresses : Option Address =>
              addresses.bind (checkedAt? whole)) baseEq)
            change checkedAt? whole (outerAddress ++ view.focusAddress) = none
            rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, rejected]
          · rw [if_neg empty, pendingZero]
            change checkedAt? whole (outerAddress ++ view.focusAddress) = none
            rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, rejected]


end PureSFormal.Research.RootResetCompletedAppenderPriority
