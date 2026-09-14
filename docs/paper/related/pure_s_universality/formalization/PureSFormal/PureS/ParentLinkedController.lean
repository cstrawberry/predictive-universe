import PureSFormal.PureS.CanonicalTraversal
import PureSFormal.PureS.ControllerTrajectory
import PureSFormal.PureS.TermNatCode

/-!
# Parent-linked one-pointer refinement of the cursor controller

This module replaces the functional zipper representation by a rooted,
unshared node store.  Node identifiers are natural numbers.  Every node record
contains its literal parent identifier and incoming side, and application
records contain the identifiers of their two children.  A runtime cursor is
the store paired with exactly one current node identifier.

The node table is computed from the current finite term.  The reference
implementation uses structural table lookup; this module proves the state and
trace refinement, not a constant-time RAM implementation theorem.
-/

namespace PureSFormal.PureS

namespace ParentLinked

/-! ## Natural node identifiers and their parent links -/

/-- The two child slots use the first two Cantor-pair coordinates. -/
@[simp]
def directionCode : Direction → Nat
  | .left => 0
  | .right => 1

/-- Decode one stored incoming-side tag. -/
def directionOfCode : Nat → Option Direction
  | 0 => some .left
  | 1 => some .right
  | _ => none

/-- A child identifier contains its parent identifier and incoming side. -/
def childId (parent : Nat) (side : Direction) : Nat :=
  Nat.succ (Term.pair parent (directionCode side))

/-- The root identifier is zero. -/
def rootId : Nat := 0

/-- Literal parent link recovered from one node identifier. -/
def parentLink? : Nat → Option (Nat × Direction)
  | 0 => none
  | encoded + 1 =>
      let components := Term.unpair encoded
      match directionOfCode components.2 with
      | none => none
      | some side => some (components.1, side)

@[simp]
theorem parentLink?_childId (parent : Nat) (side : Direction) :
    parentLink? (childId parent side) = some (parent, side) := by
  cases side <;> simp [childId, parentLink?, directionOfCode]

/-- Decode a node identifier to its root-relative address.  The address is a
transient lookup result; it is not part of controller state. -/
def decodeId? (identifier : Nat) : Option Address :=
  match identifier with
  | 0 => some []
  | encoded + 1 =>
      let components := Term.unpair encoded
      match directionOfCode components.2 with
      | none => none
      | some side =>
          (decodeId? components.1).map (fun address => address ++ [side])
termination_by identifier
decreasing_by
  have decrease :=
    Term.left_lt_pair_succ (Term.unpair encoded).1 (Term.unpair encoded).2
  simpa only [Term.pair_unpair] using decrease

@[simp]
theorem decodeId?_childId (parent : Nat) (side : Direction) :
    decodeId? (childId parent side) =
      (decodeId? parent).map (fun address => address ++ [side]) := by
  cases side <;> simp [childId, decodeId?, directionOfCode]

/-! ## The context represented by a zipper, used only by the compiler proof -/

/-- Immediate one-hole context represented by one zipper frame. -/
def frameContext : ParentFrame → Context
  | .left rightSibling => .appLeft .hole rightSibling
  | .right leftSibling => .appRight leftSibling .hole

/-- Whole root-to-focus context represented by the parent frames. -/
def surroundingContext : List ParentFrame → Context
  | [] => .hole
  | frame :: parents => (surroundingContext parents).comp (frameContext frame)

/-- Root-relative address represented by the parent frames. -/
def framesAddress : List ParentFrame → Address
  | [] => []
  | frame :: parents => framesAddress parents ++ [frame.side]

/-- Natural identifier of the focus represented by the parent frames. -/
def framesId : List ParentFrame → Nat
  | [] => rootId
  | frame :: parents => childId (framesId parents) frame.side

/-- The literal parent link expected at a represented focus. -/
def framesParent : List ParentFrame → Option (Nat × Direction)
  | [] => none
  | frame :: parents => some (framesId parents, frame.side)

@[simp]
theorem decodeId?_framesId (parents : List ParentFrame) :
    decodeId? (framesId parents) = some (framesAddress parents) := by
  induction parents with
  | nil =>
      simp [framesId, rootId, decodeId?, framesAddress]
  | cons frame parents ih =>
      rw [framesId, decodeId?_childId, ih]
      rfl

@[simp]
theorem parentLink?_framesId (parents : List ParentFrame) :
    parentLink? (framesId parents) = framesParent parents := by
  cases parents with
  | nil => simp [framesId, framesParent, rootId, parentLink?]
  | cons frame parents => simp [framesId, framesParent]

