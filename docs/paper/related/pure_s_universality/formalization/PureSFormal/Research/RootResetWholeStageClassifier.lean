import PureSFormal.Research.RootResetAccumulatorClassifier
import PureSFormal.Research.RootResetReachableStageGrammar

/-!
# Whole-term root-reset stage recovery

This module composes two term-only components.  It first removes the canonical
outer prefix of completed marked Locals.  It then classifies the resulting
    active endpoint, with priority for a fresh completed Local, the three exact
    frame-prefix rows, a generic pending frame, and a registered clean/single-Open
accumulator.  The program and dispatcher tree are static parameters; the only
invocation input is the current bare term.

The phase used outside a fresh Local is reconstructed from the innermost
historical label (and is phase zero when no history is present).  Queue bits
and the front bit are parsed from current syntax.  A CLOSE result carries a
whole-term address and a proof that it contracts a saturated `S` redex.

Dispatcher half-rows, incomplete Push layers, clock/fuel relocation, and the
post-COMMIT continuation remain outside this classifier.  Accordingly the
explicit `unregistered` alternative is retained.
-/

namespace PureSFormal.Research.RootResetWholeStageClassifier

open PureSFormal.PureS
open RootResetReachableStageGrammar

namespace Accumulator

abbrev Stage := RootResetAccumulatorClassifier.Stage
abbrev TransactionView := RootResetAccumulatorClassifier.TransactionView

end Accumulator

/-- Finite whole-term stages currently recognized without a supplied role. -/
inductive Stage where
  | commitReady
  | frameR0
  | frameR1
  | frameR2
  | activatedRoute
  | selectedAction
  | pendingFrame
  | accumulatorClean
  | accumulatorClose
  | unregistered
  deriving BEq, DecidableEq, Inhabited, Repr

/-- Duplicate-free cover of the ten currently recognized finite tags. -/
def stages : List Stage :=
  [.commitReady, .frameR0, .frameR1, .frameR2, .activatedRoute,
    .selectedAction, .pendingFrame, .accumulatorClean, .accumulatorClose,
    .unregistered]

@[simp]
theorem stages_length : stages.length = 10 :=
  rfl

theorem stages_nodup : stages.Nodup := by
  decide

theorem mem_stages (stage : Stage) : stage ∈ stages := by
  cases stage <;> simp [stages]

/-- Last completed historical label, in the outer-to-inner stored order. -/
def innermostLabel? {program : CTS.Program} :
    List (CheckpointDecoder.LocalView program) → Option (ActionLabel program)
  | [] => none
  | view :: history =>
      match innermostLabel? history with
      | some label => some label
      | none => some view.label

/-- Phase reconstructed from current marked-history syntax. -/
def historyPhase (program : CTS.Program)
    (history : List (CheckpointDecoder.LocalView program)) :
    CTS.Phase program :=
  match innermostLabel? history with
  | none => CTS.zeroPhase program
  | some label => CTS.nextPhase program label.1

@[simp]
theorem historyPhase_nil (program : CTS.Program) :
    historyPhase program [] = CTS.zeroPhase program :=
  rfl

@[simp]
theorem innermostLabel?_singleton
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program) :
    innermostLabel? [view] = some view.label :=
  rfl

@[simp]
theorem historyPhase_singleton
    (program : CTS.Program) (view : CheckpointDecoder.LocalView program) :
    historyPhase program [view] = CTS.nextPhase program view.label.1 :=
  rfl

/-- Information reconstructed at the active endpoint. -/
structure ActiveView (program : CTS.Program) where
  stage : Stage
  canonicalChild : Term
  canonicalChildAddress : Option Address
  phase : CTS.Phase program
  frontBit : Option Bool
  queue : Option (List Bool)
  selectedAddress : Option Address
  dispatcherRoute : Option Dispatcher.Route
  deriving BEq, DecidableEq, Repr

