import PureSFormal.Research.RootResetEulerWalker
import PureSFormal.Research.RootResetProgressSpine

/-!
# Bare accumulator-state classification

This module reconstructs the clean/open distinction of a registered progress
spine from the current bare term.  Its executable parser follows only the
registered predecessor edge.  Audit subtrees are bound as opaque fields and
are neither traversed nor compared.

Besides the logical queue, the parser returns every canonical Open address.
Consequently a singleton result supplies the exact CLOSE address, while an
empty result supplies the clean branch in which COMMIT may be considered by
the surrounding stage classifier.  More than one Open is rejected by the
transaction classifier.
-/

namespace PureSFormal.Research.RootResetAccumulatorClassifier

open PureSFormal.PureS
open RootResetProgressRoles

/-- Queue data and all canonical Open addresses in one registered spine. -/
structure View where
  bits : List Bool
  openAddresses : List Address
  deriving BEq, DecidableEq, Repr

/-- Prefix one root-relative path to a list of descendant addresses. -/
def prefixAddresses (path : Address) (addresses : List Address) : List Address :=
  addresses.map (path ++ ·)

/--
Executable independent-hole parser.  Only predecessor children recurse:
`R` for Armed and `LR` for Open/Closed.
-/
def analyze? : Term → Option View
  | .s => some ⟨[], []⟩
  | .app (.app (.app .s .s) constructor) predecessor =>
      match RootResetDeletionGadget.parseLiveConstructor? constructor with
      | none => none
      | some bit =>
          (analyze? predecessor).map fun inner =>
            ⟨inner.bits ++ [bit], prefixAddresses [.right] inner.openAddresses⟩
  | .app (.app .s predecessor)
      (.app (.app (.app .s .s) tag) _audit) =>
      match RootResetDeletionGadget.parseValueTag? tag with
      | none => none
      | some _bit =>
          (analyze? predecessor).map fun inner =>
            ⟨inner.bits,
              [.right] :: prefixAddresses [.left, .right] inner.openAddresses⟩
  | .app (.app .s predecessor)
      (.app (.app .s _leftAudit) (.app tag _rightAudit)) =>
      match RootResetDeletionGadget.parseValueTag? tag with
      | none => none
      | some _bit =>
          (analyze? predecessor).map fun inner =>
            ⟨inner.bits, prefixAddresses [.left, .right] inner.openAddresses⟩
  | _ => none
termination_by structural term => term

@[simp]
theorem analyze?_endpoint : analyze? (.s : Term) = some ⟨[], []⟩ :=
  rfl

@[simp]
theorem analyze?_armed (bit : Bool) (predecessor : Term) :
    analyze? (RootResetProgressRoles.Gadget.source bit predecessor) =
      (analyze? predecessor).map fun inner =>
        ⟨inner.bits ++ [bit], prefixAddresses [.right] inner.openAddresses⟩ := by
  cases bit <;>
    simp [analyze?, RootResetProgressRoles.Gadget.source,
      RootResetDeletionGadget.source, RootResetDeletionGadget.progressLive,
      live, b] <;>
    cases analyze? predecessor <;> rfl

@[simp]
theorem analyze?_openCell (bit : Bool) (predecessor audit : Term) :
    analyze? (openCell bit predecessor audit) =
      (analyze? predecessor).map fun inner =>
        ⟨inner.bits,
          [.right] :: prefixAddresses [.left, .right] inner.openAddresses⟩ := by
  cases bit <;> simp [analyze?, openCell, live, b] <;>
    cases analyze? predecessor <;> rfl

@[simp]
theorem analyze?_closedCell (bit : Bool) (predecessor leftAudit rightAudit : Term) :
    analyze? (closedCell bit predecessor leftAudit rightAudit) =
      (analyze? predecessor).map fun inner =>
        ⟨inner.bits, prefixAddresses [.left, .right] inner.openAddresses⟩ := by
  cases bit <;>
    simp [analyze?, closedCell,
      RootResetDeletionGadget.parseValueTag?] <;>
    cases analyze? predecessor <;> rfl

/-! ## Declarative grammar and parser adequacy -/

