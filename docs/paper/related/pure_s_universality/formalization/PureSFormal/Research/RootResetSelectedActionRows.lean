import PureSFormal.Research.RootResetAppenderRouteRows
import PureSFormal.Research.RootResetDispatcherStageRows

/-! Finite initial action calls, combined with the existing live Push rows. -/
namespace PureSFormal.Research.RootResetSelectedActionRows
open PureSFormal.PureS
open RootResetCompletedLocalPatterns
open RootResetCarrierEdgePatterns (EdgeRow)
open FiniteController

structure Row (program : CTS.Program) where
  pattern : Pattern
  route : Dispatcher.Route
  label : ActionLabel program

def leftRow (program : CTS.Program) (right : Dispatcher.Tree (ActionLabel program))
    (row : Row program) : Row program :=
  ⟨chosenPattern (.app row.pattern (callPattern (compileDispatcher (selectedAction program) right))),
    .left :: row.route, row.label⟩

def rightRow (program : CTS.Program) (left : Dispatcher.Tree (ActionLabel program))
    (row : Row program) : Row program :=
  ⟨chosenPattern (.app (callPattern (compileDispatcher (selectedAction program) left)) row.pattern),
    .right :: row.route, row.label⟩

def leafRow (label : ActionLabel program) : Row program :=
  ⟨chosenPattern (callPattern (selectedAction program label)), [], label⟩

def routeRows (program : CTS.Program) : Dispatcher.Tree (ActionLabel program) → List (Row program)
  | .leaf label => if (PrimitiveLocalResponse.emitted program label).isEmpty then [] else [leafRow label]
  | .node left right => (routeRows program left).map (leftRow program right) ++
      (routeRows program right).map (rightRow program left)

def Row.address (row : Row program) : Address :=
  RootResetReachableStageGrammar.routeResponseAddress row.route

def Row.localEdge (row : Row program) : EdgeRow :=
  ⟨localPattern .fresh row.pattern, RootResetAppenderRouteRows.shellAddress ++ row.address⟩

def initialRows (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List EdgeRow :=
  (routeRows program tree).map Row.localEdge

def rows (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List EdgeRow :=
  initialRows program tree ++ RootResetAppenderRouteRows.localRows program tree

theorem row_sound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : Row program) (member : row ∈ routeRows program tree) (source : Term)
    (matched : row.pattern.matchesBool source = true) :
    ∃ argument, RouteGrammar.ActivatedRoute (selectedAction program) tree row.route row.label
      (.app (selectedAction program row.label) argument) source ∧
      (PrimitiveLocalResponse.emitted program row.label).isEmpty = false := by
  induction tree generalizing row source with
  | leaf label =>
      cases empty : (PrimitiveLocalResponse.emitted program label).isEmpty with
      | true => simp only [routeRows, empty, ↓reduceIte] at member; cases member
      | false =>
          have equal : row = leafRow label := by
            simpa only [routeRows, empty, Bool.false_eq_true, ↓reduceIte, List.mem_singleton] using member
          subst row
          obtain ⟨audit, response, sourceEq, responseMatches⟩ := chosen_sound matched
          obtain ⟨argument, responseEq⟩ := call_sound responseMatches
          subst source
          subst response
          exact ⟨argument, .leaf label audit _, empty⟩
  | node left right ihLeft ihRight =>
      rcases List.mem_append.mp member with leftMember | rightMember
      · obtain ⟨active, activeMember, equal⟩ := map_member_inverse _ _ _ leftMember
        subst row
        obtain ⟨audit, fork, sourceEq, forkMatches⟩ := chosen_sound matched
        obtain ⟨activeTerm, dormantTerm, forkEq, activeMatches, dormantMatches⟩ := app_matches forkMatches
        obtain ⟨dormantAudit, dormantEq⟩ := call_sound dormantMatches
        obtain ⟨argument, inner, nonempty⟩ := ihLeft active activeMember activeTerm activeMatches
        subst source
        subst fork
        subst dormantTerm
        exact ⟨argument, .left audit dormantAudit inner, nonempty⟩
      · obtain ⟨active, activeMember, equal⟩ := map_member_inverse _ _ _ rightMember
        subst row
        obtain ⟨audit, fork, sourceEq, forkMatches⟩ := chosen_sound matched
        obtain ⟨dormantTerm, activeTerm, forkEq, dormantMatches, activeMatches⟩ := app_matches forkMatches
        obtain ⟨dormantAudit, dormantEq⟩ := call_sound dormantMatches
        obtain ⟨argument, inner, nonempty⟩ := ihRight active activeMember activeTerm activeMatches
        subst source
        subst fork
        subst dormantTerm
        exact ⟨argument, .right audit dormantAudit inner, nonempty⟩

theorem row_complete
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program} {argument response source : Term}
    (shape : RouteGrammar.ActivatedRoute (selectedAction program) tree route label response source)
    (callEq : response = .app (selectedAction program label) argument)
    (nonempty : (PrimitiveLocalResponse.emitted program label).isEmpty = false) :
    ∃ row ∈ routeRows program tree, row.route = route ∧ row.label = label ∧
      row.pattern.matchesBool source = true := by
  induction shape with
  | leaf label audit response =>
      refine ⟨leafRow label, ?_, rfl, rfl, ?_⟩
      · simp only [routeRows, nonempty, Bool.false_eq_true, ↓reduceIte, List.mem_singleton]
      · rw [callEq]
        simp only [leafRow, chosenPattern, callPattern, chosen, Pattern.matchesBool,
          literal_self, Bool.and_self]
  | @left left right route label response active outerAudit dormantAudit inner ih =>
      obtain ⟨row, inside, routeEq, labelEq, rowMatches⟩ := ih callEq nonempty
      refine ⟨leftRow program right row, List.mem_append.mpr (Or.inl (map_member _ inside)),
        congrArg (List.cons Direction.left) routeEq, labelEq, ?_⟩
      simp only [leftRow, chosenPattern, callPattern, RouteGrammar.selectedLeft,
        RouteGrammar.compiledCall, chosen, Pattern.matchesBool, literal_self,
        rowMatches, Bool.true_and, Bool.and_true]
  | @right left right route label response active outerAudit dormantAudit inner ih =>
      obtain ⟨row, inside, routeEq, labelEq, rowMatches⟩ := ih callEq nonempty
      refine ⟨rightRow program left row, List.mem_append.mpr (Or.inr (map_member _ inside)),
        congrArg (List.cons Direction.right) routeEq, labelEq, ?_⟩
      simp only [rightRow, chosenPattern, callPattern, RouteGrammar.selectedRight,
        RouteGrammar.compiledCall, chosen, Pattern.matchesBool, literal_self,
        rowMatches, Bool.true_and, Bool.and_true]