/--
Role-free active-endpoint classifier.  The static action code is derived from
the program and dispatcher tree rather than supplied per invocation.
-/
def classifyActive
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (history : List (CheckpointDecoder.LocalView program))
    (term : Term) : ActiveView program :=
  match CheckpointDecoder.parseLocal? program tree term with
  | some parsedLocal =>
      ⟨.commitReady, parsedLocal.accumulator, none, parsedLocal.label.1,
        some parsedLocal.label.2, none, none, none⟩
  | none =>
      match RootResetReachableStageGrammar.classifyEndpoint
          (compileActions program tree) term with
      | ⟨endpointStage, child, bits⟩ =>
          match endpointStage with
          | .frameR0 =>
              match bits with
              | some queue =>
                  ⟨.frameR0, child, some [.right], historyPhase program history,
                    queue.head?, some queue, none, none⟩
              | none =>
                  ⟨.unregistered, term, none, historyPhase program history,
                    none, none, none, none⟩
          | .frameR1 =>
              match bits with
              | some queue =>
                  ⟨.frameR1, child, some [.left, .right],
                    historyPhase program history,
                    queue.head?, some queue, none, none⟩
              | none =>
                  ⟨.unregistered, term, none, historyPhase program history,
                    none, none, none, none⟩
          | .frameR2 =>
              match bits with
              | some queue =>
                  ⟨.frameR2, child, some [.left, .left, .right],
                    historyPhase program history,
                    queue.head?, some queue, none, none⟩
              | none =>
                  ⟨.unregistered, term, none, historyPhase program history,
                    none, none, none, none⟩
          | .pendingFrame =>
              ⟨.pendingFrame, child, some [.right],
                historyPhase program history,
                none, none, none, none⟩
          | .unregistered =>
              match DispatchParser.parseRouteDetailed
                  (selectedAction program) tree term with
              | some route =>
                  match ActionParser.parse program route.label route.response with
                  | some action =>
                      ⟨.selectedAction, action.accumulator,
                        some (routeResponseAddress route.route ++
                          ActionParser.accumulatorAddress
                            (ActionParser.historyCount program route.label)),
                        route.label.1,
                        some route.label.2, none, none, some route.route⟩
                  | none =>
                      ⟨.activatedRoute, route.response,
                        some (routeResponseAddress route.route), route.label.1,
                        some route.label.2, none, none, some route.route⟩
              | none =>
                  match RootResetAccumulatorClassifier.classify? term with
                  | some ⟨queue, .clean⟩ =>
                      ⟨.accumulatorClean, term, some [],
                        historyPhase program history,
                        queue.head?, some queue, none, none⟩
                  | some ⟨queue, .close address⟩ =>
                      ⟨.accumulatorClose, term, some [],
                        historyPhase program history,
                        queue.head?, some queue, some address, none⟩
                  | none =>
                      ⟨.unregistered, term, none,
                        historyPhase program history,
                        none, none, none, none⟩

/-- A syntactically parsed completed Local supplies COMMIT phase and bit. -/
theorem classifyActive_commit_of_parse
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    (history : List (CheckpointDecoder.LocalView program))
    {term : Term} {parsed : CheckpointDecoder.LocalView program}
    (h : CheckpointDecoder.parseLocal? program tree term = some parsed) :
    classifyActive program tree history term =
      ⟨.commitReady, parsed.accumulator, none, parsed.label.1,
        some parsed.label.2, none, none, none⟩ := by
  rw [classifyActive, h]

/-- Exact `R₀` syntax recovers the current word without a supplied bit list. -/
theorem classifyActive_frameR0
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (history : List (CheckpointDecoder.LocalView program))
    (bits : List Bool) (continuation child : Term)
    (notLocal : CheckpointDecoder.parseLocal? program tree
      (frame (environmentCode (compileActions program tree) bits)
        continuation child) = none) :
    classifyActive program tree history
        (frame (environmentCode (compileActions program tree) bits)
          continuation child) =
      ⟨.frameR0, child, some [.right], historyPhase program history, bits.head?,
        some bits, none, none⟩ := by
  rw [classifyActive, notLocal,
    RootResetReachableStageGrammar.classifyEndpoint_frameR0_priority]

/-- Exact `R₁` syntax recovers the current word without a supplied bit list. -/
theorem classifyActive_frameR1
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (history : List (CheckpointDecoder.LocalView program))
    (bits : List Bool) (carrierLeft continuation carrierRight : Term)
    (notLocal : CheckpointDecoder.parseLocal? program tree
      (.app (.app
        (dispatcherCode (compileActions program tree) bits) carrierLeft)
        (.app continuation carrierRight)) = none) :
    classifyActive program tree history
        (.app (.app
          (dispatcherCode (compileActions program tree) bits) carrierLeft)
          (.app continuation carrierRight)) =
      ⟨.frameR1, carrierLeft, some [.left, .right],
        historyPhase program history, bits.head?,
        some bits, none, none⟩ := by
  rw [classifyActive, notLocal,
    RootResetReachableStageGrammar.classifyEndpoint_frameR1]

