import PureSFormal.Research.RootResetDispatcherStageRows
import PureSFormal.Research.RootResetAppenderRouteRows

/-! Fixed recovered-route dispatcher rows entered at a fresh Local root. -/
namespace PureSFormal.Research.RootResetDispatcherLocalRows
open PureSFormal.PureS
open RootResetCompletedLocalPatterns
open RootResetCarrierEdgePatterns (EdgeRow)
open FiniteController

def lift (row : EdgeRow) : EdgeRow :=
  ⟨localPattern .fresh row.pattern, RootResetAppenderRouteRows.shellAddress ++ row.address⟩

def rows {Label : Type} (encode : Label → Term) (tree : Dispatcher.Tree Label)
    (route : Dispatcher.Route) : List EdgeRow :=
  (RootResetDispatcherStageRows.rows encode tree route).map lift

theorem edge_redex {Label : Type} (encode : Label → Term) (tree : Dispatcher.Tree Label)
    (route : Dispatcher.Route) (edge : EdgeRow) (member : edge ∈ rows encode tree route)
    (source : Term) (matched : edge.pattern.matchesBool source = true) :
    ∃ focus replacement, source.subterm? edge.address = some focus ∧ focus.contractRoot? = some replacement := by
  obtain ⟨row, inside, equal⟩ := map_member_inverse _ _ _ member
  subst edge
  obtain ⟨dispatcher, placement, bodyMatches⟩ := RootResetAppenderRouteRows.local_dispatcher row.pattern source matched
  obtain ⟨focus, replacement, subterm, redex⟩ := RootResetDispatcherStageRows.rows_sound encode tree route row inside dispatcher bodyMatches
  refine ⟨focus, replacement, ?_, redex⟩
  rw [lift, RootResetAppenderFiniteRows.subterm_append, placement]
  exact subterm

theorem matching_addresses_eq {Label : Type} (encode : Label → Term) (tree : Dispatcher.Tree Label)
    (route : Dispatcher.Route) (first second : EdgeRow)
    (firstMember : first ∈ rows encode tree route) (secondMember : second ∈ rows encode tree route)
    (source : Term) (firstMatches : first.pattern.matchesBool source = true)
    (secondMatches : second.pattern.matchesBool source = true) : first.address = second.address := by
  obtain ⟨firstRow, firstInside, firstEq⟩ := map_member_inverse _ _ _ firstMember
  obtain ⟨secondRow, secondInside, secondEq⟩ := map_member_inverse _ _ _ secondMember
  subst first
  subst second
  obtain ⟨firstDispatcher, firstPlacement, firstBody⟩ := RootResetAppenderRouteRows.local_dispatcher firstRow.pattern source firstMatches
  obtain ⟨secondDispatcher, secondPlacement, secondBody⟩ := RootResetAppenderRouteRows.local_dispatcher secondRow.pattern source secondMatches
  have dispatcherEq := Option.some.inj (firstPlacement.symm.trans secondPlacement)
  subst secondDispatcher
  exact congrArg (List.append RootResetAppenderRouteRows.shellAddress)
    (RootResetDispatcherStageRows.rows_matching_addresses_eq encode tree route firstRow secondRow
      firstInside secondInside firstDispatcher firstBody secondBody)

theorem all_input {Label : Type} (encode : Label → Term) (tree : Dispatcher.Tree Label)
    (route : Dispatcher.Route) (origin : Cursor) :
    ∃ ready endpoint member,
      run (RootResetEdgeFragment.machine (rows encode tree route))
        (RootResetEdgeFragment.ticks (rows encode tree route) origin.focus)
        (RootResetEdgeFragment.initial (rows encode tree route) origin) =
        ⟨some ⟨ProbeCompiler.Control.answer ready, member⟩, endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) ∧
      RootResetEdgeFragment.ticks (rows encode tree route) origin.focus ≤
        RootResetEdgeFragment.bound (rows encode tree route) := by
  cases selected : RootResetEdgeFragment.select (rows encode tree route) origin.focus with
  | none =>
      obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs _ origin selected
      exact ⟨false, origin, member, execution, rfl, RootResetEdgeFragment.ticks_bound _ _⟩
  | some edge =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
      obtain ⟨focus, replacement, subterm, redex⟩ := edge_redex encode tree route edge member origin.focus matched
      obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists _ _ _ subterm origin.parents
      obtain ⟨lastMember, execution⟩ := RootResetEdgeFragment.selected_runs _ origin endpoint edge selected followed
      refine ⟨true, endpoint, lastMember, execution, ?_, RootResetEdgeFragment.ticks_bound _ _⟩
      simp only [↓reduceIte, Cursor.rdx?, focusEq, redex]; rfl

