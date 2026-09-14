import PureSFormal.Research.RootResetLocalContinuationFragment
import PureSFormal.PureS.DispatchParser
import PureSFormal.PureS.CheckpointConstructors

/-!
# Finite patterns for completed Local admission

For each fixed program and dispatcher tree, a finite list of bounded patterns
recognizes exactly the completed Local parser language at the chosen fresh or
marked status. Route skeletons, compiled dormant sibling code, and the
label-specific number of retained action histories are checked; every audit
and mutable field remains an independent wildcard. Fresh status requires
a nonempty-carrier admission check before continuation dispatch.
-/
namespace PureSFormal.Research.RootResetCompletedLocalPatterns

open PureSFormal.PureS

def literal : Term → Pattern
  | .s => .s
  | .app fn arg => .app (literal fn) (literal arg)

theorem literal_matches (wanted source : Term) :
    (literal wanted).matchesBool source = true ↔ source = wanted := by
  induction wanted generalizing source with
  | s => cases source <;> simp [literal, Pattern.matchesBool]
  | app fn arg ihFn ihArg =>
      cases source <;> simp [literal, Pattern.matchesBool, Bool.and_eq_true, ihFn, ihArg]

theorem literal_self (source : Term) : (literal source).matchesBool source = true :=
  (literal_matches source source).mpr rfl

def extend (base : Pattern) : Nat → Pattern
  | 0 => base
  | count + 1 => extend (.app base .hole) count

def actionPattern (count : Nat) : Pattern := extend (.app (.app .s (literal b)) .hole) count

theorem extend_matches (base : Pattern) (source : Term) (matched : base.matchesBool source = true)
    (arguments : List Term) :
    (extend base arguments.length).matchesBool (Term.applyArgs source arguments) = true := by
  induction arguments generalizing base source with
  | nil => exact matched
  | cons argument arguments ih =>
      apply ih (.app base .hole) (.app source argument)
      simpa only [Pattern.matchesBool, Bool.and_true] using matched

theorem action_matches (accumulator : Term) (histories : List Term) :
    (actionPattern histories.length).matchesBool (Term.applyArgs (.app p accumulator) histories) = true := by
  exact extend_matches _ _ rfl histories

theorem app_matches {left right : Pattern} {source : Term}
    (matched : (Pattern.app left right).matchesBool source = true) :
    ∃ fn arg, source = .app fn arg ∧ left.matchesBool fn = true ∧ right.matchesBool arg = true := by
  cases source with
  | s => cases matched
  | app fn arg =>
      refine ⟨fn, arg, rfl, ?_⟩
      simpa only [Pattern.matchesBool, Bool.and_eq_true] using matched

theorem extend_sound (count : Nat) (base : Pattern) (source : Term)
    (matched : (extend base count).matchesBool source = true) :
    ∃ core arguments, arguments.length = count ∧ base.matchesBool core = true ∧
      source = Term.applyArgs core arguments := by
  induction count generalizing base source with
  | zero => exact ⟨source, [], rfl, matched, rfl⟩
  | succ count ih =>
      obtain ⟨core, arguments, countEq, coreMatches, sourceEq⟩ := ih (.app base .hole) source matched
      obtain ⟨fn, arg, coreEq, fnMatches, _⟩ := app_matches coreMatches
      subst core
      exact ⟨fn, arg :: arguments, congrArg Nat.succ countEq, fnMatches, sourceEq⟩

theorem action_sound (count : Nat) (source : Term)
    (matched : (actionPattern count).matchesBool source = true) :
    ∃ accumulator histories, histories.length = count ∧
      source = Term.applyArgs (.app p accumulator) histories := by
  obtain ⟨core, histories, countEq, coreMatches, sourceEq⟩ := extend_sound count _ source matched
  obtain ⟨fn, accumulator, coreEq, fnMatches, _⟩ := app_matches coreMatches
  obtain ⟨head, fixed, fnEq, headMatches, fixedMatches⟩ := app_matches fnMatches
  have headEq : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound headMatches)
  have fixedEq : fixed = b := (literal_matches b fixed).mp fixedMatches
  subst head
  subst fixed
  subst fn
  subst core
  exact ⟨accumulator, histories, countEq, sourceEq⟩