/-- The same registered spine, indexed by its queue and exact Open addresses. -/
inductive Tracks : Term → List Bool → List Address → Prop where
  | endpoint : Tracks .s [] []
  | armed {predecessor : Term} {bits : List Bool} {addresses : List Address}
      (bit : Bool) (inner : Tracks predecessor bits addresses) :
      Tracks (RootResetProgressRoles.Gadget.source bit predecessor)
        (bits ++ [bit]) (prefixAddresses [.right] addresses)
  | opened {predecessor : Term} {bits : List Bool} {addresses : List Address}
      (bit : Bool) (audit : Term) (inner : Tracks predecessor bits addresses) :
      Tracks (openCell bit predecessor audit) bits
        ([.right] :: prefixAddresses [.left, .right] addresses)
  | closed {predecessor : Term} {bits : List Bool} {addresses : List Address}
      (bit : Bool) (leftAudit rightAudit : Term)
      (inner : Tracks predecessor bits addresses) :
      Tracks (closedCell bit predecessor leftAudit rightAudit) bits
        (prefixAddresses [.left, .right] addresses)

/-- Every registered derivation is accepted with its exact result. -/
theorem analyze?_complete {term : Term} {bits : List Bool}
    {addresses : List Address} (shape : Tracks term bits addresses) :
    analyze? term = some ⟨bits, addresses⟩ := by
  induction shape with
  | endpoint => rfl
  | armed bit inner ih => simp [ih]
  | opened bit audit inner ih => simp [ih]
  | closed bit leftAudit rightAudit inner ih => simp [ih]

/-- Root soundness for a term once proper subterms already carry soundness. -/
private def SoundAt (term : Term) : Prop :=
  ∀ view : View, analyze? term = some view →
    Tracks term view.bits view.openAddresses

/-- Soundness evidence for every subtree of one finite term. -/
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

private theorem applicationSound {function argument : Term}
    (left : SoundTree function) (right : SoundTree argument) :
    SoundAt (.app function argument) := by
  intro view h
  unfold analyze? at h
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
      generalize hd : analyze? predecessor = parsed at h
      cases parsed with
      | none => simp at h
      | some inner =>
        simp only [Option.map] at h
        cases h
        have hconstructor :=
          RootResetDeletionGadget.parseLiveConstructor?_sound hp
        have result := Tracks.armed bit (right.root inner hd)
        simpa [RootResetProgressRoles.Gadget.source,
          RootResetDeletionGadget.source,
          RootResetDeletionGadget.progressLive, hconstructor] using! result
  next =>
    rename_i _ predecessor tag audit shape
    have functionShape := (Term.app.inj shape).1
    have argumentShape := (Term.app.inj shape).2
    subst function
    subst argument
    split at h
    next hp => simp at h
    next bit hp =>
      generalize hd : analyze? predecessor = parsed at h
      cases parsed with
      | none => simp at h
      | some inner =>
        simp only [Option.map] at h
        cases h
        have htag := RootResetDeletionGadget.parseValueTag?_sound hp
        have result := Tracks.opened bit audit
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
      generalize hd : analyze? predecessor = parsed at h
      cases parsed with
      | none => simp at h
      | some inner =>
        simp only [Option.map] at h
        cases h
        have htag := RootResetDeletionGadget.parseValueTag?_sound hp
        have result := Tracks.closed bit leftAudit rightAudit
          (left.rightRoot inner hd)
        simpa [closedCell, htag] using result
  next => cases h

private theorem soundTree : ∀ term : Term, SoundTree term
  | .s => .leaf (by
      intro view h
      cases h
      exact .endpoint)
  | .app function argument =>
      let left := soundTree function
      let right := soundTree argument
      .node (applicationSound left right) left right

/-- Every successful executable parse has a declarative derivation. -/
theorem analyze?_sound {term : Term} {view : View}
    (h : analyze? term = some view) :
    Tracks term view.bits view.openAddresses :=
  (soundTree term).root view h

/-- Executable and declarative accumulator grammars coincide. -/
theorem analyze?_eq_some_iff (term : Term) (bits : List Bool)
    (addresses : List Address) :
    analyze? term = some ⟨bits, addresses⟩ ↔
      Tracks term bits addresses :=
  ⟨analyze?_sound, analyze?_complete⟩

