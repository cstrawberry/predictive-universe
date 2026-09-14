import PureSFormal.Research.RootResetEdgeFragment
import PureSFormal.Research.RootResetWholeDispatcherStages

/-!
# Finite dispatcher rows for a fixed recovered route

The route is fixed compiler data.  A finite carrier query chooses its label
before this worker is entered.  Every mutable audit and call argument is an
independent pattern hole.  Matching identifies the exact dispatcher redex;
the finite edge fragment performs only local observations and literal moves.
-/
namespace PureSFormal.Research.RootResetDispatcherStageRows
open PureSFormal.PureS
open RootResetCompletedLocalPatterns
open RootResetCarrierEdgePatterns (EdgeRow)
open RootResetWholeDispatcherStages
open FiniteController

def exposedRow {Label : Type} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) : EdgeRow :=
  ⟨chosenPattern (callPattern (fork (compileDispatcher encode left)
    (compileDispatcher encode right))), [.right]⟩

def forkedRow {Label : Type} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (direction : Direction) : EdgeRow :=
  ⟨chosenPattern (.app (callPattern (compileDispatcher encode left))
    (callPattern (compileDispatcher encode right))), [.right, direction]⟩

def leftRow {Label : Type} (encode : Label → Term)
    (right : Dispatcher.Tree Label) (row : EdgeRow) : EdgeRow :=
  ⟨chosenPattern (.app row.pattern (callPattern (compileDispatcher encode right))),
    [.right, .left] ++ row.address⟩

def rightRow {Label : Type} (encode : Label → Term)
    (left : Dispatcher.Tree Label) (row : EdgeRow) : EdgeRow :=
  ⟨chosenPattern (.app (callPattern (compileDispatcher encode left)) row.pattern),
    [.right, .right] ++ row.address⟩

def routeRows {Label : Type} (encode : Label → Term) :
    Dispatcher.Tree Label → Dispatcher.Route → List EdgeRow
  | .leaf _, _ => []
  | .node _ _, [] => []
  | .node left right, .left :: remaining =>
      exposedRow encode left right :: forkedRow encode left right .left ::
        (routeRows encode left remaining).map (leftRow encode right)
  | .node left right, .right :: remaining =>
      exposedRow encode left right :: forkedRow encode left right .right ::
        (routeRows encode right remaining).map (rightRow encode left)

def redexAddress {Label : Type} (view : RouteView Label) : Address :=
  RootResetSelectorContract.contextAddress view.context ++ view.localRedexAddress

theorem exposed_sound {Label : Type} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (source : Term)
    (matched : (exposedRow encode left right).pattern.matchesBool source = true) :
    ∃ view, source = RootResetDispatcherNodeStages.exposedTerm encode left right view := by
  obtain ⟨audit, response, sourceEq, matched⟩ := chosen_sound matched
  obtain ⟨argument, responseEq⟩ := call_sound matched
  subst source
  subst response
  exact ⟨⟨audit, argument⟩, rfl⟩

theorem forked_sound {Label : Type} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (direction : Direction) (source : Term)
    (matched : (forkedRow encode left right direction).pattern.matchesBool source = true) :
    ∃ view, source = RootResetDispatcherNodeStages.forkedTerm encode left right view := by
  obtain ⟨audit, response, sourceEq, matched⟩ := chosen_sound matched
  obtain ⟨leftCall, rightCall, responseEq, leftMatches, rightMatches⟩ := app_matches matched
  obtain ⟨leftAudit, leftEq⟩ := call_sound leftMatches
  obtain ⟨rightAudit, rightEq⟩ := call_sound rightMatches
  subst source
  subst response
  subst leftCall
  subst rightCall
  exact ⟨⟨audit, leftAudit, rightAudit⟩, rfl⟩

