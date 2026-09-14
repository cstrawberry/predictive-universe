import PureSFormal.Research.RootResetPersistentRouteAFuel
import PureSFormal.Research.RootResetResponseSampleParserBridge
import PureSFormal.Research.RootResetSelectedFrontParserAgreement

/-!
# Response-aware bare-term selection

This layer gives the whole dispatcher and whole appender parsers priority over
the Route-A/fuel classifier.  A completed activated route is handled
directly from the marked-prefix decomposition: its response address is
recovered from the route parsed in the bare active shell.  Every proposed
address is checked by `Term.contractAt?` before it is returned.

The dispatcher direction is reconstructed by
`RootResetWholeDispatcherStages.parse?` from the literal history phase and
front bit.  The appender label and position are reconstructed by
`RootResetWholeAppenderStages.parse?`.  Neither is supplied by scheduler
state.
-/

namespace PureSFormal.Research.RootResetPersistentResponseSelector

open PureSFormal.PureS

abbrev Selection := RootResetPersistentRouteAFuel.Selection
abbrev BaseClassification :=
  RootResetPersistentRouteAFuel.HandoffClassification

/-- Which syntax-derived layer supplied the selected address. -/
inductive Origin where
  | freshDispatcher
  | responseCarrier
  | responseBoundary
  | markedHandoff
  | responseAppender
  | dispatcher
  | selectedAction
  | appender
  | activatedRoute
  | base
  | none
  deriving BEq, DecidableEq, Inhabited, Repr

/-- Retain both the response-aware result and the fallback result. -/
structure Classification (program : CTS.Program) where
  origin : Origin
  selected? : Option Selection
  base : BaseClassification program

/-- Check an address and retain its literal contractum. -/
def checkedAt? (term : Term) (address : Address) : Option Selection :=
  RootResetPersistentRouteAFuel.checkedSelection? term (some address)

/--
Response-only descent through completed Local continuations and every shallow
pending-frame child.  Unlike the general Route-A classifier, this traversal
may cross an exact `R₀`: it is used only to look for a verified response
parser below that row, while the ordinary classifier remains the fallback.
-/
def responseDescentContext
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : RootResetPersistentRouteA.ActiveContext program :=
  match markedEq : RootResetReachableStageGrammar.parseMarkedLocal?
      program layout.tree term with
  | some view =>
      RootResetPersistentRouteA.wrapOuter
        (RootResetPersistentRouteA.markedStep term view)
        (responseDescentContext program layout view.continuation)
  | none =>
      match freshEq : RootResetPersistentRouteA.parseFreshNonempty?
          program layout.tree term with
      | some view =>
          RootResetPersistentRouteA.wrapOuter
            (RootResetPersistentRouteA.freshStep term view)
            (responseDescentContext program layout view.continuation)
      | none =>
          match pendingEq : RootResetStageRegistry.parsePending? term with
          | some child =>
              let inner := responseDescentContext program layout child
              ⟨inner.active,
                (RootResetReachableActiveContext.pendingChildContext term).comp
                  inner.context,
                [Direction.right] ++ inner.address,
                RootResetPersistentRouteA.Role.pendingFrameChild :: inner.roles,
                inner.history⟩
          | none => ⟨term, .hole, [], [], []⟩
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parseLocal?_continuation_size_lt
      (RootResetReachableStageGrammar.parseMarkedLocal?_toLocal markedEq)
  · exact RootResetPersistentRouteA.parseFreshNonempty?_continuation_size_lt
      freshEq
  · exact CarrierDecoder.subterm_size_lt
      (RootResetStageRegistry.parsePending?_sound pendingEq).2.2

/-- Compose an already parsed outer context with a response-only descent. -/
def composeActiveContexts
    (outer inner : RootResetPersistentRouteA.ActiveContext program) :
    RootResetPersistentRouteA.ActiveContext program :=
  ⟨inner.active, outer.context.comp inner.context,
    outer.address ++ inner.address, outer.roles ++ inner.roles,
    outer.history ++ inner.history⟩

/-- The maximal term-derived context used by response parsers. -/
def responseOuter
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : RootResetPersistentRouteA.ActiveContext program :=
  let outer := RootResetPersistentRouteAFuel.fuelActiveContext program layout term
  composeActiveContexts outer
    (responseDescentContext program layout outer.active)

/--
Descend through registered outer roles but stop at the first fresh completed
Local, including the nonempty case.  CLOSE and COMMIT act in that Local;
following its continuation would instead expose the next clock or fuel job.
-/
def responseBoundaryOuter
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : RootResetPersistentRouteA.ActiveContext program :=
  match markedEq : RootResetReachableStageGrammar.parseMarkedLocal?
      program layout.tree term with
  | some view =>
      RootResetPersistentRouteA.wrapOuter
        (RootResetPersistentRouteA.markedStep term view)
        (responseBoundaryOuter program layout view.continuation)
  | none =>
      match CheckpointDecoder.parseLocal? program layout.tree term with
      | some _ => ⟨term, .hole, [], [], []⟩
      | none =>
          match pendingEq : RootResetStageRegistry.parsePending? term with
          | some child =>
              let inner := responseBoundaryOuter program layout child
              ⟨inner.active,
                (RootResetReachableActiveContext.pendingChildContext term).comp
                  inner.context,
                [Direction.right] ++ inner.address,
                RootResetPersistentRouteA.Role.pendingFrameChild :: inner.roles,
                inner.history⟩
          | none => ⟨term, .hole, [], [], []⟩
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parseLocal?_continuation_size_lt
      (RootResetReachableStageGrammar.parseMarkedLocal?_toLocal markedEq)
  · exact CarrierDecoder.subterm_size_lt
      (RootResetStageRegistry.parsePending?_sound pendingEq).2.2