/-- Exact `R₂` syntax recovers the current word without a supplied bit list. -/
theorem classifyActive_frameR2
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (history : List (CheckpointDecoder.LocalView program))
    (bits : List Bool) (carrier0 carrier1 continuation carrier2 : Term)
    (notLocal : CheckpointDecoder.parseLocal? program tree
      (.app
        (.app (.app (actCode (compileActions program tree)) carrier0)
          (.app (seedCode bits) carrier1))
        (.app continuation carrier2)) = none) :
    classifyActive program tree history
        (.app
          (.app (.app (actCode (compileActions program tree)) carrier0)
            (.app (seedCode bits) carrier1))
          (.app continuation carrier2)) =
      ⟨.frameR2, carrier0, some [.left, .left, .right],
        historyPhase program history, bits.head?,
        some bits, none, none⟩ := by
  rw [classifyActive, notLocal,
    RootResetReachableStageGrammar.classifyEndpoint_frameR2]

/-- A complete activated dispatcher route recovers its path, phase, and bit. -/
theorem classifyActive_activatedRoute
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    (history : List (CheckpointDecoder.LocalView program))
    {term : Term} {parsed : DispatchParser.DetailedRoute (ActionLabel program)}
    (notLocal : CheckpointDecoder.parseLocal? program tree term = none)
    (unregisteredEndpoint :
      RootResetReachableStageGrammar.classifyEndpoint
        (compileActions program tree) term =
          ⟨.unregistered, term, none⟩)
    (route : DispatchParser.parseRouteDetailed
      (selectedAction program) tree term = some parsed)
    (notAction : ActionParser.parse program parsed.label parsed.response = none) :
    classifyActive program tree history term =
      ⟨.activatedRoute, parsed.response,
        some (routeResponseAddress parsed.route), parsed.label.1,
        some parsed.label.2, none, none, some parsed.route⟩ := by
  simp [classifyActive, notLocal, unregisteredEndpoint, route, notAction]

/-- A complete selected action recovers its accumulator and route header. -/
theorem classifyActive_selectedAction
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    (history : List (CheckpointDecoder.LocalView program))
    {term : Term} {route : DispatchParser.DetailedRoute (ActionLabel program)}
    {action : ActionParser.ParsedAction}
    (notLocal : CheckpointDecoder.parseLocal? program tree term = none)
    (unregisteredEndpoint :
      RootResetReachableStageGrammar.classifyEndpoint
        (compileActions program tree) term =
          ⟨.unregistered, term, none⟩)
    (routeParse : DispatchParser.parseRouteDetailed
      (selectedAction program) tree term = some route)
    (actionParse : ActionParser.parse program route.label route.response =
      some action) :
    classifyActive program tree history term =
      ⟨.selectedAction, action.accumulator,
        some (routeResponseAddress route.route ++
          ActionParser.accumulatorAddress
            (ActionParser.historyCount program route.label)),
        route.label.1,
        some route.label.2, none, none, some route.route⟩ := by
  simp [classifyActive, notLocal, unregisteredEndpoint, routeParse, actionParse]

/-- The composed route/action address reaches the parsed accumulator. -/
theorem selectedAction_accumulator_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {route : DispatchParser.DetailedRoute (ActionLabel program)}
    {action : ActionParser.ParsedAction}
    (routeParse : DispatchParser.parseRouteDetailed
      (selectedAction program) tree term = some route)
    (actionParse : ActionParser.parse program route.label route.response =
      some action) :
    term.subterm?
        (routeResponseAddress route.route ++
          ActionParser.accumulatorAddress
            (ActionParser.historyCount program route.label)) =
      some action.accumulator := by
  rw [CarrierDecoder.subterm?_append,
    RootResetReachableStageGrammar.parseRouteDetailed_response_subterm routeParse]
  exact (ActionParser.parse_sound actionParse).accumulator_subterm