def chosenPattern (response : Pattern) : Pattern := .app (.app .s .hole) response
def callPattern (code : Term) : Pattern := .app (literal code) .hole

theorem chosen_sound {pattern : Pattern} {source : Term}
    (matched : (chosenPattern pattern).matchesBool source = true) :
    ∃ audit response, source = chosen audit response ∧ pattern.matchesBool response = true := by
  obtain ⟨fn, response, sourceEq, fnMatches, responseMatches⟩ := app_matches matched
  obtain ⟨head, audit, fnEq, headMatches, _⟩ := app_matches fnMatches
  have headEq : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound headMatches)
  subst head
  subst fn
  exact ⟨audit, response, sourceEq, responseMatches⟩

theorem call_sound {code source : Term}
    (matched : (callPattern code).matchesBool source = true) :
    ∃ audit, source = .app code audit := by
  obtain ⟨fn, audit, sourceEq, fnMatches, _⟩ := app_matches matched
  have fnEq : fn = code := (literal_matches code fn).mp fnMatches
  subst fn
  exact ⟨audit, sourceEq⟩

def patterns (program : CTS.Program) : Dispatcher.Tree (ActionLabel program) → List Pattern
  | .leaf label => [chosenPattern (actionPattern (ActionParser.historyCount program label))]
  | .node left right =>
      (patterns program left).map (fun active => chosenPattern
        (.app active (callPattern (compileDispatcher (selectedAction program) right)))) ++
      (patterns program right).map (fun active => chosenPattern
        (.app (callPattern (compileDispatcher (selectedAction program) left)) active))

theorem map_member {α β : Type} (f : α → β) {value : α} {list : List α}
    (member : value ∈ list) : f value ∈ list.map f := by
  induction member with
  | head => exact List.Mem.head _
  | tail head member ih => exact List.Mem.tail _ ih

theorem map_member_inverse {α β : Type} (f : α → β) (list : List α) (value : β)
    (member : value ∈ list.map f) : ∃ before ∈ list, f before = value := by
  induction list with
  | nil => cases member
  | cons head tail ih =>
      rcases List.mem_cons.mp member with equal | later
      · exact ⟨head, List.Mem.head _, equal.symm⟩
      · obtain ⟨before, previous, equal⟩ := ih later
        exact ⟨before, List.Mem.tail _ previous, equal⟩

theorem dispatch_sound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (pattern : Pattern) (member : pattern ∈ patterns program tree) (source : Term)
    (matched : pattern.matchesBool source = true) :
    ∃ route label accumulator, DispatchParser.DispatchShape program tree route label accumulator source := by
  induction tree generalizing pattern source with
  | leaf label =>
      have patternEq := List.mem_singleton.mp member
      subst pattern
      obtain ⟨audit, response, sourceEq, actionMatches⟩ := chosen_sound matched
      obtain ⟨accumulator, histories, countEq, responseEq⟩ := action_sound _ response actionMatches
      subst source
      exact ⟨[], label, accumulator, response, histories, .leaf label audit response, countEq, responseEq⟩
  | node left right ihLeft ihRight =>
      rcases List.mem_append.mp member with leftMember | rightMember
      · obtain ⟨active, activeMember, patternEq⟩ := map_member_inverse _ _ _ leftMember
        subst pattern
        obtain ⟨outerAudit, fork, sourceEq, forkMatches⟩ := chosen_sound matched
        obtain ⟨activeTerm, dormantTerm, forkEq, activeMatches, dormantMatches⟩ := app_matches forkMatches
        obtain ⟨dormantAudit, dormantEq⟩ := call_sound dormantMatches
        obtain ⟨route, label, accumulator, response, histories, inner, countEq, responseEq⟩ :=
          ihLeft active activeMember activeTerm activeMatches
        subst source
        subst fork
        subst dormantTerm
        exact ⟨.left :: route, label, accumulator, response, histories,
          .left outerAudit dormantAudit inner, countEq, responseEq⟩
      · obtain ⟨active, activeMember, patternEq⟩ := map_member_inverse _ _ _ rightMember
        subst pattern
        obtain ⟨outerAudit, fork, sourceEq, forkMatches⟩ := chosen_sound matched
        obtain ⟨dormantTerm, activeTerm, forkEq, dormantMatches, activeMatches⟩ := app_matches forkMatches
        obtain ⟨dormantAudit, dormantEq⟩ := call_sound dormantMatches
        obtain ⟨route, label, accumulator, response, histories, inner, countEq, responseEq⟩ :=
          ihRight active activeMember activeTerm activeMatches
        subst source
        subst fork
        subst dormantTerm
        exact ⟨.right :: route, label, accumulator, response, histories,
          .right outerAudit dormantAudit inner, countEq, responseEq⟩

