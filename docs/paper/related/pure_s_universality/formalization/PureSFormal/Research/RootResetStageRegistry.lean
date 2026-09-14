import PureSFormal.PureS.SchedulerResponseInvariant
import PureSFormal.PureS.CheckpointDecoder
import PureSFormal.Research.RootResetProgressRoles

/-!
# Role-indexed bare-term stage registry

This module registers the scheduler syntax that already has executable
structural parsers.  Its finite stage set covers clock and fuel residuals,
shallow pending frames, the three frame-prefix rows, activated routes,
selected actions, Open and Closed progress cells, fresh completed Locals,
and marked completed-Local handoffs.

The classifier is role-indexed because a shallow pending-frame pattern also
contains the exact first frame row as an instance.  A role is supplied afresh
with the current bare term.  Every result contains its finite stage tag and a
unique canonical child.  Route, action, and completed-Local results also
recover the CTS phase and front bit from syntax.  Audit and history fields are
retained as independent fields and are never compared with one another.
-/

namespace PureSFormal.Research.RootResetStageRegistry

open PureSFormal.PureS
open PureSFormal.Research.RootResetProgressRoles

/-- The finite registered subset of scheduler stages. -/
inductive Stage where
  | clockResidual
  | fuelResidual
  | pendingFrame
  | frameR0
  | frameR1
  | frameR2
  | activatedRoute
  | selectedAction
  | closeReady
  | closeDone
  | commitReady
  | markedHandoff
  deriving BEq, DecidableEq, Inhabited, Repr

/-- The twelve registered stage tags, in classifier order. -/
def stages : List Stage :=
  [.clockResidual, .fuelResidual, .pendingFrame,
    .frameR0, .frameR1, .frameR2,
    .activatedRoute, .selectedAction,
    .closeReady, .closeDone, .commitReady, .markedHandoff]

@[simp]
theorem stages_length : stages.length = 12 := rfl

theorem stages_nodup : stages.Nodup := by decide

theorem mem_stages (stage : Stage) : stage ∈ stages := by
  cases stage <;> simp [stages]

/-- Information shared by every role-specific classifier result. -/
structure View (program : CTS.Program) where
  stage : Stage
  canonicalChild : Term
  phase : Option (CTS.Phase program) := none
  frontBit : Option Bool := none
  independentFields : List Term := []
  deriving BEq, DecidableEq, Repr

/-- The phase/bit information, separated from independent payload fields. -/
structure Header (program : CTS.Program) where
  stage : Stage
  phase : Option (CTS.Phase program)
  frontBit : Option Bool
  deriving BEq, DecidableEq, Repr

def View.header {program : CTS.Program} (view : View program) : Header program :=
  ⟨view.stage, view.phase, view.frontBit⟩

/-- Constructive inversion of `Option.map`, used without quotient principles. -/
theorem optionMap_eq_some
    {α β : Type} {source : Option α} {function : α → β} {result : β}
    (h : source.map function = some result) :
    ∃ value, source = some value ∧ function value = result := by
  cases source with
  | none => cases h
  | some value => exact ⟨value, rfl, Option.some.inj h⟩

/-! ## Unary carrier-code parser -/

/-- Decode exactly the unary carrier-code language `C_n`. -/
def parseC? : Term → Option Nat
  | .s => none
  | .app fn inner =>
      if fn = b then
        (parseC? inner).map Nat.succ
      else if .app fn inner = C 0 then
        some 0
      else
        none
termination_by term => term.size
decreasing_by
  exact Nat.lt_succ_of_le (Nat.le_add_left inner.size fn.size)

@[simp]
theorem parseC?_C : ∀ number, parseC? (C number) = some number
  | 0 => by simp [parseC?, C, b]
  | number + 1 => by simp [parseC?, C, parseC?_C number]

