import PureSFormal.Research.RootResetStageRegistry

/-!
# Canonical marked-history prefixes for root-reset stage terms

This module isolates a term-only part of the proposed reachable-stage grammar.
It follows only completed Local shells whose public halt marker is `marked`,
always through the literal `RL` continuation child.  The first term that is not
a marked completed Local is the active endpoint.  Consequently the outer
history is complete and marked by construction, while a completed Local at the
active endpoint can only be fresh.

The construction is deliberately independent of a selector role or retained
cursor.  It does not assert that every scheduler contraction has this form.
In particular, the existing persistent-cursor scheduler may retain a fresh
nonempty Local as an outer prefix, and the remaining clock, fuel, dispatcher,
appender, close, and commit productions still require a closure proof for a
root-reset evaluator.

The shallow pending-frame language contains every exact first frame row.  The
bare endpoint classifier below resolves that registered pair by first parsing
the complete environment and word of an exact `R₀` row, and only then falling
back to the generic pending production.  This priority makes the classifier a
function; it does not make the two raw languages disjoint.
-/

namespace PureSFormal.Research.RootResetReachableStageGrammar

open PureSFormal.PureS
open PureSFormal.Research.RootResetProgressRoles

/-! ## Completed marked Local boundaries -/

/-- Accept exactly a completed Local whose literal halt field is marked. -/
def parseMarkedLocal?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (CheckpointDecoder.LocalView program) :=
  match CheckpointDecoder.parseLocal? program tree term with
  | some view =>
      if view.status = .marked then some view else none
  | none => none

/-- A successful marked parse is a successful completed-Local parse. -/
theorem parseMarkedLocal?_toLocal
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (h : parseMarkedLocal? program tree term = some view) :
    CheckpointDecoder.parseLocal? program tree term = some view := by
  unfold parseMarkedLocal? at h
  generalize hlocal : CheckpointDecoder.parseLocal? program tree term = result at h
  cases result with
  | none => contradiction
  | some parsed =>
      by_cases hstatus : parsed.status = .marked
      · simp [hstatus] at h
        subst view
        simp only [hlocal]
      · simp [hstatus] at h

/-- A successful marked parse exposes the literal marked status. -/
theorem parseMarkedLocal?_status
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (h : parseMarkedLocal? program tree term = some view) :
    view.status = .marked := by
  unfold parseMarkedLocal? at h
  generalize hlocal : CheckpointDecoder.parseLocal? program tree term = result at h
  cases result with
  | none => contradiction
  | some parsed =>
      by_cases hstatus : parsed.status = .marked
      · simp [hstatus] at h
        subst view
        exact hstatus
      · simp [hstatus] at h

/-- Every completed marked Local is accepted by the marked parser. -/
theorem parseMarkedLocal?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (hlocal : CheckpointDecoder.parseLocal? program tree term = some view)
    (hstatus : view.status = .marked) :
    parseMarkedLocal? program tree term = some view := by
  simp [parseMarkedLocal?, hlocal, hstatus]

/-- A failed marked parse permits only a fresh completed Local, if any. -/
theorem local_of_parseMarkedLocal?_none_is_fresh
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (hstop : parseMarkedLocal? program tree term = none)
    (hlocal : CheckpointDecoder.parseLocal? program tree term = some view) :
    view.status = .fresh := by
  cases hstatus : view.status with
  | fresh => rfl
  | marked =>
      have accepted := parseMarkedLocal?_complete hlocal hstatus
      rw [hstop] at accepted
      contradiction

/-! ## The literal `RL` continuation context -/

/-- The unique registered continuation context of a completed Local layout. -/
def localContinuationContext : Term → Context
  | .app left (.app _ continuationAudit) =>
      .appRight left (.appLeft .hole continuationAudit)
  | _ => .hole

/-- The registered continuation context rebuilds every parsed completed Local. -/
theorem localContinuationContext_plug
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (h : CheckpointDecoder.parseLocal? program tree term = some view) :
    (localContinuationContext term).plug view.continuation = term := by
  rcases CheckpointDecoder.parseLocal?_sound h with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, dispatch,
      source_eq⟩
  rw [source_eq]
  rfl

/-! ## Declarative marked-prefix grammar -/

