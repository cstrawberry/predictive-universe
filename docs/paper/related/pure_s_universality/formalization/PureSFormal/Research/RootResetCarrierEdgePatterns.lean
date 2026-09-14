import PureSFormal.Research.RootResetCompletedLocalPatterns
import PureSFormal.Research.RootResetResponseBoundaryStages

/-!
# Completed Local patterns with fixed accumulator addresses

The fixed program and dispatcher determine finitely many pattern/address
rows. Matching a row certifies a completed Local parse and places its
accumulator at exactly the associated address. Every completed Local parse
has such a row. Routes and addresses are compile-time metadata; execution
will compile them into local observation and cursor-move states.
-/

namespace PureSFormal.Research.RootResetCarrierEdgePatterns

open PureSFormal.PureS
open RootResetCompletedLocalPatterns

structure DispatchRow (program : CTS.Program) where
  pattern : Pattern
  route : Dispatcher.Route
  label : ActionLabel program

def leftRow (program : CTS.Program) (right : Dispatcher.Tree (ActionLabel program))
    (row : DispatchRow program) : DispatchRow program :=
  ⟨chosenPattern (.app row.pattern (callPattern (compileDispatcher (selectedAction program) right))),
    .left :: row.route, row.label⟩

def rightRow (program : CTS.Program) (left : Dispatcher.Tree (ActionLabel program))
    (row : DispatchRow program) : DispatchRow program :=
  ⟨chosenPattern (.app (callPattern (compileDispatcher (selectedAction program) left)) row.pattern),
    .right :: row.route, row.label⟩

def dispatchRows (program : CTS.Program) : Dispatcher.Tree (ActionLabel program) → List (DispatchRow program)
  | .leaf label => [⟨chosenPattern (actionPattern (ActionParser.historyCount program label)), [], label⟩]
  | .node left right => (dispatchRows program left).map (leftRow program right) ++
      (dispatchRows program right).map (rightRow program left)

theorem dispatchRow_sound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : DispatchRow program) (member : row ∈ dispatchRows program tree) (source : Term)
    (matched : row.pattern.matchesBool source = true) :
    ∃ accumulator, DispatchParser.DispatchShape program tree row.route row.label accumulator source := by
  induction tree generalizing row source with
  | leaf label =>
      have rowEq := List.mem_singleton.mp member
      subst row
      obtain ⟨audit, response, sourceEq, actionMatches⟩ := chosen_sound matched
      obtain ⟨accumulator, histories, countEq, responseEq⟩ := action_sound _ response actionMatches
      subst source
      exact ⟨accumulator, response, histories, .leaf label audit response, countEq, responseEq⟩
  | node left right ihLeft ihRight =>
      rcases List.mem_append.mp member with leftMember | rightMember
      · obtain ⟨active, activeMember, rowEq⟩ := map_member_inverse _ _ _ leftMember
        subst row
        obtain ⟨outerAudit, fork, sourceEq, forkMatches⟩ := chosen_sound matched
        obtain ⟨activeTerm, dormantTerm, forkEq, activeMatches, dormantMatches⟩ := app_matches forkMatches
        obtain ⟨dormantAudit, dormantEq⟩ := call_sound dormantMatches
        obtain ⟨accumulator, response, histories, inner, countEq, responseEq⟩ :=
          ihLeft active activeMember activeTerm activeMatches
        subst source
        subst fork
        subst dormantTerm
        exact ⟨accumulator, response, histories, .left outerAudit dormantAudit inner, countEq, responseEq⟩
      · obtain ⟨active, activeMember, rowEq⟩ := map_member_inverse _ _ _ rightMember
        subst row
        obtain ⟨outerAudit, fork, sourceEq, forkMatches⟩ := chosen_sound matched
        obtain ⟨dormantTerm, activeTerm, forkEq, dormantMatches, activeMatches⟩ := app_matches forkMatches
        obtain ⟨dormantAudit, dormantEq⟩ := call_sound dormantMatches
        obtain ⟨accumulator, response, histories, inner, countEq, responseEq⟩ :=
          ihRight active activeMember activeTerm activeMatches
        subst source
        subst fork
        subst dormantTerm
        exact ⟨accumulator, response, histories, .right outerAudit dormantAudit inner, countEq, responseEq⟩