@[simp]
theorem frameContext_plug (frame : ParentFrame) (focus : Term) :
    (frameContext frame).plug focus = frame.fill focus := by
  cases frame <;> rfl

@[simp]
theorem surroundingContext_plug (parents : List ParentFrame) (focus : Term) :
    (surroundingContext parents).plug focus = Cursor.rebuild parents focus := by
  induction parents generalizing focus with
  | nil => rfl
  | cons frame parents ih =>
      simp only [surroundingContext, Context.plug_comp, frameContext_plug,
        Cursor.rebuild]
      exact ih (frame.fill focus)

@[simp]
theorem surroundingContext_address (parents : List ParentFrame) :
    CanonicalTraversal.contextAddress (surroundingContext parents) =
      framesAddress parents := by
  induction parents with
  | nil => rfl
  | cons frame parents ih =>
      rw [surroundingContext, CanonicalTraversal.contextAddress_comp, ih]
      cases frame <;> rfl

@[simp]
theorem subterm?_framesAddress (focus : Term) (parents : List ParentFrame) :
    (Cursor.rebuild parents focus).subterm? (framesAddress parents) = some focus := by
  rw [← surroundingContext_plug parents focus,
    ← surroundingContext_address parents]
  exact CanonicalTraversal.context_subterm?_plug _ _

@[simp]
theorem replace?_framesAddress (focus replacement : Term)
    (parents : List ParentFrame) :
    (Cursor.rebuild parents focus).replace? (framesAddress parents) replacement =
      some (Cursor.rebuild parents replacement) := by
  rw [← surroundingContext_plug parents focus,
    ← surroundingContext_plug parents replacement,
    ← surroundingContext_address parents]
  exact CanonicalTraversal.context_replace?_plug _ _ _

@[simp]
theorem contractAt?_framesAddress (focus : Term)
    (parents : List ParentFrame) :
    (Cursor.rebuild parents focus).contractAt? (framesAddress parents) =
      focus.contractRoot?.map (Cursor.rebuild parents) := by
  unfold Term.contractAt?
  rw [subterm?_framesAddress]
  cases root : focus.contractRoot? with
  | none =>
      simp only [root]
      rfl
  | some replacement =>
      simp only [root, replace?_framesAddress]
      rfl

/-! ## Concrete parent-linked store -/

/-- Contents of one stored node. -/
inductive NodeCell where
  | s
  | app (left right : Nat)
  deriving BEq, DecidableEq, Inhabited, Repr

/-- One node record, including its literal incoming parent link. -/
structure NodeRecord where
  parent : Option (Nat × Direction)
  cell : NodeCell
  deriving BEq, DecidableEq, Inhabited, Repr

/-- Cell belonging to a term occurrence with the supplied identifier. -/
def cellOfTerm (identifier : Nat) : Term → NodeCell
  | .s => .s
  | .app _ _ => .app (childId identifier .left) (childId identifier .right)

/-- Finite-term-derived node table.  Invalid identifiers and absent
occurrences have no record. -/
def recordFor (term : Term) (identifier : Nat) : Option NodeRecord :=
  match decodeId? identifier with
  | none => none
  | some address =>
      match term.subterm? address with
      | none => none
      | some occurrence =>
          some ⟨parentLink? identifier, cellOfTerm identifier occurrence⟩

/-- Rooted parent-linked store.  `table_spec` states that the stored table is
exactly the finite table derived from `term`. -/
structure Store where
  term : Term
  table : Nat → Option NodeRecord
  table_spec : ∀ identifier, table identifier = recordFor term identifier

namespace Store

/-- Materialize the parent-linked table of a finite term. -/
def ofTerm (term : Term) : Store where
  term := term
  table := recordFor term
  table_spec := fun _ => rfl

/-- Read one node record by identifier. -/
def record? (store : Store) (identifier : Nat) : Option NodeRecord :=
  store.table identifier

@[simp]
theorem record?_ofTerm (term : Term) (identifier : Nat) :
    (ofTerm term).record? identifier = recordFor term identifier := rfl

end Store

/-- Parent-linked store paired with exactly one current node pointer. -/
structure Cursor where
  store : Store
  focus : Nat

namespace Cursor

/-- Erase store links and the pointer, retaining the ordinary bare term. -/
def erase (cursor : Cursor) : Term := cursor.store.term

/-- Compile the functional zipper into a parent-linked store and one pointer. -/
def ofZipper (cursor : PureS.Cursor) : Cursor :=
  ⟨Store.ofTerm cursor.erase, framesId cursor.parents⟩