/--
A canonical outer history of completed marked Locals ending at the first
non-marked endpoint.  `context` has exactly one hole, at the endpoint reached
by repeated literal `RL` continuation descent.
-/
inductive MarkedPrefix
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → Term → Context → List (CheckpointDecoder.LocalView program) →
      Prop where
  | here
      {term : Term}
      (stop : parseMarkedLocal? program tree term = none) :
      MarkedPrefix program tree term term .hole []
  | local
      {term active : Term} {innerContext : Context}
      {view : CheckpointDecoder.LocalView program}
      {history : List (CheckpointDecoder.LocalView program)}
      (boundary : CheckpointDecoder.parseLocal? program tree term = some view)
      (marked : view.status = .marked)
      (inner : MarkedPrefix program tree view.continuation active innerContext
        history) :
      MarkedPrefix program tree term active
        ((localContinuationContext term).comp innerContext) (view :: history)

/-- Every entry of a completed outer history carries the marked status. -/
inductive MarkedHistory (program : CTS.Program) :
    List (CheckpointDecoder.LocalView program) → Prop where
  | nil : MarkedHistory program []
  | cons
      (view : CheckpointDecoder.LocalView program)
      {history : List (CheckpointDecoder.LocalView program)}
      (marked : view.status = .marked)
      (inner : MarkedHistory program history) :
      MarkedHistory program (view :: history)

namespace MarkedPrefix

/-- Every marked-prefix derivation literally rebuilds its source term. -/
theorem source_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (h : MarkedPrefix program tree term active context history) :
    context.plug active = term := by
  induction h with
  | here stop => rfl
  | «local» boundary marked inner ih =>
      rw [Context.plug_comp, ih]
      exact localContinuationContext_plug boundary

/-- The active endpoint is the first term rejected by the marked parser. -/
theorem active_not_marked
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (h : MarkedPrefix program tree term active context history) :
    parseMarkedLocal? program tree active = none := by
  induction h with
  | here stop => exact stop
  | «local» boundary marked inner ih => exact ih

/-- Every historical Local recorded by the prefix has marked status. -/
theorem historical_views_marked
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (h : MarkedPrefix program tree term active context history) :
    MarkedHistory program history := by
  induction h with
  | here stop => exact .nil
  | «local» boundary marked inner ih => exact .cons _ marked ih

/-- A completed Local at the unique active endpoint is necessarily fresh. -/
theorem active_local_is_fresh
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (h : MarkedPrefix program tree term active context history)
    {view : CheckpointDecoder.LocalView program}
    (hlocal : CheckpointDecoder.parseLocal? program tree active = some view) :
    view.status = .fresh :=
  local_of_parseMarkedLocal?_none_is_fresh h.active_not_marked hlocal

end MarkedPrefix

/-! ## Executable canonical decomposition -/

/-- Data returned by the total marked-prefix traversal. -/
structure Decomposition (program : CTS.Program) where
  active : Term
  context : Context
  history : List (CheckpointDecoder.LocalView program)
  deriving BEq, DecidableEq, Repr

/--
Peel completed marked Local shells from the bare root.  No address, status,
or controller state is supplied to this traversal.
-/
def peelMarked
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Decomposition program :=
  match _hmarked : parseMarkedLocal? program tree term with
  | none => ⟨term, .hole, []⟩
  | some view =>
      let inner := peelMarked program tree view.continuation
      ⟨inner.active, (localContinuationContext term).comp inner.context,
        view :: inner.history⟩
termination_by term.size
decreasing_by
  apply CheckpointDecoder.parseLocal?_continuation_size_lt
  apply parseMarkedLocal?_toLocal
  assumption

/-- The executable traversal has the declarative marked-prefix grammar. -/
theorem peelMarked_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    MarkedPrefix program tree term (peelMarked program tree term).active
      (peelMarked program tree term).context
      (peelMarked program tree term).history := by
  rw [peelMarked]
  split
  next hstop =>
    exact .here hstop
  next view hmarked =>
    exact .local (parseMarkedLocal?_toLocal hmarked)
      (parseMarkedLocal?_status hmarked)
      (peelMarked_sound program tree view.continuation)
termination_by term.size
decreasing_by
  apply CheckpointDecoder.parseLocal?_continuation_size_lt
  apply parseMarkedLocal?_toLocal
  assumption