/-- Every successful carrier parse reconstructs the exact code. -/
theorem parseC?_sound : ∀ {term : Term} {number : Nat},
    parseC? term = some number → term = C number
  | .s, number, h => by simp [parseC?] at h
  | .app fn inner, number, h => by
      simp only [parseC?] at h
      split at h
      next hfn =>
        generalize hinner : parseC? inner = parsed at h
        cases parsed with
        | none => simp at h
        | some innerNumber =>
            have hn : innerNumber + 1 = number := by
              simpa using Option.some.inj h
            subst number
            rw [hfn, parseC?_sound hinner]
            rfl
      next _ =>
        split at h
        next hzero =>
          have hn : number = 0 := Option.some.inj h.symm
          subst number
          exact hzero
        next => contradiction

theorem parseC?_eq_some_iff (term : Term) (number : Nat) :
    parseC? term = some number ↔ term = C number :=
  ⟨parseC?_sound, fun h => h ▸ parseC?_C number⟩

/-! ## Clock, fuel, and pending-frame roles -/

structure ClockView where
  stage : Nat
  remaining : Nat
  deriving BEq, DecidableEq, Repr

/-- Parse the exact focus of a positive clock-growth contraction. -/
def parseClockResidual? : Term → Option ClockView
  | .app left right =>
      match parseC? left, parseC? right with
      | some (remaining + 1), some stage => some ⟨stage, remaining⟩
      | _, _ => none
  | .s => none

@[simp]
theorem parseClockResidual?_generated (stage remaining : Nat) :
    parseClockResidual? (.app (C (remaining + 1)) (C stage)) =
      some ⟨stage, remaining⟩ := by
  simp [parseClockResidual?, parseC?_C]

theorem parseClockResidual?_sound
    {term : Term} {view : ClockView}
    (h : parseClockResidual? term = some view) :
    term = .app (C (view.remaining + 1)) (C view.stage) := by
  cases term with
  | s => simp [parseClockResidual?] at h
  | app left right =>
      simp only [parseClockResidual?] at h
      generalize hl : parseC? left = leftResult at h
      generalize hr : parseC? right = rightResult at h
      cases leftResult with
      | none => contradiction
      | some leftNumber =>
          cases leftNumber with
          | zero => contradiction
          | succ remaining =>
              cases rightResult with
              | none => contradiction
              | some stage =>
                  simp only at h
                  have hv : ClockView.mk stage remaining = view :=
                    Option.some.inj h
                  subst view
                  rw [parseC?_sound hl, parseC?_sound hr]

structure FuelView where
  fuel : Nat
  environment : Term
  continuation : Term
  deriving BEq, DecidableEq, Repr

/-- Parse one residual unary fuel call `C_n E B`. -/
def parseFuelResidual? : Term → Option FuelView
  | .app (.app code environment) continuation =>
      (parseC? code).map (fun fuel => ⟨fuel, environment, continuation⟩)
  | _ => none

@[simp]
theorem parseFuelResidual?_generated
    (fuel : Nat) (environment continuation : Term) :
    parseFuelResidual? (.app (.app (C fuel) environment) continuation) =
      some ⟨fuel, environment, continuation⟩ := by
  simp [parseFuelResidual?, parseC?_C]

theorem parseFuelResidual?_sound
    {term : Term} {view : FuelView}
    (h : parseFuelResidual? term = some view) :
    term = .app (.app (C view.fuel) view.environment) view.continuation := by
  cases term with
  | s => simp [parseFuelResidual?] at h
  | app fn continuation =>
      cases fn with
      | s => simp [parseFuelResidual?] at h
      | app code environment =>
          simp only [parseFuelResidual?] at h
          generalize hc : parseC? code = result at h
          cases result with
          | none => contradiction
          | some fuel =>
              have hv : FuelView.mk fuel environment continuation = view :=
                Option.some.inj (by simpa using h)
              subst view
              rw [parseC?_sound hc]

/-- Decompose the shallow independent-hole pending-frame pattern. -/
def parsePending? (term : Term) : Option Term :=
  PendingFrame.guard? term [.right]

@[simp]
theorem parsePending?_pending
    (hole0 hole1 hole2 continuation child : Term) :
    parsePending? (PendingFrame.pending hole0 hole1 hole2 continuation child) =
      some child := by
  exact PendingFrame.guard?_pending hole0 hole1 hole2 continuation child

theorem parsePending?_sound
    {term child : Term}
    (h : parsePending? term = some child) :
    PendingFrame.AtPendingChild term [.right] child :=
  PendingFrame.guard?_sound h