/-- Address prefix ending immediately before the deepest syntax-parsed fresh Local. -/
def addressBeforeFresh? : List RootResetPersistentRouteA.Role → Option Address
  | [] => none
  | .freshNonemptyContinuation :: roles =>
      match addressBeforeFresh? roles with
      | some address => some ([.right, .left] ++ address)
      | none => some []
  | .markedContinuation :: roles =>
      (addressBeforeFresh? roles).map fun address =>
        [.right, .left] ++ address
  | .pendingFrameChild :: roles =>
      (addressBeforeFresh? roles).map fun address => .right :: address

/--
Count pending-frame crossings on the same path selected by
`addressBeforeFresh?`.  A deeper fresh Local supersedes an outer one, exactly
as in the address parser; a pending frame is counted only when the selected
fresh response lies below it.
-/
def pendingBeforeFresh? : List RootResetPersistentRouteA.Role → Option Nat
  | [] => none
  | .freshNonemptyContinuation :: roles =>
      match pendingBeforeFresh? roles with
      | some count => some count
      | none => some 0
  | .markedContinuation :: roles => pendingBeforeFresh? roles
  | .pendingFrameChild :: roles => (pendingBeforeFresh? roles).map Nat.succ

/--
Recover the innermost pending-frame root whose active child has just become a
marked completed Local.  The returned prefix stops before that pending-child
edge; it is therefore the registered post-COMMIT handoff redex.
-/
def addressBeforePendingMarked? :
    List RootResetPersistentRouteA.Role → Option Address
  | [] => none
  | .freshNonemptyContinuation :: roles =>
      (addressBeforePendingMarked? roles).map fun address =>
        [.right, .left] ++ address
  | .markedContinuation :: roles =>
      (addressBeforePendingMarked? roles).map fun address =>
        [.right, .left] ++ address
  | .pendingFrameChild :: roles =>
      match addressBeforePendingMarked? roles with
      | some address => some (.right :: address)
      | none =>
          if roles.any (fun role =>
              role == RootResetPersistentRouteA.Role.markedContinuation) then
            some []
          else
            none

/--
Recover the fresh completed response root that the ordinary active-context
walk would otherwise cross on its way into the continuation.
-/
def freshResponseRoot?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option (Address × Term) :=
  let traversal := RootResetPersistentRouteA.activeContext program layout term
  (addressBeforeFresh? traversal.roles).bind fun address =>
    (term.subterm? address).map fun active => (address, active)

/--
Recognize the initial dispatcher call in a fresh Local.  The fixed action code
and the literal seed word are checked; halt, seed-audit, continuation, and all
four copied arguments remain opaque and are never compared.
-/
def parseFreshDispatcherCall?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Term → Bool
  | .app
      (.app
        (.app haltField (.app actionsArgument dispatcherArgument))
        (.app (.app .s seedPayload) _seedAudit))
      (.app _continuation _continuationAudit) =>
      (RootResetWholeDispatcherStages.parseFreshHalt? haltField).isSome &&
        (CheckpointDecoder.parseWord? seedPayload).isSome &&
        decide (actionsArgument = compileActions program tree)
  | _ => false

@[simp]
theorem parseFreshDispatcherCall?_freshLocal
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    parseFreshDispatcherCall? program tree
        (freshLocal (compileActions program tree) bits continuation carrier) =
      true := by
  simp [parseFreshDispatcherCall?, freshLocal, Term.applyArgs,
    RootResetWholeDispatcherStages.parseFreshHalt?, freshHField, seedCode]

/-- Select the fixed dispatcher-call address in a parsed fresh Local. -/
def freshDispatcherSelection?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Selection :=
  let outer := responseOuter program layout term
  if parseFreshDispatcherCall? program layout.tree outer.active then
    checkedAt? term
      (outer.address ++ RootResetWholeDispatcherStages.shellDispatcherAddress)
  else
    none

/-- Find the first deleted cell behind the remaining live suffix of a queue. -/
def deletedFrontBitInSpine? (term : Term) : Option Bool :=
  match parsed : CanonicalStep.parseCell? term with
  | none => none
  | some (.live _ predecessor) => deletedFrontBitInSpine? predecessor
  | some (.tombstone bit _) => some bit
termination_by term.size
decreasing_by
  exact CheckpointDecoder.parsedCell_size_lt parsed rfl

/--
Recover the bit deleted by the immediately preceding C4 contraction.  Base
queues are entered at their literal queue field; completed Local shells are
entered at their literal accumulator; live carrier layers are skipped and the
first tombstone supplies the consumed bit.  No audit payload is compared.
-/
def deletedFrontBit?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option Bool :=
  match baseEq : CheckpointDecoder.parseBase?
      (compileActions program tree) term with
  | some view => deletedFrontBitInSpine? view.queue
  | none =>
      match localEq : CheckpointDecoder.parseLocal? program tree term with
      | some view => deletedFrontBit? program tree view.accumulator
      | none =>
          match cellEq : CanonicalStep.parseCell? term with
          | some (.live _ predecessor) => deletedFrontBit? program tree predecessor
          | some (.tombstone bit _) => some bit
          | none => none
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parseLocal?_accumulator_size_lt localEq
  · exact CheckpointDecoder.parsedCell_size_lt cellEq rfl

