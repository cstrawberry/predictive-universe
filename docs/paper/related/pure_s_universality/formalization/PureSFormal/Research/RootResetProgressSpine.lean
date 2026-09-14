import PureSFormal.Research.RootResetProgressRoles

/-!
# Recursive progress-cell spine

This optional Research module closes the local algebra under recursively
nested Armed, Open, and Closed progress cells.  Only the registered
predecessor is recursive.  Every audit field is an independent opaque hole:
the executable parser never compares it with the predecessor or with another
audit.

The decoded word is stored front-innermost, as in `CellSpine`.  Armed cells
append one bit.  Open and Closed cells contribute no bit.  A second index
counts canonical Open roles, making cleanliness and the unique-open invariant
available without inspecting audit subtrees.
-/

namespace PureSFormal.Research.RootResetProgressSpine

open PureSFormal.PureS
open RootResetProgressRoles

/--
Declarative role-indexed progress spine.  The final natural-number index is
the number of Open roles on the registered predecessor path.
-/
inductive Decodes : Term → List Bool → Nat → Prop where
  | endpoint : Decodes .s [] 0
  | armed {predecessor : Term} {bits : List Bool} {opens : Nat}
      (bit : Bool) (inner : Decodes predecessor bits opens) :
      Decodes (RootResetProgressRoles.Gadget.source bit predecessor)
        (bits ++ [bit]) opens
  | opened {predecessor : Term} {bits : List Bool} {opens : Nat}
      (bit : Bool) (audit : Term) (inner : Decodes predecessor bits opens) :
      Decodes (openCell bit predecessor audit) bits (opens + 1)
  | closed {predecessor : Term} {bits : List Bool} {opens : Nat}
      (bit : Bool) (leftAudit rightAudit : Term)
      (inner : Decodes predecessor bits opens) :
      Decodes (closedCell bit predecessor leftAudit rightAudit) bits opens

/-- The complete executable result of parsing a registered progress spine. -/
structure View where
  bits : List Bool
  openCount : Nat
  deriving BEq, DecidableEq, Repr

/--
Total structural parser/decoder.  Recursive calls enter only the registered
predecessor.  Audit fields occur in patterns solely so their role boundary is
recognized; their contents are not inspected or compared.
-/
def decode? : Term → Option View
  | .s => some ⟨[], 0⟩
  | .app (.app (.app .s .s) constructor) predecessor =>
      match RootResetDeletionGadget.parseLiveConstructor? constructor with
      | none => none
      | some bit =>
          match decode? predecessor with
          | none => none
          | some inner =>
              some ⟨inner.bits ++ [bit], inner.openCount⟩
  | .app (.app .s predecessor)
      (.app (.app (.app .s .s) tag) _audit) =>
      match RootResetDeletionGadget.parseValueTag? tag with
      | none => none
      | some _bit =>
          match decode? predecessor with
          | none => none
          | some inner =>
              some ⟨inner.bits, inner.openCount + 1⟩
  | .app (.app .s predecessor)
      (.app (.app .s _leftAudit) (.app tag _rightAudit)) =>
      match RootResetDeletionGadget.parseValueTag? tag with
      | none => none
      | some _bit => decode? predecessor
  | _ => none
termination_by structural term => term

@[simp]
theorem decode?_endpoint : decode? (.s : Term) = some ⟨[], 0⟩ :=
  rfl

@[simp]
theorem decode?_armed (bit : Bool) (predecessor : Term) :
    decode? (RootResetProgressRoles.Gadget.source bit predecessor) =
      (decode? predecessor).map
        (fun inner => ⟨inner.bits ++ [bit], inner.openCount⟩) := by
  cases bit <;>
    simp [decode?, RootResetProgressRoles.Gadget.source,
      RootResetDeletionGadget.source, RootResetDeletionGadget.progressLive,
      live, b] <;>
    cases decode? predecessor <;> rfl

@[simp]
theorem decode?_openCell (bit : Bool) (predecessor audit : Term) :
    decode? (openCell bit predecessor audit) =
      (decode? predecessor).map
        (fun inner => ⟨inner.bits, inner.openCount + 1⟩) := by
  cases bit <;> simp [decode?, openCell, live, b] <;>
    cases decode? predecessor <;> rfl

@[simp]
theorem decode?_closedCell (bit : Bool)
    (predecessor leftAudit rightAudit : Term) :
    decode? (closedCell bit predecessor leftAudit rightAudit) =
      decode? predecessor := by
  cases bit <;>
    simp [decode?, closedCell,
      RootResetDeletionGadget.parseValueTag?]