/-! ## Three frame-prefix rows -/

structure FrameR0View where
  continuation : Term
  child : Term
  deriving BEq, DecidableEq, Repr

/-- Parse `R₀ = E B V`, checking only the fixed environment code. -/
def parseFrameR0? (actions : Term) (bits : List Bool) : Term → Option FrameR0View
  | .app (.app environment continuation) child =>
      if environment = environmentCode actions bits then
        some ⟨continuation, child⟩
      else none
  | _ => none

@[simp]
theorem parseFrameR0?_generated
    (actions : Term) (bits : List Bool) (continuation child : Term) :
    parseFrameR0? actions bits
      (frame (environmentCode actions bits) continuation child) =
        some ⟨continuation, child⟩ := by
  simp [parseFrameR0?, frame]

theorem parseFrameR0?_sound
    {actions : Term} {bits : List Bool} {term : Term} {view : FrameR0View}
    (h : parseFrameR0? actions bits term = some view) :
    term = frame (environmentCode actions bits) view.continuation view.child := by
  cases term with
  | s => simp [parseFrameR0?] at h
  | app fn child =>
      cases fn with
      | s => simp [parseFrameR0?] at h
      | app environment continuation =>
          simp only [parseFrameR0?] at h
          split at h
          next henv =>
            have hv : FrameR0View.mk continuation child = view :=
              Option.some.inj h
            subst view
            simp [frame, henv]
          next => contradiction

/-- Every exact first frame row lies in both the shallow pending language and
the exact `R₀` language.  The role tag therefore carries necessary syntactic
context for this registered pair. -/
theorem pendingFrame_frameR0_overlap
    (actions : Term) (bits : List Bool) (continuation child : Term) :
    parsePending? (frame (environmentCode actions bits) continuation child) =
        some child /\
      parseFrameR0? actions bits
          (frame (environmentCode actions bits) continuation child) =
        some ⟨continuation, child⟩ := by
  constructor
  · simpa only [PendingFrame.frame_eq_pending] using
      parsePending?_pending haltCode actions (word bits) continuation child
  · exact parseFrameR0?_generated actions bits continuation child

structure FrameR1View where
  carrierLeft : Term
  continuation : Term
  carrierRight : Term
  deriving BEq, DecidableEq, Repr

/-- Parse the first frame residual with its two carrier copies independent. -/
def parseFrameR1? (actions : Term) (bits : List Bool) : Term → Option FrameR1View
  | .app (.app dispatcher carrierLeft) (.app continuation carrierRight) =>
      if dispatcher = dispatcherCode actions bits then
        some ⟨carrierLeft, continuation, carrierRight⟩
      else none
  | _ => none

@[simp]
theorem parseFrameR1?_independent
    (actions : Term) (bits : List Bool)
    (carrierLeft continuation carrierRight : Term) :
    parseFrameR1? actions bits
      (.app (.app (dispatcherCode actions bits) carrierLeft)
        (.app continuation carrierRight)) =
      some ⟨carrierLeft, continuation, carrierRight⟩ := by
  simp [parseFrameR1?]

theorem parseFrameR1?_sound
    {actions : Term} {bits : List Bool} {term : Term} {view : FrameR1View}
    (h : parseFrameR1? actions bits term = some view) :
    term = .app (.app (dispatcherCode actions bits) view.carrierLeft)
      (.app view.continuation view.carrierRight) := by
  unfold parseFrameR1? at h
  split at h <;> try contradiction
  next source dispatcher carrierLeft continuation carrierRight =>
    split at h
    next hdispatcher =>
      have hv : FrameR1View.mk carrierLeft continuation carrierRight = view :=
        Option.some.inj h
      subst view
      simpa [hdispatcher] using source
    next => contradiction

structure FrameR2View where
  carrier0 : Term
  carrier1 : Term
  continuation : Term
  carrier2 : Term
  deriving BEq, DecidableEq, Repr

/-- Parse the second frame residual with all three carrier copies independent. -/
def parseFrameR2? (actions : Term) (bits : List Bool) : Term → Option FrameR2View
  | .app
      (.app (.app action carrier0) (.app seed carrier1))
      (.app continuation carrier2) =>
      if action = actCode actions then
        if seed = seedCode bits then
          some ⟨carrier0, carrier1, continuation, carrier2⟩
        else none
      else none
  | _ => none

