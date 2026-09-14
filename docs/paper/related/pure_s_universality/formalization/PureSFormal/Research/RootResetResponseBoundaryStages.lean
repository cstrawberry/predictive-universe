import PureSFormal.Research.RootResetWholeAppenderStages
import PureSFormal.Research.RootResetWholeDispatcherStages
import PureSFormal.PureS.CheckpointConstructors

/-!
# Whole-term response boundaries and continuation handoff

This module recognizes completed fresh Local responses whose canonical
accumulator has either one registered Open cell or none.  A singleton Open is
the CLOSE-ready alternative; a clean accumulator is the COMMIT-ready
alternative.  The parser starts at the bare root, peels only completed marked
Locals, verifies that every historical accumulator is clean, and then parses
the unique fresh completed Local.

CLOSE is lifted through the exact action, route, Local-shell, and historical
contexts.  Its target is again a completed fresh Local with a clean
accumulator.  COMMIT is the exact fresh-halt contraction; its target is a
completed marked Local whose literal continuation is the handoff endpoint.
All audit and retained-history fields are independent.  They are reconstructed
but never compared.

The results are scoped to this explicit grammar.  They do not assert that all
scheduler-reachable terms inhabit it and do not prove a global CTS simulation.
-/

namespace PureSFormal.Research.RootResetResponseBoundaryStages

open PureSFormal.PureS
open RootResetReachableStageGrammar

namespace Accumulator

abbrev View := RootResetAccumulatorClassifier.View
abbrev Tracks := RootResetAccumulatorClassifier.Tracks
abbrev TransactionView := RootResetAccumulatorClassifier.TransactionView
abbrev Stage := RootResetAccumulatorClassifier.Stage

end Accumulator

/-! ## Closing the unique canonical Open -/

/-- Prefixing a list of addresses is empty exactly when the input is empty. -/
theorem prefixAddresses_eq_nil_iff
    (path : Address) (addresses : List Address) :
    RootResetAccumulatorClassifier.prefixAddresses path addresses = [] ↔
      addresses = [] := by
  cases addresses <;> simp [RootResetAccumulatorClassifier.prefixAddresses]

/-- Invert a singleton list after prefixing every address. -/
theorem prefixAddresses_eq_singleton
    {path address : Address} {addresses : List Address}
    (h : RootResetAccumulatorClassifier.prefixAddresses path addresses =
      [address]) :
    ∃ inner, addresses = [inner] ∧ path ++ inner = address := by
  cases addresses with
  | nil => simp [RootResetAccumulatorClassifier.prefixAddresses] at h
  | cons inner rest =>
      cases rest with
      | nil =>
          simp only [RootResetAccumulatorClassifier.prefixAddresses,
            List.map_cons, List.map_nil, List.cons.injEq] at h
          exact ⟨inner, rfl, h.1⟩
      | cons second tail =>
          simp [RootResetAccumulatorClassifier.prefixAddresses] at h

/--
Contracting the sole listed Open converts it to Closed and leaves a registered
spine with the same queue and no Open cells.
-/
theorem tracks_close_singleton
    {term : Term} {bits : List Bool} {addresses : List Address}
    (shape : Accumulator.Tracks term bits addresses)
    {address : Address} (single : addresses = [address]) :
    ∃ target,
      term.contractAt? address = some target ∧
      Accumulator.Tracks target bits [] := by
  induction shape generalizing address with
  | endpoint => simp at single
  | @armed predecessor innerBits innerAddresses bit inner ih =>
      obtain ⟨innerAddress, innerEq, addressEq⟩ :=
        prefixAddresses_eq_singleton single
      subst address
      obtain ⟨target, contracts, targetShape⟩ := ih innerEq
      refine ⟨RootResetProgressRoles.Gadget.source bit target, ?_, ?_⟩
      · exact RootResetAccumulatorClassifier.contractAt?_armed_predecessor
          bit innerAddress contracts
      · simpa [RootResetAccumulatorClassifier.prefixAddresses] using
          RootResetAccumulatorClassifier.Tracks.armed bit targetShape
  | @opened predecessor innerBits innerAddresses bit audit inner ih =>
      have addressEq : address = [.right] := by
        have both : ([.right] : Address) = address ∧
            RootResetAccumulatorClassifier.prefixAddresses
              [.left, .right] innerAddresses = [] := by
          simpa only [List.cons.injEq] using single
        exact both.1.symm
      have innerEmpty : innerAddresses = [] := by
        have tailEq :
            RootResetAccumulatorClassifier.prefixAddresses
              [.left, .right] innerAddresses = [] := by
          have both : ([.right] : Address) = address ∧
              RootResetAccumulatorClassifier.prefixAddresses
                [.left, .right] innerAddresses = [] := by
            simpa only [List.cons.injEq] using single
          exact both.2
        exact (prefixAddresses_eq_nil_iff [.left, .right] innerAddresses).mp
          tailEq
      subst address
      refine ⟨RootResetProgressRoles.closedCell bit predecessor audit audit,
        RootResetProgressRoles.contractAt?_openCell_right bit predecessor audit,
        ?_⟩
      simpa [innerEmpty, RootResetAccumulatorClassifier.prefixAddresses] using
        RootResetAccumulatorClassifier.Tracks.closed bit audit audit inner
  | @closed predecessor innerBits innerAddresses bit leftAudit rightAudit inner ih =>
      obtain ⟨innerAddress, innerEq, addressEq⟩ :=
        prefixAddresses_eq_singleton single
      subst address
      obtain ⟨target, contracts, targetShape⟩ := ih innerEq
      refine ⟨RootResetProgressRoles.closedCell bit target leftAudit rightAudit,
        ?_, ?_⟩
      · exact RootResetAccumulatorClassifier.contractAt?_closed_predecessor
          bit leftAudit rightAudit innerAddress contracts
      · simpa [RootResetAccumulatorClassifier.prefixAddresses] using
          RootResetAccumulatorClassifier.Tracks.closed bit leftAudit rightAudit
            targetShape

/-- A singleton-Open classification closes to the exact clean classification. -/
theorem classify?_close_exact_clean
    {term : Term} {bits : List Bool} {address : Address}
    (h : RootResetAccumulatorClassifier.classify? term =
      some ⟨bits, .close address⟩) :
    ∃ target,
      term.contractAt? address = some target ∧
      RootResetAccumulatorClassifier.classify? target =
        some ⟨bits, .clean⟩ := by
  unfold RootResetAccumulatorClassifier.classify? at h
  generalize analyzed : RootResetAccumulatorClassifier.analyze? term =
    result at h
  cases result with
  | none => contradiction
  | some view =>
      cases openEq : view.openAddresses with
      | nil => simp [openEq] at h
      | cons first rest =>
          cases rest with
          | nil =>
              simp [openEq] at h
              rcases h with ⟨rfl, rfl⟩
              have shape := RootResetAccumulatorClassifier.analyze?_sound
                analyzed
              obtain ⟨target, contracts, targetShape⟩ :=
                tracks_close_singleton shape openEq
              refine ⟨target, contracts, ?_⟩
              simp [RootResetAccumulatorClassifier.classify?,
                RootResetAccumulatorClassifier.analyze?_complete targetShape]
          | cons second tail => simp [openEq] at h

/-! ## Exact contexts and contraction lifting -/

/-- Root-reset and canonical context-address functions coincide. -/
theorem contextAddress_eq_canonical (context : Context) :
    RootResetSelectorContract.contextAddress context =
      CanonicalTraversal.contextAddress context := by
  induction context with
  | hole => rfl
  | appLeft inner right ih =>
      simp [RootResetSelectorContract.contextAddress,
        CanonicalTraversal.contextAddress, ih]
  | appRight left inner ih =>
      simp [RootResetSelectorContract.contextAddress,
        CanonicalTraversal.contextAddress, ih]

/-- Addresses through the left-associated retained-argument context. -/
theorem contextAddress_applyArgsContext
    (context : Context) (arguments : List Term) :
    RootResetSelectorContract.contextAddress
        (CanonicalTraversal.applyArgsContext context arguments) =
      ActionParser.prefixLeft arguments.length
        (RootResetSelectorContract.contextAddress context) := by
  induction arguments generalizing context with
  | nil => rfl
  | cons argument rest ih =>
      simpa [CanonicalTraversal.applyArgsContext, ActionParser.prefixLeft,
        RootResetSelectorContract.contextAddress] using
        ih (.appLeft context argument)

/-- Address of the accumulator hole in an explicit action response context. -/
theorem contextAddress_actionContext (histories : List Term) :
    RootResetSelectorContract.contextAddress
        (CanonicalTraversal.actionContext histories) =
      ActionParser.accumulatorAddress histories.length := by
  simpa [CanonicalTraversal.actionContext, ActionParser.accumulatorAddress,
    RootResetSelectorContract.contextAddress] using
    contextAddress_applyArgsContext (.appRight p .hole) histories