theorem action_redex (program : CTS.Program) (label : ActionLabel program)
    (argument : Term) (nonempty : (PrimitiveLocalResponse.emitted program label).isEmpty = false) :
    (Term.app (selectedAction program label) argument).contractRoot?.isSome = true ∧
      (Term.app (selectedAction program label) argument).headArity = 3 := by
  rw [PrimitiveLocalResponse.selectedAction_eq_appender]
  cases emitted : PrimitiveLocalResponse.emitted program label with
  | nil => rw [emitted] at nonempty; cases nonempty
  | cons bit rest => exact ⟨rfl, rfl⟩

theorem local_row_redex (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : Row program) (member : row ∈ routeRows program tree) (source : Term)
    (matched : row.localEdge.pattern.matchesBool source = true) :
    ∃ focus, source.subterm? row.localEdge.address = some focus ∧ focus.contractRoot?.isSome = true := by
  obtain ⟨dispatcher, placement, bodyMatches⟩ := RootResetAppenderRouteRows.local_dispatcher row.pattern source matched
  obtain ⟨argument, shape, nonempty⟩ := row_sound program tree row member dispatcher bodyMatches
  refine ⟨.app (selectedAction program row.label) argument, ?_, (action_redex program row.label argument nonempty).1⟩
  rw [Row.localEdge, RootResetAppenderFiniteRows.subterm_append, placement]
  exact RootResetReachableStageGrammar.routeResponseAddress_subterm shape