/-- Local node-kind observation.  The default is used only for malformed
pointers; compiled states always hit a stored record. -/
def observeNode (cursor : Cursor) : Probe.NodeKind :=
  match cursor.store.record? cursor.focus with
  | some ⟨_, .app _ _⟩ => .app
  | _ => .s

/-- Local incoming-edge observation read from the stored parent link. -/
def observeIncoming (cursor : Cursor) : Probe.Incoming :=
  match cursor.store.record? cursor.focus with
  | some ⟨some (_, .left), _⟩ => .left
  | some ⟨some (_, .right), _⟩ => .right
  | _ => .root

/-- Follow the stored left-child pointer. -/
def left? (cursor : Cursor) : Option Cursor :=
  match cursor.store.record? cursor.focus with
  | some ⟨_, .app left _⟩ => some { cursor with focus := left }
  | _ => none

/-- Follow the stored right-child pointer. -/
def right? (cursor : Cursor) : Option Cursor :=
  match cursor.store.record? cursor.focus with
  | some ⟨_, .app _ right⟩ => some { cursor with focus := right }
  | _ => none

/-- Follow the literal stored parent pointer. -/
def up? (cursor : Cursor) : Option Cursor :=
  match cursor.store.record? cursor.focus with
  | some ⟨some (parent, _), _⟩ => some { cursor with focus := parent }
  | _ => none

/-- Contract the occurrence named by the current pointer.  The replacement is
materialized as an unshared parent-linked tree, so the two copies of `z` have
distinct descendant identifiers and unique parent links. -/
def rdx? (cursor : Cursor) : Option Cursor :=
  match decodeId? cursor.focus with
  | none => none
  | some address =>
      match cursor.store.term.contractAt? address with
      | none => none
      | some replacement => some ⟨Store.ofTerm replacement, cursor.focus⟩

@[simp]
theorem erase_ofZipper (cursor : PureS.Cursor) :
    (ofZipper cursor).erase = cursor.erase := rfl

theorem record?_ofZipper (focus : Term) (parents : List ParentFrame) :
    (ofZipper ⟨focus, parents⟩).store.record? (framesId parents) =
      some ⟨framesParent parents, cellOfTerm (framesId parents) focus⟩ := by
  change recordFor (Cursor.rebuild parents focus) (framesId parents) = _
  unfold recordFor
  rw [decodeId?_framesId]
  simp only
  rw [subterm?_framesAddress]
  simp only
  rw [parentLink?_framesId]

@[simp]
theorem observeNode_ofZipper (cursor : PureS.Cursor) :
    (ofZipper cursor).observeNode = Probe.observeNode cursor := by
  cases cursor with
  | mk focus parents =>
      cases focus <;>
        simp [observeNode, ofZipper, PureS.Cursor.erase, Store.record?,
          Store.ofTerm, recordFor, decodeId?_framesId,
          subterm?_framesAddress, parentLink?_framesId, cellOfTerm,
          Probe.observeNode]

@[simp]
theorem observeIncoming_ofZipper (cursor : PureS.Cursor) :
    (ofZipper cursor).observeIncoming = Probe.observeIncoming cursor := by
  cases cursor with
  | mk focus parents =>
      cases parents with
      | nil => simp [observeIncoming, ofZipper, PureS.Cursor.erase,
          Store.record?, Store.ofTerm, recordFor, decodeId?_framesId,
          subterm?_framesAddress, parentLink?_framesId, cellOfTerm,
          framesParent, Probe.observeIncoming, PureS.Cursor.incomingSide]
      | cons frame parents =>
          cases frame <;>
            simp [observeIncoming, ofZipper, PureS.Cursor.erase,
              Store.record?, Store.ofTerm, recordFor, decodeId?_framesId,
              subterm?_framesAddress, parentLink?_framesId, cellOfTerm,
              framesParent, Probe.observeIncoming, PureS.Cursor.incomingSide]

@[simp]
theorem left?_ofZipper (cursor : PureS.Cursor) :
    (ofZipper cursor).left? = cursor.left?.map ofZipper := by
  cases cursor with
  | mk focus parents =>
      cases focus <;>
        simp [left?, ofZipper, PureS.Cursor.left?, PureS.Cursor.erase,
          Store.record?, Store.ofTerm, recordFor, decodeId?_framesId,
          subterm?_framesAddress, parentLink?_framesId, cellOfTerm,
          framesId, framesAddress, Cursor.rebuild]

@[simp]
theorem right?_ofZipper (cursor : PureS.Cursor) :
    (ofZipper cursor).right? = cursor.right?.map ofZipper := by
  cases cursor with
  | mk focus parents =>
      cases focus <;>
        simp [right?, ofZipper, PureS.Cursor.right?, PureS.Cursor.erase,
          Store.record?, Store.ofTerm, recordFor, decodeId?_framesId,
          subterm?_framesAddress, parentLink?_framesId, cellOfTerm,
          framesId, framesAddress, Cursor.rebuild]