/-- Every derivation returns exactly the executable decomposition. -/
theorem markedPrefix_eq_peelMarked
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (h : MarkedPrefix program tree term active context history) :
    active = (peelMarked program tree term).active ∧
      context = (peelMarked program tree term).context ∧
      history = (peelMarked program tree term).history := by
  induction h with
  | here stop =>
      rw [peelMarked]
      split
      next => exact ⟨rfl, rfl, rfl⟩
      next view accepted =>
        rw [stop] at accepted
        contradiction
  | @«local» term active innerContext view history boundary marked inner ih =>
      have accepted : parseMarkedLocal? program tree term = some view :=
        parseMarkedLocal?_complete boundary marked
      rw [peelMarked]
      split
      next rejected =>
        rw [accepted] at rejected
        contradiction
      next found foundAccepted =>
        have foundEq : found = view := by
          exact Option.some.inj (foundAccepted.symm.trans accepted)
        subst found
        exact ⟨ih.1, congrArg (localContinuationContext term).comp ih.2.1,
          congrArg (List.cons view) ih.2.2⟩

/-- The marked-history endpoint, context, and view list are jointly unique. -/
theorem markedPrefix_deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term firstActive secondActive : Term}
    {firstContext secondContext : Context}
    {firstHistory secondHistory :
      List (CheckpointDecoder.LocalView program)}
    (first : MarkedPrefix program tree term firstActive firstContext firstHistory)
    (second : MarkedPrefix program tree term secondActive secondContext
      secondHistory) :
    firstActive = secondActive ∧ firstContext = secondContext ∧
      firstHistory = secondHistory := by
  have hfirst := markedPrefix_eq_peelMarked first
  have hsecond := markedPrefix_eq_peelMarked second
  exact ⟨hfirst.1.trans hsecond.1.symm,
    hfirst.2.1.trans hsecond.2.1.symm,
    hfirst.2.2.trans hsecond.2.2.symm⟩

/-- Every finite bare term has one unique marked-history decomposition. -/
theorem existsUnique_markedPrefixDecomposition
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    ∃ decomposition : Decomposition program,
      MarkedPrefix program tree term decomposition.active decomposition.context
          decomposition.history ∧
        ∀ other : Decomposition program,
          MarkedPrefix program tree term other.active other.context
              other.history →
            other = decomposition := by
  let canonical := peelMarked program tree term
  refine ⟨canonical, peelMarked_sound program tree term, ?_⟩
  intro other hother
  have unique := markedPrefix_deterministic hother
    (peelMarked_sound program tree term)
  rcases other with ⟨otherActive, otherContext, otherHistory⟩
  dsimp only at unique ⊢
  rcases unique with ⟨activeEq, contextEq, historyEq⟩
  subst otherActive
  subst otherContext
  subst otherHistory
  have decomposition_eta : ∀ value : Decomposition program,
      Decomposition.mk value.active value.context value.history = value := by
    intro value
    cases value
    rfl
  exact decomposition_eta canonical

/-- The canonical decomposition literally rebuilds the current bare term. -/
theorem peelMarked_source_eq
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    (peelMarked program tree term).context.plug
        (peelMarked program tree term).active = term :=
  (peelMarked_sound program tree term).source_eq

/-- Every canonical historical view is a marked completed Local view. -/
theorem peelMarked_history_marked
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    MarkedHistory program (peelMarked program tree term).history :=
  (peelMarked_sound program tree term).historical_views_marked

/-- A parsed completed Local at the canonical endpoint is fresh. -/
theorem peelMarked_active_local_is_fresh
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term)
    {view : CheckpointDecoder.LocalView program}
    (hlocal : CheckpointDecoder.parseLocal? program tree
      (peelMarked program tree term).active = some view) :
    view.status = .fresh :=
  (peelMarked_sound program tree term).active_local_is_fresh hlocal

/-! ## Independent Local audit holes -/

