import PureSFormal.Research.RootResetReachableActiveContext
import PureSFormal.Research.RootResetTwentySevenStageRegistry

/-!
# Bare-term active-context reconstruction for persistent route A

This module extends the role-sensitive context grammar with a deterministic
bare-term descent policy.  It gives priority to marked `Local` continuations,
then to fresh `Local` continuations whose accumulator decodes to a nonempty queue,
then to the child of an exact `R₀` frame when that child itself has a
registered stage.  The last test resolves the raw `R₀`/pending overlap by
choosing the deepest registered active endpoint; a plain carrier child stops at
the frame root.

The result is a total parser on every finite term.  Its declarative grammar is
indexed by the roles recovered by the parser, so the reconstructed context,
endpoint term, and accumulated address are unique.  Candidate contraction
addresses are checked with `Term.contractAt?` before they are returned.

This remains a syntax layer.  It does not assert that every persistent-scheduler
sample satisfies the declared reachable grammar or that its selected address
equals the retained cursor address.
-/

namespace PureSFormal.Research.RootResetPersistentRouteA

open PureSFormal.PureS
open RootResetReachableStageGrammar

namespace Registry

abbrev Stage := RootResetTwentySevenStageRegistry.Stage
abbrev View := RootResetTwentySevenStageRegistry.View

end Registry

namespace Response

abbrev Stage := RootResetResponseBoundaryStages.Stage
abbrev View := RootResetResponseBoundaryStages.View

end Response

/-! ## The three term-derived outer roles -/

inductive Role where
  | markedContinuation
  | freshNonemptyContinuation
  | pendingFrameChild
  deriving BEq, DecidableEq, Inhabited, Repr

def Role.address : Role → Address
  | .markedContinuation => [.right, .left]
  | .freshNonemptyContinuation => [.right, .left]
  | .pendingFrameChild => [.right]

/-- Accept a fresh completed `Local` exactly when its accumulator decodes as nonempty. -/
def parseFreshNonempty?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (CheckpointDecoder.LocalView program) :=
  match CheckpointDecoder.parseLocal? program tree term with
  | none => none
  | some view =>
      match view.status with
      | .marked => none
      | .fresh =>
          match CheckpointDecoder.decodeCarrier? program tree view.accumulator with
          | some (_ :: _) => some view
          | _ => none

/-- A fresh-nonempty parse exposes its status, decoded queue, and completed Local parse. -/
theorem parseFreshNonempty?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : parseFreshNonempty? program tree term = some view) :
    ∃ bit bits,
      view.status = .fresh ∧
        CheckpointDecoder.decodeCarrier? program tree view.accumulator =
          some (bit :: bits) ∧
        CheckpointDecoder.parseLocal? program tree term = some view := by
  unfold parseFreshNonempty? at parsed
  generalize localEq :
    CheckpointDecoder.parseLocal? program tree term = result at parsed
  cases result with
  | none => contradiction
  | some found =>
      cases statusEq : found.status with
      | marked => simp [statusEq] at parsed
      | fresh =>
          generalize carrierEq : CheckpointDecoder.decodeCarrier?
            program tree found.accumulator = carrierResult at parsed
          cases carrierResult with
          | none => simp [statusEq, carrierEq] at parsed
          | some queue =>
              cases queueEq : queue with
              | nil => simp [statusEq, carrierEq, queueEq] at parsed
              | cons bit bits =>
                  have foundEq : found = view := by
                    exact Option.some.inj
                      (by simpa [statusEq, carrierEq, queueEq] using parsed)
                  subst found
                  refine ⟨bit, bits, statusEq, ?_, ?_⟩
                  · simpa [queueEq] using carrierEq
                  · rfl

/-- The fresh-nonempty continuation is a strict subterm. -/
theorem parseFreshNonempty?_continuation_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : parseFreshNonempty? program tree term = some view) :
    view.continuation.size < term.size := by
  obtain ⟨bit, bits, status, queue, localParsed⟩ :=
    parseFreshNonempty?_sound parsed
  exact CheckpointDecoder.parseLocal?_continuation_size_lt localParsed