/--
Recover the phase of the response acting on a carrier.  A Base starts at phase
zero.  The outermost completed Local is the most recent transition in the
current bounded job, so its successor phase is next; transparent cell layers
are skipped.  Historical jobs lie outside this carrier and are not counted.
-/
def carrierPhase?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (CTS.Phase program) :=
  match baseEq : CheckpointDecoder.parseBase?
      (compileActions program tree) term with
  | some _ => some (CTS.zeroPhase program)
  | none =>
      match localEq : CheckpointDecoder.parseLocal? program tree term with
      | some view => some (CTS.nextPhase program view.label.1)
      | none =>
          match cellEq : CanonicalStep.parseCell? term with
          | some (.live _ predecessor) => carrierPhase? program tree predecessor
          | some (.tombstone _ predecessor) => carrierPhase? program tree predecessor
          | none => none
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parsedCell_size_lt cellEq rfl
  · exact CheckpointDecoder.parsedCell_size_lt cellEq rfl

/-- Literal Base-relative path to the active cell-spine queue. -/
def baseQueueAddress : Address :=
  [.left, .right, .left, .left, .right, .right, .right]

/-- Count tombstones in one complete live/tombstone cell spine. -/
def spineTombstoneCount? (term : Term) : Option Nat :=
  if term = omega then
    some 0
  else
    match parsed : CanonicalStep.parseCell? term with
    | some (.live _ predecessor) => spineTombstoneCount? predecessor
    | some (.tombstone _ predecessor) =>
        (spineTombstoneCount? predecessor).map Nat.succ
    | none => none
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parsedCell_size_lt parsed rfl
  · exact CheckpointDecoder.parsedCell_size_lt parsed rfl

/-- Count completed Local shells along the active carrier path. -/
def carrierLocalCount?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option Nat :=
  match baseEq : CheckpointDecoder.parseBase?
      (compileActions program tree) term with
  | some _ => some 0
  | none =>
      match localEq : CheckpointDecoder.parseLocal? program tree term with
      | some view =>
          (carrierLocalCount? program tree view.accumulator).map Nat.succ
      | none =>
          match cellEq : CanonicalStep.parseCell? term with
          | some (.live _ predecessor) =>
              carrierLocalCount? program tree predecessor
          | some (.tombstone _ predecessor) =>
              carrierLocalCount? program tree predecessor
          | none => none
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parseLocal?_accumulator_size_lt localEq
  · exact CheckpointDecoder.parsedCell_size_lt cellEq rfl
  · exact CheckpointDecoder.parsedCell_size_lt cellEq rfl

/-- Count deleted cells along the same active carrier path. -/
def carrierTombstoneCount?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option Nat :=
  match baseEq : CheckpointDecoder.parseBase?
      (compileActions program tree) term with
  | some view => spineTombstoneCount? view.queue
  | none =>
      match localEq : CheckpointDecoder.parseLocal? program tree term with
      | some view => carrierTombstoneCount? program tree view.accumulator
      | none =>
          match cellEq : CanonicalStep.parseCell? term with
          | some (.live _ predecessor) =>
              carrierTombstoneCount? program tree predecessor
          | some (.tombstone _ predecessor) =>
              (carrierTombstoneCount? program tree predecessor).map Nat.succ
          | none => none
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parseLocal?_accumulator_size_lt localEq
  · exact CheckpointDecoder.parsedCell_size_lt cellEq rfl
  · exact CheckpointDecoder.parsedCell_size_lt cellEq rfl

/--
Recover the response bit from the literal carrier chronology.  A normal
response has just added one tombstone beyond the completed-Local count, so
the newest tombstone supplies its deleted front bit.  An already marked
carrier records entry into absorbing empty mode and supplies the canonical
`false` sentinel directly.  Before the first mark, equal counts together with
an empty literal decode identify the empty Base boundary without consulting
scheduler state.
-/
def carrierResponseBit?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option Bool :=
  let chronological :=
    match carrierLocalCount? program tree term,
        carrierTombstoneCount? program tree term,
        CheckpointDecoder.decodeCarrier? program tree term with
    | some localCount, some tombstoneCount, some [] =>
        if localCount = tombstoneCount then some false
        else deletedFrontBit? program tree term
    | _, _, _ => deletedFrontBit? program tree term
  match CheckpointDecoder.parseLocal? program tree term with
  | some view =>
      match view.status with
      | .marked => some false
      | .fresh => chronological
  | none => chronological

/-- Address of the logical front live cell in a complete cell spine. -/
def spineFirstLiveAddress? (term : Term) : Option Address :=
  if term = omega then
    none
  else
    match parsed : CanonicalStep.parseCell? term with
    | some (.live _ predecessor) =>
        match spineFirstLiveAddress? predecessor with
        | some inner => some (.right :: inner)
        | none => some []
    | some (.tombstone _ predecessor) =>
        (spineFirstLiveAddress? predecessor).map fun inner =>
          [.left, .right] ++ inner
    | none => none
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parsedCell_size_lt parsed rfl
  · exact CheckpointDecoder.parsedCell_size_lt parsed rfl