/-- A bare registered spine has one queue and one Open-address list. -/
theorem Tracks.deterministic
    {term : Term} {firstBits secondBits : List Bool}
    {firstAddresses secondAddresses : List Address}
    (first : Tracks term firstBits firstAddresses)
    (second : Tracks term secondBits secondAddresses) :
    firstBits = secondBits ∧ firstAddresses = secondAddresses := by
  have equality :
      (some ⟨firstBits, firstAddresses⟩ : Option View) =
        some ⟨secondBits, secondAddresses⟩ :=
    (analyze?_complete first).symm.trans (analyze?_complete second)
  have viewEquality : View.mk firstBits firstAddresses =
      View.mk secondBits secondAddresses := Option.some.inj equality
  exact ⟨congrArg View.bits viewEquality,
    congrArg View.openAddresses viewEquality⟩

/-! ## Verified CLOSE addresses -/

theorem exists_of_mem_map
    (function : α → β) {result : β} : ∀ {values : List α},
    result ∈ values.map function →
      ∃ value, value ∈ values ∧ function value = result
  | [], membership => by cases membership
  | first :: rest, membership => by
      change result ∈ function first :: rest.map function at membership
      cases membership with
      | head => exact ⟨first, List.Mem.head rest, rfl⟩
      | tail _ tailMembership =>
          obtain ⟨value, valueMembership, equality⟩ :=
            exists_of_mem_map function tailMembership
          exact ⟨value, List.Mem.tail first valueMembership, equality⟩

/-- Invert membership after prefixing every address in a list. -/
theorem exists_of_mem_prefixAddresses
    {path address : Address} {addresses : List Address}
    (member : address ∈ prefixAddresses path addresses) :
    ∃ inner, inner ∈ addresses ∧ path ++ inner = address := by
  unfold prefixAddresses at member
  exact exists_of_mem_map (fun inner : Address => path ++ inner) member

/-- Lift one exact address contraction through an Armed predecessor edge. -/
theorem contractAt?_armed_predecessor
    (bit : Bool) {predecessor target : Term} (address : Address)
    (contracts : predecessor.contractAt? address = some target) :
    (RootResetProgressRoles.Gadget.source bit predecessor).contractAt?
        (Direction.right :: address) =
      some (RootResetProgressRoles.Gadget.source bit target) := by
  simp only [RootResetProgressRoles.Gadget.source,
    RootResetDeletionGadget.source]
  rw [RootResetEulerWalker.contractAt?_app_right, contracts]
  rfl

/-- Lift one exact address contraction through an Open predecessor edge. -/
theorem contractAt?_open_predecessor
    (bit : Bool) {predecessor target : Term} (audit : Term)
    (address : Address)
    (contracts : predecessor.contractAt? address = some target) :
    (openCell bit predecessor audit).contractAt?
        (Direction.left :: Direction.right :: address) =
      some (openCell bit target audit) := by
  unfold openCell
  rw [RootResetEulerWalker.contractAt?_app_left,
    RootResetEulerWalker.contractAt?_app_right, contracts]
  rfl

/-- Lift one exact address contraction through a Closed predecessor edge. -/
theorem contractAt?_closed_predecessor
    (bit : Bool) {predecessor target : Term}
    (leftAudit rightAudit : Term) (address : Address)
    (contracts : predecessor.contractAt? address = some target) :
    (closedCell bit predecessor leftAudit rightAudit).contractAt?
        (Direction.left :: Direction.right :: address) =
      some (closedCell bit target leftAudit rightAudit) := by
  unfold closedCell
  rw [RootResetEulerWalker.contractAt?_app_left,
    RootResetEulerWalker.contractAt?_app_right, contracts]
  rfl