/-- A fresh completed Local with a decoded empty accumulator is not peeled. -/
theorem parseFreshNonempty?_none_of_empty
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (localParsed : CheckpointDecoder.parseLocal? program tree term = some view)
    (fresh : view.status = .fresh)
    (empty : CheckpointDecoder.decodeCarrier? program tree view.accumulator = some []) :
    parseFreshNonempty? program tree term = none := by
  simp [parseFreshNonempty?, localParsed, fresh, empty]

/-- Every parsed completed Local has the literal continuation-context address. -/
theorem localContinuationContext_address_of_parseLocal?
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree term = some view) :
    RootResetSelectorContract.contextAddress (localContinuationContext term) =
      [.right, .left] := by
  rcases CheckpointDecoder.parseLocal?_sound parsed with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, dispatch,
      source⟩
  rw [source]
  rfl

/-! ## A registered child distinguishes a pending parent from an active frame -/

/-- Bare stages which may be the active child of an enclosing pending frame. -/
def nestedEligible : Registry.Stage → Bool
  | .coreAccumulatorClean | .coreAccumulatorClose => false
  | _ => true

structure PendingView (program : CTS.Program) where
  frame : RootResetReachableStageGrammar.FrameR0View
  endpoint : Registry.View program
  deriving Repr

/--
Parse an exact frame as a pending parent only when its right child itself has a
registered non-carrier stage.  The 27-stage parser is run on the child, not on
the overlapping outer frame.
-/
def parsePendingActive?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option (PendingView program) :=
  match RootResetReachableStageGrammar.parseFrameR0?
      (compileActions program layout.tree) term with
  | none => none
  | some frameView =>
      match RootResetTwentySevenStageRegistry.parse? program layout frameView.child with
      | none => none
      | some endpoint =>
          if nestedEligible endpoint.stage then
            some ⟨frameView, endpoint⟩
          else
            none

/-- Pending-active parsing exposes the exact frame and its registered child. -/
theorem parsePendingActive?_sound
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : PendingView program}
    (parsed : parsePendingActive? program layout term = some view) :
    RootResetReachableStageGrammar.parseFrameR0?
          (compileActions program layout.tree) term = some view.frame ∧
      RootResetTwentySevenStageRegistry.parse? program layout view.frame.child =
        some view.endpoint ∧
      nestedEligible view.endpoint.stage = true := by
  unfold parsePendingActive? at parsed
  generalize frameEq : RootResetReachableStageGrammar.parseFrameR0?
    (compileActions program layout.tree) term = frameResult at parsed
  cases frameResult with
  | none => contradiction
  | some frameView =>
      generalize endpointEq : RootResetTwentySevenStageRegistry.parse?
        program layout frameView.child = endpointResult at parsed
      cases endpointResult with
      | none => simp [endpointEq] at parsed
      | some endpoint =>
          cases eligibleEq : nestedEligible endpoint.stage with
          | false => simp [endpointEq, eligibleEq] at parsed
          | true =>
              have viewEq : PendingView.mk frameView endpoint = view := by
                exact Option.some.inj
                  (by simpa [endpointEq, eligibleEq] using parsed)
              rw [← viewEq]
              exact ⟨rfl, endpointEq, eligibleEq⟩

/-! ## One deterministic outer descent -/

structure OuterStep (program : CTS.Program) where
  role : Role
  /-- Completed Local views contributed at this outer layer, in outer-to-inner order. -/
  history : List (CheckpointDecoder.LocalView program)
  child : Term
  context : Context
  address : Address
  deriving BEq, DecidableEq, Repr

def markedStep
    (term : Term) (view : CheckpointDecoder.LocalView program) : OuterStep program :=
  ⟨.markedContinuation, [view], view.continuation,
    localContinuationContext term, [.right, .left]⟩

def freshStep
    (term : Term) (view : CheckpointDecoder.LocalView program) : OuterStep program :=
  ⟨.freshNonemptyContinuation, [view], view.continuation,
    localContinuationContext term, [.right, .left]⟩

