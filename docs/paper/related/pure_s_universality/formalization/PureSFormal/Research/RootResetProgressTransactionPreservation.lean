import PureSFormal.Research.RootResetFullProgressPath
import PureSFormal.Research.RootResetProgressResponse
import PureSFormal.Research.RootResetResponseBoundaryStages

/-!
# Delayed-close transaction preservation

This module proves the semantic ledger for the progress-aware root-reset
protocol.  An Armed front contraction deletes exactly one logical bit and
creates exactly one canonical Open.  Route and action execution retains that
Open while adding only Armed appendant cells.  CLOSE removes the unique Open
without changing the decoded queue, and COMMIT changes only the shallow halt
field.

All statements concern literal pure-`S` terms and executable root-relative
addresses.  Audit and retained-history fields remain independent.
-/

namespace PureSFormal.Research.RootResetProgressTransactionPreservation

open PureSFormal.PureS
open RootResetProgressRoles
open RootResetProgressProgramCode

/-! ## Pure progress spines as registered full paths -/

/-- A progress cell can never be mistaken for a completed Local boundary. -/
@[simp]
theorem parseProgressLocal?_armed_none
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor : Term) :
    RootResetProgressLocalParser.parse? program tree
      (Gadget.source bit predecessor) = none := by
  cases predecessor <;> cases bit <;>
    simp [RootResetProgressLocalParser.parse?, Gadget.source,
      RootResetDeletionGadget.source, RootResetDeletionGadget.progressLive,
      CheckpointDecoder.checkHalt?, live, valueTag, haltCode, b]

/-- Armed cells are disjoint from the higher-priority Base role. -/
@[simp]
theorem parseBase?_armed_none
    (actions : Term) (bit : Bool) (predecessor : Term) :
    CheckpointDecoder.parseBase? actions (Gadget.source bit predecessor) =
      none := by
  cases bit <;>
    simp [CheckpointDecoder.parseBase?, Gadget.source,
      RootResetDeletionGadget.source, RootResetDeletionGadget.progressLive,
      live, b]

/-- An Open cell is not an Armed cell. -/
@[simp]
theorem parseArmed?_open_none
    (bit : Bool) (predecessor audit : Term) :
    RootResetFullProgressPath.parseArmed?
      (openCell bit predecessor audit) = none := by
  simp [RootResetFullProgressPath.parseArmed?, openCell]

/-- A Closed cell is neither Armed nor Open. -/
@[simp]
theorem parseArmed?_closed_none
    (bit : Bool) (predecessor leftAudit rightAudit : Term) :
    RootResetFullProgressPath.parseArmed?
      (closedCell bit predecessor leftAudit rightAudit) =
      none := by
  simp [RootResetFullProgressPath.parseArmed?, closedCell]

@[simp]
theorem parseOpen?_closed_none
    (bit : Bool) (predecessor leftAudit rightAudit : Term) :
    parseOpen? (closedCell bit predecessor leftAudit rightAudit) = none := by
  cases bit <;>
    simp [parseOpen?, closedCell, RootResetDeletionGadget.parseLiveConstructor?,
      live, valueTag, v0, v1, b]

/-- Add one outer Armed role to an already registered progress path. -/
theorem full_armed
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool)
    {predecessor : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {addresses : List Address}
    {endpoint : Address} {roles : List RootResetFullProgressPath.Role}
    (inner : RootResetFullProgressPath.Decodes program tree predecessor bits
      opens front addresses endpoint roles) :
    RootResetFullProgressPath.Decodes program tree
      (Gadget.source bit predecessor) (bits ++ [bit]) opens
      (RootResetFullProgressPath.armedFront front)
      (RootResetFullProgressPath.prefixAddresses [.right] addresses)
      (.right :: endpoint)
      (.armed bit :: roles) :=
  .armed (parseBase?_armed_none _ bit predecessor)
    (parseProgressLocal?_armed_none program tree bit predecessor)
    ⟨bit, predecessor⟩
    (RootResetFullProgressPath.parseArmed?_source bit predecessor) inner

/-- The diagonal Open front over `S` is a registered one-Open path. -/
theorem full_openOmega
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) :
    RootResetFullProgressPath.Decodes program tree
      (openCell bit omega omega) [] 1 none [[.right]]
      [.left, .right] [.opened bit, .endpoint] := by
  have raw := RootResetFullProgressPath.Decodes.opened
    (program := program) (tree := tree)
    (term := openCell bit omega omega)
    (boundary := RootResetProgressRoles.OpenView.mk bit omega omega)
    (by rfl) (by rfl) (by rfl)
    (parseOpen?_openCell bit omega omega)
    (RootResetFullProgressPath.Decodes.endpoint (program := program)
      (tree := tree))
  simpa [RootResetFullProgressPath.prefixAddress?,
    RootResetFullProgressPath.prefixAddresses] using raw