@[simp]
theorem parseFrameR2?_independent
    (actions : Term) (bits : List Bool)
    (carrier0 carrier1 continuation carrier2 : Term) :
    parseFrameR2? actions bits
      (.app
        (.app (.app (actCode actions) carrier0)
          (.app (seedCode bits) carrier1))
        (.app continuation carrier2)) =
      some ⟨carrier0, carrier1, continuation, carrier2⟩ := by
  simp [parseFrameR2?]

theorem parseFrameR2?_sound
    {actions : Term} {bits : List Bool} {term : Term} {view : FrameR2View}
    (h : parseFrameR2? actions bits term = some view) :
    term = .app
      (.app (.app (actCode actions) view.carrier0)
        (.app (seedCode bits) view.carrier1))
      (.app view.continuation view.carrier2) := by
  unfold parseFrameR2? at h
  split at h <;> try contradiction
  next source action carrier0 seed carrier1 continuation carrier2 =>
    split at h
    next haction =>
      split at h
      next hseed =>
        have hv : FrameR2View.mk carrier0 carrier1 continuation carrier2 = view :=
          Option.some.inj h
        subst view
        simpa [haction, hseed] using source
      next => contradiction
    next => contradiction

/-! ## Finite role-indexed classifier -/

/--
Classify one supplied role using the current bare term.  `actionLabel` is used
only at the selected-action role; the activated-route and completed-Local
roles recover their labels from the term itself.
-/
def classifyAt
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (actions : Term) (bits : List Bool) (actionLabel : ActionLabel program) :
    Stage → Term → Option (View program)
  | .clockResidual, term =>
      (parseClockResidual? term).map fun parsed =>
        ⟨.clockResidual, C parsed.stage,
          none, none, [C (parsed.remaining + 1)]⟩
  | .fuelResidual, term =>
      (parseFuelResidual? term).map fun parsed =>
        ⟨.fuelResidual, parsed.continuation,
          none, none, [parsed.environment]⟩
  | .pendingFrame, term =>
      (parsePending? term).map fun parsed =>
        ⟨.pendingFrame, parsed, none, none, []⟩
  | .frameR0, term =>
      (parseFrameR0? actions bits term).map fun parsed =>
        ⟨.frameR0, parsed.child, none, none, [parsed.continuation]⟩
  | .frameR1, term =>
      (parseFrameR1? actions bits term).map fun parsed =>
        ⟨.frameR1, parsed.carrierLeft, none, none,
          [parsed.continuation, parsed.carrierRight]⟩
  | .frameR2, term =>
      (parseFrameR2? actions bits term).map fun parsed =>
        ⟨.frameR2, parsed.carrier0, none, none,
          [parsed.carrier1, parsed.continuation, parsed.carrier2]⟩
  | .activatedRoute, term =>
      (DispatchParser.parseRouteDetailed (selectedAction program) tree term).map
        fun parsed =>
          ⟨.activatedRoute, parsed.response,
            some parsed.label.1, some parsed.label.2, []⟩
  | .selectedAction, term =>
      (ActionParser.parse program actionLabel term).map fun parsed =>
        ⟨.selectedAction, parsed.accumulator,
          some actionLabel.1, some actionLabel.2, parsed.histories⟩
  | .closeReady, term =>
      (parseOpen? term).map fun parsed =>
        ⟨.closeReady, parsed.predecessor, none, some parsed.bit,
          [parsed.audit]⟩
  | .closeDone, term =>
      (parseClosed? term).map fun parsed =>
        ⟨.closeDone, parsed.predecessor, none, some parsed.bit,
          [parsed.leftAudit, parsed.rightAudit]⟩
  | .commitReady, term =>
      match CheckpointDecoder.parseLocal? program tree term with
      | some parsed =>
          if parsed.status = .fresh then
            some ⟨.commitReady, parsed.accumulator,
              some parsed.label.1, some parsed.label.2,
              [parsed.seedPayload, parsed.continuation]⟩
          else none
      | none => none
  | .markedHandoff, term =>
      match CheckpointDecoder.parseLocal? program tree term with
      | some parsed =>
          if parsed.status = .marked then
            some ⟨.markedHandoff, parsed.accumulator,
              some parsed.label.1, some parsed.label.2,
              [parsed.seedPayload, parsed.continuation]⟩
          else none
      | none => none

