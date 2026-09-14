import PureSFormal.Research.RootResetReachableStageGrammar
import PureSFormal.Research.RootResetSelectorContract
import PureSFormal.Research.RootResetWholeStageClassifier

/-!
# Role-sensitive active contexts for root-reset reconstruction

This module gives a total executable traversal and an equivalent declarative
grammar for the two outer contexts that can surround the scheduler's active
endpoint: the literal continuation of a completed marked `Local`, and the
literal right child of a pending frame.  A finite role path is supplied because
the shallow pending-frame language deliberately overlaps the exact `R₀` frame
language.  The traversal therefore proves syntax reconstruction, accumulated
root address, strict descent, and uniqueness for a fixed role path without
claiming that syntax alone has yet reconstructed that path.

No scheduler-reachability or selected-step closure theorem is asserted here.
-/

namespace PureSFormal.Research.RootResetReachableActiveContext

open PureSFormal.PureS
open RootResetReachableStageGrammar

/-- The two context roles whose holes can contain the next active endpoint. -/
inductive Role where
  | markedContinuation
  | pendingChild
  deriving BEq, DecidableEq, Inhabited, Repr

/-- Root-relative edge sequence contributed by one role. -/
def Role.address : Role → Address
  | .markedContinuation => [.right, .left]
  | .pendingChild => [.right]

/-- The one-hole context whose hole is the immediate right child of an application. -/
def pendingChildContext : Term → Context
  | .app fn _ => .appRight fn .hole
  | .s => .hole

/-- A successful pending-frame parse literally rebuilds its source. -/
theorem pendingChildContext_plug
    {term child : Term}
    (parsed : RootResetStageRegistry.parsePending? term = some child) :
    (pendingChildContext term).plug child = term := by
  have lookup := (RootResetStageRegistry.parsePending?_sound parsed).2.2
  cases term with
  | s => simp [Term.subterm?] at lookup
  | app fn arg =>
      simp [Term.subterm?] at lookup
      subst child
      rfl

/-- The pending-child context contributes exactly one right edge. -/
theorem pendingChildContext_address
    {term child : Term}
    (parsed : RootResetStageRegistry.parsePending? term = some child) :
    RootResetSelectorContract.contextAddress (pendingChildContext term) =
      [.right] := by
  have lookup := (RootResetStageRegistry.parsePending?_sound parsed).2.2
  cases term with
  | s => simp [Term.subterm?] at lookup
  | app fn arg => rfl

/-- A marked-Local continuation contributes the literal `RL` address. -/
theorem markedContinuationContext_address
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : parseMarkedLocal? program tree term = some view) :
    RootResetSelectorContract.contextAddress (localContinuationContext term) =
      [.right, .left] := by
  have localParsed := parseMarkedLocal?_toLocal parsed
  rcases CheckpointDecoder.parseLocal?_sound localParsed with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, dispatch,
      source⟩
  rw [source]
  rfl

/-- The reconstructed endpoint, its one-hole context, and its root address. -/
structure View where
  active : Term
  context : Context
  address : Address
  deriving BEq, DecidableEq, Repr

/-- Add one outer role to an already reconstructed inner endpoint. -/
def wrap (role : Role) (source : Term) (inner : View) : View :=
  let outer := match role with
    | .markedContinuation => localContinuationContext source
    | .pendingChild => pendingChildContext source
  ⟨inner.active, outer.comp inner.context, role.address ++ inner.address⟩

/--
Follow a supplied finite role path using only parsers of the current bare term.
The recursion is structurally total on the role path; every accepted role also
enters a strict subterm, as proved below.
-/
def parse?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    List Role → Term → Option View
  | [], term => some ⟨term, .hole, []⟩
  | .markedContinuation :: roles, term =>
      match parseMarkedLocal? program tree term with
      | none => none
      | some localView =>
          (parse? program tree roles localView.continuation).map
            (wrap .markedContinuation term)
  | .pendingChild :: roles, term =>
      match RootResetStageRegistry.parsePending? term with
      | none => none
      | some child =>
          (parse? program tree roles child).map
            (wrap .pendingChild term)

/-- Declarative counterpart of `parse?`, indexed by the same explicit roles. -/
inductive Describes
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    List Role → Term → View → Prop where
  | here (term : Term) :
      Describes program tree [] term ⟨term, .hole, []⟩
  | marked
      {roles : List Role} {term : Term}
      {localView : CheckpointDecoder.LocalView program} {inner : View}
      (boundary : parseMarkedLocal? program tree term = some localView)
      (next : Describes program tree roles localView.continuation inner) :
      Describes program tree (.markedContinuation :: roles) term
        (wrap .markedContinuation term inner)
  | pending
      {roles : List Role} {term child : Term} {inner : View}
      (boundary : RootResetStageRegistry.parsePending? term = some child)
      (next : Describes program tree roles child inner) :
      Describes program tree (.pendingChild :: roles) term
        (wrap .pendingChild term inner)