/--
An action-shaped response transports a contraction in its accumulator through
the exact retained-history context and preserves the action grammar.
-/
theorem actionShape_contractAccumulator
    {program : CTS.Program} {label : ActionLabel program}
    {accumulator targetAccumulator : Term} {histories : List Term}
    {response : Term} {address : Address}
    (shape : ActionParser.ActionShape program label accumulator histories
      response)
    (contracts : accumulator.contractAt? address = some targetAccumulator) :
    ∃ targetResponse,
      response.contractAt?
          (ActionParser.accumulatorAddress
            (ActionParser.historyCount program label) ++ address) =
        some targetResponse ∧
      ActionParser.ActionShape program label targetAccumulator histories
        targetResponse := by
  rcases shape with ⟨lengthEq, rfl⟩
  let context := CanonicalTraversal.actionContext histories
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    context address contracts
  have sourceEq : context.plug accumulator =
      Term.applyArgs (.app p accumulator) histories := by
    exact CanonicalTraversal.actionContext_plug histories accumulator
  have targetEq : context.plug targetAccumulator =
      Term.applyArgs (.app p targetAccumulator) histories := by
    exact CanonicalTraversal.actionContext_plug histories targetAccumulator
  rw [sourceEq, targetEq] at lifted
  rw [contextAddress_actionContext, lengthEq] at lifted
  exact ⟨Term.applyArgs (.app p targetAccumulator) histories, lifted,
    lengthEq, rfl⟩

/--
An activated route transports a response contraction through its exact
selected ancestors and preserves every independent audit field.
-/
theorem activatedRoute_contractResponse
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result targetResponse : Term} {address : Address}
    (shape : RouteGrammar.ActivatedRoute encode tree route label response result)
    (contracts : response.contractAt? address = some targetResponse) :
    ∃ targetResult,
      result.contractAt?
          (RootResetReachableStageGrammar.routeResponseAddress route ++
            address) = some targetResult ∧
      RouteGrammar.ActivatedRoute encode tree route label targetResponse
        targetResult := by
  induction shape with
  | leaf label audit response =>
      let context : Context := .appRight (.app .s audit) .hole
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        context address contracts
      refine ⟨chosen audit targetResponse, ?_, .leaf label audit targetResponse⟩
      simpa [context, chosen,
        RootResetReachableStageGrammar.routeResponseAddress,
        RootResetSelectorContract.contextAddress] using lifted
  | @left left right route label response activatedChild outerAudit dormantAudit
      inner ih =>
      obtain ⟨targetChild, childContracts, targetShape⟩ := ih contracts
      let context :=
        RootResetWholeDispatcherStages.selectedLeftContext outerAudit
          (RouteGrammar.compiledCall encode right dormantAudit) .hole
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        context
        (RootResetReachableStageGrammar.routeResponseAddress route ++ address)
        childContracts
      refine ⟨RouteGrammar.selectedLeft outerAudit targetChild
        (RouteGrammar.compiledCall encode right dormantAudit), ?_,
        .left outerAudit dormantAudit targetShape⟩
      simpa [context,
        RootResetWholeDispatcherStages.selectedLeftContext,
        RootResetReachableStageGrammar.routeResponseAddress,
        RootResetSelectorContract.contextAddress, RouteGrammar.selectedLeft,
        chosen, List.append_assoc] using lifted
  | @right left right route label response activatedChild outerAudit dormantAudit
      inner ih =>
      obtain ⟨targetChild, childContracts, targetShape⟩ := ih contracts
      let context :=
        RootResetWholeDispatcherStages.selectedRightContext outerAudit
          (RouteGrammar.compiledCall encode left dormantAudit) .hole
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        context
        (RootResetReachableStageGrammar.routeResponseAddress route ++ address)
        childContracts
      refine ⟨RouteGrammar.selectedRight outerAudit
        (RouteGrammar.compiledCall encode left dormantAudit) targetChild, ?_,
        .right outerAudit dormantAudit targetShape⟩
      simpa [context,
        RootResetWholeDispatcherStages.selectedRightContext,
        RootResetReachableStageGrammar.routeResponseAddress,
        RootResetSelectorContract.contextAddress, RouteGrammar.selectedRight,
        chosen, List.append_assoc] using lifted

/-- Local-shell context from the dispatcher hole, with an opaque seed payload. -/
def localDispatcherContext
    (haltField seedPayload seedAudit continuation continuationAudit : Term) :
    Context :=
  .appLeft
    (.appLeft
      (.appRight haltField .hole)
      (.app (.app .s seedPayload) seedAudit))
    (.app continuation continuationAudit)

@[simp]
theorem localDispatcherContext_plug
    (haltField dispatcher seedPayload seedAudit continuation
      continuationAudit : Term) :
    (localDispatcherContext haltField seedPayload seedAudit continuation
      continuationAudit).plug dispatcher =
      CheckpointDecoder.openShell haltField dispatcher seedPayload seedAudit
        continuation continuationAudit :=
  rfl

@[simp]
theorem contextAddress_localDispatcherContext
    (haltField seedPayload seedAudit continuation continuationAudit : Term) :
    RootResetSelectorContract.contextAddress
      (localDispatcherContext haltField seedPayload seedAudit continuation
        continuationAudit) = [.left, .left, .right] :=
  rfl

/-- Replace only the accumulator field of a public completed-Local view. -/
def replaceAccumulator
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (accumulator : Term) : CheckpointDecoder.LocalView program :=
  { view with accumulator := accumulator }

@[simp] theorem replaceAccumulator_status
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (accumulator : Term) :
    (replaceAccumulator view accumulator).status = view.status := rfl

@[simp] theorem replaceAccumulator_route
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (accumulator : Term) :
    (replaceAccumulator view accumulator).route = view.route := rfl

@[simp] theorem replaceAccumulator_label
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (accumulator : Term) :
    (replaceAccumulator view accumulator).label = view.label := rfl

@[simp] theorem replaceAccumulator_accumulator
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (accumulator : Term) :
    (replaceAccumulator view accumulator).accumulator = accumulator := rfl

@[simp] theorem replaceAccumulator_seedPayload
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (accumulator : Term) :
    (replaceAccumulator view accumulator).seedPayload = view.seedPayload := rfl

@[simp] theorem replaceAccumulator_continuation
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (accumulator : Term) :
    (replaceAccumulator view accumulator).continuation = view.continuation := rfl

/-- Root-relative accumulator address in one parsed completed Local. -/
def localAccumulatorAddress
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program) :
    Address :=
  [.left, .left, .right] ++
    RootResetReachableStageGrammar.routeResponseAddress view.route ++
    ActionParser.accumulatorAddress
      (ActionParser.historyCount program view.label)

/--
A completed-Local shape transports an accumulator contraction through the
action, route, and shell while preserving its exact public parse fields.
-/
theorem localShape_contractAccumulator
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {view : CheckpointDecoder.LocalView program} {term : Term}
    {targetAccumulator : Term} {address : Address}
    (shape : CheckpointDecoder.LocalShape program tree view term)
    (contracts : view.accumulator.contractAt? address = some targetAccumulator) :
    ∃ target,
      term.contractAt? (localAccumulatorAddress view ++ address) = some target ∧
      CheckpointDecoder.LocalShape program tree
        (replaceAccumulator view targetAccumulator) target := by
  rcases shape with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, halt,
      dispatchShape, rfl⟩
  rcases dispatchShape with
    ⟨response, histories, routeShape, actionShape⟩
  obtain ⟨targetResponse, responseContracts, targetAction⟩ :=
    actionShape_contractAccumulator actionShape contracts
  obtain ⟨targetDispatcher, dispatcherContracts, targetRoute⟩ :=
    activatedRoute_contractResponse routeShape responseContracts
  let context := localDispatcherContext haltField view.seedPayload seedAudit
    view.continuation continuationAudit
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    context
    (RootResetReachableStageGrammar.routeResponseAddress view.route ++
      (ActionParser.accumulatorAddress
        (ActionParser.historyCount program view.label) ++ address))
    dispatcherContracts
  have sourceEq : context.plug dispatcher =
      CheckpointDecoder.openShell haltField dispatcher view.seedPayload
        seedAudit view.continuation continuationAudit := by
    exact localDispatcherContext_plug haltField dispatcher view.seedPayload
      seedAudit view.continuation continuationAudit
  have targetEq : context.plug targetDispatcher =
      CheckpointDecoder.openShell haltField targetDispatcher view.seedPayload
        seedAudit view.continuation continuationAudit := by
    exact localDispatcherContext_plug haltField targetDispatcher
      view.seedPayload seedAudit view.continuation continuationAudit
  rw [sourceEq, targetEq] at lifted
  refine ⟨CheckpointDecoder.openShell haltField targetDispatcher
      view.seedPayload seedAudit view.continuation continuationAudit, ?_, ?_⟩
  · simpa [localAccumulatorAddress, List.append_assoc] using! lifted
  · exact ⟨haltField, targetDispatcher, seedAudit, continuationAudit,
      halt, ⟨targetResponse, histories, targetRoute, targetAction⟩, rfl⟩

