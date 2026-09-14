import PureSFormal.Research.RootResetAppenderFiniteRows

/-! Finite appender rows locate their action response through the fixed route tree. -/
namespace PureSFormal.Research.RootResetAppenderRouteRows
open PureSFormal.PureS
open RootResetCompletedLocalPatterns RootResetCarrierEdgePatterns
open RootResetAppenderFiniteRows

structure Row (program : CTS.Program) where
  pattern : Pattern
  route : Dispatcher.Route
  label : ActionLabel program
  spec : Spec

def leftRow (program : CTS.Program) (right : Dispatcher.Tree (ActionLabel program))
    (row : Row program) : Row program :=
  ⟨chosenPattern (.app row.pattern (callPattern (compileDispatcher (selectedAction program) right))),
    .left :: row.route, row.label, row.spec⟩

def rightRow (program : CTS.Program) (left : Dispatcher.Tree (ActionLabel program))
    (row : Row program) : Row program :=
  ⟨chosenPattern (.app (callPattern (compileDispatcher (selectedAction program) left)) row.pattern),
    .right :: row.route, row.label, row.spec⟩

def leafRow (label : ActionLabel program) (spec : Spec) : Row program :=
  ⟨chosenPattern spec.pattern, [], label, spec⟩

def routeRows (program : CTS.Program) : Dispatcher.Tree (ActionLabel program) → List (Row program)
  | .leaf label => (specsFrom 0 (PrimitiveLocalResponse.emitted program label)).map (leafRow label)
  | .node left right => (routeRows program left).map (leftRow program right) ++
      (routeRows program right).map (rightRow program left)

def Row.address (row : Row program) : Address :=
  RootResetReachableStageGrammar.routeResponseAddress row.route ++ row.spec.address

def Row.edge (row : Row program) : EdgeRow := ⟨row.pattern, row.address⟩

def rows (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List EdgeRow :=
  (routeRows program tree).map Row.edge

theorem row_sound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : Row program) (member : row ∈ routeRows program tree) (source : Term)
    (matched : row.pattern.matchesBool source = true) :
    ∃ response, RouteGrammar.ActivatedRoute (selectedAction program) tree row.route row.label response source ∧
      row.spec.pattern.matchesBool response = true := by
  induction tree generalizing row source with
  | leaf label =>
      obtain ⟨spec, inside, equal⟩ := map_member_inverse _ _ _ member
      subst row
      obtain ⟨audit, response, sourceEq, responseMatches⟩ := chosen_sound matched
      subst source
      exact ⟨response, .leaf label audit response, responseMatches⟩
  | node left right ihLeft ihRight =>
      rcases List.mem_append.mp member with leftMember | rightMember
      · obtain ⟨active, activeMember, equal⟩ := map_member_inverse _ _ _ leftMember
        subst row
        obtain ⟨audit, fork, sourceEq, forkMatches⟩ := chosen_sound matched
        obtain ⟨activeTerm, dormantTerm, forkEq, activeMatches, dormantMatches⟩ := app_matches forkMatches
        obtain ⟨dormantAudit, dormantEq⟩ := call_sound dormantMatches
        obtain ⟨response, inner, responseMatches⟩ := ihLeft active activeMember activeTerm activeMatches
        subst source
        subst fork
        subst dormantTerm
        exact ⟨response, .left audit dormantAudit inner, responseMatches⟩
      · obtain ⟨active, activeMember, equal⟩ := map_member_inverse _ _ _ rightMember
        subst row
        obtain ⟨audit, fork, sourceEq, forkMatches⟩ := chosen_sound matched
        obtain ⟨dormantTerm, activeTerm, forkEq, dormantMatches, activeMatches⟩ := app_matches forkMatches
        obtain ⟨dormantAudit, dormantEq⟩ := call_sound dormantMatches
        obtain ⟨response, inner, responseMatches⟩ := ihRight active activeMember activeTerm activeMatches
        subst source
        subst fork
        subst dormantTerm
        exact ⟨response, .right audit dormantAudit inner, responseMatches⟩

