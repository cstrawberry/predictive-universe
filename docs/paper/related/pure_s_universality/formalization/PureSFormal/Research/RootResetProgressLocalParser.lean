import PureSFormal.Research.RootResetProgressProgramCode
import PureSFormal.Research.RootResetReachableStageGrammar
import PureSFormal.PureS.PrimitiveRoute

/-!
# Completed progress-Local parser

This module gives the term-only boundary parser used after a progress-aware
dispatcher and its selected action have both finished.  The parser checks the
fresh/marked halt prefix, the activated route, and the label-indexed public
action spine.  It returns the route, label, registered accumulator, literal
seed payload, and literal continuation.  Halt audits, route audits, action
histories, the seed audit, and the continuation audit remain independent
opaque fields.
-/

namespace PureSFormal.Research.RootResetProgressLocalParser

open PureSFormal.PureS

abbrev progressSelectedAction :=
  RootResetProgressProgramCode.progressSelectedAction

/-! ## Executable and declarative completed boundaries -/

/-- Public fields recovered from one completed progress-aware Local. -/
structure View (program : CTS.Program) where
  status : CheckpointDecoder.HaltStatus
  route : Dispatcher.Route
  label : ActionLabel program
  accumulator : Term
  seedPayload : Term
  continuation : Term
  deriving BEq, DecidableEq, Repr

/--
Independent-hole grammar for a completed progress-aware Local.  No audit or
history field is compared with the accumulator or with any other field.
-/
inductive Shape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : View program) (term : Term) : Prop where
  | intro
      (haltField dispatcher response seedAudit continuationAudit : Term)
      (histories : List Term)
      (halt : CheckpointDecoder.HaltShape view.status haltField)
      (route : RouteGrammar.ActivatedRoute
        (progressSelectedAction program) tree view.route view.label response
        dispatcher)
      (action : ActionParser.ActionShape program view.label view.accumulator
        histories response)
      (source_eq : term = CheckpointDecoder.openShell haltField dispatcher
        view.seedPayload seedAudit view.continuation continuationAudit) :
      Shape program tree view term

/--
Parse a completed progress Local from the bare term.  The generic action
parser is applicable because progress appenders preserve the same public
`p accumulator histories...` spine and label-indexed history count.
-/
def parse? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → Option (View program)
  | .app
      (.app
        (.app haltField dispatcher)
        (.app (.app .s seedPayload) _seedAudit))
      (.app continuation _continuationAudit) =>
      match CheckpointDecoder.checkHalt? haltField with
      | none => none
      | some haltCheck =>
          match DispatchParser.parseRouteDetailed
              (progressSelectedAction program) tree dispatcher with
          | none => none
          | some route =>
              match ActionParser.parse program route.label route.response with
              | none => none
              | some action =>
                  some ⟨haltCheck.status, route.route, route.label,
                    action.accumulator, seedPayload, continuation⟩
  | _ => none

/-- Successful parsing reconstructs the exact independent-hole grammar. -/
theorem parse?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    Shape program tree view term := by
  unfold parse? at h
  split at h <;> try contradiction
  next source haltField dispatcher seedPayload seedAudit continuation
      continuationAudit =>
    split at h <;> try contradiction
    next haltCheck hhalt =>
      split at h <;> try contradiction
      next route hroute =>
        split at h <;> try contradiction
        next action haction =>
          have viewEq :
              View.mk haltCheck.status route.route route.label
                action.accumulator seedPayload continuation = view :=
            Option.some.inj h
          subst view
          exact .intro haltField dispatcher route.response seedAudit
            continuationAudit action.histories haltCheck.shape
            (DispatchParser.parseRouteDetailed_sound hroute)
            (ActionParser.parse_sound haction) rfl

/-- Every term in the declarative completed-Local language parses exactly. -/
theorem parse?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : Shape program tree view term) :
    parse? program tree term = some view := by
  cases view with
  | mk status route label accumulator seedPayload continuation =>
      cases h with
      | intro haltField dispatcher response seedAudit continuationAudit
          histories haltShape routeShape actionShape sourceEq =>
        subst term
        cases haltShape with
        | fresh audit =>
            simp [parse?, CheckpointDecoder.openShell,
              CheckpointDecoder.checkHalt?, freshHField,
              DispatchParser.parseRouteDetailed_complete routeShape,
              ActionParser.parse_complete actionShape]
        | marked leftAudit rightAudit =>
            simp [parse?, CheckpointDecoder.openShell,
              CheckpointDecoder.checkHalt?, Carrier.markedHField, haltCode, b,
              DispatchParser.parseRouteDetailed_complete routeShape,
              ActionParser.parse_complete actionShape]