theorem initial_matching_addresses_eq (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (first second : Row program) (firstMember : first ∈ routeRows program tree)
    (secondMember : second ∈ routeRows program tree) (source : Term)
    (firstMatches : first.localEdge.pattern.matchesBool source = true)
    (secondMatches : second.localEdge.pattern.matchesBool source = true) :
    first.localEdge.address = second.localEdge.address := by
  obtain ⟨firstDispatcher, firstPlacement, firstBody⟩ := RootResetAppenderRouteRows.local_dispatcher first.pattern source firstMatches
  obtain ⟨secondDispatcher, secondPlacement, secondBody⟩ := RootResetAppenderRouteRows.local_dispatcher second.pattern source secondMatches
  have dispatcherEq := Option.some.inj (firstPlacement.symm.trans secondPlacement)
  subst secondDispatcher
  obtain ⟨firstArgument, firstShape, _⟩ := row_sound program tree first firstMember firstDispatcher firstBody
  obtain ⟨secondArgument, secondShape, _⟩ := row_sound program tree second secondMember firstDispatcher secondBody
  have equal := Option.some.inj ((DispatchParser.parseRouteDetailed_complete firstShape).symm.trans
    (DispatchParser.parseRouteDetailed_complete secondShape))
  have routeEq := congrArg DispatchParser.DetailedRoute.route equal
  change first.route = second.route at routeEq
  change RootResetAppenderRouteRows.shellAddress ++ RootResetReachableStageGrammar.routeResponseAddress first.route =
    RootResetAppenderRouteRows.shellAddress ++ RootResetReachableStageGrammar.routeResponseAddress second.route
  rw [routeEq]

theorem mixed_matching_addresses_eq (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (first : Row program) (second : RootResetAppenderRouteRows.Row program)
    (firstMember : first ∈ routeRows program tree)
    (secondMember : second ∈ RootResetAppenderRouteRows.routeRows program tree) (source : Term)
    (firstMatches : first.localEdge.pattern.matchesBool source = true)
    (secondMatches : second.localEdge.pattern.matchesBool source = true) :
    first.localEdge.address = second.localEdge.address := by
  obtain ⟨firstDispatcher, firstPlacement, firstBody⟩ := RootResetAppenderRouteRows.local_dispatcher first.pattern source firstMatches
  obtain ⟨secondDispatcher, secondPlacement, secondBody⟩ := RootResetAppenderRouteRows.local_dispatcher second.pattern source secondMatches
  have dispatcherEq := Option.some.inj (firstPlacement.symm.trans secondPlacement)
  subst secondDispatcher
  obtain ⟨argument, firstShape, nonempty⟩ := row_sound program tree first firstMember firstDispatcher firstBody
  obtain ⟨response, secondShape, secondMatches⟩ := RootResetAppenderRouteRows.row_sound program tree second secondMember firstDispatcher secondBody
  have equal := Option.some.inj ((DispatchParser.parseRouteDetailed_complete firstShape).symm.trans
    (DispatchParser.parseRouteDetailed_complete secondShape))
  have routeEq := congrArg DispatchParser.DetailedRoute.route equal
  change first.route = second.route at routeEq
  have responseEq := congrArg DispatchParser.DetailedRoute.response equal
  change .app (selectedAction program first.label) argument = response at responseEq
  obtain ⟨_, _, _, arity⟩ := second.spec.sound response secondMatches
  rw [← responseEq, (action_redex program first.label argument nonempty).2] at arity
  have lengthEq : second.spec.address.length = 0 := Nat.add_right_cancel (arity.symm.trans (Nat.zero_add 3).symm)
  have addressEq : second.spec.address = [] := List.length_eq_zero_iff.mp lengthEq
  change RootResetAppenderRouteRows.shellAddress ++ RootResetReachableStageGrammar.routeResponseAddress first.route =
    RootResetAppenderRouteRows.shellAddress ++ (RootResetReachableStageGrammar.routeResponseAddress second.route ++ second.spec.address)
  rw [routeEq, addressEq, List.append_nil]

theorem edge_redex (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (edge : EdgeRow) (member : edge ∈ rows program tree) (source : Term)
    (matched : edge.pattern.matchesBool source = true) :
    ∃ focus, source.subterm? edge.address = some focus ∧ focus.contractRoot?.isSome = true := by
  rcases List.mem_append.mp member with first | second
  · obtain ⟨row, inside, equal⟩ := map_member_inverse _ _ _ first
    subst edge
    exact local_row_redex program tree row inside source matched
  · obtain ⟨row, inside, equal⟩ := map_member_inverse _ _ _ second
    subst edge
    exact RootResetAppenderRouteRows.local_row_redex program tree row inside source matched

theorem edges_matching_addresses_eq (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (first second : EdgeRow) (firstMember : first ∈ rows program tree)
    (secondMember : second ∈ rows program tree) (source : Term)
    (firstMatches : first.pattern.matchesBool source = true)
    (secondMatches : second.pattern.matchesBool source = true) : first.address = second.address := by
  rcases List.mem_append.mp firstMember with firstInitial | firstPush
  · obtain ⟨firstRow, firstInside, firstEq⟩ := map_member_inverse _ _ _ firstInitial
    subst first
    rcases List.mem_append.mp secondMember with secondInitial | secondPush
    · obtain ⟨secondRow, secondInside, secondEq⟩ := map_member_inverse _ _ _ secondInitial
      subst second
      exact initial_matching_addresses_eq program tree firstRow secondRow firstInside secondInside source firstMatches secondMatches
    · obtain ⟨secondRow, secondInside, secondEq⟩ := map_member_inverse _ _ _ secondPush
      subst second
      exact mixed_matching_addresses_eq program tree firstRow secondRow firstInside secondInside source firstMatches secondMatches
  · obtain ⟨firstRow, firstInside, firstEq⟩ := map_member_inverse _ _ _ firstPush
    subst first
    rcases List.mem_append.mp secondMember with secondInitial | secondPush
    · obtain ⟨secondRow, secondInside, secondEq⟩ := map_member_inverse _ _ _ secondInitial
      subst second
      exact (mixed_matching_addresses_eq program tree secondRow firstRow secondInside firstInside source secondMatches firstMatches).symm
    · obtain ⟨secondRow, secondInside, secondEq⟩ := map_member_inverse _ _ _ secondPush
      subst second
      exact RootResetAppenderRouteRows.local_matching_addresses_eq program tree firstRow secondRow firstInside secondInside source firstMatches secondMatches

theorem selected_exact (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (wanted : EdgeRow) (member : wanted ∈ rows program tree) (source : Term)
    (matched : wanted.pattern.matchesBool source = true) :
    ∃ selected, RootResetEdgeFragment.select (rows program tree) source = some selected ∧
      selected.address = wanted.address := by
  obtain ⟨selected, found⟩ := RootResetAppenderFiniteRows.select_exists _ source wanted member matched
  obtain ⟨selectedMember, selectedMatches⟩ := RootResetEdgeFragment.select_sound _ _ _ found
  exact ⟨selected, found, edges_matching_addresses_eq program tree selected wanted selectedMember member source selectedMatches matched⟩

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ready endpoint member,
      run (RootResetEdgeFragment.machine (rows program tree))
        (RootResetEdgeFragment.ticks (rows program tree) origin.focus)
        (RootResetEdgeFragment.initial (rows program tree) origin) =
        ⟨some ⟨ProbeCompiler.Control.answer ready, member⟩, endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) ∧
      RootResetEdgeFragment.ticks (rows program tree) origin.focus ≤
        RootResetEdgeFragment.bound (rows program tree) := by
  cases selected : RootResetEdgeFragment.select (rows program tree) origin.focus with
  | none =>
      obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs _ origin selected
      exact ⟨false, origin, member, execution, rfl, RootResetEdgeFragment.ticks_bound _ _⟩
  | some edge =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
      obtain ⟨focus, subterm, redex⟩ := edge_redex program tree edge member origin.focus matched
      obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists _ _ _ subterm origin.parents
      obtain ⟨lastMember, execution⟩ := RootResetEdgeFragment.selected_runs _ origin endpoint edge selected followed
      refine ⟨true, endpoint, lastMember, execution, ?_, RootResetEdgeFragment.ticks_bound _ _⟩
      change endpoint.rdx?.isSome = true
      cases result : focus.contractRoot? with
      | none => rw [result] at redex; cases redex
      | some target => simp only [Cursor.rdx?, focusEq, result]; rfl

theorem generated_at_row (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (wanted : EdgeRow) (member : wanted ∈ rows program tree) (source : Term)
    (matched : wanted.pattern.matchesBool source = true) (parents : List ParentFrame) :
    ∃ endpoint controlMember,
      RootResetEdgeFragment.follow wanted.address ⟨source, parents⟩ = some endpoint ∧
      run (RootResetEdgeFragment.machine (rows program tree))
        (RootResetEdgeFragment.ticks (rows program tree) source)
        (RootResetEdgeFragment.initial (rows program tree) ⟨source, parents⟩) =
        ⟨some ⟨ProbeCompiler.Control.answer true, controlMember⟩, endpoint⟩ ∧
      endpoint.rdx?.isSome = true := by
  obtain ⟨selected, found, addressEq⟩ := selected_exact program tree wanted member source matched
  obtain ⟨focus, subterm, redex⟩ := edge_redex program tree wanted member source matched
  obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists _ _ _ subterm parents
  obtain ⟨controlMember, execution⟩ := RootResetEdgeFragment.selected_runs _ ⟨source, parents⟩ endpoint selected found
    (by rw [addressEq]; exact followed)
  refine ⟨endpoint, controlMember, followed, execution, ?_⟩
  cases result : focus.contractRoot? with
  | none => rw [result] at redex; cases redex
  | some target => simp only [Cursor.rdx?, focusEq, result]; rfl

theorem generated_initial
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program} {argument dispatcher : Term}
    (shape : RouteGrammar.ActivatedRoute (selectedAction program) tree route label
      (.app (selectedAction program label) argument) dispatcher)
    (nonempty : (PrimitiveLocalResponse.emitted program label).isEmpty = false)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term)
    (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
      (word bits) seedAudit continuation continuationAudit
    ∃ endpoint controlMember,
      RootResetEdgeFragment.follow
        (RootResetAppenderRouteRows.shellAddress ++ RootResetReachableStageGrammar.routeResponseAddress route)
        ⟨source, parents⟩ = some endpoint ∧
      run (RootResetEdgeFragment.machine (rows program tree))
        (RootResetEdgeFragment.ticks (rows program tree) source)
        (RootResetEdgeFragment.initial (rows program tree) ⟨source, parents⟩) =
        ⟨some ⟨ProbeCompiler.Control.answer true, controlMember⟩, endpoint⟩ ∧
      endpoint.rdx?.isSome = true := by
  dsimp only
  let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
    (word bits) seedAudit continuation continuationAudit
  obtain ⟨wanted, inside, routeEq, _, wantedMatches⟩ := row_complete shape rfl nonempty
  have localMatches : wanted.localEdge.pattern.matchesBool source = true := by
    simp only [Row.localEdge, localPattern, source, CheckpointDecoder.openShell, haltPattern, freshHField,
      Pattern.matchesBool, literal_self, wantedMatches, Bool.true_and, Bool.and_true]
  obtain ⟨endpoint, member, followed, execution, redex⟩ := generated_at_row program tree wanted.localEdge
    (List.mem_append_left _ (map_member _ inside)) source localMatches parents
  refine ⟨endpoint, member, ?_, execution, redex⟩
  change RootResetEdgeFragment.follow
    (RootResetAppenderRouteRows.shellAddress ++ RootResetReachableStageGrammar.routeResponseAddress wanted.route)
    ⟨source, parents⟩ = some endpoint at followed
  rw [routeEq] at followed
  exact followed

theorem generated_appender
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program} {response dispatcher : Term}
    (shape : RouteGrammar.ActivatedRoute (selectedAction program) tree route label response dispatcher)
    (spec : RootResetAppenderFiniteRows.Spec)
    (member : spec ∈ RootResetAppenderFiniteRows.specsFrom 0 (PrimitiveLocalResponse.emitted program label))
    (matched : spec.pattern.matchesBool response = true)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term)
    (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
      (word bits) seedAudit continuation continuationAudit
    ∃ endpoint controlMember,
      RootResetEdgeFragment.follow
        (RootResetAppenderRouteRows.shellAddress ++ (RootResetReachableStageGrammar.routeResponseAddress route ++ spec.address))
        ⟨source, parents⟩ = some endpoint ∧
      run (RootResetEdgeFragment.machine (rows program tree))
        (RootResetEdgeFragment.ticks (rows program tree) source)
        (RootResetEdgeFragment.initial (rows program tree) ⟨source, parents⟩) =
        ⟨some ⟨ProbeCompiler.Control.answer true, controlMember⟩, endpoint⟩ ∧
      endpoint.rdx?.isSome = true := by
  dsimp only
  let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
    (word bits) seedAudit continuation continuationAudit
  obtain ⟨wanted, inside, routeEq, _, specEq, wantedMatches⟩ := RootResetAppenderRouteRows.row_complete shape spec member matched
  have localMatches : wanted.localEdge.pattern.matchesBool source = true := by
    simp only [RootResetAppenderRouteRows.Row.localEdge, localPattern, source, CheckpointDecoder.openShell,
      haltPattern, freshHField, Pattern.matchesBool, literal_self, wantedMatches, Bool.true_and, Bool.and_true]
  obtain ⟨endpoint, member, followed, execution, redex⟩ := generated_at_row program tree wanted.localEdge
    (List.mem_append_right _ (map_member _ inside)) source localMatches parents
  refine ⟨endpoint, member, ?_, execution, redex⟩
  change RootResetEdgeFragment.follow
    (RootResetAppenderRouteRows.shellAddress ++ (RootResetReachableStageGrammar.routeResponseAddress wanted.route ++ wanted.spec.address))
    ⟨source, parents⟩ = some endpoint at followed
  rw [routeEq, specEq] at followed
  exact followed

theorem runMutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (ticks : Nat) (configuration : Configuration (RootResetEdgeFragment.Control (rows program tree))) :
    runMutationCount (RootResetEdgeFragment.machine (rows program tree)) ticks configuration = 0 :=
  RootResetEdgeFragment.runMutationCount_zero _ _ _

theorem erase_run (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (ticks : Nat) (configuration : Configuration (RootResetEdgeFragment.Control (rows program tree))) :
    (run (RootResetEdgeFragment.machine (rows program tree)) ticks configuration).cursor.erase = configuration.cursor.erase :=
  RootResetEdgeFragment.erase_run _ _ _

theorem completed_rejected
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program} {dispatcher : Term}
    (accumulator : Term) (histories : List Term)
    (shape : RouteGrammar.ActivatedRoute (selectedAction program) tree route label
      (Term.applyArgs (.app p accumulator) histories) dispatcher)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term) :
    RootResetEdgeFragment.select (rows program tree)
      (CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
        (word bits) seedAudit continuation continuationAudit) = none := by
  let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
    (word bits) seedAudit continuation continuationAudit
  cases selected : RootResetEdgeFragment.select (rows program tree) source with
  | none => rfl
  | some edge =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
      rcases List.mem_append.mp member with initial | push
      · obtain ⟨row, inside, equal⟩ := map_member_inverse _ _ _ initial
        subst edge
        obtain ⟨actualDispatcher, placement, bodyMatches⟩ := RootResetAppenderRouteRows.local_dispatcher row.pattern source matched
        have sourcePlacement : source.subterm? RootResetAppenderRouteRows.shellAddress = some dispatcher := by cases dispatcher <;> rfl
        have dispatcherEq := Option.some.inj (placement.symm.trans sourcePlacement)
        subst actualDispatcher
        obtain ⟨argument, actualShape, nonempty⟩ := row_sound program tree row inside dispatcher bodyMatches
        have equal := Option.some.inj ((DispatchParser.parseRouteDetailed_complete actualShape).symm.trans
          (DispatchParser.parseRouteDetailed_complete shape))
        have responseEq := congrArg DispatchParser.DetailedRoute.response equal
        change .app (selectedAction program row.label) argument = Term.applyArgs (.app p accumulator) histories at responseEq
        have guard : RootResetAppenderFiniteRows.firstArgApp (.app (selectedAction program row.label) argument) = true := by
          rw [PrimitiveLocalResponse.selectedAction_eq_appender]
          cases emitted : PrimitiveLocalResponse.emitted program row.label with
          | nil => rw [emitted] at nonempty; cases nonempty
          | cons bit rest => cases rest <;> rfl
        rw [responseEq, RootResetAppenderFiniteRows.firstArgApp_applyArgs _ histories (by exact Nat.noConfusion)] at guard
        cases guard
      · obtain ⟨row, inside, equal⟩ := map_member_inverse _ _ _ push
        subst edge
        obtain ⟨actualDispatcher, placement, bodyMatches⟩ := RootResetAppenderRouteRows.local_dispatcher row.pattern source matched
        have sourcePlacement : source.subterm? RootResetAppenderRouteRows.shellAddress = some dispatcher := by cases dispatcher <;> rfl
        have dispatcherEq := Option.some.inj (placement.symm.trans sourcePlacement)
        subst actualDispatcher
        obtain ⟨response, actualShape, responseMatches⟩ := RootResetAppenderRouteRows.row_sound program tree row inside dispatcher bodyMatches
        have equal := Option.some.inj ((DispatchParser.parseRouteDetailed_complete actualShape).symm.trans
          (DispatchParser.parseRouteDetailed_complete shape))
        have responseEq := congrArg DispatchParser.DetailedRoute.response equal
        change response = Term.applyArgs (.app p accumulator) histories at responseEq
        rw [responseEq] at responseMatches
        have guard := row.spec.matches_firstArgApp _ responseMatches
        rw [RootResetAppenderFiniteRows.firstArgApp_applyArgs _ histories (by exact Nat.noConfusion)] at guard
        cases guard

end PureSFormal.Research.RootResetSelectedActionRows