theorem dispatch_matches
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program} {accumulator field : Term}
    (shape : DispatchParser.DispatchShape program tree route label accumulator field) :
    ∃ pattern ∈ patterns program tree, pattern.matchesBool field = true := by
  obtain ⟨response, histories, routeShape, historyCount, responseEq⟩ := shape
  have actionMatches : (actionPattern (ActionParser.historyCount program label)).matchesBool response = true := by
    rw [responseEq, ← historyCount]
    exact action_matches accumulator histories
  induction routeShape with
  | leaf label audit response =>
      exact ⟨_, List.Mem.head _, actionMatches⟩
  | @left left right route label response active outerAudit dormantAudit inner ih =>
      obtain ⟨pattern, member, matched⟩ := ih historyCount responseEq actionMatches
      refine ⟨_, List.mem_append.mpr (Or.inl (map_member _ member)), ?_⟩
      simp only [chosenPattern, callPattern, RouteGrammar.selectedLeft,
        RouteGrammar.compiledCall, chosen, Pattern.matchesBool, literal_self,
        matched, Bool.true_and, Bool.and_true]
  | @right left right route label response active outerAudit dormantAudit inner ih =>
      obtain ⟨pattern, member, matched⟩ := ih historyCount responseEq actionMatches
      refine ⟨_, List.mem_append.mpr (Or.inr (map_member _ member)), ?_⟩
      simp only [chosenPattern, callPattern, RouteGrammar.selectedRight,
        RouteGrammar.compiledCall, chosen, Pattern.matchesBool, literal_self,
        matched, Bool.true_and, Bool.and_true]


def haltPattern : CheckpointDecoder.HaltStatus → Pattern
  | .fresh => .app (literal haltCode) .hole
  | .marked => .app (.app .s .hole) (.app (literal haltTag) .hole)

def localPattern (status : CheckpointDecoder.HaltStatus) (dispatch : Pattern) : Pattern :=
  .app (.app (.app (haltPattern status) dispatch) (.app (.app .s .hole) .hole)) (.app .hole .hole)

def localPatterns (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : List Pattern :=
  (patterns program tree).map (localPattern status)

theorem halt_matches {status : CheckpointDecoder.HaltStatus} {field : Term}
    (shape : CheckpointDecoder.HaltShape status field) : (haltPattern status).matchesBool field = true := by
  cases shape with
  | fresh audit =>
      simp only [haltPattern, freshHField, Pattern.matchesBool, literal_self, Bool.and_true]
  | marked leftAudit rightAudit =>
      simp only [haltPattern, Carrier.markedHField, Pattern.matchesBool, literal_self,
        Bool.true_and, Bool.and_true]

theorem halt_sound (status : CheckpointDecoder.HaltStatus) (field : Term)
    (matched : (haltPattern status).matchesBool field = true) : CheckpointDecoder.HaltShape status field := by
  cases status with
  | fresh =>
      obtain ⟨code, audit, fieldEq, codeMatches, _⟩ := app_matches matched
      have codeEq := (literal_matches haltCode code).mp codeMatches
      subst code
      subst field
      exact .fresh audit
  | marked =>
      obtain ⟨left, right, fieldEq, leftMatches, rightMatches⟩ := app_matches matched
      obtain ⟨head, leftAudit, leftEq, headMatches, _⟩ := app_matches leftMatches
      obtain ⟨tag, rightAudit, rightEq, tagMatches, _⟩ := app_matches rightMatches
      have headEq : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound headMatches)
      have tagEq := (literal_matches haltTag tag).mp tagMatches
      subst head
      subst tag
      subst left
      subst right
      subst field
      exact .marked leftAudit rightAudit

