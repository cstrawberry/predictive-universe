import PureSFormal.Research.RootResetFullProgressPath
import PureSFormal.Research.RootResetSelectorContract
import PureSFormal.PureS.PendingFrame

/-!
# Progress-aware outer active spine

This module implements the two root-reset synchronization phases that precede
local stage classification.

`CHAIN` greedily follows the literal `RL` continuation of a completed progress
Local only when its status is marked and its registered accumulator has a
complete progress path with zero canonical Open cells.  `JOB` then follows
literal right children of shallow pending-frame contexts.  A completed Local
has priority over the pending guard in `JOB`; consequently a marked Local
entered through a pending data edge is the active carrier, while a fresh Local
is never traversed through its continuation.

All accepted boundaries are role indexed.  Local audits, action histories,
and pending-frame holes are independent opaque fields.  No ordinary word,
action, or Local parser occurs in the executable definitions.
-/

namespace PureSFormal.Research.RootResetProgressOuterSpine

open PureSFormal.PureS

namespace ProgressPath

abbrev View := RootResetFullProgressPath.View
abbrev Decodes := RootResetFullProgressPath.Decodes
abbrev parse? := RootResetFullProgressPath.parse?

end ProgressPath

namespace ProgressLocal

abbrev View := RootResetProgressLocalParser.View
abbrev Shape := RootResetProgressLocalParser.Shape
abbrev parse? := RootResetProgressLocalParser.parse?

end ProgressLocal

/-! ## Role addresses -/

/-- The only two unbounded outer-spine roles. -/
inductive Role where
  | markedContinuation
  | pendingChild
  deriving BEq, DecidableEq, Inhabited, Repr

/-- Literal root-relative edge sequence contributed by one outer role. -/
def Role.address : Role → Address
  | .markedContinuation => [.right, .left]
  | .pendingChild => [.right]

/-- Address contributed by a finite outer-to-inner role sequence. -/
def rolesAddress : List Role → Address
  | [] => []
  | role :: roles => role.address ++ rolesAddress roles

@[simp]
theorem rolesAddress_nil : rolesAddress [] = [] := rfl

@[simp]
theorem rolesAddress_cons (role : Role) (roles : List Role) :
    rolesAddress (role :: roles) = role.address ++ rolesAddress roles := rfl

/-- Role-address compilation preserves concatenation. -/
theorem rolesAddress_append (first second : List Role) :
    rolesAddress (first ++ second) =
      rolesAddress first ++ rolesAddress second := by
  induction first with
  | nil => rfl
  | cons role roles ih =>
      simp [rolesAddress, ih, List.append_assoc]

/-! ## Exact clean marked-Local boundary -/

/-- Public data needed to justify one historical Local boundary. -/
structure HistoricalLocal (program : CTS.Program) where
  localView : ProgressLocal.View program
  path : ProgressPath.View
  deriving BEq, DecidableEq, Repr

/--
Independent-hole grammar for one historical shell: the Local is complete and
marked, and its selected accumulator has a complete, clean progress path.
-/
inductive HistoricalLocal.Shape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    HistoricalLocal program → Term → Prop where
  | intro
      {boundary : HistoricalLocal program} {term : Term}
      (localShape : ProgressLocal.Shape program tree boundary.localView term)
      (pathShape : ProgressPath.Decodes program tree
        boundary.localView.accumulator
        boundary.path.bits boundary.path.openCount
        boundary.path.frontArmedAddress boundary.path.openAddresses
        boundary.path.endpointAddress boundary.path.roles)
      (marked : boundary.localView.status = .marked)
      (clean : boundary.path.openCount = 0) :
      HistoricalLocal.Shape program tree boundary term

/-- Parse exactly one completed, marked, clean progress Local. -/
def parseHistoricalLocal?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (HistoricalLocal program) :=
  match ProgressLocal.parse? program tree term with
  | none => none
  | some localView =>
      if localView.status = .marked then
        match ProgressPath.parse? program tree localView.accumulator with
        | none => none
        | some path =>
            if path.openCount = 0 then some ⟨localView, path⟩ else none
      else none