/-- Every returned canonical-child address reaches the returned child. -/
theorem classifyActive_canonicalChildAddress_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (history : List (CheckpointDecoder.LocalView program))
    (term : Term) {address : Address}
    (haddress : (classifyActive program tree history term).canonicalChildAddress =
      some address) :
    term.subterm? address =
      some (classifyActive program tree history term).canonicalChild := by
  generalize hlocal : CheckpointDecoder.parseLocal? program tree term =
    localResult at haddress ⊢
  cases localResult with
  | some parsedLocal =>
      simp [classifyActive, hlocal] at haddress
  | none =>
      generalize hr0 : RootResetReachableStageGrammar.parseFrameR0?
        (compileActions program tree) term = r0Result at haddress ⊢
      cases r0Result with
      | some r0 =>
          simp [classifyActive, RootResetReachableStageGrammar.classifyEndpoint,
            hlocal, hr0] at haddress ⊢
          subst address
          exact RootResetReachableStageGrammar.parseFrameR0?_child_subterm hr0
      | none =>
          generalize hr1 : RootResetReachableStageGrammar.parseFrameR1?
            (compileActions program tree) term = r1Result at haddress ⊢
          cases r1Result with
          | some r1 =>
              simp [classifyActive,
                RootResetReachableStageGrammar.classifyEndpoint,
                hlocal, hr0, hr1] at haddress ⊢
              subst address
              exact RootResetReachableStageGrammar.parseFrameR1?_child_subterm hr1
          | none =>
              generalize hr2 : RootResetReachableStageGrammar.parseFrameR2?
                (compileActions program tree) term = r2Result at haddress ⊢
              cases r2Result with
              | some r2 =>
                  simp [classifyActive,
                    RootResetReachableStageGrammar.classifyEndpoint,
                    hlocal, hr0, hr1, hr2] at haddress ⊢
                  subst address
                  exact RootResetReachableStageGrammar.parseFrameR2?_child_subterm
                    hr2
              | none =>
                  generalize hpending : RootResetStageRegistry.parsePending? term =
                    pendingResult at haddress ⊢
                  cases pendingResult with
                  | some child =>
                      simp [classifyActive,
                        RootResetReachableStageGrammar.classifyEndpoint,
                        hlocal, hr0, hr1, hr2, hpending] at haddress ⊢
                      subst address
                      exact (RootResetStageRegistry.parsePending?_sound hpending).2.2
                  | none =>
                      generalize hroute : DispatchParser.parseRouteDetailed
                        (selectedAction program) tree term = routeResult
                          at haddress ⊢
                      cases routeResult with
                      | some route =>
                          generalize haction : ActionParser.parse program
                            route.label route.response = actionResult
                              at haddress ⊢
                          cases actionResult with
                          | some action =>
                              simp [classifyActive,
                                RootResetReachableStageGrammar.classifyEndpoint,
                                hlocal, hr0, hr1, hr2, hpending, hroute,
                                haction] at haddress ⊢
                              subst address
                              exact selectedAction_accumulator_subterm hroute haction
                          | none =>
                              simp [classifyActive,
                                RootResetReachableStageGrammar.classifyEndpoint,
                                hlocal, hr0, hr1, hr2, hpending, hroute,
                                haction] at haddress ⊢
                              subst address
                              exact RootResetReachableStageGrammar.parseRouteDetailed_response_subterm
                                hroute
                      | none =>
                          generalize hacc :
                            RootResetAccumulatorClassifier.classify? term =
                              accumulatorResult at haddress ⊢
                          cases accumulatorResult with
                          | none =>
                              simp [classifyActive,
                                RootResetReachableStageGrammar.classifyEndpoint,
                                hlocal, hr0, hr1, hr2, hpending, hroute, hacc]
                                at haddress
                          | some accumulator =>
                              rcases accumulator with ⟨queue, accumulatorStage⟩
                              cases accumulatorStage with
                              | clean =>
                                  simp [classifyActive,
                                    RootResetReachableStageGrammar.classifyEndpoint,
                                    hlocal, hr0, hr1, hr2, hpending, hroute,
                                    hacc] at haddress
                                  subst address
                                  simp [classifyActive,
                                    RootResetReachableStageGrammar.classifyEndpoint,
                                    hlocal, hr0, hr1, hr2, hpending, hroute,
                                    hacc, Term.subterm?]
                              | close relativeAddress =>
                                  simp [classifyActive,
                                    RootResetReachableStageGrammar.classifyEndpoint,
                                    hlocal, hr0, hr1, hr2, hpending, hroute,
                                    hacc] at haddress
                                  subst address
                                  simp [classifyActive,
                                    RootResetReachableStageGrammar.classifyEndpoint,
                                    hlocal, hr0, hr1, hr2, hpending, hroute,
                                    hacc, Term.subterm?]