/-- Every successful role query carries exactly the queried finite tag. -/
theorem classifyAt_stage
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {actions : Term} {bits : List Bool} {actionLabel : ActionLabel program}
    {stage : Stage} {term : Term} {view : View program}
    (h : classifyAt program tree actions bits actionLabel stage term = some view) :
    view.stage = stage := by
  cases stage with
  | clockResidual =>
      rcases optionMap_eq_some h with ⟨parsed, _, hview⟩
      rw [← hview]
  | fuelResidual =>
      rcases optionMap_eq_some h with ⟨parsed, _, hview⟩
      rw [← hview]
  | pendingFrame =>
      rcases optionMap_eq_some h with ⟨parsed, _, hview⟩
      rw [← hview]
  | frameR0 =>
      rcases optionMap_eq_some h with ⟨parsed, _, hview⟩
      rw [← hview]
  | frameR1 =>
      rcases optionMap_eq_some h with ⟨parsed, _, hview⟩
      rw [← hview]
  | frameR2 =>
      rcases optionMap_eq_some h with ⟨parsed, _, hview⟩
      rw [← hview]
  | activatedRoute =>
      rcases optionMap_eq_some h with ⟨parsed, _, hview⟩
      rw [← hview]
  | selectedAction =>
      rcases optionMap_eq_some h with ⟨parsed, _, hview⟩
      rw [← hview]
  | closeReady =>
      rcases optionMap_eq_some h with ⟨parsed, _, hview⟩
      rw [← hview]
  | closeDone =>
      rcases optionMap_eq_some h with ⟨parsed, _, hview⟩
      rw [← hview]
  | commitReady =>
      generalize hp : CheckpointDecoder.parseLocal? program tree term = result
      cases result with
      | none => simp [classifyAt, hp] at h
      | some parsed =>
          by_cases hs : parsed.status = .fresh
          · simp [classifyAt, hp, hs] at h
            rw [← h]
          · simp [classifyAt, hp, hs] at h
  | markedHandoff =>
      generalize hp : CheckpointDecoder.parseLocal? program tree term = result
      cases result with
      | none => simp [classifyAt, hp] at h
      | some parsed =>
          by_cases hs : parsed.status = .marked
          · simp [classifyAt, hp, hs] at h
            rw [← h]
          · simp [classifyAt, hp, hs] at h

/-- A fixed role and bare term have at most one complete classifier result. -/
theorem classifyAt_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {actions : Term} {bits : List Bool} {actionLabel : ActionLabel program}
    {stage : Stage} {term : Term} {first second : View program}
    (hfirst : classifyAt program tree actions bits actionLabel stage term =
      some first)
    (hsecond : classifyAt program tree actions bits actionLabel stage term =
      some second) :
    first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/-- The canonical child is unique at every fixed registered role. -/
theorem classifyAt_canonicalChild_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {actions : Term} {bits : List Bool} {actionLabel : ActionLabel program}
    {stage : Stage} {term : Term} {first second : View program}
    (hfirst : classifyAt program tree actions bits actionLabel stage term =
      some first)
    (hsecond : classifyAt program tree actions bits actionLabel stage term =
      some second) :
    first.canonicalChild = second.canonicalChild :=
  congrArg View.canonicalChild (classifyAt_unique hfirst hsecond)

/-- Distinct registered roles produce distinct tagged results. -/
theorem classified_roles_disjoint
    {program : CTS.Program} {first second : View program}
    (hne : first.stage ≠ second.stage) : first ≠ second := by
  intro h
  exact hne (congrArg View.stage h)