/--
Changing either Local audit hole does not change its public parse result.  The
seed payload, continuation, and dispatcher are held fixed, but neither audit
term is compared or traversed.
-/
theorem local_audit_holes_opaque
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (haltField dispatcher seedPayload continuation : Term)
    (firstSeedAudit firstContinuationAudit
      secondSeedAudit secondContinuationAudit : Term) :
    CheckpointDecoder.parseLocal? program tree
        (CheckpointDecoder.openShell haltField dispatcher seedPayload
          firstSeedAudit continuation firstContinuationAudit) =
      CheckpointDecoder.parseLocal? program tree
        (CheckpointDecoder.openShell haltField dispatcher seedPayload
          secondSeedAudit continuation secondContinuationAudit) := by
  simp [CheckpointDecoder.parseLocal?, CheckpointDecoder.openShell]

/-! ## Canonical response address inside an activated route -/

/-- Root-relative address of the selected leaf response along one route. -/
def routeResponseAddress : Dispatcher.Route → Address
  | [] => [.right]
  | .left :: rest => [.right, .left] ++ routeResponseAddress rest
  | .right :: rest => [.right, .right] ++ routeResponseAddress rest

/-- Every activated-route derivation places its response at the computed path. -/
theorem routeResponseAddress_subterm
    {Label : Type} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result : Term}
    (shape : RouteGrammar.ActivatedRoute encode tree route label response result) :
    result.subterm? (routeResponseAddress route) = some response := by
  induction shape with
  | leaf => simp [routeResponseAddress, chosen, Term.subterm?]
  | left outerAudit dormantAudit inner ih =>
      simpa [routeResponseAddress, RouteGrammar.selectedLeft, chosen] using! ih
  | right outerAudit dormantAudit inner ih =>
      simpa [routeResponseAddress, RouteGrammar.selectedRight, chosen] using! ih

/-- A successful detailed parser fixes the selected response occurrence. -/
theorem parseRouteDetailed_response_subterm
    {Label : Type} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {term : Term}
    {parsed : DispatchParser.DetailedRoute Label}
    (h : DispatchParser.parseRouteDetailed encode tree term = some parsed) :
    term.subterm? (routeResponseAddress parsed.route) = some parsed.response :=
  routeResponseAddress_subterm (DispatchParser.parseRouteDetailed_sound h)

/-! ## Exact `R₀` versus generic pending endpoints -/

/-- Bare information recovered from an exact first frame row. -/
structure FrameR0View where
  bits : List Bool
  continuation : Term
  child : Term
  deriving BEq, DecidableEq, Repr

/--
Parse an exact `R₀` row without a supplied bit word.  The fixed action code
is known from the program; the seed word is reconstructed from the term.
-/
def parseFrameR0?
    (actions : Term) : Term → Option FrameR0View
  | .app (.app environment continuation) child =>
      match CheckpointDecoder.parseEnvironment? actions environment with
      | none => none
      | some seedPayload =>
          (CheckpointDecoder.parseWord? seedPayload).map fun bits =>
            ⟨bits, continuation, child⟩
  | _ => none

@[simp]
theorem parseFrameR0?_generated
    (actions : Term) (bits : List Bool) (continuation child : Term) :
    parseFrameR0? actions
        (frame (environmentCode actions bits) continuation child) =
      some ⟨bits, continuation, child⟩ := by
  have henv : CheckpointDecoder.parseEnvironment? actions
      (environmentCode actions bits) = some (word bits) := by
    simpa only [CheckpointDecoder.openEnvironment_word] using
      CheckpointDecoder.parseEnvironment?_open actions (word bits)
  rw [show frame (environmentCode actions bits) continuation child =
      .app (.app (environmentCode actions bits) continuation) child by rfl]
  simp only [parseFrameR0?]
  rw [henv]
  change
    (CheckpointDecoder.parseWord? (word bits)).map
        (fun foundBits => FrameR0View.mk foundBits continuation child) =
      some ⟨bits, continuation, child⟩
  rw [CheckpointDecoder.parseWord?_word]
  rfl

/-- Every successful bare `R₀` parse reconstructs its exact word and row. -/
theorem parseFrameR0?_sound
    {actions term : Term} {view : FrameR0View}
    (h : parseFrameR0? actions term = some view) :
    term = frame (environmentCode actions view.bits)
      view.continuation view.child := by
  cases term with
  | s => simp [parseFrameR0?] at h
  | app fn child =>
      cases fn with
      | s => simp [parseFrameR0?] at h
      | app environment continuation =>
          simp only [parseFrameR0?] at h
          generalize henv : CheckpointDecoder.parseEnvironment? actions
            environment = environmentResult at h
          cases environmentResult with
          | none => simp at h
          | some seedPayload =>
              change
                (CheckpointDecoder.parseWord? seedPayload).map
                    (fun bits => FrameR0View.mk bits continuation child) =
                  some view at h
              rcases RootResetStageRegistry.optionMap_eq_some h with
                ⟨bits, hword, hview⟩
              rw [← hview]
              rw [CheckpointDecoder.parseEnvironment?_sound henv,
                CheckpointDecoder.parseWord?_sound hword,
                CheckpointDecoder.openEnvironment_word]
              rfl