/-- Successful historical parsing yields the exact role grammar. -/
theorem parseHistoricalLocal?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {boundary : HistoricalLocal program}
    (h : parseHistoricalLocal? program tree term = some boundary) :
    boundary.Shape program tree term := by
  cases hlocal : ProgressLocal.parse? program tree term with
  | none => simp [parseHistoricalLocal?, hlocal] at h
  | some localView =>
      by_cases marked : localView.status = .marked
      · cases hpath : ProgressPath.parse? program tree localView.accumulator with
        | none => simp [parseHistoricalLocal?, hlocal, marked, hpath] at h
        | some path =>
            by_cases clean : path.openCount = 0
            · have boundaryEq : HistoricalLocal.mk localView path = boundary :=
                Option.some.inj (by
                  simpa [parseHistoricalLocal?, hlocal, marked, hpath, clean]
                    using h)
              rw [← boundaryEq]
              exact .intro
                (RootResetProgressLocalParser.parse?_sound hlocal)
                (RootResetFullProgressPath.parse?_sound hpath) marked clean
            · simp [parseHistoricalLocal?, hlocal, marked, hpath, clean] at h
      · simp [parseHistoricalLocal?, hlocal, marked] at h

/-- Every exact historical boundary is accepted by the executable parser. -/
theorem parseHistoricalLocal?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {boundary : HistoricalLocal program}
    (h : boundary.Shape program tree term) :
    parseHistoricalLocal? program tree term = some boundary := by
  cases h with
  | intro localShape pathShape marked clean =>
      unfold parseHistoricalLocal?
      simp only [RootResetProgressLocalParser.parse?_complete localShape]
      rw [if_pos marked]
      simp only [RootResetFullProgressPath.parse?_complete pathShape]
      rw [if_pos clean]

/-- The historical parser and its role grammar agree exactly. -/
theorem parseHistoricalLocal?_eq_some_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (boundary : HistoricalLocal program) :
    parseHistoricalLocal? program tree term = some boundary ↔
      boundary.Shape program tree term :=
  ⟨parseHistoricalLocal?_sound, parseHistoricalLocal?_complete⟩

namespace HistoricalLocal.Shape

/-- A historical Local is literally marked. -/
theorem status_marked
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {boundary : HistoricalLocal program}
    (h : boundary.Shape program tree term) :
    boundary.localView.status = .marked := by
  cases h
  assumption

/-- A historical Local has no canonical Open cell. -/
theorem accumulator_clean
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {boundary : HistoricalLocal program}
    (h : boundary.Shape program tree term) :
    boundary.path.openCount = 0 := by
  cases h
  assumption

/-- The completed progress Local parser accepts the same boundary. -/
theorem local_parse
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {boundary : HistoricalLocal program}
    (h : boundary.Shape program tree term) :
    ProgressLocal.parse? program tree term = some boundary.localView := by
  cases h with
  | intro localShape =>
      exact RootResetProgressLocalParser.parse?_complete localShape

/-- The complete progress-path parser accepts the registered accumulator. -/
theorem path_parse
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {boundary : HistoricalLocal program}
    (h : boundary.Shape program tree term) :
    ProgressPath.parse? program tree boundary.localView.accumulator =
      some boundary.path := by
  cases h with
  | intro _ path => exact RootResetFullProgressPath.parse?_complete path

end HistoricalLocal.Shape

/-- A fresh completed Local can never be consumed as outer history. -/
theorem parseHistoricalLocal?_none_of_fresh
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {localView : ProgressLocal.View program}
    (parsed : ProgressLocal.parse? program tree term = some localView)
    (fresh : localView.status = .fresh) :
    parseHistoricalLocal? program tree term = none := by
  simp [parseHistoricalLocal?, parsed, fresh]

/-- Failure of the completed progress-Local parser precludes history. -/
theorem parseHistoricalLocal?_none_of_no_local
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term}
    (notLocal : ProgressLocal.parse? program tree term = none) :
    parseHistoricalLocal? program tree term = none := by
  simp [parseHistoricalLocal?, notLocal]

/-- The two outer Local audits are not inspected or compared. -/
theorem progressLocal_outer_audits_opaque
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (haltField dispatcher seedPayload continuation : Term)
    (firstSeedAudit firstContinuationAudit
      secondSeedAudit secondContinuationAudit : Term) :
    ProgressLocal.parse? program tree
        (CheckpointDecoder.openShell haltField dispatcher seedPayload
          firstSeedAudit continuation firstContinuationAudit) =
      ProgressLocal.parse? program tree
        (CheckpointDecoder.openShell haltField dispatcher seedPayload
          secondSeedAudit continuation secondContinuationAudit) := by
  rfl

/-! ## Literal one-hole contexts -/

/-- One-hole context at the literal `RL` continuation of a Local shell. -/
def localContinuationContext : Term → Context
  | .app left (.app _ continuationAudit) =>
      .appRight left (.appLeft .hole continuationAudit)
  | _ => .hole