/-- Two distinct role queries have disjoint tagged classifier results. -/
theorem classifyAt_different_roles
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {actions : Term} {bits : List Bool} {actionLabel : ActionLabel program}
    {firstStage secondStage : Stage} {term : Term}
    {first second : View program}
    (hne : firstStage ≠ secondStage)
    (hfirst : classifyAt program tree actions bits actionLabel firstStage term =
      some first)
    (hsecond : classifyAt program tree actions bits actionLabel secondStage term =
      some second) :
    first ≠ second := by
  intro hequal
  apply hne
  calc
    firstStage = first.stage := (classifyAt_stage hfirst).symm
    _ = second.stage := congrArg View.stage hequal
    _ = secondStage := classifyAt_stage hsecond

/-! ## Soundness of the registered subset -/

/-- Declarative syntax accepted at each registered role. -/
def Registered
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (actions : Term) (bits : List Bool) (actionLabel : ActionLabel program) :
    Stage → Term → Prop
  | .clockResidual, term =>
      ∃ stage remaining, term = .app (C (remaining + 1)) (C stage)
  | .fuelResidual, term =>
      ∃ fuel environment continuation,
        term = .app (.app (C fuel) environment) continuation
  | .pendingFrame, term =>
      ∃ child, PendingFrame.AtPendingChild term [.right] child
  | .frameR0, term =>
      ∃ continuation child,
        term = frame (environmentCode actions bits) continuation child
  | .frameR1, term =>
      ∃ carrierLeft continuation carrierRight,
        term = .app (.app (dispatcherCode actions bits) carrierLeft)
          (.app continuation carrierRight)
  | .frameR2, term =>
      ∃ carrier0 carrier1 continuation carrier2,
        term = .app
          (.app (.app (actCode actions) carrier0)
            (.app (seedCode bits) carrier1))
          (.app continuation carrier2)
  | .activatedRoute, term =>
      ∃ route label response,
        RouteGrammar.ActivatedRoute (selectedAction program) tree route label
          response term
  | .selectedAction, term =>
      ∃ accumulator histories,
        ActionParser.ActionShape program actionLabel accumulator histories term
  | .closeReady, term =>
      ∃ bit predecessor audit, term = openCell bit predecessor audit
  | .closeDone, term =>
      ∃ bit predecessor leftAudit rightAudit,
        term = closedCell bit predecessor leftAudit rightAudit
  | .commitReady, term =>
      ∃ parsed, CheckpointDecoder.parseLocal? program tree term = some parsed ∧
        parsed.status = .fresh
  | .markedHandoff, term =>
      ∃ parsed, CheckpointDecoder.parseLocal? program tree term = some parsed ∧
        parsed.status = .marked

/-- Successful classification is sound for every registered role. -/
theorem classifyAt_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {actions : Term} {bits : List Bool} {actionLabel : ActionLabel program}
    {stage : Stage} {term : Term} {view : View program}
    (h : classifyAt program tree actions bits actionLabel stage term = some view) :
    Registered program tree actions bits actionLabel stage term := by
  cases stage with
  | clockResidual =>
      rcases optionMap_eq_some h with ⟨parsed, hp, _⟩
      exact ⟨parsed.stage, parsed.remaining, parseClockResidual?_sound hp⟩
  | fuelResidual =>
      rcases optionMap_eq_some h with ⟨parsed, hp, _⟩
      exact ⟨parsed.fuel, parsed.environment, parsed.continuation,
        parseFuelResidual?_sound hp⟩
  | pendingFrame =>
      rcases optionMap_eq_some h with ⟨parsed, hp, _⟩
      exact ⟨parsed, parsePending?_sound hp⟩
  | frameR0 =>
      rcases optionMap_eq_some h with ⟨parsed, hp, _⟩
      exact ⟨parsed.continuation, parsed.child, parseFrameR0?_sound hp⟩
  | frameR1 =>
      rcases optionMap_eq_some h with ⟨parsed, hp, _⟩
      exact ⟨parsed.carrierLeft, parsed.continuation,
        parsed.carrierRight, parseFrameR1?_sound hp⟩
  | frameR2 =>
      rcases optionMap_eq_some h with ⟨parsed, hp, _⟩
      exact ⟨parsed.carrier0, parsed.carrier1, parsed.continuation,
        parsed.carrier2, parseFrameR2?_sound hp⟩
  | activatedRoute =>
      rcases optionMap_eq_some h with ⟨parsed, hp, _⟩
      exact ⟨parsed.route, parsed.label, parsed.response,
        DispatchParser.parseRouteDetailed_sound hp⟩
  | selectedAction =>
      rcases optionMap_eq_some h with ⟨parsed, hp, _⟩
      exact ⟨parsed.accumulator, parsed.histories, ActionParser.parse_sound hp⟩
  | closeReady =>
      rcases optionMap_eq_some h with ⟨parsed, hp, _⟩
      exact ⟨parsed.bit, parsed.predecessor, parsed.audit, parseOpen?_sound hp⟩
  | closeDone =>
      rcases optionMap_eq_some h with ⟨parsed, hp, _⟩
      exact ⟨parsed.bit, parsed.predecessor, parsed.leftAudit,
        parsed.rightAudit, parseClosed?_sound hp⟩
  | commitReady =>
      generalize hp : CheckpointDecoder.parseLocal? program tree term = result
      cases result with
      | none => simp [classifyAt, hp] at h
      | some parsed =>
          by_cases hs : parsed.status = .fresh
          · exact ⟨parsed, hp, hs⟩
          · simp [classifyAt, hp, hs] at h
  | markedHandoff =>
      generalize hp : CheckpointDecoder.parseLocal? program tree term = result
      cases result with
      | none => simp [classifyAt, hp] at h
      | some parsed =>
          by_cases hs : parsed.status = .marked
          · exact ⟨parsed, hp, hs⟩
          · simp [classifyAt, hp, hs] at h