/-! ## Clean historical Locals -/

/--
Every historical view is marked and its completed accumulator has no Open
cell.  The queue index is recovered solely by the accumulator parser.
-/
inductive CleanMarkedHistory (program : CTS.Program) :
    List (CheckpointDecoder.LocalView program) → List (List Bool) → Prop where
  | nil : CleanMarkedHistory program [] []
  | cons
      (view : CheckpointDecoder.LocalView program) (queue : List Bool)
      {history : List (CheckpointDecoder.LocalView program)}
      {queues : List (List Bool)}
      (marked : view.status = .marked)
      (clean : RootResetAccumulatorClassifier.classify? view.accumulator =
        some ⟨queue, .clean⟩)
      (inner : CleanMarkedHistory program history queues) :
      CleanMarkedHistory program (view :: history) (queue :: queues)

/-- Total exact checker for marked and clean historical views. -/
def parseCleanMarkedHistory?
    {program : CTS.Program}
    (history : List (CheckpointDecoder.LocalView program)) :
    Option (List (List Bool)) :=
  match history with
  | [] => some []
  | view :: rest =>
      if view.status = .marked then
        match RootResetAccumulatorClassifier.classify? view.accumulator with
        | some ⟨queue, .clean⟩ =>
            (parseCleanMarkedHistory? rest).map (queue :: ·)
        | _ => none
      else
        none

/-- Successful history checking yields the exact declarative history. -/
theorem parseCleanMarkedHistory?_sound
    {program : CTS.Program}
    {history : List (CheckpointDecoder.LocalView program)}
    {queues : List (List Bool)}
    (h : parseCleanMarkedHistory? history = some queues) :
    CleanMarkedHistory program history queues := by
  induction history generalizing queues with
  | nil =>
      simp [parseCleanMarkedHistory?] at h
      subst queues
      exact .nil
  | cons view rest ih =>
      cases statusEq : view.status with
      | fresh => simp [parseCleanMarkedHistory?, statusEq] at h
      | marked =>
          cases classifierEq : RootResetAccumulatorClassifier.classify?
              view.accumulator with
          | none => simp [parseCleanMarkedHistory?, statusEq, classifierEq] at h
          | some classifier =>
              cases classifier with
              | mk queue stage =>
                  cases stage with
                  | clean =>
                      cases restEq : parseCleanMarkedHistory? rest with
                      | none =>
                          simp [parseCleanMarkedHistory?, statusEq,
                            classifierEq, restEq] at h
                      | some restQueues =>
                          simp [parseCleanMarkedHistory?, statusEq,
                            classifierEq, restEq] at h
                          subst queues
                          exact .cons view queue statusEq classifierEq
                            (ih restEq)
                  | close address =>
                      simp [parseCleanMarkedHistory?, statusEq,
                        classifierEq] at h

/-- Every declarative marked-clean history is accepted exactly. -/
theorem parseCleanMarkedHistory?_complete
    {program : CTS.Program}
    {history : List (CheckpointDecoder.LocalView program)}
    {queues : List (List Bool)}
    (shape : CleanMarkedHistory program history queues) :
    parseCleanMarkedHistory? history = some queues := by
  induction shape with
  | nil => rfl
  | cons view queue marked clean inner ih =>
      simp [parseCleanMarkedHistory?, marked, clean, ih]

/-- Historical queue recovery is unique. -/
theorem CleanMarkedHistory.queues_unique
    {program : CTS.Program}
    {history : List (CheckpointDecoder.LocalView program)}
    {first second : List (List Bool)}
    (hfirst : CleanMarkedHistory program history first)
    (hsecond : CleanMarkedHistory program history second) :
    first = second := by
  have firstParse := parseCleanMarkedHistory?_complete hfirst
  have secondParse := parseCleanMarkedHistory?_complete hsecond
  rw [firstParse] at secondParse
  exact Option.some.inj secondParse

/-- Forgetting cleanliness yields the existing marked-history grammar. -/
theorem CleanMarkedHistory.toMarkedHistory
    {program : CTS.Program}
    {history : List (CheckpointDecoder.LocalView program)}
    {queues : List (List Bool)}
    (shape : CleanMarkedHistory program history queues) :
    MarkedHistory program history := by
  induction shape with
  | nil => exact .nil
  | cons view queue marked clean inner ih => exact .cons view marked ih

/-- Every historical accumulator in this grammar has no canonical Open. -/
theorem CleanMarkedHistory.accumulators_clean
    {program : CTS.Program}
    {history : List (CheckpointDecoder.LocalView program)}
    {queues : List (List Bool)}
    (shape : CleanMarkedHistory program history queues) :
    ∀ (index : Nat) (view : CheckpointDecoder.LocalView program),
      history[index]? = some view →
      ∃ queue,
        RootResetAccumulatorClassifier.classify? view.accumulator =
          some ⟨queue, .clean⟩ := by
  induction shape with
  | nil =>
      intro index view lookup
      simp at lookup
  | cons head queue marked clean inner ih =>
      intro index view lookup
      cases index with
      | zero =>
          simp at lookup
          subst view
          exact ⟨queue, clean⟩
      | succ index =>
          simp only [List.getElem?_cons_succ] at lookup
          exact ih index view lookup

/-! ## The active complete-response boundary -/

/-- The two registered complete-response alternatives. -/
inductive Stage where
  | completeOpen (openAddress : Address)
  | completeClean
  deriving BEq, DecidableEq, Repr

/-- Bare information reconstructed at one fresh completed Local. -/
structure ActiveView (program : CTS.Program) where
  localView : CheckpointDecoder.LocalView program
  queue : List Bool
  stage : Stage
  deriving BEq, DecidableEq, Repr

def ActiveView.phase {program : CTS.Program} (view : ActiveView program) :
    CTS.Phase program :=
  view.localView.label.1

def ActiveView.frontBit {program : CTS.Program} (view : ActiveView program) :
    Bool :=
  view.localView.label.2

def ActiveView.queueFront? {program : CTS.Program} (view : ActiveView program) :
    Option Bool :=
  view.queue.head?

/-- Exact accumulator classifier result represented by a boundary stage. -/
def Stage.accumulatorStage : Stage → RootResetAccumulatorClassifier.Stage
  | .completeOpen address => .close address
  | .completeClean => .clean

/-- Total bare-root parser for a fresh complete response. -/
def parseActive?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (ActiveView program) :=
  match CheckpointDecoder.parseLocal? program tree term with
  | none => none
  | some endpointLocal =>
      if endpointLocal.status = .fresh then
        match RootResetAccumulatorClassifier.classify?
            endpointLocal.accumulator with
        | some ⟨queue, .clean⟩ =>
            some ⟨endpointLocal, queue, .completeClean⟩
        | some ⟨queue, .close address⟩ =>
            some ⟨endpointLocal, queue, .completeOpen address⟩
        | none => none
      else
        none

/-- Declarative active response grammar with exact parser fields. -/
structure ActiveShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : ActiveView program) (term : Term) : Prop where
  localShape : CheckpointDecoder.LocalShape program tree view.localView term
  fresh : view.localView.status = .fresh
  accumulator :
    RootResetAccumulatorClassifier.classify? view.localView.accumulator =
      some ⟨view.queue, view.stage.accumulatorStage⟩

/-- Successful active parsing supplies the exact declarative grammar. -/
theorem parseActive?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ActiveView program}
    (h : parseActive? program tree term = some view) :
    ActiveShape program tree view term := by
  cases localEq : CheckpointDecoder.parseLocal? program tree term with
  | none => simp [parseActive?, localEq] at h
  | some endpointLocal =>
      cases statusEq : endpointLocal.status with
      | marked => simp [parseActive?, localEq, statusEq] at h
      | fresh =>
          cases classifierEq : RootResetAccumulatorClassifier.classify?
              endpointLocal.accumulator with
          | none => simp [parseActive?, localEq, statusEq, classifierEq] at h
          | some classifier =>
              cases classifier with
              | mk queue accumulatorStage =>
                  cases accumulatorStage with
                  | clean =>
                      simp [parseActive?, localEq, statusEq, classifierEq] at h
                      subst view
                      exact ⟨CheckpointDecoder.parseLocal?_sound localEq,
                        statusEq, classifierEq⟩
                  | close address =>
                      simp [parseActive?, localEq, statusEq, classifierEq] at h
                      subst view
                      exact ⟨CheckpointDecoder.parseLocal?_sound localEq,
                        statusEq, classifierEq⟩

/-- Every active response shape is accepted exactly. -/
theorem parseActive?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ActiveView program}
    (shape : ActiveShape program tree view term) :
    parseActive? program tree term = some view := by
  unfold parseActive?
  rw [CheckpointDecoder.parseLocal?_complete shape.localShape]
  simp only [shape.fresh, ↓reduceIte]
  cases view with
  | mk endpointLocal queue stage =>
      cases stage with
      | completeOpen address =>
          have hacc : RootResetAccumulatorClassifier.classify?
              endpointLocal.accumulator = some ⟨queue, .close address⟩ :=
            shape.accumulator
          rw [hacc]
      | completeClean =>
          have hacc : RootResetAccumulatorClassifier.classify?
              endpointLocal.accumulator = some ⟨queue, .clean⟩ :=
            shape.accumulator
          rw [hacc]