/-- The diagonal Closed front over `S` is a registered clean path. -/
theorem full_closedOmega
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) :
    RootResetFullProgressPath.Decodes program tree
      (closedCell bit omega omega omega) [] 0 none []
      [.left, .right] [.closed bit, .endpoint] := by
  have raw := RootResetFullProgressPath.Decodes.closed
    (program := program) (tree := tree)
    (term := closedCell bit omega omega omega)
    (boundary := RootResetProgressRoles.ClosedView.mk bit omega omega omega)
    (by rfl) (by rfl) (by rfl)
    (parseOpen?_closed_none bit omega omega omega)
    (parseClosed?_closedCell bit omega omega omega)
    (RootResetFullProgressPath.Decodes.endpoint (program := program)
      (tree := tree))
  simpa [RootResetFullProgressPath.prefixAddress?,
    RootResetFullProgressPath.prefixAddresses] using raw

/-- Apply the exact registered Armed-role transformation for a literal suffix. -/
def suffixFront : List Bool → Option Address → Option Address
  | [], front => front
  | _ :: rest, front =>
      suffixFront rest (RootResetFullProgressPath.armedFront front)

def suffixOpenAddresses : List Bool → List Address → List Address
  | [], addresses => addresses
  | _ :: rest, addresses =>
      suffixOpenAddresses rest
        (RootResetFullProgressPath.prefixAddresses [.right] addresses)

def suffixEndpoint : List Bool → Address → Address
  | [], endpoint => endpoint
  | _ :: rest, endpoint => suffixEndpoint rest (.right :: endpoint)

def suffixRoles : List Bool → List RootResetFullProgressPath.Role →
    List RootResetFullProgressPath.Role
  | [], roles => roles
  | bit :: rest, roles => suffixRoles rest (.armed bit :: roles)