theorem row_sound {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route) (row : EdgeRow)
    (member : row ∈ routeRows encode tree route) (source : Term)
    (matched : row.pattern.matchesBool source = true) :
    ∃ view, RouteShape encode tree route view source ∧ row.address = redexAddress view := by
  induction tree generalizing route row source with
  | leaf => cases member
  | node left right ihLeft ihRight =>
    cases route with
    | nil => cases member
    | cons direction remaining =>
      cases direction with
      | left =>
        simp only [routeRows, List.mem_cons] at member
        rcases member with equal | equal | later
        · subst row
          obtain ⟨view, rfl⟩ := exposed_sound encode left right source matched
          exact ⟨_, .root left right .left remaining (.exposed view), rfl⟩
        · subst row
          obtain ⟨view, rfl⟩ := forked_sound encode left right .left source matched
          exact ⟨_, .root left right .left remaining (.forked view), rfl⟩
        · obtain ⟨innerRow, innerMember, rowEq⟩ := map_member_inverse _ _ _ later
          subst row
          obtain ⟨audit, response, sourceEq, matched⟩ := chosen_sound matched
          obtain ⟨active, dormant, responseEq, activeMatches, dormantMatches⟩ := app_matches matched
          obtain ⟨dormantAudit, dormantEq⟩ := call_sound dormantMatches
          obtain ⟨view, shape, addressEq⟩ := ihLeft remaining innerRow innerMember active activeMatches
          subst source
          subst response
          subst dormant
          refine ⟨_, .left audit dormantAudit shape, ?_⟩
          simpa only [leftRow, redexAddress, RouteView.wrapLeft,
            selectedLeftContext, RootResetSelectorContract.contextAddress,
            List.append_assoc, List.cons_append, List.nil_append,
            RouteView.localRedexAddress] using congrArg (fun address =>
              Direction.right :: Direction.left :: address) addressEq
      | right =>
        simp only [routeRows, List.mem_cons] at member
        rcases member with equal | equal | later
        · subst row
          obtain ⟨view, rfl⟩ := exposed_sound encode left right source matched
          exact ⟨_, .root left right .right remaining (.exposed view), rfl⟩
        · subst row
          obtain ⟨view, rfl⟩ := forked_sound encode left right .right source matched
          exact ⟨_, .root left right .right remaining (.forked view), rfl⟩
        · obtain ⟨innerRow, innerMember, rowEq⟩ := map_member_inverse _ _ _ later
          subst row
          obtain ⟨audit, response, sourceEq, matched⟩ := chosen_sound matched
          obtain ⟨dormant, active, responseEq, dormantMatches, activeMatches⟩ := app_matches matched
          obtain ⟨dormantAudit, dormantEq⟩ := call_sound dormantMatches
          obtain ⟨view, shape, addressEq⟩ := ihRight remaining innerRow innerMember active activeMatches
          subst source
          subst response
          subst dormant
          refine ⟨_, .right audit dormantAudit shape, ?_⟩
          simpa only [rightRow, redexAddress, RouteView.wrapRight,
            selectedRightContext, RootResetSelectorContract.contextAddress,
            List.append_assoc, List.cons_append, List.nil_append,
            RouteView.localRedexAddress] using congrArg (fun address =>
              Direction.right :: Direction.right :: address) addressEq

theorem row_complete {Label : Type} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RouteView Label} {source : Term}
    (shape : RouteShape encode tree route view source) :
    ∃ row ∈ routeRows encode tree route, row.pattern.matchesBool source = true := by
  induction shape with
  | root left right direction remaining stage =>
      cases direction <;> cases stage with
      | exposed view =>
          refine ⟨exposedRow encode left right, List.Mem.head _, ?_⟩
          simp only [exposedRow, chosenPattern, callPattern, stageTerm,
            RootResetDispatcherNodeStages.exposedTerm, chosen,
            Pattern.matchesBool, literal_self, Bool.and_self]
      | forked view =>
          refine ⟨forkedRow encode left right _, List.Mem.tail _ (List.Mem.head _), ?_⟩
          simp only [forkedRow, chosenPattern, callPattern, stageTerm,
            RootResetDispatcherNodeStages.forkedTerm, chosen,
            RouteGrammar.compiledCall, Pattern.matchesBool, literal_self, Bool.and_self]
  | @left left right remaining view term audit dormantAudit inner ih =>
      obtain ⟨row, member, matched⟩ := ih
      refine ⟨leftRow encode right row, List.Mem.tail _ (List.Mem.tail _ (map_member _ member)), ?_⟩
      simp only [leftRow, chosenPattern, callPattern, RouteGrammar.selectedLeft,
        RouteGrammar.compiledCall, chosen, Pattern.matchesBool, literal_self,
        matched, Bool.and_self]
  | @right left right remaining view term audit dormantAudit inner ih =>
      obtain ⟨row, member, matched⟩ := ih
      refine ⟨rightRow encode left row, List.Mem.tail _ (List.Mem.tail _ (map_member _ member)), ?_⟩
      simp only [rightRow, chosenPattern, callPattern, RouteGrammar.selectedRight,
        RouteGrammar.compiledCall, chosen, Pattern.matchesBool, literal_self,
        matched, Bool.and_self]