@[simp]
theorem up?_ofZipper (cursor : PureS.Cursor) :
    (ofZipper cursor).up? = cursor.up?.map ofZipper := by
  cases cursor with
  | mk focus parents =>
      cases parents with
      | nil =>
          unfold up?
          change (match (ofZipper ⟨focus, []⟩).store.record?
            (framesId []) with
            | some ⟨some (parent, _), _⟩ =>
                some ({ (ofZipper ⟨focus, []⟩) with focus := parent } : Cursor)
            | _ => none) = none
          rw [record?_ofZipper]
          rfl
      | cons frame parents =>
          unfold up?
          change (match (ofZipper ⟨focus, frame :: parents⟩).store.record?
            (framesId (frame :: parents)) with
            | some ⟨some (parent, _), _⟩ =>
                some ({ (ofZipper ⟨focus, frame :: parents⟩) with
                  focus := parent } : Cursor)
            | _ => none) = some (ofZipper ⟨frame.fill focus, parents⟩)
          rw [record?_ofZipper]
          cases frame <;> rfl

@[simp]
theorem rdx?_ofZipper (cursor : PureS.Cursor) :
    (ofZipper cursor).rdx? = cursor.rdx?.map ofZipper := by
  cases cursor with
  | mk focus parents =>
      unfold rdx? ofZipper PureS.Cursor.rdx? PureS.Cursor.erase
      rw [decodeId?_framesId]
      simp only [PureS.Cursor.focus, PureS.Cursor.parents, Cursor.store,
        Cursor.focus, Store.term, Store.ofTerm, Option.bind_some]
      rw [contractAt?_framesAddress]
      cases focus.contractRoot? <;> rfl

end Cursor

/-! ## Primitive and finite-controller trace refinement -/

/-- Execute one primitive on the one-pointer representation. -/
def exec : Primitive → Cursor → Option Cursor
  | .L, cursor => cursor.left?
  | .R, cursor => cursor.right?
  | .U, cursor => cursor.up?
  | .Rdx, cursor => cursor.rdx?

@[simp]
theorem exec_ofZipper (primitive : Primitive) (cursor : PureS.Cursor) :
    exec primitive (Cursor.ofZipper cursor) =
      (primitive.exec cursor).map Cursor.ofZipper := by
  cases primitive <;> simp [exec, Primitive.exec]

namespace Controller

open FiniteController

/-- Finite control paired with one parent-linked node pointer. -/
structure Configuration (Control : Type) where
  control : RuntimeControl Control
  cursor : ParentLinked.Cursor

/-- Compile a zipper-controller configuration pointwise. -/
def ofZipper (configuration : FiniteController.Configuration Control) :
    Configuration Control :=
  ⟨configuration.control, ParentLinked.Cursor.ofZipper configuration.cursor⟩

/-- One controller microtransition over the parent-linked representation. -/
def step (machine : Machine Control) (configuration : Configuration Control) :
    Configuration Control :=
  match configuration.control with
  | none => configuration
  | some control =>
      match machine.transition control configuration.cursor.observeNode
          configuration.cursor.observeIncoming with
      | .stay next => ⟨some next, configuration.cursor⟩
      | .reject => ⟨none, configuration.cursor⟩
      | .exec primitive next =>
          match ParentLinked.exec primitive configuration.cursor with
          | none => ⟨none, configuration.cursor⟩
          | some cursor => ⟨some next, cursor⟩

/-- Parent-linked run for an exact number of raw controller microticks. -/
def run (machine : Machine Control) : Nat → Configuration Control →
    Configuration Control
  | 0, configuration => configuration
  | ticks + 1, configuration => run machine ticks (step machine configuration)

/-- Successful focused contractions during the parent-linked run. -/
def mutationCount (machine : Machine Control)
    (configuration : Configuration Control) : Nat :=
  match configuration.control with
  | none => 0
  | some control =>
      match machine.transition control configuration.cursor.observeNode
          configuration.cursor.observeIncoming with
      | .exec .Rdx _ =>
          match configuration.cursor.rdx? with
          | some _ => 1
          | none => 0
      | _ => 0

/-- Accumulated successful contractions during a finite parent-linked run. -/
def runMutationCount (machine : Machine Control) :
    Nat → Configuration Control → Nat
  | 0, _ => 0
  | ticks + 1, configuration =>
      mutationCount machine configuration +
        runMutationCount machine ticks (step machine configuration)