/-- A parsed progress Local is rebuilt exactly from its continuation. -/
theorem localContinuationContext_plug
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ProgressLocal.View program}
    (parsed : ProgressLocal.parse? program tree term = some view) :
    (localContinuationContext term).plug view.continuation = term := by
  rcases RootResetProgressLocalParser.parse?_sound parsed with
    ⟨haltField, dispatcher, response, seedAudit, continuationAudit,
      histories, halt, route, action, sourceEq⟩
  rw [sourceEq]
  rfl

/-- The registered Local continuation contributes exactly `RL`. -/
theorem localContinuationContext_address
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ProgressLocal.View program}
    (parsed : ProgressLocal.parse? program tree term = some view) :
    RootResetSelectorContract.contextAddress
        (localContinuationContext term) = [.right, .left] := by
  rcases RootResetProgressLocalParser.parse?_sound parsed with
    ⟨haltField, dispatcher, response, seedAudit, continuationAudit,
      histories, halt, route, action, sourceEq⟩
  rw [sourceEq]
  rfl

/-- One-hole context at the immediate data child of a pending frame. -/
def pendingChildContext : Term → Context
  | .app fn _ => .appRight fn .hole
  | .s => .hole

/-- Shallow pending parsing uses the payload-opaque pattern directly. -/
def parsePending? (term : Term) : Option Term :=
  PendingFrame.guard? term [.right]

/-- Successful pending parsing exposes the independent-hole pattern. -/
theorem parsePending?_sound
    {term child : Term} (parsed : parsePending? term = some child) :
    PendingFrame.AtPendingChild term [.right] child :=
  PendingFrame.guard?_sound parsed

/-- Every independent-hole pending frame is accepted. -/
@[simp]
theorem parsePending?_pending
    (hole0 hole1 hole2 continuation child : Term) :
    parsePending?
        (PendingFrame.pending hole0 hole1 hole2 continuation child) =
      some child :=
  PendingFrame.guard?_pending hole0 hole1 hole2 continuation child

/-- A successful pending boundary is rebuilt exactly from its data child. -/
theorem pendingChildContext_plug
    {term child : Term} (parsed : parsePending? term = some child) :
    (pendingChildContext term).plug child = term := by
  have lookup := (parsePending?_sound parsed).2.2
  cases term with
  | s => simp [Term.subterm?] at lookup
  | app fn argument =>
      simp [Term.subterm?] at lookup
      subst child
      rfl

/-- A pending data child contributes exactly one right edge. -/
theorem pendingChildContext_address
    {term child : Term} (parsed : parsePending? term = some child) :
    RootResetSelectorContract.contextAddress (pendingChildContext term) =
      [.right] := by
  have lookup := (parsePending?_sound parsed).2.2
  cases term with
  | s => simp [Term.subterm?] at lookup
  | app fn argument => rfl

/-- Every successful pending parse enters a strict descendant. -/
theorem parsePending?_child_size_lt
    {term child : Term} (parsed : parsePending? term = some child) :
    child.size < term.size := by
  exact CarrierDecoder.subterm_size_lt (parsePending?_sound parsed).2.2

/-- A shallow pending parent cannot itself be a completed progress Local. -/
@[simp]
theorem progressLocal_parse?_pending_none
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (hole0 hole1 hole2 continuation child : Term) :
    ProgressLocal.parse? program tree
        (PendingFrame.pending hole0 hole1 hole2 continuation child) = none := by
  cases continuation with
  | s =>
      cases child <;>
        simp [ProgressLocal.parse?, RootResetProgressLocalParser.parse?,
          PendingFrame.pending, PendingFrame.frameFunction,
          PendingFrame.envelope, PendingFrame.envelopeSlot,
          CheckpointDecoder.checkHalt?]
  | app continuationFn continuationAudit =>
      cases continuationFn with
      | s =>
          cases child <;>
            simp [ProgressLocal.parse?, RootResetProgressLocalParser.parse?,
              PendingFrame.pending, PendingFrame.frameFunction,
              PendingFrame.envelope, PendingFrame.envelopeSlot,
              CheckpointDecoder.checkHalt?]
      | app continuationHead seedPayload =>
          cases continuationHead <;> cases child <;>
            simp [ProgressLocal.parse?, RootResetProgressLocalParser.parse?,
              PendingFrame.pending, PendingFrame.frameFunction,
              PendingFrame.envelope, PendingFrame.envelopeSlot,
              CheckpointDecoder.checkHalt?]

/-! ## Greedy CHAIN phase -/