/-- Root-relative address of the logical front live cell in a public carrier. -/
def carrierFirstLiveAddress?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option Address :=
  match baseEq : CheckpointDecoder.parseBase?
      (compileActions program tree) term with
  | some view =>
      (spineFirstLiveAddress? view.queue).map fun inner =>
        baseQueueAddress ++ inner
  | none =>
      match localEq : CheckpointDecoder.parseLocal? program tree term with
      | some view =>
          (carrierFirstLiveAddress? program tree view.accumulator).map fun inner =>
            RootResetResponseBoundaryStages.localAccumulatorAddress view ++ inner
      | none =>
          match cellEq : CanonicalStep.parseCell? term with
          | some (.live _ predecessor) =>
              match carrierFirstLiveAddress? program tree predecessor with
              | some inner => some (.right :: inner)
              | none => some []
          | some (.tombstone _ predecessor) =>
              (carrierFirstLiveAddress? program tree predecessor).map fun inner =>
                [.left, .right] ++ inner
          | none => none
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parseLocal?_accumulator_size_lt localEq
  · exact CheckpointDecoder.parsedCell_size_lt cellEq rfl
  · exact CheckpointDecoder.parsedCell_size_lt cellEq rfl

/--
Recover the current control label from the designated carrier occurrence in
the fresh halt field.  The seed word is immutable across the bounded job and
therefore cannot supply either the phase or front bit after the first local
response.  This parser reads one carrier occurrence structurally and never
compares it with an audit copy.
-/
def currentCarrierDispatcherAddress?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Address :=
  let outer := responseOuter program layout term
  match outer.active with
  | .app
      (.app
        (.app haltField dispatcherTerm)
        (.app (.app .s _seedPayload) _seedAudit))
      (.app _continuation _continuationAudit) =>
      match RootResetWholeDispatcherStages.parseFreshHalt? haltField with
      | none => none
      | some carrier =>
          match carrierPhase? program layout.tree carrier,
              carrierResponseBit? program layout.tree carrier with
          | some phase, some frontBit =>
              let route := layout.route (phase, frontBit)
              (RootResetWholeDispatcherStages.parseRouteNode?
                (selectedAction program) layout.tree route
                dispatcherTerm).map fun node =>
                  outer.address ++
                    (RootResetWholeDispatcherStages.shellDispatcherAddress ++
                      (RootResetSelectorContract.contextAddress node.context ++
                        node.localRedexAddress))
          | _, _ => none
  | _ => none

/-- Whole dispatcher rows reconstruct their selected direction from syntax. -/
def dispatcherSelection?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Selection :=
  (currentCarrierDispatcherAddress? program layout term).bind (checkedAt? term)

/--
Recover the completed selected route and its literal action call.  The route
label, current phase, and front bit are all parsed from the bare active
Local; the accumulator remains opaque.
-/
def selectedActionAddress?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Address :=
  let outer := responseOuter program layout term
  match outer.active with
  | .app
      (.app
        (.app haltField dispatcher)
        (.app (.app .s seedPayload) _seedAudit))
      (.app _continuation _continuationAudit) =>
      match RootResetWholeDispatcherStages.parseFreshHalt? haltField with
      | none => none
      | some _haltAudit =>
          match CheckpointDecoder.parseWord? seedPayload with
          | none => none
          | some bits =>
              match DispatchParser.parseRouteDetailed
                  (selectedAction program) layout.tree dispatcher with
              | none => none
              | some route =>
                  match route.response with
                  | .app action _accumulator =>
                      if action = selectedAction program route.label then
                        some (outer.address ++
                          (RootResetWholeDispatcherStages.shellDispatcherAddress ++
                            RootResetReachableStageGrammar.routeResponseAddress
                              route.route))
                      else
                        none
                  | .s => none
  | _ => none

/-- A syntax-recovered selected action is checked before it is returned. -/
def selectedActionSelection?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Selection :=
  (selectedActionAddress? program layout term).bind (checkedAt? term)

/--
Recover a pending-frame handoff or empty-response COMMIT from a completed
fresh Local below the syntax-derived response context.  When a further C4
has emptied the Local's accumulator, its two excess tombstones identify the
pending handoff.  A completed empty response without that further deletion
exposes COMMIT.
-/
def completedResponseAddress?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Address :=
  let outer := responseOuter program layout term
  let endpoint := RootResetWholeStageClassifier.classifyActive
    program layout.tree outer.history outer.active
  if endpoint.stage = .commitReady then
    (CheckpointDecoder.parseLocal? program layout.tree outer.active).bind fun view =>
      match CheckpointDecoder.decodeCarrier? program layout.tree view.accumulator with
      | some [] =>
          if outer.roles.getLast? =
              some RootResetPersistentRouteA.Role.pendingFrameChild then
            match carrierLocalCount? program layout.tree view.accumulator,
                carrierTombstoneCount? program layout.tree view.accumulator with
            | some localCount, some tombstoneCount =>
                if tombstoneCount = localCount + 2 then
                  some outer.address.dropLast
                else
                  some (outer.address ++ [.left, .left, .left])
            | _, _ => some (outer.address ++ [.left, .left, .left])
          else
            some (outer.address ++ [.left, .left, .left])
      | some (_ :: _) =>
          if outer.roles.getLast? =
              some RootResetPersistentRouteA.Role.pendingFrameChild then
            some outer.address.dropLast
          else
            none
      | none => none
  else
    none

def responseBoundaryAddress?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Address :=
  match completedResponseAddress? program layout term with
  | some address => some address
  | none =>
      (freshResponseRoot? program layout term).bind fun response =>
        (RootResetResponseBoundaryStages.parseActive? program layout.tree
            response.2).bind fun view =>
          match view.stage with
          | .completeOpen openAddress =>
              some (response.1 ++
                (RootResetResponseBoundaryStages.localAccumulatorAddress
                  view.localView ++ openAddress))
          | .completeClean =>
              match CheckpointDecoder.decodeCarrier? program layout.tree
                  view.localView.accumulator with
              | some [] => some (response.1 ++ [.left, .left, .left])
              | _ => none