@[simp]
theorem step_ofZipper (machine : Machine Control)
    (configuration : FiniteController.Configuration Control) :
    step machine (ofZipper configuration) =
      ofZipper (FiniteController.step machine configuration) := by
  cases configuration with
  | mk runtime cursor =>
      cases runtime with
      | none => rfl
      | some control =>
          generalize commandEq : machine.transition control
            (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
          cases command with
          | stay next =>
              simp_all [step, FiniteController.step, Controller.ofZipper]
          | reject =>
              simp_all [step, FiniteController.step, Controller.ofZipper]
          | exec primitive next =>
              cases movedEq : primitive.exec cursor <;>
                simp_all [step, FiniteController.step, Controller.ofZipper]

@[simp]
theorem run_ofZipper (machine : Machine Control) (ticks : Nat)
    (configuration : FiniteController.Configuration Control) :
    run machine ticks (ofZipper configuration) =
      ofZipper (FiniteController.run machine ticks configuration) := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      simp only [run, FiniteController.run, step_ofZipper]
      exact ih (FiniteController.step machine configuration)

@[simp]
theorem mutationCount_ofZipper (machine : Machine Control)
    (configuration : FiniteController.Configuration Control) :
    mutationCount machine (ofZipper configuration) =
      FiniteController.mutationCount machine configuration := by
  cases configuration with
  | mk runtime cursor =>
      cases runtime with
      | none => rfl
      | some control =>
          generalize commandEq : machine.transition control
            (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
          cases command with
          | stay next =>
              simp_all [mutationCount, FiniteController.mutationCount,
                Controller.ofZipper]
          | reject =>
              simp_all [mutationCount, FiniteController.mutationCount,
                Controller.ofZipper]
          | exec primitive next =>
              cases primitive with
              | L =>
                  simp_all [mutationCount, FiniteController.mutationCount,
                    Controller.ofZipper]
              | R =>
                  simp_all [mutationCount, FiniteController.mutationCount,
                    Controller.ofZipper]
              | U =>
                  simp_all [mutationCount, FiniteController.mutationCount,
                    Controller.ofZipper]
              | Rdx =>
                  cases movedEq : cursor.rdx? <;>
                    simp_all [mutationCount, FiniteController.mutationCount,
                      Controller.ofZipper]

@[simp]
theorem runMutationCount_ofZipper (machine : Machine Control) (ticks : Nat)
    (configuration : FiniteController.Configuration Control) :
    runMutationCount machine ticks (ofZipper configuration) =
      FiniteController.runMutationCount machine ticks configuration := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      simp only [runMutationCount, FiniteController.runMutationCount,
        mutationCount_ofZipper, step_ofZipper]
      rw [ih (FiniteController.step machine configuration)]

/-- Every raw Result-A controller trace transfers to the parent-linked
one-pointer representation, with the same current bare term. -/
theorem run_erase_eq (machine : Machine Control) (ticks : Nat)
    (configuration : FiniteController.Configuration Control) :
    (run machine ticks (ofZipper configuration)).cursor.erase =
      (FiniteController.run machine ticks configuration).cursor.erase := by
  rw [run_ofZipper]
  rfl

/-- At every canonical contraction-sample tick, the parent-linked controller
reaches exactly the compiled sampled zipper state. -/
theorem ProductiveSystem.run_sampleTick_parentLinked
    {machine : Machine Control} (system : ProductiveSystem machine)
    (index : Nat) :
    run machine (system.sampleTick index) (ofZipper system.initial) =
      ofZipper (system.contractionRun index) := by
  rw [run_ofZipper, ProductiveSystem.run_sampleTick]

/-- The transferred sampled trace erases to the exact Result-A reduction path. -/
theorem ProductiveSystem.run_sampleTick_erase
    {machine : Machine Control} (system : ProductiveSystem machine)
    (index : Nat) :
    (run machine (system.sampleTick index)
      (ofZipper system.initial)).cursor.erase =
        system.reductionPath.term index := by
  rw [ProductiveSystem.run_sampleTick_parentLinked]
  rfl

/-- The transferred raw trace has exactly the same contraction counter. -/
theorem ProductiveSystem.runMutationCount_sampleTick_parentLinked
    {machine : Machine Control} (system : ProductiveSystem machine)
    (index : Nat) :
    runMutationCount machine (system.sampleTick index)
      (ofZipper system.initial) = index := by
  rw [runMutationCount_ofZipper,
    ProductiveSystem.runMutationCount_sampleTick]

end Controller

end ParentLinked

end PureSFormal.PureS