/-- Result of greedily removing completed marked clean Local history. -/
structure ChainView (program : CTS.Program) where
  active : Term
  context : Context
  address : Address
  history : List (HistoricalLocal program)
  roles : List Role
  deriving BEq, DecidableEq, Repr

/-- Add one marked-continuation role around an inner CHAIN result. -/
def wrapChain {program : CTS.Program}
    (source : Term) (boundary : HistoricalLocal program)
    (inner : ChainView program) : ChainView program :=
  ⟨inner.active, (localContinuationContext source).comp inner.context,
    Role.markedContinuation.address ++ inner.address,
    boundary :: inner.history, .markedContinuation :: inner.roles⟩

/-- Total term-only CHAIN traversal, greedy by construction. -/
def peelChain
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : ChainView program :=
  match _hboundary : parseHistoricalLocal? program tree term with
  | none => ⟨term, .hole, [], [], []⟩
  | some boundary =>
      wrapChain term boundary
        (peelChain program tree boundary.localView.continuation)
termination_by term.size
decreasing_by
  exact RootResetProgressLocalParser.parse?_continuation_size_lt
    (parseHistoricalLocal?_sound _hboundary).local_parse

/-- Exact role-indexed grammar of the greedy CHAIN phase. -/
inductive Chain
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → ChainView program → Prop where
  | here
      {term : Term}
      (stop : parseHistoricalLocal? program tree term = none) :
      Chain program tree term ⟨term, .hole, [], [], []⟩
  | marked
      {term : Term} {boundary : HistoricalLocal program}
      {inner : ChainView program}
      (parsed : parseHistoricalLocal? program tree term = some boundary)
      (next : Chain program tree boundary.localView.continuation inner) :
      Chain program tree term (wrapChain term boundary inner)

/-- The executable CHAIN traversal has its exact declarative grammar. -/
theorem peelChain_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Chain program tree term (peelChain program tree term) := by
  rw [peelChain]
  split
  next stop => exact .here stop
  next boundary parsed =>
    exact .marked parsed
      (peelChain_sound program tree boundary.localView.continuation)
termination_by term.size
decreasing_by
  apply RootResetProgressLocalParser.parse?_continuation_size_lt
  exact (parseHistoricalLocal?_sound (by assumption)).local_parse

/-- Every CHAIN derivation equals the executable greedy result. -/
theorem Chain.eq_peelChain
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ChainView program}
    (shape : Chain program tree term view) :
    view = peelChain program tree term := by
  induction shape with
  | here stop =>
      rw [peelChain]
      split
      next => rfl
      next boundary accepted => simp_all
  | @marked term boundary inner parsed next ih =>
      rw [peelChain]
      split
      next rejected => simp_all
      next found accepted =>
        have foundEq : found = boundary :=
          Option.some.inj (accepted.symm.trans parsed)
        subst found
        simp only [wrapChain]
        rw [ih]

/-- The CHAIN grammar is functional. -/
theorem chain_deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : ChainView program}
    (firstShape : Chain program tree term first)
    (secondShape : Chain program tree term second) : first = second := by
  rw [firstShape.eq_peelChain, secondShape.eq_peelChain]

namespace Chain

/-- The CHAIN context literally rebuilds the source term. -/
theorem source_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ChainView program}
    (shape : Chain program tree term view) :
    view.context.plug view.active = term := by
  induction shape with
  | here stop => rfl
  | marked parsed next ih =>
      simp only [wrapChain]
      rw [Context.plug_comp, ih]
      exact localContinuationContext_plug
        (parseHistoricalLocal?_sound parsed).local_parse

/-- The stored address is exactly the CHAIN context-hole address. -/
theorem contextAddress_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ChainView program}
    (shape : Chain program tree term view) :
    RootResetSelectorContract.contextAddress view.context = view.address := by
  induction shape with
  | here stop => rfl
  | marked parsed next ih =>
      simp only [wrapChain, RootResetSelectorContract.contextAddress_comp]
      rw [localContinuationContext_address
        (parseHistoricalLocal?_sound parsed).local_parse, ih]
      rfl

/-- The role sequence computes exactly the stored root-relative address. -/
theorem address_eq_rolesAddress
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ChainView program}
    (shape : Chain program tree term view) :
    view.address = rolesAddress view.roles := by
  induction shape with
  | here stop => rfl
  | marked parsed next ih =>
      simp only [wrapChain, rolesAddress, ih]