/-- Every declarative progress spine is accepted with its exact indices. -/
theorem decode?_complete {term : Term} {bits : List Bool} {opens : Nat}
    (h : Decodes term bits opens) : decode? term = some ⟨bits, opens⟩ := by
  induction h with
  | endpoint => rfl
  | armed bit inner ih => simp [ih]
  | opened bit audit inner ih => simp [ih]
  | closed bit leftAudit rightAudit inner ih => simp [ih]

/-- Soundness at one root, separated from hereditary subtree evidence. -/
private def SoundAt (term : Term) : Prop :=
  ∀ (view : View), decode? term = some view →
    Decodes term view.bits view.openCount

/-- Soundness evidence for a term and every syntactic subtree. -/
private inductive SoundTree : (term : Term) → Prop where
  | leaf (root : SoundAt .s) : SoundTree .s
  | node {function argument : Term}
      (root : SoundAt (.app function argument))
      (left : SoundTree function) (right : SoundTree argument) :
      SoundTree (.app function argument)

private theorem SoundTree.root {term : Term} : SoundTree term → SoundAt term
  | .leaf root => root
  | .node root _ _ => root

private theorem SoundTree.rightRoot {function argument : Term} :
    SoundTree (.app function argument) → SoundAt argument
  | .node _ _ right => right.root

/-- A successful parse at an application root is sound when all proper
subtrees already carry soundness evidence. -/
private theorem applicationSound {function argument : Term}
    (left : SoundTree function) (right : SoundTree argument) :
    SoundAt (.app function argument) := by
  intro view h
  unfold decode? at h
  split at h
  next impossible => cases impossible
  next =>
    rename_i _ constructor predecessor shape
    have functionShape := (Term.app.inj shape).1
    have argumentShape := (Term.app.inj shape).2
    subst function
    subst argument
    split at h
    next hp => simp at h
    next bit hp =>
      split at h
      next hd => simp at h
      next inner hd =>
        cases h
        have hconstructor :=
          RootResetDeletionGadget.parseLiveConstructor?_sound hp
        have result := Decodes.armed bit (right.root inner hd)
        simpa [RootResetProgressRoles.Gadget.source,
          RootResetDeletionGadget.source,
          RootResetDeletionGadget.progressLive,
          hconstructor] using! result
  next =>
    rename_i _ predecessor tag audit shape
    have functionShape := (Term.app.inj shape).1
    have argumentShape := (Term.app.inj shape).2
    subst function
    subst argument
    split at h
    next hp => simp at h
    next bit hp =>
      split at h
      next hd => simp at h
      next inner hd =>
        cases h
        have htag := RootResetDeletionGadget.parseValueTag?_sound hp
        have result := Decodes.opened bit audit
          (left.rightRoot inner hd)
        simpa [openCell, htag] using! result
  next =>
    rename_i _ predecessor leftAudit tag rightAudit shape
    have functionShape := (Term.app.inj shape).1
    have argumentShape := (Term.app.inj shape).2
    subst function
    subst argument
    split at h
    next hp => simp at h
    next bit hp =>
      have htag := RootResetDeletionGadget.parseValueTag?_sound hp
      have result := Decodes.closed bit leftAudit rightAudit
        (left.rightRoot view h)
      simpa [closedCell, htag] using result
  next => cases h

/-- Structural induction packages soundness for every subtree without a
well-founded quotient recursor. -/
private theorem soundTree : ∀ term : Term, SoundTree term
  | .s => .leaf (by
      intro view h
      cases h
      exact .endpoint)
  | .app function argument =>
      let left := soundTree function
      let right := soundTree argument
      .node (applicationSound left right) left right

/-- Every successful parse has a declarative role-indexed derivation. -/
theorem decode?_sound {term : Term} {view : View}
    (h : decode? term = some view) :
    Decodes term view.bits view.openCount :=
  (soundTree term).root view h

/-- Executable parsing and the independent-hole grammar coincide exactly. -/
theorem decode?_eq_some_iff (term : Term) (bits : List Bool) (opens : Nat) :
    decode? term = some ⟨bits, opens⟩ ↔ Decodes term bits opens :=
  ⟨fun h => decode?_sound h, decode?_complete⟩

/-- A bare progress spine has only one decoded word and Open count. -/
theorem Decodes.deterministic
    {term : Term} {firstBits secondBits : List Bool}
    {firstOpens secondOpens : Nat}
    (first : Decodes term firstBits firstOpens)
    (second : Decodes term secondBits secondOpens) :
    firstBits = secondBits ∧ firstOpens = secondOpens := by
  have h : (some ⟨firstBits, firstOpens⟩ : Option View) =
      some ⟨secondBits, secondOpens⟩ :=
    (decode?_complete first).symm.trans (decode?_complete second)
  have hv : (View.mk firstBits firstOpens) =
      View.mk secondBits secondOpens := Option.some.inj h
  exact ⟨congrArg View.bits hv, congrArg View.openCount hv⟩