def pendingStep (term : Term) (view : PendingView program) : OuterStep program :=
  ⟨.pendingFrameChild, [], view.frame.child,
    RootResetReachableActiveContext.pendingChildContext term, [.right]⟩

/-- Priority order for one syntax-derived descent. -/
def next?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option (OuterStep program) :=
  match parseMarkedLocal? program layout.tree term with
  | some view => some (markedStep term view)
  | none =>
      match parseFreshNonempty? program layout.tree term with
      | some view => some (freshStep term view)
      | none => (parsePendingActive? program layout term).map (pendingStep term)

/-- The exact facts needed to recurse through one returned outer step. -/
structure OuterStep.Valid {program : CTS.Program}
    (source : Term) (step : OuterStep program) : Prop where
  source_eq : step.context.plug step.child = source
  address_eq : RootResetSelectorContract.contextAddress step.context = step.address
  child_size_lt : step.child.size < source.size

/-- Every returned outer step reconstructs the source and enters a strict child. -/
theorem next?_valid
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {step : OuterStep program}
    (parsed : next? program layout term = some step) :
    step.Valid term := by
  unfold next? at parsed
  generalize markedEq : parseMarkedLocal? program layout.tree term = markedResult
    at parsed
  cases markedResult with
  | some markedView =>
      have stepEq : markedStep term markedView = step :=
        Option.some.inj (by simpa using parsed)
      subst step
      refine ⟨localContinuationContext_plug
          (parseMarkedLocal?_toLocal markedEq),
        RootResetReachableActiveContext.markedContinuationContext_address markedEq,
        ?_⟩
      exact CheckpointDecoder.parseLocal?_continuation_size_lt
        (parseMarkedLocal?_toLocal markedEq)
  | none =>
      generalize freshEq : parseFreshNonempty? program layout.tree term = freshResult
        at parsed
      cases freshResult with
      | some freshView =>
          have stepEq : freshStep term freshView = step :=
            Option.some.inj (by simpa using parsed)
          subst step
          obtain ⟨bit, bits, status, queue, localParsed⟩ :=
            parseFreshNonempty?_sound freshEq
          refine ⟨localContinuationContext_plug localParsed,
            localContinuationContext_address_of_parseLocal? localParsed,
            parseFreshNonempty?_continuation_size_lt freshEq⟩
      | none =>
          rcases RootResetStageRegistry.optionMap_eq_some parsed with
            ⟨pendingView, pendingEq, stepEq⟩
          rw [← stepEq]
          have pendingFacts := parsePendingActive?_sound pendingEq
          have frameSource :=
            RootResetReachableStageGrammar.parseFrameR0?_sound pendingFacts.1
          have childLookup :=
            RootResetReachableStageGrammar.parseFrameR0?_child_subterm
              pendingFacts.1
          refine ⟨?_, ?_, CarrierDecoder.subterm_size_lt childLookup⟩
          · rw [frameSource]
            rfl
          · rw [frameSource]
            rfl

/-! ## Maximal bare-term active context -/

structure ActiveContext (program : CTS.Program) where
  active : Term
  context : Context
  address : Address
  roles : List Role
  /-- Completed Local views recovered along `roles`, in outer-to-inner order. -/
  history : List (CheckpointDecoder.LocalView program)
  deriving BEq, DecidableEq, Repr

def wrapOuter (step : OuterStep program) (inner : ActiveContext program) :
    ActiveContext program :=
  ⟨inner.active, step.context.comp inner.context,
    step.address ++ inner.address, step.role :: inner.roles,
    step.history ++ inner.history⟩

/-- Repeatedly follow the priority descent to the deepest registered endpoint. -/
def activeContext
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : ActiveContext program :=
  match _found : next? program layout term with
  | none => ⟨term, .hole, [], [], []⟩
  | some step => wrapOuter step (activeContext program layout step.child)
termination_by term.size
decreasing_by
  exact (next?_valid (by assumption)).child_size_lt