/-- Executable success yields the declarative active-context grammar. -/
theorem parse?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List Role} {term : Term} {view : View}
    (parsed : parse? program tree roles term = some view) :
    Describes program tree roles term view := by
  induction roles generalizing term view with
  | nil =>
      have viewEq : ⟨term, .hole, []⟩ = view := by
        exact Option.some.inj (by simpa [parse?] using parsed)
      rw [← viewEq]
      exact .here term
  | cons role roles ih =>
      cases role with
      | markedContinuation =>
          cases boundary : parseMarkedLocal? program tree term with
          | none => simp [parse?, boundary] at parsed
          | some localView =>
              cases innerParsed : parse? program tree roles localView.continuation with
              | none => simp [parse?, boundary, innerParsed] at parsed
              | some inner =>
                  have viewEq : wrap .markedContinuation term inner = view := by
                    exact Option.some.inj
                      (by simpa [parse?, boundary, innerParsed] using parsed)
                  rw [← viewEq]
                  exact .marked boundary (ih innerParsed)
      | pendingChild =>
          cases boundary : RootResetStageRegistry.parsePending? term with
          | none => simp [parse?, boundary] at parsed
          | some child =>
              cases innerParsed : parse? program tree roles child with
              | none => simp [parse?, boundary, innerParsed] at parsed
              | some inner =>
                  have viewEq : wrap .pendingChild term inner = view := by
                    exact Option.some.inj
                      (by simpa [parse?, boundary, innerParsed] using parsed)
                  rw [← viewEq]
                  exact .pending boundary (ih innerParsed)

/-- Every declarative derivation is accepted by the executable parser. -/
theorem parse?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List Role} {term : Term} {view : View}
    (shape : Describes program tree roles term view) :
    parse? program tree roles term = some view := by
  induction shape with
  | here term => rfl
  | marked boundary next ih => simp [parse?, boundary, ih]
  | pending boundary next ih => simp [parse?, boundary, ih]

/-- The executable and declarative grammars agree exactly. -/
theorem parse?_eq_some_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (roles : List Role) (term : Term) (view : View) :
    parse? program tree roles term = some view ↔
      Describes program tree roles term view :=
  ⟨parse?_sound, parse?_complete⟩

namespace Describes

/-- Every derivation literally reconstructs its source from the active endpoint. -/
theorem source_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List Role} {term : Term} {view : View}
    (shape : Describes program tree roles term view) :
    view.context.plug view.active = term := by
  induction shape with
  | here term => rfl
  | marked boundary next ih =>
      simp only [wrap]
      rw [Context.plug_comp, ih]
      exact localContinuationContext_plug (parseMarkedLocal?_toLocal boundary)
  | pending boundary next ih =>
      simp only [wrap]
      rw [Context.plug_comp, ih]
      exact pendingChildContext_plug boundary

/-- The stored address is exactly the composed context-hole address. -/
theorem contextAddress_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List Role} {term : Term} {view : View}
    (shape : Describes program tree roles term view) :
    RootResetSelectorContract.contextAddress view.context = view.address := by
  induction shape with
  | here term => rfl
  | marked boundary next ih =>
      simp only [wrap, RootResetSelectorContract.contextAddress_comp]
      rw [markedContinuationContext_address boundary, ih]
      rfl
  | pending boundary next ih =>
      simp only [wrap, RootResetSelectorContract.contextAddress_comp]
      rw [pendingChildContext_address boundary, ih]
      rfl

/-- Looking up the accumulated address in the source reaches the active endpoint. -/
theorem active_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List Role} {term : Term} {view : View}
    (shape : Describes program tree roles term view) :
    term.subterm? view.address = some view.active := by
  have lookup := RootResetWholeStageClassifier.subterm?_plug_contextAddress_append
    view.context view.active []
  rw [← shape.source_eq, ← shape.contextAddress_eq]
  simpa using lookup

/-- A nonempty role path always enters a strict subtree of its source. -/
theorem active_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {role : Role} {roles : List Role} {term : Term} {view : View}
    (shape : Describes program tree (role :: roles) term view) :
    view.active.size < term.size := by
  have lookup := shape.active_subterm
  cases addressEq : view.address with
  | nil =>
      cases shape with
      | marked boundary next =>
          simp [wrap, Role.address] at addressEq
      | pending boundary next =>
          simp [wrap, Role.address] at addressEq
  | cons direction rest =>
      exact CarrierDecoder.subterm_size_lt (by simpa [addressEq] using lookup)

end Describes

/-- The active decomposition is unique once its role path is fixed. -/
theorem describes_deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List Role} {term : Term} {first second : View}
    (hfirst : Describes program tree roles term first)
    (hsecond : Describes program tree roles term second) :
    first = second := by
  exact Option.some.inj
    ((parse?_complete hfirst).symm.trans (parse?_complete hsecond))

/-- Every successful role-path parse supplies one unique declarative decomposition. -/
theorem existsUnique_of_parse?
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List Role} {term : Term} {view : View}
    (parsed : parse? program tree roles term = some view) :
    Describes program tree roles term view ∧
      ∀ other, Describes program tree roles term other → other = view := by
  refine ⟨parse?_sound parsed, ?_⟩
  intro other otherShape
  exact describes_deterministic otherShape (parse?_sound parsed)

/--
An exact `R₀` term admits both the endpoint role and the pending-child role.
Consequently uniqueness cannot soundly quantify over different role paths.
-/
theorem frameR0_role_is_necessary
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation child : Term) :
    (∃ rootView,
      parse? program tree []
          (frame (environmentCode (compileActions program tree) bits)
            continuation child) = some rootView) ∧
      (∃ childView,
        parse? program tree [.pendingChild]
            (frame (environmentCode (compileActions program tree) bits)
              continuation child) = some childView ∧
          childView.active = child) := by
  constructor
  · exact ⟨⟨frame (environmentCode (compileActions program tree) bits)
      continuation child, .hole, []⟩, rfl⟩
  · let source := frame (environmentCode (compileActions program tree) bits)
      continuation child
    let childView : View := ⟨child, .hole, []⟩
    refine ⟨wrap .pendingChild source childView, ?_, rfl⟩
    rw [parse?]
    rw [(RootResetStageRegistry.pendingFrame_frameR0_overlap
      (compileActions program tree) bits continuation child).1]
    rfl

end PureSFormal.Research.RootResetReachableActiveContext