/-- Parsing and the independent-hole grammar are extensionally equivalent. -/
theorem parse_eq_some_iff
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program} :
    parse? program tree term = some view ↔ Shape program tree view term :=
  ⟨parse?_sound, parse?_complete⟩

/-! ## Literal completed progress constructors -/

/-- A fresh progress Local after its dispatcher and selected action finish. -/
def completedFresh (bits : List Bool) (continuation carrier dispatcher : Term) :
    Term :=
  CheckpointDecoder.openShell (freshHField carrier) dispatcher
    (RootResetProgressProgramCode.progressWord bits) carrier continuation carrier

/-- The corresponding completed Local after the visible COMMIT contraction. -/
def completedMarked (bits : List Bool)
    (continuation carrier dispatcher : Term) : Term :=
  CheckpointDecoder.openShell (Carrier.markedHField carrier carrier) dispatcher
    (RootResetProgressProgramCode.progressWord bits) carrier continuation carrier

/-- Before route activation, `completedFresh` is literally `progressFreshLocal`. -/
@[simp]
theorem completedFresh_dormant
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    completedFresh bits continuation carrier
        (.app (RootResetProgressProgramCode.progressCompileActions program tree)
          carrier) =
      RootResetProgressProgramCode.progressFreshLocal program tree bits
        continuation carrier :=
  rfl

/-- Before route activation, `completedMarked` is literally `progressMarkedLocal`. -/
@[simp]
theorem completedMarked_dormant
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    completedMarked bits continuation carrier
        (.app (RootResetProgressProgramCode.progressCompileActions program tree)
          carrier) =
      RootResetProgressProgramCode.progressMarkedLocal program tree bits
        continuation carrier :=
  rfl

/-- Progress actions have the same label-indexed public history count. -/
theorem progressActionHistories_length
    (program : CTS.Program) (label : ActionLabel program) (carrier : Term) :
    (RootResetProgressProgramCode.progressActionHistories program label carrier).length =
      ActionParser.historyCount program label := by
  rcases label with ⟨phase, bit⟩
  cases bit with
  | false => rfl
  | true =>
      simpa [RootResetProgressProgramCode.progressActionHistories,
        ActionParser.historyCount] using
        RootResetProgressProgramCode.progressRetainedHistories_length
          (program.appendant phase) carrier

/-- Every completed progress action has the generic public action shape. -/
theorem progressActionResult_shape
    (program : CTS.Program) (label : ActionLabel program) (carrier : Term) :
    ActionParser.ActionShape program label
      (RootResetProgressProgramCode.progressActionAccumulator program label
        carrier)
      (RootResetProgressProgramCode.progressActionHistories program label
        carrier)
      (RootResetProgressProgramCode.progressActionResult program label
        carrier) :=
  ⟨progressActionHistories_length program label carrier, rfl⟩

/-- Exact public view of a completed fresh response. -/
def freshView (program : CTS.Program) (route : Dispatcher.Route)
    (label : ActionLabel program) (bits : List Bool)
    (continuation carrier : Term) : View program :=
  ⟨CheckpointDecoder.HaltStatus.fresh, route, label,
    RootResetProgressProgramCode.progressActionAccumulator program label carrier,
    RootResetProgressProgramCode.progressWord bits, continuation⟩

/-- Exact public view of the same response after COMMIT. -/
def markedView (program : CTS.Program) (route : Dispatcher.Route)
    (label : ActionLabel program) (bits : List Bool)
    (continuation carrier : Term) : View program :=
  ⟨CheckpointDecoder.HaltStatus.marked, route, label,
    RootResetProgressProgramCode.progressActionAccumulator program label carrier,
    RootResetProgressProgramCode.progressWord bits, continuation⟩

/-- A completed route/action inside a fresh progress Local parses exactly. -/
@[simp]
theorem parse?_completedFresh
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term) :
    let dispatcher := PrimitiveRoute.withResponse
      (progressSelectedAction program) tree route carrier
      (RootResetProgressProgramCode.progressActionResult program label carrier)
    parse? program tree
        (completedFresh bits continuation carrier dispatcher) =
      some (freshView program route label bits continuation carrier) := by
  dsimp only
  apply parse?_complete
  exact .intro (freshHField carrier)
    (PrimitiveRoute.withResponse (progressSelectedAction program) tree route
      carrier
      (RootResetProgressProgramCode.progressActionResult program label carrier))
    (RootResetProgressProgramCode.progressActionResult program label carrier)
    carrier carrier
    (RootResetProgressProgramCode.progressActionHistories program label carrier)
    (.fresh carrier)
    (PrimitiveRoute.withResponse_activated path carrier
      (RootResetProgressProgramCode.progressActionResult program label carrier))
    (progressActionResult_shape program label carrier) rfl