theorem full_progressAppenderAccumulator
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (suffix : List Bool)
    {initial : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {addresses : List Address}
    {endpoint : Address} {roles : List RootResetFullProgressPath.Role}
    (inner : RootResetFullProgressPath.Decodes program tree initial bits opens
      front addresses endpoint roles) :
    RootResetFullProgressPath.Decodes program tree
      (progressAppenderAccumulator suffix initial) (bits ++ suffix) opens
      (suffixFront suffix front) (suffixOpenAddresses suffix addresses)
      (suffixEndpoint suffix endpoint) (suffixRoles suffix roles) := by
  induction suffix generalizing initial bits front addresses endpoint roles with
  | nil => simpa [suffixFront, suffixOpenAddresses, suffixEndpoint, suffixRoles]
      using inner
  | cons bit suffix ih =>
      have outer := full_armed program tree bit inner
      have result := ih outer
      simpa [progressAppenderAccumulator_cons, suffixFront,
        suffixOpenAddresses, suffixEndpoint, suffixRoles, List.append_assoc]
        using! result

@[simp]
theorem suffixFront_some (suffix : List Bool) (address : Address) :
    suffixFront suffix (some address) =
      some (List.replicate suffix.length .right ++ address) := by
  induction suffix generalizing address with
  | nil => rfl
  | cons bit suffix ih =>
      simpa [suffixFront, RootResetFullProgressPath.armedFront,
        List.replicate_succ', List.append_assoc] using ih (.right :: address)

@[simp]
theorem suffixFront_some_nil (suffix : List Bool) :
    suffixFront suffix (some []) =
      some (List.replicate suffix.length .right) := by
  simpa using suffixFront_some suffix []

@[simp]
theorem suffixOpenAddresses_single (suffix : List Bool) (address : Address) :
    suffixOpenAddresses suffix [address] =
      [List.replicate suffix.length .right ++ address] := by
  induction suffix generalizing address with
  | nil => rfl
  | cons bit suffix ih =>
      simpa [suffixOpenAddresses, RootResetFullProgressPath.prefixAddresses,
        List.replicate_succ', List.append_assoc] using
        ih (.right :: address)

@[simp]
theorem suffixOpenAddresses_single_right (suffix : List Bool) :
    suffixOpenAddresses suffix [[.right]] =
      [List.replicate suffix.length .right ++ [.right]] :=
  suffixOpenAddresses_single suffix [.right]

@[simp]
theorem suffixOpenAddresses_nil (suffix : List Bool) :
    suffixOpenAddresses suffix [] = [] := by
  induction suffix with
  | nil => rfl
  | cons bit suffix ih =>
      simp [suffixOpenAddresses, RootResetFullProgressPath.prefixAddresses, ih]

/-! ## Canonical delayed-delete words -/

/-- The word after its first Armed cell has opened but before it closes. -/
def openedWord (front : Bool) (tail : List Bool) : Term :=
  progressAppenderAccumulator tail (openCell front omega omega)

/-- The same word after CLOSE. -/
def closedWord (front : Bool) (tail : List Bool) : Term :=
  progressAppenderAccumulator tail (closedCell front omega omega omega)

/-- The exact root-relative address of the front cell in a nonempty word. -/
def frontAddress (tail : List Bool) : Address :=
  List.replicate tail.length .right

/-- Lift one exact contraction through every Armed suffix wrapper. -/
theorem progressAppenderAccumulator_contractAt?
    (suffix : List Bool) {source target : Term} (address : Address)
    (contracts : source.contractAt? address = some target) :
    (progressAppenderAccumulator suffix source).contractAt?
        (List.replicate suffix.length .right ++ address) =
      some (progressAppenderAccumulator suffix target) := by
  induction suffix generalizing source target address with
  | nil => simpa using contracts
  | cons bit suffix ih =>
      rw [progressAppenderAccumulator_cons]
      have lifted :=
        RootResetAccumulatorClassifier.contractAt?_armed_predecessor bit address
        contracts
      have outer := ih (source := progressExtendAccumulator bit source)
        (target := progressExtendAccumulator bit target)
        (.right :: address) lifted
      simpa [frontAddress, List.replicate_succ', List.append_assoc,
        progressExtendAccumulator] using outer

/-- Opening the canonical front is one exact addressed contraction. -/
@[simp]
theorem progressWord_contractAt?_front
    (front : Bool) (tail : List Bool) :
    (progressWord (front :: tail)).contractAt? (frontAddress tail) =
      some (openedWord front tail) := by
  have root := RootResetProgressRoles.contractAt?_source_root front omega
  simpa [progressWord, openedWord, frontAddress,
    progressAppenderAccumulator, progressExtendAccumulator] using
    progressAppenderAccumulator_contractAt? tail [] root

/-- CLOSE at the same nested cell preserves every outer Armed suffix. -/
@[simp]
theorem openedWord_contractAt?_close
    (front : Bool) (tail : List Bool) :
    (openedWord front tail).contractAt?
        (frontAddress tail ++ [.right]) =
      some (closedWord front tail) := by
  have root := RootResetProgressRoles.contractAt?_openCell_right
    front omega omega
  simpa [openedWord, closedWord, frontAddress] using
    progressAppenderAccumulator_contractAt? tail [.right] root

/-- The source, Open, and Closed stages have their exact queue/Open indices. -/
theorem canonical_word_transaction
    (front : Bool) (tail : List Bool) :
    RootResetProgressSpine.Decodes
        (progressWord (front :: tail)) (front :: tail) 0 ∧
      RootResetProgressSpine.Decodes (openedWord front tail) tail 1 ∧
      RootResetProgressSpine.Decodes (closedWord front tail) tail 0 := by
  have source := progressWord_decodes (front :: tail)
  have openRoot : RootResetProgressSpine.Decodes
      (openCell front omega omega) [] 1 :=
    .opened front omega .endpoint
  have closeRoot : RootResetProgressSpine.Decodes
      (closedCell front omega omega omega) [] 0 :=
    .closed front omega omega .endpoint
  exact ⟨source,
    by simpa [openedWord] using
      progressAppenderAccumulator_decodes tail openRoot,
    by simpa [closedWord] using
      progressAppenderAccumulator_decodes tail closeRoot⟩

/-- The dataword after deletion and the selected binary CTS appendant. -/
def postDeletion (program : CTS.Program) (phase : CTS.Phase program)
    (front : Bool) (tail : List Bool) : List Bool :=
  if front then tail ++ program.appendant phase else tail

@[simp]
theorem postDeletion_false (program : CTS.Program)
    (phase : CTS.Phase program) (tail : List Bool) :
    postDeletion program phase false tail = tail :=
  rfl

@[simp]
theorem postDeletion_true (program : CTS.Program)
    (phase : CTS.Phase program) (tail : List Bool) :
    postDeletion program phase true tail = tail ++ program.appendant phase :=
  rfl

/-- The selected action keeps the Open token and adds only Armed cells. -/
@[simp]
theorem progressActionAccumulator_openedWord
    (program : CTS.Program) (phase : CTS.Phase program)
    (front : Bool) (tail : List Bool) :
    progressActionAccumulator program (phase, front) (openedWord front tail) =
      openedWord front (postDeletion program phase front tail) := by
  cases front with
  | false => rfl
  | true =>
      simp [progressActionAccumulator, openedWord, postDeletion,
        progressAppenderAccumulator_append]

/-- The one-Open selected accumulator has the exact post-deletion queue. -/
theorem selectedAccumulator_full_open
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (phase : CTS.Phase program) (front : Bool) (tail : List Bool) :
    ∃ innerFront endpoint roles,
      RootResetFullProgressPath.Decodes program tree
        (progressActionAccumulator program (phase, front)
          (openedWord front tail))
        (postDeletion program phase front tail) 1 innerFront
        [frontAddress (postDeletion program phase front tail) ++ [.right]]
        endpoint roles := by
  let output := postDeletion program phase front tail
  have raw := full_progressAppenderAccumulator program tree output
    (full_openOmega program tree front)
  refine ⟨suffixFront output none,
    suffixEndpoint output [.left, .right],
    suffixRoles output [.opened front, .endpoint], ?_⟩
  rw [progressActionAccumulator_openedWord]
  simpa [openedWord, output, frontAddress] using raw

/-! ## Exact route/action execution and the completed fresh Local -/

/-- Mutating the selected response of a freshly activated canonical route
produces the literal `PrimitiveRoute.withResponse` endpoint. -/
theorem freshRouteResult_reduceResponse
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (carrier : Term)
    {targetResponse : Term} {count : Nat}
    (steps : StepsN count (.app (encode label) carrier) targetResponse) :
    StepsN count
      (RouteExecution.freshRouteResult encode tree route carrier)
      (PrimitiveRoute.withResponse encode tree route carrier targetResponse) := by
  induction path with
  | leaf label =>
      simpa [RouteExecution.freshRouteResult, PrimitiveRoute.withResponse,
        chosen] using StepsN.appRight (.app .s carrier) steps
  | @left route label left right path ih =>
      simpa [RouteExecution.freshRouteResult, PrimitiveRoute.withResponse] using
        RouteExecution.selectedLeft_steps (ih steps) carrier
          (RouteGrammar.compiledCall encode right carrier)
  | @right route label left right path ih =>
      simpa [RouteExecution.freshRouteResult, PrimitiveRoute.withResponse] using
        RouteExecution.selectedRight_steps (ih steps) carrier
          (RouteGrammar.compiledCall encode left carrier)

/-- Route selection and action execution have an exact canonical endpoint. -/
theorem executeCanonicalRouteAction
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label) (carrier : Term) :
    StepsN (RootResetProgressResponse.routeActionCost program route label)
      (RouteGrammar.compiledCall (progressSelectedAction program) tree carrier)
      (PrimitiveRoute.withResponse (progressSelectedAction program) tree route
        carrier (progressActionResult program label carrier)) := by
  have routeSteps := RouteExecution.compiledCall_executeRoute
    (encode := progressSelectedAction program) path carrier
  have responseSteps := freshRouteResult_reduceResponse
    (encode := progressSelectedAction program) path carrier
    (progressExecuteAction program label carrier)
  simpa [RootResetProgressResponse.routeActionCost] using
    StepsN.trans routeSteps responseSteps

/-- Frame construction followed by the exact route/action execution, still
before CLOSE and COMMIT. -/
theorem executeCanonicalResponse
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (seedBits : List Bool) (continuation carrier : Term) :
    StepsN (RootResetProgressResponse.completedCost program route label)
      (frame (progressEnvironmentCode program tree seedBits) continuation carrier)
      (RootResetProgressResponse.completed program tree seedBits continuation
        carrier
        (PrimitiveRoute.withResponse (progressSelectedAction program) tree route
          carrier (progressActionResult program label carrier))) := by
  have frameSteps := progressFramePrefix program tree seedBits continuation carrier
  have routeSteps := executeCanonicalRouteAction program path carrier
  have inDispatcher := StepsN.appRight (freshHField carrier) routeSteps
  have withSeed := StepsN.appLeft inDispatcher
    (.app (progressSeedCode seedBits) carrier)
  have withContinuation := StepsN.appLeft withSeed (.app continuation carrier)
  have localSteps : StepsN
      (RootResetProgressResponse.routeActionCost program route label)
      (progressFreshLocal program tree seedBits continuation carrier)
      (RootResetProgressResponse.completed program tree seedBits continuation
        carrier
        (PrimitiveRoute.withResponse (progressSelectedAction program) tree route
          carrier (progressActionResult program label carrier))) := by
    simpa [progressFreshLocal, RootResetProgressResponse.completed,
      progressSeedCode, RouteGrammar.compiledCall,
      CheckpointDecoder.openShell, Term.applyArgs] using! withContinuation
  simpa [RootResetProgressResponse.completedCost] using
    StepsN.trans frameSteps localSteps

/-- A progress Local boundary is disjoint from the Base parser at `LR`, for
the progress dispatcher code actually used by that Local. -/
theorem parseBase?_none_of_progressLocalShape
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : RootResetProgressLocalParser.View program}
    (localShape : RootResetProgressLocalParser.Shape program tree view term) :
    CheckpointDecoder.parseBase? (progressCompileActions program tree) term =
      none := by
  cases hbase : CheckpointDecoder.parseBase?
      (progressCompileActions program tree) term with
  | none => rfl
  | some baseView =>
      have baseEq := CheckpointDecoder.parseBase?_sound hbase
      rcases localShape with
        ⟨haltField, dispatcher, response, seedAudit, continuationAudit,
          histories, halt, routeShape, actionShape, sourceEq⟩
      have boundaryEq :
          CheckpointDecoder.openBase (progressCompileActions program tree)
              baseView.continuation baseView.queue baseView.seedPayload
                baseView.beta =
            CheckpointDecoder.openShell haltField dispatcher view.seedPayload
              seedAudit view.continuation continuationAudit :=
        baseEq.symm.trans sourceEq
      have childEq := congrArg
        (fun source =>
          (source.subterm? [.left, .right]).map Term.headArity)
        boundaryEq
      simp [CheckpointDecoder.openBase, CheckpointDecoder.openShell,
        CheckpointDecoder.openEnvironment, Term.subterm?] at childEq

/-- The canonical response with an Open predecessor parses as a completed
fresh Local and retains exactly one Open in its selected accumulator. -/
theorem canonicalResponse_full_open
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} (phase : CTS.Phase program) (front : Bool)
    (path : Dispatcher.HasRoute tree route (phase, front))
    (seedBits tail : List Bool) (continuation : Term) :
    ∃ view : RootResetFullProgressPath.View,
      RootResetFullProgressPath.parse? program tree
        (RootResetProgressResponse.completed program tree seedBits continuation
          (openedWord front tail)
          (PrimitiveRoute.withResponse (progressSelectedAction program) tree
            route (openedWord front tail)
            (progressActionResult program (phase, front)
              (openedWord front tail)))) = some view ∧
      view.bits = postDeletion program phase front tail ∧
      view.openCount = 1 := by
  let carrier := openedWord front tail
  let label : ActionLabel program := (phase, front)
  let dispatcher := PrimitiveRoute.withResponse
    (progressSelectedAction program) tree route carrier
    (progressActionResult program label carrier)
  let localView := RootResetProgressLocalParser.freshView program route label
    seedBits continuation carrier
  have localParsed : RootResetProgressLocalParser.parse? program tree
      (RootResetProgressResponse.completed program tree seedBits continuation
        carrier dispatcher) = some localView := by
    simpa [carrier, label, dispatcher, localView,
      RootResetProgressResponse.completed,
      RootResetProgressLocalParser.completedFresh] using
      RootResetProgressLocalParser.parse?_completedFresh program path seedBits
        continuation carrier
  have localShape := RootResetProgressLocalParser.parse?_sound localParsed
  obtain ⟨innerFront, innerEndpoint, innerRoles, innerShape⟩ :=
    selectedAccumulator_full_open program tree phase front tail
  have fullShape := RootResetFullProgressPath.Decodes.local
    (parseBase?_none_of_progressLocalShape localShape) localView localParsed
    innerShape
  let view : RootResetFullProgressPath.View :=
    ⟨postDeletion program phase front tail, 1,
      RootResetFullProgressPath.prefixAddress?
        (RootResetProgressLocalParser.accumulatorAddress localView) innerFront,
      RootResetFullProgressPath.prefixAddresses
        (RootResetProgressLocalParser.accumulatorAddress localView)
        [frontAddress (postDeletion program phase front tail) ++ [.right]],
      RootResetProgressLocalParser.accumulatorAddress localView ++ innerEndpoint,
      .local :: innerRoles⟩
  refine ⟨view, ?_, rfl, rfl⟩
  simpa [view, carrier, dispatcher, label] using
    RootResetFullProgressPath.parse?_complete fullShape