/-- Active parsing is a function of the bare term. -/
theorem parseActive?_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : ActiveView program}
    (hfirst : parseActive? program tree term = some first)
    (hsecond : parseActive? program tree term = some second) :
    first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/-- Registered Open and clean alternatives are disjoint. -/
theorem Stage.completeOpen_ne_completeClean (address : Address) :
    Stage.completeOpen address ≠ .completeClean := by
  intro equality
  cases equality

/-- Every parsed active response recovers its phase and selected front bit. -/
theorem parseActive?_recovers_label
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ActiveView program}
    (_h : parseActive? program tree term = some view) :
    view.localView.label = (view.phase, view.frontBit) := by
  change view.localView.label =
    (view.localView.label.1, view.localView.label.2)
  exact (Prod.eta view.localView.label).symm

/-! ## Canonical bare-root placement -/

/-- Result of root-starting response-boundary parsing. -/
structure View (program : CTS.Program) where
  active : Term
  context : Context
  history : List (CheckpointDecoder.LocalView program)
  historyQueues : List (List Bool)
  endpoint : ActiveView program
  deriving BEq, DecidableEq, Repr

def View.phase {program : CTS.Program} (view : View program) :
    CTS.Phase program :=
  view.endpoint.phase

def View.frontBit {program : CTS.Program} (view : View program) : Bool :=
  view.endpoint.frontBit

def View.label {program : CTS.Program} (view : View program) :
    ActionLabel program :=
  view.endpoint.localView.label

def View.queue {program : CTS.Program} (view : View program) : List Bool :=
  view.endpoint.queue

/-- Root address of the active fresh Local. -/
def View.activeAddress {program : CTS.Program} (view : View program) : Address :=
  RootResetSelectorContract.contextAddress view.context

/-- Root address of the active response accumulator. -/
def View.accumulatorAddress
    {program : CTS.Program} (view : View program) : Address :=
  view.activeAddress ++ localAccumulatorAddress view.endpoint.localView

/-- Root address selected by CLOSE, if this is the registered Open alternative. -/
def View.closeAddress? {program : CTS.Program} (view : View program) :
    Option Address :=
  match view.endpoint.stage with
  | .completeOpen address => some (view.accumulatorAddress ++ address)
  | .completeClean => none

/-- Root address selected by COMMIT at a clean fresh Local. -/
def View.commitAddress {program : CTS.Program} (view : View program) : Address :=
  view.activeAddress ++ [.left, .left, .left]

/--
Parse from the bare root.  The traversal first peels the canonical marked
prefix, then checks that every peeled accumulator is clean, and finally
accepts one fresh complete response.
-/
def parse?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (View program) :=
  let decomposition := peelMarked program tree term
  match parseCleanMarkedHistory? decomposition.history with
  | none => none
  | some historyQueues =>
      match parseActive? program tree decomposition.active with
      | none => none
      | some endpoint =>
          some ⟨decomposition.active, decomposition.context,
            decomposition.history, historyQueues, endpoint⟩

/-- Exact registered whole placement. -/
structure WholeShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : View program) (term : Term) : Prop where
  markedPrefix :
    MarkedPrefix program tree term view.active view.context view.history
  cleanHistory :
    CleanMarkedHistory program view.history view.historyQueues
  activeShape : ActiveShape program tree view.endpoint view.active

/-- Successful whole parsing supplies the complete registered grammar. -/
theorem parse?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    WholeShape program tree view term := by
  simp only [parse?] at h
  cases historyEq : parseCleanMarkedHistory?
      (peelMarked program tree term).history with
  | none => simp [historyEq] at h
  | some historyQueues =>
      cases activeEq : parseActive? program tree
          (peelMarked program tree term).active with
      | none => simp [historyEq, activeEq] at h
      | some endpoint =>
          simp [historyEq, activeEq] at h
          subst view
          exact ⟨peelMarked_sound program tree term,
            parseCleanMarkedHistory?_sound historyEq,
            parseActive?_sound activeEq⟩

/-- Every registered whole placement is parsed exactly. -/
theorem parse?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (shape : WholeShape program tree view term) :
    parse? program tree term = some view := by
  have unique := markedPrefix_eq_peelMarked shape.markedPrefix
  rcases view with
    ⟨active, context, history, historyQueues, endpoint⟩
  simp only at unique shape ⊢
  rcases unique with ⟨activeEq, contextEq, historyEq⟩
  subst active
  subst context
  subst history
  simp only [parse?]
  rw [parseCleanMarkedHistory?_complete shape.cleanHistory,
    parseActive?_complete shape.activeShape]

/-- Whole parsing is definitionally a function of the current bare term. -/
theorem parse?_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : View program}
    (hfirst : parse? program tree term = some first)
    (hsecond : parse? program tree term = some second) :
    first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/-- A parsed term has a unique registered active-hole decomposition. -/
theorem unique_active_hole_decomposition
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    ∃ candidate : View program,
      WholeShape program tree candidate term ∧
      ∀ other : View program, WholeShape program tree other term →
        other = candidate := by
  refine ⟨view, parse?_sound h, ?_⟩
  intro candidate candidateShape
  exact parse?_unique (parse?_complete candidateShape) h

/-- Two registered decompositions have the same fresh Local and hole context. -/
theorem unique_active_fresh_local
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : View program}
    (firstShape : WholeShape program tree first term)
    (secondShape : WholeShape program tree second term) :
    first.active = second.active ∧
      first.context = second.context ∧
      first.endpoint.localView = second.endpoint.localView ∧
      first.endpoint.localView.status = .fresh := by
  have equality := parse?_unique (parse?_complete firstShape)
    (parse?_complete secondShape)
  subst second
  exact ⟨rfl, rfl, rfl, firstShape.activeShape.fresh⟩

/-- Whole complete-open and complete-clean registrations cannot overlap. -/
theorem whole_completeOpen_ne_completeClean
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {openView cleanView : View program}
    {address : Address}
    (openParsed : parse? program tree term = some openView)
    (openStage : openView.endpoint.stage = .completeOpen address)
    (cleanParsed : parse? program tree term = some cleanView)
    (cleanStage : cleanView.endpoint.stage = .completeClean) : False := by
  have equality := parse?_unique openParsed cleanParsed
  subst cleanView
  rw [openStage] at cleanStage
  cases cleanStage

/-- Every historical Local in the whole grammar is complete and marked. -/
theorem parse?_history_marked
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    MarkedHistory program view.history :=
  (parse?_sound h).cleanHistory.toMarkedHistory

/-- Every historical Local in the whole grammar also has a clean accumulator. -/
theorem parse?_history_clean
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    ∀ (index : Nat) (historical : CheckpointDecoder.LocalView program),
      view.history[index]? = some historical →
      ∃ queue,
        RootResetAccumulatorClassifier.classify? historical.accumulator =
          some ⟨queue, .clean⟩ :=
  (parse?_sound h).cleanHistory.accumulators_clean

/-- The fresh active Local is distinct from all marked historical Locals. -/
theorem parse?_active_fresh
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    view.endpoint.localView.status = .fresh :=
  (parse?_sound h).activeShape.fresh

/-- Whole parsing recovers phase, front bit, label, and accumulator queue. -/
theorem parse?_recovers_header
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    view.label = (view.phase, view.frontBit) ∧
      view.queue = view.endpoint.queue := by
  exact ⟨parseActive?_recovers_label
    (parseActive?_complete (parse?_sound h).activeShape), rfl⟩

/-! ## Exact accumulator occurrences -/

/-- The Local-relative address reaches the exact accumulator subtree. -/
theorem ActiveShape.accumulator_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ActiveView program}
    (shape : ActiveShape program tree view term) :
    term.subterm? (localAccumulatorAddress view.localView) =
      some view.localView.accumulator := by
  rcases shape.localShape with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, halt,
      dispatchShape, source⟩
  rcases dispatchShape with
    ⟨response, histories, routeShape, actionShape⟩
  rw [source]
  unfold localAccumulatorAddress
  change dispatcher.subterm?
    (routeResponseAddress view.localView.route ++
      ActionParser.accumulatorAddress
        (ActionParser.historyCount program view.localView.label)) =
      some view.localView.accumulator
  rw [CarrierDecoder.subterm?_append]
  rw [routeResponseAddress_subterm routeShape]
  exact actionShape.accumulator_subterm

/-- The whole root-relative address reaches the exact active accumulator. -/
theorem View.accumulator_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    term.subterm? view.accumulatorAddress =
      some view.endpoint.localView.accumulator := by
  have shape := parse?_sound h
  rw [← shape.markedPrefix.source_eq]
  unfold View.accumulatorAddress View.activeAddress
  rw [RootResetWholeStageClassifier.subterm?_plug_contextAddress_append]
  exact shape.activeShape.accumulator_subterm