/-- A syntax-recovered response boundary is checked before selection. -/
def responseBoundarySelection?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Selection :=
  (responseBoundaryAddress? program layout term).bind (checkedAt? term)

/-- Select the registered pending-frame handoff after a marked response. -/
def markedHandoffSelection?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Selection :=
  let traversal := RootResetPersistentRouteA.activeContext program layout term
  (addressBeforePendingMarked? traversal.roles).bind (checkedAt? term)

/--
Select the construction-selected live cell inside a completed fresh response,
or the enclosing handoff immediately after that cell has been deleted.  The
two cases are distinguished by literal completed-Local and tombstone counts
in the response accumulator.  This is the empty-appendant counterpart of the
final appender handoff below.
-/
def responseCarrierAddress?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Address :=
  (freshResponseRoot? program layout term).bind fun response =>
    let traversal := RootResetPersistentRouteA.activeContext program layout term
    match pendingBeforeFresh? traversal.roles with
    | some (Nat.succ _) =>
      (CheckpointDecoder.parseLocal? program layout.tree response.2).bind fun view =>
        if PrimitiveLocalResponse.emitted program view.label = [] then
          match carrierLocalCount? program layout.tree view.accumulator,
              carrierTombstoneCount? program layout.tree view.accumulator with
          | some localCount, some tombstoneCount =>
              if tombstoneCount = localCount + 1 then
                (RootResetSelectedFrontParserAgreement.firstLiveAddress?
                  program layout.tree view.accumulator).map
                  fun liveAddress => response.1 ++
                    (RootResetResponseBoundaryStages.localAccumulatorAddress view ++
                      liveAddress)
              else if tombstoneCount = localCount + 2 then
                some response.1.dropLast
              else
                none
          | _, _ => none
        else
          none
    | _ => none

/-- A syntax-recovered completed-response carrier address is checked. -/
def responseCarrierSelection?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Selection :=
  (responseCarrierAddress? program layout term).bind (checkedAt? term)

/-- Address selected inside the innermost fresh completed response appender. -/
def responseAppenderAddress?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Address :=
  (freshResponseRoot? program layout term).bind fun response =>
    (RootResetWholeAppenderStages.parseActive? program layout.tree
        response.2).bind fun view =>
      match view.row with
      | .secondFinal _position _bit accumulator _currentHistory _histories =>
          if response.1.isEmpty then
            let outer := responseOuter program layout term
            let base := RootResetPersistentRouteAFuel.classifyHandoff
              program layout term
            match base.route.endpoint with
            | some (.registered (.appender endpoint)) =>
                if endpoint.stage = .secondFinal then
                  some outer.address.dropLast
                else
                  some (response.1 ++ view.focusAddress)
            | _ => some (response.1 ++ view.focusAddress)
          else
            let traversal :=
              RootResetPersistentRouteA.activeContext program layout term
            match pendingBeforeFresh? traversal.roles with
            | some (Nat.succ _) =>
                match carrierLocalCount? program layout.tree accumulator,
                    carrierTombstoneCount? program layout.tree accumulator with
                | some localCount, some tombstoneCount =>
                  if tombstoneCount = localCount + 1 then
                    (carrierFirstLiveAddress? program layout.tree accumulator).map
                      fun liveAddress => response.1 ++
                        (view.focusAddress ++ [.right] ++ liveAddress)
                  else if tombstoneCount = localCount + 2 then
                    some response.1.dropLast
                  else
                    some (response.1 ++ view.focusAddress)
                | _, _ => some (response.1 ++ view.focusAddress)
            | _ => some (response.1 ++ view.focusAddress)
      | _ => some (response.1 ++ view.focusAddress)

/--
Select an appender row inside the innermost fresh completed response rather
than following that response's continuation into the next clock job.
-/
def responseAppenderSelection?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Selection :=
  (responseAppenderAddress? program layout term).bind (checkedAt? term)

/-- Whole nonfinal appender rows reconstruct their action and position. -/
def appenderSelection?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Selection :=
  let outer := responseOuter program layout term
  (RootResetWholeAppenderStages.parseActive? program layout.tree
      outer.active).bind fun view =>
    checkedAt? term (outer.address ++ view.focusAddress)

/--
The response root of a completed activated route.  The route and response
address are parsed from the bare active shell; no phase, bit, or route is an
argument of this function.
-/
def activatedRouteAddress?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Address :=
  let outer := responseOuter program layout term
  let view := RootResetWholeStageClassifier.classify program layout.tree outer.active
  if view.endpoint.stage = .activatedRoute then
    view.endpoint.canonicalChildAddress.map fun address =>
      outer.address ++
        (RootResetSelectorContract.contextAddress view.context ++ address)
  else
    none

/-- A completed activated route selects its literal response redex. -/
def activatedRouteSelection?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Selection :=
  (activatedRouteAddress? program layout term).bind (checkedAt? term)