/-- A successful `R₀` parse locates its canonical child at the right edge. -/
theorem parseFrameR0?_child_subterm
    {actions term : Term} {view : FrameR0View}
    (h : parseFrameR0? actions term = some view) :
    term.subterm? [.right] = some view.child := by
  rw [parseFrameR0?_sound h]
  simp [frame, Term.subterm?]

/-! ## Role-free remaining frame rows -/

/-- Recover the literal word from a fixed-action dispatcher code. -/
def parseDispatcher? (actions : Term) (term : Term) : Option (List Bool) :=
  match CheckpointDecoder.parseEnvironment? actions (.app .s term) with
  | none => none
  | some seedPayload => CheckpointDecoder.parseWord? seedPayload

@[simp]
theorem parseDispatcher?_generated (actions : Term) (bits : List Bool) :
    parseDispatcher? actions (dispatcherCode actions bits) = some bits := by
  unfold parseDispatcher?
  have henv : CheckpointDecoder.parseEnvironment? actions
      (.app .s (dispatcherCode actions bits)) = some (word bits) := by
    simpa only [environmentCode] using
      (show CheckpointDecoder.parseEnvironment? actions
          (environmentCode actions bits) = some (word bits) by
        simpa only [CheckpointDecoder.openEnvironment_word] using
          CheckpointDecoder.parseEnvironment?_open actions (word bits))
  rw [henv]
  exact CheckpointDecoder.parseWord?_word bits

/-- Successful dispatcher parsing reconstructs the exact fixed-action code. -/
theorem parseDispatcher?_sound
    {actions term : Term} {bits : List Bool}
    (h : parseDispatcher? actions term = some bits) :
    term = dispatcherCode actions bits := by
  unfold parseDispatcher? at h
  generalize henv : CheckpointDecoder.parseEnvironment? actions
    (.app .s term) = result at h
  cases result with
  | none => contradiction
  | some seedPayload =>
      have environmentEq := CheckpointDecoder.parseEnvironment?_sound henv
      have seedEq := CheckpointDecoder.parseWord?_sound h
      rw [seedEq, CheckpointDecoder.openEnvironment_word] at environmentEq
      exact Term.app.inj environmentEq |>.2

/-- Bare information recovered from the first residual frame row. -/
structure FrameR1View where
  bits : List Bool
  carrierLeft : Term
  continuation : Term
  carrierRight : Term
  deriving BEq, DecidableEq, Repr

/-- Parse `R₁` without a supplied word, leaving carrier copies independent. -/
def parseFrameR1? (actions : Term) : Term → Option FrameR1View
  | .app (.app dispatcher carrierLeft) (.app continuation carrierRight) =>
      (parseDispatcher? actions dispatcher).map fun bits =>
        ⟨bits, carrierLeft, continuation, carrierRight⟩
  | _ => none

@[simp]
theorem parseFrameR1?_generated
    (actions : Term) (bits : List Bool)
    (carrierLeft continuation carrierRight : Term) :
    parseFrameR1? actions
        (.app (.app (dispatcherCode actions bits) carrierLeft)
          (.app continuation carrierRight)) =
      some ⟨bits, carrierLeft, continuation, carrierRight⟩ := by
  simp [parseFrameR1?]

/-- Every successful bare `R₁` parse reconstructs its exact word and row. -/
theorem parseFrameR1?_sound
    {actions term : Term} {view : FrameR1View}
    (h : parseFrameR1? actions term = some view) :
    term = .app (.app (dispatcherCode actions view.bits) view.carrierLeft)
      (.app view.continuation view.carrierRight) := by
  unfold parseFrameR1? at h
  split at h <;> try contradiction
  next source dispatcher carrierLeft continuation carrierRight =>
    generalize hp : parseDispatcher? actions dispatcher = result at h
    cases result with
    | none => simp at h
    | some bits =>
        have hview : FrameR1View.mk bits carrierLeft continuation carrierRight =
            view := Option.some.inj (by simpa using h)
        subst view
        rw [parseDispatcher?_sound hp]