theorem row_complete
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program} {response source : Term}
    (shape : RouteGrammar.ActivatedRoute (selectedAction program) tree route label response source)
    (spec : Spec) (member : spec ∈ specsFrom 0 (PrimitiveLocalResponse.emitted program label))
    (matched : spec.pattern.matchesBool response = true) :
    ∃ row ∈ routeRows program tree, row.route = route ∧ row.label = label ∧ row.spec = spec ∧
      row.pattern.matchesBool source = true := by
  induction shape with
  | leaf label audit response =>
      exact ⟨leafRow label spec, map_member _ member, rfl, rfl, rfl, matched⟩
  | @left left right route label response active outerAudit dormantAudit inner ih =>
      obtain ⟨row, inside, routeEq, labelEq, specEq, rowMatches⟩ := ih member matched
      refine ⟨leftRow program right row, List.mem_append.mpr (Or.inl (map_member _ inside)),
        congrArg (List.cons Direction.left) routeEq, labelEq, specEq, ?_⟩
      simp only [leftRow, chosenPattern, callPattern, RouteGrammar.selectedLeft,
        RouteGrammar.compiledCall, chosen, Pattern.matchesBool, literal_self,
        rowMatches, Bool.true_and, Bool.and_true]
  | @right left right route label response active outerAudit dormantAudit inner ih =>
      obtain ⟨row, inside, routeEq, labelEq, specEq, rowMatches⟩ := ih member matched
      refine ⟨rightRow program left row, List.mem_append.mpr (Or.inr (map_member _ inside)),
        congrArg (List.cons Direction.right) routeEq, labelEq, specEq, ?_⟩
      simp only [rightRow, chosenPattern, callPattern, RouteGrammar.selectedRight,
        RouteGrammar.compiledCall, chosen, Pattern.matchesBool, literal_self,
        rowMatches, Bool.true_and, Bool.and_true]