/--
Total response-aware classification.  Parser priority is dispatcher,
appender, activated-route response, then the existing fuel-aware Route-A
selection.  A parser that recognizes a noncontracting boundary does not mask
the fallback, because priority is assigned only after a verified selection.
-/
def classifyAfterFuel
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) (base : BaseClassification program) : Classification program :=
  match freshDispatcherSelection? program layout term with
  | some selection => ⟨.freshDispatcher, some selection, base⟩
  | none =>
      match responseAppenderSelection? program layout term with
      | some selection => ⟨.responseAppender, some selection, base⟩
      | none =>
          match responseCarrierSelection? program layout term with
          | some selection => ⟨.responseCarrier, some selection, base⟩
          | none =>
              match responseBoundarySelection? program layout term with
              | some selection => ⟨.responseBoundary, some selection, base⟩
              | none =>
                  match markedHandoffSelection? program layout term with
                  | some selection => ⟨.markedHandoff, some selection, base⟩
                  | none =>
                      match dispatcherSelection? program layout term with
                      | some selection => ⟨.dispatcher, some selection, base⟩
                      | none =>
                          match selectedActionSelection? program layout term with
                          | some selection => ⟨.selectedAction, some selection, base⟩
                          | none =>
                              match appenderSelection? program layout term with
                              | some selection => ⟨.appender, some selection, base⟩
                              | none =>
                                  match activatedRouteSelection? program layout term with
                                  | some selection => ⟨.activatedRoute, some selection, base⟩
                                  | none =>
                                      match base.selected? with
                                      | some selection => ⟨.base, some selection, base⟩
                                      | none => ⟨.none, none, base⟩

/--
The ordinary fuel-carrier handoff has priority whenever it parses and returns
a verified selection.  This makes the pre-C4/post-C4 boundary independent of
all response-parser disjointness obligations.  Other terms continue through
the response-aware classifier before the Route-A fallback.
-/
def classify
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Classification program :=
  let base := RootResetPersistentRouteAFuel.classifyHandoff program layout term
  match base.fuel, base.selected? with
  | some _, some selection => ⟨.base, some selection, base⟩
  | _, _ => classifyAfterFuel program layout term base

/-- The selected successor, if any, is a function of the bare current term. -/
def selectStep?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option Term :=
  (classify program layout term).selected?.map (fun selection => selection.target)

/-- Every checked direct address carries its exact contractum. -/
theorem checkedAt?_contracts
    {term : Term} {address : Address} {selection : Selection}
    (selected : checkedAt? term address = some selection) :
    term.contractAt? selection.address = some selection.target := by
  exact RootResetPersistentRouteAFuel.checkedSelection?_sound selected

/-- Every parsed fresh-dispatcher result is its exact contextual contraction. -/
theorem freshDispatcherSelection?_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (selected : freshDispatcherSelection? program layout term = some selection) :
    term.contractAt? selection.address = some selection.target := by
  unfold freshDispatcherSelection? at selected
  dsimp only at selected
  by_cases parsed :
      parseFreshDispatcherCall? program layout.tree
        (responseOuter program layout term).active = true
  · simp [parsed] at selected
    exact checkedAt?_contracts selected
  · simp [parsed] at selected

/-- Every whole-dispatcher result is the exact syntax-selected contraction. -/
theorem dispatcherSelection?_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (selected : dispatcherSelection? program layout term = some selection) :
    term.contractAt? selection.address = some selection.target := by
  unfold dispatcherSelection? at selected
  cases addressEq : currentCarrierDispatcherAddress? program layout term with
  | none => simp [addressEq] at selected
  | some address =>
      apply checkedAt?_contracts
      simpa [addressEq] using selected

/-- Every literal selected-action result is its exact contextual contraction. -/
theorem selectedActionSelection?_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (selected : selectedActionSelection? program layout term = some selection) :
    term.contractAt? selection.address = some selection.target := by
  unfold selectedActionSelection? at selected
  cases addressEq : selectedActionAddress? program layout term with
  | none => simp [addressEq] at selected
  | some address =>
      have checked : checkedAt? term address = some selection := by
        simpa [addressEq] using selected
      exact checkedAt?_contracts checked

/-- Every parsed response-boundary result is its exact contextual contraction. -/
theorem responseBoundarySelection?_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (selected : responseBoundarySelection? program layout term = some selection) :
    term.contractAt? selection.address = some selection.target := by
  unfold responseBoundarySelection? at selected
  cases addressEq : responseBoundaryAddress? program layout term with
  | none => simp [addressEq] at selected
  | some address =>
      have checked : checkedAt? term address = some selection := by
        simpa [addressEq] using selected
      exact checkedAt?_contracts checked

/-- Every marked-response handoff result is its exact contextual contraction. -/
theorem markedHandoffSelection?_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (selected : markedHandoffSelection? program layout term = some selection) :
    term.contractAt? selection.address = some selection.target := by
  unfold markedHandoffSelection? at selected
  dsimp only at selected
  cases addressEq : addressBeforePendingMarked?
      (RootResetPersistentRouteA.activeContext program layout term).roles with
  | none => simp [addressEq] at selected
  | some address =>
      apply checkedAt?_contracts
      simpa [addressEq] using selected

/-- Every completed-response carrier result is its exact contextual contraction. -/
theorem responseCarrierSelection?_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (selected : responseCarrierSelection? program layout term = some selection) :
    term.contractAt? selection.address = some selection.target := by
  unfold responseCarrierSelection? at selected
  cases addressEq : responseCarrierAddress? program layout term with
  | none => simp [addressEq] at selected
  | some address =>
      apply checkedAt?_contracts
      simpa [addressEq] using selected

/-- Every nested response-appender result is its exact contextual contraction. -/
theorem responseAppenderSelection?_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (selected : responseAppenderSelection? program layout term = some selection) :
    term.contractAt? selection.address = some selection.target := by
  unfold responseAppenderSelection? at selected
  cases addressEq : responseAppenderAddress? program layout term with
  | none => simp [addressEq] at selected
  | some address =>
      apply checkedAt?_contracts
      simpa [addressEq] using selected