/-- Declarative role-indexed grammar induced by the bare-term priority parser. -/
inductive Describes
    (program : CTS.Program) (layout : ActionDispatcher program) :
    Term → ActiveContext program → Prop where
  | stop {term : Term}
      (stopped : next? program layout term = none) :
      Describes program layout term ⟨term, .hole, [], [], []⟩
  | descend {term : Term} {step : OuterStep program}
      {inner : ActiveContext program}
      (found : next? program layout term = some step)
      (next : Describes program layout step.child inner) :
      Describes program layout term (wrapOuter step inner)

/-- The total parser always supplies its declarative role-indexed grammar. -/
theorem activeContext_sound
    (program : CTS.Program) (layout : ActionDispatcher program) (term : Term) :
    Describes program layout term (activeContext program layout term) := by
  rw [activeContext]
  split
  next stopped => exact .stop stopped
  next step found =>
    exact Describes.descend found
      (activeContext_sound program layout step.child)
termination_by term.size
decreasing_by
  exact (next?_valid (by assumption)).child_size_lt

namespace Describes

theorem source_eq
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : ActiveContext program}
    (shape : Describes program layout term view) :
    view.context.plug view.active = term := by
  induction shape with
  | stop stopped => rfl
  | descend found next ih =>
      simp only [wrapOuter]
      rw [Context.plug_comp, ih]
      exact (next?_valid found).source_eq

theorem contextAddress_eq
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : ActiveContext program}
    (shape : Describes program layout term view) :
    RootResetSelectorContract.contextAddress view.context = view.address := by
  induction shape with
  | stop stopped => rfl
  | descend found next ih =>
      simp only [wrapOuter, RootResetSelectorContract.contextAddress_comp]
      rw [(next?_valid found).address_eq, ih]

theorem active_subterm
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : ActiveContext program}
    (shape : Describes program layout term view) :
    term.subterm? view.address = some view.active := by
  have lookup := RootResetWholeStageClassifier.subterm?_plug_contextAddress_append
    view.context view.active []
  rw [← shape.source_eq, ← shape.contextAddress_eq]
  simpa using lookup

/-- A nonempty recovered role list locates a strict subtree. -/
theorem active_size_lt_of_roles_ne_nil
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : ActiveContext program}
    (shape : Describes program layout term view)
    (nonempty : view.roles ≠ []) :
    view.active.size < term.size := by
  cases shape with
  | stop stopped => exact False.elim (nonempty rfl)
  | descend found next =>
      exact Nat.lt_of_le_of_lt
        (CarrierDecoder.subterm_size_le next.active_subterm)
        (next?_valid found).child_size_lt

end Describes

/-- Every declarative derivation is the total parser's result. -/
theorem describes_eq_activeContext
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : ActiveContext program}
    (shape : Describes program layout term view) :
    view = activeContext program layout term := by
  induction shape with
  | stop stopped =>
      rw [activeContext]
      split
      · rfl
      · rename_i step found
        rw [stopped] at found
        contradiction
  | @descend term outerStep inner found next ih =>
      rw [activeContext]
      split
      · rename_i stopped
        rw [found] at stopped
        contradiction
      · rename_i returned foundAgain
        have stepEq : returned = outerStep := by
          exact Option.some.inj (foundAgain.symm.trans found)
        subst returned
        exact congrArg (wrapOuter outerStep) ih

/-- The role-indexed reachable active context is unique. -/
theorem describes_deterministic
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : ActiveContext program}
    (hfirst : Describes program layout term first)
    (hsecond : Describes program layout term second) :
    first = second :=
  (describes_eq_activeContext hfirst).trans
    (describes_eq_activeContext hsecond).symm

/-! ## Conditional and verified endpoint selection -/

/-- A clean response commits only when its accumulator decodes as the empty queue. -/
def responseCandidate? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : Response.View program) : Option Address :=
  match view.endpoint.stage with
  | .completeOpen _ => view.closeAddress?
  | .completeClean =>
      match CheckpointDecoder.decodeCarrier?
          program tree view.endpoint.localView.accumulator with
      | some [] => some view.commitAddress
      | _ => none