theorem select_exists (rows : List EdgeRow) (source : Term)
    (accepted : ∃ row ∈ rows, row.pattern.matchesBool source = true) :
    ∃ row, RootResetEdgeFragment.select rows source = some row := by
  induction rows with
  | nil => obtain ⟨row, member, _⟩ := accepted; cases member
  | cons first rest ih =>
      cases matched : first.pattern.matchesBool source with
      | true => exact ⟨first, by simp only [RootResetEdgeFragment.select, matched, ↓reduceIte]⟩
      | false =>
          obtain ⟨row, member, rowMatches⟩ := accepted
          rcases List.mem_cons.mp member with equal | later
          · subst row; rw [matched] at rowMatches; contradiction
          · obtain ⟨chosen, selected⟩ := ih ⟨row, later, rowMatches⟩
            exact ⟨chosen, by simpa only [RootResetEdgeFragment.select, matched,
              Bool.false_eq_true, ↓reduceIte] using selected⟩

theorem selected_exact {Label : Type} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RouteView Label} {source : Term}
    (shape : RouteShape encode tree route view source) :
    ∃ row, RootResetEdgeFragment.select (routeRows encode tree route) source = some row ∧
      row.address = redexAddress view := by
  obtain ⟨row, selected⟩ := select_exists _ _ (row_complete shape)
  obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
  obtain ⟨found, foundShape, addressEq⟩ := row_sound encode tree route row member source matched
  have equal := foundShape.deterministic shape
  subst found
  exact ⟨row, selected, addressEq⟩

def initialRow {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) : EdgeRow :=
  ⟨callPattern (compileDispatcher encode tree), []⟩

def rows {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route) : List EdgeRow :=
  initialRow encode tree :: routeRows encode tree route

theorem shape_headArity {Label : Type} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RouteView Label} {source : Term}
    (shape : RouteShape encode tree route view source) : source.headArity = 2 := by
  cases shape with
  | root left right direction remaining stage => cases stage <;> rfl
  | left => rfl
  | right => rfl

theorem initial_misses_shape {Label : Type} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RouteView Label} {source : Term}
    (shape : RouteShape encode tree route view source) :
    (initialRow encode tree).pattern.matchesBool source = false := by
  cases matched : (initialRow encode tree).pattern.matchesBool source with
  | false => rfl
  | true =>
      obtain ⟨argument, sourceEq⟩ := call_sound matched
      have arity := shape_headArity shape
      rw [sourceEq] at arity
      have callArity := RouteGrammar.compiledCall_headArity encode tree argument
      change (Term.app (compileDispatcher encode tree) argument).headArity = 3 at callArity
      have impossible : (3 : Nat) = 2 := callArity.symm.trans arity
      cases impossible

theorem rows_selected_exact {Label : Type} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RouteView Label} {source : Term}
    (shape : RouteShape encode tree route view source) :
    ∃ row, RootResetEdgeFragment.select (rows encode tree route) source = some row ∧
      row.address = redexAddress view := by
  obtain ⟨row, selected, addressEq⟩ := selected_exact shape
  exact ⟨row, by simpa only [rows, RootResetEdgeFragment.select,
    initial_misses_shape shape, Bool.false_eq_true, ↓reduceIte] using selected, addressEq⟩

theorem rows_selected_initial {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route) (argument : Term) :
    RootResetEdgeFragment.select (rows encode tree route)
      (RouteGrammar.compiledCall encode tree argument) = some (initialRow encode tree) := by
  simp only [rows, RootResetEdgeFragment.select, initialRow, callPattern,
    RouteGrammar.compiledCall, Pattern.matchesBool, literal_self, Bool.and_self, ↓reduceIte]

theorem rows_sound {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route) (row : EdgeRow)
    (member : row ∈ rows encode tree route) (source : Term)
    (matched : row.pattern.matchesBool source = true) :
    ∃ target replacement, source.subterm? row.address = some target ∧
      target.contractRoot? = some replacement := by
  rcases List.mem_cons.mp member with equal | later
  · subst row
    obtain ⟨argument, sourceEq⟩ := call_sound matched
    subst source
    exact ⟨_, _, Term.subterm?_root _,
      RootResetDispatcherNodeStages.contractRoot?_compiledCall encode tree argument⟩
  · obtain ⟨view, shape, addressEq⟩ := row_sound encode tree route row later source matched
    exact ⟨view.redexTerm encode, view.replacement encode,
      by rw [addressEq]; exact shape.redex_subterm, view.redex_contractRoot encode⟩