theorem lifted_generated {Label : Type} (encode : Label → Term) (tree : Dispatcher.Tree Label)
    (route : Dispatcher.Route) (wanted : EdgeRow)
    (member : wanted ∈ RootResetDispatcherStageRows.rows encode tree route) (dispatcher : Term)
    (matched : wanted.pattern.matchesBool dispatcher = true)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term) (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
      (word bits) seedAudit continuation continuationAudit
    ∃ endpoint controlMember,
      RootResetEdgeFragment.follow (RootResetAppenderRouteRows.shellAddress ++ wanted.address)
        ⟨source, parents⟩ = some endpoint ∧
      run (RootResetEdgeFragment.machine (rows encode tree route))
        (RootResetEdgeFragment.ticks (rows encode tree route) source)
        (RootResetEdgeFragment.initial (rows encode tree route) ⟨source, parents⟩) =
        ⟨some ⟨ProbeCompiler.Control.answer true, controlMember⟩, endpoint⟩ ∧
      endpoint.rdx?.isSome = true := by
  dsimp only
  let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
    (word bits) seedAudit continuation continuationAudit
  have localMatches : (lift wanted).pattern.matchesBool source = true := by
    simp only [lift, localPattern, source, CheckpointDecoder.openShell, haltPattern, freshHField,
      Pattern.matchesBool, literal_self, matched, Bool.true_and, Bool.and_true]
  have inside : lift wanted ∈ rows encode tree route := map_member _ member
  obtain ⟨selected, found⟩ := RootResetAppenderFiniteRows.select_exists _ source (lift wanted) inside localMatches
  obtain ⟨selectedMember, selectedMatches⟩ := RootResetEdgeFragment.select_sound _ _ _ found
  have addressEq := matching_addresses_eq encode tree route selected (lift wanted) selectedMember inside source selectedMatches localMatches
  obtain ⟨focus, replacement, subterm, redex⟩ := edge_redex encode tree route (lift wanted) inside source localMatches
  obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists _ _ _ subterm parents
  obtain ⟨controlMember, execution⟩ := RootResetEdgeFragment.selected_runs _ ⟨source, parents⟩ endpoint selected found
    (by rw [addressEq]; exact followed)
  refine ⟨endpoint, controlMember, followed, execution, ?_⟩
  simp only [Cursor.rdx?, focusEq, redex]; rfl

theorem generated_shape {Label : Type} {encode : Label → Term} {tree : Dispatcher.Tree Label}
    {route : Dispatcher.Route} {view : RootResetWholeDispatcherStages.RouteView Label} {dispatcher : Term}
    (shape : RootResetWholeDispatcherStages.RouteShape encode tree route view dispatcher)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term) (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
      (word bits) seedAudit continuation continuationAudit
    ∃ endpoint controlMember,
      RootResetEdgeFragment.follow
        (RootResetAppenderRouteRows.shellAddress ++ RootResetDispatcherStageRows.redexAddress view)
        ⟨source, parents⟩ = some endpoint ∧
      run (RootResetEdgeFragment.machine (rows encode tree route))
        (RootResetEdgeFragment.ticks (rows encode tree route) source)
        (RootResetEdgeFragment.initial (rows encode tree route) ⟨source, parents⟩) =
        ⟨some ⟨ProbeCompiler.Control.answer true, controlMember⟩, endpoint⟩ ∧
      endpoint.rdx?.isSome = true := by
  obtain ⟨wanted, selected, addressEq⟩ := RootResetDispatcherStageRows.rows_selected_exact shape
  obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
  obtain ⟨endpoint, controlMember, followed, execution, redex⟩ :=
    lifted_generated encode tree route wanted member dispatcher matched bits continuation haltAudit seedAudit continuationAudit parents
  exact ⟨endpoint, controlMember, by rw [← addressEq]; exact followed, execution, redex⟩

theorem generated_initial {Label : Type} (encode : Label → Term) (tree : Dispatcher.Tree Label)
    (route : Dispatcher.Route) (argument : Term)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term) (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField haltAudit)
      (RouteGrammar.compiledCall encode tree argument) (word bits) seedAudit continuation continuationAudit
    ∃ endpoint controlMember,
      RootResetEdgeFragment.follow RootResetAppenderRouteRows.shellAddress
        ⟨source, parents⟩ = some endpoint ∧
      run (RootResetEdgeFragment.machine (rows encode tree route))
        (RootResetEdgeFragment.ticks (rows encode tree route) source)
        (RootResetEdgeFragment.initial (rows encode tree route) ⟨source, parents⟩) =
        ⟨some ⟨ProbeCompiler.Control.answer true, controlMember⟩, endpoint⟩ ∧
      endpoint.rdx?.isSome = true := by
  obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ _
    (RootResetDispatcherStageRows.rows_selected_initial encode tree route argument)
  obtain ⟨endpoint, controlMember, followed, execution, redex⟩ :=
    lifted_generated encode tree route _ member _ matched bits continuation haltAudit seedAudit continuationAudit parents
  exact ⟨endpoint, controlMember, followed, execution, redex⟩

theorem runMutationCount_zero {Label : Type} (encode : Label → Term) (tree : Dispatcher.Tree Label)
    (route : Dispatcher.Route) (ticks : Nat)
    (configuration : Configuration (RootResetEdgeFragment.Control (rows encode tree route))) :
    runMutationCount (RootResetEdgeFragment.machine (rows encode tree route)) ticks configuration = 0 :=
  RootResetEdgeFragment.runMutationCount_zero _ _ _

theorem erase_run {Label : Type} (encode : Label → Term) (tree : Dispatcher.Tree Label)
    (route : Dispatcher.Route) (ticks : Nat)
    (configuration : Configuration (RootResetEdgeFragment.Control (rows encode tree route))) :
    (run (RootResetEdgeFragment.machine (rows encode tree route)) ticks configuration).cursor.erase = configuration.cursor.erase :=
  RootResetEdgeFragment.erase_run _ _ _

end PureSFormal.Research.RootResetDispatcherLocalRows