/-- Empty decoded clean responses expose exactly the COMMIT address. -/
theorem responseCandidate?_clean_empty
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {view : Response.View program}
    (clean : view.endpoint.stage = .completeClean)
    (empty : CheckpointDecoder.decodeCarrier?
      program tree view.endpoint.localView.accumulator = some []) :
    responseCandidate? program tree view = some view.commitAddress := by
  simp [responseCandidate?, clean, empty]

/-- A decoded nonempty clean response does not expose COMMIT at its current Local. -/
theorem responseCandidate?_clean_nonempty
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {view : Response.View program} {bit : Bool} {bits : List Bool}
    (clean : view.endpoint.stage = .completeClean)
    (nonempty : CheckpointDecoder.decodeCarrier?
      program tree view.endpoint.localView.accumulator = some (bit :: bits)) :
    responseCandidate? program tree view = none := by
  simp [responseCandidate?, clean, nonempty]

/-- Candidate address at one deepest 27-stage endpoint. -/
def endpointCandidate?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Registry.View program → Option Address
  | .registered (.response view) => responseCandidate? program tree view
  | .registered (.appender view) =>
      match view.stage with
      | .secondFinal =>
          (RootResetResponseBoundaryStages.parse? program tree term).bind
            (responseCandidate? program tree)
      | _ => view.selectedAddress
  | .registered view => view.selectedAddress?
  | .core view =>
      match view.stage with
      | .frameR0 =>
          some (RootResetSelectorContract.contextAddress view.context)
      | .frameR1 =>
          some (RootResetSelectorContract.contextAddress view.context ++ [.left])
      | .frameR2 =>
          some (RootResetSelectorContract.contextAddress view.context ++
            [.left, .left])
      | .activatedRoute => view.currentAddress?
      | .selectedAction | .commitReady =>
          (RootResetResponseBoundaryStages.parse? program tree term).bind
            (responseCandidate? program tree)
      | .accumulatorClose => view.selectedAddress?
      | .pendingFrame | .accumulatorClean => none

/-- Return a candidate only after `contractAt?` verifies an actual redex. -/
def verifiedCandidate? (term : Term) (candidate : Option Address) : Option Address :=
  candidate.bind fun address =>
    (term.contractAt? address).map fun _ => address

theorem verifiedCandidate?_contracts
    {term : Term} {candidate : Option Address} {address : Address}
    (selected : verifiedCandidate? term candidate = some address) :
    ∃ target, term.contractAt? address = some target := by
  unfold verifiedCandidate? at selected
  cases candidate with
  | none => contradiction
  | some proposed =>
      cases contracts : term.contractAt? proposed with
      | none => simp [contracts] at selected
      | some target =>
          have addressEq : proposed = address := by
            exact Option.some.inj (by simpa [contracts] using selected)
          subst address
          exact ⟨target, contracts⟩

structure Classification (program : CTS.Program) where
  outer : ActiveContext program
  endpoint : Option (Registry.View program)
  selectedAddress? : Option Address
  /-- Phase reconstructed from all completed Local labels, outermost first. -/
  recoveredPhase : CTS.Phase program
  deriving Repr

/-- Total bare-term route-A classifier with a verified root-relative selection. -/
def classify
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Classification program :=
  let outer := activeContext program layout term
  let endpoint := RootResetTwentySevenStageRegistry.parse? program layout outer.active
  let relative := endpoint.bind fun view =>
    verifiedCandidate? outer.active
      (endpointCandidate? program layout.tree outer.active view)
  let selected := relative.map fun address => outer.address ++ address
  let phase := RootResetWholeStageClassifier.historyPhase program outer.history
  ⟨outer, endpoint, selected, phase⟩

/-- The classifier's stored phase is exactly the phase read from its Local history. -/
theorem classify_recoveredPhase
    (program : CTS.Program) (layout : ActionDispatcher program) (term : Term) :
    (classify program layout term).recoveredPhase =
      RootResetWholeStageClassifier.historyPhase program
        (classify program layout term).outer.history := by
  rfl