/-! ## Retargeting the historical shell prefix -/

/-- Replace only the literal continuation of a parsed Local view. -/
def replaceContinuation
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (continuation : Term) : CheckpointDecoder.LocalView program :=
  { view with continuation := continuation }

@[simp] theorem replaceContinuation_status
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (continuation : Term) :
    (replaceContinuation view continuation).status = view.status := rfl

@[simp] theorem replaceContinuation_route
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (continuation : Term) :
    (replaceContinuation view continuation).route = view.route := rfl

@[simp] theorem replaceContinuation_label
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (continuation : Term) :
    (replaceContinuation view continuation).label = view.label := rfl

@[simp] theorem replaceContinuation_accumulator
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (continuation : Term) :
    (replaceContinuation view continuation).accumulator = view.accumulator := rfl

@[simp] theorem replaceContinuation_seedPayload
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (continuation : Term) :
    (replaceContinuation view continuation).seedPayload = view.seedPayload := rfl

@[simp] theorem replaceContinuation_continuation
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program)
    (continuation : Term) :
    (replaceContinuation view continuation).continuation = continuation := rfl

/-- A completed Local shell remains a completed Local after literal retargeting. -/
theorem localShape_replaceContinuation
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (shape : CheckpointDecoder.LocalShape program tree view term)
    (continuation : Term) :
    CheckpointDecoder.LocalShape program tree
      (replaceContinuation view continuation)
      ((localContinuationContext term).plug continuation) := by
  rcases shape with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, halt,
      dispatch, source⟩
  subst term
  exact ⟨haltField, dispatcher, seedAudit, continuationAudit, halt,
    dispatch, rfl⟩

/--
Retargeting the unique active hole reconstructs a canonical marked prefix.
Historical view records are retargeted because each record includes its
literal continuation; their status, accumulator, recovered queue, and opaque
payload fields are unchanged.
-/
theorem rewrap_clean_marked_prefix
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term active replacement : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    {queues : List (List Bool)}
    (prefixShape : MarkedPrefix program tree term active context history)
    (clean : CleanMarkedHistory program history queues)
    (stop : parseMarkedLocal? program tree replacement = none) :
    ∃ targetContext targetHistory targetQueues,
      MarkedPrefix program tree (context.plug replacement) replacement
        targetContext targetHistory ∧
      CleanMarkedHistory program targetHistory targetQueues := by
  induction prefixShape generalizing queues with
  | here oldStop =>
      cases clean
      exact ⟨.hole, [], [], .here stop, .nil⟩
  | @«local» source oldActive innerContext view history boundary marked inner ih =>
      cases clean with
      | cons _ queue cleanMarked accumulatorClean innerClean =>
          obtain ⟨targetInnerContext, targetHistory, targetQueues,
              targetPrefix, targetClean⟩ := ih innerClean
          let innerTarget := innerContext.plug replacement
          let targetView := replaceContinuation view innerTarget
          let targetSource :=
            (localContinuationContext source).plug innerTarget
          have targetShape : CheckpointDecoder.LocalShape program tree
              targetView targetSource := by
            exact localShape_replaceContinuation
              (CheckpointDecoder.parseLocal?_sound boundary) innerTarget
          have targetBoundary : CheckpointDecoder.parseLocal? program tree
              targetSource = some targetView :=
            CheckpointDecoder.parseLocal?_complete targetShape
          have targetMarked : targetView.status = .marked := by
            exact cleanMarked
          have targetAccumulatorClean :
              RootResetAccumulatorClassifier.classify?
                  targetView.accumulator = some ⟨queue, .clean⟩ := by
            exact accumulatorClean
          have rebuilt :
              MarkedPrefix program tree targetSource replacement
                ((localContinuationContext targetSource).comp
                  targetInnerContext)
                (targetView :: targetHistory) :=
            .local targetBoundary targetMarked targetPrefix
          refine ⟨(localContinuationContext targetSource).comp
              targetInnerContext,
            targetView :: targetHistory, queue :: targetQueues, ?_,
            .cons targetView queue targetMarked targetAccumulatorClean
              targetClean⟩
          simpa [targetSource, innerTarget, Context.plug_comp] using rebuilt

/-! ## CLOSE -/

/--
The registered whole CLOSE address contracts the unique Open cell.  The
result parses again from its bare root as the complete-clean alternative,
with the same phase, selected front bit, label, and queue.
-/
theorem View.close_exact
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program} {openAddress : Address}
    (parsed : parse? program tree term = some view)
    (stageEq : view.endpoint.stage = .completeOpen openAddress) :
    ∃ target targetView,
      view.closeAddress? =
        some (view.accumulatorAddress ++ openAddress) ∧
      term.contractAt? (view.accumulatorAddress ++ openAddress) =
        some target ∧
      parse? program tree target = some targetView ∧
      targetView.endpoint.stage = .completeClean ∧
      targetView.phase = view.phase ∧
      targetView.frontBit = view.frontBit ∧
      targetView.label = view.label ∧
      targetView.queue = view.queue := by
  have wholeShape := parse?_sound parsed
  have accumulatorEq := wholeShape.activeShape.accumulator
  rw [stageEq] at accumulatorEq
  change RootResetAccumulatorClassifier.classify?
      view.endpoint.localView.accumulator =
    some ⟨view.endpoint.queue, .close openAddress⟩ at accumulatorEq
  obtain ⟨targetAccumulator, accumulatorContracts, targetClean⟩ :=
    classify?_close_exact_clean accumulatorEq
  obtain ⟨targetActive, activeContracts, targetLocalShape⟩ :=
    localShape_contractAccumulator wholeShape.activeShape.localShape
      accumulatorContracts
  let targetEndpoint : ActiveView program :=
    ⟨replaceAccumulator view.endpoint.localView targetAccumulator,
      view.endpoint.queue, .completeClean⟩
  have targetActiveShape : ActiveShape program tree targetEndpoint
      targetActive := by
    refine ⟨targetLocalShape, ?_, ?_⟩
    · exact wholeShape.activeShape.fresh
    · exact targetClean
  have targetActiveParse : parseActive? program tree targetActive =
      some targetEndpoint :=
    parseActive?_complete targetActiveShape
  have targetStop : parseMarkedLocal? program tree targetActive = none := by
    unfold parseMarkedLocal?
    rw [CheckpointDecoder.parseLocal?_complete targetLocalShape]
    simp [wholeShape.activeShape.fresh]
  obtain ⟨targetContext, targetHistory, targetQueues, targetPrefix,
      targetHistoryClean⟩ :=
    rewrap_clean_marked_prefix wholeShape.markedPrefix
      wholeShape.cleanHistory targetStop
  let target := view.context.plug targetActive
  let targetView : View program :=
    ⟨targetActive, targetContext, targetHistory, targetQueues, targetEndpoint⟩
  have targetWholeShape : WholeShape program tree targetView target := by
    exact ⟨targetPrefix, targetHistoryClean, targetActiveShape⟩
  have wholeContracts :=
    RootResetWholeStageClassifier.contractAt?_plug_append view.context
      (localAccumulatorAddress view.endpoint.localView ++ openAddress)
      activeContracts
  rw [wholeShape.markedPrefix.source_eq] at wholeContracts
  have exactContracts :
      term.contractAt? (view.accumulatorAddress ++ openAddress) =
        some target := by
    simpa [target, View.accumulatorAddress, View.activeAddress,
      List.append_assoc] using wholeContracts
  refine ⟨target, targetView, ?_, exactContracts,
    parse?_complete targetWholeShape, rfl, ?_, ?_, ?_, ?_⟩
  · simp [View.closeAddress?, stageEq]
  · rfl
  · rfl
  · rfl
  · rfl

/-- CLOSE leaves no Open in the active accumulator or any historical one. -/
theorem View.close_noOpen_crosses_boundary
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program} {openAddress : Address}
    (parsed : parse? program tree term = some view)
    (stageEq : view.endpoint.stage = .completeOpen openAddress) :
    ∃ target targetView,
      term.contractAt? (view.accumulatorAddress ++ openAddress) =
        some target ∧
      parse? program tree target = some targetView ∧
      RootResetAccumulatorClassifier.classify?
          targetView.endpoint.localView.accumulator =
        some ⟨targetView.endpoint.queue, .clean⟩ ∧
      (∀ (index : Nat)
          (historical : CheckpointDecoder.LocalView program),
        targetView.history[index]? = some historical →
        ∃ queue,
          RootResetAccumulatorClassifier.classify? historical.accumulator =
            some ⟨queue, .clean⟩) := by
  obtain ⟨target, targetView, selected, contracts, targetParsed,
      targetStage, phase, bit, label, queue⟩ :=
    view.close_exact parsed stageEq
  have activeShape := (parse?_sound targetParsed).activeShape
  have activeAccumulator := activeShape.accumulator
  rw [targetStage] at activeAccumulator
  exact ⟨target, targetView, contracts, targetParsed,
    activeAccumulator, parse?_history_clean targetParsed⟩