theorem rows_matching_addresses_eq {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route) (first second : EdgeRow)
    (firstMember : first ∈ rows encode tree route) (secondMember : second ∈ rows encode tree route)
    (source : Term) (firstMatches : first.pattern.matchesBool source = true)
    (secondMatches : second.pattern.matchesBool source = true) : first.address = second.address := by
  rcases List.mem_cons.mp firstMember with firstInitial | firstStage
  · subst first
    rcases List.mem_cons.mp secondMember with secondInitial | secondStage
    · subst second; rfl
    · obtain ⟨view, shape, _⟩ := row_sound encode tree route second secondStage source secondMatches
      rw [initial_misses_shape shape] at firstMatches
      cases firstMatches
  · obtain ⟨firstView, firstShape, firstAddress⟩ := row_sound encode tree route first firstStage source firstMatches
    rcases List.mem_cons.mp secondMember with secondInitial | secondStage
    · subst second
      rw [initial_misses_shape firstShape] at secondMatches
      cases secondMatches
    · obtain ⟨secondView, secondShape, secondAddress⟩ := row_sound encode tree route second secondStage source secondMatches
      have equal := firstShape.deterministic secondShape
      subst secondView
      exact firstAddress.trans secondAddress.symm

abbrev Control {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route) :=
  RootResetEdgeFragment.Control (rows encode tree route)

abbrev machine {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route) :=
  RootResetEdgeFragment.machine (rows encode tree route)

abbrev initial {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route) (origin : Cursor) :=
  RootResetEdgeFragment.initial (rows encode tree route) origin

def bound {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route) : Nat :=
  RootResetEdgeFragment.bound (rows encode tree route)

theorem all_input {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route) (origin : Cursor) :
    ∃ ticks ready, ∃ (endpoint : Cursor), ∃
      (member : ProbeCompiler.Control.answer ready ∈
        (RootResetEdgeFragment.familyCode (rows encode tree route)).nodes),
      ticks ≤ bound encode tree route ∧
      run (machine encode tree route) ticks (initial encode tree route origin) =
        ⟨some ⟨.answer ready, member⟩, endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) := by
  generalize selected : RootResetEdgeFragment.select (rows encode tree route) origin.focus = result
  cases result with
  | none =>
      obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs _ origin selected
      exact ⟨_, false, origin, member, RootResetEdgeFragment.ticks_bound _ _, execution, rfl⟩
  | some row =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
      obtain ⟨target, replacement, subterm, contracts⟩ := rows_sound encode tree route row member _ matched
      obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists _ _ _ subterm origin.parents
      obtain ⟨lastMember, execution⟩ := RootResetEdgeFragment.selected_runs _ origin endpoint row selected followed
      refine ⟨_, true, endpoint, lastMember, RootResetEdgeFragment.ticks_bound _ _, execution, ?_⟩
      simp only [↓reduceIte, Cursor.rdx?, focusEq, contracts, Option.isSome_some]

theorem generated_shape {Label : Type} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RouteView Label} {source : Term}
    (shape : RouteShape encode tree route view source) (parents : List ParentFrame) :
    ∃ ticks, ∃ (endpoint : Cursor), ∃
      (member : ProbeCompiler.Control.answer true ∈
        (RootResetEdgeFragment.familyCode (rows encode tree route)).nodes),
      ticks ≤ bound encode tree route ∧
      run (machine encode tree route) ticks (initial encode tree route ⟨source, parents⟩) =
        ⟨some ⟨.answer true, member⟩, endpoint⟩ ∧
      RootResetEdgeFragment.follow (redexAddress view) ⟨source, parents⟩ = some endpoint ∧
      endpoint.focus = view.redexTerm encode ∧
      endpoint.rdx? = some { endpoint with focus := view.replacement encode } := by
  obtain ⟨row, selected, addressEq⟩ := rows_selected_exact shape
  obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists _ _ _ shape.redex_subterm parents
  obtain ⟨member, execution⟩ := RootResetEdgeFragment.selected_runs _ ⟨source, parents⟩ endpoint row selected
    (by rw [addressEq]; exact followed)
  refine ⟨_, endpoint, member, RootResetEdgeFragment.ticks_bound _ _, execution, followed, focusEq, ?_⟩
  simp only [Cursor.rdx?, focusEq, view.redex_contractRoot encode]