/-- Every activated-route tag is backed by the complete route parser. -/
theorem classifyActive_activatedRoute_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (history : List (CheckpointDecoder.LocalView program))
    (term : Term)
    (hstage : (classifyActive program tree history term).stage =
      .activatedRoute) :
    ∃ parsed : DispatchParser.DetailedRoute (ActionLabel program),
      DispatchParser.parseRouteDetailed (selectedAction program) tree term =
          some parsed ∧
        (classifyActive program tree history term).canonicalChild =
          parsed.response ∧
        (classifyActive program tree history term).phase = parsed.label.1 ∧
        (classifyActive program tree history term).frontBit =
          some parsed.label.2 ∧
        (classifyActive program tree history term).dispatcherRoute =
          some parsed.route := by
  generalize hlocal : CheckpointDecoder.parseLocal? program tree term =
    localResult at hstage
  cases localResult with
  | some parsedLocal => simp [classifyActive, hlocal] at hstage
  | none =>
      generalize hendpoint : RootResetReachableStageGrammar.classifyEndpoint
        (compileActions program tree) term = endpointResult at hstage
      rcases endpointResult with ⟨endpointStage, child, bits⟩
      cases endpointStage with
      | frameR0 =>
          cases bits <;> simp [classifyActive, hlocal, hendpoint] at hstage
      | frameR1 =>
          cases bits <;> simp [classifyActive, hlocal, hendpoint] at hstage
      | frameR2 =>
          cases bits <;> simp [classifyActive, hlocal, hendpoint] at hstage
      | pendingFrame =>
          simp [classifyActive, hlocal, hendpoint] at hstage
      | unregistered =>
          generalize hroute : DispatchParser.parseRouteDetailed
            (selectedAction program) tree term = routeResult at hstage
          cases routeResult with
          | some parsed =>
              generalize haction : ActionParser.parse program parsed.label
                parsed.response = actionResult at hstage
              cases actionResult with
              | none =>
                  refine ⟨parsed, rfl, ?_⟩
                  simp [classifyActive, hlocal, hendpoint, hroute, haction]
              | some action =>
                  simp [classifyActive, hlocal, hendpoint, hroute, haction]
                    at hstage
          | none =>
              generalize hacc : RootResetAccumulatorClassifier.classify? term =
                accumulatorResult at hstage
              cases accumulatorResult with
              | none =>
                  simp [classifyActive, hlocal, hendpoint, hroute, hacc]
                    at hstage
              | some accumulator =>
                  rcases accumulator with ⟨queue, accumulatorStage⟩
                  cases accumulatorStage <;>
                    simp [classifyActive, hlocal, hendpoint, hroute, hacc]
                      at hstage

/-- Every selected-action tag is backed by both route and action parsers. -/
theorem classifyActive_selectedAction_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (history : List (CheckpointDecoder.LocalView program))
    (term : Term)
    (hstage : (classifyActive program tree history term).stage =
      .selectedAction) :
    ∃ (route : DispatchParser.DetailedRoute (ActionLabel program))
        (action : ActionParser.ParsedAction),
      DispatchParser.parseRouteDetailed (selectedAction program) tree term =
          some route ∧
        ActionParser.parse program route.label route.response = some action ∧
        (classifyActive program tree history term).canonicalChild =
          action.accumulator ∧
        (classifyActive program tree history term).phase = route.label.1 ∧
        (classifyActive program tree history term).frontBit =
          some route.label.2 ∧
        (classifyActive program tree history term).dispatcherRoute =
          some route.route := by
  generalize hlocal : CheckpointDecoder.parseLocal? program tree term =
    localResult at hstage
  cases localResult with
  | some parsedLocal => simp [classifyActive, hlocal] at hstage
  | none =>
      generalize hendpoint : RootResetReachableStageGrammar.classifyEndpoint
        (compileActions program tree) term = endpointResult at hstage
      rcases endpointResult with ⟨endpointStage, child, bits⟩
      cases endpointStage with
      | frameR0 =>
          cases bits <;> simp [classifyActive, hlocal, hendpoint] at hstage
      | frameR1 =>
          cases bits <;> simp [classifyActive, hlocal, hendpoint] at hstage
      | frameR2 =>
          cases bits <;> simp [classifyActive, hlocal, hendpoint] at hstage
      | pendingFrame =>
          simp [classifyActive, hlocal, hendpoint] at hstage
      | unregistered =>
          generalize hroute : DispatchParser.parseRouteDetailed
            (selectedAction program) tree term = routeResult at hstage
          cases routeResult with
          | none =>
              generalize hacc : RootResetAccumulatorClassifier.classify? term =
                accumulatorResult at hstage
              cases accumulatorResult with
              | none =>
                  simp [classifyActive, hlocal, hendpoint, hroute, hacc]
                    at hstage
              | some accumulator =>
                  rcases accumulator with ⟨queue, accumulatorStage⟩
                  cases accumulatorStage <;>
                    simp [classifyActive, hlocal, hendpoint, hroute, hacc]
                      at hstage
          | some route =>
              generalize haction : ActionParser.parse program route.label
                route.response = actionResult at hstage
              cases actionResult with
              | none =>
                  simp [classifyActive, hlocal, hendpoint, hroute, haction]
                    at hstage
              | some action =>
                  refine ⟨route, action, rfl, haction, ?_⟩
                  simp [classifyActive, hlocal, hendpoint, hroute, haction]