/-! ## Prefix composition for continuation handoff -/

/--
Compose a clean marked outer prefix with a clean marked replacement prefix.
Outer Local records are retargeted to the replacement while every accumulator
and opaque payload field remains unchanged.
-/
theorem compose_clean_marked_prefix
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term oldActive replacement newActive : Term}
    {outerContext innerContext : Context}
    {outerHistory innerHistory :
      List (CheckpointDecoder.LocalView program)}
    {outerQueues innerQueues : List (List Bool)}
    (outerPrefix : MarkedPrefix program tree term oldActive outerContext
      outerHistory)
    (outerClean : CleanMarkedHistory program outerHistory outerQueues)
    (innerPrefix : MarkedPrefix program tree replacement newActive innerContext
      innerHistory)
    (innerClean : CleanMarkedHistory program innerHistory innerQueues)
    (innerNonempty : innerHistory ≠ []) :
    ∃ targetContext targetHistory targetQueues,
      MarkedPrefix program tree (outerContext.plug replacement) newActive
        targetContext targetHistory ∧
      CleanMarkedHistory program targetHistory targetQueues ∧
      targetHistory ≠ [] := by
  induction outerPrefix generalizing outerQueues with
  | here stop =>
      cases outerClean
      exact ⟨innerContext, innerHistory, innerQueues, innerPrefix, innerClean,
        innerNonempty⟩
  | @«local» source active nextContext view history boundary marked next ih =>
      cases outerClean with
      | cons _ queue cleanMarked accumulatorClean nextClean =>
          obtain ⟨targetInnerContext, targetHistory, targetQueues,
              targetPrefix, targetClean, targetNonempty⟩ := ih nextClean
          let innerTarget := nextContext.plug replacement
          let targetView := replaceContinuation view innerTarget
          let targetSource :=
            (localContinuationContext source).plug innerTarget
          have targetShape : CheckpointDecoder.LocalShape program tree
              targetView targetSource :=
            localShape_replaceContinuation
              (CheckpointDecoder.parseLocal?_sound boundary) innerTarget
          have targetBoundary : CheckpointDecoder.parseLocal? program tree
              targetSource = some targetView :=
            CheckpointDecoder.parseLocal?_complete targetShape
          have targetMarked : targetView.status = .marked := cleanMarked
          have targetAccumulatorClean :
              RootResetAccumulatorClassifier.classify?
                  targetView.accumulator = some ⟨queue, .clean⟩ :=
            accumulatorClean
          have rebuilt :
              MarkedPrefix program tree targetSource newActive
                ((localContinuationContext targetSource).comp
                  targetInnerContext)
                (targetView :: targetHistory) :=
            .local targetBoundary targetMarked targetPrefix
          refine ⟨(localContinuationContext targetSource).comp
              targetInnerContext,
            targetView :: targetHistory, queue :: targetQueues, ?_,
            .cons targetView queue targetMarked targetAccumulatorClean
              targetClean, by simp⟩
          simpa [targetSource, innerTarget, Context.plug_comp] using rebuilt

/-! ## COMMIT at one completed Local -/

/-- Change only the public halt status of a completed Local view. -/
def markLocalView
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program) :
    CheckpointDecoder.LocalView program :=
  { view with status := .marked }

@[simp] theorem markLocalView_status
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program) :
    (markLocalView view).status = .marked := rfl

@[simp] theorem markLocalView_route
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program) :
    (markLocalView view).route = view.route := rfl

@[simp] theorem markLocalView_label
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program) :
    (markLocalView view).label = view.label := rfl

@[simp] theorem markLocalView_accumulator
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program) :
    (markLocalView view).accumulator = view.accumulator := rfl

@[simp] theorem markLocalView_seedPayload
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program) :
    (markLocalView view).seedPayload = view.seedPayload := rfl

@[simp] theorem markLocalView_continuation
    {program : CTS.Program} (view : CheckpointDecoder.LocalView program) :
    (markLocalView view).continuation = view.continuation := rfl

/-- The fresh halt field contracts exactly to the independent-hole marked form. -/
theorem contractRoot?_freshHField (audit : Term) :
    (freshHField audit).contractRoot? =
      some (Carrier.markedHField audit audit) := by
  simp [freshHField, haltCode, haltTag, b, Carrier.markedHField,
    Term.contractRoot?, Term.contractum]

/--
At a fresh completed Local, `[L,L,L]` is the exact COMMIT contraction.  Only
the halt field changes; the route, action label, accumulator, seed payload,
and literal continuation are preserved.
-/
theorem localShape_commit
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (shape : CheckpointDecoder.LocalShape program tree view term)
    (fresh : view.status = .fresh) :
    ∃ target,
      term.contractAt? [.left, .left, .left] = some target ∧
      CheckpointDecoder.LocalShape program tree (markLocalView view) target := by
  rcases view with
    ⟨status, route, label, accumulator, seedPayload, continuation⟩
  cases status with
  | marked => contradiction
  | fresh =>
      rcases shape with
        ⟨haltField, dispatcher, seedAudit, continuationAudit, halt,
          dispatch, source⟩
      cases halt with
      | fresh audit =>
          subst term
          let target := CheckpointDecoder.openShell
            (Carrier.markedHField audit audit) dispatcher seedPayload
            seedAudit continuation continuationAudit
          refine ⟨target, ?_, ?_⟩
          · rfl
          · exact ⟨Carrier.markedHField audit audit, dispatcher, seedAudit,
              continuationAudit, .marked audit audit, dispatch, rfl⟩

/--
A parsed clean response always exposes the COMMIT redex at its registered
whole-term address.  This statement needs no condition on the literal
continuation: continuation cleanliness is required only to classify the
post-COMMIT handoff, not to justify the contraction itself.
-/
theorem View.commit_contracts
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (parsed : parse? program tree term = some view)
    (_stageEq : view.endpoint.stage = .completeClean) :
    ∃ target, term.contractAt? view.commitAddress = some target := by
  have wholeShape := parse?_sound parsed
  obtain ⟨targetActive, activeContracts, _targetLocalShape⟩ :=
    localShape_commit wholeShape.activeShape.localShape
      wholeShape.activeShape.fresh
  let target := view.context.plug targetActive
  have wholeContracts :=
    RootResetWholeStageClassifier.contractAt?_plug_append view.context
      [.left, .left, .left] activeContracts
  rw [wholeShape.markedPrefix.source_eq] at wholeContracts
  refine ⟨target, ?_⟩
  simpa [target, View.commitAddress, View.activeAddress,
    List.append_assoc] using wholeContracts

/-! ## Total marked continuation-handoff parser -/

/-- Canonical nonempty clean marked prefix exposing its literal continuation. -/
structure HandoffView (program : CTS.Program) where
  active : Term
  context : Context
  history : List (CheckpointDecoder.LocalView program)
  historyQueues : List (List Bool)
  deriving BEq, DecidableEq, Repr

/-- Bare-root parser for a nonempty clean marked continuation prefix. -/
def parseHandoff?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (HandoffView program) :=
  let decomposition := peelMarked program tree term
  match decomposition.history with
  | [] => none
  | _ :: _ =>
      match parseCleanMarkedHistory? decomposition.history with
      | none => none
      | some historyQueues =>
          some ⟨decomposition.active, decomposition.context,
            decomposition.history, historyQueues⟩

/-- Declarative grammar for a nonempty marked continuation handoff. -/
structure HandoffShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : HandoffView program) (term : Term) : Prop where
  markedPrefix :
    MarkedPrefix program tree term view.active view.context view.history
  cleanHistory :
    CleanMarkedHistory program view.history view.historyQueues
  nonempty : view.history ≠ []

/-- Successful handoff parsing supplies its exact marked-clean prefix. -/
theorem parseHandoff?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : HandoffView program}
    (h : parseHandoff? program tree term = some view) :
    HandoffShape program tree view term := by
  unfold parseHandoff? at h
  generalize decompositionEq : peelMarked program tree term = decomposition at h
  cases decomposition with
  | mk active context history =>
      cases history with
      | nil => contradiction
      | cons first rest =>
          cases cleanEq : parseCleanMarkedHistory? (first :: rest) with
          | none => simp [cleanEq] at h
          | some queues =>
              simp [cleanEq] at h
              subst view
              have prefixShape := peelMarked_sound program tree term
              rw [decompositionEq] at prefixShape
              exact ⟨prefixShape,
                parseCleanMarkedHistory?_sound cleanEq, by simp⟩

/-- Every canonical nonempty clean handoff is parsed exactly. -/
theorem parseHandoff?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : HandoffView program}
    (shape : HandoffShape program tree view term) :
    parseHandoff? program tree term = some view := by
  have unique := markedPrefix_eq_peelMarked shape.markedPrefix
  rcases view with ⟨active, context, history, queues⟩
  simp only at unique shape ⊢
  rcases unique with ⟨activeEq, contextEq, historyEq⟩
  subst active
  subst context
  subst history
  cases historyCase : (peelMarked program tree term).history with
  | nil => exact False.elim (shape.nonempty historyCase)
  | cons first rest =>
      have cleanParse := parseCleanMarkedHistory?_complete shape.cleanHistory
      rw [historyCase] at cleanParse
      simp [parseHandoff?, historyCase, cleanParse]