theorem matching_addresses_eq (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (first second : Row program) (firstMember : first ∈ routeRows program tree)
    (secondMember : second ∈ routeRows program tree) (source : Term)
    (firstMatches : first.pattern.matchesBool source = true)
    (secondMatches : second.pattern.matchesBool source = true) : first.address = second.address := by
  obtain ⟨firstResponse, firstShape, firstBody⟩ := row_sound program tree first firstMember source firstMatches
  obtain ⟨secondResponse, secondShape, secondBody⟩ := row_sound program tree second secondMember source secondMatches
  have equal := Option.some.inj ((DispatchParser.parseRouteDetailed_complete firstShape).symm.trans
    (DispatchParser.parseRouteDetailed_complete secondShape))
  have routeEq := congrArg DispatchParser.DetailedRoute.route equal
  change first.route = second.route at routeEq
  have responseEq := congrArg DispatchParser.DetailedRoute.response equal
  change firstResponse = secondResponse at responseEq
  rw [← responseEq] at secondBody
  have inner := RootResetAppenderFiniteRows.matching_addresses_eq first.spec second.spec firstResponse firstBody secondBody
  change RootResetReachableStageGrammar.routeResponseAddress first.route ++ first.spec.address =
    RootResetReachableStageGrammar.routeResponseAddress second.route ++ second.spec.address
  rw [routeEq, inner]

theorem row_redex (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : Row program) (member : row ∈ routeRows program tree) (source : Term)
    (matched : row.pattern.matchesBool source = true) :
    ∃ focus, source.subterm? row.address = some focus ∧ focus.contractRoot?.isSome = true := by
  obtain ⟨response, shape, bodyMatches⟩ := row_sound program tree row member source matched
  obtain ⟨focus, inner, redex, _⟩ := row.spec.sound response bodyMatches
  refine ⟨focus, ?_, redex⟩
  rw [Row.address, RootResetAppenderFiniteRows.subterm_append,
    RootResetReachableStageGrammar.routeResponseAddress_subterm shape]
  exact inner

def shellAddress : Address := [.left, .left, .right]

def Row.localEdge (row : Row program) : EdgeRow :=
  ⟨localPattern .fresh row.pattern, shellAddress ++ row.address⟩

def localRows (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List EdgeRow :=
  (routeRows program tree).map Row.localEdge

theorem local_dispatcher (pattern : Pattern) (source : Term)
    (matched : (localPattern .fresh pattern).matchesBool source = true) :
    ∃ dispatcher, source.subterm? shellAddress = some dispatcher ∧ pattern.matchesBool dispatcher = true := by
  obtain ⟨a, continuation, sourceEq, am, _⟩ := app_matches matched
  obtain ⟨b, seed, aEq, bm, _⟩ := app_matches am
  obtain ⟨halt, dispatcher, bEq, _, dm⟩ := app_matches bm
  refine ⟨dispatcher, ?_, dm⟩
  rw [sourceEq, aEq, bEq]
  cases dispatcher <;> rfl

theorem local_row_redex (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : Row program) (member : row ∈ routeRows program tree) (source : Term)
    (matched : row.localEdge.pattern.matchesBool source = true) :
    ∃ focus, source.subterm? row.localEdge.address = some focus ∧ focus.contractRoot?.isSome = true := by
  obtain ⟨dispatcher, placement, bodyMatches⟩ := local_dispatcher row.pattern source matched
  obtain ⟨focus, subterm, redex⟩ := row_redex program tree row member dispatcher bodyMatches
  refine ⟨focus, ?_, redex⟩
  rw [Row.localEdge, RootResetAppenderFiniteRows.subterm_append, placement]
  exact subterm

theorem local_matching_addresses_eq (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (first second : Row program) (firstMember : first ∈ routeRows program tree)
    (secondMember : second ∈ routeRows program tree) (source : Term)
    (firstMatches : first.localEdge.pattern.matchesBool source = true)
    (secondMatches : second.localEdge.pattern.matchesBool source = true) :
    first.localEdge.address = second.localEdge.address := by
  obtain ⟨firstDispatcher, firstPlacement, firstBody⟩ := local_dispatcher first.pattern source firstMatches
  obtain ⟨secondDispatcher, secondPlacement, secondBody⟩ := local_dispatcher second.pattern source secondMatches
  have equal := Option.some.inj (firstPlacement.symm.trans secondPlacement)
  subst secondDispatcher
  exact congrArg (List.append shellAddress) (matching_addresses_eq program tree first second
    firstMember secondMember firstDispatcher firstBody secondBody)

theorem local_selected_row (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (edge : EdgeRow)
    (selected : RootResetEdgeFragment.select (localRows program tree) source = some edge) :
    ∃ row ∈ routeRows program tree, row.localEdge = edge ∧ row.localEdge.pattern.matchesBool source = true := by
  obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ source edge selected
  obtain ⟨row, inside, equal⟩ := map_member_inverse Row.localEdge (routeRows program tree) edge member
  exact ⟨row, inside, equal, by rw [equal]; exact matched⟩

/-- Fixed-program finite selection through the Local shell and selected route;
no phase, label, word, or response address is supplied to execution. -/
theorem local_all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ready endpoint member,
      FiniteController.run (RootResetEdgeFragment.machine (localRows program tree))
        (RootResetEdgeFragment.ticks (localRows program tree) origin.focus)
        (RootResetEdgeFragment.initial (localRows program tree) origin) =
        ⟨some ⟨ProbeCompiler.Control.answer ready, member⟩, endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) ∧
      RootResetEdgeFragment.ticks (localRows program tree) origin.focus ≤
        RootResetEdgeFragment.bound (localRows program tree) := by
  cases selected : RootResetEdgeFragment.select (localRows program tree) origin.focus with
  | none =>
      obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs (localRows program tree) origin selected
      exact ⟨false, origin, member, execution, rfl, RootResetEdgeFragment.ticks_bound _ _⟩
  | some edge =>
      obtain ⟨row, inside, equal, matched⟩ := local_selected_row program tree origin.focus edge selected
      obtain ⟨focus, subterm, redex⟩ := local_row_redex program tree row inside origin.focus matched
      have subterm' : origin.focus.subterm? edge.address = some focus := by rw [← equal]; exact subterm
      obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists edge.address origin.focus focus subterm' origin.parents
      obtain ⟨member, execution⟩ := RootResetEdgeFragment.selected_runs (localRows program tree) origin endpoint edge selected followed
      refine ⟨true, endpoint, member, execution, ?_, RootResetEdgeFragment.ticks_bound _ _⟩
      change endpoint.rdx?.isSome = true
      rcases endpoint with ⟨value, parents⟩
      change value = focus at focusEq
      subst value
      cases result : focus.contractRoot? with
      | none => rw [result] at redex; cases redex
      | some target => simp only [Cursor.rdx?, result]; rfl

theorem local_generated
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program} {response dispatcher : Term}
    (shape : RouteGrammar.ActivatedRoute (selectedAction program) tree route label response dispatcher)
    (spec : Spec) (member : spec ∈ specsFrom 0 (PrimitiveLocalResponse.emitted program label))
    (matched : spec.pattern.matchesBool response = true)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term) :
    let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
      (word bits) seedAudit continuation continuationAudit
    ∃ selected, RootResetEdgeFragment.select (localRows program tree) source = some selected ∧
      selected.address = shellAddress ++ (RootResetReachableStageGrammar.routeResponseAddress route ++ spec.address) := by
  dsimp only
  let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
    (word bits) seedAudit continuation continuationAudit
  obtain ⟨wanted, inside, routeEq, labelEq, specEq, wantedMatches⟩ := row_complete shape spec member matched
  have localMatches : wanted.localEdge.pattern.matchesBool source = true := by
    simp only [Row.localEdge, localPattern, source, CheckpointDecoder.openShell, haltPattern, freshHField,
      Pattern.matchesBool, literal_self, wantedMatches, Bool.true_and, Bool.and_true]
  have inRows : wanted.localEdge ∈ localRows program tree := map_member Row.localEdge inside
  obtain ⟨selected, found⟩ := RootResetAppenderFiniteRows.select_exists _ source wanted.localEdge inRows localMatches
  obtain ⟨actual, actualMember, equal, actualMatches⟩ := local_selected_row program tree source selected found
  refine ⟨selected, found, ?_⟩
  rw [← equal, local_matching_addresses_eq program tree actual wanted actualMember inside source actualMatches localMatches]
  change shellAddress ++ (RootResetReachableStageGrammar.routeResponseAddress wanted.route ++ wanted.spec.address) = _
  rw [routeEq, specEq]

theorem local_zero_mutations (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (ticks : Nat) (configuration : FiniteController.Configuration (RootResetEdgeFragment.Control (localRows program tree))) :
    FiniteController.runMutationCount (RootResetEdgeFragment.machine (localRows program tree)) ticks configuration = 0 :=
  RootResetEdgeFragment.runMutationCount_zero _ _ _

theorem local_generated_runs
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program} {response dispatcher : Term}
    (shape : RouteGrammar.ActivatedRoute (selectedAction program) tree route label response dispatcher)
    (spec : Spec) (member : spec ∈ specsFrom 0 (PrimitiveLocalResponse.emitted program label))
    (matched : spec.pattern.matchesBool response = true)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term)
    (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
      (word bits) seedAudit continuation continuationAudit
    ∃ endpoint controlMember,
      RootResetEdgeFragment.follow
        (shellAddress ++ (RootResetReachableStageGrammar.routeResponseAddress route ++ spec.address))
        ⟨source, parents⟩ = some endpoint ∧
      FiniteController.run (RootResetEdgeFragment.machine (localRows program tree))
        (RootResetEdgeFragment.ticks (localRows program tree) source)
        (RootResetEdgeFragment.initial (localRows program tree) ⟨source, parents⟩) =
        ⟨some ⟨ProbeCompiler.Control.answer true, controlMember⟩, endpoint⟩ := by
  dsimp only
  let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
    (word bits) seedAudit continuation continuationAudit
  obtain ⟨selected, found, addressEq⟩ := local_generated shape spec member matched bits continuation haltAudit seedAudit continuationAudit
  obtain ⟨row, inside, equal, rowMatches⟩ := local_selected_row program tree source selected found
  obtain ⟨focus, subterm, _⟩ := local_row_redex program tree row inside source rowMatches
  have subterm' : source.subterm? selected.address = some focus := by rw [← equal]; exact subterm
  obtain ⟨endpoint, followed, _⟩ := RootResetEdgeFragment.follow_exists selected.address source focus subterm' parents
  obtain ⟨controlMember, execution⟩ := RootResetEdgeFragment.selected_runs (localRows program tree) ⟨source, parents⟩
    endpoint selected found followed
  exact ⟨endpoint, controlMember, by rw [← addressEq]; exact followed, execution⟩

theorem local_completed_rejected
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program} {dispatcher : Term}
    (accumulator : Term) (histories : List Term)
    (shape : RouteGrammar.ActivatedRoute (selectedAction program) tree route label
      (Term.applyArgs (.app p accumulator) histories) dispatcher)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term) :
    RootResetEdgeFragment.select (localRows program tree)
      (CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
        (word bits) seedAudit continuation continuationAudit) = none := by
  let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
    (word bits) seedAudit continuation continuationAudit
  cases selected : RootResetEdgeFragment.select (localRows program tree) source with
  | none => rfl
  | some edge =>
      obtain ⟨row, inside, _, matched⟩ := local_selected_row program tree source edge selected
      obtain ⟨actualDispatcher, placement, bodyMatches⟩ := local_dispatcher row.pattern source matched
      have sourcePlacement : source.subterm? shellAddress = some dispatcher := by cases dispatcher <;> rfl
      have dispatcherEq := Option.some.inj (placement.symm.trans sourcePlacement)
      subst actualDispatcher
      obtain ⟨response, actualShape, responseMatches⟩ := row_sound program tree row inside dispatcher bodyMatches
      have equal := Option.some.inj ((DispatchParser.parseRouteDetailed_complete actualShape).symm.trans
        (DispatchParser.parseRouteDetailed_complete shape))
      have responseEq := congrArg DispatchParser.DetailedRoute.response equal
      change response = Term.applyArgs (.app p accumulator) histories at responseEq
      rw [responseEq] at responseMatches
      have guard := row.spec.matches_firstArgApp _ responseMatches
      rw [firstArgApp_applyArgs _ histories (by exact Nat.noConfusion)] at guard
      change false = true at guard
      cases guard

end PureSFormal.Research.RootResetAppenderRouteRows