/-- The total classifier reconstructs its source and accumulated active address. -/
theorem classify_source_and_address
    (program : CTS.Program) (layout : ActionDispatcher program) (term : Term) :
    (classify program layout term).outer.context.plug
          (classify program layout term).outer.active = term ∧
      RootResetSelectorContract.contextAddress
          (classify program layout term).outer.context =
        (classify program layout term).outer.address := by
  have shape := activeContext_sound program layout term
  exact ⟨shape.source_eq, shape.contextAddress_eq⟩

/-- Every address returned by the total classifier is an actual contextual S-redex. -/
theorem classify_selected_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {address : Address}
    (selected : (classify program layout term).selectedAddress? = some address) :
    ∃ target, term.contractAt? address = some target := by
  unfold classify at selected
  dsimp only at selected
  let outer := activeContext program layout term
  change
    ((RootResetTwentySevenStageRegistry.parse? program layout outer.active).bind
      (fun endpoint =>
        verifiedCandidate? outer.active
          (endpointCandidate? program layout.tree outer.active endpoint))).map
        (fun relativeAddress => outer.address ++ relativeAddress) =
      some address at selected
  generalize endpointEq : RootResetTwentySevenStageRegistry.parse?
    program layout outer.active = endpointResult at selected
  cases endpointResult with
  | none => simp at selected
  | some endpoint =>
      generalize relativeEq : verifiedCandidate? outer.active
        (endpointCandidate? program layout.tree outer.active endpoint) = relativeResult
          at selected
      cases relativeResult with
      | none => simp [relativeEq] at selected
      | some relativeAddress =>
          have addressEq : outer.address ++ relativeAddress = address := by
            exact Option.some.inj (by simpa [relativeEq] using selected)
          obtain ⟨relativeTarget, relativeContracts⟩ :=
            verifiedCandidate?_contracts relativeEq
          have shape := activeContext_sound program layout term
          have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
            outer.context relativeAddress relativeContracts
          rw [shape.source_eq, shape.contextAddress_eq, addressEq] at lifted
          exact ⟨outer.context.plug relativeTarget, lifted⟩

/-- Declared reachable grammar: a unique outer derivation ending in a 27-stage parse. -/
structure Reachable
    (program : CTS.Program) (layout : ActionDispatcher program)
    (term : Term) (outer : ActiveContext program)
    (endpoint : Registry.View program) : Prop where
  context : Describes program layout term outer
  endpointParsed : RootResetTwentySevenStageRegistry.parse?
    program layout outer.active = some endpoint

/-- The declared reachable decomposition and endpoint are jointly unique. -/
theorem Reachable.deterministic
    {program : CTS.Program} {layout : ActionDispatcher program} {term : Term}
    {firstOuter secondOuter : ActiveContext program}
    {firstEndpoint secondEndpoint : Registry.View program}
    (first : Reachable program layout term firstOuter firstEndpoint)
    (second : Reachable program layout term secondOuter secondEndpoint) :
    firstOuter = secondOuter ∧ firstEndpoint = secondEndpoint := by
  have outerEq := describes_deterministic first.context second.context
  subst secondOuter
  exact ⟨rfl, Option.some.inj
    (first.endpointParsed.symm.trans second.endpointParsed)⟩

/-- The total classifier is complete for the declared reachable grammar. -/
theorem classify_of_reachable
    {program : CTS.Program} {layout : ActionDispatcher program} {term : Term}
    {outer : ActiveContext program} {endpoint : Registry.View program}
    (reachable : Reachable program layout term outer endpoint) :
    (classify program layout term).outer = outer ∧
      (classify program layout term).endpoint = some endpoint := by
  have outerEq := (describes_eq_activeContext reachable.context).symm
  constructor
  · exact outerEq
  · unfold classify
    dsimp only
    rw [outerEq, reachable.endpointParsed]

end PureSFormal.Research.RootResetPersistentRouteA