theorem generated_initial {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route)
    (argument : Term) (parents : List ParentFrame) :
    ∃ ticks, ∃
      (member : ProbeCompiler.Control.answer true ∈
        (RootResetEdgeFragment.familyCode (rows encode tree route)).nodes),
      ticks ≤ bound encode tree route ∧
      run (machine encode tree route) ticks
        (initial encode tree route ⟨RouteGrammar.compiledCall encode tree argument, parents⟩) =
        ⟨some ⟨.answer true, member⟩, ⟨RouteGrammar.compiledCall encode tree argument, parents⟩⟩ := by
  obtain ⟨member, execution⟩ := RootResetEdgeFragment.selected_runs _ _ _ _
    (rows_selected_initial encode tree route argument) (show RootResetEdgeFragment.follow
      (initialRow encode tree).address ⟨RouteGrammar.compiledCall encode tree argument, parents⟩ =
        some ⟨RouteGrammar.compiledCall encode tree argument, parents⟩ from rfl)
  exact ⟨_, member, RootResetEdgeFragment.ticks_bound _ _, execution⟩

theorem runMutationCount_zero {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route)
    (ticks : Nat) (configuration : Configuration (Control encode tree route)) :
    runMutationCount (machine encode tree route) ticks configuration = 0 :=
  RootResetEdgeFragment.runMutationCount_zero _ ticks configuration

theorem erase_run {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route)
    (ticks : Nat) (configuration : Configuration (Control encode tree route)) :
    (run (machine encode tree route) ticks configuration).cursor.erase = configuration.cursor.erase :=
  RootResetEdgeFragment.erase_run _ ticks configuration

theorem routeMutation_shape {Label : Type} {encode : Label → Term} {carrier : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {done : Bool} {source : Term}
    (progress : SchedulerResponseInvariant.RouteMutation encode carrier tree route label done source)
    (unfinished : done = false) :
    ∃ view, RouteShape encode tree route view source := by
  induction progress with
  | leaf => cases unfinished
  | exposeLeft path => exact ⟨_, .root _ _ .left _ (.exposed ⟨carrier, carrier⟩)⟩
  | selectLeft path => exact ⟨_, .root _ _ .left _ (.forked ⟨carrier, carrier, carrier⟩)⟩
  | exposeRight path => exact ⟨_, .root _ _ .right _ (.exposed ⟨carrier, carrier⟩)⟩
  | selectRight path => exact ⟨_, .root _ _ .right _ (.forked ⟨carrier, carrier, carrier⟩)⟩
  | innerLeft progress ih =>
      obtain ⟨view, shape⟩ := ih unfinished
      exact ⟨_, .left carrier carrier shape⟩
  | innerRight progress ih =>
      obtain ⟨view, shape⟩ := ih unfinished
      exact ⟨_, .right carrier carrier shape⟩

theorem generated_route_entry {Label : Type} (encode : Label → Term) (carrier : Term)
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (source : Term)
    (entry : (false, source) ∈ SchedulerResponseInvariant.routeEntries encode carrier tree route)
    (parents : List ParentFrame) :
    ∃ view, RouteShape encode tree route view source ∧
    ∃ ticks, ∃ (endpoint : Cursor), ∃
      (member : ProbeCompiler.Control.answer true ∈
        (RootResetEdgeFragment.familyCode (rows encode tree route)).nodes),
      ticks ≤ bound encode tree route ∧
      run (machine encode tree route) ticks (initial encode tree route ⟨source, parents⟩) =
        ⟨some ⟨.answer true, member⟩, endpoint⟩ ∧
      RootResetEdgeFragment.follow (redexAddress view) ⟨source, parents⟩ = some endpoint ∧
      endpoint.focus = view.redexTerm encode ∧
      endpoint.rdx? = some { endpoint with focus := view.replacement encode } := by
  obtain ⟨view, shape⟩ := routeMutation_shape
    (SchedulerResponseInvariant.routeEntries_spec path entry) rfl
  exact ⟨view, shape, generated_shape shape parents⟩

end PureSFormal.Research.RootResetDispatcherStageRows