/-- A successful `R₁` parse locates its canonical left carrier. -/
theorem parseFrameR1?_child_subterm
    {actions term : Term} {view : FrameR1View}
    (h : parseFrameR1? actions term = some view) :
    term.subterm? [.left, .right] = some view.carrierLeft := by
  rw [parseFrameR1?_sound h]
  simp [Term.subterm?]

/-- Recover the literal word from a seed code. -/
def parseSeed? : Term → Option (List Bool)
  | .app .s seedPayload => CheckpointDecoder.parseWord? seedPayload
  | _ => none

@[simp]
theorem parseSeed?_generated (bits : List Bool) :
    parseSeed? (seedCode bits) = some bits := by
  exact CheckpointDecoder.parseWord?_word bits

/-- Successful seed parsing reconstructs the exact seed code. -/
theorem parseSeed?_sound {term : Term} {bits : List Bool}
    (h : parseSeed? term = some bits) : term = seedCode bits := by
  cases term with
  | s => simp [parseSeed?] at h
  | app fn seedPayload =>
      cases fn with
      | app _ _ => simp [parseSeed?] at h
      | s =>
          rw [CheckpointDecoder.parseWord?_sound h]
          rfl

/-- Bare information recovered from the second residual frame row. -/
structure FrameR2View where
  bits : List Bool
  carrier0 : Term
  carrier1 : Term
  continuation : Term
  carrier2 : Term
  deriving BEq, DecidableEq, Repr

/-- Parse `R₂` without a supplied word, leaving carrier copies independent. -/
def parseFrameR2? (actions : Term) : Term → Option FrameR2View
  | .app
      (.app (.app action carrier0) (.app seed carrier1))
      (.app continuation carrier2) =>
      if action = actCode actions then
        (parseSeed? seed).map fun bits =>
          ⟨bits, carrier0, carrier1, continuation, carrier2⟩
      else none
  | _ => none

@[simp]
theorem parseFrameR2?_generated
    (actions : Term) (bits : List Bool)
    (carrier0 carrier1 continuation carrier2 : Term) :
    parseFrameR2? actions
        (.app
          (.app (.app (actCode actions) carrier0)
            (.app (seedCode bits) carrier1))
          (.app continuation carrier2)) =
      some ⟨bits, carrier0, carrier1, continuation, carrier2⟩ := by
  simp [parseFrameR2?]

/-- Every successful bare `R₂` parse reconstructs its exact word and row. -/
theorem parseFrameR2?_sound
    {actions term : Term} {view : FrameR2View}
    (h : parseFrameR2? actions term = some view) :
    term = .app
      (.app (.app (actCode actions) view.carrier0)
        (.app (seedCode view.bits) view.carrier1))
      (.app view.continuation view.carrier2) := by
  unfold parseFrameR2? at h
  split at h <;> try contradiction
  next source action carrier0 seed carrier1 continuation carrier2 =>
    split at h
    next haction =>
      generalize hp : parseSeed? seed = result at h
      cases result with
      | none => simp at h
      | some bits =>
          have hview : FrameR2View.mk bits carrier0 carrier1 continuation
              carrier2 = view := Option.some.inj (by simpa using h)
          subst view
          rw [haction, parseSeed?_sound hp]
    next => contradiction

/-- A successful `R₂` parse locates its canonical first carrier. -/
theorem parseFrameR2?_child_subterm
    {actions term : Term} {view : FrameR2View}
    (h : parseFrameR2? actions term = some view) :
    term.subterm? [.left, .left, .right] = some view.carrier0 := by
  rw [parseFrameR2?_sound h]
  simp [Term.subterm?]

/-- The role-free endpoint classifier for the overlapping registered pair. -/
inductive EndpointStage where
  | frameR0
  | frameR1
  | frameR2
  | pendingFrame
  | unregistered
  deriving BEq, DecidableEq, Inhabited, Repr