/-- A registered singleton-Open accumulator fixes the relative CLOSE address. -/
theorem classifyActive_close
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    (history : List (CheckpointDecoder.LocalView program))
    {term : Term} {bits : List Bool} {address : Address}
    (notLocal : CheckpointDecoder.parseLocal? program tree term = none)
    (unregisteredEndpoint :
      RootResetReachableStageGrammar.classifyEndpoint
        (compileActions program tree) term =
          ⟨.unregistered, term, none⟩)
    (notRoute : DispatchParser.parseRouteDetailed
      (selectedAction program) tree term = none)
    (close : RootResetAccumulatorClassifier.classify? term =
      some ⟨bits, .close address⟩) :
    classifyActive program tree history term =
      ⟨.accumulatorClose, term, some [], historyPhase program history,
        bits.head?, some bits, some address, none⟩ := by
  rw [classifyActive, notLocal, unregisteredEndpoint, notRoute, close]

/-- Complete result of one bare-root classification invocation. -/
structure View (program : CTS.Program) where
  active : Term
  context : Context
  history : List (CheckpointDecoder.LocalView program)
  endpoint : ActiveView program
  /-- A CLOSE address is translated from the active endpoint to the root. -/
  selectedAddress : Option Address
  deriving BEq, DecidableEq, Repr

/-- One fixed classifier function of the current term for static code. -/
def classify
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : View program :=
  let decomposition := peelMarked program tree term
  let endpoint := classifyActive program tree decomposition.history
    decomposition.active
  let selected := endpoint.selectedAddress.map fun address =>
    RootResetSelectorContract.contextAddress decomposition.context ++ address
  ⟨decomposition.active, decomposition.context, decomposition.history,
    endpoint, selected⟩

/-- Classification is definitionally a function of the current bare term. -/
theorem identical_current_terms_same_classification
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    {first second : Term} (equal : first = second) :
    classify program tree first = classify program tree second := by
  subst second
  rfl

/-- The whole classifier has one result, with no retained role or phase input. -/
theorem classify_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : View program}
    (hfirst : classify program tree term = first)
    (hsecond : classify program tree term = second) :
    first = second :=
  hfirst.symm.trans hsecond

/-- The returned context and active endpoint literally rebuild the input. -/
theorem classify_source_eq
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    (classify program tree term).context.plug
        (classify program tree term).active = term := by
  simp only [classify]
  exact peelMarked_source_eq program tree term

/-- Every Local stored outside the active endpoint is marked and complete. -/
theorem classify_history_marked
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    MarkedHistory program (classify program tree term).history := by
  simp only [classify]
  exact peelMarked_history_marked program tree term

/-- A completed Local at the returned active endpoint is necessarily fresh. -/
theorem classify_active_local_is_fresh
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term)
    {parsedLocal : CheckpointDecoder.LocalView program}
    (hlocal : CheckpointDecoder.parseLocal? program tree
      (classify program tree term).active = some parsedLocal) :
    parsedLocal.status = .fresh := by
  simpa only [classify] using
    peelMarked_active_local_is_fresh program tree term hlocal

/-! ## Declarative whole-term endpoint decomposition -/

/--
One marked-history active-hole decomposition together with the term-derived
endpoint result.  The endpoint may carry the explicit `unregistered` tag; the
definition therefore records classifier uniqueness without asserting closure
of the full CTS reachable language.
-/
structure EndpointDecomposition (program : CTS.Program) where
  active : Term
  context : Context
  history : List (CheckpointDecoder.LocalView program)
  endpoint : ActiveView program
  deriving BEq, DecidableEq, Repr