/-- Every listed Open address selects a genuine saturated pure-S redex. -/
theorem Tracks.openAddress_contracts
    {term : Term} {bits : List Bool} {addresses : List Address}
    (shape : Tracks term bits addresses) {address : Address}
    (member : address ∈ addresses) :
    ∃ target, term.contractAt? address = some target := by
  induction shape generalizing address with
  | endpoint => simp at member
  | @armed predecessor innerBits innerAddresses bit inner ih =>
      obtain ⟨innerAddress, innerMember, addressEq⟩ :=
        exists_of_mem_prefixAddresses member
      subst address
      obtain ⟨target, contracts⟩ := ih innerMember
      exact ⟨RootResetProgressRoles.Gadget.source bit target,
        contractAt?_armed_predecessor bit innerAddress contracts⟩
  | @opened predecessor innerBits innerAddresses bit audit inner ih =>
      simp only [List.mem_cons] at member
      rcases member with current | descendant
      · subst address
        exact ⟨closedCell bit predecessor audit audit,
          RootResetProgressRoles.contractAt?_openCell_right bit predecessor audit⟩
      · obtain ⟨innerAddress, innerMember, addressEq⟩ :=
          exists_of_mem_prefixAddresses descendant
        subst address
        obtain ⟨target, contracts⟩ := ih innerMember
        exact ⟨openCell bit target audit,
          contractAt?_open_predecessor bit audit innerAddress contracts⟩
  | @closed predecessor innerBits innerAddresses bit leftAudit rightAudit inner ih =>
      obtain ⟨innerAddress, innerMember, addressEq⟩ :=
        exists_of_mem_prefixAddresses member
      subst address
      obtain ⟨target, contracts⟩ := ih innerMember
      exact ⟨closedCell bit target leftAudit rightAudit,
        contractAt?_closed_predecessor bit leftAudit rightAudit innerAddress
          contracts⟩

/-- The transaction decision reconstructed from a bare accumulator. -/
inductive Stage where
  | clean
  | close (address : Address)
  deriving BEq, DecidableEq, Repr

/-- Accepted transaction view.  Multiple canonical Opens are malformed. -/
structure TransactionView where
  bits : List Bool
  stage : Stage
  deriving BEq, DecidableEq, Repr

/-- Empty Open list means clean; a singleton supplies the CLOSE address. -/
def classify? (term : Term) : Option TransactionView :=
  match analyze? term with
  | none => none
  | some view =>
      match view.openAddresses with
      | [] => some ⟨view.bits, .clean⟩
      | [address] => some ⟨view.bits, .close address⟩
      | _ => none

/-- Every successful transaction classification is uniquely term-determined. -/
theorem classify?_unique {term : Term} {first second : TransactionView}
    (hfirst : classify? term = some first)
    (hsecond : classify? term = some second) : first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/-- A CLOSE classification carries a verified saturated redex address. -/
theorem classify?_close_sound
    {term : Term} {bits : List Bool} {address : Address}
    (h : classify? term = some ⟨bits, .close address⟩) :
    ∃ target, term.contractAt? address = some target := by
  unfold classify? at h
  generalize analyzed : analyze? term = result at h
  cases result with
  | none => contradiction
  | some view =>
      cases openEq : view.openAddresses with
      | nil => simp [openEq] at h
      | cons first rest =>
          cases rest with
          | nil =>
              simp [openEq] at h
              rcases h with ⟨rfl, rfl⟩
              have shape := analyze?_sound analyzed
              exact shape.openAddress_contracts (by
                rw [openEq]
                exact List.Mem.head [])
          | cons second tail => simp [openEq] at h

/-- Clean and CLOSE results are disjoint by their recovered finite tag. -/
theorem clean_ne_close (bits firstBits : List Bool) (address : Address) :
    TransactionView.mk bits .clean ≠
      TransactionView.mk firstBits (.close address) := by
  intro h
  cases h

/-- Changing only an Open audit field cannot affect the queue or stage tag. -/
theorem open_audit_opaque
    (bit : Bool) (predecessor firstAudit secondAudit : Term) :
    classify? (openCell bit predecessor firstAudit) =
      classify? (openCell bit predecessor secondAudit) := by
  simp [classify?]

/-- Changing Closed audit fields cannot affect the queue or stage tag. -/
theorem closed_audits_opaque
    (bit : Bool) (predecessor firstLeft firstRight secondLeft secondRight : Term) :
    classify? (closedCell bit predecessor firstLeft firstRight) =
      classify? (closedCell bit predecessor secondLeft secondRight) := by
  simp [classify?]

end PureSFormal.Research.RootResetAccumulatorClassifier