/-- Looking up the stored CHAIN address reaches its active endpoint. -/
theorem active_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ChainView program}
    (shape : Chain program tree term view) :
    term.subterm? view.address = some view.active := by
  induction shape with
  | here stop => simp [Term.subterm?]
  | @marked source boundary inner parsed next ih =>
      simp only [wrapChain, Role.address]
      rw [CarrierDecoder.subterm?_append]
      change
        (source.subterm? RootResetProgressLocalParser.continuationAddress).bind
            (fun child => child.subterm? inner.address) =
          some inner.active
      rw [RootResetProgressLocalParser.parse?_continuation_subterm
        (parseHistoricalLocal?_sound parsed).local_parse]
      exact ih

/-- The active endpoint is exactly the first nonhistorical boundary. -/
theorem active_not_historical
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ChainView program}
    (shape : Chain program tree term view) :
    parseHistoricalLocal? program tree view.active = none := by
  induction shape with
  | here stop => exact stop
  | marked parsed next ih => exact ih

/-- Every entry of a CHAIN history was accepted at some literal source shell. -/
inductive ValidHistory
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    List (HistoricalLocal program) → Prop where
  | nil : ValidHistory program tree []
  | cons
      {boundary : HistoricalLocal program}
      {history : List (HistoricalLocal program)}
      (source : Term)
      (shape : boundary.Shape program tree source)
      (inner : ValidHistory program tree history) :
      ValidHistory program tree (boundary :: history)

/-- Every Local recorded by CHAIN is completed, marked, and clean. -/
theorem history_valid
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ChainView program}
    (shape : Chain program tree term view) :
    ValidHistory program tree view.history := by
  induction shape with
  | here stop => exact .nil
  | marked parsed next ih =>
      exact .cons _ (parseHistoricalLocal?_sound parsed) ih

/-- CHAIN is size nonincreasing at its active endpoint. -/
theorem active_size_le
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ChainView program}
    (shape : Chain program tree term view) :
    view.active.size ≤ term.size :=
  CarrierDecoder.subterm_size_le shape.active_subterm

/-- A nonempty CHAIN history reaches a strict descendant. -/
theorem active_size_lt_of_history_ne_nil
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ChainView program}
    (shape : Chain program tree term view)
    (nonempty : view.history ≠ []) :
    view.active.size < term.size := by
  cases shape with
  | here stop => simp at nonempty
  | marked parsed next =>
      exact Nat.lt_of_le_of_lt next.active_size_le
        (RootResetProgressLocalParser.parse?_continuation_size_lt
          (parseHistoricalLocal?_sound parsed).local_parse)

end Chain

/-! ## Greedy JOB phase -/

/-- Result of descending pending-frame data children. -/
structure JobView where
  active : Term
  context : Context
  address : Address
  pendingDepth : Nat
  roles : List Role
  deriving BEq, DecidableEq, Repr

/-- Add one pending-child role around an inner JOB result. -/
def wrapJob (source : Term) (inner : JobView) : JobView :=
  ⟨inner.active, (pendingChildContext source).comp inner.context,
    Role.pendingChild.address ++ inner.address,
    inner.pendingDepth + 1, .pendingChild :: inner.roles⟩

/--
Total JOB traversal.  Any completed progress Local is an active object and
wins before the overlapping shallow pending-frame guard.
-/
def peelJob
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : JobView :=
  match _hlocal : ProgressLocal.parse? program tree term with
  | some _ => ⟨term, .hole, [], 0, []⟩
  | none =>
      match _hpending : parsePending? term with
      | none => ⟨term, .hole, [], 0, []⟩
      | some child => wrapJob term (peelJob program tree child)
termination_by term.size
decreasing_by
  exact parsePending?_child_size_lt _hpending

/-- Exact role-indexed grammar of the priority-sensitive JOB phase. -/
inductive Job
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Term → JobView → Prop where
  | atLocal
      {term : Term} {boundary : ProgressLocal.View program}
      (parsed : ProgressLocal.parse? program tree term = some boundary) :
      Job program tree term ⟨term, .hole, [], 0, []⟩
  | other
      {term : Term}
      (notLocal : ProgressLocal.parse? program tree term = none)
      (notPending : parsePending? term = none) :
      Job program tree term ⟨term, .hole, [], 0, []⟩
  | pending
      {term child : Term} {inner : JobView}
      (notLocal : ProgressLocal.parse? program tree term = none)
      (parsed : parsePending? term = some child)
      (next : Job program tree child inner) :
      Job program tree term (wrapJob term inner)