/-! ## Queue and Open-count projections -/

/-- Project only the logical queue, ignoring the Open-count certificate. -/
def queue? (term : Term) : Option (List Bool) :=
  (decode? term).map View.bits

/-- Project only the number of canonical Open roles. -/
def openCount? (term : Term) : Option Nat :=
  (decode? term).map View.openCount

@[simp]
theorem queue?_armed (bit : Bool) (predecessor : Term) :
    queue? (RootResetProgressRoles.Gadget.source bit predecessor) =
      (queue? predecessor).map (fun bits => bits ++ [bit]) := by
  unfold queue?
  rw [decode?_armed]
  cases decode? predecessor <;> rfl

@[simp]
theorem queue?_openCell (bit : Bool) (predecessor audit : Term) :
    queue? (openCell bit predecessor audit) = queue? predecessor := by
  unfold queue?
  rw [decode?_openCell]
  cases decode? predecessor <;> rfl

@[simp]
theorem queue?_closedCell (bit : Bool)
    (predecessor leftAudit rightAudit : Term) :
    queue? (closedCell bit predecessor leftAudit rightAudit) =
      queue? predecessor := by
  unfold queue?
  rw [decode?_closedCell]

@[simp]
theorem openCount?_armed (bit : Bool) (predecessor : Term) :
    openCount? (RootResetProgressRoles.Gadget.source bit predecessor) =
      openCount? predecessor := by
  unfold openCount?
  rw [decode?_armed]
  cases decode? predecessor <;> rfl

@[simp]
theorem openCount?_openCell (bit : Bool) (predecessor audit : Term) :
    openCount? (openCell bit predecessor audit) =
      (openCount? predecessor).map (fun opens => opens + 1) := by
  unfold openCount?
  rw [decode?_openCell]
  cases decode? predecessor <;> rfl

@[simp]
theorem openCount?_closedCell (bit : Bool)
    (predecessor leftAudit rightAudit : Term) :
    openCount? (closedCell bit predecessor leftAudit rightAudit) =
      openCount? predecessor := by
  unfold openCount?
  rw [decode?_closedCell]

/-! ## Exact transaction effects -/

/-- Opening a decoded Armed cell deletes exactly its contributed bit. -/
theorem opening_deletes
    {predecessor : Term} {bits : List Bool} {opens : Nat} (bit : Bool)
    (inner : Decodes predecessor bits opens) :
    queue? (RootResetProgressRoles.Gadget.source bit predecessor) =
        some (bits ++ [bit]) ∧
      queue? (openCell bit predecessor predecessor) = some bits := by
  have hinner := decode?_complete inner
  have hqueue : queue? predecessor = some bits := by
    simp [queue?, hinner]
  constructor
  · rw [queue?_armed, hqueue]
    rfl
  · rw [queue?_openCell]
    exact hqueue

/-- Closing an Open cell preserves its already-deleted queue exactly. -/
theorem closing_preserves_queue (bit : Bool)
    (predecessor audit : Term) :
    queue? (openCell bit predecessor audit) =
      queue? (closedCell bit predecessor audit audit) := by
  simp

/-- Opening adds exactly one canonical Open; closing removes that Open. -/
theorem opening_closing_openCount
    {predecessor : Term} {bits : List Bool} {opens : Nat} (bit : Bool)
    (audit : Term) (inner : Decodes predecessor bits opens) :
    openCount? (openCell bit predecessor audit) = some (opens + 1) ∧
      openCount? (closedCell bit predecessor audit audit) = some opens := by
  have hinner := decode?_complete inner
  constructor <;> simp [openCount?, hinner]

/-- A decoded spine is clean exactly when its executable Open count is zero. -/
theorem clean_iff_openCount?_eq_zero (term : Term) :
    (∃ bits, Decodes term bits 0) ↔ openCount? term = some 0 := by
  constructor
  · rintro ⟨bits, h⟩
    simp [openCount?, decode?_complete h]
  · intro h
    unfold openCount? at h
    generalize hd : decode? term = decoded at h
    cases decoded with
    | none => simp at h
    | some view =>
        have hopen : view.openCount = 0 := by
          exact Option.some.inj h
        have grammar := decode?_sound hd
        exact ⟨view.bits, hopen ▸ grammar⟩

end PureSFormal.Research.RootResetProgressSpine