/-- The committed version of a completed route/action parses exactly. -/
@[simp]
theorem parse?_completedMarked
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term) :
    let dispatcher := PrimitiveRoute.withResponse
      (progressSelectedAction program) tree route carrier
      (RootResetProgressProgramCode.progressActionResult program label carrier)
    parse? program tree
        (completedMarked bits continuation carrier dispatcher) =
      some (markedView program route label bits continuation carrier) := by
  dsimp only
  apply parse?_complete
  exact .intro (Carrier.markedHField carrier carrier)
    (PrimitiveRoute.withResponse (progressSelectedAction program) tree route
      carrier
      (RootResetProgressProgramCode.progressActionResult program label carrier))
    (RootResetProgressProgramCode.progressActionResult program label carrier)
    carrier carrier
    (RootResetProgressProgramCode.progressActionHistories program label carrier)
    (.marked carrier carrier)
    (PrimitiveRoute.withResponse_activated path carrier
      (RootResetProgressProgramCode.progressActionResult program label carrier))
    (progressActionResult_shape program label carrier) rfl

/-! ## Exact registered children -/

/-- The fixed dispatcher address in either completed Local shell. -/
def dispatcherAddress : Address :=
  [.left, .left, .right]

/-- The literal continuation address in either completed Local shell. -/
def continuationAddress : Address :=
  [.right, .left]

/-- The route- and label-indexed address of the registered accumulator. -/
def accumulatorAddress {program : CTS.Program} (view : View program) : Address :=
  dispatcherAddress ++
    (RootResetReachableStageGrammar.routeResponseAddress view.route ++
      ActionParser.accumulatorAddress
        (ActionParser.historyCount program view.label))

/-- A successful parse locates its dispatcher at the fixed shell address. -/
theorem parse?_dispatcher_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    ∃ dispatcher, term.subterm? dispatcherAddress = some dispatcher := by
  rcases parse?_sound h with
    ⟨haltField, dispatcher, response, seedAudit, continuationAudit,
      histories, haltShape, routeShape, actionShape, sourceEq⟩
  refine ⟨dispatcher, ?_⟩
  rw [sourceEq]
  simp [dispatcherAddress, CheckpointDecoder.openShell, Term.subterm?]

/-- The returned accumulator occurs at its exact root-relative address. -/
theorem parse?_accumulator_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    term.subterm? (accumulatorAddress view) = some view.accumulator := by
  rcases parse?_sound h with
    ⟨haltField, dispatcher, response, seedAudit, continuationAudit,
      histories, haltShape, routeShape, actionShape, sourceEq⟩
  rw [sourceEq]
  unfold accumulatorAddress dispatcherAddress
  rw [CarrierDecoder.subterm?_append]
  have dispatcherSubterm :
      (CheckpointDecoder.openShell haltField dispatcher view.seedPayload
        seedAudit view.continuation continuationAudit).subterm?
          [.left, .left, .right] = some dispatcher := by
    simp [CheckpointDecoder.openShell, Term.subterm?]
  rw [dispatcherSubterm]
  change dispatcher.subterm?
      (RootResetReachableStageGrammar.routeResponseAddress view.route ++
        ActionParser.accumulatorAddress
          (ActionParser.historyCount program view.label)) =
    some view.accumulator
  rw [CarrierDecoder.subterm?_append]
  rw [RootResetReachableStageGrammar.routeResponseAddress_subterm routeShape]
  exact actionShape.accumulator_subterm

/-- The registered accumulator is a strict syntactic descendant. -/
theorem parse?_accumulator_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    view.accumulator.size < term.size :=
  CarrierDecoder.subterm_size_lt (parse?_accumulator_subterm h)

/-- The extracted continuation occurs exactly at the literal `RL` address. -/
theorem parse?_continuation_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    term.subterm? continuationAddress = some view.continuation := by
  rcases parse?_sound h with
    ⟨haltField, dispatcher, response, seedAudit, continuationAudit,
      histories, haltShape, routeShape, actionShape, sourceEq⟩
  rw [sourceEq]
  simp [continuationAddress, CheckpointDecoder.openShell, Term.subterm?]

/-- The literal continuation is also a strict syntactic descendant. -/
theorem parse?_continuation_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    view.continuation.size < term.size :=
  CarrierDecoder.subterm_size_lt (parse?_continuation_subterm h)

end PureSFormal.Research.RootResetProgressLocalParser