/-- A deterministic endpoint result with its unique registered child. -/
structure EndpointView where
  stage : EndpointStage
  canonicalChild : Term
  bits : Option (List Bool) := none
  deriving BEq, DecidableEq, Repr

/--
Classify exact `R₀` before the generic pending language.  Terms outside this
registered pair receive the explicit `unregistered` tag.
-/
def classifyEndpoint (actions : Term) (term : Term) : EndpointView :=
  match parseFrameR0? actions term with
  | some view => ⟨.frameR0, view.child, some view.bits⟩
  | none =>
      match parseFrameR1? actions term with
      | some view => ⟨.frameR1, view.carrierLeft, some view.bits⟩
      | none =>
          match parseFrameR2? actions term with
          | some view => ⟨.frameR2, view.carrier0, some view.bits⟩
          | none =>
              match RootResetStageRegistry.parsePending? term with
              | some child => ⟨.pendingFrame, child, none⟩
              | none => ⟨.unregistered, term, none⟩

/-- Every generated exact frame row receives the `R₀` tag and recovered word. -/
@[simp]
theorem classifyEndpoint_frameR0_priority
    (actions : Term) (bits : List Bool) (continuation child : Term) :
    classifyEndpoint actions
        (frame (environmentCode actions bits) continuation child) =
      ⟨.frameR0, child, some bits⟩ := by
  rw [classifyEndpoint, parseFrameR0?_generated]

/-- Every generated first residual row receives `R₁` and its literal word. -/
@[simp]
theorem classifyEndpoint_frameR1
    (actions : Term) (bits : List Bool)
    (carrierLeft continuation carrierRight : Term) :
    classifyEndpoint actions
        (.app (.app (dispatcherCode actions bits) carrierLeft)
          (.app continuation carrierRight)) =
      ⟨.frameR1, carrierLeft, some bits⟩ := by
  have hzero : parseFrameR0? actions
      (.app (.app (dispatcherCode actions bits) carrierLeft)
        (.app continuation carrierRight)) = none := by
    simp [parseFrameR0?, CheckpointDecoder.parseEnvironment?, dispatcherCode]
  rw [classifyEndpoint, hzero, parseFrameR1?_generated]

/-- Every generated second residual row receives `R₂` and its literal word. -/
@[simp]
theorem classifyEndpoint_frameR2
    (actions : Term) (bits : List Bool)
    (carrier0 carrier1 continuation carrier2 : Term) :
    classifyEndpoint actions
        (.app
          (.app (.app (actCode actions) carrier0)
            (.app (seedCode bits) carrier1))
          (.app continuation carrier2)) =
      ⟨.frameR2, carrier0, some bits⟩ := by
  have hzero : parseFrameR0? actions
      (.app
        (.app (.app (actCode actions) carrier0)
          (.app (seedCode bits) carrier1))
        (.app continuation carrier2)) = none := by
    simp [parseFrameR0?, CheckpointDecoder.parseEnvironment?, actCode]
  have hone : parseFrameR1? actions
      (.app
        (.app (.app (actCode actions) carrier0)
          (.app (seedCode bits) carrier1))
        (.app continuation carrier2)) = none := by
    simp [parseFrameR1?, parseDispatcher?,
      CheckpointDecoder.parseEnvironment?, actCode]
  rw [classifyEndpoint, hzero, hone, parseFrameR2?_generated]

/-- The raw pending language still accepts the same exact `R₀` row. -/
theorem raw_pending_frameR0_overlap
    (actions : Term) (bits : List Bool) (continuation child : Term) :
    RootResetStageRegistry.parsePending?
        (frame (environmentCode actions bits) continuation child) = some child ∧
      parseFrameR0? actions
        (frame (environmentCode actions bits) continuation child) =
          some ⟨bits, continuation, child⟩ := by
  exact ⟨
    (RootResetStageRegistry.pendingFrame_frameR0_overlap actions bits
      continuation child).1,
    parseFrameR0?_generated actions bits continuation child⟩

/-- The ordered endpoint classifier fixes one tag and one canonical child. -/
theorem classifyEndpoint_unique
    {actions term : Term} {first second : EndpointView}
    (hfirst : classifyEndpoint actions term = first)
    (hsecond : classifyEndpoint actions term = second) :
    first = second :=
  hfirst.symm.trans hsecond

end PureSFormal.Research.RootResetReachableStageGrammar