/-! ## Exact syntax recovery -/

/-- Activated-route classification recovers the route label's phase and bit. -/
theorem classifyAt_route_header
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {actions : Term} {bits : List Bool} {actionLabel : ActionLabel program}
    {term : Term} {view : View program}
    (h : classifyAt program tree actions bits actionLabel .activatedRoute term =
      some view) :
    ∃ route label response,
      DispatchParser.parseRouteDetailed (selectedAction program) tree term =
        some ⟨route, label, response⟩ ∧
      view.phase = some label.1 ∧ view.frontBit = some label.2 ∧
      view.canonicalChild = response := by
  rcases optionMap_eq_some h with ⟨parsed, hp, hview⟩
  rw [← hview]
  exact ⟨parsed.route, parsed.label, parsed.response, hp, rfl, rfl, rfl⟩

/-- Selected-action classification recovers its supplied finite label. -/
theorem classifyAt_action_header
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {actions : Term} {bits : List Bool} {actionLabel : ActionLabel program}
    {term : Term} {view : View program}
    (h : classifyAt program tree actions bits actionLabel .selectedAction term =
      some view) :
    view.phase = some actionLabel.1 ∧
      view.frontBit = some actionLabel.2 := by
  rcases optionMap_eq_some h with ⟨parsed, hp, hview⟩
  rw [← hview]
  exact ⟨rfl, rfl⟩

/-- A fresh completed Local exposes its syntax-derived label and accumulator. -/
theorem classifyAt_commit_header
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {actions : Term} {bits : List Bool} {actionLabel : ActionLabel program}
    {term : Term} {view : View program}
    (h : classifyAt program tree actions bits actionLabel .commitReady term =
      some view) :
    ∃ parsed,
      CheckpointDecoder.parseLocal? program tree term = some parsed ∧
      parsed.status = .fresh ∧
      view.phase = some parsed.label.1 ∧
      view.frontBit = some parsed.label.2 ∧
      view.canonicalChild = parsed.accumulator := by
  generalize hp : CheckpointDecoder.parseLocal? program tree term = result
  cases result with
  | none => simp [classifyAt, hp] at h
  | some parsed =>
      by_cases hs : parsed.status = .fresh
      · simp [classifyAt, hp, hs] at h
        rw [← h]
        exact ⟨parsed, rfl, hs, rfl, rfl, rfl⟩
      · simp [classifyAt, hp, hs] at h