/-- The executable JOB traversal has its exact declarative grammar. -/
theorem peelJob_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Job program tree term (peelJob program tree term) := by
  rw [peelJob]
  split
  next boundary parsed => exact .atLocal parsed
  next notLocal =>
    split
    next notPending => exact .other notLocal notPending
    next child parsed =>
      exact .pending notLocal parsed (peelJob_sound program tree child)
termination_by term.size
decreasing_by
  exact parsePending?_child_size_lt (by assumption)

/-- Every JOB derivation equals the executable priority result. -/
theorem Job.eq_peelJob
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : JobView}
    (shape : Job program tree term view) :
    view = peelJob program tree term := by
  induction shape with
  | atLocal parsed =>
      rw [peelJob]
      split
      next => rfl
      next rejected => simp_all
  | other notLocal notPending =>
      rw [peelJob]
      split
      next boundary parsed => simp_all
      next =>
        split
        next => rfl
        next child parsed => simp_all
  | @pending term child inner notLocal parsed next ih =>
      rw [peelJob]
      split
      next boundary accepted => simp_all
      next =>
        split
        next rejected => simp_all
        next found accepted =>
          have foundEq : found = child :=
            Option.some.inj (accepted.symm.trans parsed)
          subst found
          simp only [wrapJob]
          rw [ih]

/-- The JOB grammar is functional. -/
theorem job_deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : JobView}
    (firstShape : Job program tree term first)
    (secondShape : Job program tree term second) : first = second := by
  rw [firstShape.eq_peelJob, secondShape.eq_peelJob]

namespace Job

/-- The JOB context literally rebuilds its source. -/
theorem source_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : JobView}
    (shape : Job program tree term view) :
    view.context.plug view.active = term := by
  induction shape with
  | atLocal parsed => rfl
  | other notLocal notPending => rfl
  | pending notLocal parsed next ih =>
      simp only [wrapJob]
      rw [Context.plug_comp, ih]
      exact pendingChildContext_plug parsed

/-- The stored address is exactly the JOB context-hole address. -/
theorem contextAddress_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : JobView}
    (shape : Job program tree term view) :
    RootResetSelectorContract.contextAddress view.context = view.address := by
  induction shape with
  | atLocal parsed => rfl
  | other notLocal notPending => rfl
  | pending notLocal parsed next ih =>
      simp only [wrapJob, RootResetSelectorContract.contextAddress_comp]
      rw [pendingChildContext_address parsed, ih]
      rfl

/-- The role sequence computes exactly the stored JOB address. -/
theorem address_eq_rolesAddress
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : JobView}
    (shape : Job program tree term view) :
    view.address = rolesAddress view.roles := by
  induction shape with
  | atLocal parsed => rfl
  | other notLocal notPending => rfl
  | pending notLocal parsed next ih =>
      simp only [wrapJob, rolesAddress, ih]

/-- JOB depth equals the number of registered pending roles. -/
theorem pendingDepth_eq_roles_length
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : JobView}
    (shape : Job program tree term view) :
    view.pendingDepth = view.roles.length := by
  induction shape with
  | atLocal parsed => rfl
  | other notLocal notPending => rfl
  | pending notLocal parsed next ih =>
      simp [wrapJob, ih, Nat.add_comm]

/-- Looking up the stored JOB address reaches its active object. -/
theorem active_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : JobView}
    (shape : Job program tree term view) :
    term.subterm? view.address = some view.active := by
  induction shape with
  | atLocal parsed => simp [Term.subterm?]
  | other notLocal notPending => simp [Term.subterm?]
  | pending notLocal parsed next ih =>
      simp only [wrapJob, Role.address]
      rw [CarrierDecoder.subterm?_append,
        (parsePending?_sound parsed).2.2]
      exact ih

/-- A completed Local at the JOB endpoint is never descended through `RL`. -/
theorem active_local_stops
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {boundary : ProgressLocal.View program}
    (parsed : ProgressLocal.parse? program tree term = some boundary) :
    peelJob program tree term = ⟨term, .hole, [], 0, []⟩ := by
  rw [peelJob]
  split
  next => rfl
  next rejected => simp_all

/-- JOB is size nonincreasing at its active object. -/
theorem active_size_le
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : JobView}
    (shape : Job program tree term view) :
    view.active.size ≤ term.size :=
  CarrierDecoder.subterm_size_le shape.active_subterm

/-- A positive pending depth reaches a strict descendant. -/
theorem active_size_lt_of_pendingDepth_pos
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : JobView}
    (shape : Job program tree term view)
    (positive : 0 < view.pendingDepth) :
    view.active.size < term.size := by
  cases shape with
  | atLocal parsed => simp at positive
  | other notLocal notPending => simp at positive
  | pending notLocal parsed next =>
      exact Nat.lt_of_le_of_lt next.active_size_le
        (parsePending?_child_size_lt parsed)