/-- Declarative correctness of a whole-term endpoint decomposition. -/
def EndpointDecomposition.Describes
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (decomposition : EndpointDecomposition program) : Prop :=
  MarkedPrefix program tree term decomposition.active decomposition.context
      decomposition.history ∧
    decomposition.endpoint = classifyActive program tree
      decomposition.history decomposition.active

/-- Executable decomposition obtained from the current bare term alone. -/
def endpointDecomposition
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : EndpointDecomposition program :=
  let peeled := peelMarked program tree term
  ⟨peeled.active, peeled.context, peeled.history,
    classifyActive program tree peeled.history peeled.active⟩

/-- The executable decomposition satisfies the declarative relation. -/
theorem endpointDecomposition_describes
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    (endpointDecomposition program tree term).Describes program tree term := by
  refine ⟨?_, rfl⟩
  simpa only [endpointDecomposition] using peelMarked_sound program tree term

/-- Two declaratively valid endpoint decompositions are identical. -/
theorem endpointDecomposition_deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : EndpointDecomposition program}
    (hfirst : first.Describes program tree term)
    (hsecond : second.Describes program tree term) :
    first = second := by
  have unique := markedPrefix_deterministic hfirst.1 hsecond.1
  rcases first with ⟨firstActive, firstContext, firstHistory, firstEndpoint⟩
  rcases second with
    ⟨secondActive, secondContext, secondHistory, secondEndpoint⟩
  simp only at unique hfirst hsecond ⊢
  rcases unique with ⟨activeEq, contextEq, historyEq⟩
  subst secondActive
  subst secondContext
  subst secondHistory
  have endpointEq : firstEndpoint = secondEndpoint :=
    hfirst.2.trans hsecond.2.symm
  subst secondEndpoint
  rfl

/-- Every finite term has exactly one term-derived endpoint decomposition. -/
theorem existsUnique_endpointDecomposition
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    ∃ decomposition : EndpointDecomposition program,
      decomposition.Describes program tree term ∧
        ∀ other : EndpointDecomposition program,
          other.Describes program tree term → other = decomposition := by
  refine ⟨endpointDecomposition program tree term,
    endpointDecomposition_describes program tree term, ?_⟩
  intro other hother
  exact endpointDecomposition_deterministic hother
    (endpointDecomposition_describes program tree term)

/-! ## Contextual transport of canonical occurrences and CLOSE addresses -/

/-- Looking below a context's hole reaches the same relative source address. -/
theorem subterm?_plug_contextAddress_append
    (context : Context) (source : Term) (address : Address) :
    (context.plug source).subterm?
        (RootResetSelectorContract.contextAddress context ++ address) =
      source.subterm? address := by
  induction context with
  | hole => rfl
  | appLeft context right ih =>
      simp [Context.plug, RootResetSelectorContract.contextAddress,
        Term.subterm?, ih]
  | appRight left context ih =>
      simp [Context.plug, RootResetSelectorContract.contextAddress,
        Term.subterm?, ih]

/-- Every endpoint child address lifts to the same child in the whole term. -/
theorem classify_canonicalChildAddress_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) {address : Address}
    (haddress :
      (classify program tree term).endpoint.canonicalChildAddress =
        some address) :
    term.subterm?
        (RootResetSelectorContract.contextAddress
            (classify program tree term).context ++ address) =
      some (classify program tree term).endpoint.canonicalChild := by
  let decomposition := peelMarked program tree term
  have activeAddress :
      decomposition.active.subterm? address =
        some (classifyActive program tree decomposition.history
          decomposition.active).canonicalChild := by
    apply classifyActive_canonicalChildAddress_sound
    simpa only [classify, decomposition] using haddress
  calc
    term.subterm?
        (RootResetSelectorContract.contextAddress
            (classify program tree term).context ++ address) =
        (decomposition.context.plug decomposition.active).subterm?
          (RootResetSelectorContract.contextAddress
            decomposition.context ++ address) := by
              simp only [classify, decomposition]
              rw [peelMarked_source_eq program tree term]
    _ = decomposition.active.subterm? address :=
      subterm?_plug_contextAddress_append decomposition.context
        decomposition.active address
    _ = some (classify program tree term).endpoint.canonicalChild := by
      simpa only [classify, decomposition] using activeAddress