/-- Every whole-appender result is the exact syntax-selected contraction. -/
theorem appenderSelection?_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (selected : appenderSelection? program layout term = some selection) :
    term.contractAt? selection.address = some selection.target := by
  unfold appenderSelection? at selected
  dsimp only at selected
  generalize parsedEq : RootResetWholeAppenderStages.parseActive? program layout.tree
    (responseOuter program layout term).active = parsed at selected
  cases parsed with
  | none => simp [parsedEq] at selected
  | some view =>
      have checked : checkedAt? term
          ((responseOuter program layout term).address ++ view.focusAddress) =
          some selection := by
        simpa [parsedEq] using selected
      exact checkedAt?_contracts checked

/-- Every activated-route result is the exact parsed response contraction. -/
theorem activatedRouteSelection?_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (selected : activatedRouteSelection? program layout term = some selection) :
    term.contractAt? selection.address = some selection.target := by
  unfold activatedRouteSelection? at selected
  cases addressEq : activatedRouteAddress? program layout term with
  | none => simp [addressEq] at selected
  | some address =>
      have checked : checkedAt? term address = some selection := by
        simpa [addressEq] using selected
      exact checkedAt?_contracts checked

/-- Every post-fuel response result is the literal contraction it records. -/
theorem classifyAfterFuel_selected_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {base : BaseClassification program} {selection : Selection}
    (baseDef :
      base = RootResetPersistentRouteAFuel.classifyHandoff program layout term)
    (selected :
      (classifyAfterFuel program layout term base).selected? = some selection) :
    term.contractAt? selection.address = some selection.target := by
  subst base
  unfold classifyAfterFuel at selected
  generalize freshEq : freshDispatcherSelection? program layout term =
    freshResult at selected
  cases freshResult with
  | some freshSelection =>
      have equal : freshSelection = selection := Option.some.inj selected
      subst freshSelection
      exact freshDispatcherSelection?_contracts freshEq
  | none =>
      generalize responseAppenderEq :
        responseAppenderSelection? program layout term =
          responseAppenderResult at selected
      cases responseAppenderResult with
      | some responseAppenderSelection =>
          have equal : responseAppenderSelection = selection :=
            Option.some.inj selected
          subst responseAppenderSelection
          exact responseAppenderSelection?_contracts responseAppenderEq
      | none =>
          generalize responseCarrierEq :
            responseCarrierSelection? program layout term =
              responseCarrierResult at selected
          cases responseCarrierResult with
          | some responseCarrierSelection =>
              have equal : responseCarrierSelection = selection :=
                Option.some.inj selected
              subst responseCarrierSelection
              exact responseCarrierSelection?_contracts responseCarrierEq
          | none =>
            generalize boundaryEq : responseBoundarySelection? program layout term =
              boundaryResult at selected
            cases boundaryResult with
            | some boundarySelection =>
                have equal : boundarySelection = selection := Option.some.inj selected
                subst boundarySelection
                exact responseBoundarySelection?_contracts boundaryEq
            | none =>
                generalize handoffEq : markedHandoffSelection? program layout term =
                  handoffResult at selected
                cases handoffResult with
                | some handoffSelection =>
                    have equal : handoffSelection = selection := Option.some.inj selected
                    subst handoffSelection
                    exact markedHandoffSelection?_contracts handoffEq
                | none =>
                    generalize dispatcherEq : dispatcherSelection? program layout term =
                      dispatcherResult at selected
                    cases dispatcherResult with
                    | some dispatcherSelection =>
                        have equal : dispatcherSelection = selection := Option.some.inj selected
                        subst dispatcherSelection
                        exact dispatcherSelection?_contracts dispatcherEq
                    | none =>
                        generalize actionEq : selectedActionSelection? program layout term =
                          actionResult at selected
                        cases actionResult with
                        | some actionSelection =>
                            have equal : actionSelection = selection := Option.some.inj selected
                            subst actionSelection
                            exact selectedActionSelection?_contracts actionEq
                        | none =>
                            generalize appenderEq : appenderSelection? program layout term =
                              appenderResult at selected
                            cases appenderResult with
                            | some appenderSelection =>
                                have equal : appenderSelection = selection := Option.some.inj selected
                                subst appenderSelection
                                exact appenderSelection?_contracts appenderEq
                            | none =>
                                generalize activatedEq : activatedRouteSelection? program layout term =
                                  activatedResult at selected
                                cases activatedResult with
                                | some activatedSelection =>
                                    have equal : activatedSelection = selection := Option.some.inj selected
                                    subst activatedSelection
                                    exact activatedRouteSelection?_contracts activatedEq
                                | none =>
                                    generalize baseEq :
                                      (RootResetPersistentRouteAFuel.classifyHandoff
                                        program layout term).selected? =
                                          baseResult at selected
                                    cases baseResult with
                                    | none => simp at selected
                                    | some baseSelection =>
                                        have equal : baseSelection = selection := Option.some.inj selected
                                        subst baseSelection
                                        exact RootResetPersistentRouteAFuel.classifyHandoff_selected_contracts
                                          baseEq

/-- Every response-aware result is the literal contraction it records. -/
theorem classify_selected_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (selected : (classify program layout term).selected? = some selection) :
    term.contractAt? selection.address = some selection.target := by
  unfold classify at selected
  dsimp only at selected
  let base := RootResetPersistentRouteAFuel.classifyHandoff program layout term
  generalize fuelEq : base.fuel = fuelResult at selected
  cases fuelResult with
  | none =>
      exact classifyAfterFuel_selected_contracts rfl selected
  | some fuel =>
      generalize baseEq : base.selected? = baseResult at selected
      cases baseResult with
      | none => exact classifyAfterFuel_selected_contracts rfl selected
      | some baseSelection =>
          have equal : baseSelection = selection := Option.some.inj selected
          subst baseSelection
          exact RootResetPersistentRouteAFuel.classifyHandoff_selected_contracts
            baseEq