/-- Handoff parsing is a function of the current bare term. -/
theorem parseHandoff?_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : HandoffView program}
    (hfirst : parseHandoff? program tree term = some first)
    (hsecond : parseHandoff? program tree term = some second) :
    first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/-- Every handoff history is literally complete, marked, and clean. -/
theorem parseHandoff?_history_marked_clean
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : HandoffView program}
    (h : parseHandoff? program tree term = some view) :
    MarkedHistory program view.history ∧
      CleanMarkedHistory program view.history view.historyQueues := by
  have shape := parseHandoff?_sound h
  exact ⟨shape.cleanHistory.toMarkedHistory, shape.cleanHistory⟩

/-! ## Whole COMMIT and marked continuation handoff -/

/--
COMMIT at a clean response contracts the fresh halt field and produces a
bare-root marked continuation handoff.  The only additional premise checks
that marked Locals already present at the literal continuation are clean; the
explicit response-boundary grammar places no restriction on that opaque
continuation before COMMIT.
-/
theorem View.commit_exact_with_handoff_active
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    {continuationQueues : List (List Bool)}
    (parsed : parse? program tree term = some view)
    (stageEq : view.endpoint.stage = .completeClean)
    (continuationClean :
      parseCleanMarkedHistory?
          (peelMarked program tree
            view.endpoint.localView.continuation).history =
        some continuationQueues) :
    ∃ target handoff targetActive committedView,
      term.contractAt? view.commitAddress = some target ∧
      parseHandoff? program tree target = some handoff ∧
      target.subterm? view.activeAddress = some targetActive ∧
      parseMarkedLocal? program tree targetActive = some committedView ∧
      committedView.continuation =
        view.endpoint.localView.continuation ∧
      committedView.accumulator = view.endpoint.localView.accumulator ∧
      committedView.label = view.label ∧
      RootResetAccumulatorClassifier.classify? committedView.accumulator =
        some ⟨view.queue, .clean⟩ ∧
      handoff.active =
        (peelMarked program tree
          view.endpoint.localView.continuation).active := by
  have wholeShape := parse?_sound parsed
  have activeClean := wholeShape.activeShape.accumulator
  rw [stageEq] at activeClean
  change RootResetAccumulatorClassifier.classify?
      view.endpoint.localView.accumulator =
    some ⟨view.endpoint.queue, .clean⟩ at activeClean
  obtain ⟨targetActive, activeContracts, targetLocalShape⟩ :=
    localShape_commit wholeShape.activeShape.localShape
      wholeShape.activeShape.fresh
  let committedView := markLocalView view.endpoint.localView
  have targetLocalParse : CheckpointDecoder.parseLocal? program tree
      targetActive = some committedView :=
    CheckpointDecoder.parseLocal?_complete targetLocalShape
  have targetMarkedParse : parseMarkedLocal? program tree targetActive =
      some committedView :=
    parseMarkedLocal?_complete targetLocalParse rfl
  let continuationDecomposition :=
    peelMarked program tree view.endpoint.localView.continuation
  have continuationPrefix :
      MarkedPrefix program tree view.endpoint.localView.continuation
        continuationDecomposition.active continuationDecomposition.context
        continuationDecomposition.history :=
    peelMarked_sound program tree view.endpoint.localView.continuation
  have continuationHistoryClean :
      CleanMarkedHistory program continuationDecomposition.history
        continuationQueues := by
    exact parseCleanMarkedHistory?_sound continuationClean
  have committedPrefix :
      MarkedPrefix program tree targetActive continuationDecomposition.active
        ((localContinuationContext targetActive).comp
          continuationDecomposition.context)
        (committedView :: continuationDecomposition.history) :=
    .local targetLocalParse rfl continuationPrefix
  have committedAccumulatorClean :
      RootResetAccumulatorClassifier.classify? committedView.accumulator =
        some ⟨view.endpoint.queue, .clean⟩ := activeClean
  have committedHistoryClean :
      CleanMarkedHistory program
        (committedView :: continuationDecomposition.history)
        (view.endpoint.queue :: continuationQueues) :=
    .cons committedView view.endpoint.queue rfl committedAccumulatorClean
      continuationHistoryClean
  obtain ⟨targetContext, targetHistory, targetQueues, targetPrefix,
      targetHistoryClean, targetHistoryNonempty⟩ :=
    compose_clean_marked_prefix wholeShape.markedPrefix
      wholeShape.cleanHistory committedPrefix committedHistoryClean (by simp)
  let target := view.context.plug targetActive
  let handoff : HandoffView program :=
    ⟨continuationDecomposition.active, targetContext, targetHistory,
      targetQueues⟩
  have handoffShape : HandoffShape program tree handoff target :=
    ⟨targetPrefix, targetHistoryClean, targetHistoryNonempty⟩
  have wholeContracts :=
    RootResetWholeStageClassifier.contractAt?_plug_append view.context
      [.left, .left, .left] activeContracts
  rw [wholeShape.markedPrefix.source_eq] at wholeContracts
  have exactContracts : term.contractAt? view.commitAddress = some target := by
    simpa [target, View.commitAddress, View.activeAddress,
      List.append_assoc] using wholeContracts
  have activeSubterm : target.subterm? view.activeAddress = some targetActive := by
    have found := CanonicalTraversal.context_subterm?_plug view.context
      targetActive
    rw [← contextAddress_eq_canonical] at found
    exact found
  refine ⟨target, handoff, targetActive, committedView, exactContracts,
    parseHandoff?_complete handoffShape, activeSubterm, targetMarkedParse,
    ?_, ?_, ?_, committedAccumulatorClean, rfl⟩
  · rfl
  · rfl
  · rfl

/--
Exact COMMIT with the marked target fields exposed.  The stronger
`commit_exact_with_handoff_active` theorem additionally identifies the active
endpoint reached through the continuation handoff.
-/
theorem View.commit_exact
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    {continuationQueues : List (List Bool)}
    (parsed : parse? program tree term = some view)
    (stageEq : view.endpoint.stage = .completeClean)
    (continuationClean :
      parseCleanMarkedHistory?
          (peelMarked program tree
            view.endpoint.localView.continuation).history =
        some continuationQueues) :
    ∃ target handoff targetActive committedView,
      term.contractAt? view.commitAddress = some target ∧
      parseHandoff? program tree target = some handoff ∧
      target.subterm? view.activeAddress = some targetActive ∧
      parseMarkedLocal? program tree targetActive = some committedView ∧
      committedView.continuation =
        view.endpoint.localView.continuation ∧
      committedView.accumulator = view.endpoint.localView.accumulator ∧
      committedView.label = view.label ∧
      RootResetAccumulatorClassifier.classify? committedView.accumulator =
        some ⟨view.queue, .clean⟩ := by
  obtain ⟨target, handoff, targetActive, committedView, contracts,
      handoffParsed, activeSubterm, markedParse, continuation, accumulator,
      label, clean, _handoffActive⟩ :=
    view.commit_exact_with_handoff_active parsed stageEq continuationClean
  exact ⟨target, handoff, targetActive, committedView, contracts,
    handoffParsed, activeSubterm, markedParse, continuation, accumulator,
    label, clean⟩

/--
The exact COMMIT target adds a clean marked Local to the historical prefix;
therefore no Open crosses the handoff boundary.
-/
theorem View.commit_noOpen_crosses_boundary
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    {continuationQueues : List (List Bool)}
    (parsed : parse? program tree term = some view)
    (stageEq : view.endpoint.stage = .completeClean)
    (continuationClean :
      parseCleanMarkedHistory?
          (peelMarked program tree
            view.endpoint.localView.continuation).history =
        some continuationQueues) :
    ∃ target handoff,
      term.contractAt? view.commitAddress = some target ∧
      parseHandoff? program tree target = some handoff ∧
      CleanMarkedHistory program handoff.history handoff.historyQueues := by
  obtain ⟨target, handoff, targetActive, committedView, contracts,
      handoffParsed, activeSubterm, markedParse, continuation, accumulator,
      label, clean⟩ :=
    view.commit_exact parsed stageEq continuationClean
  exact ⟨target, handoff, contracts, handoffParsed,
    (parseHandoff?_sound handoffParsed).cleanHistory⟩

/-! ## Generated completeness and opacity interfaces -/

/-- A generated fresh completed Local with one Open is accepted exactly. -/
theorem parseActive?_of_localShape_completeOpen
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {localView : CheckpointDecoder.LocalView program}
    {queue : List Bool} {address : Address}
    (localShape : CheckpointDecoder.LocalShape program tree localView term)
    (fresh : localView.status = .fresh)
    (classification : RootResetAccumulatorClassifier.classify?
        localView.accumulator = some ⟨queue, .close address⟩) :
    parseActive? program tree term =
      some ⟨localView, queue, .completeOpen address⟩ := by
  apply parseActive?_complete
  exact ⟨localShape, fresh, classification⟩