end Job

/-! ## Combined CHAIN/JOB decomposition -/

/-- Complete root-relative synchronization result. -/
structure View (program : CTS.Program) where
  active : Term
  context : Context
  address : Address
  history : List (HistoricalLocal program)
  pendingDepth : Nat
  roles : List Role
  deriving BEq, DecidableEq, Repr

/-- Compose the CHAIN and JOB results. -/
def combine {program : CTS.Program}
    (chain : ChainView program) (job : JobView) : View program :=
  ⟨job.active, chain.context.comp job.context,
    chain.address ++ job.address, chain.history, job.pendingDepth,
    chain.roles ++ job.roles⟩

/-- Total root-reset decomposition from the current bare term alone. -/
def decompose
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : View program :=
  let chain := peelChain program tree term
  combine chain (peelJob program tree chain.active)

/-- Declarative master active-hole decomposition. -/
inductive Describes
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → View program → Prop where
  | intro
      {term : Term} {chain : ChainView program} {job : JobView}
      (chainShape : Chain program tree term chain)
      (jobShape : Job program tree chain.active job) :
      Describes program tree term (combine chain job)

/-- The executable decomposition has the declarative master grammar. -/
theorem decompose_describes
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    Describes program tree term (decompose program tree term) := by
  exact .intro (peelChain_sound program tree term)
    (peelJob_sound program tree (peelChain program tree term).active)

/-- Every declarative decomposition is the executable one. -/
theorem Describes.eq_decompose
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (shape : Describes program tree term view) :
    view = decompose program tree term := by
  cases shape with
  | @intro chain job chainShape jobShape =>
      have chainEq := chainShape.eq_peelChain
      subst chain
      simp only [decompose]
      rw [jobShape.eq_peelJob]

/-- The master CHAIN/JOB decomposition is unique. -/
theorem describes_deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : View program}
    (firstShape : Describes program tree term first)
    (secondShape : Describes program tree term second) : first = second := by
  rw [firstShape.eq_decompose, secondShape.eq_decompose]

/-- Every finite term has exactly one master decomposition. -/
theorem existsUnique_decomposition
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    ∃ view : View program,
      Describes program tree term view ∧
        ∀ other, Describes program tree term other → other = view := by
  refine ⟨decompose program tree term, decompose_describes program tree term,
    ?_⟩
  intro other otherShape
  exact describes_deterministic otherShape
    (decompose_describes program tree term)

namespace Describes

/-- The combined context literally rebuilds the whole current term. -/
theorem source_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (shape : Describes program tree term view) :
    view.context.plug view.active = term := by
  cases shape with
  | intro chainShape jobShape =>
      simp only [combine]
      rw [Context.plug_comp, jobShape.source_eq, chainShape.source_eq]

/-- The combined stored address is exactly the context-hole address. -/
theorem contextAddress_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (shape : Describes program tree term view) :
    RootResetSelectorContract.contextAddress view.context = view.address := by
  cases shape with
  | intro chainShape jobShape =>
      simp only [combine, RootResetSelectorContract.contextAddress_comp]
      rw [chainShape.contextAddress_eq, jobShape.contextAddress_eq]

/-- The combined roles compute the exact root-relative active address. -/
theorem address_eq_rolesAddress
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (shape : Describes program tree term view) :
    view.address = rolesAddress view.roles := by
  cases shape with
  | intro chainShape jobShape =>
      simp only [combine]
      rw [chainShape.address_eq_rolesAddress,
        jobShape.address_eq_rolesAddress]
      exact (rolesAddress_append _ _).symm

/-- The combined root-relative lookup reaches the unique active object. -/
theorem active_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (shape : Describes program tree term view) :
    term.subterm? view.address = some view.active := by
  cases shape with
  | intro chainShape jobShape =>
      simp only [combine]
      rw [CarrierDecoder.subterm?_append, chainShape.active_subterm]
      exact jobShape.active_subterm

/-- Any nonempty outer role sequence reaches a strict descendant. -/
theorem active_size_lt_of_roles_ne_nil
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (shape : Describes program tree term view)
    (nonempty : view.roles ≠ []) :
    view.active.size < term.size := by
  have lookup := shape.active_subterm
  rw [shape.address_eq_rolesAddress] at lookup
  cases rolesEq : view.roles with
  | nil => exact (nonempty rolesEq).elim
  | cons role roles =>
      rw [rolesEq, rolesAddress] at lookup
      cases role <;>
        exact CarrierDecoder.subterm_size_lt
          (by simpa [Role.address] using lookup)