/-- The canonical opening is a genuine step and deletes exactly the front. -/
theorem canonical_opening_semantics
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (front : Bool) (tail : List Bool) :
    ∃ sourceView openView,
      RootResetFullProgressPath.parse? program tree
          (progressWord (front :: tail)) = some sourceView ∧
      sourceView.bits = front :: tail ∧ sourceView.openCount = 0 ∧
      sourceView.frontArmedAddress = some (frontAddress tail) ∧
      (progressWord (front :: tail)).contractAt? sourceView.frontArmedAddress.get! =
        some (openedWord front tail) ∧
      Step (progressWord (front :: tail)) (openedWord front tail) ∧
      RootResetFullProgressPath.parse? program tree
          (openedWord front tail) = some openView ∧
      openView.bits = tail ∧ openView.openCount = 1 := by
  let sourceView : RootResetFullProgressPath.View :=
    ⟨front :: tail, 0, some (frontAddress tail), [],
      suffixEndpoint tail [.right],
      suffixRoles tail [.armed front, .endpoint]⟩
  let openView : RootResetFullProgressPath.View :=
    ⟨tail, 1, suffixFront tail none,
      [frontAddress tail ++ [.right]],
      suffixEndpoint tail [.left, .right],
      suffixRoles tail [.opened front, .endpoint]⟩
  have endpoint : RootResetFullProgressPath.Decodes program tree
      omega [] 0 none [] [] [.endpoint] := .endpoint
  have sourceRoot := full_armed program tree front endpoint
  have sourceShapeRaw :=
    full_progressAppenderAccumulator program tree tail sourceRoot
  have sourceShape : RootResetFullProgressPath.Decodes program tree
      (progressWord (front :: tail)) (front :: tail) 0
      (some (frontAddress tail)) []
      (suffixEndpoint tail [.right])
      (suffixRoles tail [.armed front, .endpoint]) := by
    simpa [progressWord, progressAppenderAccumulator, progressExtendAccumulator,
      RootResetFullProgressPath.armedFront,
      RootResetFullProgressPath.prefixAddresses, frontAddress] using
      sourceShapeRaw
  have openShapeRaw := full_progressAppenderAccumulator program tree tail
    (full_openOmega program tree front)
  have openShape : RootResetFullProgressPath.Decodes program tree
      (openedWord front tail) tail 1 (suffixFront tail none)
      [frontAddress tail ++ [.right]]
      (suffixEndpoint tail [.left, .right])
      (suffixRoles tail [.opened front, .endpoint]) := by
    simpa [openedWord, frontAddress] using openShapeRaw
  have sourceParsed : RootResetFullProgressPath.parse? program tree
      (progressWord (front :: tail)) = some sourceView := by
    simpa [sourceView] using
      RootResetFullProgressPath.parse?_complete sourceShape
  have openParsed : RootResetFullProgressPath.parse? program tree
      (openedWord front tail) = some openView := by
    simpa [openView] using RootResetFullProgressPath.parse?_complete openShape
  refine ⟨sourceView, openView, sourceParsed, rfl, rfl, rfl, ?_, ?_,
    openParsed, rfl, rfl⟩
  · simpa [sourceView] using progressWord_contractAt?_front front tail
  · exact Term.contractAt?_sound (progressWord_contractAt?_front front tail)

end PureSFormal.Research.RootResetProgressTransactionPreservation