theorem local_matches {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {view : CheckpointDecoder.LocalView program} {source : Term}
    (shape : CheckpointDecoder.LocalShape program tree view source) :
    ∃ pattern ∈ localPatterns view.status program tree, pattern.matchesBool source = true := by
  obtain ⟨haltField, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, sourceEq⟩ := shape
  obtain ⟨pattern, member, matched⟩ := dispatch_matches dispatchShape
  refine ⟨localPattern view.status pattern, map_member _ member, ?_⟩
  rw [sourceEq]
  simp only [localPattern, CheckpointDecoder.openShell, Pattern.matchesBool,
    halt_matches haltShape, matched, Bool.true_and, Bool.and_true]

theorem local_sound (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (pattern : Pattern)
    (member : pattern ∈ localPatterns status program tree) (source : Term)
    (matched : pattern.matchesBool source = true) :
    ∃ view : CheckpointDecoder.LocalView program,
      view.status = status ∧ CheckpointDecoder.LocalShape program tree view source := by
  obtain ⟨dispatchPattern, dispatchMember, patternEq⟩ := map_member_inverse _ _ _ member
  subst pattern
  obtain ⟨left, right, sourceEq, leftMatches, rightMatches⟩ := app_matches matched
  obtain ⟨continuation, continuationAudit, rightEq, _, _⟩ := app_matches rightMatches
  obtain ⟨head, seed, leftEq, headMatches, seedMatches⟩ := app_matches leftMatches
  obtain ⟨haltField, dispatcher, headEq, haltMatched, dispatcherMatched⟩ := app_matches headMatches
  obtain ⟨seedHead, seedAudit, seedEq, seedHeadMatches, _⟩ := app_matches seedMatches
  obtain ⟨sHead, payload, seedHeadEq, sMatched, _⟩ := app_matches seedHeadMatches
  have sEq : sHead = .s := (Pattern.matches_s_iff sHead).mp (Pattern.matchesBool_sound sMatched)
  have haltShape := halt_sound status haltField haltMatched
  obtain ⟨route, label, accumulator, dispatchShape⟩ := dispatch_sound program tree
    dispatchPattern dispatchMember dispatcher dispatcherMatched
  refine ⟨⟨status, route, label, accumulator, payload, continuation⟩, rfl,
    ⟨haltField, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, ?_⟩⟩
  rw [sourceEq, leftEq, headEq, rightEq, seedEq, seedHeadEq, sEq]
  rfl

theorem any_of_member (list : List Pattern) (source : Term) (pattern : Pattern)
    (member : pattern ∈ list) (matched : pattern.matchesBool source = true) :
    list.any (fun pattern => pattern.matchesBool source) = true := by
  induction member with
  | head => simp only [List.any_cons, matched, Bool.true_or]
  | tail head member ih => simp only [List.any_cons, ih, Bool.or_true]

theorem member_of_any (list : List Pattern) (source : Term)
    (matched : list.any (fun pattern => pattern.matchesBool source) = true) :
    ∃ pattern ∈ list, pattern.matchesBool source = true := by
  induction list with
  | nil => cases matched
  | cons head tail ih =>
      cases first : head.matchesBool source with
      | true => exact ⟨head, List.Mem.head _, first⟩
      | false =>
          have later : tail.any (fun pattern => pattern.matchesBool source) = true := by
            simpa only [List.any_cons, first, Bool.false_or] using matched
          obtain ⟨pattern, member, matched⟩ := ih later
          exact ⟨pattern, List.Mem.tail _ member, matched⟩

def accepts (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) : Bool :=
  (localPatterns status program tree).any (fun pattern => pattern.matchesBool source)

theorem accepts_iff_parse (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) :
    accepts status program tree source = true ↔
      ∃ view : CheckpointDecoder.LocalView program,
        view.status = status ∧ CheckpointDecoder.parseLocal? program tree source = some view := by
  constructor
  · intro matched
    obtain ⟨pattern, member, matched⟩ := member_of_any _ _ matched
    obtain ⟨view, statusEq, shape⟩ := local_sound status program tree pattern member source matched
    exact ⟨view, statusEq, CheckpointDecoder.parseLocal?_complete shape⟩
  · rintro ⟨view, statusEq, parsed⟩
    have shape := CheckpointDecoder.parseLocal?_sound parsed
    obtain ⟨pattern, member, matched⟩ := local_matches shape
    rw [statusEq] at member
    exact any_of_member _ _ pattern member matched


end PureSFormal.Research.RootResetCompletedLocalPatterns