/-- The active object is no longer a consumable outer-history Local. -/
theorem chainEndpoint_not_historical
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} :
    parseHistoricalLocal? program tree
      (peelChain program tree term).active = none :=
  (peelChain_sound program tree term).active_not_historical

end Describes

/-! ## Role-priority consequences -/

/-- A fresh completed Local remains the root active object. -/
theorem decompose_fresh_local
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {localView : ProgressLocal.View program}
    (parsed : ProgressLocal.parse? program tree term = some localView)
    (fresh : localView.status = .fresh) :
    (decompose program tree term).active = term ∧
      (decompose program tree term).history = [] ∧
      (decompose program tree term).pendingDepth = 0 ∧
      (decompose program tree term).address = [] := by
  have noHistory := parseHistoricalLocal?_none_of_fresh parsed fresh
  have jobStop := Job.active_local_stops parsed
  have chainStop : peelChain program tree term =
      ⟨term, .hole, [], [], []⟩ := by
    rw [peelChain]
    rw [noHistory]
  unfold decompose
  rw [chainStop]
  dsimp only
  rw [jobStop]
  exact ⟨rfl, rfl, rfl, rfl⟩

/--
A completed Local reached as the data child of one pending frame is classified
as the JOB active object.  It is not consumed as outer history, irrespective
of whether its status is fresh or marked.
-/
theorem decompose_pending_local
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    (hole0 hole1 hole2 continuation term : Term)
    {localView : ProgressLocal.View program}
    (parsed : ProgressLocal.parse? program tree term = some localView) :
    (decompose program tree
        (PendingFrame.pending hole0 hole1 hole2 continuation term)).active =
        term ∧
      (decompose program tree
        (PendingFrame.pending hole0 hole1 hole2 continuation term)).history =
        [] ∧
      (decompose program tree
        (PendingFrame.pending hole0 hole1 hole2 continuation term)).pendingDepth =
        1 ∧
      (decompose program tree
        (PendingFrame.pending hole0 hole1 hole2 continuation term)).address =
        [.right] := by
  have outerNotLocal := progressLocal_parse?_pending_none program tree
    hole0 hole1 hole2 continuation term
  have outerStop := parseHistoricalLocal?_none_of_no_local outerNotLocal
  have stop := Job.active_local_stops parsed
  let source := PendingFrame.pending hole0 hole1 hole2 continuation term
  have chainStop : peelChain program tree source =
      ⟨source, .hole, [], [], []⟩ := by
    rw [peelChain]
    split
    next => rfl
    next boundary accepted => simp_all [source]
  have jobStep : peelJob program tree source =
      wrapJob source (peelJob program tree term) := by
    rw [peelJob]
    split
    next boundary accepted => simp_all [source]
    next =>
      split
      next rejected => simp_all [source, parsePending?]
      next child accepted =>
        have childEq : child = term := by
          simpa [source] using Option.some.inj
            (accepted.symm.trans
              (parsePending?_pending hole0 hole1 hole2 continuation term))
        subst child
        rfl
  change
    (decompose program tree source).active = term ∧
      (decompose program tree source).history = [] ∧
      (decompose program tree source).pendingDepth = 1 ∧
      (decompose program tree source).address = [.right]
  unfold decompose
  rw [chainStop]
  dsimp only
  rw [jobStep, stop]
  exact ⟨rfl, rfl, rfl, rfl⟩

/--
In particular, a completed marked clean Local below a pending data edge is
the active carrier and contributes no CHAIN-history entry.
-/
theorem decompose_pending_marked_clean_local
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    (hole0 hole1 hole2 continuation term : Term)
    {boundary : HistoricalLocal program}
    (parsed : parseHistoricalLocal? program tree term = some boundary) :
    (decompose program tree
        (PendingFrame.pending hole0 hole1 hole2 continuation term)).active =
        term ∧
      (decompose program tree
        (PendingFrame.pending hole0 hole1 hole2 continuation term)).history =
        [] ∧
      (decompose program tree
        (PendingFrame.pending hole0 hole1 hole2 continuation term)).pendingDepth =
        1 ∧
      (decompose program tree
        (PendingFrame.pending hole0 hole1 hole2 continuation term)).address =
        [.right] :=
  decompose_pending_local hole0 hole1 hole2 continuation term
    (parseHistoricalLocal?_sound parsed).local_parse

end PureSFormal.Research.RootResetProgressOuterSpine