/-- A generated fresh completed Local with a clean accumulator is accepted. -/
theorem parseActive?_of_localShape_completeClean
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {localView : CheckpointDecoder.LocalView program}
    {queue : List Bool}
    (localShape : CheckpointDecoder.LocalShape program tree localView term)
    (fresh : localView.status = .fresh)
    (classification : RootResetAccumulatorClassifier.classify?
        localView.accumulator = some ⟨queue, .clean⟩) :
    parseActive? program tree term =
      some ⟨localView, queue, .completeClean⟩ := by
  apply parseActive?_complete
  exact ⟨localShape, fresh, classification⟩

/-- Generated active response shapes lift through a clean marked prefix. -/
theorem parse?_of_registered_shapes
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    {historyQueues : List (List Bool)} {endpoint : ActiveView program}
    (marked : MarkedPrefix program tree term active context history)
    (clean : CleanMarkedHistory program history historyQueues)
    (activeShape : ActiveShape program tree endpoint active) :
    parse? program tree term =
      some ⟨active, context, history, historyQueues, endpoint⟩ := by
  apply parse?_complete
  exact ⟨marked, clean, activeShape⟩

/-- Generated nonempty clean marked prefixes lift to the handoff parser. -/
theorem parseHandoff?_of_registered_shapes
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    {historyQueues : List (List Bool)}
    (marked : MarkedPrefix program tree term active context history)
    (clean : CleanMarkedHistory program history historyQueues)
    (nonempty : history ≠ []) :
    parseHandoff? program tree term =
      some ⟨active, context, history, historyQueues⟩ := by
  apply parseHandoff?_complete
  exact ⟨marked, clean, nonempty⟩

/--
Fresh Local halt, seed, and continuation audit holes do not affect active
response recovery.  The seed payload and literal continuation themselves are
retained public fields and are therefore held fixed.
-/
theorem parseActive?_shell_audits_opaque
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (dispatcher seedPayload continuation : Term)
    (firstHaltAudit firstSeedAudit firstContinuationAudit
      secondHaltAudit secondSeedAudit secondContinuationAudit : Term) :
    parseActive? program tree
        (CheckpointDecoder.openShell (freshHField firstHaltAudit) dispatcher
          seedPayload firstSeedAudit continuation firstContinuationAudit) =
      parseActive? program tree
        (CheckpointDecoder.openShell (freshHField secondHaltAudit) dispatcher
          seedPayload secondSeedAudit continuation secondContinuationAudit) := by
  simp [parseActive?, CheckpointDecoder.parseLocal?,
    CheckpointDecoder.openShell, CheckpointDecoder.checkHalt?, freshHField]

/--
Marked halt and Local-shell audit holes do not affect the marked Local view.
The parser reconstructs no audit field and performs no equality comparison
between them.
-/
theorem parseMarkedLocal?_shell_audits_opaque
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (dispatcher seedPayload continuation : Term)
    (firstLeftAudit firstRightAudit firstSeedAudit firstContinuationAudit
      secondLeftAudit secondRightAudit secondSeedAudit
      secondContinuationAudit : Term) :
    parseMarkedLocal? program tree
        (CheckpointDecoder.openShell
          (Carrier.markedHField firstLeftAudit firstRightAudit) dispatcher
          seedPayload firstSeedAudit continuation firstContinuationAudit) =
      parseMarkedLocal? program tree
        (CheckpointDecoder.openShell
          (Carrier.markedHField secondLeftAudit secondRightAudit) dispatcher
          seedPayload secondSeedAudit continuation secondContinuationAudit) := by
  simp [parseMarkedLocal?, CheckpointDecoder.parseLocal?,
    CheckpointDecoder.openShell, CheckpointDecoder.checkHalt?,
    Carrier.markedHField, haltCode, b]

/-- An Open cell's opaque audit cannot affect its CLOSE classification. -/
theorem open_accumulator_audit_opaque
    (bit : Bool) (predecessor firstAudit secondAudit : Term) :
    RootResetAccumulatorClassifier.classify?
        (RootResetProgressRoles.openCell bit predecessor firstAudit) =
      RootResetAccumulatorClassifier.classify?
        (RootResetProgressRoles.openCell bit predecessor secondAudit) :=
  RootResetAccumulatorClassifier.open_audit_opaque bit predecessor
    firstAudit secondAudit

/-- Closed-cell opaque audits cannot affect queue or cleanliness recovery. -/
theorem closed_accumulator_audits_opaque
    (bit : Bool) (predecessor firstLeft firstRight secondLeft secondRight : Term) :
    RootResetAccumulatorClassifier.classify?
        (RootResetProgressRoles.closedCell bit predecessor firstLeft
          firstRight) =
      RootResetAccumulatorClassifier.classify?
        (RootResetProgressRoles.closedCell bit predecessor secondLeft
          secondRight) :=
  RootResetAccumulatorClassifier.closed_audits_opaque bit predecessor
    firstLeft firstRight secondLeft secondRight

/-- A continuation rejected by the marked parser has an empty clean prefix. -/
theorem continuationClean_of_not_marked
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {continuation : Term}
    (stop : parseMarkedLocal? program tree continuation = none) :
    parseCleanMarkedHistory?
        (peelMarked program tree continuation).history = some [] := by
  rw [peelMarked]
  rw [stop]
  rfl

/--
Common COMMIT specialization with its exact handoff endpoint: when the literal
continuation is rejected by the marked-Local parser, the clean-prefix premise
is discharged and the handoff's active endpoint is that literal continuation.
The rejection hypothesis remains explicit.
-/
theorem View.commit_exact_to_unmarked_continuation_with_handoff_active
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (parsed : parse? program tree term = some view)
    (stageEq : view.endpoint.stage = .completeClean)
    (continuationStop : parseMarkedLocal? program tree
      view.endpoint.localView.continuation = none) :
    ∃ target handoff targetActive committedView,
      term.contractAt? view.commitAddress = some target ∧
      parseHandoff? program tree target = some handoff ∧
      target.subterm? view.activeAddress = some targetActive ∧
      parseMarkedLocal? program tree targetActive = some committedView ∧
      committedView.continuation =
        view.endpoint.localView.continuation ∧
      committedView.accumulator = view.endpoint.localView.accumulator ∧
      committedView.label = view.label ∧
      RootResetAccumulatorClassifier.classify? committedView.accumulator =
        some ⟨view.queue, .clean⟩ ∧
      handoff.active = view.endpoint.localView.continuation := by
  obtain ⟨target, handoff, targetActive, committedView, contracts,
      handoffParsed, activeSubterm, markedParse, continuation, accumulator,
      label, clean, handoffActive⟩ :=
    view.commit_exact_with_handoff_active parsed stageEq
      (continuationClean_of_not_marked continuationStop)
  have continuationActive :
      (peelMarked program tree
        view.endpoint.localView.continuation).active =
          view.endpoint.localView.continuation := by
    rw [peelMarked]
    rw [continuationStop]
  exact ⟨target, handoff, targetActive, committedView, contracts,
    handoffParsed, activeSubterm, markedParse, continuation, accumulator,
    label, clean, handoffActive.trans continuationActive⟩

/--
Common COMMIT specialization without a separate continuation-cleanliness
premise.  It still assumes explicitly that the literal continuation is not a
marked completed Local.  The stronger companion also exposes the exact
handoff-active equality.
-/
theorem View.commit_exact_to_unmarked_continuation
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (parsed : parse? program tree term = some view)
    (stageEq : view.endpoint.stage = .completeClean)
    (continuationStop : parseMarkedLocal? program tree
      view.endpoint.localView.continuation = none) :
    ∃ target handoff targetActive committedView,
      term.contractAt? view.commitAddress = some target ∧
      parseHandoff? program tree target = some handoff ∧
      target.subterm? view.activeAddress = some targetActive ∧
      parseMarkedLocal? program tree targetActive = some committedView ∧
      committedView.continuation =
        view.endpoint.localView.continuation ∧
      committedView.accumulator = view.endpoint.localView.accumulator ∧
      committedView.label = view.label ∧
      RootResetAccumulatorClassifier.classify? committedView.accumulator =
        some ⟨view.queue, .clean⟩ := by
  obtain ⟨target, handoff, targetActive, committedView, contracts,
      handoffParsed, activeSubterm, markedParse, continuation, accumulator,
      label, clean, _handoffActive⟩ :=
    view.commit_exact_to_unmarked_continuation_with_handoff_active
      parsed stageEq continuationStop
  exact ⟨target, handoff, targetActive, committedView, contracts,
    handoffParsed, activeSubterm, markedParse, continuation, accumulator,
    label, clean⟩

end PureSFormal.Research.RootResetResponseBoundaryStages