theorem dispatchRow_complete
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program} {accumulator field : Term}
    (shape : DispatchParser.DispatchShape program tree route label accumulator field) :
    ∃ row ∈ dispatchRows program tree, row.route = route ∧ row.label = label ∧
      row.pattern.matchesBool field = true := by
  obtain ⟨response, histories, routeShape, historyCount, responseEq⟩ := shape
  have actionMatches : (actionPattern (ActionParser.historyCount program label)).matchesBool response = true := by
    rw [responseEq, ← historyCount]
    exact action_matches accumulator histories
  induction routeShape with
  | leaf label audit response => exact ⟨_, List.Mem.head _, rfl, rfl, actionMatches⟩
  | @left left right route label response active outerAudit dormantAudit inner ih =>
      obtain ⟨row, member, routeEq, labelEq, matched⟩ := ih historyCount responseEq actionMatches
      refine ⟨leftRow program right row, List.mem_append.mpr (Or.inl (map_member _ member)),
        congrArg (List.cons Direction.left) routeEq, labelEq, ?_⟩
      simp only [leftRow, chosenPattern, callPattern, RouteGrammar.selectedLeft,
        RouteGrammar.compiledCall, chosen, Pattern.matchesBool, literal_self,
        matched, Bool.true_and, Bool.and_true]
  | @right left right route label response active outerAudit dormantAudit inner ih =>
      obtain ⟨row, member, routeEq, labelEq, matched⟩ := ih historyCount responseEq actionMatches
      refine ⟨rightRow program left row, List.mem_append.mpr (Or.inr (map_member _ member)),
        congrArg (List.cons Direction.right) routeEq, labelEq, ?_⟩
      simp only [rightRow, chosenPattern, callPattern, RouteGrammar.selectedRight,
        RouteGrammar.compiledCall, chosen, Pattern.matchesBool, literal_self,
        matched, Bool.true_and, Bool.and_true]

structure EdgeRow where
  pattern : Pattern
  address : Address

def localRow (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (row : DispatchRow program) : EdgeRow :=
  ⟨localPattern status row.pattern, [.left, .left, .right] ++
    RootResetReachableStageGrammar.routeResponseAddress row.route ++
    ActionParser.accumulatorAddress (ActionParser.historyCount program row.label)⟩

def localRows (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : List EdgeRow :=
  (dispatchRows program tree).map (localRow status program)

theorem localRow_sound (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (row : DispatchRow program)
    (member : row ∈ dispatchRows program tree) (source : Term)
    (matched : (localRow status program row).pattern.matchesBool source = true) :
    ∃ view : CheckpointDecoder.LocalView program, view.status = status ∧
      CheckpointDecoder.parseLocal? program tree source = some view ∧
      (localRow status program row).address = RootResetResponseBoundaryStages.localAccumulatorAddress view := by
  obtain ⟨left, right, sourceEq, leftMatches, rightMatches⟩ := app_matches matched
  obtain ⟨continuation, continuationAudit, rightEq, _, _⟩ := app_matches rightMatches
  obtain ⟨head, seed, leftEq, headMatches, seedMatches⟩ := app_matches leftMatches
  obtain ⟨haltField, dispatcher, headEq, haltMatched, dispatcherMatched⟩ := app_matches headMatches
  obtain ⟨seedHead, seedAudit, seedEq, seedHeadMatches, _⟩ := app_matches seedMatches
  obtain ⟨sHead, payload, seedHeadEq, sMatched, _⟩ := app_matches seedHeadMatches
  have sEq : sHead = .s := (Pattern.matches_s_iff sHead).mp (Pattern.matchesBool_sound sMatched)
  have haltShape := halt_sound status haltField haltMatched
  obtain ⟨accumulator, dispatchShape⟩ := dispatchRow_sound program tree row member dispatcher dispatcherMatched
  let view : CheckpointDecoder.LocalView program := ⟨status, row.route, row.label, accumulator, payload, continuation⟩
  have shape : CheckpointDecoder.LocalShape program tree view source := by
    refine ⟨haltField, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, ?_⟩
    rw [sourceEq, leftEq, headEq, rightEq, seedEq, seedHeadEq, sEq]
    rfl
  exact ⟨view, rfl, CheckpointDecoder.parseLocal?_complete shape, rfl⟩

theorem localRow_complete
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {view : CheckpointDecoder.LocalView program} {source : Term}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) :
    ∃ row ∈ localRows view.status program tree, row.pattern.matchesBool source = true ∧
      row.address = RootResetResponseBoundaryStages.localAccumulatorAddress view := by
  obtain ⟨haltField, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, sourceEq⟩ :=
    CheckpointDecoder.parseLocal?_sound parsed
  obtain ⟨row, member, routeEq, labelEq, matched⟩ := dispatchRow_complete dispatchShape
  refine ⟨localRow view.status program row, map_member _ member, ?_, ?_⟩
  · rw [sourceEq]
    simp only [localRow, localPattern, CheckpointDecoder.openShell, Pattern.matchesBool,
      halt_matches haltShape, matched, Bool.true_and, Bool.and_true]
  · simp only [localRow, RootResetResponseBoundaryStages.localAccumulatorAddress, routeEq, labelEq]

end PureSFormal.Research.RootResetCarrierEdgePatterns