/-- Every selected successor is one strict contextual pure-S contraction. -/
theorem selectStep?_sound
    {program : CTS.Program} {layout : ActionDispatcher program}
    {source target : Term}
    (selected : selectStep? program layout source = some target) :
    Step source target := by
  unfold selectStep? at selected
  cases selectionEq : (classify program layout source).selected? with
  | none => simp [selectionEq] at selected
  | some selection =>
      have targetEq : selection.target = target :=
        Option.some.inj (by simpa [selectionEq] using selected)
      subst target
      exact Term.contractAt?_sound (classify_selected_contracts selectionEq)

/-- A verified carrier handoff wins before every response parser. -/
theorem classify_baseFuel_priority
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {fuel : RootResetPersistentFuelCarrier.View}
    {selection : Selection}
    (fuelEq :
      (RootResetPersistentRouteAFuel.classifyHandoff program layout term).fuel =
        some fuel)
    (selected :
      (RootResetPersistentRouteAFuel.classifyHandoff program layout term).selected? =
        some selection) :
    (classify program layout term).origin = .base ∧
      (classify program layout term).selected? = some selection := by
  simp [classify, fuelEq, selected]

/-- The fuel-priority selection gives the exact bare successor equation. -/
theorem selectStep?_eq_some_of_baseFuel
    {program : CTS.Program} {layout : ActionDispatcher program}
    {source target : Term} {fuel : RootResetPersistentFuelCarrier.View}
    {selection : Selection}
    (fuelEq :
      (RootResetPersistentRouteAFuel.classifyHandoff program layout source).fuel =
        some fuel)
    (selected :
      (RootResetPersistentRouteAFuel.classifyHandoff program layout source).selected? =
        some selection)
    (targetEq : selection.target = target) :
    selectStep? program layout source = some target := by
  have priority := (classify_baseFuel_priority fuelEq selected).2
  unfold selectStep?
  rw [priority]
  simp [targetEq]

/-- Dispatcher success has strict priority and records its origin. -/
theorem classify_dispatcher_priority
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (freshNone : freshDispatcherSelection? program layout term = none)
    (boundaryNone : responseBoundarySelection? program layout term = none)
    (responseAppenderNone : responseAppenderSelection? program layout term = none)
    (responseCarrierNone : responseCarrierSelection? program layout term = none)
    (markedHandoffNone : markedHandoffSelection? program layout term = none)
    (baseFuelNone :
      (RootResetPersistentRouteAFuel.classifyHandoff program layout term).fuel = none)
    (selected : dispatcherSelection? program layout term = some selection) :
    (classify program layout term).origin = .dispatcher ∧
      (classify program layout term).selected? = some selection := by
  simp [classify, classifyAfterFuel, baseFuelNone, freshNone, boundaryNone,
    responseAppenderNone, responseCarrierNone, markedHandoffNone, selected]

/-- Appender success has priority whenever no whole dispatcher row is present. -/
theorem classify_appender_priority
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (dispatcherNone : dispatcherSelection? program layout term = none)
    (freshNone : freshDispatcherSelection? program layout term = none)
    (boundaryNone : responseBoundarySelection? program layout term = none)
    (responseAppenderNone : responseAppenderSelection? program layout term = none)
    (responseCarrierNone : responseCarrierSelection? program layout term = none)
    (markedHandoffNone : markedHandoffSelection? program layout term = none)
    (baseFuelNone :
      (RootResetPersistentRouteAFuel.classifyHandoff program layout term).fuel = none)
    (actionNone : selectedActionSelection? program layout term = none)
    (selected : appenderSelection? program layout term = some selection) :
    (classify program layout term).origin = .appender ∧
      (classify program layout term).selected? = some selection := by
  simp [classify, classifyAfterFuel, baseFuelNone, freshNone, boundaryNone,
    responseAppenderNone, responseCarrierNone, markedHandoffNone,
    dispatcherNone, actionNone,
    selected]

/-- Activated-route success is used after dispatcher and appender rejection. -/
theorem classify_activatedRoute_priority
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (dispatcherNone : dispatcherSelection? program layout term = none)
    (actionNone : selectedActionSelection? program layout term = none)
    (appenderNone : appenderSelection? program layout term = none)
    (freshNone : freshDispatcherSelection? program layout term = none)
    (boundaryNone : responseBoundarySelection? program layout term = none)
    (responseAppenderNone : responseAppenderSelection? program layout term = none)
    (responseCarrierNone : responseCarrierSelection? program layout term = none)
    (markedHandoffNone : markedHandoffSelection? program layout term = none)
    (baseFuelNone :
      (RootResetPersistentRouteAFuel.classifyHandoff program layout term).fuel = none)
    (selected : activatedRouteSelection? program layout term = some selection) :
    (classify program layout term).origin = .activatedRoute ∧
      (classify program layout term).selected? = some selection := by
  simp [classify, classifyAfterFuel, baseFuelNone, freshNone, boundaryNone,
    responseAppenderNone, responseCarrierNone, markedHandoffNone,
    dispatcherNone, actionNone,
    appenderNone, selected]

end PureSFormal.Research.RootResetPersistentResponseSelector