/-- A contraction address below a one-hole context is prefixed by its hole. -/
theorem contractAt?_plug_append
    (context : Context) {source target : Term} (address : Address)
    (contracts : source.contractAt? address = some target) :
    (context.plug source).contractAt?
        (RootResetSelectorContract.contextAddress context ++ address) =
      some (context.plug target) := by
  induction context with
  | hole => simpa [RootResetSelectorContract.contextAddress] using contracts
  | appLeft inner right ih =>
      simp only [Context.plug, RootResetSelectorContract.contextAddress,
        List.cons_append]
      rw [RootResetEulerWalker.contractAt?_app_left, ih]
      rfl
  | appRight left inner ih =>
      simp only [Context.plug, RootResetSelectorContract.contextAddress,
        List.cons_append]
      rw [RootResetEulerWalker.contractAt?_app_right, ih]
      rfl

/-- A singleton-Open active endpoint gives a verified whole-term CLOSE. -/
theorem close_of_active_accumulator
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) {queue : List Bool} {address : Address}
    (hclose : RootResetAccumulatorClassifier.classify?
      (peelMarked program tree term).active =
        some ⟨queue, .close address⟩) :
    ∃ target,
      term.contractAt?
          (RootResetSelectorContract.contextAddress
              (peelMarked program tree term).context ++ address) =
        some ((peelMarked program tree term).context.plug target) := by
  obtain ⟨target, contracts⟩ :=
    RootResetAccumulatorClassifier.classify?_close_sound hclose
  refine ⟨target, ?_⟩
  have lifted := contractAt?_plug_append
    (peelMarked program tree term).context address contracts
  rw [peelMarked_source_eq program tree term] at lifted
  exact lifted

/-- Every whole-classifier CLOSE result names a genuine saturated redex. -/
theorem classify_close_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) {address : Address}
    (hstage : (classify program tree term).endpoint.stage =
        .accumulatorClose)
    (haddress : (classify program tree term).selectedAddress = some address) :
    ∃ target, term.contractAt? address = some target := by
  unfold classify at hstage haddress
  generalize hlocal : CheckpointDecoder.parseLocal? program tree
    (peelMarked program tree term).active = localResult at hstage haddress
  cases localResult with
  | some parsedLocal => simp [classifyActive, hlocal] at hstage
  | none =>
      generalize hendpoint : RootResetReachableStageGrammar.classifyEndpoint
        (compileActions program tree) (peelMarked program tree term).active =
          endpointResult at hstage haddress
      rcases endpointResult with ⟨endpointStage, child, bits⟩
      cases endpointStage with
      | frameR0 =>
          cases bits <;> simp [classifyActive, hlocal, hendpoint] at hstage
      | frameR1 =>
          cases bits <;> simp [classifyActive, hlocal, hendpoint] at hstage
      | frameR2 =>
          cases bits <;> simp [classifyActive, hlocal, hendpoint] at hstage
      | pendingFrame =>
          simp [classifyActive, hlocal, hendpoint] at hstage
      | unregistered =>
          generalize hroute : DispatchParser.parseRouteDetailed
            (selectedAction program) tree (peelMarked program tree term).active =
              routeResult at hstage haddress
          cases routeResult with
          | some route =>
              generalize haction : ActionParser.parse program route.label
                route.response = actionResult at hstage
              cases actionResult <;>
                simp [classifyActive, hlocal, hendpoint, hroute, haction]
                  at hstage
          | none =>
              generalize hacc : RootResetAccumulatorClassifier.classify?
                (peelMarked program tree term).active = accumulatorResult at hstage haddress
              cases accumulatorResult with
              | none =>
                  simp [classifyActive, hlocal, hendpoint, hroute, hacc] at hstage
              | some accumulator =>
                  rcases accumulator with ⟨queue, accumulatorStage⟩
                  cases accumulatorStage with
                  | clean =>
                      simp [classifyActive, hlocal, hendpoint, hroute, hacc] at hstage
                  | close relativeAddress =>
                      simp [classifyActive, hlocal, hendpoint, hroute, hacc]
                        at haddress
                      have whole := close_of_active_accumulator program tree term hacc
                      rcases whole with ⟨target, contracts⟩
                      rw [← haddress]
                      exact ⟨_, contracts⟩

end PureSFormal.Research.RootResetWholeStageClassifier