/-- A marked completed Local exposes its syntax-derived label and accumulator. -/
theorem classifyAt_handoff_header
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {actions : Term} {bits : List Bool} {actionLabel : ActionLabel program}
    {term : Term} {view : View program}
    (h : classifyAt program tree actions bits actionLabel .markedHandoff term =
      some view) :
    ∃ parsed,
      CheckpointDecoder.parseLocal? program tree term = some parsed ∧
      parsed.status = .marked ∧
      view.phase = some parsed.label.1 ∧
      view.frontBit = some parsed.label.2 ∧
      view.canonicalChild = parsed.accumulator := by
  generalize hp : CheckpointDecoder.parseLocal? program tree term = result
  cases result with
  | none => simp [classifyAt, hp] at h
  | some parsed =>
      by_cases hs : parsed.status = .marked
      · simp [classifyAt, hp, hs] at h
        rw [← h]
        exact ⟨parsed, rfl, hs, rfl, rfl, rfl⟩
      · simp [classifyAt, hp, hs] at h

/-! ## Independent-field behavior -/

/-- Frame `R₁` accepts arbitrary, mutually independent carrier fields. -/
theorem frameR1_independent_fields
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (actions : Term) (bits : List Bool) (label : ActionLabel program)
    (carrierLeft continuation carrierRight : Term) :
    (classifyAt program tree actions bits label .frameR1
      (.app (.app (dispatcherCode actions bits) carrierLeft)
        (.app continuation carrierRight))).isSome = true := by
  simp [classifyAt, parseFrameR1?]

/-- Frame `R₂` accepts arbitrary, mutually independent carrier fields. -/
theorem frameR2_independent_fields
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (actions : Term) (bits : List Bool) (label : ActionLabel program)
    (carrier0 carrier1 continuation carrier2 : Term) :
    (classifyAt program tree actions bits label .frameR2
      (.app
        (.app (.app (actCode actions) carrier0)
          (.app (seedCode bits) carrier1))
        (.app continuation carrier2))).isSome = true := by
  simp [classifyAt, parseFrameR2?]

/-- Action history contents do not affect the recovered finite header. -/
theorem action_histories_independent
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (actions : Term) (bits : List Bool) (label : ActionLabel program)
    (accumulator : Term) (first second : List Term)
    (hfirst : first.length = ActionParser.historyCount program label)
    (hsecond : second.length = ActionParser.historyCount program label) :
    Option.map View.header
        (classifyAt program tree actions bits label .selectedAction
          (Term.applyArgs (.app p accumulator) first)) =
      Option.map View.header
        (classifyAt program tree actions bits label .selectedAction
          (Term.applyArgs (.app p accumulator) second)) := by
  have firstParse : ActionParser.parse program label
      (Term.applyArgs (.app p accumulator) first) =
        some ⟨accumulator, first⟩ :=
    ActionParser.parse_complete ⟨hfirst, rfl⟩
  have secondParse : ActionParser.parse program label
      (Term.applyArgs (.app p accumulator) second) =
        some ⟨accumulator, second⟩ :=
    ActionParser.parse_complete ⟨hsecond, rfl⟩
  simp [classifyAt, firstParse, secondParse, View.header]

/-- Open-cell audit contents do not affect the recovered finite header. -/
theorem closeReady_audit_independent
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (actions : Term) (bits : List Bool) (label : ActionLabel program)
    (bit : Bool) (predecessor firstAudit secondAudit : Term) :
    Option.map View.header
        (classifyAt program tree actions bits label .closeReady
          (openCell bit predecessor firstAudit)) =
      Option.map View.header
        (classifyAt program tree actions bits label .closeReady
          (openCell bit predecessor secondAudit)) := by
  simp [classifyAt, View.header]

/-- Closed-cell audit contents do not affect the recovered finite header. -/
theorem closeDone_audits_independent
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (actions : Term) (bits : List Bool) (label : ActionLabel program)
    (bit : Bool) (predecessor firstLeft firstRight secondLeft secondRight : Term) :
    Option.map View.header
        (classifyAt program tree actions bits label .closeDone
          (closedCell bit predecessor firstLeft firstRight)) =
      Option.map View.header
        (classifyAt program tree actions bits label .closeDone
          (closedCell bit predecessor secondLeft secondRight)) := by
  simp [classifyAt, View.header]

end PureSFormal.Research.RootResetStageRegistry
